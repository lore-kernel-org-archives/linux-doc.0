Return-Path: <SRS0=Bwbi=EB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 797ADC4363A
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 21:01:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F16B21D7B
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 21:01:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VPMU7bYs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729139AbgJZVBD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Oct 2020 17:01:03 -0400
Received: from mail-yb1-f201.google.com ([209.85.219.201]:38922 "EHLO
        mail-yb1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729082AbgJZVBC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Oct 2020 17:01:02 -0400
Received: by mail-yb1-f201.google.com with SMTP id j19so5297606ybg.6
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2020 14:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=S80ppjIa8avRgCLzMtS9uD6gmPO2GY129S5ovczlpcA=;
        b=VPMU7bYsl4y5a+XBX+HCV/Me3jiaZw2oB1ZKPWrOoJdbC6qYSXPbSzv1ZEiNebupuH
         ZT+AvO8OvR/fk+2nND8RKPqrJft/FrtV2zYItLp/1dRl42erOMC4Qvq1LeVKStTjj9ZE
         yVeZVSctNamKDdSWTgfc0qVYVNpdtY/zkfQvjoExgiqHfjaxPJhmpgpUcF99p93VMbC9
         ch+mc2oKeGvN6RYnQ08YenHFsMGV3W+gprcYCdHpdSkgqeC2nmD9hD3CoFpITsP7ZGhE
         I9LjWds9ud13/neWnbLdfCXeuzwB5mZzHJTJbtpuEd8SJ8NZyG+Hc2dFFDZ9st6aN3ix
         oQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=S80ppjIa8avRgCLzMtS9uD6gmPO2GY129S5ovczlpcA=;
        b=A4ok7hCD/CJ+n/uxe+2aDETcqHdhfqiVxXwRcWUGcaQrP/70HFPCjgimOuKU0hT59g
         wIYzD/GCEWtWqyKKnQumLSKqTUYNJ/1zlYTeuvjMyTWypkfCK2BXoOIEX81D4MLd5CV0
         PWXUq3GO34FPf7CHoKQlto+QWNWZGAAKxMwx0Zi3TZzgerJMuTusdoz8O/zrCQsu0A3R
         qtgb6V7PuiZLsqK+DXdCfwtMBLYSATui5749IyycS+MuRXbIhwNWWdxDD+pXH1mMI/qa
         rWFq01yjGdP0Hub+8J/G46eH7r4sgQAQdahhu8idjBJuACNDSViVgSs5nZZG0OJ4AJo9
         +4tA==
X-Gm-Message-State: AOAM530Zcx9GYCd/UGvsii4fKxcNU8APaCudWTIAIrS+ViaZoNZ1+jI/
        PvdgahjJfslkkhqaAiKMM6QJrs6lBQ+mSpzb2Q==
X-Google-Smtp-Source: ABdhPJzph6K8gnLRzXXhetRdMYKx97QprFWBCbFnRMw6bQ1FXxYO+3TNvmT+xHY5eVAylKmvyPxeWrjGBlcpfunfVQ==
Sender: "lokeshgidra via sendgmr" <lokeshgidra@lg.mtv.corp.google.com>
X-Received: from lg.mtv.corp.google.com ([2620:15c:211:202:f693:9fff:fef4:29dd])
 (user=lokeshgidra job=sendgmr) by 2002:a25:6089:: with SMTP id
 u131mr27280482ybb.456.1603746059525; Mon, 26 Oct 2020 14:00:59 -0700 (PDT)
Date:   Mon, 26 Oct 2020 14:00:51 -0700
In-Reply-To: <20201026210052.3775167-1-lokeshgidra@google.com>
Message-Id: <20201026210052.3775167-2-lokeshgidra@google.com>
Mime-Version: 1.0
References: <20201026210052.3775167-1-lokeshgidra@google.com>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
Subject: [PATCH v6 1/2] Add UFFD_USER_MODE_ONLY
From:   Lokesh Gidra <lokeshgidra@google.com>
To:     Kees Cook <keescook@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, Peter Xu <peterx@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Lokesh Gidra <lokeshgidra@google.com>,
        Daniel Colascione <dancol@dancol.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kaleshsingh@google.com,
        calin@google.com, surenb@google.com, nnk@google.com,
        jeffv@google.com, kernel-team@android.com,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Shaohua Li <shli@fb.com>, Jerome Glisse <jglisse@redhat.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Mel Gorman <mgorman@techsingularity.net>,
        Nitin Gupta <nigupta@nvidia.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Iurii Zaikin <yzaikin@google.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Daniel Colascione <dancol@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

userfaultfd handles page faults from both user and kernel code.
Add a new UFFD_USER_MODE_ONLY flag for userfaultfd(2) that makes
the resulting userfaultfd object refuse to handle faults from kernel
mode, treating these faults as if SIGBUS were always raised, causing
the kernel code to fail with EFAULT.

A future patch adds a knob allowing administrators to give some
processes the ability to create userfaultfd file objects only if they
pass UFFD_USER_MODE_ONLY, reducing the likelihood that these processes
will exploit userfaultfd's ability to delay kernel page faults to open
timing windows for future exploits.

Signed-off-by: Daniel Colascione <dancol@google.com>
Signed-off-by: Lokesh Gidra <lokeshgidra@google.com>
Reviewed-by: Andrea Arcangeli <aarcange@redhat.com>
---
 fs/userfaultfd.c                 | 10 +++++++++-
 include/uapi/linux/userfaultfd.h |  9 +++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
index 000b457ad087..605599fde015 100644
--- a/fs/userfaultfd.c
+++ b/fs/userfaultfd.c
@@ -405,6 +405,13 @@ vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason)
 
 	if (ctx->features & UFFD_FEATURE_SIGBUS)
 		goto out;
+	if ((vmf->flags & FAULT_FLAG_USER) == 0 &&
+	    ctx->flags & UFFD_USER_MODE_ONLY) {
+		printk_once(KERN_WARNING "uffd: Set unprivileged_userfaultfd "
+			"sysctl knob to 1 if kernel faults must be handled "
+			"without obtaining CAP_SYS_PTRACE capability\n");
+		goto out;
+	}
 
 	/*
 	 * If it's already released don't get it. This avoids to loop
@@ -1965,10 +1972,11 @@ SYSCALL_DEFINE1(userfaultfd, int, flags)
 	BUG_ON(!current->mm);
 
 	/* Check the UFFD_* constants for consistency.  */
+	BUILD_BUG_ON(UFFD_USER_MODE_ONLY & UFFD_SHARED_FCNTL_FLAGS);
 	BUILD_BUG_ON(UFFD_CLOEXEC != O_CLOEXEC);
 	BUILD_BUG_ON(UFFD_NONBLOCK != O_NONBLOCK);
 
-	if (flags & ~UFFD_SHARED_FCNTL_FLAGS)
+	if (flags & ~(UFFD_SHARED_FCNTL_FLAGS | UFFD_USER_MODE_ONLY))
 		return -EINVAL;
 
 	ctx = kmem_cache_alloc(userfaultfd_ctx_cachep, GFP_KERNEL);
diff --git a/include/uapi/linux/userfaultfd.h b/include/uapi/linux/userfaultfd.h
index e7e98bde221f..5f2d88212f7c 100644
--- a/include/uapi/linux/userfaultfd.h
+++ b/include/uapi/linux/userfaultfd.h
@@ -257,4 +257,13 @@ struct uffdio_writeprotect {
 	__u64 mode;
 };
 
+/*
+ * Flags for the userfaultfd(2) system call itself.
+ */
+
+/*
+ * Create a userfaultfd that can handle page faults only in user mode.
+ */
+#define UFFD_USER_MODE_ONLY 1
+
 #endif /* _LINUX_USERFAULTFD_H */
-- 
2.29.0.rc1.297.gfa9743e501-goog

