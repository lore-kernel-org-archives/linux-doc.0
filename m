Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136FC289819
	for <linux-doc@vger.kernel.org>; Fri,  6 Jun 2025 17:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749229782; cv=none; b=iv0w1nsXB9soTi/VwG9wAJZjKuNC4jZsgYvG8gRZa4Bu2PFrr+0Ihh/G8zUVXb+AHX3iA5AqcBdZvJ7SLxPXkOfjnukkx3nR2BgijV4LoSWygwfDTytR89KyM6QxvAkZEGe9mhpTsXp8ucFvRamBLmKpyLd/VFNLpF3EO5jQK84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749229782; c=relaxed/simple;
	bh=UAb8+WqysBg0Hh1V9cvAbAx4tnvY/dTtOg8wvXhle8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=U2+Lp0v8ZKq6oW+Xo74sSk3gAVaXSE358y/PgpBvRyEncsuWvDCg3Q4NyitwttGY66JWYylR2RlGNoFCrX6i2HIoCc0bD1pwXNXRPQ8u2Ic2gYt96jD1myNBJRyqN71K8yBdMOdvGYHR2bRQzNsvowh7zKhLHX5UAHiHdzrKDrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPJ9chyh; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPJ9chyh"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-235f9e87f78so18304605ad.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Jun 2025 10:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749229780; x=1749834580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HCA+p0V0f/95wNW2uhS0pO7EE8VezLxkjnWXjppWiUw=;
        b=lPJ9chyhQnJYMEUJ+qmIdN7lOjBFQfAMTeGQUEm/Ibc8gQ8MZLysAQR0h+HG519b2+
         Bqojipd7KjsJw9K/y+DuB4Iz6A+CEgrw6HDTresScYBTqV7pAvlpvgqrWC5/5zWtN1Xh
         5LDKVuma7QHdr7FqLnArax6lP1iG//1GZflB2rMg4d8cineAs9XOi3993Z7oeRUAO+J6
         hhPEFjt3Kl2ulPos93WYjtJmcjVR80vXbDtdZ0/RJChtauRYTPthKjhgiFCZ/8vh5B6S
         HjGZ4zCB0E5NV7nQ+lBhGx70jLkYBOCCOwGWbtFBQ5XqyDmqigjxA1yowUwfRmdIyVrr
         EhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749229780; x=1749834580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HCA+p0V0f/95wNW2uhS0pO7EE8VezLxkjnWXjppWiUw=;
        b=KHM08pzSbjXEDVOEGQDhz7x/HGhZr3JhTl80oOJzRAKZNNkSbz5nugi2j1A2qtx8iW
         0ZD4uw++XC49vTpL0r9tu9mgF7KwW/f0yAOuSRtVGu6Ftpu6nZaaHBNUYqpgGFH0MSx6
         Z1wLJy68e/C2+MW7Qa5RSW2kZHSQFfSjrccGkjPeoFeF0x7YnlI27IWgpFWJrVuEieDx
         XuL0zODB7/d9dJVT7FD6cYXN0ZGWV+qgsKuGN96XBgHBysHato+dVzl4kdZhCqJm3KKR
         Dj1NQbta7XAfhEiz8tHEHCYOpb4l7Pb9Zk+9cEgoar6loozHaHosS+tzNVnzaL77ZsU5
         sXDQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9JD6lyF58a1SvEdBYBxF+RkK9Whs9kc/74z1gSsXEaSCzJ5GVfnvujlqoCJDN6EpgW96Za99FWHM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIVtanzAcxExrv7xgIaIX2aoUU0ftkcN4/Ka25KoBn4kg2D3uK
	PUmn48R94o5hwf1Mg2SzZ0qiGnHqnGcqwrmTbQMQmgWy/t5GPNAU1Dsu
X-Gm-Gg: ASbGnctBJzhFkPZg7Z08MyrB6cXxoMniQh7Htk0aIclgcJ4B2sUjzdKztRUQIN2PtKp
	EZWVoGDyu22GUutrdSy5JCWy6iHZJPVZvILZIN9RXB9uLXvspy6puJlvUFENO4WcFSn+8l/XAvt
	iQzoKQR4AlwywNwYp50t7iJmCS6HUQfWRWGXO0qZz8wfT6spHiOIBmLyBBLq3Gz5Bl/sMgSBDpJ
	Lu9CUbbhCIUIjgmbLAOOohOT6fQ4SPaYKy61tzIp68PnuW1rRo2G7+ujZwLPnsI63XSftK7IRoX
	FLWoVkGFj4BbRLoRShdV4fVezAp1EqXKTlDgO8058XY9afGnVuF+/wXJxOxJfB55BTq9Jjx5tin
	39qA=
X-Google-Smtp-Source: AGHT+IH0OuXP/SRDjPOLkBrSsRFaLez26pem9mZaNmYDSrk7Gc9amPDU1nBJbPtGNaWg5VMrlO6QaQ==
X-Received: by 2002:a17:903:2301:b0:234:d679:72e9 with SMTP id d9443c01a7336-23601cf927fmr63154895ad.12.1749229780147;
        Fri, 06 Jun 2025 10:09:40 -0700 (PDT)
Received: from localhost.localdomain ([223.72.62.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603078045sm14630405ad.38.2025.06.06.10.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 10:09:39 -0700 (PDT)
From: chris.wei.cui@gmail.com
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn
Cc: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	Cui Wei <chris.wei.cui@gmail.com>
Subject: [PATCH v2] Docs/zh_CN: Translate speculation.rst to Simplified Chinese
Date: Sat,  7 Jun 2025 01:08:59 +0800
Message-ID: <20250606170904.5596-1-chris.wei.cui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Cui Wei <chris.wei.cui@gmail.com>

translate the "speculation.rst" into Simplified Chinese and adjust
zh_CN/staging/index.rst.

Signed-off-by: Cui Wei <chris.wei.cui@gmail.com>
---
 .../translations/zh_CN/staging/index.rst      |  2 +-
 .../zh_CN/staging/speculation.rst             | 85 +++++++++++++++++++
 2 files changed, 86 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/staging/speculation.rst

diff --git a/Documentation/translations/zh_CN/staging/index.rst b/Documentation/translations/zh_CN/staging/index.rst
index bb55c81c84a3..6d68fabce175 100644
--- a/Documentation/translations/zh_CN/staging/index.rst
+++ b/Documentation/translations/zh_CN/staging/index.rst
@@ -13,6 +13,7 @@
 .. toctree::
    :maxdepth: 2
 
+   speculation
    xz
 
 TODOList:
@@ -21,6 +22,5 @@ TODOList:
 * lzo
 * remoteproc
 * rpmsg
-* speculation
 * static-keys
 * tee
diff --git a/Documentation/translations/zh_CN/staging/speculation.rst b/Documentation/translations/zh_CN/staging/speculation.rst
new file mode 100644
index 000000000000..c36d33f67897
--- /dev/null
+++ b/Documentation/translations/zh_CN/staging/speculation.rst
@@ -0,0 +1,85 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/staging/speculation.rst
+
+:翻译:
+
+ 崔巍 Cui Wei <chris.wei.cui@gmail.com>
+
+========
+推测执行
+========
+
+本文档解释了推测执行的潜在影响，以及如何使用通用API来减轻不良影响。
+
+------------------------------------------------------------------------------
+
+为提高性能并减少平均延迟，许多现代处理器都采用分支预测等推测执行技术，执行结果
+可能在后续阶段被丢弃。
+
+通常情况下，我们无法从架构状态（如寄存器内容）观察到推测执行。然而，在某些情况
+下从微架构状态观察其影响是可能的，例如数据是否存在于缓存中。这种状态可能会形成
+侧信道，通过观察侧信道可以提取秘密信息。
+
+例如，在分支预测存在的情况下，边界检查可能被推测执行的代码忽略。考虑以下代码::
+
+	int load_array(int *array, unsigned int index)
+	{
+		if (index >= MAX_ARRAY_ELEMS)
+			return 0;
+		else
+			return array[index];
+	}
+
+在arm64上，可以编译成如下汇编序列::
+
+	CMP	<index>, #MAX_ARRAY_ELEMS
+	B.LT	less
+	MOV	<returnval>, #0
+	RET
+  less:
+	LDR	<returnval>, [<array>, <index>]
+	RET
+
+处理器有可能误预测条件分支，并推测性装载array[index]，即使index >= MAX_ARRAY_ELEMS。
+这个值随后会被丢弃，但推测的装载可能会影响微架构状态，随后可被测量到。
+
+涉及多个依赖内存访问的更复杂序列可能会导致敏感信息泄露。以前面的示例为基础，考虑
+以下代码::
+
+	int load_dependent_arrays(int *arr1, int *arr2, int index)
+	{
+		int val1, val2,
+
+		val1 = load_array(arr1, index);
+		val2 = load_array(arr2, val1);
+
+		return val2;
+	}
+
+根据推测，对load_array()的第一次调用可能会返回一个越界地址的值，而第二次调用将影响
+依赖于该值的微架构状态。这可能会提供一个任意读取原语。
+
+缓解推测执行侧信道
+==================
+
+内核提供了一个通用API以确保即使在推测情况下也能遵守边界检查。受推测执行侧信道影响
+的架构应当实现这些原语。
+
+<linux/nospec.h>中的array_index_nospec()辅助函数可用于防止信息通过侧信道泄漏。
+
+调用array_index_nospec(index, size)将返回一个经过净化的索引值，即使在CPU推测执行
+条件下，该值也会被严格限制在[0, size)范围内。
+
+这可以用来保护前面的load_array()示例::
+
+	int load_array(int *array, unsigned int index)
+	{
+		if (index >= MAX_ARRAY_ELEMS)
+			return 0;
+		else {
+			index = array_index_nospec(index, MAX_ARRAY_ELEMS);
+			return array[index];
+		}
+	}
-- 
2.43.0

