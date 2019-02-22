Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B90527D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 22 Feb 2019 12:54:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727223AbfBVMxm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 22 Feb 2019 07:53:42 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36434 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726551AbfBVMxl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 Feb 2019 07:53:41 -0500
Received: by mail-wr1-f68.google.com with SMTP id o17so2279775wrw.3
        for <linux-doc@vger.kernel.org>; Fri, 22 Feb 2019 04:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uDDn0ivyVadTQonBIumHfFBd6mG/pAa/u+KuaaJi/B4=;
        b=fnTgPPWFbhryzIzggFc58E4JRsSfK1IU6Sw4LOT9BmgUYGkt3wEcfANoHsXQNUfzc9
         iq9GnYboQsHAKfaKEMrayX1hTXWMMzN/I+6xp02HRbDpZSbRDDjWtj8CtbTOO+dIfC18
         ltrqDIgvui1Exhs0Vsi5guo+6E3eT4Wtp8hwz3ZjUu7OWeuvZHwtR/+mz7N5pObt7Jyg
         o9MWPu/ZGZA22IZSghjyRMXWOy54fhII2IqGEsHjXbEZzuq4hcuupqXge221UVGDnEs4
         VFRnbwlpME12B1w6MdCak9Bm0Q10KMMEgKTJkafiFF5n0MsmyUqd2OoKz/ClD7ZF5Nsp
         o7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uDDn0ivyVadTQonBIumHfFBd6mG/pAa/u+KuaaJi/B4=;
        b=QyPBF/8/Hj+EOxbKDhnwYEU8mjLZq7f/IsajayretYMPxBmg2/YS7bT1rdzTMOQ+gk
         JYtSQpp92uqEwAHVe3jPmQOLUR3WSNRwhZM6pqoDZ9WauNe9PNw3koCimcW153E4IHNl
         w0GGKvM8FRFxf+05Gom32dmJbyKapGsaV4r6Bt4b3ZoUzBEM/+dwgcZ59jXE5Uu2wXpM
         2outBwYzVaZ02IZhx07QXtiqWUmItl19o8bUs6xdIBf3p6JVLcu21GenCCbcXZRAzX7z
         tn6T1sRJLdvmGpv/XldDIuZi7lyz6PSf+s+2STDYAQ+Oaxp8QwYeB0uNsryHgnHEr95E
         zF5A==
X-Gm-Message-State: AHQUAuYsZ5c0Y3OcmLisxKI8DZDzW9t+H+Szwaz4QaJ0+WSFPyiZt0Dh
        uD0EORDsUQ0SIPRGyAQrqDi/4A==
X-Google-Smtp-Source: AHgI3IZUynwk0jQkzXh/fkOnLsB6yWgKr9nX+ibOmHPHqGghLVkrUAqVS0J+X+P7S91mSoisvLsmzA==
X-Received: by 2002:adf:e548:: with SMTP id z8mr2994894wrm.52.1550840019712;
        Fri, 22 Feb 2019 04:53:39 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:13:8ce:d7fa:9f4c:492])
        by smtp.gmail.com with ESMTPSA id o14sm808209wrp.34.2019.02.22.04.53.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Feb 2019 04:53:38 -0800 (PST)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-arch@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
        Andrey Konovalov <andreyknvl@google.com>
Subject: [PATCH v10 05/12] mm, arm64: untag user pointers in mm/gup.c
Date:   Fri, 22 Feb 2019 13:53:17 +0100
Message-Id: <12759ef1c30887dd9fc7a04498f5a434a67f98d5.1550839937.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.rc0.258.g878e2cd30e-goog
In-Reply-To: <cover.1550839937.git.andreyknvl@google.com>
References: <cover.1550839937.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

mm/gup.c provides a kernel interface that accepts user addresses and
manipulates user pages directly (for example get_user_pages, that is used
by the futex syscall). Since a user can provided tagged addresses, we need
to handle such case.

Add untagging to gup.c functions that use user addresses for vma lookup.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 mm/gup.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/gup.c b/mm/gup.c
index 75029649baca..b6eda1608bea 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -683,6 +683,8 @@ static long __get_user_pages(struct task_struct *tsk, struct mm_struct *mm,
 	if (!nr_pages)
 		return 0;
 
+	start = untagged_addr(start);
+
 	VM_BUG_ON(!!pages != !!(gup_flags & FOLL_GET));
 
 	/*
@@ -845,6 +847,8 @@ int fixup_user_fault(struct task_struct *tsk, struct mm_struct *mm,
 	struct vm_area_struct *vma;
 	vm_fault_t ret, major = 0;
 
+	address = untagged_addr(address);
+
 	if (unlocked)
 		fault_flags |= FAULT_FLAG_ALLOW_RETRY;
 
-- 
2.21.0.rc0.258.g878e2cd30e-goog

