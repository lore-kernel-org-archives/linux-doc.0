Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432041;
	b=nKKg1lAPHVm0tqftXSIdlRwimQ6o8TIFR5GGBm4CHOGURghttQ2ZpuHZcaxfp80B5dpa
	 rSQ/saDo2WbulBQjE+khsziYEXqTJJDd0DQia3zEVP8ri7Csj+D9zCLSwwt+eSh4eMiTZ
	 m29CPlmdPQt3nEvVntt0nwOyidnU5nxO4JeuBY9meueHXVaWfTwMuFOu3WDP61cD5xNiR
	 D8QjQxlZ1xxJA/j+4Q4TZEDxDNwbxXWZ/ygGFOhilR2xPQOh5xUF7xu+vuaY4Xb7MrXwd
	 47x/ydBE+K5TpEjvqwwkYh+/zhRwJkbQ73W7pFI/6Egs2hXwHYXZ5oirzsLByXSP0ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=84LN+yk9SHs1lNdtGDMF3pv5mILXj5e9lWibGv9y35Y=;
	b=dqrnkwqKz7h3Uhvbq/cRoAGCNOYCQYq+WF0hk68rPa8RcfipLqmgMH6jqy9rGeUFk0qK
	 P6oP+Iu3Nox1U0lUARyRElF1pSY/EHmpmfN79uHJCMf2Dw/HwZ8VgEIAuLjSzf0KI0hNg
	 5B2ToHdHGxssyK0Dsfbk7YQY5NLO8N3Xn1ht9ZUcAw3zUir/ZJqPQurtyLyye8DzaRfJt
	 aNEvyZrh18YYbuAiLBXp3p2E4ogZVae4QbjzEBJiZiF67J4KquEdJY7jcJyMiH1xR8sc9
	 rAp91YbX9cSV7CzBdu9vAVfYddmS297n6TnGRxAhnjq2vWGgwmeNCfmQns+xAH2RBqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SLZUnMg0;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEA3606A6A0
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EEA3606A6A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SLZUnMg0
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bb5afa736so347383eec.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 03:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432040; x=1796036840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=84LN+yk9SHs1lNdtGDMF3pv5mILXj5e9lWibGv9y35Y=;
        b=SLZUnMg0lYVDrjVaQt1rC5r1K6WjWWLx4tONuSpHvdaM+jNB5t32HrAXNHPgyNoEhW
         OXnrvEECbnIk1t+60eTR4/etFkf0Pvlid2CuKkm75QdFllLfVg6xM6BX0x7Hmc3mHO9G
         O8CiAiqRySeDZ14i8IOiE7GHAWikolkIGkrAn4uPgOoWMsd9cI0WiG3JWU+L03zJJSMv
         6/kqSEnnQn+Kj1RDdMC13wXLnOH9hCDqt6QCoY8Lm0OJturdmZ3qnp2GDbIE/1VgQCB6
         rbnt2dWZbVO7ZsxGMQFLw8AcScmWiaX42QcNvi6BWF8fHmOwAN12UDGWJ527tO2bhMwI
         agTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432040; x=1796036840;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=84LN+yk9SHs1lNdtGDMF3pv5mILXj5e9lWibGv9y35Y=;
        b=KQELQxYRFR7I+kkX+kZRV+eEU7jW5MJ2HrvdfjvnfZUtWPvPlmZh0tls3k9tmhl8PU
         a7Png2+NiJyaNstw1zJ0Zl2IttSWB4c+nxckuhzgJDqOA1FI37YPoAxqPxudS9KVWC1V
         3yrzM6y0HzAi65/qM+NbSS5J4XeSM+fgbEAcsNuhuZJRp1oAkESBdrsSRS5JMxvJfPcC
         TskxGy4+L4oMOwCLHB2NWITVcXdBJSri31DvU9VKTbKnt2mGvBYR7vC2scc+SN2WQuM+
         jkb7CrI2y3o8ixv4n7+XGKcR7xyE3ujY+KFI+7UIPDZ0TCmcqUXmHdHeXQBWSXIGKBt1
         4nLA==
X-Forwarded-Encrypted: i=1; AL+hErEvwuA1vbhqVfXU7VzihGyrQWmoEpNRr+Tvnpx5Bk5Tt4ZGZbybXfLHk+naMU8+Q4W6NI8hwoODPvc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/w27Tkn8IZJj9oT/0TO7iS5YyeC2n8o3R1k+2Cs+xUh353TYNk
	pyC17Oo4ycCy512woChwlw1Kx1pdWVkEvhaUKieX4STKCwGRoemiFvKj
X-Gm-Gg: AZFdTZen+WsSkb9A/D4jcLm5SUxvh6iPyIqvRGQDyPRl6ySsaCt32ogk9BeTpgw4HqP
	vmN0gzvS67eS4qh9/2vOsFPKtjYg3WD7618YDPgYnYom7aiclv70EU6Ht+eV7fSZScvOXHZEIHt
	z5Kj5/l4UDFl8UmaJiVDFQ+HkdTqRq+5NQA7FkSrYbcEAnd+IuR8uNmepnkmCIS7Cgs+ogOtY8D
	surSl9sWgn91gDZO+cDncyJ3oFQ72mVoFX3KA+mz7H/0fpsUcVXFCXfB6Pp/1L1fsLK0LtK+Fi9
	KIbxYgcSJdDjUvNX+Do8k40NZcdbW9twMbz+YiLf686PU3aS2eOYoj94GHVAZA6G1fYAgtAqUyN
	RHTHMw6Atx3bTibO9ByxZtOnNJF5DDaxq+nK+Ce1K6xc+LwnUX9hMVefCGPyMRHbtIwGThFAW9h
	mPOFiUQw2yumQxntXwQNKoYg5Z1zqAWPDbtl/uJU6qHBC170RdtfKIq5Gyp3rzaCz1hgTH1CSu4
	MSrqcJWA43owJnVHVzWBcl2fJg9R3idbiGQmPRd+GvQjDhhFI3j0YjzpebwQB6yL1ZysX0320nl
	1U8+J4+YdXF3RXBiL7t/PLuMeRvQCrrpC5qvXzETH+8sSjXGbx+suz/TK1IwkAHa7YRxGaK0jcd
	hKdY2jBabbNWtXc5wZKlw9qZL
X-Received: by 2002:a05:701a:cc90:20b0:146:ffa9:2117 with SMTP id a92af1059eb24-1b5697a0445mr9227216c88.1.1795432039775;
        Mon, 23 Nov 2026 03:07:19 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm30054074c88.6.2026.11.23.03.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:07:19 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: alexs@kernel.org,
	corbet@lwn.net
Cc: wy@wyuan.org,
	dzm91@hust.edu.cn,
	si.yanteng@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 11/13] docs/zh_TW: process: add conclave.rst translation
Date: Mon, 23 Nov 2026 19:06:34 +0800
Message-ID: <20261123110637.172045-12-chenyou910331@gmail.com>
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

Translate Documentation/process/conclave.rst into Traditional Chinese
from the current English text.  There is no zh_CN translation of this
file to consult.

List the new file in the toctree of process/index.rst, after
researcher-guidelines (generated-content and coding-assistants, which
precede it in the English index, are not translated), and drop it from
the TODOList.

update to commit 102606402f4f ("Documentation: Project continuity")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/process/conclave.rst   | 35 +++++++++++++++++++
 .../translations/zh_TW/process/index.rst      |  2 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_TW/process/conclave.rst

diff --git a/Documentation/translations/zh_TW/process/conclave.rst b/Documentation/translations/zh_TW/process/conclave.rst
new file mode 100644
index 000000000000..e237b84fd3fa
--- /dev/null
+++ b/Documentation/translations/zh_TW/process/conclave.rst
@@ -0,0 +1,35 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_TW.rst
+
+:Original: Documentation/process/conclave.rst
+
+Linux 核心專案延續性
+====================
+
+Linux 核心開發專案的分布非常廣泛，有超過 100 位維護者，各自努力讓變更在他們
+自己的儲存庫中持續推進。不過，最後一步是集中式的：變更會被拉取（pull）進主線
+儲存庫。這項工作通常由 Linus Torvalds 負責，但正如 2018 年 4.19 版發布時所
+展現的，在有需要時，也有其他人能夠承擔這項工作。
+
+若該儲存庫的維護者今後不願意或無法再承擔這項工作（包括協助交接），本專案將
+需要立即找到一位或多位接替者。完成此事的流程列於下方。$ORGANIZER 指的是最近
+一次維護者高峰會（Maintainer Summit）的籌辦人，或以 Linux 基金會（Linux
+Foundation，LF）技術諮詢委員會（Technical Advisory Board，TAB）的現任主席
+作為備援。
+
+- 在 72 小時內，$ORGANIZER 將與最近一次已結束的維護者高峰會（Maintainers
+  Summit）的受邀者展開討論。這些受邀者與 TAB 之間的會議（線上或實體皆可）將
+  盡快安排，並以能讓最多人參與的方式進行。
+
+- 若過去 15 個月內沒有舉行過維護者高峰會，本次會議的受邀者名單將由 TAB 決定。
+
+- 本次會議的受邀者可視需要再邀請其他維護者加入。
+
+- 本次會議由 $ORGANIZER 主持，將考量頂層核心儲存庫後續管理的各種選項，且所做
+  的選擇須符合「能最大化本專案及其社群的長期健康」此一期望。
+
+- 在兩週內，此小組的一位代表將透過 ksummit@lists.linux.dev 郵件列表，向更廣大
+  的社群說明接下來的步驟。
+
+Linux 基金會將在 TAB 的指導下，採取必要的步驟來支持並執行此計畫。
diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
index ae63704e3794..d9ac35e0660f 100644
--- a/Documentation/translations/zh_TW/process/index.rst
+++ b/Documentation/translations/zh_TW/process/index.rst
@@ -72,12 +72,12 @@ TODOList:
    stable-kernel-rules
    management-style
    researcher-guidelines
+   conclave
 
 TODOList:
 
 * generated-content
 * coding-assistants
-* conclave
 
 處理缺陷
 --------
-- 
2.43.0

