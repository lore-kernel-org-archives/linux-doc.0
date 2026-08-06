Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A786048B37E
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 18:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040432; cv=none; b=YTFXx7ovx1eghgApnvIJaKiUYHn/Iw4r5EKJOkT6eLE8Tu6RkE0R58hjBynQnPlxysa5WfmbEyjp9zaQlqxgREu4uBIbx14LdajwtLt61iL92gpPxAClAr6nGp7yyMP3DM1m/jkTIbf5twIYYOH9o5948vq0E+nmzDOXJaLlKfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040432; c=relaxed/simple;
	bh=Gvx7mPJxJGsczicZ/jeWm1DAJc7Z07B1KGxEb9R5r4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oTqQ6JzGg4GzPeVJ0dB0VQMM6bkUO3PPH4esuScx7odQfa8eXd2gBz2MgDjWjWDXZFTGkqsobr73dGjB0QZRrlP8vif+QRNIpCq7+iKJaY8yz2uyCD3NshpM+epjcCMf2oAfNJdTUhz6+fum0zAo9oEVKeEAzcQY9n5lmPW0xxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uai/s1a+; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uai/s1a+"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38fe113c792so340265a91.3
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 11:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786040428; x=1786645228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=74J/nQePHmYHppaHi06DmfiZ5cdOug/1PrKV3jCW2Vs=;
        b=Uai/s1a+Upqr69Fm1hacnlGAhunWtro/uBrQqev7aUAWDJe1DvZWGOHK6bpzFgesVN
         kvNv4+oJr02OC7FSVMHaLdthSWPZ1S8DBymjDn1w2/9sdgpIFzVJTUUqcAeyrnarR4R0
         7DZ+GocKUb9JoZX65sZa3M4gbizup8lI+0M1MymTfL7GlLvhsmkVG804qD3dfxNtRJBY
         ZmtAi4z09ErOL9QLxJXctQ/TkS2cSyOZPmw41pWfNzP7cl/vL02gCWWSDKJfsShI3oo7
         x5aekGuzrGEABbsuk7gxdueZyTvI3xpQl79idrrIs9U2nhzUc+vk+IgoZnnstCouxjSA
         NQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786040428; x=1786645228;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74J/nQePHmYHppaHi06DmfiZ5cdOug/1PrKV3jCW2Vs=;
        b=NS2G3cViubZjZbhSXy552T3CkvNetNiQdiI+Dt1+JTv2RR9SLxNBH976tvZG+pjB/p
         R+uN/2exLCu8k+Nnfb/oTJnOy+03kA6N2/twPXetbxwTrog9qcGlNBJQr1iqwHfKlim9
         GhRodgKXtasTlINmtHp4ZEBxMGxDIUK7Od6sOO4nUoaepudlsczj9keGCFWkSZl+XA1i
         lPRdlsH4H+Ma3bxiEzvy2b5gSqIDOvmjB5w0YsargMKZy2gTnNoy7yoj6pBzXkvB8YY/
         usrzbQTpKHpPdJT+ZswuGCexHBW2eUCi4Anpj731lVccncwIDEZESxwA+HxvsWuPJ8qQ
         OLCg==
X-Forwarded-Encrypted: i=1; AHgh+RpYGmAcaT3gTjNbfWwEf8Tlp8SdtFrPlWooJ7U6GwN5P6frtMBXUw6ccy/G0J/BLt52VHMajpaZStY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBEtmO/WuuFvC9BHvNAGZtYuYV2X3+iSWM2gj4yPnxO7/GTaz8
	kSeB+cxLrQ8p4kKyyp/rj8M+LKUh3tdFjLnH97SxH5sc9dcTYQbYQtE6
X-Gm-Gg: AR+sD12COQ27XGbuRuwsqVtSsd0mJbi90/HWg6x6JkBf4wLhcSlUMeiQyi21x0YWamR
	Hq6lFi6W3fB+GiCiBZfltebm+o/1ZkUC3eJzwHxBPfjT67jIjJcZzoB3LxknDz+1NK0tTAaQX/7
	cSL7ppQ3Or6JVWPn51QKWhGohxz+skCRQL6LBIRbNLxZHZpdjNMaRCIiCX+kgKryLeLh2OhMxtf
	2JIWpsrE7qSwx5Em5hz+p2rW3lQqYcw5rgqtzLC+ScD+Wz9zS17h+RECAVho1RCWWOrHNWhbmSQ
	EKA+okIF6hEpmw++OtprkkAdcGc65Nc62AdkTDJIGLYOyyAlqy49IxNcsBOpdkEGQw0mRUQhQCT
	e1PW8MoQf0IQ3c7Wz91fZQTrIOUGr+R3ZldBOYZhh3GYoWvB5TQJJ1Xj61b5TEtynOE1j9HtJWY
	Xch/A5PnSPI5hd2gvPiRydshOEl/SB7exMKrUuPBQhkBP8lbpn06R0tXDId4h1W4xzexjYP7um+
	NNXiQxL3XjX6XsnBSseWwRD06kn0NvqU+9gCSjkhzpnVvEg9MfDYiiqXnL4SPham05lsaDiA4Zo
	/1bwWbqi0ATgQtrgOsuhMyb2TGFUq9fHRw==
X-Received: by 2002:a17:90b:278e:b0:38e:76f8:fcbb with SMTP id 98e67ed59e1d1-3903c721be4mr12336870a91.4.1786040426752;
        Thu, 06 Aug 2026 11:20:26 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085f2b2easm2003356a91.11.2026.08.06.11.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 11:20:26 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>
Cc: Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	Weijie Yuan <wy@wyuan.org>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v3 07/16] docs/zh_TW: process: localize terminology in coding-style.rst
Date: Fri,  7 Aug 2026 02:19:40 +0800
Message-ID: <20260806181949.65648-8-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806181949.65648-1-chenyou910331@gmail.com>
References: <20260806181949.65648-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Localize mainland terms to Taiwanese Mandarin (內核→核心, 函數→函式,
宏→巨集, 枚舉→列舉, 聲明→宣告, 寄存器→暫存器, ...) and sync with the
English original: update the memory allocator list and array
allocation examples to the type-aware kmalloc_objs()/kzalloc_objs()
forms.

update to commit 323fa4b9608b ("Documentation: Fix syntax of
kmalloc_objs example in coding style doc")

Reviewed-by: Weijie Yuan <wy@wyuan.org>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/coding-style.rst            | 614 +++++++++---------
 1 file changed, 311 insertions(+), 303 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/coding-style.rst b/Documentation/translations/zh_TW/process/coding-style.rst
index 63c78982a1af..ef7a4cdbff37 100644
--- a/Documentation/translations/zh_TW/process/coding-style.rst
+++ b/Documentation/translations/zh_TW/process/coding-style.rst
@@ -18,39 +18,40 @@
  - Li Zefan <lizf@cn.fujitsu.com>
  - Wang Chen <wangchen@cn.fujitsu.com>
  - Hu Haowen <2023002089@link.tyut.edu.cn>
+ - 葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
 
-Linux 內核代碼風格
-==================
+Linux 核心程式碼風格
+====================
 
-這是一個簡短的文檔，描述了 linux 內核的首選代碼風格。代碼風格是因人而異的，
-而且我不願意把自己的觀點強加給任何人，但這就像我去做任何事情都必須遵循的原則
-那樣，我也希望在絕大多數事上保持這種的態度。請 (在寫代碼時) 至少考慮一下這裏
-的代碼風格。
+這是一個簡短的文件，描述了 linux 核心的首選程式碼風格。程式碼風格是因人而
+異的，而且我不願意把自己的觀點強加給任何人，但這就像我去做任何事情都必須遵
+循的原則那樣，我也希望在絕大多數事上保持這種的態度。請 (在寫程式碼時) 至少
+考慮一下這裡的程式碼風格。
 
-首先，我建議你打印一份 GNU 代碼規範，然後不要讀。燒了它，這是一個具有重大象徵
-性意義的動作。
+首先，我建議你列印一份 GNU 程式碼規範，然後不要讀。燒了它，這是一個具有重
+大象徵性意義的動作。
 
 不管怎樣，現在我們開始：
 
 
-1) 縮進
+1) 縮排
 -------
 
-製表符是 8 個字符，所以縮進也是 8 個字符。有些異端運動試圖將縮進變爲 4 (甚至
-2！) 字符深，這幾乎相當於嘗試將圓周率的值定義爲 3。
+製表符是 8 個字元，所以縮排也是 8 個字元。有些異端運動試圖將縮排變為 4 (甚至
+2！) 字元深，這幾乎相當於嘗試將圓周率的值定義為 3。
 
-理由：縮進的全部意義就在於清楚的定義一個控制塊起止於何處。尤其是當你盯着你的
-屏幕連續看了 20 小時之後，你將會發現大一點的縮進會使你更容易分辨縮進。
+理由：縮排的全部意義就在於清楚的定義一個控制塊起止於何處。尤其是當你盯著你的
+屏幕連續看了 20 小時之後，你將會發現大一點的縮排會使你更容易分辨縮排。
 
-現在，有些人會抱怨 8 個字符的縮進會使代碼向右邊移動的太遠，在 80 個字符的終端
-屏幕上就很難讀這樣的代碼。這個問題的答案是，如果你需要 3 級以上的縮進，不管用
-何種方式你的代碼已經有問題了，應該修正你的程序。
+現在，有些人會抱怨 8 個字元的縮排會使程式碼向右邊移動的太遠，在 80 個字元
+的終端屏幕上就很難讀這樣的程式碼。這個問題的答案是，如果你需要 3 級以上的
+縮排，不管用何種方式你的程式碼已經有問題了，應該修正你的程式。
 
-簡而言之，8 個字符的縮進可以讓代碼更容易閱讀，還有一個好處是當你的函數嵌套太
+簡而言之，8 個字元的縮排可以讓程式碼更容易閱讀，還有一個好處是當你的函式嵌套太
 深的時候可以給你警告。留心這個警告。
 
-在 switch 語句中消除多級縮進的首選的方式是讓 ``switch`` 和從屬於它的 ``case``
-標籤對齊於同一列，而不要 ``兩次縮進`` ``case`` 標籤。比如：
+在 switch 語句中消除多級縮排的首選的方式是讓 ``switch`` 和從屬於它的 ``case``
+標籤對齊於同一列，而不要 ``兩次縮排`` ``case`` 標籤。比如：
 
 .. code-block:: c
 
@@ -71,7 +72,7 @@ Linux 內核代碼風格
 		break;
 	}
 
-不要把多個語句放在一行裏，除非你有什麼東西要隱藏：
+不要把多個語句放在一行裡，除非你有什麼東西要隱藏：
 
 .. code-block:: c
 
@@ -94,37 +95,38 @@ Linux 內核代碼風格
 		do_that();
 	}
 
-也不要在一行裏放多個賦值語句。內核代碼風格超級簡單。就是避免可能導致別人誤讀
+也不要在一行裡放多個賦值語句。核心程式碼風格超級簡單。就是避免可能導致別人誤讀
 的表達式。
 
-除了註釋、文檔和 Kconfig 之外，不要使用空格來縮進，前面的例子是例外，是有意爲
+除了註解、文件和 Kconfig 之外，不要使用空格來縮排，前面的例子是例外，是有意為
 之。
 
 選用一個好的編輯器，不要在行尾留空格。
 
 
-2) 把長的行和字符串打散
+2) 把長的行和字串打散
 -----------------------
 
-代碼風格的意義就在於使用平常使用的工具來維持代碼的可讀性和可維護性。
+程式碼風格的意義就在於使用平常使用的工具來維持程式碼的可讀性和可維護性。
 
 每一行的長度的限制是 80 列，我們強烈建議您遵守這個慣例。
 
 長於 80 列的語句要打散成有意義的片段。除非超過 80 列能顯著增加可讀性，並且不
-會隱藏信息。
+會隱藏資訊。
 
-子片段要明顯短於母片段，並明顯靠右。一種非常常用的樣式是將子體與函數左括號對齊。
+子片段要明顯短於母片段，並明顯靠右。一種非常常用的樣式是將子體與函式左括號
+對齊。
 
-這同樣適用於有着很長參數列表的函數頭。
+這同樣適用於有著很長參數列表的函式頭。
 
-然而，絕對不要打散對用戶可見的字符串，例如 printk 信息，因爲這樣就
+然而，絕對不要打散對使用者可見的字串，例如 printk 資訊，因為這樣就
 很難對它們 grep。
 
 
 3) 大括號和空格的放置
 ---------------------
 
-C 語言風格中另外一個常見問題是大括號的放置。和縮進大小不同，選擇或棄用某種放
+C 語言風格中另外一個常見問題是大括號的放置。和縮排大小不同，選擇或棄用某種放
 置策略並沒有多少技術上的原因，不過首選的方式，就像 Kernighan 和 Ritchie 展示
 給我們的，是把起始大括號放在行尾，而把結束大括號放在行首，所以：
 
@@ -134,7 +136,7 @@ C 語言風格中另外一個常見問題是大括號的放置。和縮進大小
 		we do y
 	}
 
-這適用於所有的非函數語句塊 (if, switch, for, while, do)。比如：
+這適用於所有的非函式語句塊 (if, switch, for, while, do)。比如：
 
 .. code-block:: c
 
@@ -149,7 +151,7 @@ C 語言風格中另外一個常見問題是大括號的放置。和縮進大小
 		return NULL;
 	}
 
-不過，有一個例外，那就是函數：函數的起始大括號放置於下一行的開頭，所以：
+不過，有一個例外，那就是函式：函式的起始大括號放置於下一行的開頭，所以：
 
 .. code-block:: c
 
@@ -159,10 +161,10 @@ C 語言風格中另外一個常見問題是大括號的放置。和縮進大小
 	}
 
 全世界的異端可能會抱怨這個不一致性是……呃……不一致，不過所有思維健全的人
-都知道 (a) K&R 是 **正確的** 並且 (b) K&R 是正確的。此外，不管怎樣函數都是特
-殊的 (C 函數是不能嵌套的)。
+都知道 (a) K&R 是 **正確的** 並且 (b) K&R 是正確的。此外，不管怎樣函式都是特
+殊的 (C 函式是不能嵌套的)。
 
-注意結束大括號獨自佔據一行，除非它後面跟着同一個語句的剩餘部分，也就是 do 語
+注意結束大括號獨自佔據一行，除非它後面跟著同一個語句的剩餘部分，也就是 do 語
 句中的 ``while`` 或者 if 語句中的 ``else`` ，像這樣：
 
 .. code-block:: c
@@ -187,7 +189,7 @@ C 語言風格中另外一個常見問題是大括號的放置。和縮進大小
 
 也請注意這種大括號的放置方式也能使空 (或者差不多空的) 行的數量最小化，同時不
 失可讀性。因此，由於你的屏幕上的新行是不可再生資源 (想想 25 行的終端屏幕)，你
-將會有更多的空行來放置註釋。
+將會有更多的空行來放置註解。
 
 當只有一個單獨的語句的時候，不用加不必要的大括號。
 
@@ -219,10 +221,10 @@ C 語言風格中另外一個常見問題是大括號的放置。和縮進大小
 3.1) 空格
 *********
 
-Linux 內核的空格使用方式 (主要) 取決於它是用於函數還是關鍵字。(大多數) 關鍵字
+Linux 核心的空格使用方式 (主要) 取決於它是用於函式還是關鍵字。(大多數) 關鍵字
 後要加一個空格。值得注意的例外是 sizeof, typeof, alignof 和 __attribute__，這
-些關鍵字某些程度上看起來更像函數 (它們在 Linux 裏也常常伴隨小括號而使用，儘管
-在 C 裏這樣的小括號不是必需的，就像 ``struct fileinfo info;`` 聲明過後的
+些關鍵字某些程度上看起來更像函式 (它們在 Linux 裡也常常伴隨小括號而使用，儘管
+在 C 裡這樣的小括號不是必需的，就像 ``struct fileinfo info;`` 宣告過後的
 ``sizeof info``)。
 
 所以在這些關鍵字之後放一個空格::
@@ -236,14 +238,14 @@ Linux 內核的空格使用方式 (主要) 取決於它是用於函數還是關
 
 	s = sizeof(struct file);
 
-不要在小括號裏的表達式兩側加空格。這是一個 **反例** ：
+不要在小括號裡的表達式兩側加空格。這是一個 **反例** ：
 
 .. code-block:: c
 
 	s = sizeof( struct file );
 
-當聲明指針類型或者返回指針類型的函數時， ``*`` 的首選使用方式是使之靠近變量名
-或者函數名，而不是靠近類型名。例子：
+當宣告指標類型或者返回指標類型的函式時， ``*`` 的首選使用方式是使之靠近變數名
+或者函式名，而不是靠近類型名。例子：
 
 .. code-block:: c
 
@@ -269,67 +271,67 @@ Linux 內核的空格使用方式 (主要) 取決於它是用於函數還是關
 
 ``.`` 和 ``->`` 結構體成員操作符前後不加空格。
 
-不要在行尾留空白。有些可以自動縮進的編輯器會在新行的行首加入適量的空白，然後
-你就可以直接在那一行輸入代碼。不過假如你最後沒有在那一行輸入代碼，有些編輯器
-就不會移除已經加入的空白，就像你故意留下一個只有空白的行。包含行尾空白的行就
-這樣產生了。
+不要在行尾留空白。有些可以自動縮排的編輯器會在新行的行首加入適量的空白，然
+後你就可以直接在那一行輸入程式碼。不過假如你最後沒有在那一行輸入程式碼，有
+些編輯器就不會移除已經加入的空白，就像你故意留下一個只有空白的行。包含行尾
+空白的行就這樣產生了。
 
 當 git 發現補丁包含了行尾空白的時候會警告你，並且可以應你的要求去掉行尾空白；
-不過如果你是正在打一系列補丁，這樣做會導致後面的補丁失敗，因爲你改變了補丁的
+不過如果你是正在打一系列補丁，這樣做會導致後面的補丁失敗，因為你改變了補丁的
 上下文。
 
 
 4) 命名
 -------
 
-C 是一個簡樸的語言，你的命名也應該這樣。和 Modula-2 和 Pascal 程序員不同，
-C 程序員不使用類似 ThisVariableIsATemporaryCounter 這樣華麗的名字。C 程序員會
-稱那個變量爲 ``tmp`` ，這樣寫起來會更容易，而且至少不會令其難於理解。
+C 是一個簡樸的語言，你的命名也應該這樣。和 Modula-2 和 Pascal 程式員不同，
+C 程式員不使用類似 ThisVariableIsATemporaryCounter 這樣華麗的名字。C 程式員會
+稱那個變數為 ``tmp`` ，這樣寫起來會更容易，而且至少不會令其難於理解。
 
-不過，雖然混用大小寫的名字是不提倡使用的，但是全局變量還是需要一個具描述性的
-名字。稱一個全局函數爲 ``foo`` 是一個難以饒恕的錯誤。
+不過，雖然混用大小寫的名字是不提倡使用的，但是全域變數還是需要一個具描述性的
+名字。稱一個全域函式為 ``foo`` 是一個難以饒恕的錯誤。
 
-全局變量 (只有當你 **真正** 需要它們的時候再用它) 需要有一個具描述性的名字，就
-像全局函數。如果你有一個可以計算活動用戶數量的函數，你應該叫它
+全域變數 (只有當你 **真正** 需要它們的時候再用它) 需要有一個具描述性的名字，就
+像全域函式。如果你有一個可以計算活動使用者數量的函式，你應該叫它
 ``count_active_users()`` 或者類似的名字，你不應該叫它 ``cntuser()`` 。
 
-在函數名中包含函數類型 (所謂的匈牙利命名法) 是腦子出了問題——編譯器知道那些類
-型而且能夠檢查那些類型，這樣做只能把程序員弄糊塗了。
+在函式名中包含函式類型 (所謂的匈牙利命名法) 是腦子出了問題——編譯器知道那些類
+型而且能夠檢查那些類型，這樣做只能把程式員弄糊塗了。
 
-本地變量名應該簡短，而且能夠表達相關的含義。如果你有一些隨機的整數型的循環計
-數器，它應該被稱爲 ``i`` 。叫它 ``loop_counter`` 並無益處，如果它沒有被誤解的
-可能的話。類似的， ``tmp`` 可以用來稱呼任意類型的臨時變量。
+本地變數名應該簡短，而且能夠表達相關的含義。如果你有一些隨機的整數型的迴圈計
+數器，它應該被稱為 ``i`` 。叫它 ``loop_counter`` 並無益處，如果它沒有被誤解的
+可能的話。類似的， ``tmp`` 可以用來稱呼任意類型的臨時變數。
 
-如果你怕混淆了你的本地變量名，你就遇到另一個問題了，叫做函數增長荷爾蒙失衡綜
-合徵。請看第六章 (函數)。
+如果你怕混淆了你的本地變數名，你就遇到另一個問題了，叫做函式增長荷爾蒙失衡綜
+合徵。請看第六章 (函式)。
 
-對於符號名稱和文檔，避免引入新的“master/slave”（或獨立於“master”的“slave”）
+對於符號名稱和文件，避免引入新的“master/slave”（或獨立於“master”的“slave”）
 和“blacklist/whitelist”。
 
-“master/slave”推薦替換爲：
+“master/slave”推薦替換為：
     '{primary,main} / {secondary,replica,subordinate}'
     '{initiator,requester} / {target,responder}'
     '{controller,host} / {device,worker,proxy}'
     'leader/follower'
     'director/performer'
 
-“blacklist/whitelist”推薦替換爲：
+“blacklist/whitelist”推薦替換為：
     'denylist/allowlist'
     'blocklist/passlist'
 
-引入新用法的例外情況是：維護用戶空間ABI/API，或更新現有（截至2020年）硬件或
-協議規範的代碼時要求這些術語。對於新規範，儘可能將術語的規範用法轉換爲內核
+引入新用法的例外情況是：維護使用者空間ABI/API，或更新現有（截至2020年）硬體或
+協議規範的程式碼時要求這些術語。對於新規範，儘可能將術語的規範用法轉換為核心
 編碼標準。
 
 .. warning::
-	以上主從、黑白名單規則不適用於中文文檔，請勿更改中文術語！
+	以上主從、黑白名單規則不適用於中文文件，請勿更改中文術語！
 
 5) Typedef
 ----------
 
 不要使用類似 ``vps_t`` 之類的東西。
 
-對結構體和指針使用 typedef 是一個 **錯誤** 。當你在代碼裏看到：
+對結構體和指標使用 typedef 是一個 **錯誤** 。當你在程式碼裡看到：
 
 .. code-block:: c
 
@@ -345,34 +347,34 @@ C 程序員不使用類似 ThisVariableIsATemporaryCounter 這樣華麗的名字
 
 你就知道 ``a`` 是什麼了。
 
-很多人認爲 typedef ``能提高可讀性`` 。實際不是這樣的。它們只在下列情況下有用：
+很多人認為 typedef ``能提高可讀性`` 。實際不是這樣的。它們只在下列情況下有用：
 
- (a) 完全不透明的對象 (這種情況下要主動使用 typedef 來 **隱藏** 這個對象實際上
+ (a) 完全不透明的物件 (這種情況下要主動使用 typedef 來 **隱藏** 這個物件實際上
      是什麼)。
 
-     例如： ``pte_t`` 等不透明對象，你只能用合適的訪問函數來訪問它們。
+     例如： ``pte_t`` 等不透明物件，你只能用合適的存取函式來存取它們。
 
      .. note::
 
-       不透明性和“訪問函數”本身是不好的。我們使用 pte_t 等類型的原因在於真
-       的是完全沒有任何共用的可訪問信息。
+       不透明性和“存取函式”本身是不好的。我們使用 pte_t 等類型的原因在於真
+       的是完全沒有任何共用的可存取資訊。
 
  (b) 清楚的整數類型，如此，這層抽象就可以 **幫助** 消除到底是 ``int`` 還是
      ``long`` 的混淆。
 
-     u8/u16/u32 是完全沒有問題的 typedef，不過它們更符合類別 (d) 而不是這裏。
+     u8/u16/u32 是完全沒有問題的 typedef，不過它們更符合類別 (d) 而不是這裡。
 
      .. note::
 
-       要這樣做，必須事出有因。如果某個變量是 ``unsigned long`` ，那麼沒有必要
+       要這樣做，必須事出有因。如果某個變數是 ``unsigned long`` ，那麼沒有必要
 
 	typedef unsigned long myflags_t;
 
      不過如果有一個明確的原因，比如它在某種情況下可能會是一個 ``unsigned int``
-     而在其他情況下可能爲 ``unsigned long`` ，那麼就不要猶豫，請務必使用
+     而在其他情況下可能為 ``unsigned long`` ，那麼就不要猶豫，請務必使用
      typedef。
 
- (c) 當你使用 sparse 按字面的創建一個 **新** 類型來做類型檢查的時候。
+ (c) 當你使用 sparse 按字面的建立一個 **新** 類型來做類型檢查的時候。
 
  (d) 和標準 C99 類型相同的類型，在某些例外的情況下。
 
@@ -380,45 +382,45 @@ C 程序員不使用類似 ThisVariableIsATemporaryCounter 這樣華麗的名字
      是有些人仍然拒絕使用它們。
 
      因此，Linux 特有的等同於標準類型的 ``u8/u16/u32/u64`` 類型和它們的有符號
-     類型是被允許的——儘管在你自己的新代碼中，它們不是強制要求要使用的。
+     類型是被允許的——儘管在你自己的新程式碼中，它們不是強制要求要使用的。
 
-     當編輯已經使用了某個類型集的已有代碼時，你應該遵循那些代碼中已經做出的選
+     當編輯已經使用了某個類型集的已有程式碼時，你應該遵循那些程式碼中已經做出的選
      擇。
 
- (e) 可以在用戶空間安全使用的類型。
+ (e) 可以在使用者空間安全使用的類型。
 
-     在某些用戶空間可見的結構體裏，我們不能要求 C99 類型而且不能用上面提到的
-     ``u32`` 類型。因此，我們在與用戶空間共享的所有結構體中使用 __u32 和類似
+     在某些使用者空間可見的結構體裡，我們不能要求 C99 類型而且不能用上面提到的
+     ``u32`` 類型。因此，我們在與使用者空間共享的所有結構體中使用 __u32 和類似
      的類型。
 
 可能還有其他的情況，不過基本的規則是 **永遠不要** 使用 typedef，除非你可以明
 確的應用上述某個規則中的一個。
 
-總的來說，如果一個指針或者一個結構體裏的元素可以合理的被直接訪問到，那麼它們
+總的來說，如果一個指標或者一個結構體裡的元素可以合理的被直接存取到，那麼它們
 就不應該是一個 typedef。
 
 
-6) 函數
+6) 函式
 -------
 
-函數應該簡短而漂亮，並且只完成一件事情。函數應該可以一屏或者兩屏顯示完 (我們
+函式應該簡短而漂亮，並且只完成一件事情。函式應該可以一屏或者兩屏顯示完 (我們
 都知道 ISO/ANSI 屏幕大小是 80x24)，只做一件事情，而且把它做好。
 
-一個函數的最大長度是和該函數的複雜度和縮進級數成反比的。所以，如果你有一個理
-論上很簡單的只有一個很長 (但是簡單) 的 case 語句的函數，而且你需要在每個 case
-裏做很多很小的事情，這樣的函數儘管很長，但也是可以的。
+一個函式的最大長度是和該函式的複雜度和縮排級數成反比的。所以，如果你有一個理
+論上很簡單的只有一個很長 (但是簡單) 的 case 語句的函式，而且你需要在每個 case
+裡做很多很小的事情，這樣的函式儘管很長，但也是可以的。
 
-不過，如果你有一個複雜的函數，而且你懷疑一個天分不是很高的高中一年級學生可能
-甚至搞不清楚這個函數的目的，你應該嚴格遵守前面提到的長度限制。使用輔助函數，
-併爲之取個具描述性的名字 (如果你覺得它們的性能很重要的話，可以讓編譯器內聯它
-們，這樣的效果往往會比你寫一個複雜函數的效果要好。)
+不過，如果你有一個複雜的函式，而且你懷疑一個天分不是很高的高中一年級學生可能
+甚至搞不清楚這個函式的目的，你應該嚴格遵守前面提到的長度限制。使用輔助函式，
+併為之取個具描述性的名字 (如果你覺得它們的效能很重要的話，可以讓編譯器行內它
+們，這樣的效果往往會比你寫一個複雜函式的效果要好。)
 
-函數的另外一個衡量標準是本地變量的數量。此數量不應超過 5－10 個，否則你的函數
-就有問題了。重新考慮一下你的函數，把它分拆成更小的函數。人的大腦一般可以輕鬆
-的同時跟蹤 7 個不同的事物，如果再增多的話，就會糊塗了。即便你聰穎過人，你也可
+函式的另外一個衡量標準是本地變數的數量。此數量不應超過 5－10 個，否則你的函式
+就有問題了。重新考慮一下你的函式，把它分拆成更小的函式。人的大腦一般可以輕鬆
+的同時追蹤 7 個不同的事物，如果再增多的話，就會糊塗了。即便你聰穎過人，你也可
 能會記不清你 2 個星期前做過的事情。
 
-在源文件裏，使用空行隔開不同的函數。如果該函數需要被導出，它的 **EXPORT** 宏
+在原始檔裡，使用空行隔開不同的函式。如果該函式需要被匯出，它的 **EXPORT** 巨集
 應該緊貼在它的結束大括號之下。比如：
 
 .. code-block:: c
@@ -429,37 +431,38 @@ C 程序員不使用類似 ThisVariableIsATemporaryCounter 這樣華麗的名字
 	}
 	EXPORT_SYMBOL(system_is_up);
 
-6.1) 函數原型
+6.1) 函式原型
 *************
 
-在函數原型中包含參數名和它們的數據類型。雖然 C 語言裏沒有這樣的要求，但在
-Linux 裏這是提倡的做法，因爲這樣可以很簡單的給讀者提供更多的有價值的信息。
+在函式原型中包含參數名和它們的資料類型。雖然 C 語言裡沒有這樣的要求，但在
+Linux 裡這是提倡的做法，因為這樣可以很簡單的給讀者提供更多的有價值的資訊。
 
-不要在函數聲明裏使用 ``extern`` 關鍵字，因爲這會導致代碼行變長，並且不是嚴格
+不要在函式宣告裡使用 ``extern`` 關鍵字，因為這會導致程式碼行變長，並且不是嚴格
 必需的。
 
-寫函數原型時，請保持 `元素順序規則 <https://lore.kernel.org/mm-commits/CAHk-=wiOCLRny5aifWNhr621kYrJwhfURsa0vFPeUEm8mF0ufg@mail.gmail.com/>`_ 。
-例如下列函數聲明::
+寫函式原型時，請保持 `元素順序規則 <https://lore.kernel.org/mm-commits/CAHk-=wiOCLRny5aifWNhr621kYrJwhfURsa0vFPeUEm8mF0ufg@mail.gmail.com/>`_ 。
+例如下列函式宣告::
 
  __init void * __must_check action(enum magic value, size_t size, u8 count,
 				   char *fmt, ...) __printf(4, 5) __malloc;
 
-推薦的函數原型元素順序是：
+推薦的函式原型元素順序是：
 
 - 儲存類型（下方的 ``static __always_inline`` ，注意 ``__always_inline``
   技術上來講是個屬性但被當做 ``inline`` ）
-- 儲存類型屬性（上方的 ``__init`` ——即節聲明，但也像 ``__cold`` ）
+- 儲存類型屬性（上方的 ``__init`` ——即節宣告，但也像 ``__cold`` ）
 - 返回類型（上方的 ``void *`` ）
 - 返回類型屬性（上方的 ``__must_check`` ）
-- 函數名（上方的 ``action`` ）
-- 函數參數（上方的 ``(enum magic value, size_t size, u8 count, char *fmt, ...)`` ，
-  注意必須寫上參數名）
-- 函數參數屬性（上方的 ``__printf(4, 5)`` ）
-- 函數行爲屬性（上方的 ``__malloc`` ）
+- 函式名（上方的 ``action`` ）
+- 函式參數（上方的
+  ``(enum magic value, size_t size, u8 count, char *fmt, ...)`` ，注意必須
+  寫上參數名）
+- 函式參數屬性（上方的 ``__printf(4, 5)`` ）
+- 函式行為屬性（上方的 ``__malloc`` ）
 
-請注意，對於函數 **定義** （即實際函數體），編譯器不允許在函數參數之後添加函
-數參數屬性。在這種情況下，它們應該跟隨存儲類型屬性（例如，與上面的 **聲明**
-示例相比，請注意下面的 ``__printf(4, 5)`` 的位置發生了變化）::
+請注意，對於函式 **定義** （即實際函式體），編譯器不允許在函式參數之後添加函
+數參數屬性。在這種情況下，它們應該跟隨儲存類型屬性（例如，與上面的 **宣告**
+範例相比，請注意下面的 ``__printf(4, 5)`` 的位置發生了變化）::
 
  static __always_inline __init __printf(4, 5) void * __must_check action(enum magic value,
 		size_t size, u8 count, char *fmt, ...) __malloc
@@ -467,26 +470,26 @@ Linux 裏這是提倡的做法，因爲這樣可以很簡單的給讀者提供
 	...
  }
 
-7) 集中的函數退出途徑
+7) 集中的函式退出途徑
 ---------------------
 
 雖然被某些人聲稱已經過時，但是 goto 語句的等價物還是經常被編譯器所使用，具體
 形式是無條件跳轉指令。
 
-當一個函數從多個位置退出，並且需要做一些類似清理的常見操作時，goto 語句就很方
+當一個函式從多個位置退出，並且需要做一些類似清理的常見操作時，goto 語句就很方
 便了。如果並不需要清理操作，那麼直接 return 即可。
 
-選擇一個能夠說明 goto 行爲或它爲何存在的標籤名。如果 goto 要釋放 ``buffer``,
+選擇一個能夠說明 goto 行為或它為何存在的標籤名。如果 goto 要釋放 ``buffer``,
 一個不錯的名字可以是 ``out_free_buffer:`` 。別去使用像 ``err1:`` 和 ``err2:``
-這樣的GW_BASIC 名稱，因爲一旦你添加或刪除了 (函數的) 退出路徑，你就必須對它們
+這樣的GW_BASIC 名稱，因為一旦你添加或刪除了 (函式的) 退出路徑，你就必須對它們
 重新編號，這樣會難以去檢驗正確性。
 
 使用 goto 的理由是：
 
-- 無條件語句容易理解和跟蹤
+- 無條件語句容易理解和追蹤
 - 嵌套程度減小
 - 可以避免由於修改時忘記更新個別的退出點而導致錯誤
-- 讓編譯器省去刪除冗餘代碼的工作 ;)
+- 讓編譯器省去刪除冗餘程式碼的工作 ;)
 
 .. code-block:: c
 
@@ -521,7 +524,7 @@ Linux 裏這是提倡的做法，因爲這樣可以很簡單的給讀者提供
 		kfree(foo);
 		return ret;
 
-這段代碼的錯誤是，在某些退出路徑上 ``foo`` 是 NULL。通常情況下，通過把它分離
+這段程式碼的錯誤是，在某些退出路徑上 ``foo`` 是 NULL。通常情況下，透過把它分離
 成兩個錯誤標籤 ``err_free_bar:`` 和 ``err_free_foo:`` 來修復這個錯誤：
 
 .. code-block:: c
@@ -535,22 +538,23 @@ Linux 裏這是提倡的做法，因爲這樣可以很簡單的給讀者提供
 理想情況下，你應該模擬錯誤來測試所有退出路徑。
 
 
-8) 註釋
+8) 註解
 -------
 
-註釋是好的，不過有過度註釋的危險。永遠不要在註釋裏解釋你的代碼是如何運作的：
-更好的做法是讓別人一看你的代碼就可以明白，解釋寫的很差的代碼是浪費時間。
+註解是好的，不過有過度註解的危險。永遠不要在註解裡解釋你的程式碼是如何運作的：
+更好的做法是讓別人一看你的程式碼就可以明白，解釋寫的很差的程式碼是浪費時間。
 
-一般來說你用註釋告訴別人你的代碼做了什麼，而不是怎麼做的。也請你不要把
-註釋放在一個函數體內部：如果函數複雜到你需要獨立的註釋其中的一部分，你很可能
-需要回到第六章看一看。你可以做一些小注釋來註明或警告某些很聰明 (或者槽糕) 的
-做法，但不要加太多。你應該做的，是把註釋放在函數的頭部，告訴人們它做了什麼，
+一般來說你用註解告訴別人你的程式碼做了什麼，而不是怎麼做的。也請你不要把
+註解放在一個函式體內部：如果函式複雜到你需要獨立的註解其中的一部分，你很可能
+需要回到第六章看一看。你可以做一些小註解來註明或警告某些很聰明 (或者槽糕) 的
+做法，但不要加太多。你應該做的，是把註解放在函式的頭部，告訴人們它做了什麼，
 也可以加上它做這些事情的原因。
 
-當註釋內核 API 函數時，請使用 kernel-doc 格式。詳見
-Documentation/translations/zh_CN/doc-guide/index.rst 和 tools/docs/kernel-doc 。
+當註解核心 API 函式時，請使用 kernel-doc 格式。詳見
+Documentation/translations/zh_CN/doc-guide/index.rst 和
+tools/docs/kernel-doc 。
 
-長 (多行) 註釋的首選風格是：
+長 (多行) 註解的首選風格是：
 
 .. code-block:: c
 
@@ -563,7 +567,7 @@ Documentation/translations/zh_CN/doc-guide/index.rst 和 tools/docs/kernel-doc 
 	 * with beginning and ending almost-blank lines.
 	 */
 
-對於在 net/ 和 drivers/net/ 的文件，首選的長 (多行) 註釋風格有些不同。
+對於在 net/ 和 drivers/net/ 的檔案，首選的長 (多行) 註解風格有些不同。
 
 .. code-block:: c
 
@@ -574,22 +578,22 @@ Documentation/translations/zh_CN/doc-guide/index.rst 和 tools/docs/kernel-doc 
 	 * but there is no initial almost-blank line.
 	 */
 
-註釋數據也是很重要的，不管是基本類型還是衍生類型。爲了方便實現這一點，每一行
-應只聲明一個數據 (不要使用逗號來一次聲明多個數據)。這樣你就有空間來爲每個數據
-寫一段小注釋來解釋它們的用途了。
+註解資料也是很重要的，不管是基本類型還是衍生類型。為了方便實作這一點，每一行
+應只宣告一個資料 (不要使用逗號來一次宣告多個資料)。這樣你就有空間來為每個資料
+寫一段小註解來解釋它們的用途了。
 
 
 9) 你已經把事情弄糟了
 ---------------------
 
-這沒什麼，我們都是這樣。可能你長期使用 Unix 的朋友已經告訴你
-``GNU emacs`` 能自動幫你格式化 C 源代碼，而且你也注意到了，確實是這樣，不過它
-所使用的默認值和我們想要的相去甚遠 (實際上，甚至比隨機打的還要差——無數個猴子
-在 GNU emacs 裏打字永遠不會創造出一個好程序)
+這沒什麼，我們都是這樣。可能你長期使用 Unix 的朋友已經告訴你``GNU emacs``
+能自動幫你格式化 C 原始程式碼，而且你也注意到了，確實是這樣，不過它所使用
+的預設值和我們想要的相去甚遠 (實際上，甚至比隨機打的還要差——無數個猴子在
+GNU emacs 裡打字永遠不會創造出一個好程式)
 *(譯註：Infinite Monkey Theorem)*
 
 所以你要麼放棄 GNU emacs，要麼改變它讓它使用更合理的設定。要採用後一個方案，
-你可以把下面這段粘貼到你的 .emacs 文件裏。
+你可以把下面這段貼上到你的 .emacs 檔案裡。
 
 .. code-block:: elisp
 
@@ -640,31 +644,31 @@ Documentation/translations/zh_CN/doc-guide/index.rst 和 tools/docs/kernel-doc 
    (expand-file-name "~/src/linux-trees")
    'linux-kernel)
 
-這會讓 emacs 在 ``~/src/linux-trees`` 下的 C 源文件獲得更好的內核代碼風格。
+這會讓 emacs 在 ``~/src/linux-trees`` 下的 C 原始檔獲得更好的核心程式碼風格。
 
-不過就算你嘗試讓 emacs 正確的格式化代碼失敗了，也並不意味着你失去了一切：還可
-以用 ``indent`` 。
+不過就算你嘗試讓 emacs 正確的格式化程式碼失敗了，也並不意味著你失去了一切：
+還可以用 ``indent`` 。
 
 不過，GNU indent 也有和 GNU emacs 一樣有問題的設定，所以你需要給它一些命令選
-項。不過，這還不算太糟糕，因爲就算是 GNU indent 的作者也認同 K&R 的權威性
+項。不過，這還不算太糟糕，因為就算是 GNU indent 的作者也認同 K&R 的權威性
 (GNU 的人並不是壞人，他們只是在這個問題上被嚴重的誤導了)，所以你只要給 indent
-指定選項 ``-kr -i8`` (代表 ``K&R，8 字符縮進``)，或使用 ``scripts/Lindent``
-這樣就可以以最時髦的方式縮進源代碼。
+指定選項 ``-kr -i8`` (代表 ``K&R，8 字元縮排``)，或使用 ``scripts/Lindent``
+這樣就可以以最時髦的方式縮排原始程式碼。
 
-``indent`` 有很多選項，特別是重新格式化註釋的時候，你可能需要看一下它的手冊。
-不過記住： ``indent`` 不能修正壞的編程習慣。
+``indent`` 有很多選項，特別是重新格式化註解的時候，你可能需要看一下它的手冊。
+不過記住： ``indent`` 不能修正壞的程式設計習慣。
 
-請注意，您還可以使用 ``clang-format`` 工具幫助您處理這些規則，快速自動重新格
-式化部分代碼，並審閱整個文件以發現代碼風格錯誤、打字錯誤和可能的改進。它還可
-以方便地排序 ``#include`` ，對齊變量/宏，重排文本和其他類似任務。
+請注意，您還可以使用 ``clang-format`` 工具幫助您處理這些規則，快速自動重新
+格式化部分程式碼，並審閱整個檔案以發現程式碼風格錯誤、打字錯誤和可能的改進。
+它還可以方便地排序 ``#include`` ，對齊變數/巨集，重排文字和其他類似任務。
 詳見 Documentation/dev-tools/clang-format.rst 。
 
 
-10) Kconfig 配置文件
+10) Kconfig 設定檔
 --------------------
 
-對於遍佈源碼樹的所有 Kconfig* 配置文件來說，它們縮進方式有所不同。緊挨着
-``config`` 定義的行，用一個製表符縮進，然而 help 信息的縮進則額外增加 2 個空
+對於遍佈源碼樹的所有 Kconfig* 設定文件來說，它們縮排方式有所不同。緊挨著
+``config`` 定義的行，用一個製表符縮排，然而 help 資訊的縮排則額外增加 2 個空
 格。舉個例子::
 
   config AUDIT
@@ -676,7 +680,7 @@ Documentation/translations/zh_CN/doc-guide/index.rst 和 tools/docs/kernel-doc 
 	  logging of avc messages output).  Does not do system-call
 	  auditing without CONFIG_AUDITSYSCALL.
 
-而那些危險的功能 (比如某些文件系統的寫支持) 應該在它們的提示字符串裏顯著的聲
+而那些危險的功能 (比如某些檔案系統的寫支援) 應該在它們的提示字串裡顯著的聲
 明這一點::
 
   config ADFS_FS_RW
@@ -684,49 +688,50 @@ Documentation/translations/zh_CN/doc-guide/index.rst 和 tools/docs/kernel-doc 
 	depends on ADFS_FS
 	...
 
-要查看配置文件的完整文檔，請看 Documentation/kbuild/kconfig-language.rst 。
+要查看設定文件的完整文件，請看 Documentation/kbuild/kconfig-language.rst 。
 
 
-11) 數據結構
+11) 資料結構
 ------------
 
-如果一個數據結構，在創建和銷燬它的單線執行環境之外可見，那麼它必須要有一個引
-用計數器。內核裏沒有垃圾收集 (並且內核之外的垃圾收集慢且效率低下)，這意味着你
-絕對需要記錄你對這種數據結構的使用情況。
+如果一個資料結構，在建立和銷燬它的單線執行環境之外可見，那麼它必須要有一個引
+用計數器。核心裡沒有垃圾收集 (並且核心之外的垃圾收集慢且效率低下)，這意味著你
+絕對需要記錄你對這種資料結構的使用情況。
 
-引用計數意味着你能夠避免上鎖，並且允許多個用戶並行訪問這個數據結構——而不需要
-擔心這個數據結構僅僅因爲暫時不被使用就消失了，那些用戶可能不過是沉睡了一陣或
+引用計數意味著你能夠避免上鎖，並且允許多個使用者並行存取這個資料結構——而不需要
+擔心這個資料結構僅僅因為暫時不被使用就消失了，那些使用者可能不過是沉睡了一陣或
 者做了一些其他事情而已。
 
-注意上鎖 **不能** 取代引用計數。上鎖是爲了保持數據結構的一致性，而引用計數是一
-個內存管理技巧。通常二者都需要，不要把兩個搞混了。
+注意上鎖 **不能** 取代引用計數。上鎖是為了保持資料結構的一致性，而引用計數是一
+個記憶體管理技巧。通常二者都需要，不要把兩個搞混了。
 
-很多數據結構實際上有 2 級引用計數，它們通常有不同 ``類`` 的用戶。子類計數器統
-計子類用戶的數量，每當子類計數器減至零時，全局計數器減一。
+很多資料結構實際上有 2 級引用計數，它們通常有不同 ``類`` 的使用者。子類計
+數器統計子類使用者的數量，每當子類計數器減至零時，全域計數器減一。
 
-這種 ``多級引用計數`` 的例子可以在內存管理 (``struct mm_struct``: mm_users 和
-mm_count)，和文件系統 (``struct super_block``: s_count 和 s_active) 中找到。
+這種 ``多級引用計數`` 的例子可以在記憶體管理 (``struct mm_struct``:
+mm_users 和mm_count)，和檔案系統 (``struct super_block``: s_count 和
+s_active) 中找到。
 
-記住：如果另一個執行線索可以找到你的數據結構，但這個數據結構沒有引用計數器，
-這裏幾乎肯定是一個 bug。
+記住：如果另一個執行線索可以找到你的資料結構，但這個資料結構沒有引用計數器，
+這裡幾乎肯定是一個 bug。
 
 
-12) 宏，枚舉和RTL
------------------
+12) 巨集，列舉和RTL
+-------------------
 
-用於定義常量的宏的名字及枚舉裏的標籤需要大寫。
+用於定義常數的巨集的名字及列舉裡的標籤需要大寫。
 
 .. code-block:: c
 
 	#define CONSTANT 0x12345
 
-在定義幾個相關的常量時，最好用枚舉。
+在定義幾個相關的常數時，最好用列舉。
 
-宏的名字請用大寫字母，不過形如函數的宏的名字可以用小寫字母。
+巨集的名字請用大寫字母，不過形如函式的巨集的名字可以用小寫字母。
 
-通常如果能寫成內聯函數就不要寫成像函數的宏。
+通常如果能寫成行內函式就不要寫成像函式的巨集。
 
-含有多個語句的宏應該被包含在一個 do-while 代碼塊裏：
+含有多個語句的巨集應該被包含在一個 do-while 程式碼塊裡：
 
 .. code-block:: c
 
@@ -736,9 +741,9 @@ mm_count)，和文件系統 (``struct super_block``: s_count 和 s_active) 中
 				do_this(b, c);		\
 		} while (0)
 
-使用宏的時候應避免的事情：
+使用巨集的時候應避免的事情：
 
-1) 影響控制流程的宏：
+1) 影響控制流程的巨集：
 
 .. code-block:: c
 
@@ -748,30 +753,30 @@ mm_count)，和文件系統 (``struct super_block``: s_count 和 s_active) 中
 				return -EBUGGERED;	\
 		} while (0)
 
-**非常** 不好。它看起來像一個函數，不過卻能導致 ``調用`` 它的函數退出；不要打
-亂讀者大腦裏的語法分析器。
+**非常** 不好。它看起來像一個函式，不過卻能導致 ``呼叫`` 它的函式退出；不要打
+亂讀者大腦裡的語法分析器。
 
-2) 依賴於一個固定名字的本地變量的宏：
+2) 依賴於一個固定名字的本地變數的巨集：
 
 .. code-block:: c
 
 	#define FOO(val) bar(index, val)
 
-可能看起來像是個不錯的東西，不過它非常容易把讀代碼的人搞糊塗，而且容易導致看起
-來不相關的改動帶來錯誤。
+可能看起來像是個不錯的東西，不過它非常容易把讀程式碼的人搞糊塗，而且容易導
+致看起來不相關的改動帶來錯誤。
 
-3) 作爲左值的帶參數的宏： FOO(x) = y；如果有人把 FOO 變成一個內聯函數的話，這
+3) 作為左值的帶參數的巨集： FOO(x) = y；如果有人把 FOO 變成一個行內函式的話，這
    種用法就會出錯了。
 
-4) 忘記了優先級：使用表達式定義常量的宏必須將表達式置於一對小括號之內。帶參數
-   的宏也要注意此類問題。
+4) 忘記了優先級：使用表達式定義常數的巨集必須將表達式置於一對小括號之內。帶參數
+   的巨集也要注意此類問題。
 
 .. code-block:: c
 
 	#define CONSTANT 0x4000
 	#define CONSTEXP (CONSTANT | 3)
 
-5) 在宏裏定義類似函數的本地變量時命名衝突：
+5) 在巨集裡定義類似函式的本地變數時命名衝突：
 
 .. code-block:: c
 
@@ -782,45 +787,45 @@ mm_count)，和文件系統 (``struct super_block``: s_count 和 s_active) 中
 		(ret);				\
 	})
 
-ret 是本地變量的通用名字—— __foo_ret 更不容易與一個已存在的變量衝突。
+ret 是本地變數的通用名字—— __foo_ret 更不容易與一個已存在的變數衝突。
 
-cpp 手冊對宏的講解很詳細。gcc internals 手冊也詳細講解了 RTL，內核裏的彙編語
+cpp 手冊對巨集的講解很詳細。gcc internals 手冊也詳細講解了 RTL，核心裡的組譯語
 言經常用到它。
 
 
-13) 打印內核消息
+13) 列印核心訊息
 ----------------
 
-內核開發者應該看起來有文化。請一定注意內核信息的拼寫，以給人良好的印象。
+核心開發者應該看起來有文化。請一定注意核心資訊的拼寫，以給人良好的印象。
 不要用不規範的單詞比如 ``dont``，而要用 ``do not`` 或者 ``don't`` 。保證這些信
 息簡單明瞭、無歧義。
 
-內核信息不必以英文句號結束。
+核心資訊不必以英文句號結束。
 
-在小括號裏打印數字 (%d) 沒有任何價值，應該避免這樣做。
+在小括號裡列印數字 (%d) 沒有任何價值，應該避免這樣做。
 
-<linux/device.h> 裏有一些驅動模型診斷宏，你應該使用它們，以確保信息對應於正確
-的設備和驅動，並且被標記了正確的消息級別。這些宏有：dev_err(), dev_warn(),
-dev_info() 等等。對於那些不和某個特定設備相關連的信息，<linux/printk.h> 定義
-了 pr_notice(), pr_info(), pr_warn(), pr_err() 和其他。
+<linux/device.h> 裡有一些驅動模型診斷巨集，你應該使用它們，以確保資訊對應
+於正確的設備和驅動，並且被標記了正確的訊息級別。這些巨集有：dev_err(),
+dev_warn(),dev_info() 等等。對於那些不和某個特定設備相關連的資訊，
+<linux/printk.h> 定義了 pr_notice(), pr_info(), pr_warn(), pr_err() 和其他。
 
-寫出好的調試信息可以是一個很大的挑戰；一旦你寫出後，這些信息在遠程除錯時能提
-供極大的幫助。然而打印調試信息的處理方式同打印非調試信息不同。其他 pr_XXX()
-函數能無條件地打印，pr_debug() 卻不；默認情況下它不會被編譯，除非定義了 DEBUG
-或設定了 CONFIG_DYNAMIC_DEBUG。實際這同樣是爲了 dev_dbg()，一個相關約定是在一
-個已經開啓了 DEBUG 時，使用 VERBOSE_DEBUG 來添加 dev_vdbg()。
+寫出好的除錯資訊可以是一個很大的挑戰；一旦你寫出後，這些資訊在遠端除錯時能提
+供極大的幫助。然而列印除錯資訊的處理方式同列印非除錯資訊不同。其他 pr_XXX()
+函式能無條件地列印，pr_debug() 卻不；預設情況下它不會被編譯，除非定義了 DEBUG
+或設定了 CONFIG_DYNAMIC_DEBUG。實際這同樣是為了 dev_dbg()，一個相關約定是在一
+個已經開啟了 DEBUG 時，使用 VERBOSE_DEBUG 來添加 dev_vdbg()。
 
-許多子系統擁有 Kconfig 調試選項來開啓對應 Makefile 裏面的 -DDEBUG；在其他
-情況下，特殊文件使用 #define DEBUG。當一條調試信息需要被無條件打印時，例如，
-如果已經包含一個調試相關的 #ifdef 條件，printk(KERN_DEBUG ...) 就可被使用。
+許多子系統擁有 Kconfig 除錯選項來開啟對應 Makefile 裡面的 -DDEBUG；在其他
+情況下，特定檔案使用 #define DEBUG。當一條除錯資訊需要被無條件列印時，例如，
+如果已經包含一個除錯相關的 #ifdef 條件，printk(KERN_DEBUG ...) 就可被使用。
 
 
-14) 分配內存
-------------
+14) 分配記憶體
+--------------
 
-內核提供了下面的一般用途的內存分配函數：
-kmalloc(), kzalloc(), kmalloc_array(), kcalloc(), vmalloc() 和 vzalloc()。
-請參考 API 文檔以獲取有關它們的詳細信息：
+核心提供了下面的一般用途的記憶體分配函式：
+kmalloc(), kzalloc(), kmalloc_objs(), kzalloc_objs(), vmalloc() 和 vzalloc()。
+請參考 API 文件以獲取有關它們的詳細資訊：
 Documentation/translations/zh_CN/core-api/memory-allocation.rst 。
 
 傳遞結構體大小的首選形式是這樣的：
@@ -830,103 +835,106 @@ Documentation/translations/zh_CN/core-api/memory-allocation.rst 。
 	p = kmalloc_obj(*p, ...);
 
 另外一種傳遞方式中，sizeof 的操作數是結構體的名字，這樣會降低可讀性，並且可能
-會引入 bug。有可能指針變量類型被改變時，而對應的傳遞給內存分配函數的 sizeof
+會引入 bug。有可能指標變數類型被改變時，而對應的傳遞給記憶體分配函式的 sizeof
 的結果不變。
 
-強制轉換一個 void 指針返回值是多餘的。C 語言本身保證了從 void 指針到其他任何
-指針類型的轉換是沒有問題的。
+強制轉換一個 void 指標回傳值是多餘的。C 語言本身保證了從 void 指標到其他任何
+指標類型的轉換是沒有問題的。
 
-分配一個數組的首選形式是這樣的：
+分配一個陣列的首選形式是這樣的：
 
 .. code-block:: c
 
-	p = kmalloc_array(n, sizeof(...), ...);
+	p = kmalloc_objs(*p, n, ...);
 
-分配一個零長數組的首選形式是這樣的：
+分配一個零長陣列的首選形式是這樣的：
 
 .. code-block:: c
 
-	p = kcalloc(n, sizeof(...), ...);
+	p = kzalloc_objs(*p, n, ...);
+
+這兩種形式都會檢查分配大小 n * sizeof(...) 是否溢位，如果發生溢位則回傳
+NULL。
 
-兩種形式都會檢查分配 n * sizeof(...) 大小時內存的溢出，如果溢出返回 NULL。
+兩種形式都會檢查分配 n * sizeof(...) 大小時記憶體的溢出，如果溢出返回 NULL。
 
-在沒有 __GFP_NOWARN 的情況下使用時，這些通用分配函數都會在失敗時發起堆棧轉儲，
-因此當返回NULL時，沒有必要發出額外的失敗消息。
+在沒有 __GFP_NOWARN 的情況下使用時，這些通用分配函式都會在失敗時發起堆疊轉儲，
+因此當返回NULL時，沒有必要發出額外的失敗訊息。
 
-15) 內聯弊病
+15) 行內弊病
 ------------
 
-有一個常見的誤解是 ``內聯`` 是 gcc 提供的可以讓代碼運行更快的一個選項。雖然使
-用內聯函數有時候是恰當的 (比如作爲一種替代宏的方式，請看第十二章)，不過很多情
-況下不是這樣。inline 的過度使用會使內核變大，從而使整個系統運行速度變慢。
-因爲體積大內核會佔用更多的指令高速緩存，而且會導致 pagecache 的可用內存減少。
-想象一下，一次 pagecache 未命中就會導致一次磁盤尋址，將耗時 5 毫秒。5 毫秒的
-時間內 CPU 能執行很多很多指令。
-
-一個基本的原則是如果一個函數有 3 行以上，就不要把它變成內聯函數。這個原則的一
-個例外是，如果你知道某個參數是一個編譯時常量，而且因爲這個常量你確定編譯器在
-編譯時能優化掉你的函數的大部分代碼，那仍然可以給它加上 inline 關鍵字。
-kmalloc() 內聯函數就是一個很好的例子。
-
-人們經常主張給 static 的而且只用了一次的函數加上 inline，如此不會有任何損失，
-因爲沒有什麼好權衡的。雖然從技術上說這是正確的，但是實際上這種情況下即使不加
-inline gcc 也可以自動使其內聯。而且其他用戶可能會要求移除 inline，由此而來的
+有一個常見的誤解是 ``行內`` 是 gcc 提供的可以讓程式碼執行更快的一個選項。
+雖然使用行內函式有時候是恰當的 (比如作為一種替代巨集的方式，請看第十二章)，
+不過很多情況下不是這樣。inline 的過度使用會使核心變大，從而使整個系統執行
+速度變慢。因為體積大核心會佔用更多的指令高速快取，而且會導致 pagecache 的
+可用記憶體減少。想象一下，一次 pagecache 未命中就會導致一次磁碟尋址，將耗
+時 5 毫秒。5 毫秒的時間內 CPU 能執行很多很多指令。
+
+一個基本的原則是如果一個函式有 3 行以上，就不要把它變成行內函式。這個原則的一
+個例外是，如果你知道某個參數是一個編譯時常數，而且因為這個常數你確定編譯器在
+編譯時能最佳化掉你的函式的大部分程式碼，那仍然可以給它加上 inline 關鍵字。
+kmalloc() 行內函式就是一個很好的例子。
+
+人們經常主張給 static 的而且只用了一次的函式加上 inline，如此不會有任何損失，
+因為沒有什麼好權衡的。雖然從技術上說這是正確的，但是實際上這種情況下即使不加
+inline gcc 也可以自動使其行內。而且其他使用者可能會要求移除 inline，由此而來的
 爭論會抵消 inline 自身的潛在價值，得不償失。
 
 
-16) 函數返回值及命名
+16) 函式回傳值及命名
 --------------------
 
-函數可以返回多種不同類型的值，最常見的一種是表明函數執行成功或者失敗的值。這樣
-的一個值可以表示爲一個錯誤代碼整數 (-Exxx＝失敗，0＝成功) 或者一個 ``成功``
-布爾值 (0＝失敗，非0＝成功)。
+函式可以返回多種不同類型的值，最常見的一種是表明函式執行成功或者失敗的值。這樣
+的一個值可以表示為一個錯誤程式碼整數 (-Exxx＝失敗，0＝成功) 或者一個 ``成功``
+布林值 (0＝失敗，非0＝成功)。
 
 混合使用這兩種表達方式是難於發現的 bug 的來源。如果 C 語言本身嚴格區分整形和
-布爾型變量，那麼編譯器就能夠幫我們發現這些錯誤... 不過 C 語言不區分。爲了避免
+布林型變數，那麼編譯器就能夠幫我們發現這些錯誤... 不過 C 語言不區分。為了避免
 產生這種 bug，請遵循下面的慣例::
 
-	如果函數的名字是一個動作或者強制性的命令，那麼這個函數應該返回錯誤代
-	碼整數。如果是一個判斷，那麼函數應該返回一個“成功”布爾值。
+	如果函式的名字是一個動作或者強制性的命令，那麼這個函式應該返回錯誤代
+	碼整數。如果是一個判斷，那麼函式應該返回一個“成功”布林值。
 
 比如， ``add work`` 是一個命令，所以 add_work() 在成功時返回 0，在失敗時返回
--EBUSY。類似的，因爲 ``PCI device present`` 是一個判斷，所以 pci_dev_present()
+-EBUSY。類似的，因為 ``PCI device present`` 是一個判斷，所以 pci_dev_present()
 在成功找到一個匹配的設備時應該返回 1，如果找不到時應該返回 0。
 
-所有 EXPORTed 函數都必須遵守這個慣例，所有的公共函數也都應該如此。私有
-(static) 函數不需要如此，但是我們也推薦這樣做。
+所有 EXPORTed 函式都必須遵守這個慣例，所有的公共函式也都應該如此。私有
+(static) 函式不需要如此，但是我們也推薦這樣做。
 
-返回值是實際計算結果而不是計算是否成功的標誌的函數不受此慣例的限制。通常
-他們通過返回一些正常值範圍之外的結果來表示出錯。典型的例子是返回指針的函數，
+回傳值是實際計算結果而不是計算是否成功的標誌的函式不受此慣例的限制。通常
+他們透過返回一些正常值範圍之外的結果來表示出錯。典型的例子是返回指標的函式，
 他們使用 NULL 或者 ERR_PTR 機制來報告錯誤。
 
-17) 使用布爾類型
+17) 使用布林類型
 ----------------
 
-Linux內核布爾（bool）類型是C99 _Bool類型的別名。布爾值只能爲0或1，而對布爾的
-隱式或顯式轉換將自動將值轉換爲true或false。在使用布爾類型時 **不需要** 構造，
+Linux核心布林（bool）類型是C99 _Bool類型的別名。布林值只能為0或1，而對布林的
+隱式或顯式轉換將自動將值轉換為true或false。在使用布林類型時 **不需要** 構造，
 它會消除一類錯誤。
 
-使用布爾值時，應使用true和false定義，而不是1和0。
+使用布林值時，應使用true和false定義，而不是1和0。
 
-布爾函數返回類型和堆棧變量總是可以在適當的時候使用。鼓勵使用布爾來提高可讀性，
-並且布爾值在存儲時通常比“int”更好。
+布林函式返回類型和堆疊變數總是可以在適當的時候使用。鼓勵使用布林來提高可讀性，
+並且布林值在儲存時通常比“int”更好。
 
-如果緩存行佈局或值的大小很重要，請不要使用布爾，因爲其大小和對齊方式根據編譯
-的體系結構而不同。針對對齊和大小進行優化的結構體不應使用布爾。
+如果快取行佈局或值的大小很重要，請不要使用布林，因為其大小和對齊方式根據編譯
+的體系結構而不同。針對對齊和大小進行最佳化的結構體不應使用布林。
 
-如果一個結構體有多個true/false值，請考慮將它們合併爲具有1比特成員的位域，或使
+如果一個結構體有多個true/false值，請考慮將它們合併為具有1比特成員的位域，或使
 用適當的固定寬度類型，如u8。
 
-類似地，對於函數參數，多個true/false值可以合併爲單個按位的“標誌”參數，如果調
-用點具有裸true/false常量，“標誌”參數通常是更具可讀性的替代方法。
+類似地，對於函式參數，多個true/false值可以合併為單個按位的“標誌”參數，如果調
+用點具有裸true/false常數，“標誌”參數通常是更具可讀性的替代方法。
 
-總之，在結構體和參數中有限地使用布爾可以提高可讀性。
+總之，在結構體和參數中有限地使用布林可以提高可讀性。
 
-18) 不要重新發明內核宏
-----------------------
+18) 不要重新發明核心巨集
+------------------------
 
-頭文件 include/linux/kernel.h 包含了一些宏，你應該使用它們，而不要自己寫一些
-它們的變種。比如，如果你需要計算一個數組的長度，使用這個宏
+標頭檔 include/linux/kernel.h 包含了一些巨集，你應該使用它們，而不要自己寫一些
+它們的變種。比如，如果你需要計算一個陣列的長度，使用這個巨集
 
 .. code-block:: c
 
@@ -938,15 +946,15 @@ Linux內核布爾（bool）類型是C99 _Bool類型的別名。布爾值只能
 
 	#define sizeof_field(t, f) (sizeof(((t*)0)->f))
 
-還有可以做嚴格的類型檢查的 min() 和 max() 宏，如果你需要可以使用它們。你可以
-自己看看那個頭文件裏還定義了什麼你可以拿來用的東西，如果有定義的話，你就不應
-在你的代碼裏自己重新定義。
+還有可以做嚴格的類型檢查的 min() 和 max() 巨集，如果你需要可以使用它們。你可以
+自己看看那個標頭檔裡還定義了什麼你可以拿來用的東西，如果有定義的話，你就不應
+在你的程式碼裡自己重新定義。
 
 
 19) 編輯器模式行和其他需要羅嗦的事情
 ------------------------------------
 
-有一些編輯器可以解釋嵌入在源文件裏的由一些特殊標記標明的配置信息。比如，emacs
+有一些編輯器可以解釋嵌入在原始檔裡的由一些特殊標記標明的設定資訊。比如，emacs
 能夠解析被標記成這樣的行：
 
 .. code-block:: c
@@ -969,29 +977,29 @@ Vim 能夠解析這樣的標記：
 
 	/* vim:set sw=8 noet */
 
-不要在源代碼中包含任何這樣的內容。每個人都有他自己的編輯器配置，你的源文件不
-應該覆蓋別人的配置。這包括有關縮進和模式配置的標記。人們可以使用他們自己定製
-的模式，或者使用其他可以產生正確的縮進的巧妙方法。
+不要在原始程式碼中包含任何這樣的內容。每個人都有他自己的編輯器設定，你的原
+始檔不應該覆蓋別人的設定。這包括有關縮排和模式設定的標記。人們可以使用他們
+自己定製的模式，或者使用其他可以產生正確的縮排的巧妙方法。
 
 
-20) 內聯彙編
+20) 行內組譯
 ------------
 
-在特定架構的代碼中，你可能需要內聯彙編與 CPU 和平臺相關功能連接。需要這麼做時
-就不要猶豫。然而，當 C 可以完成工作時，不要平白無故地使用內聯彙編。在可能的情
-況下，你可以並且應該用 C 和硬件溝通。
+在特定架構的程式碼中，你可能需要行內組譯與 CPU 和平臺相關功能連接。需要這
+麼做時就不要猶豫。然而，當 C 可以完成工作時，不要平白無故地使用行內組譯。
+在可能的情況下，你可以並且應該用 C 和硬體溝通。
 
-請考慮去寫捆綁通用位元 (wrap common bits) 的內聯彙編的簡單輔助函數，別去重複
-地寫下只有細微差異內聯彙編。記住內聯彙編可以使用 C 參數。
+請考慮去寫捆綁通用位元 (wrap common bits) 的行內組譯的簡單輔助函式，別去重複
+地寫下只有細微差異行內組譯。記住行內組譯可以使用 C 參數。
 
-大型，有一定複雜度的彙編函數應該放在 .S 文件內，用相應的 C 原型定義在 C 頭文
-件中。彙編函數的 C 原型應該使用 ``asmlinkage`` 。
+大型，有一定複雜度的組譯函式應該放在 .S 檔案內，用相應的 C 原型定義在 C 標頭
+檔中。組譯函式的 C 原型應該使用 ``asmlinkage`` 。
 
-你可能需要把彙編語句標記爲 volatile，用來阻止 GCC 在沒發現任何副作用後就把它
-移除了。你不必總是這樣做，儘管，這不必要的舉動會限制優化。
+你可能需要把組譯語句標記為 volatile，用來阻止 GCC 在沒發現任何副作用後就把它
+移除了。你不必總是這樣做，儘管，這不必要的舉動會限制最佳化。
 
-在寫一個包含多條指令的單個內聯彙編語句時，把每條指令用引號分割而且各佔一行，
-除了最後一條指令外，在每個指令結尾加上 ``\n\t`` ，讓彙編輸出時可以正確地縮進
+在寫一個包含多條指令的單個行內組譯語句時，把每條指令用引號分割而且各佔一行，
+除了最後一條指令外，在每個指令結尾加上 ``\n\t`` ，讓組譯輸出時可以正確地縮排
 下一條指令：
 
 .. code-block:: c
@@ -1004,21 +1012,21 @@ Vim 能夠解析這樣的標記：
 21) 條件編譯
 ------------
 
-只要可能，就不要在 .c 文件裏面使用預處理條件 (#if, #ifdef)；這樣做會讓代碼更難
-閱讀並且更難去跟蹤邏輯。替代方案是，在頭文件中用預處理條件提供給那些 .c 文件
-使用，再給 #else 提供一個空樁 (no-op stub) 版本，然後在 .c 文件內無條件地調用
-那些 (定義在頭文件內的) 函數。這樣做，編譯器會避免爲樁函數 (stub) 的調用生成
-任何代碼，產生的結果是相同的，但邏輯將更加清晰。
+只要可能，就不要在 .c 檔案裡面使用預處理條件 (#if, #ifdef)；這樣做會讓程式
+碼更難閱讀並且更難去追蹤邏輯。替代方案是，在標頭檔中用預處理條件提供給那些
+.c 檔案使用，再給 #else 提供一個空樁 (no-op stub) 版本，然後在 .c 檔案內無
+條件地呼叫那些 (定義在標頭檔內的) 函式。這樣做，編譯器會避免為樁函式 (stub
+) 的呼叫產生任何程式碼，產生的結果是相同的，但邏輯將更加清晰。
 
-最好傾向於編譯整個函數，而不是函數的一部分或表達式的一部分。與其放一個 ifdef
-在表達式內，不如分解出部分或全部表達式，放進一個單獨的輔助函數，並應用預處理
-條件到這個輔助函數內。
+最好傾向於編譯整個函式，而不是函式的一部分或表達式的一部分。與其放一個 ifdef
+在表達式內，不如分解出部分或全部表達式，放進一個單獨的輔助函式，並應用預處理
+條件到這個輔助函式內。
 
-如果你有一個在特定配置中，可能變成未使用的函數或變量，編譯器會警告它定義了但
-未使用，請把它標記爲 __maybe_unused 而不是將它包含在一個預處理條件中。(然而，
-如果一個函數或變量總是未使用，就直接刪除它。)
+如果你有一個在特定設定中，可能變成未使用的函式或變數，編譯器會警告它定義了但
+未使用，請把它標記為 __maybe_unused 而不是將它包含在一個預處理條件中。(然而，
+如果一個函式或變數總是未使用，就直接刪除它。)
 
-在代碼中，儘可能地使用 IS_ENABLED 宏來轉化某個 Kconfig 標記爲 C 的布爾
+在程式碼中，儘可能地使用 IS_ENABLED 巨集來轉化某個 Kconfig 標記為 C 的布林
 表達式，並在一般的 C 條件中使用它：
 
 .. code-block:: c
@@ -1027,13 +1035,13 @@ Vim 能夠解析這樣的標記：
 		...
 	}
 
-編譯器會做常量摺疊，然後就像使用 #ifdef 那樣去包含或排除代碼塊，所以這不會帶
-來任何運行時開銷。然而，這種方法依舊允許 C 編譯器查看塊內的代碼，並檢查它的正
-確性 (語法，類型，符號引用，等等)。因此，如果條件不滿足，代碼塊內的引用符號就
-不存在時，你還是必須去用 #ifdef。
+編譯器會做常數摺疊，然後就像使用 #ifdef 那樣去包含或排除程式碼塊，所以這不
+會帶來任何執行時開銷。然而，這種方法依舊允許 C 編譯器查看塊內的程式碼，並
+檢查它的正確性 (語法，類型，符號引用，等等)。因此，如果條件不滿足，程式碼
+塊內的引用符號就不存在時，你還是必須去用 #ifdef。
 
 在任何有意義的 #if 或 #ifdef 塊的末尾 (超過幾行的)，在 #endif 同一行的後面寫下
-註解，註釋這個條件表達式。例如：
+註解，註解這個條件表達式。例如：
 
 .. code-block:: c
 
@@ -1052,7 +1060,7 @@ ISBN 0-13-110362-8 (平裝), 0-13-110370-9 (精裝).
 
 .. note::
 
-    《C程序設計語言（第2版）》
+    《C程式設計語言（第2版）》
     作者：[美] Brian W. Kernighan / [美] Dennis M. Ritchie
     譯者：徐寶文 / 李志 / 尤晉元（審校）
     出版社：機械工業出版社，2019
@@ -1065,23 +1073,23 @@ ISBN 0-201-61586-X.
 
 .. note::
 
-    《程序設計實踐》
+    《程式設計實踐》
     作者：[美] Brian W. Kernighan / [美] Rob Pike
     出版社：機械工業出版社，2005
     ISBN：9787111091578
 
-    《程序設計實踐》
+    《程式設計實踐》
     作者：[美] Brian W. Kernighan / Rob Pike
     譯者：裘宗燕
     出版社：機械工業出版社，2000
     ISBN：9787111075738
 
-GNU 手冊 - 遵循 K&R 標準和此文本 - cpp, gcc, gcc internals and indent,
+GNU 手冊 - 遵循 K&R 標準和此文字 - cpp, gcc, gcc internals and indent,
 都可以從 https://www.gnu.org/manual/ 找到
 
 WG14 是 C 語言的國際標準化工作組，URL: http://www.open-std.org/JTC1/SC22/WG14/
 
-內核文檔 Documentation/process/coding-style.rst，
+核心文件 Documentation/process/coding-style.rst，
 作者 greg@kroah.com 發表於 OLS 2002：
 http://www.kroah.com/linux/talks/ols_2002_kernel_codingstyle_talk/html/
 
-- 
2.43.0

