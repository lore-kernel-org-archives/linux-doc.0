Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC7E42EEB8
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 21:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784671056; cv=none; b=dnKGEo2kMi5KX9PRx1DjedFDqYWMR0ei0S2qND0wR/7JqBd0zy3HZfJPUekOMXzxuVSBbIuKRwPr4e/5EIgjKR61nxgnzF0RE5Jee8BZVtuhXRrhR6Yi6Xw2pD5YXaZ0M8adtFoIjY/V/iiXMtQs/F5IgCuZ1QIGrH2ZY2Ha2qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784671056; c=relaxed/simple;
	bh=pDA7qBYeRZfUxmyuYITQBAyJUe559iEt60AH2a5YvOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CcaIK5holSRnKicFjpKA+cyRUQADtm35YX0WGVjRQCcUAW54SHIYFTU7bgOijRgCcVRQYjuJlVLiN21hSaECi5pbcUkrQT0yQV7GrPlcRfUhE+agTmkxODK0CtYpni9O2tFV2HYdHiwHI1G4/TqE0HcqhzckXK2HCsBJoAx7soY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjNNYUOD; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjNNYUOD"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc7a269ca1so26851465ad.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 14:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784671054; x=1785275854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tdxJytFj9nFRor5bRzMkCcDHTRtVEt/kv5Q2WxJVtZU=;
        b=kjNNYUODwW75MJGsrl99upw5RDFiefIxgMHdT8tY+AViBtBhsGxLu/PXaiL5kJFYO8
         s52JEXbDzpP4nD0srCZ0r+K0xNl+m+xno8y+O9yuShB4lwqPScGu2e3WoJxToJx7B0NV
         RGWAogYhcRymaswstdd6iTptT/cfJOkZ4HORC4WWsnvFNUBaBByFmK1+o4XR6mKlmSet
         JJlAMpIlDS2agXW/cwnVaNxZadV7fu4mCFEBYWXHvMyyX1oyPmzNOHj+OMUyON3M14E3
         XjvcTbqEDCrFvdgJUCN9bKl1uJy5zwW+ihUALOqrqq5z93CVGwMpODtWp4F7Xm5Bj5RO
         LuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784671054; x=1785275854;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdxJytFj9nFRor5bRzMkCcDHTRtVEt/kv5Q2WxJVtZU=;
        b=W0Cm9NXDqPZiJLaKeJijHrH1zFjNAsmQZMO3jsIRI+vfnbCInEgda6L2U7WFd0SGGP
         jGikErGODWXuIr93/wdo8N0JoyKbRTOoUkIHspdyoik2IU9MNVWZoSItTHpR0bjQVZbk
         1RSCpGDe5GC6OvS0gyE2UtHD6FFWnLITjoEe4ezbcl8xLRkYVCHxo2mgH0tcRDM2UJuK
         xjpNg3lj8ngPiI9Lf6vGU1xAk3nePhRu2myRDPc++05CSxTIALY4Lxyv8mz4LadYuGQf
         E/UJbDr8mt5DT3DfHRuxA2A3YoBHtYNl5tnZ3xGAgy1TuFJIyMC52yQJqRwk84WMoX78
         dg4g==
X-Forwarded-Encrypted: i=1; AHgh+RppS7wR3ifajFzClPA+0Il7h8xyq+eXvQcZmKnF0Q5xy0Eu5ggImLEixMqi67gEzYt0ev2UswuI3aE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiT2woqFiy42ABLceBJAACeOR1qfFTtGJtTDgmJ3/7dkqaMEdw
	N2OF/KuITL3kJIFVH6HlxMvNsNBTAGmI8pzbV6EBVyCjIyWnj9+jbR7x
X-Gm-Gg: AR+sD133SpzAnItlDBYb9lpUZZIBuMdpC0WhFsKFbK0ykAXUJ/Ns4E3TlM0Vj9kmioX
	640+NS9HI89HxBbULVMLDqmiKcMEyIKQbO+3TsBl+TIDA1x0Ph/yMZsEypsXZTXc2BXktjZD7WM
	HLbHC8Ue970ohhpczdVWw3jRw5c3aw/cboT/DcgtMy9t7RF9T3dsRmH7xJ1FMBDcKDeLZaynG4E
	T8b390q7pd93OFIzzSrTUQRU4uB2MnrQYx0SLJm9ALN2inOOP/czjnnWh36GxiTL/f809N9Ahqm
	RlLAWkwsz7GcAcvc0jafgGPsLb1eTs1x7DqmNfwxdr4SRQ21LhQNvvEOL1qJrto1zcdcwraSZev
	1SFrGBcfPGIZ7A9pI0JFkFOJBm02Apff+1CN0FV9Af8+1F+KEcbWxlGnS+wnenNyxuC8U1zU8gc
	4Uz+ypbtqxtFuiS21a/CGMQLh1oviuouU6SqKuoQpse1W6sI3w9VzbIJxnCrlWNc7r1ZzjG41cf
	7m8TaWMZRR+BsmjF7/iCsyPyi4I8Z1+BB0eO9Sn
X-Received: by 2002:a17:903:28c:b0:2cc:9d9:b8df with SMTP id d9443c01a7336-2cf8059ec4amr40869895ad.5.1784671053886;
        Tue, 21 Jul 2026 14:57:33 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8edea703sm3697115ad.0.2026.07.21.14.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:57:33 -0700 (PDT)
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
Subject: [PATCH 14/16] docs/zh_TW: process: localize terminology in 8.Conclusion.rst
Date: Wed, 22 Jul 2026 05:55:40 +0800
Message-ID: <20260721215542.98435-15-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721215542.98435-1-chenyou910331@gmail.com>
References: <20260721215542.98435-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Localize mainland terms to Taiwanese Mandarin (內核→核心, 代碼→程式碼,
軟件→軟體, ...), normalize character conventions (爲→為, 裏→裡, 啓→啟,
發佈→發布) to match the zh_TW glossary, fix the zh_CN cross-references
to zh_TW, and rephrase a few sentences for fluency.

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---

Note for reviewers: this differs from the version Dongliang Mu reviewed
in June. Beyond the terminology localization he reviewed, I additionally
normalized the character conventions (爲→為, 裏→裡, 啓→啟, 發佈→發布) to
match the new zh_TW glossary, changed the zh_CN cross-references to
zh_TW, restored the blank line before the LWN index URL (the reviewed
version dropped it and broke the RST rendering), and added myself to the
proofreader list. The Reviewed-by is kept as the terminology changes it
covered are unchanged; happy to drop it if preferred.
 .../zh_TW/process/8.Conclusion.rst            | 51 ++++++++++---------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/8.Conclusion.rst b/Documentation/translations/zh_TW/process/8.Conclusion.rst
index d1634421b62c..c95e2d1c7e81 100644
--- a/Documentation/translations/zh_TW/process/8.Conclusion.rst
+++ b/Documentation/translations/zh_TW/process/8.Conclusion.rst
@@ -11,45 +11,46 @@
 
  吳想成 Wu XiangCheng <bobwxc@email.cn>
  胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+ 葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
 
 .. _tw_development_conclusion:
 
-更多信息
+更多資訊
 ========
 
-關於Linux內核開發和相關主題的信息來源很多。首先是在內核源代碼分發中找到的
-文檔目錄。頂級
-:ref:`Documentation/translations/zh_CN/process/howto.rst <tw_process_howto>`
+關於Linux核心開發和相關主題的資訊來源很多。首先是在核心原始碼分發中找到的
+文件目錄。頂級
+:ref:`Documentation/translations/zh_TW/process/howto.rst <tw_process_howto>`
 文件是一個重要的起點；
-:ref:`Documentation/translations/zh_CN/process/submitting-patches.rst <tw_submittingpatches>`
-也是所有內核開發人員都應該閱讀的內容。許多內部內核API都是使用kerneldoc機制
-記錄的；“make htmldocs”或“make pdfdocs”可用於以HTML或PDF格式生成這些文檔
-（儘管某些發行版提供的tex版本會遇到內部限制，無法正確處理文檔）。
+:ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`
+也是所有核心開發人員都應該閱讀的內容。許多內部核心API都是使用kerneldoc機制
+記錄的；“make htmldocs”或“make pdfdocs”可用於以HTML或PDF格式產生這些文件
+（儘管某些發行版提供的tex版本會遇到內部限制，無法正確處理文件）。
 
-不同的網站在各個細節層次上討論內核開發。本文作者想謙虛地建議用 https://lwn.net/
-作爲來源；有關許多特定內核主題的信息可以通過以下網址的 LWN 內核索引找到：
+不同的網站在各個細節層次上討論核心開發。本文作者想謙虛地建議用 https://lwn.net/
+作為來源；有關許多特定核心主題的資訊可以透過以下網址的 LWN 核心索引找到：
 
   http://lwn.net/kernel/index/
 
-除此之外，內核開發人員的一個寶貴資源是：
+除此之外，核心開發人員的一個寶貴資源是：
 
   https://kernelnewbies.org/
 
-當然，也不應該忘記 https://kernel.org/ ，這是內核發佈信息的最終位置。
+當然，也不應該忘記 https://kernel.org/ ，這是核心發布資訊的最終位置。
 
-關於內核開發有很多書：
+關於核心開發有很多書：
 
   《Linux設備驅動程序》第三版（Jonathan Corbet、Alessandro Rubini和Greg Kroah Hartman）
   線上版本在 http://lwn.net/kernel/ldd3/
 
-  《Linux內核設計與實現》（Robert Love）
+  《Linux核心設計與實現》（Robert Love）
 
-  《深入理解Linux內核》(Daniel Bovet和Marco Cesati）
+  《深入理解Linux核心》(Daniel Bovet和Marco Cesati）
 
 然而，所有這些書都有一個共同的缺點：它們上架時就往往有些過時，而且已經上架
-一段時間了。不過，在那裏還是可以找到相當多的好信息。
+一段時間了。不過，在那裡還是可以找到相當多的好資訊。
 
-有關git的文檔，請訪問：
+有關git的文件，請造訪：
 
   https://www.kernel.org/pub/software/scm/git/docs/
 
@@ -58,16 +59,16 @@
 結論
 ====
 
-祝賀所有通過這篇冗長的文檔的人。希望它能夠幫助您理解Linux內核是如何開發的，
+祝賀所有通過這篇冗長的文件的人。希望它能夠幫助您理解Linux核心是如何開發的，
 以及您如何參與這個過程。
 
-最後，重要的是參與。任何開源軟件項目都不會超過其貢獻者投入其中的總和。Linux
-內核的發展速度和以前一樣快，因爲它得到了大量開發人員的幫助，他們都在努力使它
-變得更好。內核是一個最成功的例子，說明了當成千上萬的人爲了一個共同的目標一起
+最後，重要的是參與。任何開源軟體專案都不會超過其貢獻者投入其中的總和。Linux
+核心的發展速度和以前一樣快，因為它得到了大量開發人員的幫助，他們都在努力使它
+變得更好。核心是一個最成功的例子，說明了當成千上萬的人為了一個共同的目標一起
 工作時，可以做出什麼。
 
-不過，內核總是可以從更大的開發人員基礎中獲益。總有更多的工作要做。但是同樣
-重要的是，Linux生態系統中的大多數其他參與者可以通過爲內核做出貢獻而受益。使
-代碼進入主線是提高代碼質量、降低維護和分發成本、提高對內核開發方向的影響程度
-等的關鍵。這是一種共贏的局面。啓動你的編輯器，來加入我們吧；你會非常受歡迎的。
+不過，核心總是可以從更大的開發人員基礎中獲益。總有更多的工作要做。但是同樣
+重要的是，Linux生態系統中的大多數其他參與者可以透過為核心做出貢獻而受益。使
+程式碼進入主線是提高程式碼品質、降低維護和分發成本、提高對核心開發方向的影響程度
+等的關鍵。這是一種共贏的局面。啟動你的編輯器，來加入我們吧；你會非常受歡迎的。
 
-- 
2.43.0

