Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8B12F7DE81
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Nov 2018 21:56:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731726AbeKTIUh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Nov 2018 03:20:37 -0500
Received: from mga09.intel.com ([134.134.136.24]:32114 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731707AbeKTIUg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 20 Nov 2018 03:20:36 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Nov 2018 13:54:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,254,1539673200"; 
   d="scan'208";a="92423889"
Received: from yyu32-desk1.sc.intel.com ([143.183.136.147])
  by orsmga006.jf.intel.com with ESMTP; 19 Nov 2018 13:54:55 -0800
From:   Yu-cheng Yu <yu-cheng.yu@intel.com>
To:     x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@amacapital.net>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: [RFC PATCH v6 03/11] x86/cet/ibt: Add IBT legacy code bitmap setup function
Date:   Mon, 19 Nov 2018 13:49:26 -0800
Message-Id: <20181119214934.6174-4-yu-cheng.yu@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181119214934.6174-1-yu-cheng.yu@intel.com>
References: <20181119214934.6174-1-yu-cheng.yu@intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Indirect Branch Tracking (IBT) provides an optional legacy code bitmap
that allows execution of legacy, non-IBT compatible library by an
IBT-enabled application.  When set, each bit in the bitmap indicates
one page of legacy code.

The bitmap is allocated and setup from the application.

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
---
 arch/x86/include/asm/cet.h |  1 +
 arch/x86/kernel/cet.c      | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/x86/include/asm/cet.h b/arch/x86/include/asm/cet.h
index 810d3e386fdb..db40fc54a905 100644
--- a/arch/x86/include/asm/cet.h
+++ b/arch/x86/include/asm/cet.h
@@ -29,6 +29,7 @@ void cet_disable_free_shstk(struct task_struct *p);
 int cet_restore_signal(unsigned long ssp);
 int cet_setup_signal(bool ia32, unsigned long rstor, unsigned long *new_ssp);
 int cet_setup_ibt(void);
+int cet_setup_ibt_bitmap(unsigned long bitmap, unsigned long size);
 void cet_disable_ibt(void);
 #else
 static inline int prctl_cet(int option, unsigned long arg2) { return -EINVAL; }
diff --git a/arch/x86/kernel/cet.c b/arch/x86/kernel/cet.c
index fd157a6208c3..18a92a92c50f 100644
--- a/arch/x86/kernel/cet.c
+++ b/arch/x86/kernel/cet.c
@@ -21,6 +21,7 @@
 #include <asm/fpu/types.h>
 #include <asm/cet.h>
 #include <asm/special_insns.h>
+#include <asm/elf.h>
 
 static int set_shstk_ptr(unsigned long addr)
 {
@@ -333,3 +334,25 @@ void cet_disable_ibt(void)
 	wrmsrl(MSR_IA32_U_CET, r);
 	current->thread.cet.ibt_enabled = 0;
 }
+
+int cet_setup_ibt_bitmap(unsigned long bitmap, unsigned long size)
+{
+	u64 r;
+
+	if (!current->thread.cet.ibt_enabled)
+		return -EINVAL;
+
+	if (!PAGE_ALIGNED(bitmap) || (size > TASK_SIZE_MAX))
+		return -EINVAL;
+
+	current->thread.cet.ibt_bitmap_addr = bitmap;
+	current->thread.cet.ibt_bitmap_size = size;
+
+	/*
+	 * Turn on IBT legacy bitmap.
+	 */
+	rdmsrl(MSR_IA32_U_CET, r);
+	r |= (MSR_IA32_CET_LEG_IW_EN | bitmap);
+	wrmsrl(MSR_IA32_U_CET, r);
+	return 0;
+}
-- 
2.17.1

