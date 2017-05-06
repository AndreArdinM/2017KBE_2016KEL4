DOMAINS
dr = symbol
spesialis=symbol
gejala = symbol
apa = string
jawab = char
masalah = symbol
kondisi = cond*
cond = string

FACTS
nama(kondisi)
false(cond)
search2(gejala)
failed2(gejala)

PREDICATES
nondeterm login
nondeterm mulai
nondeterm start				
nondeterm home
nondeterm jenis	
nondeterm thanks		
nondeterm next(char)
nondeterm pilih(char)
nondeterm gangguan(masalah)
nondeterm penyebab(masalah)						
nondeterm hasil(char)	
nondeterm hasil1(char)					
nondeterm gejala(gejala)
nondeterm diagnosa(masalah)
nondeterm penanganan(masalah)
nondeterm pencegahan(masalah)
nondeterm look(kondisi)
del
simpan(gejala,jawab)
tanya(apa,gejala,jawab)
go_once
search1(apa,gejala)
failed1(apa,gejala)
aa(char,char)
bb(char,char)



CLAUSES
	aa(Y,Y):-!.		
	aa(_,_):-fail.		

	bb(Y,Y):-!.		
	bb(_,_):-fail.		


	nama(["1. Ariska Monalisa			1515015090",		
		"2. Juniati Layuk            		1515015233",
		"3. Arif Rahman Hakim	        	1515015215",
		"4. Heriobein A.                 	                1515015219",
		"5. Andre Ardin Maulana		1515015224"]).
	
	look([H|T]):-
			not(false(H)),
			write(H),nl,
			look(T).
	
	look([H|_]):-
			assertz(false(H)).
			

	start:-
			write("\n==================================================================================================================\n"),nl,
			write("\t\t\t        SISTEM PENDUKUNG KEPUTUSAN JENIS GANGGUAN SEBUAH HUBUNGAN"),nl,
			write("\n=================================================================================================================="),nl,
			write("Anggota Kelompok	: "),nl,
			nama(Kelompok),
			look(Kelompok),
			login.
			
	login:-
			write("\n=================================================================================================================="),nl,
			write("Masukkan Nama Anda 	:  "),
			readln(Nama),
			write("Alamat 		  	:  "),
			readln(Alamat),
			write("\n==================================================== WELCOME ===================================================="),nl,
			write("Hi, ", Nama),nl,
			write("Bertempat tinggal di ", Alamat),nl,nl,
			write("Tekan 'Y' Untuk Memulai Program\n"),
			write("Tekan 'N' Jika Anda Tidak Kuat\n"),
	
			readchar(A), hasil(A).			
			hasil(A):-aa(A,'Y'), home.		
			hasil(A):-aa(A,'y'), home.		
			hasil(A):-aa(A,'N'), thanks.
			hasil(A):-aa(A,'n'), thanks.
			hasil(_):-login.			
	

      
	mulai:-
			go_once,nl,nl,nl,
        		write("Apakah Ingin mengulang lagi (Y/N) ?\n"),
        		readchar(A),hasil1(A).
			hasil1(A):-aa(A,'Y'), home.
			hasil1(A):-aa(A,'y'), home.	
			hasil1(A):-aa(A,'N'), thanks.
			hasil1(A):-aa(A,'n'), thanks.
        		hasil1(_):-mulai.
	
	
	go_once:-
           		diagnosa(_),!,
           		save("test.dat"),		
           		del.
            
	go_once:-
           		write("\n\n\HUBUNGAN ANDA TIDAK MEMILIKI GANGGUAN \nJika Anda Masih Merasa Aneh, Mungkin Hanya Masalah Kecil Yang Dapat Dengan Mudah Anda Tangani"),nl,
           		del.
            
	search1(_,Gejala):-
            		write("\nApakah "),
                        search2(Gejala),!.
            
	search1(Tanya,Gejala):-
                        not(failed2(Gejala)),
                        tanya(Tanya,Gejala,Jawab),
                        Jawab='y'.
            
	failed1(_,Gejala):-
                        failed2(Gejala),!.
            
	failed1(Tanya,Gejala):-
                        not(search2(Gejala)),
                        tanya(Tanya,Gejala,Jawab),
                        Jawab='n'.
            
	tanya(Tanya,Gejala,Jawab):-
                        write(Tanya),
                        readchar(Jawab),
                        write(Jawab),nl,
                        simpan(Gejala,Jawab).
            
	simpan(Gejala,'y'):-
                        asserta(search2(Gejala)).		
            
        simpan(Gejala,'n'):-
                        asserta(failed2(Gejala)).
            
        del:-
                        retract(search2(_)),fail.		
            
        del:-
                        retract(failed2(_)),
                        fail.
                        del.

	
	
	home:-	
			write("\n=================================================================================================================="),nl,
			write("\t\t\t\t\t\t      MENU UTAMA\n"),nl,
			write("1. Konsultasi Jenis Gangguan.\n"),
			write("2. Jenis Gangguan Hubungan.\n"),
			write("3. Keluar.\n"),
			write("Piihan (1-3): \n"),

			readchar(A), pilih(A).

			pilih(A):- aa(A,'1'),mulai.
			pilih(A):- aa(A,'2'),jenis.
			pilih(A):- aa(A,'3'),thanks.
			pilih(_):-home.
			
			

	jenis:-	
			write("\n=================================================================================================================="),nl,
			write("\t\t\t\t        JENIS - JENIS GANGGUAN SEBUAH HUBUNGAN\n"),nl,
			write("1. Orang Ketiga.\n"),
			write("2. Kurangnya Komunikasi.\n"),
			write("3. Egoisme Personality.\n"),
			write("4. Rasa Bosan Orang Yang Bersangkutan.\n"),
			write("5. Kurangnya Pengertian Antar Pasangan.\n\n"),
			write(" Tekan 'b' untuk kembali ke menu utama\n"),

			readchar(A), next(A).

			next(A):- bb(A,'B'),home.
			next(A):- bb(A,'b'),home.
			next(_):- jenis.



	
/* ============================================= GEJALA - GEJALA GANGGUAN SEBUAH HUBUNGAN ============================================= */

		gejala(Gejala):-    
                        search2(Gejala),!.
                        
            	gejala(Gejala):-
                        failed2(Gejala),!,fail.

            	gejala(tp):-
            		write("\n==================================================================================================================="),
                        search1(" Apakah Anda Merasa Pasangan Anda Mulai Menjauh (y/n) ?",tp),
                        search1(" Apakah Anda Merasa Pasangan Anda Dekat Dengan Orang Lain (y/n) ? ",tp1),
                        search1(" Kedekatannya Dengan Orang Lain Itu Tidaklah Wajar (y/n)? ",tp2),
                        search1(" Sering Asik Sendiri Saat Kalian Sedang Bersama (y/n)? ",tp3).

            	gejala(kk):-
            		write("\n==================================================================================================================="),
                        search1(" Kurang Bahan Obrolan Dengan Pasangan Anda (y/n)? ",kk),
                        search1(" Merasa Canggung Jika Bertemu (y/n)? ",kk1),
                        search1(" Anda Merasa Bahasa Anda Tidak Cocok Dengan Pasangan Anda (y/n)? ",kk2).
                              
            	gejala(ep):-
            		write("\n==================================================================================================================="),
                        search1(" Anda Ingin Dia Yang Memulai Pembicaraan (y/n)?",ep),
                        search1(" Melarang Suatu Hal Yang Anda Tidak Sukai Yang Pasangan Anda Lakukan (y/n)? ",ep1),
                        search1(" Sensitif Jika Anda Atau Pasangan Anda Bertanya Tentang Orang Lain Satu Sama Lain (y/n)? ",ep2).
                        
             	gejala(rboyb):-
             		write("\n==================================================================================================================="),
                        search1(" Anda Atau Pasangan Anda Sering Telat Membalas Pesan Satu Sama Lain (y/n)?",rboyb),
                        search1(" Banyak Kesibukan Yang Membuat Anda Tidak Berkomunikasi Dengan Pasangan Anda (y/n)? ",rboyb1),
                        search1(" Mulai Merasa Pecuma Berkomunikasi Satu Sama Lain (y/n)? ",rboyb2).
                        
             	gejala(kpap):-
             		write("\n==================================================================================================================="),
                        search1(" Sering Marah Saat Terjadi Kesalahan Sepele (y/n)?",kpap),
                        search1(" Tidak Terlalu Merasa Khawatir Jika Pasangan Mengalami Masalah (y/n)? ",kpap1),
                        search1(" Timbul Keraguan Yang Membuat Anda (y/n)? ",kpap2).


/* ============================================ DIAGNOSA GANGGUAN HUBUNGAN =========================================== */

diagnosa("Orang Ketiga"):-
		gejala(tp),
		gejala(tp1),
		gejala(tp2),
		gejala(tp3),
		gangguan("Orang Ketiga\n"),
		penyebab("\n 1. Kurang Pengalaman.\n 2. Pengaruh Lingkungan.\n"),
		penanganan("\n 1. Perbaikin Sikap Anda. \n 2. Tingkatkan Jumlah Pertemuan. \n 3. Berikan Perhatian Pada Pasangan Walau Sekecil Apapun. \n").
		
                        
diagnosa("Kurangnya Komunikasi"):-
		gejala(kk),
		gejala(kk1),
		gejala(kk2),
		gangguan("Kurangnya Komunikasi\n"),
		penyebab("\n 1. Rasa Malu dan Jual Mahal. \n 2. Kurang Percaya Diri.\n"),
		penanganan("\n 1. Cobalah Untuk Memulai Komunikasi Duluan. \n 2. Sisipkan Sedikit Candaan Saat Berkomunikasi. \n 3. Singkirkan Gengsi. \n").
            

diagnosa("Egoisme Personality"):-
		gejala(ep),
		gejala(ep1),
		gejala(ep2),
		gangguan("Egoisme Personality\n"),
		penyebab("\n 1. Sikap Acuh Tak Acuh. \n 2. Kepribadian Yang Bertolak Belakang. \n"),
		penanganan("\n 1. Sering Menasehati Satu Sama Lain. \n 2. Memaklumi Sifat Masing-masing. \n 3. Jangan Terlalu Memaksakan Kehendak. \n").
		

diagnosa("Rasa Bosan Orang Yang Bersangkutan"):-
		gejala(rboyb),
		gejala(rboyb1),
		gejala(rboyb2),
		gangguan("Rasa Bosan Orang Yang Bersangkutan\n"),
		penyebab("\n 1. Tidak Terlalu Peduli Dengan Hubungan.\n 2. Berpikir Orang Lain Jauh Lebih Asik.\n 3. Pesan Telat Dibalas.\n"),
		penanganan("\n 1. Cari Hal Baru Yang Bisa Dilakukan Bersama. \n 2. Saling Share Walaupun Hal Kecil. \n 3. Berusaha Semaksimal Mungkin Menjaga Hubungan. \n").


diagnosa("Kurangnya Pengertian Antar Pasangan"):-
		gejala(kpap),
		gejala(kpap1),
		gejala(kpap2),
		gangguan("Kurangnya Pengertian Antar Pasangan\n"),
		penyebab("\n 1. Sering Miss Comunication.\n 2. Kurang Peka Terhadap Pasangan.\n"),
		penanganan("\n 1. Lebih Perhatian. \n 2. Jangan Suka Meninggalkan Pasangan Tanpa Alasan Yang Jelas. \n 3. Selalu Pikirkan Kondisi Pasangan Anda. \n").

gangguan(Masalah):-
		write("\n==================================================================================================================="),
		write("\nGangguan Hubungan Yang Anda Alami : ",Masalah).


penyebab(Masalah):-
		write("\nPenyebab : ",Masalah).
	

penanganan(Masalah):-
		write("\nPenanganan : ",Masalah).
	

pencegahan(Masalah):-
		write("\nPencegahan : ",Masalah),
		write("\n===================================================================================================================").
	
thanks:-
   		write("\n==================================================================================================================="),
 		write("\n\t\t\t          TERIMA KASIH, ANDA TELAH MENGGUNAKAN PROGRAM KAMI\n"),
		write("\t\t\t\t\t  JAGA BAIK-BAIK PASANGAN ANDA\n"),
		write("\n===================================================================================================================\n").


GOAL
start.