Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82825C4332F
	for <linux-doc@archiver.kernel.org>; Wed, 19 Oct 2022 12:02:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbiJSMCD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Oct 2022 08:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231681AbiJSMBj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Oct 2022 08:01:39 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EEBD42E57
        for <linux-doc@vger.kernel.org>; Wed, 19 Oct 2022 04:38:43 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id m6so16996308pfb.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Oct 2022 04:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lctdt7xKU2W5w8gZ0ZmMK8o6iNtjlEm1kVR6gDr/Tqs=;
        b=azz7whhIofhV6dNq+IvcUJPAUjbCNfvl3vKJyPjW72wvWGyw6jPg/RkDpwHAbCv3W9
         94AnUE69DuI7RM7xKmSYYooKJpF5y/N8mX2vGj4N5BGTM8LkQSI2lq+RrsvMv+4HE0PK
         5WR3deCHsMafGs7KLtXai79FiSkJjtKLr3lTapM3hALcVr0S8/eG72ZDZbhfXk2WKqwJ
         hVkomDg6F8zd3d5N0fltw4sn1YLzVwu+Z7udqrLY0Mj0s53vNEq1xo5r+8rZ2IGoVus9
         txu7TDUHmcflBVcTFAoglOSpL1Xv3XFf8K96Qva2ybjItMKC4TmwHS2xnRyPkK1DPICQ
         WvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lctdt7xKU2W5w8gZ0ZmMK8o6iNtjlEm1kVR6gDr/Tqs=;
        b=AX92krYZ1GuNVllCEhhHICJHUEp/lLI0xqft6TWLuA+T6BtlLiv32sNeowC5pIbWTB
         kRHxvWYI0XHfegUCsrBV+hvE+yvmifR2bR21dZnuq9wr6YSjB+9zJX8/PRclF+S1vbYC
         EJFyAjJjpqAsftRapYLsQQSynAFNg6zG/a2bUNMTz5AEsUOKk4+1S87ORaUCSBSW+d6/
         a7DICFK3sSYHBOkbbaLY4n1TKnCF7x3qAQ7yzo/B2r/1Q13KA2kDkENQC9HtNrLbS8Q2
         rPrFGb+YWeMiDrUK9E67OCaJmqGb4oa1+wXZJaznkLZhJbJDsbKcMOfv8MWj4ejjtljq
         NlQg==
X-Gm-Message-State: ACrzQf1LorsPjlfgZ9v5Ij4ss0qvplP+vH9EZDlt6ZnSFHj+0We2gfKw
        NM+lL5d0hg1kl6j3IoDqSak3WvPhTRspIA==
X-Google-Smtp-Source: AMsMyM58iub7ESHfa48FrgnOmzaMcWvkgwmAW8caBAentKFSof8Duq0VF1bxr5JfnFXxxIIBSFqH5A==
X-Received: by 2002:a65:62c7:0:b0:463:9c67:5fe2 with SMTP id m7-20020a6562c7000000b004639c675fe2mr6419990pgv.443.1666171791791;
        Wed, 19 Oct 2022 02:29:51 -0700 (PDT)
Received: from C02FG34NMD6R.bytedance.net ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id x1-20020a170902ec8100b0017da2798025sm10364877plg.295.2022.10.19.02.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 02:29:51 -0700 (PDT)
From:   Albert Huang <huangjie.albert@bytedance.com>
To:     mike.kravetz@oracle.com
Cc:     "huangjie.albert" <huangjie.albert@bytedance.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Muchun Song <songmuchun@bytedance.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: [PATCH v2] mm: hugetlb: support for shared memory policy
Date:   Wed, 19 Oct 2022 17:29:25 +0800
Message-Id: <20221019092928.44146-1-huangjie.albert@bytedance.com>
X-Mailer: git-send-email 2.37.0 (Apple Git-136)
In-Reply-To: <Y0mUt84TctGP3BtT@monkey>
References: <Y0mUt84TctGP3BtT@monkey>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: "huangjie.albert" <huangjie.albert@bytedance.com>

implement get/set_policy for hugetlb_vm_ops to support the shared policy
This ensures that the mempolicy of all processes sharing this huge page
file is consistent.

In some scenarios where huge pages are shared:
if we need to limit the memory usage of vm within node0, so I set qemu's
mempilciy bind to node0, but if there is a process (such as virtiofsd)
shared memory with the vm, in this case. If the page fault is triggered
by virtiofsd, the allocated memory may go to node1 which depends on
virtiofsd. Although we can use the memory prealloc provided by qemu to
avoid this issue, but this method will significantly increase the
creation time of the vm(a few seconds, depending on memory size).

after we hooked up hugetlb_vm_ops(set/get_policy):
both the shared memory segments created by shmget() with SHM_HUGETLB flag
and the mmap(MAP_SHARED|MAP_HUGETLB), also support shared policy.

v1->v2:
1、hugetlb share the memory policy when the vma with the VM_SHARED flag.
2、update the documentation.

Signed-off-by: huangjie.albert <huangjie.albert@bytedance.com>
---
 .../admin-guide/mm/numa_memory_policy.rst     | 20 +++++++++------
 mm/hugetlb.c                                  | 25 +++++++++++++++++++
 2 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/mm/numa_memory_policy.rst b/Documentation/admin-guide/mm/numa_memory_policy.rst
index 5a6afecbb0d0..5672a6c2d2ef 100644
--- a/Documentation/admin-guide/mm/numa_memory_policy.rst
+++ b/Documentation/admin-guide/mm/numa_memory_policy.rst
@@ -133,14 +133,18 @@ Shared Policy
 	the object share the policy, and all pages allocated for the
 	shared object, by any task, will obey the shared policy.
 
-	As of 2.6.22, only shared memory segments, created by shmget() or
-	mmap(MAP_ANONYMOUS|MAP_SHARED), support shared policy.  When shared
-	policy support was added to Linux, the associated data structures were
-	added to hugetlbfs shmem segments.  At the time, hugetlbfs did not
-	support allocation at fault time--a.k.a lazy allocation--so hugetlbfs
-	shmem segments were never "hooked up" to the shared policy support.
-	Although hugetlbfs segments now support lazy allocation, their support
-	for shared policy has not been completed.
+	As of 2.6.22, only shared memory segments, created by shmget() without
+	SHM_HUGETLB flag or mmap(MAP_ANONYMOUS|MAP_SHARED) without MAP_HUGETLB
+	flag, support shared policy. When shared policy support was added to Linux,
+	the associated data structures were added to hugetlbfs shmem segments.
+	At the time, hugetlbfs did not support allocation at fault time--a.k.a
+	lazy allocation--so hugetlbfs shmem segments were never "hooked up" to
+	the shared policy support. Although hugetlbfs segments now support lazy
+	allocation, their support for shared policy has not been completed.
+
+	after we hooked up hugetlb_vm_ops(set/get_policy):
+	both the shared memory segments created by shmget() with SHM_HUGETLB flag
+	and mmap(MAP_SHARED|MAP_HUGETLB), also support shared policy.
 
 	As mentioned above in :ref:`VMA policies <vma_policy>` section,
 	allocations of page cache pages for regular files mmap()ed
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 87d875e5e0a9..fc7038931832 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4632,6 +4632,27 @@ static vm_fault_t hugetlb_vm_op_fault(struct vm_fault *vmf)
 	return 0;
 }
 
+#ifdef CONFIG_NUMA
+int hugetlb_vm_op_set_policy(struct vm_area_struct *vma, struct mempolicy *mpol)
+{
+	struct inode *inode = file_inode(vma->vm_file);
+
+	if (!(vma->vm_flags & VM_SHARED))
+		return 0;
+
+	return mpol_set_shared_policy(&HUGETLBFS_I(inode)->policy, vma, mpol);
+}
+
+struct mempolicy *hugetlb_vm_op_get_policy(struct vm_area_struct *vma, unsigned long addr)
+{
+	struct inode *inode = file_inode(vma->vm_file);
+	pgoff_t index;
+
+	index = ((addr - vma->vm_start) >> PAGE_SHIFT) + vma->vm_pgoff;
+	return mpol_shared_policy_lookup(&HUGETLBFS_I(inode)->policy, index);
+}
+#endif
+
 /*
  * When a new function is introduced to vm_operations_struct and added
  * to hugetlb_vm_ops, please consider adding the function to shm_vm_ops.
@@ -4645,6 +4666,10 @@ const struct vm_operations_struct hugetlb_vm_ops = {
 	.close = hugetlb_vm_op_close,
 	.may_split = hugetlb_vm_op_split,
 	.pagesize = hugetlb_vm_op_pagesize,
+#ifdef CONFIG_NUMA
+	.set_policy = hugetlb_vm_op_set_policy,
+	.get_policy = hugetlb_vm_op_get_policy,
+#endif
 };
 
 static pte_t make_huge_pte(struct vm_area_struct *vma, struct page *page,
-- 
2.37.0 (Apple Git-136)

