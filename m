Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CA2D67DF8A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 25 May 2018 17:24:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S967306AbeEYRWi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 25 May 2018 13:22:38 -0400
Received: from mail-wr0-f194.google.com ([209.85.128.194]:42878 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967581AbeEYRV0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 May 2018 13:21:26 -0400
Received: by mail-wr0-f194.google.com with SMTP id w10-v6so10444002wrk.9
        for <linux-doc@vger.kernel.org>; Fri, 25 May 2018 10:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YXxWZgVh8zaQtkU8P5mQzC6eH8eF/xYQbKyFFaBS3Nk=;
        b=ttISb9pdEFWt6QVaHN01KygTdprcSXtM6fEb5MhVlrg/QGClaJA8u49frVlMPVjqDq
         fWlXaDWKIhU6V7bJTL596avDkfGLwv2mZ0oDA9RIDCbWW9ReiT++nVR9mZz7/sHFybyw
         77Ik6VaNZuFOPgAVBYoSIzBkht/najkaM3DdNACeO/8ZjDGcWvmztHZUBYbRmigBGX6X
         EKl9X7etkis8oMYoCq9CEpu4dZ7CtsR9iTfQn5iCB5ad5AOeYD2lT3k+9rfZ9decys60
         cZn76Ba1q27qjIHns4PLMfX+GWR7zdJ8YbnSk/oiSK9B+lUvDuZ/ZKPb8CTK6ZbyHBjd
         /GaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YXxWZgVh8zaQtkU8P5mQzC6eH8eF/xYQbKyFFaBS3Nk=;
        b=FTUUPbg0qHz1N6Rxb9iTqdHzhwjRUn7QdCAshF2rx3tS+WVCoX5MeHgIPg02uF+v6Y
         OqaZ7VHGpZumuiAt10e7FfG3xvA9ftwkdn992XU4XLbWQAXtfd8SkBaDYGj4z+jW55fn
         AGzWCOjfC0cm2DX64TNmmQ/kUoq8wiJeDcxFJn8POKnZgz4X5uU87EoO1PZP8wInTgnY
         0NQ4NcbV8ocqF6dV7JH7AVxunKjgIqqld3XAI106ytrmJkYMFJ2E4W9nWQt1DEXH3XqF
         HZjq+earUC1lxt+2vLPk7/OP9XVgw7r3CPScEL9CISiFZVghyQoabRup8IzEMHIA+QVr
         yWqw==
X-Gm-Message-State: ALKqPwd128BVx4TLrVuTHxCrmczo47yxJRr0eR1qp60fgQQQe45HER0j
        kJJqIpWRaldLWMKGjJSAAAtnhg==
X-Google-Smtp-Source: AB8JxZp72c6olAyJjMAimxTMq7cygCQpU+tH7cnQx0FDnINms6YsgY0q/YsR24HRDkjF6GQwOup/ew==
X-Received: by 2002:a5d:4045:: with SMTP id w5-v6mr3135884wrp.96.1527268885384;
        Fri, 25 May 2018 10:21:25 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id s5-v6sm26579964wra.48.2018.05.25.10.21.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 May 2018 10:21:24 -0700 (PDT)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrey Konovalov <andreyknvl@google.com>,
        Kees Cook <keescook@chromium.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Chintan Pandya <cpandya@codeaurora.org>
Subject: [PATCH v3 4/6] mm, arm64: untag user addresses in mm/gup.c
Date:   Fri, 25 May 2018 19:21:14 +0200
Message-Id: <858608ce6ace4ebd71c0318d3d536e9d1918b613.1527268727.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.921.gf22659ad46-goog
In-Reply-To: <cover.1527268727.git.andreyknvl@google.com>
References: <cover.1527268727.git.andreyknvl@google.com>
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
index 541904a7c60f..5d0e9715bab7 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -650,6 +650,8 @@ static long __get_user_pages(struct task_struct *tsk, struct mm_struct *mm,
 	if (!nr_pages)
 		return 0;
 
+	start = untagged_addr(start);
+
 	VM_BUG_ON(!!pages != !!(gup_flags & FOLL_GET));
 
 	/*
@@ -804,6 +806,8 @@ int fixup_user_fault(struct task_struct *tsk, struct mm_struct *mm,
 	struct vm_area_struct *vma;
 	int ret, major = 0;
 
+	address = untagged_addr(address);
+
 	if (unlocked)
 		fault_flags |= FAULT_FLAG_ALLOW_RETRY;
 
-- 
2.17.0.921.gf22659ad46-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
