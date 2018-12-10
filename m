Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 08E647DD41
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Dec 2018 12:52:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbeLJMvi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Dec 2018 07:51:38 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44509 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727805AbeLJMvU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Dec 2018 07:51:20 -0500
Received: by mail-wr1-f65.google.com with SMTP id z5so10313671wrt.11
        for <linux-doc@vger.kernel.org>; Mon, 10 Dec 2018 04:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pdp/ryV9bt4+HrjeOWrdnZnBI6aj8YPFqzbeaIQ9j68=;
        b=VEgcxLaXoi0dOKDXk3mvZgG3orCXpa3lyeE6CP4OJMDCNte/zoFeg72gBtyYRUM/+z
         dkdH0FX3oaVuoZ2TdAnAWlMAq2acZqiJrldMEieGTNK+3b5PjuVvTUt13jkyridlEMir
         ldYCNgQs6aUD15xGtoBy02lnJF80uPmFB1DrhlhknCsVZxjWvFv1RdkV5JJ5GSpCW5Fm
         4CiX7I8udlN21IjNRASuq0xeFFDULrKpoEaM9D2i67zp9cQXXr2TQKyBW/cdB/XiSE0/
         JddgPffO2wfeBRJJGAVFDqBC6nXfN7M9u/3FUN6B+81x1rMeN5f1CRtoSZFGlT6PrwZW
         bQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pdp/ryV9bt4+HrjeOWrdnZnBI6aj8YPFqzbeaIQ9j68=;
        b=HL4AjwnlA+c5Um/lUu+vGV9gVdndyx9iCEUuQkFNUq4nE7wGQ8vVC4R+EJ+mhooSbY
         5jbO0FqJepN4ZgWAPkR/1oCWwgEpTkZhPfAxtNzUP9OBRY92hrut8avgyAJc9t5dKEZT
         vr2lQ3iX0EJfPe+hDRx0Wjsu2y2mW/BrNruo6O7oXB0pbeEzl1wonzMN3G15gC/mgxE9
         R6jp0bO37hdrd2Lwe7aFpmgIjr6lV5nZb57N3ZrR0AcI8SLPLjF/BzrJL/JjFCTE0UtQ
         sHz2DpMM47Mfgr6RGDZ7c4w5wkdaY0iEFcbZ3maSGEM60Akc/LNr1X42QblUaSfi3yRt
         +Iaw==
X-Gm-Message-State: AA+aEWZmbOuav8mlArxHPQLiWHGnTJ27GXwLLwv8V7SbrkDyDGXp6oH5
        vmU+BkU5lIKkQL9eHoqt1UVr6A==
X-Google-Smtp-Source: AFSGD/WkZ2Ib7xqoZNcfNco/+WzWdTWYInohVyU59jy0CeiifxD2IPgCZSpbiMewGDrt/7AYo1yayA==
X-Received: by 2002:a5d:61c4:: with SMTP id q4mr9258512wrv.308.1544446278383;
        Mon, 10 Dec 2018 04:51:18 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:3180:41f8:3010:ff61])
        by smtp.gmail.com with ESMTPSA id l197sm36893363wma.44.2018.12.10.04.51.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Dec 2018 04:51:17 -0800 (PST)
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
Subject: [PATCH v9 6/8] fs, arm64: untag user address in copy_mount_options
Date:   Mon, 10 Dec 2018 13:51:03 +0100
Message-Id: <07a4efa5983abec2355b2754812509a73f648332.1544445454.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.20.0.rc2.403.gdbc3b29805-goog
In-Reply-To: <cover.1544445454.git.andreyknvl@google.com>
References: <cover.1544445454.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In copy_mount_options a user address is being subtracted from TASK_SIZE.
If the address is lower than TASK_SIZE, the size is calculated to not
allow the exact_copy_from_user() call to cross TASK_SIZE boundary.
However if the address is tagged, then the size will be calculated
incorrectly.

Untag the address before subtracting.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 fs/namespace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index a7f91265ea67..694dcedb7e7d 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -2686,7 +2686,7 @@ void *copy_mount_options(const void __user * data)
 	 * the remainder of the page.
 	 */
 	/* copy_from_user cannot cross TASK_SIZE ! */
-	size = TASK_SIZE - (unsigned long)data;
+	size = TASK_SIZE - (unsigned long)untagged_addr(data);
 	if (size > PAGE_SIZE)
 		size = PAGE_SIZE;
 
-- 
2.20.0.rc2.403.gdbc3b29805-goog

