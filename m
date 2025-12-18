Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A2035CBD7
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 15:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766073487; cv=none; b=MVmbW/I0XjsV0kw1Xh2Kebhokt5+2oJfOgAbu36ImfgnzKHN27CLGNqt8HdUgAGXhmiXJQW7OGYp/YRv6tSP3DWHGWDlhpXAVG2op/yLWqhjKZzXmOw0tmnLWhMdWoW4FZl9ZJW+MzDJVBYPFyYdSHxLZ/d/yBCVQdqt8nvSZVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766073487; c=relaxed/simple;
	bh=FMjdBmMGwwhHssNMW8N3x0mp46UX3zaLEfgfZTx3lzU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MFj1kPgcOPYBstSKKZ1l8YE5uXqpgvNZDasOiJmltzTrzpS9/muNRhBFP2rEYBHT5GBZVwFbwGv78zJuEl5H1mRn67UMuumoMGFzm9lC0mJUJ++8MYsLtmYDVLZkzbWNULcuFySe1SSHLwf9n92twWhnWopok/yOQdJLsGODY3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=hM7hkEe4; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="hM7hkEe4"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64467071f9fso611008d50.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 07:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1766073482; x=1766678282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2GvxvWgw+C5A6znHXWAufIHkp3YvrzYE+ZzMWkjVVs=;
        b=hM7hkEe4ihM7iu1VXXFA425y7KzdfJRbUFpGM9A5qxEfR0yb3058W7T+44M8YBRom/
         ew84rRu3b+JQg2Iidyru8mRY/uQBilX3UpHNWkFW6z6615FBI0zIbaQKMpST7LTeUkos
         jyl00un7XWek948CuOPqcZNP3j3t1cf3YjiHv/rVATgxRziKIksgJcvVbeOT+5WZ1Ffl
         uLhJxf4ZPYV3Itf6oySriB4ucx5QPH8lP/qrJEWF+ejgky7M9jN0U1LWgTYgz9tFV6eG
         dYadHHl6PZnQ1Md1wdQq3/zeQBMzE5zusozH1Uo69S8n5v+8di/oE/3IVoew+9TA/Z/z
         TasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766073482; x=1766678282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y2GvxvWgw+C5A6znHXWAufIHkp3YvrzYE+ZzMWkjVVs=;
        b=fpONIeu/molmfCWS0gT+YhiyPQswSrZ4pepMqfafWaX3SZrYDLFfZX93/HmBvojYPU
         S+vy72nwKr8OdXTuMld8c9gGwB/xd3J7PCrWt4rOZ6nbYpEwmfnKle5ejmhrGlNuv7/Z
         z1DouS+khvGvcwsVjcQQXrGGn6YfmmPAVvwU/MRxV5kxCj1F6D+iH476LeqBoNdMk7QM
         FMps1AWhDlVodSdEdJdUa4BqJUnTRhh8S8+J/cnsXG8fhhOTSfXYWb7PDiUpw6WCvRtO
         +VUGOnG3x8/W8zdTOn2pGulOqlmTmSlpRbCgyMnGQhIg8xK5NHB61EyZ0XNhrQwnMU/R
         wVtw==
X-Forwarded-Encrypted: i=1; AJvYcCUoEuLQiiLhhddPyODBCI8/+rsmet9nElY5chDuyVbrvjcV5jmWghaxCGFuD+tmkVaSP6liMYUnw/c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0coxPqsLqTIj476EgmH6D5Uj3lmAyWEaL7AY+uDA6SJ4xaT4v
	2Ib5SRxxBf+ZMoblWVxe6/DEYqZnZxYp4+XnOUk0k/lMesJDNAyy+xJUUmhGnnEfNMc=
X-Gm-Gg: AY/fxX5Yt2P0gm9cMeyfsXMgD8xf7xShYKO40XKzwBEKbEeFqFimd8iYo7Ve3JZWBN0
	u6g+4J+V4pJ/qDiP6Gr3re3SNEmssc84lEe+RNeQo11/XtFq9Umi4LWUeS9uaEq8Iht5VChBCFd
	x8pWw+9q97IXGZKy2qDZahabKaRQuionK1BXLkQKbs6vEsB9XW08bAHq+3Gx5tpSL7YeswTXLQ1
	I62xdnDyfWrqRz04g1dY1UBGzKnixqWShsgdHy8z578qWCfd+7TNqSJ1XskDmXwMkeg5HnK/5M/
	9skeH41xGZnc3+xokLmtA/ql63Zgs6GGAFQ/0e9eN5O+LKZIzcMXDfcKJd0yvp6dxWwCvrYSc4e
	o62HZmpA6BjXoXF2mjlvvJrjuYwkAqDoL/4bBwOMcodR7PuKgNBnoTEqNT4g5hRBjVgwi/IYB+S
	UP/gymKGWcmh/ABNZIJtZh1GrNz3a2GH4sZCqx0MefTbR84HwtKMCRmfiklcMwyNRDy+TcPZ7/A
	7acEAPKpqngm6tBcFx4Rx6ju6hGXolPojH6eA==
X-Google-Smtp-Source: AGHT+IFmbIoqILeKHhuczXPRMgfqJxIXux1ceJzUQG9pkHU0LZvckHem2z07ZnG7v2PKrT/gLLGB4Q==
X-Received: by 2002:a53:c082:0:b0:63f:c487:17ab with SMTP id 956f58d0204a3-64555651309mr19343654d50.47.1766073482595;
        Thu, 18 Dec 2025 07:58:02 -0800 (PST)
Received: from soleen.c.googlers.com.com (182.221.85.34.bc.googleusercontent.com. [34.85.221.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fa6f52bb2sm9348467b3.16.2025.12.18.07.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 07:58:02 -0800 (PST)
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
Subject: [PATCH v9 5/5] tests/liveupdate: Add in-kernel liveupdate test
Date: Thu, 18 Dec 2025 10:57:52 -0500
Message-ID: <20251218155752.3045808-6-pasha.tatashin@soleen.com>
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

Introduce an in-kernel test module to validate the core logic of the
Live Update Orchestrator's File-Lifecycle-Bound feature. This
provides a low-level, controlled environment to test FLB registration
and callback invocation without requiring userspace interaction or
actual kexec reboots.

The test is enabled by the CONFIG_LIVEUPDATE_TEST Kconfig option.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 MAINTAINERS                      |   1 +
 include/linux/kho/abi/luo.h      |   5 +
 kernel/liveupdate/luo_file.c     |   8 +-
 kernel/liveupdate/luo_internal.h |   8 ++
 lib/Kconfig.debug                |  23 +++++
 lib/tests/Makefile               |   1 +
 lib/tests/liveupdate.c           | 158 +++++++++++++++++++++++++++++++
 7 files changed, 203 insertions(+), 1 deletion(-)
 create mode 100644 lib/tests/liveupdate.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..dac0f87eba5b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14641,6 +14641,7 @@ F:	include/linux/liveupdate.h
 F:	include/linux/liveupdate/
 F:	include/uapi/linux/liveupdate.h
 F:	kernel/liveupdate/
+F:	lib/tests/liveupdate.c
 F:	mm/memfd_luo.c
 F:	tools/testing/selftests/liveupdate/
 
diff --git a/include/linux/kho/abi/luo.h b/include/linux/kho/abi/luo.h
index 2734d1020dda..4a1cc6a5f3f8 100644
--- a/include/linux/kho/abi/luo.h
+++ b/include/linux/kho/abi/luo.h
@@ -239,4 +239,9 @@ struct luo_flb_ser {
 	u64 count;
 } __packed;
 
+/* Kernel Live Update Test ABI */
+#ifdef CONFIG_LIVEUPDATE_TEST
+#define LIVEUPDATE_TEST_FLB_COMPATIBLE(i)	"liveupdate-test-flb-v" #i
+#endif
+
 #endif /* _LINUX_KHO_ABI_LUO_H */
diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index cade273c50c9..35d2a8b1a0df 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -864,6 +864,8 @@ int liveupdate_register_file_handler(struct liveupdate_file_handler *fh)
 	list_add_tail(&ACCESS_PRIVATE(fh, list), &luo_file_handler_list);
 	luo_session_resume();
 
+	liveupdate_test_register(fh);
+
 	return 0;
 
 err_resume:
@@ -895,8 +897,10 @@ int liveupdate_unregister_file_handler(struct liveupdate_file_handler *fh)
 	if (!liveupdate_enabled())
 		return -EOPNOTSUPP;
 
+	liveupdate_test_unregister(fh);
+
 	if (!luo_session_quiesce())
-		return -EBUSY;
+		goto err_register;
 
 	if (!list_empty(&ACCESS_PRIVATE(fh, flb_list)))
 		goto err_resume;
@@ -909,5 +913,7 @@ int liveupdate_unregister_file_handler(struct liveupdate_file_handler *fh)
 
 err_resume:
 	luo_session_resume();
+err_register:
+	liveupdate_test_register(fh);
 	return err;
 }
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index 99db13d99530..8083d8739b09 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -107,4 +107,12 @@ int __init luo_flb_setup_outgoing(void *fdt);
 int __init luo_flb_setup_incoming(void *fdt);
 void luo_flb_serialize(void);
 
+#ifdef CONFIG_LIVEUPDATE_TEST
+void liveupdate_test_register(struct liveupdate_file_handler *fh);
+void liveupdate_test_unregister(struct liveupdate_file_handler *fh);
+#else
+static inline void liveupdate_test_register(struct liveupdate_file_handler *fh) { }
+static inline void liveupdate_test_unregister(struct liveupdate_file_handler *fh) { }
+#endif
+
 #endif /* _LINUX_LUO_INTERNAL_H */
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 0760b24f7cd6..7c94961bf49d 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2819,6 +2819,29 @@ config LINEAR_RANGES_TEST
 
 	  If unsure, say N.
 
+config LIVEUPDATE_TEST
+	bool "Live Update Kernel Test"
+	default n
+	depends on LIVEUPDATE
+	help
+	  Enable a built-in kernel test module for the Live Update
+	  Orchestrator.
+
+	  This module validates the File-Lifecycle-Bound subsystem by
+	  registering a set of mock FLB objects with any real file handlers
+	  that support live update (such as the memfd handler).
+
+	  When live update operations are performed, this test module will
+	  output messages to the kernel log (dmesg), confirming that its
+	  registration and various callback functions (preserve, retrieve,
+	  finish, etc.) are being invoked correctly.
+
+	  This is a debugging and regression testing tool for developers
+	  working on the Live Update subsystem. It should not be enabled in
+	  production kernels.
+
+	  If unsure, say N
+
 config CMDLINE_KUNIT_TEST
 	tristate "KUnit test for cmdline API" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/lib/tests/Makefile b/lib/tests/Makefile
index 62a7f115f622..439a99c8d32c 100644
--- a/lib/tests/Makefile
+++ b/lib/tests/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_LIST_PRIVATE_KUNIT_TEST) += list-private-test.o
 obj-$(CONFIG_KFIFO_KUNIT_TEST) += kfifo_kunit.o
 obj-$(CONFIG_TEST_LIST_SORT) += test_list_sort.o
 obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
+obj-$(CONFIG_LIVEUPDATE_TEST) += liveupdate.o
 
 CFLAGS_longest_symbol_kunit.o += $(call cc-disable-warning, missing-prototypes)
 obj-$(CONFIG_LONGEST_SYM_KUNIT_TEST) += longest_symbol_kunit.o
diff --git a/lib/tests/liveupdate.c b/lib/tests/liveupdate.c
new file mode 100644
index 000000000000..496d6ef91a30
--- /dev/null
+++ b/lib/tests/liveupdate.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright (c) 2025, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME " test: " fmt
+
+#include <linux/cleanup.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/liveupdate.h>
+#include <linux/module.h>
+#include "../../kernel/liveupdate/luo_internal.h"
+
+static const struct liveupdate_flb_ops test_flb_ops;
+#define DEFINE_TEST_FLB(i) {						\
+	.ops = &test_flb_ops,						\
+	.compatible = LIVEUPDATE_TEST_FLB_COMPATIBLE(i),		\
+}
+
+/* Number of Test FLBs to register with every file handler */
+#define TEST_NFLBS 3
+static struct liveupdate_flb test_flbs[TEST_NFLBS] = {
+	DEFINE_TEST_FLB(0),
+	DEFINE_TEST_FLB(1),
+	DEFINE_TEST_FLB(2),
+};
+
+#define TEST_FLB_MAGIC_BASE 0xFEEDF00DCAFEBEE0ULL
+
+static int test_flb_preserve(struct liveupdate_flb_op_args *argp)
+{
+	ptrdiff_t index = argp->flb - test_flbs;
+
+	pr_info("%s: preserve was triggered\n", argp->flb->compatible);
+	argp->data = TEST_FLB_MAGIC_BASE + index;
+
+	return 0;
+}
+
+static void test_flb_unpreserve(struct liveupdate_flb_op_args *argp)
+{
+	pr_info("%s: unpreserve was triggered\n", argp->flb->compatible);
+}
+
+static int test_flb_retrieve(struct liveupdate_flb_op_args *argp)
+{
+	ptrdiff_t index = argp->flb - test_flbs;
+	u64 expected_data = TEST_FLB_MAGIC_BASE + index;
+
+	if (argp->data == expected_data) {
+		pr_info("%s: found flb data from the previous boot\n",
+			argp->flb->compatible);
+		argp->obj = (void *)argp->data;
+	} else {
+		pr_err("%s: ERROR - incorrect data handle: %llx, expected %llx\n",
+		       argp->flb->compatible, argp->data, expected_data);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void test_flb_finish(struct liveupdate_flb_op_args *argp)
+{
+	ptrdiff_t index = argp->flb - test_flbs;
+	void *expected_obj = (void *)(TEST_FLB_MAGIC_BASE + index);
+
+	if (argp->obj == expected_obj) {
+		pr_info("%s: finish was triggered\n", argp->flb->compatible);
+	} else {
+		pr_err("%s: ERROR - finish called with invalid object\n",
+		       argp->flb->compatible);
+	}
+}
+
+static const struct liveupdate_flb_ops test_flb_ops = {
+	.preserve	= test_flb_preserve,
+	.unpreserve	= test_flb_unpreserve,
+	.retrieve	= test_flb_retrieve,
+	.finish		= test_flb_finish,
+	.owner		= THIS_MODULE,
+};
+
+static void liveupdate_test_init(void)
+{
+	static DEFINE_MUTEX(init_lock);
+	static bool initialized;
+	int i;
+
+	guard(mutex)(&init_lock);
+
+	if (initialized)
+		return;
+
+	for (i = 0; i < TEST_NFLBS; i++) {
+		struct liveupdate_flb *flb = &test_flbs[i];
+		void *obj;
+		int err;
+
+		err = liveupdate_flb_get_incoming(flb, &obj);
+		if (err && err != -ENODATA && err != -ENOENT) {
+			pr_err("liveupdate_flb_get_incoming for %s failed: %pe\n",
+			       flb->compatible, ERR_PTR(err));
+		}
+	}
+	initialized = true;
+}
+
+void liveupdate_test_register(struct liveupdate_file_handler *fh)
+{
+	int err, i;
+
+	liveupdate_test_init();
+
+	for (i = 0; i < TEST_NFLBS; i++) {
+		struct liveupdate_flb *flb = &test_flbs[i];
+
+		err = liveupdate_register_flb(fh, flb);
+		if (err) {
+			pr_err("Failed to register %s %pe\n",
+			       flb->compatible, ERR_PTR(err));
+		}
+	}
+
+	err = liveupdate_register_flb(fh, &test_flbs[0]);
+	if (!err || err != -EEXIST) {
+		pr_err("Failed: %s should be already registered, but got err: %pe\n",
+		       test_flbs[0].compatible, ERR_PTR(err));
+	}
+
+	pr_info("Registered %d FLBs with file handler: [%s]\n",
+		TEST_NFLBS, fh->compatible);
+}
+
+void liveupdate_test_unregister(struct liveupdate_file_handler *fh)
+{
+	int err, i;
+
+	for (i = 0; i < TEST_NFLBS; i++) {
+		struct liveupdate_flb *flb = &test_flbs[i];
+
+		err = liveupdate_unregister_flb(fh, flb);
+		if (err) {
+			pr_err("Failed to unregister %s %pe\n",
+			       flb->compatible, ERR_PTR(err));
+		}
+	}
+
+	pr_info("Unregistered %d FLBs from file handler: [%s]\n",
+		TEST_NFLBS, fh->compatible);
+}
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Pasha Tatashin <pasha.tatashin@soleen.com>");
+MODULE_DESCRIPTION("In-kernel test for LUO mechanism");
-- 
2.52.0.313.g674ac2bdf7-goog

