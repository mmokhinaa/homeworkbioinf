#!/bin/bash
#SBATCH --job-name=fastqc_analysis   # Имя задания
#SBATCH --output=fastqc_analysis_%j.log   # Лог файл для вывода
#SBATCH --ntasks=1   # Количество задач
#SBATCH --cpus-per-task=4   # Количество CPU для каждой задачи
#SBATCH --mem=8G   # Объем памяти
#SBATCH --time=01:00:00   # Время работы (1 час)

# Загружаем модули, если они нужны
module load fastqc
module load multiqc

# Папка для выходных данных
output_dir="fastqc_results"
mkdir -p $output_dir

# Запуск FastQC для каждого файла
fastqc ERR14230537_Illumina_HiSeq_4000_sequencing.fastq.gz -o $output_dir
fastqc ERR14230586_Illumina_HiSeq_4000_sequencing.fastq.gz -o $output_dir
fastqc ERR14230595_Illumina_HiSeq_4000_sequencing.fastq.gz -o $output_dir
fastqc ERR14230552_Illumina_HiSeq_4000_sequencing.fastq.gz -o $output_dir

# Используем MultiQC для агрегации отчетов
multiqc $output_dir -o $output_dir

echo "FastQC and MultiQC analysis completed"
