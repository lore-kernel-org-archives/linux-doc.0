Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C62409131
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 08:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780475171; cv=none; b=pqm4RvPcGrccg0cGQLdt4B9WMHm9pdRLkMRMM03Rrkjico11xKyfYNLQN9RE1X+l4a4//qQBc8s/hY1nCLYvFW4Mw7CNxnNbfTpN+Al1gnAmQ+3ZEbDnBYeZaw7/3z5vOZt7jkEGFCtPjRBHPzk0rd5EJEyBsQ312RuDO8DRolY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780475171; c=relaxed/simple;
	bh=8MXFa6E6lDTrtMNCF0ZjM05Q3pv6a29RGqXW5a9j+vQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=scHjx3LkKAPeeFpyiyxoic8Mo4K6AR7zgZ/8WgHoPkzdVyeMtukAn1q7DZG6VbggFt2Z3nUbggYvotlSwSXjU0XcROGkGWVEe4Zwi0mF4wKkxpCYwPnidzqVV2tKaSVg6xVctCgSetqePOMFHXjXkaNakLuaZ9j036yKEjE6T3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMq82bva; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMq82bva"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0c274f362so9348455ad.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 01:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780475169; x=1781079969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=poqXYmcV1S8YoTgPs8oSe57Txq9QDdWZJNRt5FXW3yU=;
        b=TMq82bvaUkk5qHTj0/VTblTwwamb+NbYoFHHskrsr3KcgB+tH60HIjusY+jgclyewM
         p/2jgrgxqQ7TP7YuM//HJBr9JTaAL4oN74P6nEYgoI5vX80SrNrCBtVUSPbfQFJ3KdCJ
         VVYAbkzaszZQfivgasA3/UgWDxuSg+hw7wgeWIiX8zzGbWM0Uh5WzH9Mp1LdySE21kRC
         sJtzsmteiFBR1ZQbhxPZ/MPVoiQ06/Drkv7tnbCByhJsAQe9vtVMOn8WshX9aShPL8HU
         SvbL7H/1Xh8Unz1LR5KykrRihgnn5SnPmu8HKKbhEkVO3wdWw2ZhJoowlUqbPmZ+0Esl
         jArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780475169; x=1781079969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=poqXYmcV1S8YoTgPs8oSe57Txq9QDdWZJNRt5FXW3yU=;
        b=glUEwhJpIV4rzhCZeQ4fYkaSyDFn/6Dtcf2pfBZfqvt/4Zrghm6d2PHJsAcz+OSj59
         X8TrTDDEWe9Rcw6PqXmVJVFvYsYys8c4lD23QDcodkwKyh79n1YPc9+YmUHJwc26sKm9
         m7lh8W/xZ2sdj8S1DaSB1z8SyaBku9gNH6U4C7V1oEntvo/MSjl2P9AH8T7litMdOCRw
         /tFUeWczJ5E0l0M9PdFBBd3r25ohNYw2AUGRtm/io0flYZLSwjIu2jvoU8zhKkjmyvqd
         kffyRXEoTGJjauWg9YwHYj9O4/ZIyD34oBdYU5UxTzjuedm29e08/9kq+ljg+GK8JZQb
         2PAg==
X-Forwarded-Encrypted: i=1; AFNElJ/lZwHlmTjJHAiLvxPS758YVSIs6q7i3Q9vt2FvIcr8bq0b9vm2P1sNocRdJ/m9Sips40IO+hsCLTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRmFS8VR2vh6AqxryL/6z+eJipMjVKUImyT7fzr6w3/+4vh9pX
	C2XCGb3O5yPvXfvi8K/Ua5lrA/UwIYpd89bj54QYYwF08NmCYuqZelIEhsxyoAwDH2E=
X-Gm-Gg: Acq92OGskAdmQz3YJ+3jvu3oe/0etHEDobUzsehov3cE/pva43VOj0oNwOZtDZCZ/ZA
	nlKJSu0S7I/9J/44VBLwsy+LVz1VNuC4E9XIPt/UOKtp+TkqplvVo1q1brREN+AnB11Lp8/K7MM
	red7utLb0IP2KGtkeqFg1tuECQh1TkNZYJczGXmyGoNafN2EuQcWiYpbMUXb5w74VbVaG7z47LW
	0Fgyyot8ERPRnswj9pGghun1haG+M3dwCdgaNcv+vqNMTZstVNhMKl+xh0ZzEaZijukm18J/ppK
	P3o/sbm3/tcFOo631lRuQtX52GiWx7M/ffAwlU9MLg5uLVXTQUGmFN4tr7LyKtB086kYPeI0sQo
	99k/imDPhLuFH+WPHkwHPGVYQ+3b6fG3hzrnmPPP0utyKtxLKnDc0iiBwEuZrRoML5Hqqd0nupY
	ZFp5mW9FlNKXesJrt+gqnsTddZ8y6jw0TNHSck
X-Received: by 2002:a05:6a21:685:b0:3b3:cff:cb5d with SMTP id adf61e73a8af0-3b493e3de46mr1845483637.2.1780475169453;
        Wed, 03 Jun 2026 01:26:09 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842822222ccsm2550819b3a.3.2026.06.03.01.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:26:08 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Hu Haowen <2023002089@link.tyut.edu.cn>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dongliang Mu <mudongliangabcd@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>,
	Dongliang Mu <dzm91@hust.edu.cn>
Subject: [PATCH v2] docs: zh_TW: process: localize terminologies and improve fluency in 8.Conclusion
Date: Wed,  3 Jun 2026 16:25:31 +0800
Message-ID: <20260603082531.263115-1-chenyou910331@gmail.com>
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

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
Changes in v2:
- Update Signed-off-by to use full real name.
- Add Reviewed-by tag from Dongliang Mu.

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

