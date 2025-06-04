Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2744023817A
	for <linux-doc@vger.kernel.org>; Wed,  4 Jun 2025 09:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749030697; cv=none; b=rFgV5cuF2coFsCnWI4ZoVscSlUyehiTQNSH5MJy67izs+LODrMydQFWqh/lEZH+mBNj0lIi3gXx2ukmZDCU5Ce5tBnAjz/2I1LjPtPw/YMAWn0UqbAJTKb0EGZQGGB9iOkguBoJs15x58147q6jqPv7uB7N8G5fJ57rPsmQT49w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749030697; c=relaxed/simple;
	bh=FYNTO3RrKaQCQREABP+s+cgVnlsnzuaGLL59wQAu3U0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VCLMgxICR57pfPNOzODvEoHDHlGkO6a7uoRuTWDDzjv9FYLjbrTCK1fNS63ZRtkw+HkYZV4UztJ0yEMcO5AN8mF7cA7Q+glZalK1HHAXOf2OcAHvXvcwOsppNXCOs2f7WDhGFmrqhSf70W15IEqusD+TTnBzH4+7LMrZOzEaO5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9duW97V; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9duW97V"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b200047a6a5so656392a12.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Jun 2025 02:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749030695; x=1749635495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VYLiGJRE1VEa9rrJDjJuT79KYlYFQjokHCgcfyzPHfk=;
        b=I9duW97VPXp3f4KwNqjfLziIjRn1Xi8g3T6D5SaRWaRhBmIHUZVZpbztrhHvHLVYXz
         vpexW4dR54wRHHsLKTA+4rmcxSHHrpOjanBUXmLN7rgZRP7uIN48jps/9Z7Zlc0xXufQ
         yg2P/27hKZ3TwuEabYzA7SnRHk5k0Ej9fEVgelctwwpDq47iyGDhigse8J2OnBQE8yE8
         3LbLsml8fcifbWhNKJmx2Q9bu+OTDGh2cLoLx2mSr/ED1U2bH5rgRqVNwYVaCxTyS5nf
         nlIQSbmtT3preY5W5MYJori20kRLsEC9zywlWILsYNZRTDAwHED0oQGxiDZSJXRqn/h8
         KijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749030695; x=1749635495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VYLiGJRE1VEa9rrJDjJuT79KYlYFQjokHCgcfyzPHfk=;
        b=DaWJPWWJnKU5yppvEYTSoKTeRMPOJ/76bDmKle7JS3LX0MCEHJpKJdxkeZx7dfuIEi
         5oGC3Xwf63pTFt1zU0+5eHvuGTQtp3njsVm610XlO7fX3EmBpy/JF4H5fC4k6bXN06M4
         T35pDWYIvW3e9Ka3oiZqLVHQlJ6hKjYW/reJUWV527eOlwpcEbjvqqBPwE826Np/5CCw
         lpilKnluJZOQYSFDShmfqtoDOsjV8P+862rP4Ig9PciGwDjO0zU/WdQAp11l2LkZFPZc
         iBQfPkPkOXMvcoeXRyfmIl7hbYj+F1YH4g+FBc1OJlJm2zNSJPHe6DGP+0D+qXp70ADO
         kX9w==
X-Gm-Message-State: AOJu0YzTLhLtFzM4wk1OZLgXmr/arZZp5LVnLi0y0B6ubGq0QtHRa42h
	QZ5gU8QstxCuSUExmhWx7rIGywGEwh+ER0YiXiBG8p0s4DpoSEuzntY7
X-Gm-Gg: ASbGncvrgOla8ipMe2tjZyFJGkXjGIp9LgOVSHScjvPZP0e14vKPn2xcrpqPFcHXZT6
	Y3WVaSIqTt/3X2GTTE+kmWPQxI7yCpHbOXege7VYghp0Jnn1NGCptMYAdL43JgMHoEeYN9h2zjw
	Fw0w2lvvkwtGSiMR/+nlFMAi12TaWVp9+qt50XCE6JpbBWb4nlV0J01JsCHYfxviQqQ5u2v/OE2
	PwKcMBJZYrQ5/ztLT1sND5nKi0LJzdh+anCkRRArPrmiGC8VDSTxfOOXt3ap24V0+J8PpMy06tb
	8zuxwS7lzES5JGUofeAD4vO/C0FK5rbleJknCCwCZvUnkuoZN3eej9pJLVI4hDuF12XgURVRpQ4
	LDqg=
X-Google-Smtp-Source: AGHT+IHTSPUejZ2UBfiSVY1FQMHwzOd0a+bGwuLUtfI0CZ6cBHXkRhQVzbcIUnqTJNRGZdTotJ+TWg==
X-Received: by 2002:a17:90b:5102:b0:30a:9feb:1e15 with SMTP id 98e67ed59e1d1-312e7eb5aeamr9491104a91.8.1749030695091;
        Wed, 04 Jun 2025 02:51:35 -0700 (PDT)
Received: from localhost.localdomain ([39.144.157.86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-312f001c852sm2268985a91.46.2025.06.04.02.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 02:51:34 -0700 (PDT)
From: chris.wei.cui@gmail.com
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Cui Wei <chris.wei.cui@gmail.com>
Subject: [PATCH] Docs/zh_CN: Translate speculation.rst to Simplified Chinese
Date: Wed,  4 Jun 2025 17:50:34 +0800
Message-ID: <20250604095036.3100-1-chris.wei.cui@gmail.com>
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
index 000000000000..61e4495a1b4e
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
+为提高性能并减少平均延迟，许多现代CPU都采用分支预测等推测执行技术，执行结果可能
+在稍后阶段被丢弃。
+
+通常情况下，在架构状态无法观察到推测执行，例如寄存器内容。然而，在某些情况下从
+微架构状态观察其影响是可能的，例如数据是否存在于Cache中。这种状态可能会形成
+侧信道，通过观察侧信道可以提取秘密信息。
+
+例如，在存在分支预测的情况下，边界检查有可能被推测执行的代码忽略。请考虑以下代码::
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
+CPU有可能误预测条件分支，并推测性装载array[index]，即使index >= MAX_ARRAY_ELEMS。
+这个值随后会被丢弃，但推测的装载可能会影响微体系结构状态，随后可被测量到。
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
+依赖于该值的微体系结构状态。这可能会提供一个任意读取原语。
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
+条件下，该值也会被严格限制在 [0, size) 范围内。
+
+这可以用来保护前面的 load_array() 示例::
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

