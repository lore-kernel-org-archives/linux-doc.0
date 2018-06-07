Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EF3EF7D062
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Jun 2018 15:42:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933959AbeFGPmE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Jun 2018 11:42:04 -0400
Received: from mga09.intel.com ([134.134.136.24]:36346 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933773AbeFGOlh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 7 Jun 2018 10:41:37 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Jun 2018 07:41:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,486,1520924400"; 
   d="scan'208";a="62632664"
Received: from 2b52.sc.intel.com ([143.183.136.51])
  by orsmga001.jf.intel.com with ESMTP; 07 Jun 2018 07:41:34 -0700
From:   Yu-cheng Yu <yu-cheng.yu@intel.com>
To:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-arch@vger.kernel.org, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@amacapital.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Oleg Nesterov <oleg@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: [PATCH 10/10] mm: Prevent munmap and remap_file_pages of shadow stack
Date:   Thu,  7 Jun 2018 07:38:07 -0700
Message-Id: <20180607143807.3611-11-yu-cheng.yu@intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180607143807.3611-1-yu-cheng.yu@intel.com>
References: <20180607143807.3611-1-yu-cheng.yu@intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
---
 mm/mmap.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index fc41c0543d7f..e7d1fcb7ec58 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2810,6 +2810,16 @@ EXPORT_SYMBOL(vm_munmap);
 
 SYSCALL_DEFINE2(munmap, unsigned long, addr, size_t, len)
 {
+	struct vm_area_struct *vma;
+
+	/* Do not munmap shadow stack */
+	down_read(&current->mm->mmap_sem);
+	vma = find_vma(current->mm, addr);
+	if (vma && (vma->vm_flags & VM_SHSTK)) {
+		up_read(&current->mm->mmap_sem);
+		return -EINVAL;
+	}
+	up_read(&current->mm->mmap_sem);
 	profile_munmap(addr);
 	return vm_munmap(addr, len);
 }
@@ -2851,6 +2861,9 @@ SYSCALL_DEFINE5(remap_file_pages, unsigned long, start, unsigned long, size,
 	if (!vma || !(vma->vm_flags & VM_SHARED))
 		goto out;
 
+	if (vma->vm_flags & VM_SHSTK)
+		goto out;
+
 	if (start < vma->vm_start)
 		goto out;
 
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
