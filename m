Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431768;
	b=OqA1zEMXNBuSyZj8q6tohDvZNsf65ZpE7MUU47dw6O+YxxwMkJKbJjb9CzpYISoPI5ue
	 RC5vowclgINJ0W5iemHzEieoVinlAJZivSSdaymoB1yONks1hshwwcsxs7CsxczIMY2wZ
	 dj28wMM8V99AAVVzHKcpKw8g+d2hBYNb4soN38XPGOW+UP9Jj9E3uBgvMtDlp/OUkDFlT
	 d74saetU5gfEQpb7CKqKzAxzaC6DMvwf2J6VbWW7+zTfP/KQU4EGvgOtXtIsV0kjhWq6Y
	 ZWlMeyDY0rKnQ3NqtpR3zqmNadwK+dskeD1XcdnF2F1phrxTvV/F8EvPnoBVs/opclw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6jBC/pBEW6tYgxH37sEhPb6qD30sa5Ji6tQCEaIdAGU=;
	b=e7xnFPh8K8m/hxdhdfaGtojTaz+Lm/ZKZYJ1AtLt3mxe3TzbYdsAiIVEx/4KWF7alety
	 xMMtDKJw0s+fOtGL9+LZdjhPUe6SH5R0hhCWd0MdckSU38jrk/W58qjN/yF/nI9gfWk5C
	 ZgnWn4b225hjAALemJ1YsF7K7urAd3QnpMeuw5rm6j83gtbe72DdKJfgnTajnoZDjIpUB
	 lr9tpKJ/vtxPcemUfyutXHWjntm7NiDOECBlxz0UXvVMmqxZKSmJkF90456nZssPgpX9d
	 u9l4Zt3v1ESCECObDh6uHDbBL4hXL4QwIMbUd01CzxKTKSTgU+PMn0noq9BoRhRCN1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YlGkbCal;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208C2606A33A
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 208C2606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YlGkbCal
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f05e191b2fso1102065ad.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 03:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795431767; x=1796036567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6jBC/pBEW6tYgxH37sEhPb6qD30sa5Ji6tQCEaIdAGU=;
        b=YlGkbCalmmbY1KS03lHZeM2uOkAZimmPVuxZtwqkBZthDiNoSrxrX12MgKNBANEJ2s
         egLHnVxXnNbrfvqNqEvMvezAwheoE2lFMekgH0VmiCSWHCf8q5rh/vkrTSpoETyrTWKV
         grvfCC53MGwDHJvYJJAmfzXdGXYN4PRYrEjlQRdU/wlhZAva4NjLsSaeNfj28Qo6sltp
         fe/uIyt7OzsUzIENgbugbsboIVDfNXHruVG+0c++7uQou3GYbJo0dAEv/ln6GXxlFwqP
         eOK9A9vRq46fIqK+9rQEkj8RP5Mv/UHMgB3cKFpq451GRfcUo7fEYaNGet9AsFHo+yil
         HOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431767; x=1796036567;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6jBC/pBEW6tYgxH37sEhPb6qD30sa5Ji6tQCEaIdAGU=;
        b=CwMCft00+/0STxf4gNpf227bZIPy7JXq6+DIzTzSprGLcmDcaJb0NfKB//kEgzPF4d
         6IEuEAIz3mC0KDo+WhrvzVCfinqcBUtZs+SU7sqmYGDDvuwiYyBgsbitKMpxITiplNYM
         0m1cNhwqVnc7GLf2+ujZkhn8rY5qexbQ89mfFN8BLjkdhR+SAfnfuq5EIIqzYWYJzCOK
         zjYNVV8ylpXm+/2UPTwaIRiWMRvbH6gtqdpjjJLmTXuS7xkOl0tDsH6C/pdIBxMY2PKk
         opY+N5QHmyh9cWNDJlqxzP+DgZs0qVM8mS5vKXGuMidtP+Stua3vrcmYxMmT9q3SzKsp
         SdBQ==
X-Forwarded-Encrypted: i=1; AL+hErEgwcR8TTs2CBjqbi1bPdVZ9ThNIL2fyXxRw+rTaIhhWQxQjq3Mb+JbOThL7suS0p7zdNlIOxRgQo0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aNiY16/RpJnGT5sVAhSsN9QYUOEHGZF97c7PJ+3wWREWGrHv+
	fM9TTuWfNHXSecC2AwuGKJwV4lFPEpT6CIkkBNmAU3nPkoAetOmIrd8u
X-Gm-Gg: AZFdTZe5BmauPzfAbAzR+ItqgNkoc28n/lv+CXqWW2LDQ4WtBzDvvGu/mMZEkv/E6Tk
	Vf+YwBwzEsss0L/BdH8o1KyoqqgnkNliPC+viC0tWjhrIQ6vWR4iBMI78tn+22drZ7DvIUCrWpW
	MA9zbWIwjrrNk5mwR5vGMpjjgyXAdVlIeDbXzXAPcF8ZqtFQfHOgxuRP1mdzM84vFvMJ9JmdqYv
	wfHl+gMze5tJJ/QP5Y3UshfVOJB3+VFf/jUFGQoPoixo1QFYijR2DNiTKWDMrayU/TPAubq3Mqb
	kFLX5LNUdpFsUGOl28G0LezwYVO4IfSoXudOqjiYDwLku2OaTYq3P3p9caY6k4aIBfU/9pG2oKX
	UpKiZhkDz5mSrJoJWPWzzxgHAMjumciqTuWBRu7QkQiLOrvkx2iZfrVb9Bi62lWVn88+nSP6nL6
	BYj3MjoiuHLr+EmD02TAU98mxWsjVJWf5f/Fqm/RyQmFeLwayFlz5Tq0QLAI51Q0b+TCEasN2Cu
	DXYKcJHycPB7XjTMWadXuGU4tnL5AWNF4ykioy3g/ZUZSbTmpyqC2Ofo46rTdQ4IPdZRzepKQc8
	WdcuKcUfJrTxK2IWk9mDaR6XJ4kqE9fI8f6zGNyY7yMFRlE5OrXtvbBQAeUfmF1GqvzjIQpArFn
	mlLdpI8BPG6Tyx+9mzqDdsKz0
X-Received: by 2002:a17:903:1c9:b0:2e9:5714:607b with SMTP id d9443c01a7336-2f03ee6aec7mr177577965ad.0.1795431767354;
        Mon, 23 Nov 2026 03:02:47 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1aa3sm50380785ad.21.2026.11.23.03.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:02:46 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: alexs@kernel.org,
	corbet@lwn.net
Cc: wy@wyuan.org,
	dzm91@hust.edu.cn,
	si.yanteng@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 07/25] docs/zh_TW: process: sync 8.Conclusion.rst with the English original
Date: Mon, 23 Nov 2026 19:01:58 +0800
Message-ID: <20261123110217.170025-8-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123110217.170025-1-chenyou910331@gmail.com>
References: <20261123110217.170025-1-chenyou910331@gmail.com>
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

The translation carried no "update to commit" marker.  Its first
paragraph still followed the wording from before
commit 9db370de2780 ("docs: process: remove outdated
submitting-drivers.rst"): it called howto.rst "an important starting
point" and described submitting-patches.rst as "something which all
kernel developers should read", while the English text now simply says
to start with howto.rst and also read submitting-patches.rst.  A
section-by-section comparison against the current English text brings it
in line with the full current original:

- retranslate the opening paragraph to match the current wording, and
  write TeX as in the original
- retranslate the sentence on why the kernel has progressed as quickly
  and as well as it has, which had been rendered as "as fast as before"
- wrap the :Original: line, the cross-references and the LDD3 entry to
  keep them within 80 columns, as in 7.AdvancedTopics.rst and
  5.Posting.rst

update to commit 9db370de2780 ("docs: process: remove outdated
submitting-drivers.rst")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/8.Conclusion.rst            | 25 ++++++++++---------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/8.Conclusion.rst b/Documentation/translations/zh_TW/process/8.Conclusion.rst
index 2436263c6506..e0737d6e83e8 100644
--- a/Documentation/translations/zh_TW/process/8.Conclusion.rst
+++ b/Documentation/translations/zh_TW/process/8.Conclusion.rst
@@ -2,7 +2,8 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
-:Original: :ref:`Documentation/process/8.Conclusion.rst <development_conclusion>`
+:Original: :ref:`Documentation/process/8.Conclusion.rst
+           <development_conclusion>`
 
 .. _tw_development_conclusion:
 
@@ -10,13 +11,13 @@
 ========
 
 關於Linux核心開發和相關主題的資訊來源很多。首先是在核心原始碼分發中找到的
-文件目錄。頂級
+文件目錄。請從頂層的
 :ref:`Documentation/translations/zh_TW/process/howto.rst <tw_process_howto>`
-文件是一個重要的起點；
-:ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`
-也是所有核心開發人員都應該閱讀的內容。許多內部核心API都是使用kerneldoc機制
-記錄的；“make htmldocs”或“make pdfdocs”可用於以HTML或PDF格式產生這些文件
-（儘管某些發行版提供的tex版本會遇到內部限制，無法正確處理文件）。
+開始；也請閱讀
+:ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`。
+許多內部核心 API 都是使用 kerneldoc 機制記錄的；“make htmldocs”或“make pdfdocs”
+可用於以 HTML 或 PDF 格式產生這些文件（儘管某些發行版提供的 TeX 版本會遇到內部
+限制，無法正確處理文件）。
 
 不同的網站在各個細節層次上討論核心開發。本文作者想謙虛地建議用 https://lwn.net/
 作為來源；有關許多特定核心主題的資訊可以透過以下網址的 LWN 核心索引找到：
@@ -31,8 +32,8 @@
 
 關於核心開發有很多書：
 
-  《Linux設備驅動程序》第三版（Jonathan Corbet、Alessandro Rubini和Greg Kroah-Hartman）
-  線上版本在 https://lwn.net/Kernel/LDD3/
+  《Linux設備驅動程序》第三版（Jonathan Corbet、Alessandro Rubini和
+  Greg Kroah-Hartman）。線上版本在 https://lwn.net/Kernel/LDD3/ 。
 
   《Linux核心設計與實現》（Robert Love）
 
@@ -54,9 +55,9 @@
 以及您如何參與這個過程。
 
 最後，重要的是參與。任何開源軟體專案都不會超過其貢獻者投入其中的總和。Linux
-核心的發展速度和以前一樣快，因為它得到了大量開發人員的幫助，他們都在努力使它
-變得更好。核心是一個最成功的例子，說明了當成千上萬的人為了一個共同的目標一起
-工作時，可以做出什麼。
+核心之所以能發展得如此迅速、如此良好，是因為有一大群人數驚人的開發人員協助，
+他們都在努力使它變得更好。核心是一個最成功的例子，說明了當成千上萬的人為了一個
+共同的目標一起工作時，可以做出什麼。
 
 不過，核心總是可以從更大的開發人員基礎中獲益。總有更多的工作要做。但是同樣
 重要的是，Linux生態系統中的大多數其他參與者可以透過為核心做出貢獻而受益。
-- 
2.43.0

