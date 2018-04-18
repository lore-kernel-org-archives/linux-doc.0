Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BF3C37DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 18:54:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753153AbeDRSxt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 14:53:49 -0400
Received: from mail-wr0-f195.google.com ([209.85.128.195]:35805 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752992AbeDRSx0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Apr 2018 14:53:26 -0400
Received: by mail-wr0-f195.google.com with SMTP id w3-v6so7540969wrg.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Apr 2018 11:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=PJ5XUe+ltNClCgiZ/w1sU8NdaWdPhX/PsNl2IWrnZo4=;
        b=a2pnlJdQ8EE/Aq3W32UwUHOB3LCELEG+hK21clc+673A0T4L6W1Toc0lzT0ElX/Rzj
         8HR7P06fbA1L4DccXePrgQlCkE00y+a5rD/EbW1KMEcoXlZtOcdgKzZfxWx6i2GTPfWY
         3DhDR3sieLdyhbt4rzMd/1n0Pf66nSZO+96FXs6ABP1wF59RSRHS4UNMiAgJi0M+UGas
         RAi+LsYXnlc3i2QijC53CWhKx1cUglDOHmGHE7lTE/wxfXoCbljhQF8BMZb5Eux8EDFW
         IYyv/hBzqIY7U1z1/9m4DjfEXzsnFunNTtdXbsDkGO7iLsP4NaJRXzn5/xmbuzhdLfvw
         jkug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=PJ5XUe+ltNClCgiZ/w1sU8NdaWdPhX/PsNl2IWrnZo4=;
        b=HFl0aOvKYd3+Kz6rza2oZZ1L9QTWVnRWel5ZMb4bU07xn600e2QVT9a4CNp74Xm4ml
         qbaR9o2vXPBGcmGRCjDYET/8GLAJ9KIkmlHTyNX/TCRFoqKWCBoc4O6YvIFJgnFrgg1i
         sQSfTOAQm730PYVxZtLy9WTo/3KRRKQOu+/oRvTun6LYyBkTdbNeHSShbv7hxUy2zZ2M
         Lo6qCXjlEADw11RePRc+VuLTedBo5d5UUruKP62agBBTkT0WwND6k2WbsyCaymIKdp1M
         arG+aEHB8XzfvylOy4krCF9eD4reboVpus7hp0s8bVuO0Bbh6PnMJZm1ulRSkFAJmTHR
         8N8A==
X-Gm-Message-State: ALQs6tARVgyrw6qKri9KVJA3XntmSjrEhfWC/inNUJ+kh1QUmKPRAbmd
        gXqwf+9szzaCwFGBaEtFh9Lrxw==
X-Google-Smtp-Source: AIpwx49hGnmZ7BV/wHOQtwkJhcg6g5r3CZUaOrWwmlL9x26D+GKFTSsf9qRNCVnR7RVbNhjTM0wWOA==
X-Received: by 10.28.5.198 with SMTP id 189mr2402518wmf.155.1524077604918;
        Wed, 18 Apr 2018 11:53:24 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id k79sm2616735wmg.39.2018.04.18.11.53.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Apr 2018 11:53:24 -0700 (PDT)
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
Subject: [PATCH 4/6] mm, arm64: untag user addresses in mm/gup.c
Date:   Wed, 18 Apr 2018 20:53:13 +0200
Message-Id: <0db34d04fa16be162336106e3b4a94f3dacc0af4.1524077494.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.484.g0c8726318c-goog
In-Reply-To: <cover.1524077494.git.andreyknvl@google.com>
References: <cover.1524077494.git.andreyknvl@google.com>
In-Reply-To: <cover.1524077494.git.andreyknvl@google.com>
References: <cover.1524077494.git.andreyknvl@google.com>
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
index 76af4cfeaf68..fb375de7d40d 100644
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
@@ -1751,6 +1759,8 @@ int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
 	unsigned long flags;
 	int nr = 0;
 
+	start = untagged_addr(start);
+
 	start &= PAGE_MASK;
 	addr = start;
 	len = (unsigned long) nr_pages << PAGE_SHIFT;
@@ -1803,6 +1813,8 @@ int get_user_pages_fast(unsigned long start, int nr_pages, int write,
 	unsigned long addr, len, end;
 	int nr = 0, ret = 0;
 
+	start = untagged_addr(start);
+
 	start &= PAGE_MASK;
 	addr = start;
 	len = (unsigned long) nr_pages << PAGE_SHIFT;
-- 
2.17.0.484.g0c8726318c-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
