Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432038;
	b=QZz0HnYx8+RSqIwRNXHqZicUvO+5EAc8hVHjRK5X9fQVEKxTYAEsZeozzUTqQ2E6oWLq
	 JcPph6Ysk3PSe6dBpCbn9lP4zfENjUHbIOJ+rnPirZixIErqfNMdoVVW1aLtfcGaEj2Pt
	 WpyGCrT+JTCJmKE4d/WVoQCIhujjoXx/hbt2HEGonGnRXfwiikxQCEJTLxvUHpK5l1EK7
	 cnkrvVULrdcLHetrM4fGzh0lpJCnM0X9gOCitltc5vK1brvLMWwtoqBU/9kc2ZdIt+tbZ
	 EorXvg8ptKGM8vIp8nnGMndt4yVQmmdhaAHu4uUQX6JJXbZm3HP0hTLSvFoBf6Of0lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=y57InZirlLt6ybEBJOPgbYT+AZ2EqSl7I8kTv4hT9BA=;
	b=ENUvl+yO79DbBNNjRDxOIHpx2Wu6NbGD8Vz655Y6QgMXY7+LZnosNrqk1fjMi9MYMYpw
	 1wZRvgRwONdRH0oLZFWHSZWPVDQlcUEL8RCyxy98kQ0iWKBiBZFYzjru5LmWNsIwxzdUM
	 n37GUTTuYQnRbft1WB+nxGSQTJ2XI3UiyEJWMcg3IusbhjENQ7EN74tlQotHUNhClS5N7
	 /jYmQ4gkvkJLURIP8VccdJpyTE+i8aOHeju2GmetkcIKpMNdQOmFmP6LbC0Qsp5WrnMwh
	 pDLTW4U4fhbK+71stXoIK9/GEYvVK4wLgUXFUybXQ4C6ZQ2dCsPgva8Nkgd8aL0vhkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JNerKwnW;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFA1606A697
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AFA1606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JNerKwnW
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3ae17c535so378876c88.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 03:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432037; x=1796036837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y57InZirlLt6ybEBJOPgbYT+AZ2EqSl7I8kTv4hT9BA=;
        b=JNerKwnWgrzXZ9HN7LFgZSPwxkby4wsyp4EnlOWVdOc6rX19+DrQavmXXkj3myc2n5
         dP4CcmSdTOzJPQquOdMJuLTGreaUe0mflZ4For3VDPle0LDfFdviSgdcdfvp0IZm32BK
         Lzz6Rs4uWrOd7wHVlQl+x/is9DUtrRWY+gsLkQiJtZl2vqsar35cCpssymmRL/pEkLz9
         FgQQz8V4CQN8W5+d4HUpD478wuvXJ7/+5KbrqSHMVSQPUkP8t1Q2TThrBc0LODZLhyRI
         YDUgCXIaOUt2FZWYGAkalamA0OMTtC43WTJHHIT5W7OlK0f1dhz7IooeDLXxcD8MXJt+
         uuog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432037; x=1796036837;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y57InZirlLt6ybEBJOPgbYT+AZ2EqSl7I8kTv4hT9BA=;
        b=WDna1KOcLGSdVTMPx+3WuaIXDzJKb518ScYE1wxx9XIOMdgIsM/ZZ0DU1BFLMfE4cP
         lDQITlgSqxBrUEp++bJquLZlAhx1EhftPH9RWwGqM0UWGjJn2Q2WcWr0ZNpZphi0GMI6
         9ARv7p28lIZlcAtQA9BCeegesIC/cwqerevtH3p6p1xW0Qf0TJp1+5GlHj4KhBZowrtC
         vcuTnyc2yS8+yUQoDiWzmHk7VIIm7umImsNsbLpDDEuj1Mo8m90WGyzCkmemtcAsZSi5
         i0Kb9ziUOazSIZrM9Z+6d+UZMQ+/hJx5i2QxqPBxKYf82+Xlj/Hjz1NGV6mtp2TKJbmV
         lBtA==
X-Forwarded-Encrypted: i=1; AL+hErGfhikaSV20YOj34oP9u1fNH9Wd9PZNVvwHWkGgEaUAnjiOwezqutHmXV2EgPZqalCyYKx3+VVQ+48=@vger.kernel.org
X-Gm-Message-State: APuU4Z9m6+R28M/q9hmMwygzuzBbCctlTNIgDCkslnD0IuwSxC/DZjpj
	XOxyaDtuZOShsWoUNdfaiZgeGve+iJF5i6IrHfF8HkH8d6V0ox7gFpLZ
X-Gm-Gg: AZFdTZc+MpkoLbBGqqRJy6ypOMNqFFpdehivKJxv4bqHcKV0gexdwWnzW/toU6zrO+u
	0PbV/BDyOwEIUt3x0t3Ed+1pnodLtvLRgoNmgcVf5teJ9pWIGoIwvqiz0Dc5LMtKja/fb17egu6
	Wg0DKZhgWIrurSfTAKQI6r3i9ykqngVBfDACZjS5kglQ8YuQ1GQkYeZDX3vmvxdQbNAOEMbmXeU
	aajo35y7hAWWa6FyNVBgP57bO+weuznTjkuNjzP0ALvvb3waAyLvM68XM3fDSVa/sqT4QcuD7ZH
	QLEuG2MsR3KksJyKCoAn6EUC3jIaeC5KxA28kOZconbCp5mVXRky5uN51gwJoJKGYGuJTVkR4fq
	oH8qrEE5rp22TVuQb5eZ75LiCyE0kG9LmEaOkFfxGBJ7UcBc5o3aAWGKBHe4aMxrjl4FxFVfbaL
	XGehTbB3B6n6CbniCGb1opS07eLWn7rnzmSsDPXJHuZxToOp6wi9oOw4uRVoFpgmIZLHMGKsqnh
	2U5EBoQ9iT5oWwcJ+bKLTWNzqSn7rlFyuRE8Pclvqz2HNTNStomv1T1tXJRPLsJYVQY7s0lJ4EX
	jDGhGVHKswRF9BJRhKMz7N4TAO3D0ExJDWDCSwqCNKOhHEizFajdj+mm/MImMGZL5NGkm13imQq
	jtjJt1wf9j2P5jEZ0yMQ6gmkO
X-Received: by 2002:a05:701b:21c8:b0:144:fd17:3b21 with SMTP id a92af1059eb24-1b5566e577bmr15106822c88.0.1795432036978;
        Mon, 23 Nov 2026 03:07:16 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm30054074c88.6.2026.11.23.03.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:07:16 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: alexs@kernel.org,
	corbet@lwn.net
Cc: wy@wyuan.org,
	dzm91@hust.edu.cn,
	si.yanteng@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 10/13] docs/zh_TW: process: add contribution-maturity-model.rst translation
Date: Mon, 23 Nov 2026 19:06:33 +0800
Message-ID: <20261123110637.172045-11-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123110637.172045-1-chenyou910331@gmail.com>
References: <20261123110637.172045-1-chenyou910331@gmail.com>
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

