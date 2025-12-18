Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A278D35CBA4
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 15:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766073482; cv=none; b=AP8CkU2vbQvpvt+FNxSAY3Yc0J5NWKzu/hmTa9PsJFfxVgUmWkbIfhSEfAlZ67aXaqknwYErhCMv5LsfDb/uR5NMNEO9yUNS3cxNd774fVCSjCQ3B9MZmWIoarCfXoW2xVF43klLdVQ3aBCAM6Osq/h/12ahYOZ0u2UaEmRtUMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766073482; c=relaxed/simple;
	bh=0uIjXiSfKXJsekxj2jXNJkZnwnfVaKOJS9PAFo18MwY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u5EzFlJBB49PALw7BsyDDpMIjgPkJdXu/dSoKvVYQUWBVZfBXcEiPfdcEq3sF5JrlgLQ6q7QK7G+Dgl2tAXyqrGVaduFzLRS63/IrRheQ8LpaAGJRq6MH2gOys6pmCYZ3dMbECKsWzwxca8V8LdSO/2khEQN/hSpW+PahEZgDoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=a3LCiY8d; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="a3LCiY8d"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78c33f74b72so6687847b3.2
        for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 07:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1766073479; x=1766678279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AcOvnHWobOJImJ9+yLd9Iro//IQRqb2Fo3tMfUM+ra0=;
        b=a3LCiY8dnDCD00U3FWftjAAUoMntE55IQtXHnZQRc3YCV0WG8UjfJWR0rljLSDMfZn
         ACOAqK3Yln9EHRF0FMmT4a+4tjhFRkHDJLLqTfFwvp5AD6tNp79dmZqIQlrTJv145WtY
         hCNGNnvMCmfmwE8nm1xT4jrXQ9RYoXwQ72AiSL6BgoIxCAPh0CvRNBkpjKOxtLUqTdGv
         plMA/UadNplS8eM/citvCw0NrFG+5JkHebDKRgi4N83aXuaSLqFwBKEJdpkhifw8B239
         3hx3g1ZLK9IbGK9WeKSsw/+C+e3yY8HiGYIy889QdHiRyALTjUR5hgz5DaAFmUTauZ/5
         cnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766073479; x=1766678279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AcOvnHWobOJImJ9+yLd9Iro//IQRqb2Fo3tMfUM+ra0=;
        b=ZjgWzpALQt2qABKBk3qK9ZRxtM15gH6PYcBcvDKCdMoks4zj7etXySvWK0Cprl8fa/
         rTc06H7+xQFIjrTOT/YijB6iBrRI3GSo4VTCuQiMntr6ns1ggnnQPu3MWo67A8dI3PT+
         45/sRVe04rrE+bXi+KXs4otCsj3szmZt6FeiDAW6W5dbHdj2gskU1RW6e1nf5EtmlkKa
         eMvOwgdnzzt0XAMM01hSJwqIBZb9e/NvkKstkUP4AR8TGCs/ympwa7DmfauSFed+O29O
         C5GHfnTnujBNAbSWMp/wiFrt674rOCK4Xy/meqcJo0mX3gxG6bbl/wz0ku6x9IE0EIyZ
         cBwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCbsluJyiDAfG/33vFrXmVGcPCK2WNWvb5mWB49C7mPhsxJ8b+cv5V7LSfJiY/fdbi/1PKxNmPnZs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxVH9ZKsAHP+3w3+CElFrE3VYmrf2HYjB+V2mCYaX2Im35yvzu
	zWBdWKe2GUNdQnef618hg5a9QaFZ88AgMsQofZa8lKZiG+AoPPliF6Hvmmji9r8OLVs=
X-Gm-Gg: AY/fxX6AGmMmM8aTOW6Yc6v9DmblfjRiF9VjOJIQR8M8ap20zj0Ej+9n9uCJYYSPwD4
	GoFWhav93jsB8BLq+41qYUSEkSC/Qt41g8uot+m9TMMW7JCXHMpa7ImDw8YEGbf7wAuAaXrYZnp
	UNaXOCVKYig95nuq/vbp0SqNYE+UwCzb9OSlluhw9IirtXn9B2U10eScUQgpkYttxaKOPi3EXuP
	vb98M32FVyiAZMs8zRrrNWyxMpJ+GC6s2c0yrOla8Y6lembrmWuOYx5EUWpz2qLeabnuK3Ugw+K
	wPAA4/ErJnUiw2P5mEKLjvldJTdsqSclwB9AhygILj/f5XmpONvLgh8T0WgF3lDcbUUfSzQI3BM
	Ci7QJIZdK5t4ymNKLPEgEV6KOXoOOvQE8deletFZ+9R8mH1KcHq19A3h5HidHhrbGW0/d3K2LCR
	apf16d9f9PKmUP5DDlnm8cPxOtT6HESUx4XEWwzl0jGAX1MjQU0AE6ySE4jrI3zYHoCAS4mjZO2
	fllc1SRuv2sCZv1Lq0tGGhHqwZYFU1dGNTLeRJ2/LdEyKRr
X-Google-Smtp-Source: AGHT+IEYVI4xmnIoyWHSo+wiOgJ8nZ11rScqcyjI/WOKq7qIsIfRW0MCIFb99g29Da6mCYYfpuOfzA==
X-Received: by 2002:a05:690c:3349:b0:78f:afb1:8cb9 with SMTP id 00721157ae682-78fafb1a6e8mr8750757b3.20.1766073479531;
        Thu, 18 Dec 2025 07:57:59 -0800 (PST)
Received: from soleen.c.googlers.com.com (182.221.85.34.bc.googleusercontent.com. [34.85.221.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fa6f52bb2sm9348467b3.16.2025.12.18.07.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 07:57:59 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	skhawaja@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	akpm@linux-foundation.org,
	kees@kernel.org,
	davidgow@google.com,
	pmladek@suse.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	nicolas.frattaroli@collabora.com,
	linux-doc@vger.kernel.org,
	tamird@gmail.com,
	raemoar63@gmail.com,
	graf@amazon.com
Subject: [PATCH v2 2/5] list: add kunit test for private list primitives
Date: Thu, 18 Dec 2025 10:57:49 -0500
Message-ID: <20251218155752.3045808-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.52.0.313.g674ac2bdf7-goog
In-Reply-To: <20251218155752.3045808-1-pasha.tatashin@soleen.com>
References: <20251218155752.3045808-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a KUnit test suite for the new private list primitives.

The test defines a struct with a __private list_head and exercises every
macro defined in <linux/list_private.h>.

This ensures that the macros correctly handle the ACCESS_PRIVATE()
abstraction and compile without warnings when acting on private members,
verifying that qualifiers are stripped and offsets are calculated
correctly.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: David Gow <davidgow@google.com>
---
 lib/Kconfig.debug             | 14 +++++++
 lib/tests/Makefile            |  1 +
 lib/tests/list-private-test.c | 76 +++++++++++++++++++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 lib/tests/list-private-test.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index ba36939fda79..0760b24f7cd6 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2780,6 +2780,20 @@ config LIST_KUNIT_TEST
 
 	  If unsure, say N.
 
+config LIST_PRIVATE_KUNIT_TEST
+	tristate "KUnit Test for Kernel Private Linked-list structures" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This builds the KUnit test for the private linked-list primitives
+	  defined in include/linux/list_private.h.
+
+	  These primitives allow manipulation of list_head members that are
+	  marked as private and require special accessors (ACCESS_PRIVATE)
+	  to strip qualifiers or handle encapsulation.
+
+	  If unsure, say N.
+
 config HASHTABLE_KUNIT_TEST
 	tristate "KUnit Test for Kernel Hashtable structures" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/lib/tests/Makefile b/lib/tests/Makefile
index 601dba4b7d96..62a7f115f622 100644
--- a/lib/tests/Makefile
+++ b/lib/tests/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_TEST_IOV_ITER) += kunit_iov_iter.o
 obj-$(CONFIG_IS_SIGNED_TYPE_KUNIT_TEST) += is_signed_type_kunit.o
 obj-$(CONFIG_KPROBES_SANITY_TEST) += test_kprobes.o
 obj-$(CONFIG_LIST_KUNIT_TEST) += list-test.o
+obj-$(CONFIG_LIST_PRIVATE_KUNIT_TEST) += list-private-test.o
 obj-$(CONFIG_KFIFO_KUNIT_TEST) += kfifo_kunit.o
 obj-$(CONFIG_TEST_LIST_SORT) += test_list_sort.o
 obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
diff --git a/lib/tests/list-private-test.c b/lib/tests/list-private-test.c
new file mode 100644
index 000000000000..3bd62939ae67
--- /dev/null
+++ b/lib/tests/list-private-test.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit compilation/smoke test for Private list primitives.
+ *
+ * Copyright (c) 2025, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+#include <linux/list_private.h>
+#include <kunit/test.h>
+
+/*
+ * This forces compiler to warn if you access it directly, because list
+ * primitives expect (struct list_head *), not (volatile struct list_head *).
+ */
+#undef __private
+#define __private volatile
+
+/* Redefine ACCESS_PRIVATE for this test. */
+#undef ACCESS_PRIVATE
+#define ACCESS_PRIVATE(p, member) \
+	(*((struct list_head *)((unsigned long)&((p)->member))))
+
+struct list_test_struct {
+	int data;
+	struct list_head __private list;
+};
+
+static void list_private_compile_test(struct kunit *test)
+{
+	struct list_test_struct entry;
+	struct list_test_struct *pos, *n;
+	LIST_HEAD(head);
+
+	INIT_LIST_HEAD(&ACCESS_PRIVATE(&entry, list));
+	list_add(&ACCESS_PRIVATE(&entry, list), &head);
+	pos = &entry;
+
+	pos = list_private_entry(&ACCESS_PRIVATE(&entry, list), struct list_test_struct, list);
+	pos = list_private_first_entry(&head, struct list_test_struct, list);
+	pos = list_private_last_entry(&head, struct list_test_struct, list);
+	pos = list_private_next_entry(pos, list);
+	pos = list_private_prev_entry(pos, list);
+	pos = list_private_next_entry_circular(pos, &head, list);
+	pos = list_private_prev_entry_circular(pos, &head, list);
+
+	if (list_private_entry_is_head(pos, &head, list))
+		return;
+
+	list_private_for_each_entry(pos, &head, list) { }
+	list_private_for_each_entry_reverse(pos, &head, list) { }
+	list_private_for_each_entry_continue(pos, &head, list) { }
+	list_private_for_each_entry_continue_reverse(pos, &head, list) { }
+	list_private_for_each_entry_from(pos, &head, list) { }
+	list_private_for_each_entry_from_reverse(pos, &head, list) { }
+
+	list_private_for_each_entry_safe(pos, n, &head, list)
+		list_private_safe_reset_next(pos, n, list);
+	list_private_for_each_entry_safe_continue(pos, n, &head, list) { }
+	list_private_for_each_entry_safe_from(pos, n, &head, list) { }
+	list_private_for_each_entry_safe_reverse(pos, n, &head, list) { }
+}
+
+static struct kunit_case list_private_test_cases[] = {
+	KUNIT_CASE(list_private_compile_test),
+	{},
+};
+
+static struct kunit_suite list_private_test_module = {
+	.name = "list-private-kunit-test",
+	.test_cases = list_private_test_cases,
+};
+
+kunit_test_suite(list_private_test_module);
+
+MODULE_DESCRIPTION("KUnit compilation test for private list primitives");
+MODULE_LICENSE("GPL");
-- 
2.52.0.313.g674ac2bdf7-goog

