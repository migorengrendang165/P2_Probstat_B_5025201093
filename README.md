# P2_Probstat_B_5025201093
Praktikum 2 Probabilitas dan Statistik 27-29 Mei 2022

# Nomor 1
Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap
kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel
sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat
kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut
diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali
kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden
mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴

![image](https://user-images.githubusercontent.com/79137636/170879920-e4701be5-4729-4e6e-965c-7997b062a540.png)

Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen dari
responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah
melakukan aktivitas 𝐴 sebanyak 70.
## a
Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel
diatas

```
x <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
y <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)
data_responden <- data.frame( 
  group = rep(c("sebelum", "sesudah"), each=9),
  saturation = c(x, y)
) 
print(data_responden)
z <- c(22, 20, 3, 13, 20, 18, 11, 16, 23)
sd_selisih <- sd(z)
sd_selisih
```

Pertama, masukkan data-data yang ada. Setelah itu, dapat dicek dahulu data-data yang sudah ada. Setelah itu, masukkan data selisih dari sebelum aktivitas A dengan sesudahnya. Setelah itu, dapat ditentukan standar deviasi selisih sebelum dan sesudah aktivitas A.

Hasil:

![image](https://user-images.githubusercontent.com/79137636/170880520-8170cb32-75a3-47b3-aab2-30680ce0423b.png)

Standar deviasinya adalah 6.359595.
## b
carilah nilai t (p-value)

```
t.test(x, y, alternative = "greater", var.equal = FALSE)
```

Untuk menentukan nilai t dapat menggunakan ```t.test```.

Hasil:

![image](https://user-images.githubusercontent.com/79137636/170880277-71fb60da-7eeb-4507-976e-535d150a5456.png)
## c
tentukanlah apakah terdapat pengaruh yang signifikan secara statistika
dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan
aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada
pengaruh yang signifikan secara statistika dalam hal kadar saturasi
oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”

```
var.test(x, y)
t.test(x, y, mu = 0, alternative = "two.sided", var.equal = TRUE) 
```

Hasil:

![image](https://user-images.githubusercontent.com/79137636/170880688-afa2621b-31a6-40d5-9082-789c4f7533ad.png)

Mean dan confidence sama dengan 1b, yang berbeda adalah p-value dan df. Sehingga tidak memiliki pengaruh yang signifikan secara statistika.
# Nomor 2
Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun.
Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk
mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata
23.500 kilometer dan standar deviasi 3900 kilometer. (Kerjakan menggunakan library seperti referensi pada modul).

```
install.packages("BSDA")
```

Install library yang diperlukan.

```
library(BSDA)
```

Gunakan library yang diperlukan.
## a
Apakah Anda setuju dengan klaim tersebut?

```
zsum.test(
  mean.x = 23500, 
  sigma.x = 3900,
  n.x = 100, 
  alternative = "greater", 
  mu = 20000, 
  conf.level = 0.95
)
```

Hasil:

![image](https://user-images.githubusercontent.com/79137636/170880898-a8a8ffcc-7142-4b39-b2c8-4a611d8fe462.png)

Dari hasil di atas, didapatkan mean sebenarnya di atas 20000. Kesimpulannya, setuju dengan klaim tersebut.
## b
Jelaskan maksud dari output yang dihasilkan!

```
tsum.test(
  mean.x = 23500, 
  s.x = 3900, 
  n.x = 100
)
```

Diketahui n = 100, rata-rata (X̄) = 23500, dan standar deviasi(σ) = 3900. H0 = 20000, H1 > 20000.
Hasil:

![image](https://user-images.githubusercontent.com/79137636/170881190-baff28bc-76db-4714-bcdf-8665f8dd7da8.png)
## c
Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!

Dari 2a, z = 8.97:

P(Z > 8.97) = 1 - P(Z < 8.97) = 1 - 1 = 0

Kesimpulannya, mobil dikendarai lebih dari 20000 kilometer per tahun. Sehingga, H0 ditolak dan H1 diterima.
# 3
Diketahui perusahaan memiliki seorang data analyst ingin memecahkan
permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya
didapatkanlah data berikut dari perusahaan saham tersebut.

![image](https://user-images.githubusercontent.com/79137636/170881491-d1ad04a2-c04b-4e3c-9023-1300c22c4a58.png)

Dari data diatas berilah keputusan serta kesimpulan yang didapatkan dari hasil
diatas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada
rata-ratanya (α= 0.05)? Buatlah :
## a
H0 dan H1.

![image](https://user-images.githubusercontent.com/79137636/170881537-ca60b909-f99c-4d81-ad19-00210d023c6d.png)

H0 = 9.50.

![image](https://user-images.githubusercontent.com/79137636/170881583-c0c5f1af-509e-4001-9449-ccfea9f96dee.png)

H1 = 10.98.
## b
Hitung Sampel Statistik

```
tsum.test(
  mean.x = 3.64,
  s.x = 1.67,
  n.x = 19,
  mean.y = 2.79,
  s.y = 1.32,
  n.y = 27,
  alternative = "greater",
  var.equal = TRUE
)
```

Hasil:

![image](https://user-images.githubusercontent.com/79137636/170881666-e96207ca-af01-48d7-98df-0e0a4e22c1f2.png)

## c
Lakukan Uji Statistik (df =2)

```
install.packages("mosaic")
library(mosaic)
plotDist(dist = 't', df = 2, col = "blue")
```

Hasil:

![image](https://user-images.githubusercontent.com/79137636/170881847-a501aca5-a9bc-4089-a346-c4d7722b0d3a.png)

## d
Nilai kritikal

```
qchisq(p = 0.05, df = 2, lower.tail = FALSE)
```

Hasil:

![image](https://user-images.githubusercontent.com/79137636/170882060-3aca26a3-2c4e-4f20-b7d1-11e1cb42707d.png)

Nilai kritikalnya adalah 5.991465.
## e
Keputusan

Keputusan dapat didapatkan dengan teori keputusan. Teori keputusan adalah teori formal pengambilan keputusan di bawah ketidakpastian. Aksinya adalah : ```({a}_{a∈A})```. Kemungkinan konsekuensi : ```({c}_{c∈C})``` (tergantung pada keadaan dan tindakan). Maka, keputusan dapat dibuat dengan menggunakan fungsi ```t.test```.
## f
Kesimpulan

Kesimpulannya adalah perbedaan rata-rata yang terjadi tidak ada jika dilihat dari uji statistik dan akan ada tetapi tidak signifikan jika dipengaruhi nilai kritikal.

# Nomor 4
Seorang Peneliti sedang meneliti spesies dari kucing di ITS . Dalam penelitiannya
ia mengumpulkan data tiga spesies kucing yaitu kucing oren, kucing hitam dan
kucing putih dengan panjangnya masing-masing.
Jika :
diketahui dataset https://intip.in/datasetprobstat1
H0 : Tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya
sama
Maka Kerjakan atau Carilah:
## a
Buatlah masing masing jenis spesies menjadi 3 subjek "Grup" (grup 1,grup
2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan
lihat apakah ada outlier utama dalam homogenitas varians.

```
dataset_kucing <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"))
dataset_kucing <- read.table("onewayanova.txt",h=T)
dim(dataset_kucing)
head(dataset_kucing)
names(dataset_kucing)
dataset_kucing$Group <- as.factor(dataset_kucing$Group)
dataset_kucing$Group = factor(dataset_kucing$Group,labels = c("kucing oren", "kucing hitam", "kucing putih"))
class(dataset_kucing$Group)
grup1 <- subset(dataset_kucing, Group == "kucing oren")
grup2 <- subset(dataset_kucing, Group == "kucing hitam")
grup3 <- subset(dataset_kucing, Group == "kucing putih")
```

Hasil:

![image](https://user-images.githubusercontent.com/79137636/170882350-f3e29977-55c4-4bd8-a7d8-7d5a48841117.png)
