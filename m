Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDEC3D1A98
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 03:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780630454; cv=none; b=PsI+VSEL2XeGd2bcXdOkpE4DdT5MfceoZ7mv5br98vkrI9MmdoI/Rb7cIOQOMvEqD0x1obczsYcdkcN3pyXTH5eS0ebByzsLtCkAuUAfGy9N1F8ewYvaxC76UVzrGXgCDxnUiueKUePeR9/BR4aZxwZfCe1cIztWfNFXRZLrU6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780630454; c=relaxed/simple;
	bh=gG+BMzTQAvQ99ajXilaSRudbxpmfCpeFzhzw+IUPT7Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eOzd0y/Y6o4z38+cYxfTbuv10TkQTOY0+A8y1Wx6md57FtauEzqyxr8LnXLzn3yK8cq7vUCLZvlu521jgKY/hz+uBBigV9+SEl8OrLa0oOlVLEFSD32A164z/5SDdLqBUc6jbguxITIdp/na6vQjMNoSq5DfGkBJ3kbLDIiKpc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=lGJL4ynJ; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="lGJL4ynJ"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-9157b94a07aso211435885a.0
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 20:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780630452; x=1781235252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YcWKgEizOcY9z0vq5q3df4Dwqk/3q2KHCFvnTeL730=;
        b=lGJL4ynJqM5hV2myVR4/CaQ0T32pZ5fy4ZVzaNNabzCaj0xXm9co9facJb0a2boji3
         YRtpNZVdrcCoqWRh9LL9YTI2nquCLecmsJIlqWuDItCpG+rKuV9/7ZPbD6iFxR38AJvT
         J1lVBTiaj3eVEiBBUOJgeGygq2+gYEDXHVib157pFnbR6g9gEgmdUYN1pJ1GhLBHduuD
         gK5ZJ/V5sfQ/jUgQrkaXHmoIbvlzEgn32w/bgr7MKuetzuDz0kWPGZdlywMtQxtRqfKK
         VbUU+5fBF7+KGKd5T7YUlb9Gt7KpZd3sk2X82RC5eBYOjA2naZWxpoqVtUDYdXx9IPSS
         VAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780630452; x=1781235252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2YcWKgEizOcY9z0vq5q3df4Dwqk/3q2KHCFvnTeL730=;
        b=C9uND+JM3EOpisDuAPz9aUG0WM39mxCBjuiaqFzPmmRcnXU2AYkkw/I/XTsrZMUOgO
         YyOsS1HEY9eX10h4AAo9XcRrgW8dyb4iKe4QLVLkd3aHXZxqFkAjDcxTEIx1MGxl8QI9
         XTU34UznUo2AODMJTxLOIYsknJjMwMT+6HLICO9xjAgJO7B86wZMt0EcZ3AevJr4CBkK
         P2QF2NPcNyT0ceCO+04pybVXBYOiWIqm+CVeY9FvyrQnqa37UB0S4l8kgI8VyPkl0Kxj
         1pNYZ8gQTgvXDpgT1UqPJ6TO+6h6Z3OxtGmq2BKkNzeElcORI8Ui6F8K7Z3fODno7IgL
         kTlA==
X-Forwarded-Encrypted: i=1; AFNElJ9LJr2VkDI9EdfVidj/foVWAJHI7yhn9vKaSLc75aW26zdhPjJdrKnTTfWKBQUvqlR2OvLEPn7S6nc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDtlNs2ICGG71ppHb8XvJ8Jzax91AlKMmily4g4pYNruUtO/a+
	R/7mKk488slcyd034Jc0oIkyatDT3Gk6oKAbT3Q2kYfnJfQTeabMyR8VdsGYtSC7H2I=
X-Gm-Gg: Acq92OFvcTtW0zuQfHrSxUgnDr2fHr4r4Iac6i+r+EAtfoRZQzUMyDcAwVAkA8oHsKx
	3OmHu5UPNgjOl05TQp2LfyfjnZb7fvr5nmFmJJoQgv88SRwoMZ76zaRrVAhKuRwZro3bg0O2jzF
	J1Tj0khEqDHqqT4XsLq/+GXFOs9AMc6PPZD3tYj0Pr21mg9RP6/VLAiuxtZltcNKCaNU8+AlxLu
	rIbqCE5P6baRPDnetJWIw7esSVblu2Uru7xrEgwCUkK4o+ldqeb77FV0psojZCWmY3laBj2Tnk9
	8Jb2+YKy6PODy1Ls8bHjIKdCDSi1t64U+yTEo6AX9QPTBDm0n736s9GdfApNwTaxvDK0ei6HlDW
	D68VzG078cw4b4P7jEkqEF91gq5flJnac8oA+1bu3CKABWCZBDbYjpeMHFpriGs73AVTd1hK5SE
	DJGT26jLO+T5xnlBWKZ/9lfrtCPQU3//Xc0By4BhTbP+U1iqJbIPMdoFOGylUN5g==
X-Received: by 2002:a05:620a:f0e:b0:915:a953:4b93 with SMTP id af79cd13be357-915a9c4b267mr362733285a.3.1780630451754;
        Thu, 04 Jun 2026 20:34:11 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00b474sm768496585a.10.2026.06.04.20.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 20:34:10 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	jasonmiu@google.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	ran.xiaokai@zte.com.cn,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	graf@amazon.com
Subject: [RFC v1 8/9] kho: decouple vmalloc compatibility from global KHO version and update memfd
Date: Fri,  5 Jun 2026 03:32:34 +0000
Message-ID: <20260605033235.717351-9-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260605033235.717351-1-pasha.tatashin@soleen.com>
References: <20260605033235.717351-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Decouple the vmalloc preservation compatibility version from the global
KHO compatibility version KHO_FDT_COMPATIBLE.

Define the independent compatibility version "vmalloc-v1" for vmalloc
preservation KHO_VMALLOC_COMPATIBLE in vmalloc.h.

Integrate KHO_VMALLOC_COMPATIBLE into the composite root compatibility
string KHO_FDT_COMPATIBLE.

Additionally, update the memfd compatibility string
MEMFD_LUO_FH_COMPATIBLE to include the vmalloc compatibility dependency,
and add a static assertion to verify its length limit.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/kho/abi/kexec_handover.h | 4 +++-
 include/linux/kho/abi/memfd.h          | 9 ++++++++-
 include/linux/kho/abi/vmalloc.h        | 6 ++++--
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/include/linux/kho/abi/kexec_handover.h b/include/linux/kho/abi/kexec_handover.h
index 49ac4b47cc3d..f048bc95fed3 100644
--- a/include/linux/kho/abi/kexec_handover.h
+++ b/include/linux/kho/abi/kexec_handover.h
@@ -10,6 +10,7 @@
 #define _LINUX_KHO_ABI_KEXEC_HANDOVER_H
 #include <linux/kho/abi/compat.h>
 #include <linux/kho/abi/radix_tree.h>
+#include <linux/kho/abi/vmalloc.h>
 
 /**
  * DOC: Kexec Handover ABI
@@ -87,7 +88,8 @@
 #define KHO_FDT_COMPAT_BASE "kho-v4"
 #define KHO_FDT_COMPATIBLE						\
 	KHO_FDT_COMPAT_BASE						\
-	KHO_SUB_COMPAT(KHO_RADIX_COMPATIBLE)
+	KHO_SUB_COMPAT(KHO_RADIX_COMPATIBLE)				\
+	KHO_SUB_COMPAT(KHO_VMALLOC_COMPATIBLE)
 
 /* The FDT property for the preserved memory map. */
 #define KHO_FDT_MEMORY_MAP_PROP_NAME "preserved-memory-map"
diff --git a/include/linux/kho/abi/memfd.h b/include/linux/kho/abi/memfd.h
index af310c0c9fdf..24ecbf48cbe1 100644
--- a/include/linux/kho/abi/memfd.h
+++ b/include/linux/kho/abi/memfd.h
@@ -11,7 +11,9 @@
 #ifndef _LINUX_KHO_ABI_MEMFD_H
 #define _LINUX_KHO_ABI_MEMFD_H
 
+#include <linux/kho/abi/compat.h>
 #include <linux/kho/abi/kexec_handover.h>
+#include <linux/kho/abi/luo.h>
 #include <linux/kho/abi/vmalloc.h>
 #include <linux/types.h>
 
@@ -89,6 +91,11 @@ struct memfd_luo_ser {
 } __packed;
 
 /* The compatibility string for memfd file handler */
-#define MEMFD_LUO_FH_COMPATIBLE	"memfd-v2"
+#define MEMFD_LUO_FH_COMPAT_BASE "memfd-v2"
+#define MEMFD_LUO_FH_COMPATIBLE						\
+	MEMFD_LUO_FH_COMPAT_BASE					\
+	KHO_SUB_COMPAT(KHO_VMALLOC_COMPATIBLE)
+
+static_assert(KHO_COMPAT_ALIGN(MEMFD_LUO_FH_COMPATIBLE) <= LIVEUPDATE_HNDL_COMPAT_LENGTH);
 
 #endif /* _LINUX_KHO_ABI_MEMFD_H */
diff --git a/include/linux/kho/abi/vmalloc.h b/include/linux/kho/abi/vmalloc.h
index 87650e1dd774..1847b82e147b 100644
--- a/include/linux/kho/abi/vmalloc.h
+++ b/include/linux/kho/abi/vmalloc.h
@@ -9,13 +9,13 @@
  *
  * The Kexec Handover ABI for preserving vmalloc'ed memory is defined by
  * a set of structures and helper macros. The layout of these structures is a
- * stable contract between kernels and is versioned by the KHO_FDT_COMPATIBLE
+ * stable contract between kernels and is versioned by the KHO_VMALLOC_COMPATIBLE
  * string.
  *
  * This interface is a contract. Any modification to the structure fields,
  * compatible strings, or the layout of the serialization structures defined
  * here constitutes a breaking change. Such changes require incrementing the
- * version number in the `KHO_FDT_COMPATIBLE` string to prevent a new kernel
+ * version number in the `KHO_VMALLOC_COMPATIBLE` string to prevent a new kernel
  * from misinterpreting data from an old kernel.
  *
  * Changes are allowed provided the compatibility version is incremented;
@@ -36,6 +36,8 @@
 #include <linux/types.h>
 #include <asm/page.h>
 
+#define KHO_VMALLOC_COMPATIBLE "vmalloc-v1"
+
 /* Helper macro to define a union for a serializable pointer. */
 #define DECLARE_KHOSER_PTR(name, type)	\
 	union {                        \
-- 
2.53.0

