Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E3821E0AD;
	Sat,  6 Dec 2025 23:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765062198; cv=none; b=hoy9KbbbNY6JDXt3WcOQv720dQZyB+RSNj17Nx08rkBvzRosku3+VINcHa57eUGUlACs9Ijbq89EE6Usn3JACdf9R9px63R/KBbaDgAQYkQL53FXK4wN4nhjRA5NefViGW4gG/Q5jdxN1YUyzGkPLi3bFE/JhdaFalxbruS4W1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765062198; c=relaxed/simple;
	bh=84Day5NsF6SXe1Km3++11Q/bEnVr1zB/QM0GI9wBAbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WQGyvIojlljukJj//Sc+vmeARZWy9ca/xFVhecSPCHk2lFjLdbgxI5cC/PzLrBjeXjStzP/1LFdIWGv8nmiIEmi2vOCqyquZT+FE1wn69ojZ2/jZUgxeY092n+2CohmGkFupkvpvx7U4mFGSXxE6Qk1fCp85Z2MxvQ2Aghc0rlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLgkhBSf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLgkhBSf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B14DAC113D0;
	Sat,  6 Dec 2025 23:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765062197;
	bh=84Day5NsF6SXe1Km3++11Q/bEnVr1zB/QM0GI9wBAbI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gLgkhBSffYh+ax4IhfdV1dC3S0Q/Nuxvrgz5O16omXtFtfoA2xA+jNxoyi5yJ5Uv9
	 eIlWxW9Ba9+ERSI1lIAV5QV7nj9hkq4lvkJN5oilwkJRXPkF7h2rHHSJT+i6Chs0qq
	 zu7nURHutRl5cl9lA1mlaJduvy1MigphMg5Ncy6eBkz6IaYJGmQkQtbc1BKx8FfbPQ
	 1fqiyjCI+BImIm7BHd03SiWPuRG+rjriJ9HLIi3Cgun+tJOhSQz0xTKRdgb6Yk1Fx4
	 Q65lqi4VJ42Vw1uPGcypazJxvapsCUgKu6T2zhGKkpKEU82H4sI/pn5ZduvZsvdgaK
	 iRPzKjq5rUVsw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Alexander Graf <graf@amazon.com>,
	David Matlack <dmatlack@google.com>,
	David Rientjes <rientjes@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Vipin Sharma <vipinsh@google.com>,
	Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	kexec@lists.infradead.org
Subject: [RFC PATCH 03/10] liveupdate: do early initialization before hugepages are allocated
Date: Sun,  7 Dec 2025 00:02:13 +0100
Message-ID: <20251206230222.853493-4-pratyush@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251206230222.853493-1-pratyush@kernel.org>
References: <20251206230222.853493-1-pratyush@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To support hugepage preservation using LUO, the hugetlb subsystem needs
to get liveupdate data when it allocates the hugepages to find out how
many pages are coming from live update.

Move early LUO init from early_initcall to mm_core_init(). This is where
gigantic hugepages are allocated on ARM64. On x86, they are allocated in
setup_arch(), so have a call there as well. Keep track of whether the
function was already called to avoid double-init.

liveupdate_early_init() only gets the KHO subtree and validates the data
to ensure it is valid and understood. These are read-only operations and
do not need much from the system, so it is safe to call early in boot.

Signed-off-by: Pratyush Yadav <pratyush@kernel.org>
---
 arch/x86/kernel/setup.c          |  7 +++++++
 include/linux/liveupdate.h       |  6 ++++++
 kernel/liveupdate/luo_core.c     | 30 ++++++++++++++++++++++++++----
 kernel/liveupdate/luo_internal.h |  2 ++
 mm/mm_init.c                     |  7 +++++++
 5 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 9bf00287c408..e2ec779afc2c 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -26,6 +26,7 @@
 #include <linux/tboot.h>
 #include <linux/usb/xhci-dbgp.h>
 #include <linux/vmalloc.h>
+#include <linux/liveupdate.h>
 
 #include <uapi/linux/mount.h>
 
@@ -1216,6 +1217,12 @@ void __init setup_arch(char **cmdline_p)
 
 	kho_memory_init();
 
+	/*
+	 * Hugepages might be preserved from a liveupdate. Make sure it is
+	 * initialized so hugetlb can query its state.
+	 */
+	liveupdate_early_init();
+
 	if (boot_cpu_has(X86_FEATURE_GBPAGES)) {
 		hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
 		hugetlb_bootmem_alloc();
diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
index ed81e7b31a9f..78e8c529e4e7 100644
--- a/include/linux/liveupdate.h
+++ b/include/linux/liveupdate.h
@@ -214,6 +214,8 @@ struct liveupdate_flb {
 
 #ifdef CONFIG_LIVEUPDATE
 
+void __init liveupdate_early_init(void);
+
 /* Return true if live update orchestrator is enabled */
 bool liveupdate_enabled(void);
 
@@ -233,6 +235,10 @@ int liveupdate_flb_get_outgoing(struct liveupdate_flb *flb, void **objp);
 
 #else /* CONFIG_LIVEUPDATE */
 
+static inline void liveupdate_early_init(void)
+{
+}
+
 static inline bool liveupdate_enabled(void)
 {
 	return false;
diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
index 7a9ef16b37d8..2c740ecad8e6 100644
--- a/kernel/liveupdate/luo_core.c
+++ b/kernel/liveupdate/luo_core.c
@@ -69,6 +69,13 @@ static struct {
 	u64 liveupdate_num;
 } luo_global;
 
+static bool __luo_early_initialized __initdata;
+
+bool __init luo_early_initialized(void)
+{
+	return __luo_early_initialized;
+}
+
 static int __init early_liveupdate_param(char *buf)
 {
 	return kstrtobool(buf, &luo_global.enabled);
@@ -133,20 +140,35 @@ static int __init luo_early_startup(void)
 	return err;
 }
 
-static int __init liveupdate_early_init(void)
+/*
+ * This should only be called after KHO FDT is known. It gets the LUO subtree
+ * and does initial validation, making early boot read-only access possible.
+ */
+void __init liveupdate_early_init(void)
 {
 	int err;
 
+	/*
+	 * HugeTLB needs LUO to be initialized early in boot, before gigantic
+	 * hugepages are allocated. On x86, that happens in setup_arch(), but on
+	 * ARM64 (and other architectures) that happens in mm_core_init().
+	 *
+	 * Since the code in mm_core_init() is shared between all architectures,
+	 * this can lead to the init being called twice. Skip if initialization
+	 * was already done.
+	 */
+	if (__luo_early_initialized)
+		return;
+
+	__luo_early_initialized = true;
+
 	err = luo_early_startup();
 	if (err) {
 		luo_global.enabled = false;
 		luo_restore_fail("The incoming tree failed to initialize properly [%pe], disabling live update\n",
 				 ERR_PTR(err));
 	}
-
-	return err;
 }
-early_initcall(liveupdate_early_init);
 
 /* Called during boot to create outgoing LUO fdt tree */
 static int __init luo_fdt_setup(void)
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index 6115d6a4054d..171c54af7b38 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -114,6 +114,8 @@ int __init luo_flb_setup_outgoing(void *fdt);
 int __init luo_flb_setup_incoming(void *fdt);
 void luo_flb_serialize(void);
 
+bool __init luo_early_initialized(void);
+
 #ifdef CONFIG_LIVEUPDATE_TEST
 void liveupdate_test_register(struct liveupdate_file_handler *fh);
 void liveupdate_test_unregister(struct liveupdate_file_handler *fh);
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 93cec06c1c8a..9a5b06a93622 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -31,6 +31,7 @@
 #include <linux/execmem.h>
 #include <linux/vmstat.h>
 #include <linux/kexec_handover.h>
+#include <linux/liveupdate.h>
 #include <linux/hugetlb.h>
 #include "internal.h"
 #include "slab.h"
@@ -2681,6 +2682,12 @@ void __init mm_core_init(void)
 	arch_mm_preinit();
 
 	kho_memory_init();
+	/*
+	 * Hugepages might be preserved from a liveupdate. Make sure it is
+	 * initialized so hugetlb can query its state.
+	 */
+	liveupdate_early_init();
+
 	hugetlb_bootmem_alloc();
 
 	/* Initializations relying on SMP setup */
-- 
2.43.0

