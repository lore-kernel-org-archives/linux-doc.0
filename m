Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52EA219E8
	for <linux-doc@vger.kernel.org>; Sat,  7 Jun 2025 16:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749314324; cv=none; b=I/0e/smqLOywbl6Fy5KDie5E8LHxIjKpg4+ays4A76IFC4pyDrqIJUXIG4BII0IMoohxaT/R5eqUyv0Bbqix2BSTl0xFF/Q5G+rfyjUfHjLEeRVuPxKUPacVvtzXDMcEWXLM/yFBVdEuTK31ZGV4dI+KVr27pWhjkQAdrZxRb0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749314324; c=relaxed/simple;
	bh=VYxVxX9AW57l6Cb2iaClCVZPprLPDSxyNtPcHAAXaaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BHdDoxNcZBFtUcaH8CPMBANFMvDtVMuk//ZUOhHgcyDVDafuJVQAFE13lakNxqj05qQ0a99qJlZBUycMHyAIhiZajJGf0vZ6mhJ10SaO0AOvMOcyTlGHAbhQ5og/feOHTbuIFBGJMIJM7SV77tJpctmWUx0717G2Bg7EcvZjlmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Te/RFej6; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Te/RFej6"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2351227b098so23144015ad.2
        for <linux-doc@vger.kernel.org>; Sat, 07 Jun 2025 09:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749314322; x=1749919122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1vLZfGdsk77ss346BEUhTNTYQdyXj7pd49WUq/3ORhE=;
        b=Te/RFej6u7gGU7Pzy8XPyc8noMzq0aHUvdJV9njew4TkT6SxS+tZ9Qn3oK15Xqmg9s
         deckfvXA93FbFe8JBww6AN5zLKwVPlwtt0u0aRywfiZ5F3srWXkmwlMYiPKNUnII1JhH
         hXakgkklvx3aeYNRUFZcNF4C+2iOqmY0ne6ZF1Mwghdoa2wVhWUI+9JtP5Ize7bceyx/
         JTzK/zZs/XWOZxAlOKpA6Ws6UCGQErE9U4YsCLvGRDfP4ljwk4BSKGDC8Uh8/VBothNt
         okSgyU68ar1l8yjabCZyi84OX3xmULBqaf1r2HpJrYvXqs5LVLIxOK4A0ZFgPvIan/Vq
         prjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749314322; x=1749919122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1vLZfGdsk77ss346BEUhTNTYQdyXj7pd49WUq/3ORhE=;
        b=tPB24xYLzE+H4S/vlMokBOz5ot04DFr9LYfO52XI7Rr5/3XryggzFSOWUqNxMmZAKQ
         yfB3AMBmHR5cKQQyj1B+2apXtj8z+Fv777f+pK6TMkstsUgQXrp32mZzFyerXKNhKkcv
         4V6WPt9wBfeJL8eZwxLQbu/91u68jhDCgfe5kyMNZ9B/VAj3g3BKzEkYuzmN2Vs82hUX
         0TkNkKmKKXKmdFQlM0NN7X0wJzU/nvUm+sW//wSDUtiCjx/RN8P5e7coHyqzMGSq4qZt
         3zCyP21l3qe2lYIZ2/G4OZmcHiPDvamHOg5jjm25NLWkIOtnCjO25cW5HS5j8mNrmk72
         8mGw==
X-Forwarded-Encrypted: i=1; AJvYcCUoNYHTVstgwnYpkZ+EVCGKhuygWZDlolTNfsa13UEI2MmsMRVImsbB3SPefmudTdaLFW23gmeRf2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YypXf02tyThwA/lhqL4vhWAqEEuRSdEYSCQElIkRbGTM8sflXFk
	Aoc0iawI/o2IV3blZCZahMLCiaPWx9DAAvE0xOcejMeOTXUFQ5DEYrrc
X-Gm-Gg: ASbGncvqD1Eo3PABfzXZl5hJTXuKmEnYsoUqQ1isQoeYwweLx1ylZxb6kjxhdN23gkn
	1TwNTruzo5YaXz6p/z3HqjkY2WMpY3k/oph0LmcIS7bNx46O8mb8/2zbakyCrKF3hTTXcyqWSb6
	QohnNM7Y1i9NL3ixPt3g/7DJd971rxYzR5fkf460qwryAVJBLJ/R1H2zGBZD6yo4AH8UlovBCeg
	WjznXmOzUbYWWodtHj2rM4C78gsZsY0Fw2m0sdNLkvmX3NX08BaqwFlv7JXqGmaIzm1/8fKmmoW
	6NMVNqjnc09ef9ZDIReUT4vXFv0rAoMtRkVkWAgsJ8MdgH4Jnjx1HOdfs5Xc/b9fvPfu
X-Google-Smtp-Source: AGHT+IGWJV+6o8t7X1svZMO22fe6+5Gl5bQVPLQUlybkn5Fvhr88ZTkmx6d7gSIGL0Ogcu9Oi9q0ow==
X-Received: by 2002:a17:902:f70f:b0:235:1962:1bf4 with SMTP id d9443c01a7336-23601cfe4bamr113701515ad.14.1749314321932;
        Sat, 07 Jun 2025 09:38:41 -0700 (PDT)
Received: from localhost.localdomain ([223.72.62.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603078957sm28949535ad.41.2025.06.07.09.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 09:38:41 -0700 (PDT)
From: chris.wei.cui@gmail.com
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn
Cc: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	Cui Wei <chris.wei.cui@gmail.com>
Subject: [PATCH v3] Docs/zh_CN: Translate speculation.rst to Simplified Chinese
Date: Sun,  8 Jun 2025 00:38:13 +0800
Message-ID: <20250607163814.7800-1-chris.wei.cui@gmail.com>
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

Update the translation through commit 6382f4e4e7bd
("Documentation: fix speculation.rst chapter")

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

