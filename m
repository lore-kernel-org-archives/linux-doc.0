Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1356333E356
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 18:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764183455; cv=none; b=A14GeoH0KkymHDp+wrckG9zNwr1bPjeRf9sdG+kk+sqPSxZmbp5Fn+ZfdMTr1u4ES63uBxYHbEMy0unD3fV37ahA63wpwzfK3I1CuMjVdVig+zp5TiaMEzwp22YW0QKkC6LSE6KRmmeZT2ZJXGHdfWfXZtitsmD2qnjQU/WTzZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764183455; c=relaxed/simple;
	bh=de05t6Uooi6dbGpHaHB0GbWiclzXkAC6UDgDYumpOAQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PT45yetRQCsF/bv806dxcA0hFUfXJ3NUzRRnBiBA/3qVjGjmHytIi2YpbP0tf/bUSYPVFIHA41QDIyXdWvtJN+lVTpTFAySS7fJRtLs7IeZzqjr86BTnavSXEjVUasCf4gnQYOF6C2T7vm1yvdl3JnqNEzjOJRqlV2C98Kc5+PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=UAbsUlK3; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="UAbsUlK3"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6420c0cf4abso98696d50.1
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 10:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1764183452; x=1764788252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3EVogAUf9sZwvrZ2BPOSnajNqljKd+lPUBpF9BuiigE=;
        b=UAbsUlK3q0d1GcjmxxvZbR3rjY8z7tVQFc6ZlZ4i03Zol0TTlRxaQeigoNbvw4rDkS
         HnJz7a9itSXRaPZ7sWBGMoKmoOiF99FxIp4Dho5n39chdS9LpPjMp4uDt1kUcyxxg3Xb
         tuYH0dYLaCMZxXgNYfGK7n0wx81T66u1iqrTYpHlzQD8Kl3e3Xxd0Se0Jl01sMxGwAhj
         V//JWuSz7ksz6DQmJzSGLSHIkvPghMQVE4bvKlTCkGaiAkF3uaxK3wdxDuUFjoAN1IBb
         jDcqLUj6xsebYtgWm3WPhGtoVy7Mv5E2g/FKPg119fi5DFUTuF3ZTOVf8Z9lgD9QqROp
         l3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764183452; x=1764788252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3EVogAUf9sZwvrZ2BPOSnajNqljKd+lPUBpF9BuiigE=;
        b=F4bOFnDuF8hVk8ypaQ9BQxqCNqfHs0q4cMTl/3Frp0YR6ZSVcuGnbJPcxhAGgkxL9z
         xguJCrq7fkJuxWFawUhXV3IfTmvAyKuXZL6dFXsdSS/RQt/+5mQy6rjERehsf8d5Gztd
         5onu0oBySR2kLncRsA1CCOHYDvsVA467N6SWaQAdnvW1ctlTtIXC7dHE1IhHtCRic6m5
         G82KmOO0vTx9yuuW+zJzlXydGCQi51mrrQYc9FkAoJBBPkAlxRiiMXLqwfNRKC9jBv0G
         Vl5LONvM8f9/asm1piBry7WbOIeomcFIvGwvL0W1OyLaJZ0xdUbMm9vZP0YypeuQtaxs
         uLVg==
X-Forwarded-Encrypted: i=1; AJvYcCVxzNIg8fud1JYGmimsvkAJRVXJoiLJK49he32IcOzSRzpp/YalcvC+5MUAptWTcgs3Pzd+7RFi4wg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD0uTwIJLGvs9MyOXwl33t0E2u/1Z/lFZJPX9jM4y4WG3BabWA
	zZr7utv8kHxgK2DV7aeTAs+0zPWo9acM5kg341hfDFzhuaZv0tcnmBupKMNuw0Mv1Wo=
X-Gm-Gg: ASbGncsv1eCI1lN4oWzmRTwFQIpN15btQraonHFyg7A6zO0fvTwCbKbszGCqjFV3B05
	hyFFUSV791jWXytwSesqmGzpVQ2lCWDyITPqlf3m+K8wnif/EQ6LFl2GCgLPFdHyxvr/Ljap31y
	JzGqHwBvtOdDTikWvBPLXxbiIXv58K2QEcbBLjbC6RXt3qsG+8DH4RxMPNVkjWW36sxCK7Nu/BE
	w+0QyW351DleR6houSv6lzYqSchEQSGKdNGHz2NASlc1u7kdCr/l18TZF1RfMe7SZtCdhokSouO
	Iig1STizmBboGGsMg65HbuixneTdV+qstRWFlJl4CntHcB4a/XfTjVtUOp6ZN9HkjBoI9Vsd/Sc
	EzBwkjYZV1s3RFrgKEa/93qKuZq1uTnIWnOcyDXJBtzfI/5VnEWS6qSE/mu7TiOgAKhLnuOSttC
	7mmtBUJq3Wu8fyGX5t8MUZsMIJKWa4yWXjkpFfMkjH/vgEocYV0ENTQtBD1V+OXJNp7XQPe2ZPq
	qWXUA4=
X-Google-Smtp-Source: AGHT+IGolbW5+rjOQ0Yye2rYIz9onkgz5B5ar70qXCIQenbc39w0zKLELoUeY+9t55wUha7BmD2pxQ==
X-Received: by 2002:a05:690e:1542:20b0:642:836:1048 with SMTP id 956f58d0204a3-64302a8f272mr13099532d50.2.1764183451962;
        Wed, 26 Nov 2025 10:57:31 -0800 (PST)
Received: from soleen.c.googlers.com.com (182.221.85.34.bc.googleusercontent.com. [34.85.221.182])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-643259fd696sm2960753d50.7.2025.11.26.10.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 10:57:31 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: corbet@lwn.net,
	pasha.tatashin@soleen.com,
	nicolas.frattaroli@collabora.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	kees@kernel.org,
	davidgow@google.com,
	pmladek@suse.com,
	tamird@gmail.com,
	raemoar63@gmail.com,
	ebiggers@kernel.org,
	diego.daniel.professional@gmail.com,
	rppt@kernel.org,
	pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	dmatlack@google.com,
	rientjes@google.com
Subject: [PATCH v1 2/3] list: add kunit test for private list primitives
Date: Wed, 26 Nov 2025 13:57:24 -0500
Message-ID: <20251126185725.4164769-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.52.0.487.g5c8c507ade-goog
In-Reply-To: <20251126185725.4164769-1-pasha.tatashin@soleen.com>
References: <20251126185725.4164769-1-pasha.tatashin@soleen.com>
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
---
 lib/Kconfig.debug             | 14 +++++++
 lib/tests/Makefile            |  1 +
 lib/tests/list-private-test.c | 76 +++++++++++++++++++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 lib/tests/list-private-test.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 42143686151f..fa9388726182 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2788,6 +2788,20 @@ config LIST_KUNIT_TEST
 
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
2.52.0.487.g5c8c507ade-goog

