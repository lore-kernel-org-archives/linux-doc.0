Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 495A97DE76
	for <lwn-linux-doc@archive.lwn.net>; Tue, 27 Mar 2018 16:59:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751122AbeC0Q7O (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 27 Mar 2018 12:59:14 -0400
Received: from mail-wr0-f193.google.com ([209.85.128.193]:43420 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755428AbeC0Q5y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Mar 2018 12:57:54 -0400
Received: by mail-wr0-f193.google.com with SMTP id p53so15591784wrc.10
        for <linux-doc@vger.kernel.org>; Tue, 27 Mar 2018 09:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=cacUgNErAiacdTm28Hw85KMBEjc9e53EfkZQ5WfCyjc=;
        b=TEg6GMmYudebHk3naSLGDxAz24RtZKAI7Fp8n1XbFtDA59s1tCq35rlCkOqpyVLnEz
         BhbdfkUfoTIuQcHKlL10bLZjwp6M+fznJggYzkramExnbXEHjk2GNppjshI9aSdya10A
         k8n7Xh1XWYTwptf5qBzmGffx3NCA2UkrId2FB2u4bdZ6C12FVMks+wcbZixgxNTiOQgJ
         +YbZQV4H/069YcPIo9b63r5QIa0sppp60hc+RS7Qm9gnBIFYTVL3l+Usj2mJKtQrBFfK
         CAMXrT4Yv0yNlAZC5KitYYxC8e0VP8W0sXd+5IdtYyVUZTe43f+1Rr+bxsPBmXhC1tNz
         q8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=cacUgNErAiacdTm28Hw85KMBEjc9e53EfkZQ5WfCyjc=;
        b=fUUbf3pFc2koLii/av9JowLTie8DtoYmJt+WBdY0kkWzJLiCqV1VYNnr3zBj1pYbKl
         mhahpcuDI/miKR75+V8qqbjWjPAU/uIx7aYYZxhMBqBkqVVN7VKy0wmvYCsQ4VJDiYYk
         IZ/ErKtMMRZ5hqRLMWnVeYthl/1yb5dSmUVKi1GJGZIMRFTu/wodR0tg3PW9CE/B/yZ/
         mTOO0DGd3anzM+59fSh3eBRdgL+MKa8jhzrheAqT5rFQzv50Wstdez79twdsnf6Tsoeb
         MdMRhrvF72eziWBEA7dCu5m0cW0vvWMXBeyuFGg+jfS3pjKtsqMQrK1FCcT5p123oeAB
         ctwQ==
X-Gm-Message-State: AElRT7Hhp3vI3sgGq5C4ti2RfCGZe0BvcuK2qBkOWT8OWZy3oQET81fW
        SioiiWrkfcEpGMXTL8QIDh83EA==
X-Google-Smtp-Source: AIpwx48/QtGfl4IRtqr4mAXPt9oSOb47MZa+Ey39W0BnqqXfqnZ7EpSWaMB+jlXhxDcmsxCAtafe2w==
X-Received: by 10.223.199.132 with SMTP id l4mr147276wrg.6.1522169873001;
        Tue, 27 Mar 2018 09:57:53 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id 93sm1622992wrh.46.2018.03.27.09.57.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Mar 2018 09:57:52 -0700 (PDT)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrey Konovalov <andreyknvl@google.com>,
        James Morse <james.morse@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Bart Van Assche <bart.vanassche@wdc.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
        Zi Yan <zi.yan@cs.rutgers.edu>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>
Subject: [RFC PATCH v2 4/6] mm, arm64: untag user addresses in mm/gup.c
Date:   Tue, 27 Mar 2018 18:57:40 +0200
Message-Id: <e5892d12e3faef27da4e71be5b3d31a5e8958370.1522169685.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.rc0.231.g781580f067-goog
In-Reply-To: <cover.1522169685.git.andreyknvl@google.com>
References: <cover.1522169685.git.andreyknvl@google.com>
In-Reply-To: <cover.1522169685.git.andreyknvl@google.com>
References: <cover.1522169685.git.andreyknvl@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

mm/gup.c provides a kernel interface that accepts user addresses and
manipulates user pages directly (for example get_user_pages, that is used
by the futex syscall). Here we also need to handle the case of tagged user
pointers.

Untag addresses passed to this interface.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 mm/gup.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/mm/gup.c b/mm/gup.c
index 6afae32571ca..9c4afcf50dfa 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -386,6 +386,8 @@ struct page *follow_page_mask(struct vm_area_struct *vma,
 	struct page *page;
 	struct mm_struct *mm = vma->vm_mm;
 
+	address = untagged_addr(address);
+
 	*page_mask = 0;
 
 	/* make this handle hugepd */
@@ -647,6 +649,8 @@ static long __get_user_pages(struct task_struct *tsk, struct mm_struct *mm,
 	if (!nr_pages)
 		return 0;
 
+	start = untagged_addr(start);
+
 	VM_BUG_ON(!!pages != !!(gup_flags & FOLL_GET));
 
 	/*
@@ -801,6 +805,8 @@ int fixup_user_fault(struct task_struct *tsk, struct mm_struct *mm,
 	struct vm_area_struct *vma;
 	int ret, major = 0;
 
+	address = untagged_addr(address);
+
 	if (unlocked)
 		fault_flags |= FAULT_FLAG_ALLOW_RETRY;
 
@@ -854,6 +860,8 @@ static __always_inline long __get_user_pages_locked(struct task_struct *tsk,
 	long ret, pages_done;
 	bool lock_dropped;
 
+	start = untagged_addr(start);
+
 	if (locked) {
 		/* if VM_FAULT_RETRY can be returned, vmas become invalid */
 		BUG_ON(vmas);
@@ -1749,6 +1757,8 @@ int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
 	unsigned long flags;
 	int nr = 0;
 
+	start = untagged_addr(start);
+
 	start &= PAGE_MASK;
 	addr = start;
 	len = (unsigned long) nr_pages << PAGE_SHIFT;
@@ -1801,6 +1811,8 @@ int get_user_pages_fast(unsigned long start, int nr_pages, int write,
 	unsigned long addr, len, end;
 	int nr = 0, ret = 0;
 
+	start = untagged_addr(start);
+
 	start &= PAGE_MASK;
 	addr = start;
 	len = (unsigned long) nr_pages << PAGE_SHIFT;
-- 
2.17.0.rc0.231.g781580f067-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
