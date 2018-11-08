Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1DC667D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu,  8 Nov 2018 14:36:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727082AbeKIAMQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 8 Nov 2018 19:12:16 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36260 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727080AbeKIAMO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Nov 2018 19:12:14 -0500
Received: by mail-wm1-f68.google.com with SMTP id a8-v6so1416180wmf.1
        for <linux-doc@vger.kernel.org>; Thu, 08 Nov 2018 06:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XFiY84rm4WtGUkeGnRX1ezxk6XhL8yE5HslON+43E5A=;
        b=oI+aXnMV67bGaMcJR9iVpv8//10td45km8L6aUAt2U7BKqk1YcqEFnL2kiwXI60GJo
         SZ/CWqH8TK1BouvBvRRzyXbwgS+WPi1NX50zFJ4aZOaLhWwHownP5SyGqmZyTvxteJal
         x0mda4AQkeS6YISyxX7xYqbJJdlvjtQRCohgvGk8JBce2yGqrCNVYfUUXDV/xs8CBuM0
         1kAPsLjjZHDD9GoxuZyOgQVVPU9Vq8pVh34mVeWeNrhpoiskyIgvnUHpn6CnYXhNB8Gf
         fc13RpNIM2IDnaeH5D7Twtt/fOx+AjFtdmrj8a5LSxCAkD4uliwAac75+fL+PZR7qTT3
         3SOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XFiY84rm4WtGUkeGnRX1ezxk6XhL8yE5HslON+43E5A=;
        b=hdCf8D7FiC8jmK4Cob5Hko0aOmtgNUg92cYKmu6evBO+3L+VjVeTKAqW5de3zRdtbk
         hDXruqM+6KUSxTSaCwxHWotlLhtm2cXXehzCYG/uwcqI2IG2OvHbqHp070NxDbFa/5tX
         AKHz0LM2mLGJ3VJQe5qw3AudxTgxk3K4dlj7Pt9EBS1e+rD3hDUhOaBQ+MyXdjv5vlws
         1q1ffqFBKTmp0LrpNXO5pXM4NQwSDhqkZ/ukBerfX3RjiSu5Xp2N47ZifSLqrqhbVRUq
         t2bR/OaH25Vckm1FY6AGWqhAB+kV33ih3CD+PkODxNJW8q7QkGS0QDpoTNJMBNA3v0HZ
         wkrA==
X-Gm-Message-State: AGRZ1gKn0tIbuawJa4/CMWT9rtk9Owb4nS2OMwsqhGrSALaSoeb9xtd4
        /k4MlZTO2UhoiWYstHFlufAlvg==
X-Google-Smtp-Source: AJdET5fLJZXRAYzbTbJsD9GsxFNMuZQD5qXtXF3tsrt1pqTH3zYu3HOOugbRpVAPkx1jngHW7yqCPg==
X-Received: by 2002:a1c:e40b:: with SMTP id b11-v6mr1500427wmh.100.1541687786099;
        Thu, 08 Nov 2018 06:36:26 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id k5-v6sm5421068wre.82.2018.11.08.06.36.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Nov 2018 06:36:25 -0800 (PST)
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
        Andrey Konovalov <andreyknvl@google.com>
Subject: [PATCH v8 4/8] mm, arm64: untag user addresses in mm/gup.c
Date:   Thu,  8 Nov 2018 15:36:11 +0100
Message-Id: <f4c83a89817a81d741373d3fb529864d3a3bd61e.1541687720.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.1.930.g4563a0d9d0-goog
In-Reply-To: <cover.1541687720.git.andreyknvl@google.com>
References: <cover.1541687720.git.andreyknvl@google.com>
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
index f76e77a2d34b..6ff310818616 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -677,6 +677,8 @@ static long __get_user_pages(struct task_struct *tsk, struct mm_struct *mm,
 	if (!nr_pages)
 		return 0;
 
+	start = untagged_addr(start);
+
 	VM_BUG_ON(!!pages != !!(gup_flags & FOLL_GET));
 
 	/*
@@ -840,6 +842,8 @@ int fixup_user_fault(struct task_struct *tsk, struct mm_struct *mm,
 	struct vm_area_struct *vma;
 	vm_fault_t ret, major = 0;
 
+	address = untagged_addr(address);
+
 	if (unlocked)
 		fault_flags |= FAULT_FLAG_ALLOW_RETRY;
 
-- 
2.19.1.930.g4563a0d9d0-goog

