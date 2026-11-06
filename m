Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964991;
	b=hWxnKl3S7LCTZiFB4mZfyKLUzmGELnB9gmnB1IjPYoW7zBIsSvXUj+prPOzwDfcVcQrg
	 7+H6EulX3UrenPzZ8ksFOxubxHMYml913ocBYaFZicoTmitUXYCfdDtSm2C9UfsyExo7C
	 8sf4CC9jDiM4b5D51eGjF0Dw0kA7bqz4OiL6NjUwwreNXCDuXfJyvTH10PhivLWhWKzik
	 qaUqzFCKzZDbcMKY0bFL4LYsRqKsXqgseJQ9J18NSuCT4p+8PWZuhEPGdg2ZXJU3iUk7c
	 Y7xYrldJUlo9xLRPka+o+UhGJtQNVUHhslWIjKMmzStNuWyr+6xBXUZlO9aCTtrsdlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=y57InZirlLt6ybEBJOPgbYT+AZ2EqSl7I8kTv4hT9BA=;
	b=oMx/mQDnR00HwqlwhDrgXldEumn+vBjb74IGhwwKoQYDaNBPJeit+ZHXkZ27zDj99dWV
	 yMcJ2r/PXvdX4s1//vau09BJcsdz6zIbOUYw6ZF38k3QRiNktpxTQH6Es3c75E7anWzwf
	 Qv7Uncy8Tq5I99KeGDaNIo74X3qnizrnN5fy5oLg4tIt0EAE/GdOvmgNp3SHlrA19DqHt
	 uRo5cBGFqff0qz+f0blPYY00AR0vIlp4NPrNoryh9i3jwso6EeeCaEt4y7kqX11eBY9fI
	 lr+tiQ8LykVi/w6wB2hWJrD5dacF8EMLS3h28UKPxiRDthjzZe5tBsn1pEiQwEShmSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qNKhzYBZ;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9256560A6F47
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 11:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9256560A6F47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qNKhzYBZ
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3afc7b51abfso32703a91.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 03:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964991; x=1794569791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y57InZirlLt6ybEBJOPgbYT+AZ2EqSl7I8kTv4hT9BA=;
        b=qNKhzYBZ9iYxheo1v7ZhUwhEBMYmR6JjLqyvxWIGVNWX0c1bBBb0sZgptgP38czEkU
         LZW54czyXW5S0tawZDh+RHZMbLixM2XXC3dCPZ17vzWP4T5Oz/xi+iSnowN43ZqsaPT1
         iJH5b7KoefRogRwc7d2Ez3WbjVEAuAWjEkEmvI5+c2R3oJnnDk+a+zN3R5FiLj8Q+xM0
         OoI2HRS185TiHidTmlKseSY3cguUsrl93jPqslpdoOXVjmFfq7UR6eadLfMKJVjwNaon
         fNWd2vbrAc5qiuLmYxrlIIbqChUqqUyCu9qrcaldkl5xlTRpYLAUp/2MIN+Lrt5/VDsd
         vw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964991; x=1794569791;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y57InZirlLt6ybEBJOPgbYT+AZ2EqSl7I8kTv4hT9BA=;
        b=i9ZE6c2KlhZAAB9W/WukaRYNi7tpmBLhRiTRzv2+33MBJHKpJQ2cJRMVVG/YmtSOnC
         oAVilAc0C//CgesphtZmDDlmpwnhTziv+TFgRr/vV4ylV68ixwte8MoDHaNnisOHQOBZ
         GUMn8d8/c9S0BBtXxvwToOXfkXO8RTnKDtUk1CaX8DJcxdUK+XU8mVxaPWIt4h6fVoss
         EZbSVPymQgALoozwNlazwdAIAZiOaTakYN+Qb94XR5bUJ5cjpzWTy+TUqeKxaaP8HpiO
         uX1yGerIT3N+4GD9dWldDuLNxuUBiFumwzlh8Fo3GIt3dlZ2myU9IwrdZdpH/hiXYxLh
         JA8A==
X-Forwarded-Encrypted: i=1; AL+hErF6ip9lYAnoYUpQEVB+TnA6Kprzm+uo1J1v4S3PuITumAzEmwEpiqveK0urixSgzzmtS0RsAfZJOaU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gWxse1pB1/YvrtQi4o2DPtoXhS8bMSdubEBrM6t4F4f2GaXF9
	9v2Em2lp1EAttnH3FAh++2jfpdlqbrU5YUCPdZgrjaWK0LBgGYwaWZPv
X-Gm-Gg: AYBFou3iM9kCMRUCw4L9LrSzwBCVvuv88IXCp8iW4xv1sbUwVVSv4AK4MpuuuIBrA6l
	PfTzecgjQq1vHoEqfCZq2I1tlIYTgv+D2TVdQdn5bZ2yV8AL/itvXpfCmQGTKgt9GBqBDHeIv5w
	pHOxRMojwHkSH7Ni200fPPTSI9Vsyogzgh8KO/bf6sxvNtJFIQ7iubWuYvaj3TIf4FSZWHxqy6Q
	Un1J+oM81yP6gAIbUNFiHsGjmg1MmaHAUAgY744Cb7ydA5fmYKdpqWsLNA+oDi1GumYZg0eMIHY
	BJJlv9ZAJcuUY2FwSE4Mv/yOEbvc2Sr8cVRXSkp8LEdhX7THvsu7N1+2QsQD+Cux5qbzEIC4BAX
	CC+tq8vPOWd27liSCSQ8T6l4b6srnptOJPu7Ipiim4feiRSwU/HhmG9jFVZnj/YGTjOm8syUeZ/
	cDwl/2nlCCoOkm+RbtmLdBfn56xH8OKZomt97p8vzFdd5kmEkocFd7l/awSYtfyUyVfaue2pvFE
	N0Cs4Zh1KCpMGB2AIiKHThu3UJx359oGTGlujwGhgWBK68sSunW1LJbRTSr+mFN5MKHfad5U+en
	GFggXz5WPQGVtfoidaNgvGaQZMXM8kkXHn/F7SxSwF9IQcLu8SUkuA8bvU30eRCEVIHQcjFzhyy
	WNqpbOS4EGnfTDAIRKxVOUck2
X-Received: by 2002:a17:90b:3c0a:b0:3b0:9e2c:9b55 with SMTP id 98e67ed59e1d1-3b0db60d73cmr3384676a91.2.1793964990827;
        Fri, 06 Nov 2026 03:36:30 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32b6507sm8343173a91.16.2026.11.06.03.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:36:30 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 10/13] docs/zh_TW: process: add contribution-maturity-model.rst translation
Date: Fri,  6 Nov 2026 19:35:41 +0800
Message-ID: <20261106113545.708896-11-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106113545.708896-1-chenyou910331@gmail.com>
References: <20261106113545.708896-1-chenyou910331@gmail.com>
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

Translate Documentation/process/contribution-maturity-model.rst into
Traditional Chinese from the current English text.  There is no zh_CN
translation of this file to consult.

List the new file in the toctree of process/index.rst, after
code-of-conduct-interpretation as in the English index, and drop it
from the TODOList.

update to commit 10a29eb658b3 ("Documentation/process: Add Linux
Kernel Contribution Maturity Model")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../process/contribution-maturity-model.rst   | 83 +++++++++++++++++++
 .../translations/zh_TW/process/index.rst      |  2 +-
 2 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_TW/process/contribution-maturity-model.rst

diff --git a/Documentation/translations/zh_TW/process/contribution-maturity-model.rst b/Documentation/translations/zh_TW/process/contribution-maturity-model.rst
new file mode 100644
index 000000000000..1091aab4a7eb
--- /dev/null
+++ b/Documentation/translations/zh_TW/process/contribution-maturity-model.rst
@@ -0,0 +1,83 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_TW.rst
+
+:Original: Documentation/process/contribution-maturity-model.rst
+
+========================
+Linux 核心貢獻成熟度模型
+========================
+
+
+背景
+====
+
+在 2021 年 Linux 核心維護者高峰會（Linux Kernel Maintainers’ Summit）上，有一場
+關於招募核心維護者以及維護者接班所面臨之挑戰的 `討論
+<https://lwn.net/Articles/870581/>`_。該討論得出的部分結論包括：身為 Linux 核心
+社群一份子的公司，需要允許工程師將擔任維護者作為其工作的一部分，讓他們能夠成長
+為受人尊敬的領導者，並最終成為核心維護者。為了支持穩定的人才輸送管道，應該允許
+並鼓勵開發者承擔上游貢獻，例如審查他人的修補程式、重構核心基礎架構，以及撰寫
+文件。
+
+為此，Linux 基金會技術諮詢委員會（Technical Advisory Board，TAB）提出這份 Linux
+核心貢獻成熟度模型。這些關於參與上游社群的共同期望，旨在提升個別開發者的影響力、
+增進組織之間的協作，並改善 Linux 核心生態系的整體健康。
+
+TAB 呼籲各組織持續評估自身的開源（Open Source）成熟度模型，並承諾進行改進，以與
+本模型保持一致。為了讓評估有成效，評估應納入來自整個組織的回饋，包括管理階層以及
+各個資歷層級的開發者。秉持開源精神，我們鼓勵各組織公開其評估結果，以及改善其與
+上游社群互動的計畫。
+
+第 0 級
+=======
+
+* 不允許軟體工程師向 Linux 核心貢獻修補程式。
+
+
+第 1 級
+=======
+
+* 允許軟體工程師向 Linux 核心貢獻修補程式，無論是作為其工作職責的一部分，
+  還是利用個人時間。
+
+第 2 級
+=======
+
+* 期望軟體工程師將貢獻 Linux 核心作為其工作職責的一部分。
+* 軟體工程師參加 Linux 相關會議將獲得支持，並視為其工作的一部分。
+* 軟體工程師的上游程式碼貢獻，將在升遷與績效考核中納入考量。
+
+第 3 級
+=======
+
+* 期望軟體工程師將審查修補程式（包括其他公司工程師所撰寫的修補程式）作為其
+  工作職責的一部分。
+* 在 Linux 相關會議或學術會議（例如由 Linux 基金會、Usenix、ACM 等主辦的會議）
+  上發表簡報或論文，視為工程師工作的一部分。
+* 軟體工程師的社群貢獻，將在升遷與績效考核中納入考量。
+* 組織將定期回報其開源貢獻的指標，並長期追蹤這些指標。這些指標可以只在組織內部
+  公開，也可以由組織自行決定將部分或全部對外公開。強烈建議的指標包括：
+
+  * 依團隊或組織計算的上游核心貢獻數量（例如所有向同一位經理、總監或副總裁回報
+    的人員）。
+  * 已做出上游貢獻的核心開發者，佔組織內核心開發者總數的百分比。
+  * 組織的伺服器和／或產品所使用的核心，與其內部核心所依據的上游核心發布日期
+    之間的時間間隔。
+  * 內部核心中所含樹外（out-of-tree）提交的數量。
+
+第 4 級
+=======
+
+* 鼓勵軟體工程師將一部分工作時間投入上游工作（Upstream Work），其定義包括審查
+  修補程式、擔任議程委員會（program committee）成員、改善專案的關鍵基礎架構
+  （例如撰寫或維護測試）、減少上游的技術債、撰寫文件等。
+* 軟體工程師協助籌辦 Linux 相關會議將獲得支持。
+* 組織在正式的績效考核中，將考量社群成員的回饋。
+
+第 5 級
+=======
+
+* 上游核心開發被視為正式的職位，工程師至少有三分之一的時間用於上游工作。
+* 組織將主動徵求社群成員的回饋，作為正式績效考核的一項因素。
+* 組織將定期在內部報告上游工作與直接追求商業目標之工作兩者的比例。
diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
index a4ae46350636..ae63704e3794 100644
--- a/Documentation/translations/zh_TW/process/index.rst
+++ b/Documentation/translations/zh_TW/process/index.rst
@@ -65,6 +65,7 @@ TODOList:
    license-rules
    code-of-conduct
    code-of-conduct-interpretation
+   contribution-maturity-model
    kernel-enforcement-statement
    kernel-driver-statement
    stable-api-nonsense
@@ -74,7 +75,6 @@ TODOList:
 
 TODOList:
 
-* contribution-maturity-model
 * generated-content
 * coding-assistants
 * conclave
-- 
2.43.0

