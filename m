Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BD5B87E22E
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 May 2018 14:19:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751346AbeECOQh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 May 2018 10:16:37 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:52260 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751154AbeECOQA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 May 2018 10:16:00 -0400
Received: by mail-wm0-f68.google.com with SMTP id w194so6586797wmf.2
        for <linux-doc@vger.kernel.org>; Thu, 03 May 2018 07:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=UK5wc6DlUcroqlO7Swx8mX58fL3XtYOgQeE0FdL7+yM=;
        b=SCYKEXLSpkNlZ9mHjShUuLWwNSiajDqZHo9U6ZQfP94nylXpVwhaK/sq9SWYSuw6qZ
         xgQ1LKQGfbq7VMeFIP6LF7phM9DOO4kNWoESi0QbI1EHcEFsPwSEJmupL1OyoB05vXoE
         TupctVtdSq13zTI46v73lUWLEIohw8yHPSyROzFIi/sfPuE5ulZNhFr++XsbAQL2/i3U
         l7FJtduUS2tb6945qKr4Ok8wb+PScpzEommAHb3yD+rJ3Hb9yz8ruCtvZSL6xpamwEIm
         ywOUlxxHQ0CTeZuLgI4GuOUP+T5FSGpLlZMwsCUky+i7P3jHK2Y42sb6Z0bEOVVTa/+W
         xRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=UK5wc6DlUcroqlO7Swx8mX58fL3XtYOgQeE0FdL7+yM=;
        b=RnGjCkwJT41vUz9AiI7lSg1WPYzonCIhXnvap5JLVtT+KhrSwuER17f79vFhalw3DJ
         ceEnXH0BDppXKNW4wQTRs7bij21I1aX7aYI858hfMVr9g7pwj+JscgNA/OGn572zecrB
         oZtVRDs+DKHUT9Z2gwcWB4FrRQUFNxwJIommapCSxlwcG3jB4sa5xK6huNbkpqKvvvot
         Pud24RpDnY61ptLbcY0soIu1mJ6mkAuvjmRpUSuFje9Dxti/AG/uFIcr7suqOjubw77z
         V8QMTA6h2J1P24GeiH7jb8pQ/7379j2yznwzdDlqvGVkb0W3/4ecMXhDznryb0zk21+N
         PJkQ==
X-Gm-Message-State: ALQs6tBN3MHbmIEng8dLgpuRIlOw3CUEWMOGXxXMbHXtxS8+dofGlG+m
        x3F7bodkM+wSOp/KHidsATwklA==
X-Google-Smtp-Source: AB8JxZp3MQmZZ6oNm3X5fe1bQ1T4o6Ql+t77Nx3UuR1G4D5mj7PNDW0sv4E6Oua5EgFMYH61+7XlKQ==
X-Received: by 10.28.142.149 with SMTP id q143mr14751135wmd.161.1525356959476;
        Thu, 03 May 2018 07:15:59 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id u20-v6sm22090298wru.33.2018.05.03.07.15.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 May 2018 07:15:58 -0700 (PDT)
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
Subject: [PATCH v2 6/6] arm64: update Documentation/arm64/tagged-pointers.txt
Date:   Thu,  3 May 2018 16:15:44 +0200
Message-Id: <1a708210a8056aa356407e72973e00970523e7e2.1525356769.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.441.gb46fe60e1d-goog
In-Reply-To: <cover.1525356769.git.andreyknvl@google.com>
References: <cover.1525356769.git.andreyknvl@google.com>
In-Reply-To: <cover.1525356769.git.andreyknvl@google.com>
References: <cover.1525356769.git.andreyknvl@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a note that work on passing tagged user pointers to the kernel via
syscalls has started, but might not be complete yet.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 Documentation/arm64/tagged-pointers.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/arm64/tagged-pointers.txt b/Documentation/arm64/tagged-pointers.txt
index a25a99e82bb1..361481283f00 100644
--- a/Documentation/arm64/tagged-pointers.txt
+++ b/Documentation/arm64/tagged-pointers.txt
@@ -35,8 +35,9 @@ Using non-zero address tags in any of these locations may result in an
 error code being returned, a (fatal) signal being raised, or other modes
 of failure.
 
-For these reasons, passing non-zero address tags to the kernel via
-system calls is forbidden, and using a non-zero address tag for sp is
+Some initial work for supporting non-zero address tags passed to the
+kernel via system calls has been done, but the kernel doesn't provide
+any guarantees at this point. Using a non-zero address tag for sp is
 strongly discouraged.
 
 Programs maintaining a frame pointer and frame records that use non-zero
-- 
2.17.0.441.gb46fe60e1d-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
