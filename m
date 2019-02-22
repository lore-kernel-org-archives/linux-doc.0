Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CE0737D08A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 22 Feb 2019 12:54:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727261AbfBVMxq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 22 Feb 2019 07:53:46 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33935 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbfBVMxp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 Feb 2019 07:53:45 -0500
Received: by mail-wr1-f68.google.com with SMTP id f14so2288319wrg.1
        for <linux-doc@vger.kernel.org>; Fri, 22 Feb 2019 04:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YCJNq7ywB4uaUqF1MkWtAuFgMYZGYk6wr0hn7fPLDX8=;
        b=BdeC2+jNB/4V8eMU3JsQLO0s40wh5+ubv8EL/H0OL5QAdcdUFTEdOl5givygFGSytf
         jcZdXVsDWgmBZF47af5N9ErRJWRqDdGFbYzwStmoYfWu3LPhdR15RoinUqaGl4Qjgq0d
         YCeMM+dJno0mPLko6w5cnWPaCxS3AA2Rfd/ZMWou0m13PSErWQBsV6d5R8egW63k1+91
         6M6Xf0kf8IIz0JxRxyv6eb8DSW3uJPeZp30Ea6z0EgQHP8RD6UikV9fQtwyB6NNbFht8
         Y6QmzmWpqBZaGR9Y754fPqzonuZULmj8ckN9DYzx0pIKOjOjbgjMmJB8O+P6iH8eCk5e
         9R2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YCJNq7ywB4uaUqF1MkWtAuFgMYZGYk6wr0hn7fPLDX8=;
        b=qMYusH/mOoNUTYLbwQqTJX3cPR1s4ydhZlcbR9HvJl6UurdazLiW7r+Uqb6ughCsK3
         W39+oB7DJa6S2wU2RIQlBKdHqOs9rmmCk7A4nJIHEEDlKjfmhzzpkqUx9KzUJ/ZwGigJ
         f51INvk2WgRWE0GeyfbMWny0Jgqa9+71DC7uI320hlh7zvOjbpkrIHPbTeiwGcQWdePk
         OEimydLB2VDM+lyXepWh1gbt9Z3rsXIV9Q9Xh9OCUynEKaFP1qZpOEcv7U138rfVHw7X
         wUGwGOBu5kQrbRzUgzJj2kOLG40Pzu0oVSK4R6KXzoCQHv0598AivF4BzOp7i2Zjz8U1
         UlMQ==
X-Gm-Message-State: AHQUAuZ782ocEB+hxZWidi4+D5dGc+cKGbQw7cLx2PuciN6sMPjfSucK
        vChVBjdm9hAfRG+dXJ4B0Finpw==
X-Google-Smtp-Source: AHgI3IZgI7h36o877UM1PUQ4BYpfOXhaodse0zlvLXALYRj1MboJwPC5054Yq8NVsgrx2Fr3cstKRw==
X-Received: by 2002:adf:efc4:: with SMTP id i4mr3192098wrp.42.1550840023746;
        Fri, 22 Feb 2019 04:53:43 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:13:8ce:d7fa:9f4c:492])
        by smtp.gmail.com with ESMTPSA id o14sm808209wrp.34.2019.02.22.04.53.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Feb 2019 04:53:42 -0800 (PST)
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
Subject: [PATCH v10 07/12] fs, arm64: untag user pointers in fs/userfaultfd.c
Date:   Fri, 22 Feb 2019 13:53:19 +0100
Message-Id: <8343cd77ca301df15839796f3b446b75ce5ffbbf.1550839937.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.rc0.258.g878e2cd30e-goog
In-Reply-To: <cover.1550839937.git.andreyknvl@google.com>
References: <cover.1550839937.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

userfaultfd_register() and userfaultfd_unregister() use provided user
pointers for vma lookups, which can only by done with untagged pointers.

Untag user pointers in these functions.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 fs/userfaultfd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
index 89800fc7dc9d..a3b70e0d9756 100644
--- a/fs/userfaultfd.c
+++ b/fs/userfaultfd.c
@@ -1320,6 +1320,9 @@ static int userfaultfd_register(struct userfaultfd_ctx *ctx,
 		goto out;
 	}
 
+	uffdio_register.range.start =
+		untagged_addr(uffdio_register.range.start);
+
 	ret = validate_range(mm, uffdio_register.range.start,
 			     uffdio_register.range.len);
 	if (ret)
@@ -1507,6 +1510,8 @@ static int userfaultfd_unregister(struct userfaultfd_ctx *ctx,
 	if (copy_from_user(&uffdio_unregister, buf, sizeof(uffdio_unregister)))
 		goto out;
 
+	uffdio_unregister.start = untagged_addr(uffdio_unregister.start);
+
 	ret = validate_range(mm, uffdio_unregister.start,
 			     uffdio_unregister.len);
 	if (ret)
-- 
2.21.0.rc0.258.g878e2cd30e-goog

