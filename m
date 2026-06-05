Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D613BB139
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 03:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780630441; cv=none; b=ErGr4P8IKVL2uJK8u7XlSsCVqTStyLIykGijMAgJHBM3RV7i+jRUBSFxM0D+LUK2vZlS3CX6Jj5/RkS/S534lZzPaET2dgecs6i4J55TuecokQrT0lQ+OfC8wYlkPSJxsn8uN2R4teLma73Q5QA8sN5kUYhUJXfpfWNuqDkDf4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780630441; c=relaxed/simple;
	bh=eU1fOM4eOd3z2yeGVKb+QlTsoAWC8tuz1WiFB/USShI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pdvGvBSl4aeUO4KeOsOKvMdhAPtjbMnS8F7XnR++DLKd0D14+5BB8b9sx2Bjj1bJmkjoaMHsUXQKuwbMZ654USteSJIxsK0Da7TLZQSyFOi+liCu+xG4PyrUCkHPlCDh8k7mnA4mjENbwRMsygx2zb6IPwQ+7V0mRdBmqwbkyXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=PfIkSFJC; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="PfIkSFJC"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-9159f631656so165073885a.1
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 20:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780630439; x=1781235239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jYmKPVlEdqw9nJIpln28SQxgNWXUbITnOaKq2Dm+DFI=;
        b=PfIkSFJC+zV/o6fdsI/6c3+0vJ0o0jwIIpnyxNvKze0ap7rp+yjGJrvLdY9QbEohFT
         Qwm2MCJZKPyHGXgPXHT0w0VK4JJUUboaQpsa5D9CgxK6olxY3ztzbr5o6OOaoVCe3e+I
         8zshjfRj0Gp5cXUcmFeBaaCSu6jd95Nzzj0fCty1RvrT59rrEWImby0ymEEIjh8Ad5Po
         6ERVqtLVOy6y4BI1bZboowhNwuZXMJKYt4EcleWES4eGY09Bpeq3LlhjD/14COipbQ+F
         9f0KsTt0nq03AIqxtbuLrS6tdsm4IO5ylKwCWE93go4VTTL6gbOJ9exGwdI3yPPXYajR
         zCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780630439; x=1781235239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jYmKPVlEdqw9nJIpln28SQxgNWXUbITnOaKq2Dm+DFI=;
        b=DyNYUyisA5YwoM9dzbCmqau/Tpy93XcC8bYeByp8izs77WwCklZPU4IgJBJq7MiWnA
         Gs7EYxfHksR21u3/UG9X49AMLXwUVXeVteXumP2crCRpnTVqjab83H4Lw7bYUtx3AtTm
         Nhe/VU063GZgnkg8h24F4l0iIJA1ks5H4r6qFDuQtAB/cIhkWhEkw3q7GOzMZmP1CQIg
         2p3DLVunWPIIPpO44j7uMflJ5wrJ7UbdEitHbo1bRFsARX/7Bs4gcoZKPjdts9Ldh7ym
         lJtq1OyfLiyTnWul+17pLHvFRrl+3UhPwKIFBvX3z/Mo+XDsFI3qj/I4SiYArIVhkloJ
         i1rg==
X-Forwarded-Encrypted: i=1; AFNElJ+ybs5klu44dUW5vtLh8M7LPs4/rSdcbzs46Si+I5GhmrkiK6Pj/nC/GRklDT31Ey59408npmuZ6kE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1OtSf+XmQRkqWNaygTROqAqN4rxY2OMf8y93ID/l7Y4FqWyef
	ZakeXVEwls3ZXyKLhJlEGuHsX7X3OjmOa62B3YCcJGFnap76JAJIiQObU7KhCWQgRak=
X-Gm-Gg: Acq92OFWxhQG+Omo8URNKvPe+gUz/Ex7rjNtVQPrCrAp3irwqur3dDjaehYoCvehXtq
	ztWUnaOR5PvG4eq3JPAMUGvfiyEFdysxjYidVHkqxHkvuxWIR794AirPF8gOvBYeUQl5+xMraE7
	tv2uzP0r6+psIFn8rd/UD93AxP5mDe3hS1OQ7zUb6658VfMmOBxKpPSo3IcN9VNIdbr8q5carJr
	en147zcY0x18kMEGthdPxIv8Fhs1+Ma0DgSIotFjqcTTAblbY8HZuseGEoEL7KKtEyH+yu1kaJ+
	FOJY45tOgC3czEZcfLkwiQnKT1st0DjWeczYyBtw/NmgGUBLJZweThjhKC42tH1/R3ikM74+9N2
	D6l78Eal5VK4abSVvsJMLaI61bnzD/O8W6dlilbwkou75Gyd67jMjjZCrlspGiHu7VJnm4KfYjz
	naolEq7CELpgb2Cml8V7j7LpYerOMMCQBGCOPe0DmsSKqVglN9FcPUqN/pIsP54g==
X-Received: by 2002:a05:620a:450c:b0:8cd:d688:7aef with SMTP id af79cd13be357-915ad197c8dmr107318585a.19.1780630439344;
        Thu, 04 Jun 2026 20:33:59 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91589ea0bcfsm780607085a.0.2026.06.04.20.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 20:33:59 -0700 (PDT)
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
Subject: [RFC v1 7/9] kho: decouple radix tree compatibility from global KHO version
Date: Fri,  5 Jun 2026 03:32:33 +0000
Message-ID: <20260605033235.717351-8-pasha.tatashin@soleen.com>
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

Decouple the kho radix tree compatibility version from the global
KHO compatibility version KHO_FDT_COMPATIBLE.

Define the independent compatibility version "radix-v1" for the radix
tree KHO_RADIX_COMPATIBLE in radix_tree.h.

Integrate KHO_RADIX_COMPATIBLE into the composite root compatibility
string KHO_FDT_COMPATIBLE.

Additionally, document the new KHO Compatibility ABI under the
Documentation/core-api/kho/abi.rst section.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/core-api/kho/abi.rst     |  5 +++++
 include/linux/kho/abi/kexec_handover.h | 10 ++++++----
 include/linux/kho/abi/radix_tree.h     |  4 +++-
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/Documentation/core-api/kho/abi.rst b/Documentation/core-api/kho/abi.rst
index b61363679829..6acdb7c85239 100644
--- a/Documentation/core-api/kho/abi.rst
+++ b/Documentation/core-api/kho/abi.rst
@@ -10,6 +10,11 @@ Core Kexec Handover ABI
 .. kernel-doc:: include/linux/kho/abi/kexec_handover.h
    :doc: Kexec Handover ABI
 
+KHO Compatibility ABI
+=====================
+
+.. kernel-doc:: include/linux/kho/abi/compat.h
+
 vmalloc preservation ABI
 ========================
 
diff --git a/include/linux/kho/abi/kexec_handover.h b/include/linux/kho/abi/kexec_handover.h
index c893b5045078..49ac4b47cc3d 100644
--- a/include/linux/kho/abi/kexec_handover.h
+++ b/include/linux/kho/abi/kexec_handover.h
@@ -8,9 +8,8 @@
 
 #ifndef _LINUX_KHO_ABI_KEXEC_HANDOVER_H
 #define _LINUX_KHO_ABI_KEXEC_HANDOVER_H
-#include <linux/types.h>
-
-#include <asm/page.h>
+#include <linux/kho/abi/compat.h>
+#include <linux/kho/abi/radix_tree.h>
 
 /**
  * DOC: Kexec Handover ABI
@@ -85,7 +84,10 @@
  */
 
 /* The compatible string for the KHO FDT root node. */
-#define KHO_FDT_COMPATIBLE "kho-v4"
+#define KHO_FDT_COMPAT_BASE "kho-v4"
+#define KHO_FDT_COMPATIBLE						\
+	KHO_FDT_COMPAT_BASE						\
+	KHO_SUB_COMPAT(KHO_RADIX_COMPATIBLE)
 
 /* The FDT property for the preserved memory map. */
 #define KHO_FDT_MEMORY_MAP_PROP_NAME "preserved-memory-map"
diff --git a/include/linux/kho/abi/radix_tree.h b/include/linux/kho/abi/radix_tree.h
index f4cc5c02f37a..89cd7eb4a91d 100644
--- a/include/linux/kho/abi/radix_tree.h
+++ b/include/linux/kho/abi/radix_tree.h
@@ -20,7 +20,7 @@
  * This interface is a contract. Any modification to the structure fields,
  * compatible strings, or the layout of the serialization structures defined
  * here constitutes a breaking change. Such changes require incrementing the
- * version number in the `KHO_FDT_COMPATIBLE` string to prevent a new kernel
+ * version number in the `KHO_RADIX_COMPATIBLE` string to prevent a new kernel
  * from misinterpreting data from an old kernel.
  *
  * Changes are allowed provided the compatibility version is incremented;
@@ -94,6 +94,8 @@
  * 4KB.
  */
 
+#define KHO_RADIX_COMPATIBLE "radix-v1"
+
 /*
  * Defines constants for the KHO radix tree structure, used to track preserved
  * memory. These constants govern the indexing, sizing, and depth of the tree.
-- 
2.53.0

