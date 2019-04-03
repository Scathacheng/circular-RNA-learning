#0403
#写个脚本跑1里面的7个文件

#index
/opt/tools/seq-analysis/bwa-0.7.12/bwa index /zs32/home/jcdai/04circRNA/03database/hg19.fa

#cycle
for i in 2009077B 2009147-FB 2009149-FB 2009150-MB 2010001-M-41B 2010016-FB 2010052-M-70B; do 
#bwa
/opt/tools/seq-analysis/bwa-0.7.12/bwa mem -T 19 /zs32/home/jcdai/04circRNA/03database/hg19.fa /zs32_2/jiangyi/F17FTSCCWLJ1669_HUMkojN/Clean/1/${i}/merge_1.fq.gz /zs32_2/jiangyi/F17FTSCCWLJ1669_HUMkojN/Clean/1/${i}/merge_2.fq.gz > /zs32/home/jcdai/04circRNA/04BrainGVEX/01CIRI2/${i}.sam;
#CIRI2
perl /zs32/home/jcdai/04circRNA/01package/CIRI-full_v2.0/bin/CIRI2.pl -I /zs32/home/jcdai/04circRNA/04BrainGVEX/01CIRI2/${i}.sam -O /zs32/home/jcdai/04circRNA/04BrainGVEX/01CIRI2/${i}.ciri2 -A /zs32/data-analysis/liucy_group/llhuang/Reflib/gencode.v19.annotation.gtf -F /zs32/home/jcdai/04circRNA/03database/hg19.fa;
#CIRI-AS
perl /zs32/home/jcdai/04circRNA/01package/CIRI-full_v2.0/bin/CIRI_AS_v1.2.pl -S /zs32/home/jcdai/04circRNA/04BrainGVEX/01CIRI2/${i}.sam -C /zs32/home/jcdai/04circRNA/04BrainGVEX/01CIRI2/${i}.ciri2 -F /zs32/home/jcdai/04circRNA/03database/hg19.fa -A /zs32/data-analysis/liucy_group/llhuang/Reflib/gencode.v19.annotation.gtf -O ${i} -D yes;
#remove sam file
rm -f /zs32/home/jcdai/04circRNA/04BrainGVEX/01CIRI2/${i}.sam;
#CIRI-full
/opt/tools/java_v8/jre1.8.0_121/bin/java -jar /zs32/home/jcdai/04circRNA/01package/CIRI-full_v2.0/CIRI-full.jar Pipeline -1 /zs32_2/jiangyi/F17FTSCCWLJ1669_HUMkojN/Clean/1/${i}/merge_1.fq.gz -2 /zs32_2/jiangyi/F17FTSCCWLJ1669_HUMkojN/Clean/1/${i}/merge_2.fq.gz -r /zs32/home/jcdai/04circRNA/03database/hg19.fa -a /zs32/data-analysis/liucy_group/llhuang/Reflib/gencode.v19.annotation.gtf -d /zs32/home/jcdai/04circRNA/04BrainGVEX/01CIRI2/${i};
#remove sam file
rm -rf /zs32/home/jcdai/04circRNA/04BrainGVEX/01CIRI2/${i}/sam;
done
