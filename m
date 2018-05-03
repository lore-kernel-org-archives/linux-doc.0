Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 073387E67A
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 May 2018 14:19:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751739AbeECOSX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 May 2018 10:18:23 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:55691 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751279AbeECOP6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 May 2018 10:15:58 -0400
Received: by mail-wm0-f68.google.com with SMTP id a8so28655076wmg.5
        for <linux-doc@vger.kernel.org>; Thu, 03 May 2018 07:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=o+ak8aT7T3uE1kdwTWR13dwi0UfLy2jLaOVdoh2IUAY=;
        b=LsqUKggNktg8eN6z+vIy2COAcmK3axAFA6UCN/2gDZ8Np1ZlsLG/UyDlsQmt0m/qOk
         XK/LQug75xAbYijiJswdDtt9Uw7jEbVwty3AvcqkXJzH5OiCJRC7CBfdQs94dw5wfCpp
         UAkE/GYr4pKqCxDen8QLbx+dXplaro6soXvhdRg53rRA6LlO1U5osCK3oNjr1x7omveM
         jo6RDTdo173a9Eqkn9GTLFHUfU68lqntf/TpgZn2izDoYkw9mmdcMdDJ8unLYTHeeYGw
         +yoDuWkwvcb6pPwznLqvpeJrQ7s8V6c122RUJHIam2/QR04Lj5Du8PXmzBHSShErqZD5
         cXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=o+ak8aT7T3uE1kdwTWR13dwi0UfLy2jLaOVdoh2IUAY=;
        b=UkSwRaPFVqIBxEgdbBqqL7XIw897P7ClH7hoEwK493lrRm3LP8B/7QUKUS3cVMXAVu
         kWWweqAqBwCKrArl5xzMEcD16jIeE13iMKSLKArS7i6CNa9jPZvZ49FR68Wu2cNjFypi
         HL6eQzhsvDjOtwRHrCaNE0pc0V1Toqx9wXLvQz9W0SgSArQZnUJJ+lpbHQNfj6lGgMec
         rbHxLL2+OV14BbHIcURcFFmbqPuwFMd3wKzo9KQdIyeb6yGxoF3fd+otX592Odju8JmZ
         iRbVKbqRodPeSIMCQC7zPntaOd+kKs+fxOk2UN7CYfQe6JP6FSJ352DOdYwCaqxXW4/v
         Cy8Q==
X-Gm-Message-State: ALQs6tDMfkLAM6t72rVUJXaHmCiy2tUCqckVdbvmXD6m3DgdzjTz06dC
        9bqTv+lTIqqX/ERcgM2C4EBoMw==
X-Google-Smtp-Source: AB8JxZptJtXiKJBDGbwE89q0SZRWIhadPxCAvvpndroOWisTrqqDu2K9+Rg0HJfCfSaZ0FKxnM9UiA==
X-Received: by 2002:a1c:6a0a:: with SMTP id f10-v6mr244958wmc.1.1525356955378;
        Thu, 03 May 2018 07:15:55 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id u20-v6sm22090298wru.33.2018.05.03.07.15.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 May 2018 07:15:54 -0700 (PDT)
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
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Chintan Pandya <cpandya@codeaurora.org>
Subject: [PATCH v2 4/6] mm, arm64: untag user addresses in mm/gup.c
Date:   Thu,  3 May 2018 16:15:42 +0200
Message-Id: <24ab244adc196fda8536cf2efb59cc654e1c234b.1525356769.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.441.gb46fe60e1d-goog
In-Reply-To: <cover.1525356769.git.andreyknvl@google.com>
References: <cover.1525356769.git.andreyknvl@google.com>
In-Reply-To: <cover.1525356769.git.andreyknvl@google.com>
References: <cover.1525356769.git.andreyknvl@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

mm/gup.c provides a kernel interface that accepts user addresses and
manipulates user pages directly (for example get_user_pages, that is used
by the futex syscall). Here we also need to handle the case of tagged user
pointers.

Add untagging to gup.c functions that use user pointers for vma lookup.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 mm/gup.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/gup.c b/mm/gup.c
index 76af4cfeaf68..65a9566c96d3 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -647,6 +647,8 @@ static long __get_user_pages(struct task_struct *tsk, struct mm_struct *mm,
 	if (!nr_pages)
 		return 0;
 
+	start = untagged_addr(start);
+
 	VM_BUG_ON(!!pages != !!(gup_flags & FOLL_GET));
 
 	/*
@@ -801,6 +803,8 @@ int fixup_user_fault(struct task_struct *tsk, struct mm_struct *mm,
 	struct vm_area_struct *vma;
 	int ret, major = 0;
 
+	address = untagged_addr(address);
+
 	if (unlocked)
 		fault_flags |= FAULT_FLAG_ALLOW_RETRY;
 
-- 
2.17.0.441.gb46fe60e1d-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
