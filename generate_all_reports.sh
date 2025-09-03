#!/bin/bash
# Script para gerar relatórios de métricas para todos os arquivos Java

echo "=== GERAÇÃO DE RELATÓRIOS DE MÉTRICAS ==="
echo "Data: $(date)"
echo

# Diretório com arquivos Java
JAVA_DIR="Student portal/src"
REPORT_DIR="metricas_reports"

# Criar diretório para relatórios
mkdir -p "$REPORT_DIR"

echo "📁 Analisando arquivos em: $JAVA_DIR"
echo "📊 Relatórios serão salvos em: $REPORT_DIR"
echo

# Contar arquivos Java
JAVA_COUNT=$(find "$JAVA_DIR" -name "*.java" | wc -l)
echo "🔍 Encontrados $JAVA_COUNT arquivos Java"
echo

# Listar arquivos que serão analisados
echo "📋 Arquivos a serem analisados:"
find "$JAVA_DIR" -name "*.java" -exec basename {} \; | sort
echo

# Gerar relatório consolidado com cloc
echo "📈 Gerando relatório consolidado com cloc..."
cloc "$JAVA_DIR" > "$REPORT_DIR/cloc_report.txt"
echo "✅ Relatório cloc salvo em: $REPORT_DIR/cloc_report.txt"

# Gerar relatório detalhado com nosso script Python
echo "🐍 Executando análise Python personalizada..."
python3 analyze_metrics.py > "$REPORT_DIR/python_metrics_report.txt"
echo "✅ Relatório Python salvo em: $REPORT_DIR/python_metrics_report.txt"

# Gerar análise individual por arquivo
echo "📄 Analisando arquivos individuais..."
counter=1
for java_file in "$JAVA_DIR"/*.java; do
    if [ -f "$java_file" ]; then
        filename=$(basename "$java_file" .java)
        echo "[$counter/$JAVA_COUNT] Analisando: $filename.java"
        
        # Análise básica do arquivo
        echo "=== ANÁLISE DE $filename.java ===" > "$REPORT_DIR/${filename}_analysis.txt"
        echo "Data: $(date)" >> "$REPORT_DIR/${filename}_analysis.txt"
        echo "Arquivo: $java_file" >> "$REPORT_DIR/${filename}_analysis.txt"
        echo >> "$REPORT_DIR/${filename}_analysis.txt"
        
        # Estatísticas básicas
        echo "--- ESTATÍSTICAS BÁSICAS ---" >> "$REPORT_DIR/${filename}_analysis.txt"
        wc -l "$java_file" | awk '{print "Total de linhas: " $1}' >> "$REPORT_DIR/${filename}_analysis.txt"
        grep -c "class\|interface" "$java_file" | awk '{print "Classes/Interfaces: " $1}' >> "$REPORT_DIR/${filename}_analysis.txt"
        grep -c "public\|private\|protected.*(" "$java_file" | awk '{print "Métodos (aprox): " $1}' >> "$REPORT_DIR/${filename}_analysis.txt"
        grep -c "if\|while\|for\|switch" "$java_file" | awk '{print "Estruturas de controle: " $1}' >> "$REPORT_DIR/${filename}_analysis.txt"
        echo >> "$REPORT_DIR/${filename}_analysis.txt"
        
        # Análise de complexidade
        echo "--- INDICADORES DE COMPLEXIDADE ---" >> "$REPORT_DIR/${filename}_analysis.txt"
        grep -n "if\|while\|for\|switch\|case\|catch" "$java_file" >> "$REPORT_DIR/${filename}_analysis.txt"
        echo >> "$REPORT_DIR/${filename}_analysis.txt"
        
        ((counter++))
    fi
done

# Gerar relatório consolidado final
echo "📋 Gerando relatório consolidado final..."
cat > "$REPORT_DIR/RELATORIO_CONSOLIDADO.md" << EOF
# RELATÓRIO CONSOLIDADO DE MÉTRICAS DE CÓDIGO

**Data da Análise:** $(date)  
**Projeto:** Student Management System  
**Total de arquivos analisados:** $JAVA_COUNT

## Arquivos de Relatório Gerados

1. **cloc_report.txt** - Contagem detalhada de linhas de código
2. **python_metrics_report.txt** - Análise de complexidade ciclomática
3. **[arquivo]_analysis.txt** - Análise individual por arquivo

## Resumo Executivo

$(head -n 20 "$REPORT_DIR/python_metrics_report.txt")

## Arquivos Analisados

$(find "$JAVA_DIR" -name "*.java" -exec basename {} \; | sort | nl)

---
*Relatório gerado automaticamente em $(date)*
EOF

echo "✅ Relatório consolidado salvo em: $REPORT_DIR/RELATORIO_CONSOLIDADO.md"
echo
echo "🎉 ANÁLISE COMPLETA!"
echo "📁 Todos os relatórios estão disponíveis em: $REPORT_DIR/"
echo
echo "📋 Relatórios gerados:"
ls -la "$REPORT_DIR/"
