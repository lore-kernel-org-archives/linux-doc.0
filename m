Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E781DE8BE
	for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 04:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779941634; cv=none; b=Q43gJUc1xGz9B++Caz0A4W1TY2lGN9CLqhnXMg3mjusJlH2B5poy0vFOUKH212IQMq/DP/T2O2NeD7KGCyNClf641cE5mHUI9wPp4JVp8LTJnP85TWF9Q24g1O+VPURdEh3vwwOem6xfsV8mUR7NWXW9sif0VU1oisRPInVagIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779941634; c=relaxed/simple;
	bh=3sxy/ptsd9JNmHSavq8dpSfBiS/cgdIXqHvpW+8+/7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L1a7U5QNZtvQDulLquvMi1aO025PHUfLE21oX5A5385cr/pndDwydQP14wQeYu+NUcKy/hAklR7ibnPT8XsE94UyXQcILmu/YPj9rluYu57hLASSgKBhwQ3iuwVVkneRv3e5d6c2vWady+EFgc/QgPc/HF9kQUoYCmp4XcFsDuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hrUdK4yR; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hrUdK4yR"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36b74079f4dso124208a91.3
        for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 21:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779941632; x=1780546432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9uda8nJjXpuSG4eXnUMx2c5ozQnvdn6F8rS1KN+aDvo=;
        b=hrUdK4yRXDZgrI3U7bp2Hv6P2fIN1jq5kFfHK55e5miDsHCg9uuNMITFRn1CF+CCwh
         JF9k27XM999MJ+EEuXHsAAJsihagzWgKAQCHTD0vwajsz9kh2QSK7m9sHQOwsPB3DUfm
         mFODxEXyKyV2TDNmfLFUvNS8g/BGHECsXCTnrWhdlmmsmk5wURaBVdfXRQR+F9fKtvMJ
         oVvMu+m2sgORZ6/dqMbkqdsom6qX7DzW0xgKLB0tJpzsgxT7ovki0w+0GeLsxnyoLtIp
         92TjtsAizK9MElqN807iGFbr2V/AFfnGASCGU/felW1FPYplwVm5aCdymXxqqRG0yW9A
         Q8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779941632; x=1780546432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uda8nJjXpuSG4eXnUMx2c5ozQnvdn6F8rS1KN+aDvo=;
        b=azvfGaH1F9mTj8NCqSWBptRjv9Z7xw55GSviqfglV7wnT9BTv9X9wJg/Z1cnvwyyW4
         yZ4BXdBAEI6yUimV8JFF6kVSmKZC6qPf7x4MFuHDEGkG8EIDUhV2nnH0uqa1tAJo5041
         K55aEL0KTGYP/vvIFxkd0PvBRiiN1xeckvS+2xEbih+7iSdisW/OHvFUuyxZnVSY/n53
         DdSjHF0G//YszQPd0vQb3p7Z/O5O57O8JvCzahurEMUKS5j9zTBsPP8vTc7oQyTrcCnN
         GEh6MnPmh2xDoAXAtkZwrz88v6H6q0mTXkFgTuYt4ofLF9Gb3xDs2XpImZ75zVlunRmC
         ES9g==
X-Forwarded-Encrypted: i=1; AFNElJ83JQ/FrYxR0WtPAEtV7sVk3hPffsd2DEGK7VWrXcdou++WePBC/rgh3ufYaRE8MczXme/L/LJEuKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTRjLbCAcdQBNURn/sVxcykmY8jce2a9XsO+T988Uj2hXBLcpU
	UmvkEN7fkHSRvYtViBkBXXVRQ+8ksYAZR9xdODxeYfITfMgYrr3TtHyF
X-Gm-Gg: Acq92OHPw3cvOS/DSvqk/773K886SbgSkhyyx4q8S9Oirgm4xS9+nrrn+0uPPDofTSm
	L3F2N/0uIkYCl1WaVqP606dUk+ERIQd72DGdkGCGBywLW5W1V34OSnjH6gs4KK1pKpkFFPNLAnV
	vuuuX+dWOQ/HUtprSdC2C6pi5ImA3a3S0Vqtz0sbAER3mIrx6WJABwXI3RLxJWXLt7ArvtEzZoK
	bLnEbdjDqvSNFny1vw6MqSay1vjZda77gDL1kXZVivQHoOnClls+T9u6VxPuLZt+Ftp4VfwegG9
	xmf9kHnlw3FgqUorSLwPIg6gsYaScCSBnzTv2xwXQjjFxpZdadjscvq1XtHei4ssjEZ3S3VIvvG
	MMPqjmjkELA6kq5FgPVQyUouklwOWD3E+PdnDnYkhxZn0A2HnqZ1p1iOn8+IsyjF1pyZrjwiPDp
	R8Nd+M64zGa8kZIYZJ02x3pMm6h4DrP1O0nYG/efKDMeMpzO8=
X-Received: by 2002:a17:90b:548c:b0:368:bbd1:52c3 with SMTP id 98e67ed59e1d1-36b851ff6bemr842569a91.8.1779941632165;
        Wed, 27 May 2026 21:13:52 -0700 (PDT)
Received: from chenyou.. ([140.116.78.205])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b9096a918sm433136a91.16.2026.05.27.21.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 21:13:51 -0700 (PDT)
From: CHEN-YOU-0331 <chenyou910331@gmail.com>
To: Hu Haowen <2023002089@link.tyut.edu.cn>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	CHEN-YOU-0331 <chenyou910331@gmail.com>
Subject: [PATCH] docs: zh_TW: process: localize terminologies and improve fluency in 8.Conclusion
Date: Thu, 28 May 2026 12:13:30 +0800
Message-ID: <20260528041330.23247-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate PRC tech terms into Taiwanese tech terms (e.g.,
內核 -> 核心, 代碼 -> 程式碼, 軟件 -> 軟體) to improve
readability for local developers. Also, rephrase several
awkward sentences to make the document more fluent.

Signed-off-by: CHEN-YOU-0331 <chenyou910331@gmail.com>
---
 .../zh_TW/process/8.Conclusion.rst            | 45 +++++++++----------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/8.Conclusion.rst b/Documentation/translations/zh_TW/process/8.Conclusion.rst
index d1634421b62c..823969cf793d 100644
--- a/Documentation/translations/zh_TW/process/8.Conclusion.rst
+++ b/Documentation/translations/zh_TW/process/8.Conclusion.rst
@@ -14,42 +14,41 @@
 
 .. _tw_development_conclusion:
 
-更多信息
+更多資訊
 ========
 
-關於Linux內核開發和相關主題的信息來源很多。首先是在內核源代碼分發中找到的
-文檔目錄。頂級
+關於Linux核心開發和相關主題的資訊來源很多。首先是在核心原始碼分發中找到的
+文件目錄。頂級
 :ref:`Documentation/translations/zh_CN/process/howto.rst <tw_process_howto>`
 文件是一個重要的起點；
 :ref:`Documentation/translations/zh_CN/process/submitting-patches.rst <tw_submittingpatches>`
-也是所有內核開發人員都應該閱讀的內容。許多內部內核API都是使用kerneldoc機制
-記錄的；“make htmldocs”或“make pdfdocs”可用於以HTML或PDF格式生成這些文檔
-（儘管某些發行版提供的tex版本會遇到內部限制，無法正確處理文檔）。
-
-不同的網站在各個細節層次上討論內核開發。本文作者想謙虛地建議用 https://lwn.net/
-作爲來源；有關許多特定內核主題的信息可以通過以下網址的 LWN 內核索引找到：
+也是所有核心開發人員都應該閱讀的內容。許多內部核心API都是使用kerneldoc機制
+記錄的；“make htmldocs”或“make pdfdocs”可用於以HTML或PDF格式生成這些文件
+（儘管某些發行版提供的tex版本會遇到內部限制，無法正確處理文件）。
 
+不同的網站在各個細節層次上討論核心開發。本文作者想謙虛地建議用 https://lwn.net/
+作爲來源；有關許多特定核心主題的資訊可以通過以下網址的 LWN 核心索引找到:
   http://lwn.net/kernel/index/
 
-除此之外，內核開發人員的一個寶貴資源是：
+除此之外，核心開發人員的一個寶貴資源是：
 
   https://kernelnewbies.org/
 
-當然，也不應該忘記 https://kernel.org/ ，這是內核發佈信息的最終位置。
+當然，也不應該忘記 https://kernel.org/ ，這是核心發佈資訊的最終位置。
 
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
+一段時間了。不過，在那裏還是可以找到相當多的好資訊。
 
-有關git的文檔，請訪問：
+有關git的文件，請訪問：
 
   https://www.kernel.org/pub/software/scm/git/docs/
 
@@ -58,16 +57,16 @@
 結論
 ====
 
-祝賀所有通過這篇冗長的文檔的人。希望它能夠幫助您理解Linux內核是如何開發的，
+祝賀所有通過這篇冗長的文件的人。希望它能夠幫助您理解Linux核心是如何開發的，
 以及您如何參與這個過程。
 
-最後，重要的是參與。任何開源軟件項目都不會超過其貢獻者投入其中的總和。Linux
-內核的發展速度和以前一樣快，因爲它得到了大量開發人員的幫助，他們都在努力使它
-變得更好。內核是一個最成功的例子，說明了當成千上萬的人爲了一個共同的目標一起
+最後，重要的是參與。任何開源軟體專案都不會超過其貢獻者投入其中的總和。Linux
+核心的發展速度和以前一樣快，因爲它得到了大量開發人員的幫助，他們都在努力使它
+變得更好。核心是一個最成功的例子，說明了當成千上萬的人爲了一個共同的目標一起
 工作時，可以做出什麼。
 
-不過，內核總是可以從更大的開發人員基礎中獲益。總有更多的工作要做。但是同樣
-重要的是，Linux生態系統中的大多數其他參與者可以通過爲內核做出貢獻而受益。使
-代碼進入主線是提高代碼質量、降低維護和分發成本、提高對內核開發方向的影響程度
+不過，核心總是可以從更大的開發人員基礎中獲益。總有更多的工作要做。但是同樣
+重要的是，Linux生態系統中的大多數其他參與者可以通過爲核心做出貢獻而受益。使
+程式碼進入主線是提高程式碼品質、降低維護和分發成本、提高對核心開發方向的影響程度
 等的關鍵。這是一種共贏的局面。啓動你的編輯器，來加入我們吧；你會非常受歡迎的。
 
-- 
2.43.0

