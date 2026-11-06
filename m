Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964769;
	b=JXUKztsrCZASZFrpCHZxyX8wiD5eEVP3mWgtbd/xmk+TgCDl/7tMcieEewM1TB4C2n38
	 yOoCzuZSxEqpq9EYY74I/yFy3PNaHnoY0V9QFGf0ONQBleuFMwjuEkRUHNNCgGe2nhNeA
	 kKnsaP+O6Sv1KrdAOlHy86QAYUrzCfSwfEu/st7OZbJCX0RdIWmZ0zmXfGJ1L2VEo+8ro
	 vx3kdf5AxuIFDvLEDIQsSuNkRPL032UcdrOq9ktc0cnjRNmvVxFPgWdrrF1DVeqkBB9ZQ
	 ry3ZPodY9NIF6zUiDPDP0MXkb01sH1gEmZctz3gTGTmISB5osMDAOHTvh8KKW0rJQZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=lTzeddrlkJ6EM0T9eywUnBlh4s5kow/CLOIaopcE9eE=;
	b=GY1etCb3DsiWQKzHNt9c7RQwXUKGiiWgu2te0gsReB2NFth3Vjgjv1oRYedPPvqcl2ra
	 J5LGbG84wxe0BxFZdBL5LbZQwdq6aXi+31j00tDHH6T0SIxEPtPuGubMQ0LUL7FhV3hAD
	 p0PGd0LvkMMghCRZmnYUyJ+gHQyashSm2/LdmZ4mabEw7MV/BCITXEAnrRygme4keoeZb
	 SDT2CJbYacG4qU4QyRt9bMRmRaimIJ9aN2H4AwqwxrHS6WJqfW0lnoFnuSe5XLU3XNOm9
	 tGlmPoc5iu7/n7wNS1Lhxf3CPKT25oNepVUY56OMBc6GodIJNYBRUS8casYUFrhEpbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wpKfLtwm;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CA160A3811
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 11:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14CA160A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wpKfLtwm
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b0b6cae44aso106869a91.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 03:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964767; x=1794569567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lTzeddrlkJ6EM0T9eywUnBlh4s5kow/CLOIaopcE9eE=;
        b=wpKfLtwmD1vbvIshA84fOvWJm/lYdv0UuZAK8o9474B1rPpJQ5JHxvSenrfXzwwX+z
         u9ARBh92CU5w+RwHsRmMnhpbOl3zsgbN6QfmsPENsYI+xOM5+avE/i3DpqI/H+Oi06x3
         HUqCxB326OYn22+485QsiXMM3fl6TlsbWbgdoMMRWzRGN2EKHcDrU1BKvTwSTHs92yEp
         6/+5osRRjhLKkbXuq+V69MMu8p+3NYFKYXV6tl+Ee1HYsicqSVgAkrFJJSVtgp069spf
         izNIPxFtLWtD6r9va8cu3H7lsd0EdrvQGcHKOul5gjKm9KrtHCcGZxGxxEFdzprRNaOQ
         LAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964767; x=1794569567;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lTzeddrlkJ6EM0T9eywUnBlh4s5kow/CLOIaopcE9eE=;
        b=sJRt7SPCssSWEolGTrtehw+5osdYn+PcofSP8d6XhV+xVNOKnVFZ1JRA1GbZyEfXQl
         uUsjtucoEj8CpEjGPIxtwvLT22kfrfycwpdfIcbl1cfH9H+5BaLs4PUr6oOoXxYPERHm
         JNmwZt4a1bUuolgTOqDes3AknJ7AmmIrPogZeVGzaymJ/8gJUTOzZh9r/JdB7BBMR8XN
         qiyhnPA5IG81cbM+rRTZUBwEPDsABn1Q0cZBFZTobn6kigw0nUQ6Pm25NzmD9kH8aLHq
         1hJdy9Wz35u5rWg503179MS51IamAyYrJtfFPGQjceNRd3lomgRl2TvrBRpgFDT7Vnia
         y99g==
X-Forwarded-Encrypted: i=1; AL+hErGefEkHPpmqb3nr0hyToa5gJsESXtdnJsZpQMFTRIDjMzQoRXm4x205MaKv1jtW5SlVLrpeEY1sYpI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hzhyug6XTvm+a+lnOx3/Dd0YQgAGDUd9Of+lwRt6ZqR2Dft1w
	1pwK6q4frsVg5ZIiqOML/SyNd9r9ahFU88Jwf6jUIIDJ+NwiUAoqt1bv
X-Gm-Gg: AYBFou2+x+SQfuh5XVlf6mSFB9reDDAjAZyRvOMVmMlfTOdjp0KNei4MNItYrQVLHe4
	V13wqgbh3/xgvhVbRw9KfC4O2N2UN8RIOdzXJk8DaBeFw22KgYDUT34c+smstkXDVmM+5UatHGM
	MEl9Mag21LNeZ7ODw7hohjJJnRZ4fT47NfEFk7RnJcVTKu2rw4o+kqHW0fSzSMT0aPz3BluV61J
	G9zGbt8iY0npsR1mD/0rLFB2OMcMTZMF4dIS1J2wIgnA4Zb9oRtVxCNjjVYLS/W2vhHWqqy0qqZ
	m5hOmtWSlYA+iYff5gYVHCbSHFzJ1Q33LSw8/Gqlllrg+KKdnDlLCiDrQC2UYTy9IFAUHyWmsTp
	EmwOvD2Al5R8bMitcokcMkfXJplo5m7AGz0GDPS/xQP6qUXibBbk3a+4byn/KJUAge2VT8mKT1/
	CRt882bigSplWGK7uriq1fK6J27mbH0ckH+JU29u+3abcPPfF6hGL8+psROKpQ/9zZfm6uAc5mv
	SL9ujULr/ny0nHnw63Vn8bLSpalrzDwIyHThNCozcKtbIg0uw3UFkajQlmaY1q3ftDn8JNwJBEZ
	1ufRNv9g+qbeGMdd9B4XA/zMDXXWLf1O/ivbysCsp4FEuXz5Y53tLjhZhiolWTIfUCzzyyZcLjf
	bd7SpC/NFo+Ag6MdpPQx2r5gS
X-Received: by 2002:a17:90b:5705:b0:3ac:77a2:18b1 with SMTP id 98e67ed59e1d1-3b0db70b7ffmr3498989a91.5.1793964767056;
        Fri, 06 Nov 2026 03:32:47 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:32:46 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 17/25] docs/zh_TW: process: sync volatile-considered-harmful.rst with the English original
Date: Fri,  6 Nov 2026 19:31:32 +0800
Message-ID: <20261106113142.706783-18-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106113142.706783-1-chenyou910331@gmail.com>
References: <20261106113142.706783-1-chenyou910331@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The translation carries no "update to commit" marker.  A comparison
against the current English text shows every paragraph is present, but
the prose was converted from zh_CN and several sentences drifted from
the original:

- cpu_relax() "happens to serve as a compiler barrier", not a memory
  barrier
- the use of volatile "is likely to be seen as a bug" and will bring
  additional scrutiny, rather than simply being a bug
- I/O memory accesses are "always" done through accessor functions,
  and "busy-waiting is generally an anti-social act"
- render the "fixing it would be more trouble than it is worth" clause
  of the jiffies item and the "justification" required of patches
  removing volatile variables as in the original
- restore the emphasis on "within" in the critical section paragraph
- localize terminology (內核→核心, 代碼→程式碼, 內存→記憶體,
  寄存器→暫存器, 變量→變數, 訪問→存取, 優化→最佳化, 線程→執行緒,
  網絡適配器→網路卡, 爲→為, 裏→裡)
- use the same heading underline characters as the original, and put
  the references and credit lines in separate paragraphs so they no
  longer run together in the rendered output

update to commit 93431e0607e5 ("Replace HTTP links with HTTPS ones:
documentation")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../process/volatile-considered-harmful.rst   | 115 +++++++++---------
 1 file changed, 59 insertions(+), 56 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/volatile-considered-harmful.rst b/Documentation/translations/zh_TW/process/volatile-considered-harmful.rst
index edfc83f32672..6c54c9442524 100644
--- a/Documentation/translations/zh_TW/process/volatile-considered-harmful.rst
+++ b/Documentation/translations/zh_TW/process/volatile-considered-harmful.rst
@@ -7,92 +7,95 @@
 :Original: :ref:`Documentation/process/volatile-considered-harmful.rst
            <volatile_considered_harmful>`
 
-爲什麼不應該使用“volatile”類型
-==============================
+為什麼不應該使用“volatile”類型
+------------------------------
 
-C程序員通常認爲volatile表示某個變量可以在當前執行的線程之外被改變；因此，在內核
-中用到共享數據結構時，常常會有C程序員喜歡使用volatile這類變量。換句話說，他們經
-常會把volatile類型看成某種簡易的原子變量，當然它們不是。在內核中使用volatile幾
-乎總是錯誤的；本文檔將解釋爲什麼這樣。
+C程式設計師常認為volatile表示變數可能在目前的執行緒之外被改變；因此，在核心中
+使用共享資料結構時，他們有時會想用volatile。換句話說，他們常把volatile類型當成
+某種簡易的原子變數，但它並不是。在核心程式碼中使用volatile幾乎從來都不正確；
+本文件將說明原因。
 
-理解volatile的關鍵是知道它的目的是用來消除優化，實際上很少有人真正需要這樣的應
-用。在內核中，程序員必須防止意外的併發訪問破壞共享的數據結構，這其實是一個完全
-不同的任務。用來防止意外併發訪問的保護措施，可以更加高效的避免大多數優化相關的
-問題。
+理解volatile的關鍵在於：它的目的是抑制最佳化，而這幾乎從來不是我們真正想做的
+事。在核心中，必須保護共享資料結構免受不必要的並行存取，這是一個完全不同的任
+務。防範不必要並行的過程，也能以更有效率的方式避免幾乎所有與最佳化相關的問題。
 
-像volatile一樣，內核提供了很多原語來保證併發訪問時的數據安全（自旋鎖, 互斥量,內
-存屏障等等），同樣可以防止意外的優化。如果可以正確使用這些內核原語，那麼就沒有
-必要再使用volatile。如果仍然必須使用volatile，那麼幾乎可以肯定在代碼的某處有一
-個bug。在正確設計的內核代碼中，volatile能帶來的僅僅是使事情變慢。
+和volatile一樣，核心中讓資料並行存取變得安全的原語（自旋鎖、互斥鎖、記憶體屏障
+等）也是為了防止不必要的最佳化而設計的。如果正確使用了這些原語，就不需要再使用
+volatile。如果仍然需要volatile，那麼程式碼中幾乎肯定在某處有bug。在正確撰寫的
+核心程式碼中，volatile只會讓事情變慢。
 
-思考一下這段典型的內核代碼::
+思考一下這段典型的核心程式碼::
 
     spin_lock(&the_lock);
     do_something_on(&shared_data);
     do_something_else_with(&shared_data);
     spin_unlock(&the_lock);
 
-如果所有的代碼都遵循加鎖規則，當持有the_lock的時候，不可能意外的改變shared_data的
-值。任何可能訪問該數據的其他代碼都會在這個鎖上等待。自旋鎖原語跟內存屏障一樣—— 它
-們顯式的用來書寫成這樣 —— 意味着數據訪問不會跨越它們而被優化。所以本來編譯器認爲
-它知道在shared_data裏面將有什麼，但是因爲spin_lock()調用跟內存屏障一樣，會強制編
-譯器忘記它所知道的一切。那麼在訪問這些數據時不會有優化的問題。
+如果所有程式碼都遵循加鎖規則，那麼在持有the_lock期間，shared_data的值不可能意
+外改變。任何其他想要操作該資料的程式碼都會在這個鎖上等待。自旋鎖原語會充當記憶
+體屏障——它們是刻意這樣撰寫的——這表示資料存取不會被跨越它們而最佳化。所以編譯器
+可能自認為知道shared_data裡會是什麼，但由於spin_lock()呼叫充當記憶體屏障，會強
+制編譯器忘掉它所知道的一切。存取這些資料時不會有最佳化的問題。
 
-如果shared_data被聲名爲volatile，鎖操作將仍然是必須的。就算我們知道沒有其他人正在
-使用它，編譯器也將被阻止優化對臨界區內shared_data的訪問。在鎖有效的同時，
-shared_data不是volatile的。在處理共享數據的時候，適當的鎖操作可以不再需要
-volatile —— 並且是有潛在危害的。
+如果把shared_data宣告為volatile，加鎖仍然是必要的。但編譯器也會因此無法在臨界
+區 *內* 最佳化對shared_data的存取，而此時我們明知沒有其他人能操作它。在持有鎖期
+間，shared_data並不是volatile的。處理共享資料時，正確的加鎖讓volatile變得不必要
+——而且可能有害。
 
-volatile的存儲類型最初是爲那些內存映射的I/O寄存器而定義。在內核裏，寄存器訪問也應
-該被鎖保護，但是人們也不希望編譯器“優化”臨界區內的寄存器訪問。內核裏I/O的內存訪問
-是通過訪問函數完成的；不贊成通過指針對I/O內存的直接訪問，並且不是在所有體系架構上
-都能工作。那些訪問函數正是爲了防止意外優化而寫的，因此，再說一次，volatile類型不
-是必需的。
+volatile儲存類別原本是為記憶體映射的I/O暫存器而設計的。在核心中，暫存器存取同樣
+應該受鎖保護，但我們也不希望編譯器“最佳化”臨界區內的暫存器存取。不過在核心中，
+I/O記憶體存取一律透過存取函式完成；直接透過指標存取I/O記憶體是不被認可的做法，
+而且並非在所有架構上都能運作。這些存取函式就是為了防止不必要的最佳化而撰寫的，
+所以，再說一次，volatile是不必要的。
 
-另一種引起用戶可能使用volatile的情況是當處理器正忙着等待一個變量的值。正確執行一
-個忙等待的方法是::
+另一種可能讓人想使用volatile的情況，是處理器忙等（busy-wait）某個變數的值。執行
+忙等的正確方式是::
 
     while (my_variable != what_i_want)
         cpu_relax();
 
-cpu_relax()調用會降低CPU的能量消耗或者讓位於超線程雙處理器；它也作爲內存屏障一樣出
-現，所以，再一次，volatile不是必需的。當然，忙等待一開始就是一種反常規的做法。
+cpu_relax()呼叫可以降低CPU功耗，或讓位給超執行緒（hyperthreaded）的另一個邏輯處
+理器；它同時也剛好充當編譯器屏障，所以，再說一次，volatile是不必要的。當然，忙
+等本身通常就是一種不顧他人的行為。
 
-在內核中，一些稀少的情況下volatile仍然是有意義的：
+在核心中，仍有少數罕見的情況下使用volatile是合理的：
 
-  - 在一些體系架構的系統上，允許直接的I/0內存訪問，那麼前面提到的訪問函數可以使用
-    volatile。基本上，每一個訪問函數調用它自己都是一個小的臨界區域並且保證了按照
-    程序員期望的那樣發生訪問操作。
+  - 在確實支援直接存取I/O記憶體的架構上，上述存取函式可能會使用volatile。基本
+    上，每一次存取函式呼叫本身就成為一個小的臨界區，確保存取依照程式設計師預期
+    的方式發生。
 
-  - 某些會改變內存的內聯彙編代碼雖然沒有什麼其他明顯的附作用，但是有被GCC刪除的可
-    能性。在彙編聲明中加上volatile關鍵字可以防止這種刪除操作。
+  - 會修改記憶體、但沒有其他可見副作用的行內組合語言程式碼，有被GCC刪除的風險。
+    在asm敘述中加上volatile關鍵字可以防止這種刪除。
 
-  - Jiffies變量是一種特殊情況，雖然每次引用它的時候都可以有不同的值，但讀jiffies
-    變量時不需要任何特殊的加鎖保護。所以jiffies變量可以使用volatile，但是不贊成
-    其他跟jiffies相同類型變量使用volatile。Jiffies被認爲是一種“愚蠢的遺留物"
-    （Linus的話）因爲解決這個問題比保持現狀要麻煩的多。
+  - jiffies變數很特殊，每次引用它時都可能得到不同的值，但讀取它時不需要任何特殊
+    的加鎖。所以jiffies可以是volatile，但強烈不贊成再新增其他這類變數。在這方
+    面，jiffies被認為是一個“愚蠢的歷史遺留”問題（Linus的原話）；修正它的麻煩會
+    比它的價值還大。
 
-  - 由於某些I/0設備可能會修改連續一致的內存,所以有時,指向連續一致內存的數據結構
-    的指針需要正確的使用volatile。網絡適配器使用的環狀緩存區正是這類情形的一個例
-    子，其中適配器用改變指針來表示哪些描述符已經處理過了。
+  - 指向一致性記憶體（coherent memory）中、可能被I/O裝置修改的資料結構的指標，有
+    時可以正當地使用volatile。網路卡使用的環形緩衝區就是這類情況的一個例子，網路
+    卡會改變其中的指標，以表示哪些描述符已經處理完畢。
 
-對於大多代碼，上述幾種可以使用volatile的情況都不適用。所以，使用volatile是一種
-bug並且需要對這樣的代碼額外仔細檢查。那些試圖使用volatile的開發人員需要退一步想想
-他們真正想實現的是什麼。
+對大多數程式碼來說，上述使用volatile的理由都不適用。因此，使用volatile很可能被
+視為bug，並使程式碼受到額外的審查。想使用volatile的開發者應該退一步，想想自己真
+正想達成的是什麼。
 
-非常歡迎刪除volatile變量的補丁 － 只要證明這些補丁完整的考慮了併發問題。
+一般都歡迎移除volatile變數的補丁——只要附上能證明並行問題已經過周全考慮的理由。
 
-註釋
-----
+
+參考資料
+========
 
 [1] https://lwn.net/Articles/233481/
+
 [2] https://lwn.net/Articles/233482/
 
 致謝
-----
+====
+
+最初由Randy Dunlap推動並進行研究
 
-最初由Randy Dunlap推動並作初步研究
 由Jonathan Corbet撰寫
-參考Satyam Sharma，Johannes Stezenbach，Jesper Juhl，Heikki Orsila，
-H. Peter Anvin，Philipp Hahn和Stefan Richter的意見改善了本檔。
 
+感謝Satyam Sharma、Johannes Stezenbach、Jesper Juhl、Heikki Orsila、
+H. Peter Anvin、Philipp Hahn和Stefan Richter的意見讓本文件得以改進。
-- 
2.43.0

