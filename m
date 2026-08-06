Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C97A48D867
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 18:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040458; cv=none; b=PAHoB0ZY4PlaEQJSY5x7EcY5V62VxhdC/Eo49cqBNZeqhz1rOl5YuWwlaQIj/84L7YgVfA8u1++4wdpWEf368UMu8M8SX4f/k2pTjcsDeT2CW6D0n9BMpBAJqW+EfMeIKyu6g41UbNcGSpDl39gRahmIYpo+tivsi5vrPTbBI5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040458; c=relaxed/simple;
	bh=fc24/ydXdsc/JmrGkctCI/DW+v2npc81mW9btdpBgak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c+llYJHSUu4Q+zpA4QvC6EZMuaHVOuIix4AW0jdPpEXCG/wB3228tGpexn57QQ7APNoUAevNzPYJfnoFGtO7YWH87GYtQrsNckJNKZbIFqOwuAP0lUe6hCY2jtyRwvic5aCLbXd/Cgq2ntF0CvpM9NHG0l4X95tBtGHi70j4zeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pKgQm/1n; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pKgQm/1n"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38cfcb507a3so328507a91.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 11:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786040455; x=1786645255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DGu2S79yL1HgEPZ4kTlClgRXG4BWbzkRq+Jsg4mnFdU=;
        b=pKgQm/1nqPAmPzT28DKprSulplNPBsWVz+fgck7gPBty4RjEl3kD2t5jOM5oiiHkXp
         dGRswcwV8d6IxFBLmxn1gzteXROqI+sd8pBpdLPI6TyUMmZunVSlO8e9cSTxooJGLbsE
         5Jb8TKXg8UkLRtBEtsctAq74Wkd1D2iTg0Zar4yzyyR5UNSgNQN9tF3ZuDwbQHVkXDcM
         OGhzrOo17iw24ClDbZstUCifQtnRTC0ufyvydJOTlrVgDbqKWEV6UxRf7stAp9TA6S3U
         FEdDDJmgoifi/s1vP/bFBXmFUgts7boQ1Gkh1qwjmQbRVxLGA+vAXV5IOPQHAVlqgYSc
         g5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786040455; x=1786645255;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGu2S79yL1HgEPZ4kTlClgRXG4BWbzkRq+Jsg4mnFdU=;
        b=OuYl4Bh/6bf2GA8PCigI2SQCiZ2Y0uHuAA5tPdbteq518UdZRwiuu9mex731rTuHtp
         tjeJPeiPjhMHoySrkNh6oeLK1ylb9TJgBzQv2YhWX/F1VhUXOc4GFmTCGFc+Z3D3MIJ8
         W9vzAiToqTqIWI32gFlyIvuadX23ynxvEg2fjtYvyoWHEStausDpmStWX736av5J0/Rb
         +aXoBt71PjdfoDdGvhq5OEc6J7Ks4QtGhNMxlvUEfrD13P/BX0wN6RCJom1J9STzy17V
         PJkQh6erz8EuOFoiisfbc350Y/XtdsnEyiW7a49SWlUjTun9hsTfyP8iJJJlon7qDzH6
         VhUA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0L5mt4j1S9xLg9t/FiJKJz0z616t6CcZG8cwNDn01/DRkLev5bkvyuKfT8Uy7RtjuARiDZyIg+08=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcbvBiKt1ykLlSHI4/4aA7MNVcgYzZ0Yqu89jwd0s5/fVS2+Hm
	62+oy2ghJEKwaZT+qnbbQ2+/zafIh0Pb4IbDrnUyWqlKinl0RsBE8miP
X-Gm-Gg: AR+sD120MO3g702B/v1KVYpiMs353Li/s9lWrMT+0+xkzDWmYsDzto/LXlUucgRPydr
	+dCkskDmK3P9JGTeiWLPyi9kMPhCS+6TGMadqgp98+hLoAFBlDAhEFnICfUSVc5eZL2bmpBWqEn
	YL1JfCoyYe6e704m/AwtH1i1j8rNg/E9WbCCcT4dqsE2dnxgV1NkvjcfCbMLTeAyVWObkbTKGqw
	E7+DI6KCDb0x5VVbZ3q4Wzwwlm07XLaA9c6VU2VBo57quDcbrWUEWCG7rjSSbbF7SPrYmkSBIcd
	gAi5NhZh3yu6XbCrT9vnHE7Qtg1jowFTZcX+N5kzSQxqQdibPJMHIxjQ9Er+IcavimmqnwkO5BW
	jdJ73Gg6f720zI213A22zzTfUX/TLyYzxA5MPmzloyYsdRFFYpeQqPI6NS4k6xoBPmdJJfR2zQG
	xGawOKG0cpUwq5XnoaIJgwsaNchNpYFZSSPUQv58uCKUFhDY3tLpqBIGvAEi7tgTQhBt9/D7Mf9
	YYLLh59ARSE9JCY5AQixIUlymY73UTTrI8FBsRx+W2dz9A3N+/Ye6KK0wzNzjncvZjAG55PYlZI
	KhiWcdh+1z/o/uyimGI65SE=
X-Received: by 2002:a17:90b:5807:b0:38e:480b:99a5 with SMTP id 98e67ed59e1d1-3903c5fa99emr12190841a91.2.1786040455064;
        Thu, 06 Aug 2026 11:20:55 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085f2b2easm2003356a91.11.2026.08.06.11.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 11:20:53 -0700 (PDT)
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
Subject: [PATCH v3 14/16] docs/zh_TW: process: localize terminology in 8.Conclusion.rst
Date: Fri,  7 Aug 2026 02:19:47 +0800
Message-ID: <20260806181949.65648-15-chenyou910331@gmail.com>
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

Localize mainland terms to Taiwanese Mandarin (內核→核心, 代碼→程式碼,
軟件→軟體, ...), normalize character conventions (爲→為, 裏→裡, 啓→啟,
發佈→發布) to match the zh_TW glossary, fix the zh_CN cross-references
to zh_TW, and rephrase a few sentences for fluency.

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
Reviewed-by: Weijie Yuan <wy@wyuan.org>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/8.Conclusion.rst            | 58 ++++++++++---------
 1 file changed, 30 insertions(+), 28 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/8.Conclusion.rst b/Documentation/translations/zh_TW/process/8.Conclusion.rst
index d1634421b62c..8f9b4ec6845f 100644
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
 
-  http://lwn.net/kernel/index/
+  https://lwn.net/Kernel/Index/
 
-除此之外，內核開發人員的一個寶貴資源是：
+除此之外，核心開發人員的一個寶貴資源是：
 
   https://kernelnewbies.org/
 
-當然，也不應該忘記 https://kernel.org/ ，這是內核發佈信息的最終位置。
+當然，也不應該忘記 https://kernel.org/ ，這是核心發布資訊的最終位置。
 
-關於內核開發有很多書：
+關於核心開發有很多書：
 
-  《Linux設備驅動程序》第三版（Jonathan Corbet、Alessandro Rubini和Greg Kroah Hartman）
-  線上版本在 http://lwn.net/kernel/ldd3/
+  《Linux設備驅動程序》第三版（Jonathan Corbet、Alessandro Rubini和Greg Kroah-Hartman）
+  線上版本在 https://lwn.net/Kernel/LDD3/
 
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
 
@@ -58,16 +59,17 @@
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
+重要的是，Linux生態系統中的大多數其他參與者可以透過為核心做出貢獻而受益。
+使程式碼進入主線是提高程式碼品質、降低維護和分發成本、提高對核心開發方向的
+影響程度等的關鍵。這是一種共贏的局面。啟動你的編輯器，來加入我們吧；你會非
+常受歡迎的。
 
-- 
2.43.0

