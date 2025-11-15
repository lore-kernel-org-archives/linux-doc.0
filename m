Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B2F26F2BC
	for <linux-doc@vger.kernel.org>; Sat, 15 Nov 2025 23:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763249663; cv=none; b=I5aoSm0AC3K0YzOH5xKret/4lsK8xuCpxyy2UfDQaQI0N5OgIQOc4Y2lnowfaqm2B1nmpSIYXDxJG9HF2tleMk92igZSOihJJMeCLDuMVFEH65tUNjIxMY9BWSJm1jYg5mZU1AUBtvggL7skwfpJb5E9CHkFB+j7qSHqXNdyZq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763249663; c=relaxed/simple;
	bh=85s8aRdE8kPGJFRP7ZNIAfLg9kvRem2DBsVDlxsaNoE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CiXzVd8ZEN9TriJjzuC4lNmILNrHxahU7R0bysIeGH+j0m4kgrtBzEnHU/WHmg8pRHkLMH3nTlHMrJCRD2vqPGKG8r0+xoA1/Mcmjzj8Ibinsp2HEgFGozdiD/evptU+7s3Iu1ObTSFQ/D7jXMQhEkd/GSWortH9/+rTBYVbAuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=bzJrhVwh; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="bzJrhVwh"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78933de9ab5so14587367b3.1
        for <linux-doc@vger.kernel.org>; Sat, 15 Nov 2025 15:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763249660; x=1763854460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23di5vng5g7PzO6qdci6haN5BnqYj05Ou9mnU5YCuOY=;
        b=bzJrhVwhAcx8OIRFIJ+fOV8hsLG+wd4n7QfCmy07OxEKuCHKZgl5N1TMZxCK9UMh5t
         wRZ4mwFgHPimECtGC0FVImHX//qPN2R5DqqX6bUOssaahmcOaqh+gf2QQgdZOiIGNfr/
         Tb+Q0C/iC1YCU0sD8ZBKJDZxkOW36QgplIsWjGJ0qZ/n86IrrwBGAy/f1C65HB+56XX0
         NVDrQ1c+wYgRgIr1QsBT6DIbavnlGpV8R8BBYRoWB1ILKfgvTb8zGZ1eLPjxe3/99zk3
         5/Azs31Jld9EKK9J0TT6WnksKcf7KvvlGLz9UggNKrrJPqJ0jxh7ZI4dR4k+AeNVOKm3
         E29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763249660; x=1763854460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=23di5vng5g7PzO6qdci6haN5BnqYj05Ou9mnU5YCuOY=;
        b=McU4wAGmw2thTA3ONvyInHfdfeRKrrRbiD9xbe/7RdiGMyD5kjm2LoNseN9ybff92k
         tsG6IIye3hc+F6HRq0kPEHxc3ZC0DWRJsC32aPFPcfsNNHzswQLmOJdReGBQmM0yHyiu
         l5wNOV5c2BBd5wuVjzjNGLdnoPhI2FBx6kvEMiTFmumcHMfoeJHgXROMHr7nEXUy1x1I
         gK6TvVBXPgWLZmOkqqva0z+djVCARQdw2i5MfJSQD58HQJbgG+3IuKTx6+BotxBIUBbB
         cASeNebE9k5JRUU/Kh5eU+RNdjEdMW0qAb5iB63v5D0eABjOhpMrnaOmlNSnu8Z/bPWh
         NMkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSx22WCGFcQGQBFkg0fpTjC2IEVkscQnJupnejQVJRbQ+uNufXsLYAgj6SvT/Pz5nmP7eQbbW4PV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCPQ4EceqOFKdvVoYLDX10VjyMlhdMcDxtCFVdkCDK8RYLeORx
	W012R0Xj9DXN6J08zkxCo2vVS16WxIqPBX5fOLxiEIJ5ZoSY5LVAb/ok2XPGGyI3Vzw=
X-Gm-Gg: ASbGnctKd82CjtgkuVK4wvk5ctiFZpa5c03Nr0TUyK2J3xhDUjWcjNe0l914W2OHkL6
	iYW1ggIwg2Ho/DxMAnfIVH0XPHqiW7zNL2qIIyFsxyyxXL3FKHMjXWvxr0X0gj8m3rMZeHxN41d
	xjoQqp+vLaOBWeyEXX/d/kiALlbG9QrK66NRiMKrthuTAOw8odhx6GavexPpHvRzyNRfQa7vvNJ
	IAgDt1h34vvq4L2ekC/Av2ZdZzYB1dahJbHsPhKBC3Zu6hn7uwoerzGIvYMMfPMnWLvl77gRA7w
	4JV9FEni4dkBzdWJ0dc/Vwwy2OLXJMZgJnw1l46x9AIZHAD8Cpvn/4H2h2i5flRW5hUWzxTfZtZ
	qNlvHwkCk31X9J+FMalnXxA1PEe3u9RGZneDOzqfD/L9zvOBspmqXQi3wtRi/ioQBIZ29kk4Gdp
	OIO26FAtXl4NxqM2l90Z32BL3nnlhHIoHG6S79qfAIAXvTNw4qws8O+BH9FFI32xA+l51XsFaWD
	aGv+yg=
X-Google-Smtp-Source: AGHT+IEUj2RUJjPsfBfXOnD3CReia59JiFjPNPh1BEz+Ns8My+i3Um+tr89GzjAojwVUDuStxu7XSg==
X-Received: by 2002:a05:690c:a1cd:b0:784:883c:a88d with SMTP id 00721157ae682-78929f3d937mr47983967b3.52.1763249660013;
        Sat, 15 Nov 2025 15:34:20 -0800 (PST)
Received: from soleen.c.googlers.com.com (182.221.85.34.bc.googleusercontent.com. [34.85.221.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7882218774esm28462007b3.57.2025.11.15.15.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 15:34:19 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de,
	lennart@poettering.net,
	brauner@kernel.org,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	saeedm@nvidia.com,
	ajayachandra@nvidia.com,
	jgg@nvidia.com,
	parav@nvidia.com,
	leonro@nvidia.com,
	witu@nvidia.com,
	hughd@google.com,
	skhawaja@google.com,
	chrisl@kernel.org
Subject: [PATCH v6 02/20] liveupdate: luo_core: integrate with KHO
Date: Sat, 15 Nov 2025 18:33:48 -0500
Message-ID: <20251115233409.768044-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
In-Reply-To: <20251115233409.768044-1-pasha.tatashin@soleen.com>
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Integrate the LUO with the KHO framework to enable passing LUO state
across a kexec reboot.

When LUO is transitioned to a "prepared" state, it tells KHO to
finalize, so all memory segments that were added to KHO preservation
list are getting preserved. After "Prepared" state no new segments
can be preserved. If LUO is canceled, it also tells KHO to cancel the
serialization, and therefore, later LUO can go back into the prepared
state.

This patch introduces the following changes:
- During the KHO finalization phase allocate FDT blob.
- Populate this FDT with a LUO compatibility string ("luo-v1").

LUO now depends on `CONFIG_KEXEC_HANDOVER`. The core state transition
logic (`luo_do_*_calls`) remains unimplemented in this patch.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/liveupdate/abi/luo.h |  54 ++++++++++
 kernel/liveupdate/luo_core.c       | 153 ++++++++++++++++++++++++++++-
 2 files changed, 206 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/liveupdate/abi/luo.h

diff --git a/include/linux/liveupdate/abi/luo.h b/include/linux/liveupdate/abi/luo.h
new file mode 100644
index 000000000000..9483a294287f
--- /dev/null
+++ b/include/linux/liveupdate/abi/luo.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * Copyright (c) 2025, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+
+/**
+ * DOC: Live Update Orchestrator ABI
+ *
+ * This header defines the stable Application Binary Interface used by the
+ * Live Update Orchestrator to pass state from a pre-update kernel to a
+ * post-update kernel. The ABI is built upon the Kexec HandOver framework
+ * and uses a Flattened Device Tree to describe the preserved data.
+ *
+ * This interface is a contract. Any modification to the FDT structure, node
+ * properties, compatible strings, or the layout of the `__packed` serialization
+ * structures defined here constitutes a breaking change. Such changes require
+ * incrementing the version number in the relevant `_COMPATIBLE` string to
+ * prevent a new kernel from misinterpreting data from an old kernel.
+ *
+ * FDT Structure Overview:
+ *   The entire LUO state is encapsulated within a single KHO entry named "LUO".
+ *   This entry contains an FDT with the following layout:
+ *
+ *   .. code-block:: none
+ *
+ *     / {
+ *         compatible = "luo-v1";
+ *         liveupdate-number = <...>;
+ *     };
+ *
+ * Main LUO Node (/):
+ *
+ *   - compatible: "luo-v1"
+ *     Identifies the overall LUO ABI version.
+ *   - liveupdate-number: u64
+ *     A counter tracking the number of successful live updates performed.
+ */
+
+#ifndef _LINUX_LIVEUPDATE_ABI_LUO_H
+#define _LINUX_LIVEUPDATE_ABI_LUO_H
+
+/*
+ * The LUO FDT hooks all LUO state for sessions, fds, etc.
+ * In the root it allso carries "liveupdate-number" 64-bit property that
+ * corresponds to the number of live-updates performed on this machine.
+ */
+#define LUO_FDT_SIZE		PAGE_SIZE
+#define LUO_FDT_KHO_ENTRY_NAME	"LUO"
+#define LUO_FDT_COMPATIBLE	"luo-v1"
+#define LUO_FDT_LIVEUPDATE_NUM	"liveupdate-number"
+
+#endif /* _LINUX_LIVEUPDATE_ABI_LUO_H */
diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
index 0e1ab19fa1cd..4a213b262b9f 100644
--- a/kernel/liveupdate/luo_core.c
+++ b/kernel/liveupdate/luo_core.c
@@ -42,11 +42,24 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/io.h>
+#include <linux/kexec_handover.h>
 #include <linux/kobject.h>
+#include <linux/libfdt.h>
 #include <linux/liveupdate.h>
+#include <linux/liveupdate/abi/luo.h>
+#include <linux/mm.h>
+#include <linux/sizes.h>
+#include <linux/string.h>
+#include <linux/unaligned.h>
+
+#include "kexec_handover_internal.h"
 
 static struct {
 	bool enabled;
+	void *fdt_out;
+	void *fdt_in;
+	u64 liveupdate_num;
 } luo_global;
 
 static int __init early_liveupdate_param(char *buf)
@@ -55,6 +68,129 @@ static int __init early_liveupdate_param(char *buf)
 }
 early_param("liveupdate", early_liveupdate_param);
 
+static int __init luo_early_startup(void)
+{
+	phys_addr_t fdt_phys;
+	int err, ln_size;
+	const void *ptr;
+
+	if (!kho_is_enabled()) {
+		if (liveupdate_enabled())
+			pr_warn("Disabling liveupdate because KHO is disabled\n");
+		luo_global.enabled = false;
+		return 0;
+	}
+
+	/* Retrieve LUO subtree, and verify its format. */
+	err = kho_retrieve_subtree(LUO_FDT_KHO_ENTRY_NAME, &fdt_phys);
+	if (err) {
+		if (err != -ENOENT) {
+			pr_err("failed to retrieve FDT '%s' from KHO: %pe\n",
+			       LUO_FDT_KHO_ENTRY_NAME, ERR_PTR(err));
+			return err;
+		}
+
+		return 0;
+	}
+
+	luo_global.fdt_in = phys_to_virt(fdt_phys);
+	err = fdt_node_check_compatible(luo_global.fdt_in, 0,
+					LUO_FDT_COMPATIBLE);
+	if (err) {
+		pr_err("FDT '%s' is incompatible with '%s' [%d]\n",
+		       LUO_FDT_KHO_ENTRY_NAME, LUO_FDT_COMPATIBLE, err);
+
+		return -EINVAL;
+	}
+
+	ln_size = 0;
+	ptr = fdt_getprop(luo_global.fdt_in, 0, LUO_FDT_LIVEUPDATE_NUM,
+			  &ln_size);
+	if (!ptr || ln_size != sizeof(luo_global.liveupdate_num)) {
+		pr_err("Unable to get live update number '%s' [%d]\n",
+		       LUO_FDT_LIVEUPDATE_NUM, ln_size);
+
+		return -EINVAL;
+	}
+
+	luo_global.liveupdate_num = get_unaligned((u64 *)ptr);
+	pr_info("Retrieved live update data, liveupdate number: %lld\n",
+		luo_global.liveupdate_num);
+
+	return 0;
+}
+
+static int __init liveupdate_early_init(void)
+{
+	int err;
+
+	err = luo_early_startup();
+	if (err) {
+		pr_err("The incoming tree failed to initialize properly [%pe], disabling live update\n",
+		       ERR_PTR(err));
+		luo_global.enabled = false;
+	}
+
+	return err;
+}
+early_initcall(liveupdate_early_init);
+
+/* Called during boot to create outgoing LUO fdt tree */
+static int __init luo_fdt_setup(void)
+{
+	const u64 ln = luo_global.liveupdate_num + 1;
+	void *fdt_out;
+	int err;
+
+	fdt_out = kho_alloc_preserve(LUO_FDT_SIZE);
+	if (IS_ERR(fdt_out)) {
+		pr_err("failed to allocate/preserve FDT memory\n");
+		return PTR_ERR(fdt_out);
+	}
+
+	err = fdt_create(fdt_out, LUO_FDT_SIZE);
+	err |= fdt_finish_reservemap(fdt_out);
+	err |= fdt_begin_node(fdt_out, "");
+	err |= fdt_property_string(fdt_out, "compatible", LUO_FDT_COMPATIBLE);
+	err |= fdt_property(fdt_out, LUO_FDT_LIVEUPDATE_NUM, &ln, sizeof(ln));
+	err |= fdt_end_node(fdt_out);
+	err |= fdt_finish(fdt_out);
+	if (err)
+		goto exit_free;
+
+	err = kho_add_subtree(LUO_FDT_KHO_ENTRY_NAME, fdt_out);
+	if (err)
+		goto exit_free;
+	luo_global.fdt_out = fdt_out;
+
+	return 0;
+
+exit_free:
+	kho_unpreserve_free(fdt_out);
+	pr_err("failed to prepare LUO FDT: %d\n", err);
+
+	return err;
+}
+
+/*
+ * late initcall because it initializes the outgoing tree that is needed only
+ * once userspace starts using /dev/liveupdate.
+ */
+static int __init luo_late_startup(void)
+{
+	int err;
+
+	if (!liveupdate_enabled())
+		return 0;
+
+	err = luo_fdt_setup();
+	if (err)
+		luo_global.enabled = false;
+
+	return err;
+}
+late_initcall(luo_late_startup);
+
 /* Public Functions */
 
 /**
@@ -69,7 +205,22 @@ early_param("liveupdate", early_liveupdate_param);
  */
 int liveupdate_reboot(void)
 {
-	return 0;
+	int err;
+
+	if (!liveupdate_enabled())
+		return 0;
+
+	err = kho_finalize();
+	if (err) {
+		pr_err("kho_finalize failed %d\n", err);
+		/*
+		 * kho_finalize() may return libfdt errors, to aboid passing to
+		 * userspace unknown errors, change this to EAGAIN.
+		 */
+		err = -EAGAIN;
+	}
+
+	return err;
 }
 
 /**
-- 
2.52.0.rc1.455.g30608eb744-goog

