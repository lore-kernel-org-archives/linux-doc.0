Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C0E48BD51
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 18:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040411; cv=none; b=TCbKEWGm5BUsNbjClLi7hMILXqCe6/zXwRQrXLz1kv/1sCMnr+Us6f2r/L0UWoREFWndZwndMdwPIFxHKm6cmFqs8x1cvC+jBNv19C13EVfhDS+zlXxoT0jmvMqh8CVeDYp28THBrClZjodO+A3DjCbfeB4Aq+tH28b63DW3DS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040411; c=relaxed/simple;
	bh=37Tad7zvtOWJjtYKXW0RPRLwy5ByI1BVQJCGSm9+St0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lz39D4mOho9FMOvwDB8DwGkWkEPt9Ly6huiNfVmgMPoRz4EpJYlvnRzgZxAYO9YXRLQAU7NOahyoF9Z2A8hK4ELzcrBSDd1dyBNvvCjcT5hMgZ8yIl80mDrJvnQpI9QGHUugxh2oak3ou6ntDeHRSuljsC+2S40siEvRpqZi350=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i0n358sl; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i0n358sl"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-385b78b4f9bso231213a91.2
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 11:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786040408; x=1786645208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CgLJbLrZ2Ru7EFBsYm5rkjINqpK3HEyla8bwbUrsEIc=;
        b=i0n358slCZK1PXSvG1MaGyg2UAM0EzUMGOK0fON9TaSizmPvLb5QbC9r/HnNXrf86S
         eCIDji9LAdGaP6VLcSId5y+GZTBaR7xezwL32WwhcUjA4eq/T+WujKLIVjGbr5fpaFqs
         flcjnC3y6ixb1qzBkkLHG60RA3W2dp/Au2QuJbIXGjlQIKczb+wr/gV8/t+9CkNqixQR
         jZV4wMm4AdUkLOT1lfbrMhHtLRGrYUI3RVrW3kwFByPo1zJ63TXh32QRTv3LtxC6ePD/
         CPeRUF+OfyHLeO583MZK08Y2mDnjxfcaWvykwMUcl4AW5ChGU1WZL8yI98qBBxplhsin
         iKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786040408; x=1786645208;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgLJbLrZ2Ru7EFBsYm5rkjINqpK3HEyla8bwbUrsEIc=;
        b=ifadNR1IWwIJLAa8abztkX0X6SEUKTQ9WEyeBOJzF2cEmfwPrF630ZouoRCr9H4Lre
         z9HctPY5mAkP0XRf56Gqnc6RkMgzR2Yrd76doK1ZejmpClYXFWwo22QX7Kn8dyt52u0j
         1zEG9RAgWTEzmK9gJ5k5QC8OPad+HD4+4E3CWT8criGQYaBnNKQdkbHCKNkkPXhEiHlY
         vLDC9MPGu2Rsx+Mh9KTqieL2Z7ICI5B6vl1jjNbO+Iw3pyZQbW3YtJ8JElz/gbwQFVyL
         n+XJJVkHZVnGxB3gTumIdcpcYEGUaLov0w67+hCS7tHQOE9YBEYZ8BrYtFNQ6RoCFCoE
         NLWA==
X-Forwarded-Encrypted: i=1; AHgh+Rr3x5aLOrYkb+fJ8sl0EF2YIPsqthsjlYnv01sniJbqvDA5yrSDZyoGhdFCWzOfYMSvUtRhQFpu3Ho=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY3JW/bK4Yn3pAbGFBjaemmEuuL/QHX3O2X5QCzVlttW4QE1s0
	gBn7FGgw4idUUYeU59S1evRRGSM37RQMJMCHSRm1EQacwP9ZHlLUMBH6
X-Gm-Gg: AR+sD11aruyveEuYzzolBt1X+Mv0zIEJwWreNAL/Ncw5tMkXvdEFbDsEvtxTvQk7Np/
	NKyYJHdYg8Y/3MqZvAONu4NOxipVFC53ehB48ahKYEUJEthDJEJesB2Q2362yMrUEI57CabN1yj
	oU6wTnfD3TSzTxeDDbQnfwTmk2W05UIoZmVATaLvh8Odp6TZlAWjIo5IsyAMVdWuFHoa5Eyzw0N
	VepN0auFz7efQa0dWBU/hxIHwnKEM5opBNbgbAmkvJ0psD9wKo9fw2GHYvhvaLIachPg2zdrg9F
	yCRXNMlQQDfkj43dP16OlvSP4jeHB9PiKfSs/TskEUSWsO2B4AMTIK+5dOSblAJP3A5soivErVW
	MmOWxrx/N9/F0vYPh9h2wcTSCduCga/NTyA3zA35qVwC4/iELuCihzqBfIz1FY6Dg7vIaZRWZ7C
	fikmsV/Deb1IN6Z08pWDYzPNRbvKUgTDeAxiju/4CUHGAFgUKAeH+JwqHBPeLIogRL9z24V67gb
	+V5M3Da1S5f3T5PYhi7Cduux5L6lHNuJZs8ODnb8aohYmCkKOCsTprCNzsJNmcopQRvmrjQ6m+n
	uKyUoJ+unrRbPwu5osn/deE=
X-Received: by 2002:a17:90b:3a81:b0:36d:b30b:14ed with SMTP id 98e67ed59e1d1-3903c6e93e6mr11885172a91.2.1786040408147;
        Thu, 06 Aug 2026 11:20:08 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085f2b2easm2003356a91.11.2026.08.06.11.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 11:20:07 -0700 (PDT)
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
Subject: [PATCH v3 02/16] docs/zh_TW: process: localize terminology in 1.Intro.rst
Date: Fri,  7 Aug 2026 02:19:35 +0800
Message-ID: <20260806181949.65648-3-chenyou910331@gmail.com>
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

Localize mainland terms to Taiwanese Mandarin (內核→核心, 軟件→軟體,
免費軟件→自由軟體, 操作系統→作業系統, 模塊→模組, 社區→社群, ...) and
sync with the English original: contributor identity wording now
follows commit 43e9076a00b1 ("docs: Fix conflicting contributor
identity info").

update to commit 5ce70894f6ca ("Doc: correct spelling and wording
mistakes")

Reviewed-by: Weijie Yuan <wy@wyuan.org>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/process/1.Intro.rst    | 235 +++++++++---------
 1 file changed, 120 insertions(+), 115 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/1.Intro.rst b/Documentation/translations/zh_TW/process/1.Intro.rst
index 345c4cbe9b55..2639ab99793f 100644
--- a/Documentation/translations/zh_TW/process/1.Intro.rst
+++ b/Documentation/translations/zh_TW/process/1.Intro.rst
@@ -12,6 +12,7 @@
 
  吳想成 Wu XiangCheng <bobwxc@email.cn>
  胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+ 葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
 
 .. _tw_development_process_intro:
 
@@ -21,179 +22,183 @@
 內容提要
 --------
 
-本節的其餘部分涵蓋了內核開發的過程，以及開發人員及其僱主在這方面可能遇到的
-各種問題。有很多原因使內核代碼應被合併到正式的（“主線”）內核中，包括對用戶
-的自動可用性、多種形式的社區支持以及影響內核開發方向的能力。提供給Linux內核
-的代碼必須在與GPL兼容的許可證下可用。
+本節的其餘部分涵蓋了核心開發的過程，以及開發人員及其僱主在這方面可能遇到的
+各種問題。有很多原因使核心程式碼應被合併到正式的（“主線”）核心中，包括對使用者
+的自動可用性、多種形式的社群支援以及影響核心開發方向的能力。提供給Linux核心
+的程式碼必須在與GPL相容的許可證下可用。
 
-:ref:`tw_development_process` 介紹了開發過程、內核發佈週期和合並窗口的機制。
-涵蓋了補丁開發、審查和合並週期中的各個階段。還有一些關於工具和郵件列表的討論？
-鼓勵希望開始內核開發的開發人員跟蹤並修復缺陷以作爲初步練習。
+:ref:`tw_development_process` 介紹了開發過程、核心發布週期和合併視窗的機制。
+涵蓋了補丁開發、審查和合併週期中的各個階段。還有一些關於工具和郵件列表的討論。
+鼓勵希望開始核心開發的開發人員追蹤並修復缺陷以作為初步練習。
 
 
-:ref:`tw_development_early_stage` 包括項目的早期規劃，重點是儘快讓開發社區
+:ref:`tw_development_early_stage` 包括專案的早期規劃，重點是儘快讓開發社群
 參與進來。
 
-:ref:`tw_development_coding` 是關於編程過程的；介紹了其他開發人員遇到的幾個
-陷阱。也涵蓋了對補丁的一些要求，並且介紹了一些工具，這些工具有助於確保內核
+:ref:`tw_development_coding` 是關於程式設計過程的；介紹了其他開發人員遇到的幾個
+陷阱。也涵蓋了對補丁的一些要求，並且介紹了一些工具，這些工具有助於確保核心
 補丁是正確的。
 
-:ref:`tw_development_posting` 描述發佈補丁以供評審的過程。爲了讓開發社區能
+:ref:`tw_development_posting` 描述發布補丁以供評審的過程。為了讓開發社群能
 認真對待，補丁必須被正確格式化和描述，並且必須發送到正確的地方。遵循本節中的
 建議有助於確保您的工作能被較好地接納。
 
-:ref:`tw_development_followthrough` 介紹了發佈補丁之後發生的事情；工作在這時
+:ref:`tw_development_followthrough` 介紹了發布補丁之後發生的事情；工作在這時
 還遠遠沒有完成。與審閱者一起工作是開發過程中的一個重要部分；本節提供了一些
 關於如何在這個重要階段避免問題的提示。當補丁被合併到主線中時，開發人員要注意
 不要假定任務已經完成。
 
-:ref:`tw_development_advancedtopics` 介紹了兩個“高級”主題：使用Git管理補丁
-和查看其他人發佈的補丁。
+:ref:`tw_development_advancedtopics` 介紹了兩個“進階”主題：使用Git管理補丁
+和查看其他人發布的補丁。
 
-:ref:`tw_development_conclusion` 總結了有關內核開發的更多信息，附帶有相關資源
-鏈接。
+:ref:`tw_development_conclusion` 總結了有關核心開發的更多資訊，附帶有相關資源
+連結。
 
-這個文檔是關於什麼的
+這個文件是關於什麼的
 --------------------
 
-Linux內核有超過800萬行代碼，每個版本的貢獻者超過1000人，是現存最大、最活躍的
-免費軟件項目之一。從1991年開始，這個內核已經發展成爲一個最好的操作系統組件，
-運行在袖珍數字音樂播放器、臺式電腦、現存最大的超級計算機以及所有類型的系統上。
-它是一種適用於幾乎任何情況的健壯、高效和可擴展的解決方案。
-
-隨着Linux的發展，希望參與其開發的開發人員（和公司）的數量也在增加。硬件供應商
-希望確保Linux能夠很好地支持他們的產品，使這些產品對Linux用戶具有吸引力。嵌入
-式系統供應商使用Linux作爲集成產品的組件，希望Linux能夠儘可能地勝任手頭的任務。
-分銷商和其他基於Linux的軟件供應商切實關心Linux內核的功能、性能和可靠性。最終
-用戶也常常希望修改Linux，使之能更好地滿足他們的需求。
-
-Linux最引人注目的特性之一是這些開發人員可以訪問它；任何具備必要技能的人都可以
-改進Linux並影響其開發方向。專有產品不能提供這種開放性，這是自由軟件的一個特點。
-如果有什麼不同的話，那就是內核比大多數其他自由軟件項目更開放。一個典型的三個
-月內核開發週期可以涉及1000多個開發人員，他們爲100多個不同的公司（或者根本不
-隸屬公司）工作。
-
-與內核開發社區合作並不是特別困難。但儘管如此，仍有許多潛在的貢獻者在嘗試做
-內核工作時遇到了困難。內核社區已經發展出自己獨特的操作方式，使其能夠在每天
-都要更改數千行代碼的環境中順利運行（並生成高質量的產品）。因此，Linux內核開發
-過程與專有的開發模式有很大的不同也就不足爲奇了。
-
-對於新開發人員來說，內核的開發過程可能會讓人感到奇怪和恐懼，但這背後有充分的
-理由和堅實的經驗。一個不瞭解內核社區工作方式的開發人員（或者更糟的是，他們
-試圖拋棄或規避之）會得到令人沮喪的體驗。開發社區在幫助那些試圖學習的人的同時，
+Linux核心有超過800萬行程式碼，每個版本的貢獻者超過1000人，是現存最大、最活躍的
+自由軟體專案之一。從1991年開始，這個核心已經發展成為一個最好的作業系統元件，
+執行在袖珍數位音樂播放器、桌上型電腦、現存最大的超級電腦以及所有類型的系統上。
+它是一種適用於幾乎任何情況的強健、高效和可擴展的解決方案。
+
+隨著Linux的發展，希望參與其開發的開發人員（和公司）的數量也在增加。硬體供應商
+希望確保Linux能夠很好地支援他們的產品，使這些產品對Linux使用者具有吸引力。嵌入
+式系統供應商使用Linux作為整合產品的元件，希望Linux能夠儘可能地勝任手頭的任務。
+分銷商和其他基於Linux的軟體供應商切實關心Linux核心的功能、效能和可靠性。最終
+使用者也常常希望修改Linux，使之能更好地滿足他們的需求。
+
+Linux最引人注目的特性之一是這些開發人員可以存取它；任何具備必要技能的人都
+可以改進Linux並影響其開發方向。專有產品不能提供這種開放性，這是自由軟體的
+一個特點。如果有什麼不同的話，那就是核心比大多數其他自由軟體專案更開放。一
+個典型的三個月核心開發週期可以涉及1000多個開發人員，他們為100多個不同的公
+司（或者根本不隸屬公司）工作。
+
+與核心開發社群合作並不是特別困難。但儘管如此，仍有許多潛在的貢獻者在嘗試做
+核心工作時遇到了困難。核心社群已經發展出自己獨特的操作方式，使其能夠在每天
+都要更改數千行程式碼的環境中順利執行（並產生高品質的產品）。因此，Linux核
+心開發過程與專有的開發模式有很大的不同也就不足為奇了。
+
+對於新開發人員來說，核心的開發過程可能會讓人感到奇怪和恐懼，但這背後有充分的
+理由和堅實的經驗。一個不瞭解核心社群工作方式的開發人員（或者更糟的是，他們
+試圖拋棄或規避之）會得到令人沮喪的體驗。開發社群在幫助那些試圖學習的人的同時，
 沒有時間幫助那些不願意傾聽或不關心開發過程的人。
 
 希望閱讀本文的人能夠避免這種令人沮喪的經歷。這些材料很長，但閱讀它們時所做的
-努力會在短時間內得到回報。開發社區總是需要能讓內核變更好的開發人員；下面的
-文字應該幫助您或爲您工作的人員加入我們的社區。
+努力會在短時間內得到回報。開發社群總是需要能讓核心變更好的開發人員；下面的
+文字應該幫助您或為您工作的人員加入我們的社群。
 
 致謝
 ----
 
-本文檔由Jonathan Corbet <corbet@lwn.net> 撰寫。以下人員的建議使之更爲完善：
+本文件由Jonathan Corbet <corbet@lwn.net> 撰寫。以下人員的建議使之更為完善：
 Johannes Berg, James Berry, Alex Chiang, Roland Dreier, Randy Dunlap,
 Jake Edge, Jiri Kosina, Matt Mackall, Arthur Marsh, Amanda McPherson,
 Andrew Morton, Andrew Price, Tsugikazu Shibata 和 Jochen Voß 。
 
-這項工作得到了Linux基金會的支持，特別感謝Amanda McPherson，他看到了這項工作
+這項工作得到了Linux基金會的支援，特別感謝Amanda McPherson，他看到了這項工作
 的價值並將其變成現實。
 
-代碼進入主線的重要性
---------------------
+程式碼進入主線的重要性
+----------------------
 
-有些公司和開發人員偶爾會想，爲什麼他們要費心學習如何與內核社區合作，並將代碼
-放入主線內核（“主線”是由Linus Torvalds維護的內核，Linux發行商將其用作基礎）。
-在短期內，貢獻代碼看起來像是一種可以避免的開銷；維護獨立代碼並直接支持用戶
-似乎更容易。事實上，保持代碼獨立（“樹外”）是在經濟上是錯誤的。
+有些公司和開發人員偶爾會想，為什麼他們要費心學習如何與核心社群合作，並將程
+式碼放入主線核心（“主線”是由Linus Torvalds維護的核心，Linux發行商將其用作
+基礎）。在短期內，貢獻程式碼看起來像是一種可以避免的開銷；維護獨立程式碼並
+直接支援使用者似乎更容易。事實上，保持程式碼獨立（“樹外”）是在經濟上是錯誤
+的。
 
-爲了說明樹外代碼成本，下面給出內核開發過程的一些相關方面；本文稍後將更詳細地
+為了說明樹外程式碼成本，下面給出核心開發過程的一些相關方面；本文稍後將更詳細地
 討論其中的大部分內容。請考慮：
 
-- 所有Linux用戶都可以使用合併到主線內核中的代碼。它將自動出現在所有啓用它的
-  發行版上。無需驅動程序磁盤、額外下載，也不需要爲多個發行版的多個版本提供
-  支持；這一切將方便所有開發人員和用戶。併入主線解決了大量的分發和支持問題。
+- 所有Linux使用者都可以使用合併到主線核心中的程式碼。它將自動出現在所有啟
+  用它的發行版上。無需驅動程式磁碟、額外下載，也不需要為多個發行版的多個版
+  本提供支援；這一切將方便所有開發人員和使用者。併入主線解決了大量的分發和
+  支援問題。
 
-- 當內核開發人員努力維護一個穩定的用戶空間接口時，內核內部API處於不斷變化之中。
-  不維持穩定的內部接口是一個慎重的設計決策；它允許在任何時候進行基本的改進，
-  併產出更高質量的代碼。但該策略導致結果是，若要使用新的內核，任何樹外代碼都
-  需要持續的維護。維護樹外代碼會需要大量的工作才能使代碼保持正常運行。
+- 當核心開發人員努力維護一個穩定的使用者空間介面時，核心內部API處於不斷變
+  化之中。不維持穩定的內部介面是一個慎重的設計決策；它允許在任何時候進行基
+  本的改進，並產出更高品質的程式碼。但該策略導致結果是，若要使用新的核心，
+  任何樹外程式碼都需要持續的維護。維護樹外程式碼會需要大量的工作才能使程式
+  碼保持正常執行。
 
-  相反，位於主線中的代碼不需要這樣做，因爲基本規則要求進行API更改的任何開發
-  人員也必須修復由於該更改而破壞的任何代碼。因此，合併到主線中的代碼大大降低
+  相反，位於主線中的程式碼不需要這樣做，因為基本規則要求進行API更改的任何開發
+  人員也必須修復由於該更改而破壞的任何程式碼。因此，合併到主線中的程式碼大大降低
   了維護成本。
 
-- 除此之外，內核中的代碼通常會被其他開發人員改進。您授權的用戶社區和客戶對您
-  產品的改進可能會令人驚喜。
+- 除此之外，核心中的程式碼通常會被其他開發人員改進。您授權的使用者社群和客
+  戶對您產品的改進可能會令人驚喜。
 
-- 內核代碼在合併到主線之前和之後都要經過審查。無論原始開發人員的技能有多強，
-  這個審查過程總是能找到改進代碼的方法。審查經常發現嚴重的錯誤和安全問題。
-  對於在封閉環境中開發的代碼尤其如此；這種代碼從外部開發人員的審查中獲益匪淺。
-  樹外代碼是低質量代碼。
+- 核心程式碼在合併到主線之前和之後都要經過審查。無論原始開發人員的技能有多
+  強，這個審查過程總是能找到改進程式碼的方法。審查經常發現嚴重的錯誤和安全
+  問題。對於在封閉環境中開發的程式碼尤其如此；這種程式碼從外部開發人員的審
+  查中獲益匪淺。樹外程式碼是低品質程式碼。
 
-- 參與開發過程是您影響內核開發方向的方式。旁觀者的抱怨會被聽到，但是活躍的
-  開發人員有更強的聲音——並且能夠實現使內核更好地滿足其需求的更改。
+- 參與開發過程是您影響核心開發方向的方式。旁觀者的抱怨會被聽到，但是活躍的
+  開發人員有更強的聲音——並且能夠實作使核心更好地滿足其需求的更改。
 
-- 當單獨維護代碼時，總是存在第三方爲類似功能提供不同實現的可能性。如果發生
-  這種情況，合併代碼將變得更加困難——甚至成爲不可能。之後，您將面臨以下令人
-  不快的選擇：（1）無限期地維護樹外的非標準特性，或（2）放棄代碼並將用戶遷移
-  到樹內版本。
+- 當單獨維護程式碼時，總是存在第三方為類似功能提供不同實作的可能性。如果發
+  生這種情況，合併程式碼將變得更加困難——甚至成為不可能。之後，您將面臨以下
+  令人不快的選擇：（1）無限期地維護樹外的非標準特性，或（2）放棄程式碼並將
+  使用者遷移到樹內版本。
 
-- 代碼的貢獻是使整個流程工作的根本。通過貢獻代碼，您可以向內核添加新功能，並
-  提供其他內核開發人員使用的功能和示例。如果您已經爲Linux開發了代碼（或者正在
-  考慮這樣做），那麼您顯然對這個平臺的持續成功感興趣；貢獻代碼是確保成功的
-  最好方法之一。
+- 程式碼的貢獻是使整個流程工作的根本。透過貢獻程式碼，您可以向核心添加新功
+  能，並提供其他核心開發人員使用的功能和範例。如果您已經為Linux開發了程式
+  碼（或者正在考慮這樣做），那麼您顯然對這個平臺的持續成功感興趣；貢獻程式
+  碼是確保成功的最好方法之一。
 
-上述所有理由都適用於任何樹外內核代碼，包括以專有的、僅二進制形式分發的代碼。
-然而，在考慮任何類型的純二進制內核代碼分佈之前，還需要考慮其他因素。包括：
+上述所有理由都適用於任何樹外核心程式碼，包括以專有的、僅二進位形式分發的程
+式碼。然而，在考慮任何類型的純二進位核心程式碼分發之前，還需要考慮其他因素。
+包括：
 
-- 圍繞專有內核模塊分發的法律問題其實較爲模糊；相當多的內核版權所有者認爲，
-  大多數僅二進制的模塊是內核的派生產品，因此，它們的分發違反了GNU通用公共
-  許可證（下面將詳細介紹）。本文作者不是律師，本文檔中的任何內容都不可能被
-  視爲法律建議。封閉源代碼模塊的真實法律地位只能由法院決定。但不管怎樣，困擾
-  這些模塊的不確定性仍然存在。
+- 圍繞專有核心模組分發的法律問題其實較為模糊；相當多的核心版權所有者認為，
+  大多數僅二進位的模組是核心的派生產品，因此，它們的分發違反了GNU通用公共
+  許可證（下面將詳細介紹）。本文作者不是律師，本文件中的任何內容都不可能被
+  視為法律建議。封閉原始程式碼模組的真實法律地位只能由法院決定。但不管怎樣，
+  困擾這些模組的不確定性仍然存在。
 
-- 二進制模塊大大增加了調試內核問題的難度，以至於大多數內核開發人員甚至都不會
-  嘗試。因此，只分發二進制模塊將使您的用戶更難從社區獲得支持。
+- 二進位模組大大增加了除錯核心問題的難度，以至於大多數核心開發人員甚至都不會
+  嘗試。因此，只分發二進位模組將使您的使用者更難從社群獲得支援。
 
-- 對於僅二進制的模塊的發行者來說，支持也更加困難，他們必須爲他們希望支持的
-  每個發行版和每個內核版本提供不同版本的模塊。爲了提供較爲全面的覆蓋範圍，
-  可能需要一個模塊的幾十個構建，並且每次升級內核時，您的用戶都必須單獨升級
-  這些模塊。
+- 對於僅二進位的模組的發行者來說，支援也更加困難，他們必須為他們希望支援的
+  每個發行版和每個核心版本提供不同版本的模組。為了提供較為全面的覆蓋範圍，
+  可能需要一個模組的幾十個建置，並且每次升級核心時，您的使用者都必須單獨升級
+  這些模組。
 
-- 上面提到的關於代碼評審的所有問題都更加存在於封閉源代碼中。由於該代碼根本
-  不可得，因此社區無法對其進行審查，毫無疑問，它將存在嚴重問題。
+- 上面提到的關於程式碼評審的所有問題都更加存在於封閉原始程式碼中。由於該程
+  式碼根本不可得，因此社群無法對其進行審查，毫無疑問，它將存在嚴重問題。
 
-尤其是嵌入式系統的製造商，可能會傾向於忽視本節中所說的大部分內容；因爲他們
-相信自己正在商用一種使用凍結內核版本的獨立產品，在發佈後不需要再進行開發。
-這個論點忽略了廣泛的代碼審查的價值以及允許用戶向產品添加功能的價值。但這些
-產品的商業壽命有限，之後必須發佈新版本的產品。在這一點上，代碼在主線上並得到
+尤其是嵌入式系統的製造商，可能會傾向於忽視本節中所說的大部分內容；因為他們
+相信自己正在商用一種使用凍結核心版本的獨立產品，在發布後不需要再進行開發。
+這個論點忽略了廣泛的程式碼審查的價值以及允許使用者向產品添加功能的價值。但這些
+產品的商業壽命有限，之後必須發布新版本的產品。在這一點上，程式碼在主線上並得到
 良好維護的供應商將能夠更好地佔位，以使新產品快速上市。
 
 許可
 ----
 
-代碼是根據一些許可證提供給Linux內核的，但是所有代碼都必須與GNU通用公共許可
-證（GPLV2）的版本2兼容，該版本是覆蓋整個內核分發的許可證。在實踐中，這意味
-着所有代碼貢獻都由GPLv2（可選地，語言允許在更高版本的GPL下分發）或3子句BSD
-許可（New BSD License，譯者注）覆蓋。任何不包含在兼容許可證中的貢獻都不會
-被接受到內核中。
+程式碼是根據一些許可證提供給Linux核心的，但是所有程式碼都必須與GNU通用公共許可
+證（GPLv2）的版本2相容，該版本是覆蓋整個核心分發的許可證。在實踐中，這意味
+著所有程式碼貢獻都由GPLv2（可選地，語言允許在更高版本的GPL下分發）或3子句BSD
+許可（New BSD License，譯者注）覆蓋。任何不包含在相容許可證中的貢獻都不會
+被接受到核心中。
 
-貢獻給內核的代碼不需要（或請求）版權分配。合併到主線內核中的所有代碼都保留
-其原始所有權；因此，內核現在擁有數千個所有者。
+貢獻給核心的程式碼不需要（或請求）版權分配。合併到主線核心中的所有程式碼都保留
+其原始所有權；因此，核心現在擁有數千個所有者。
 
-這種所有權結構也暗示着，任何改變內核許可的嘗試都註定會失敗。很少有實際情況
-可以獲得所有版權所有者的同意（或者從內核中刪除他們的代碼）。因此，尤其是在
+這種所有權結構也暗示著，任何改變核心許可的嘗試都註定會失敗。很少有實際情況
+可以獲得所有版權所有者的同意（或者從核心中刪除他們的程式碼）。因此，尤其是在
 可預見的將來，許可證不大可能遷移到GPL的版本3。
 
-所有貢獻給內核的代碼都必須是合法的免費軟件。因此，不接受匿名（或化名）貢獻
-者的代碼。所有貢獻者都需要在他們的代碼上“sign off（簽發）”，聲明代碼可以
-在GPL下與內核一起分發。無法提供未被其所有者許可爲免費軟件的代碼，或可能爲
-內核造成版權相關問題的代碼（例如，由缺乏適當保護的反向工程工作派生的代碼）
-不能被接受。
+所有貢獻給核心的程式碼都必須是合法的自由軟體。因此，不接受身分不明或匿名的
+貢獻者的程式碼。所有貢獻者都需要在他們的程式碼上“sign off（簽發）”，聲明程
+式碼可以在GPL下與核心一起分發。無法提供未被其所有者許可為自由軟體的程式碼，
+或可能為核心造成版權相關問題的程式碼（例如，由缺乏適當保護的反向工程工作派
+生的程式碼）不能被接受。
 
-有關版權問題的提問在Linux開發郵件列表中很常見。這樣的問題通常會得到不少答案，
-但請記住，回答這些問題的人不是律師，不能提供法律諮詢。如果您有關於Linux源代碼
-的法律問題，沒有什麼可以代替諮詢瞭解這一領域的律師。依賴從技術郵件列表中獲得
-的答案是一件冒險的事情。
+有關版權問題的提問在Linux開發郵件列表中很常見。這樣的問題通常會得到不少答
+案，但請記住，回答這些問題的人不是律師，不能提供法律諮詢。如果您有關於
+Linux原始程式碼的法律問題，沒有什麼可以代替諮詢瞭解這一領域的律師。依賴從
+技術郵件列表中獲得的答案是一件冒險的事情。
 
 
-- 
2.43.0

