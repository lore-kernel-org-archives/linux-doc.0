Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EAA447D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 22 Feb 2019 12:53:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727252AbfBVMxq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 22 Feb 2019 07:53:46 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33930 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727231AbfBVMxn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 Feb 2019 07:53:43 -0500
Received: by mail-wr1-f65.google.com with SMTP id f14so2288223wrg.1
        for <linux-doc@vger.kernel.org>; Fri, 22 Feb 2019 04:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QRzSxiJgMYZtPmoiWjDl90NjyZgMYTYzeKBtn1CA2K4=;
        b=bOHZq9GtneVcqI+7dx1dPlGbKg1NqyMwC/3dQj65R9b+AaL1dEw6WnsEFnvda6QlbD
         lx5q7BJ+HMum/sxb5KUmNx4YqHmnliyifP16MSQibp7C2IHgTBNe1hU9pCqsXLkuat1c
         znpbV/DdU4KpgxO4goYtaVe+u2TyXP6kbQ1RoQds32uwFxEU5JLU4SpkXRt6LADYtjAl
         WI1hDIyHVRaaElIfgQVsUPN+J6MsWMExP4yrdvC2wBzICHHXVDfMEKh4sCD1RwZwqDI3
         3IZIK/md1m1LDI9VJmKIDCuhLJSumlID2vVjptcouY1GMsQmr4PDIVNhj6rbpSyQdU/5
         NOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QRzSxiJgMYZtPmoiWjDl90NjyZgMYTYzeKBtn1CA2K4=;
        b=QKT1QYs8ve85TkJiJcdkZUBTqAJdcUcLEPKNLshsxdQVRtmymyxEsdjwI1/yUCJdT/
         sKlZioHZrLm2c7MSGmxFRRCr8AKg2FAdVQ4I4o0mhEfVheBnju5rZpZtPxWr409asEtl
         hECd6vBhI7sA1QskeS28lOBuc4grQf1hFB5A1DJ2WLTl8iOxgD8Rd05GNXEQKUEB3HPq
         uusEjstoj7g4z0u5L93tRqaI5Qv4CGx22R2Elqhycw2ethUmKeiAvQj3YzfribQp7Jf8
         a6HKZvYafqk860OANaR7P/jXLiM6oPBQ8rT6bowQqvEkALH4zFtFRYEwgoAPPLMHJJwj
         GGGQ==
X-Gm-Message-State: AHQUAubqu4yCynq4FJfw5oq88jE6XNZHGAwGdduwnUThroz1ceD5K0wg
        FkBB3actYC9Yv+DuL//UNsy5ow==
X-Google-Smtp-Source: AHgI3IY2qC70XZTghQybUySJZNUvHOQ7jsxQuTtoFLsrp3D/CO4zCTUsA3Qs8Io1jJiy1nb1Hyjy/g==
X-Received: by 2002:adf:822d:: with SMTP id 42mr2852354wrb.63.1550840021805;
        Fri, 22 Feb 2019 04:53:41 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:13:8ce:d7fa:9f4c:492])
        by smtp.gmail.com with ESMTPSA id o14sm808209wrp.34.2019.02.22.04.53.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Feb 2019 04:53:40 -0800 (PST)
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
Subject: [PATCH v10 06/12] fs, arm64: untag user pointers in copy_mount_options
Date:   Fri, 22 Feb 2019 13:53:18 +0100
Message-Id: <a958e202cdbe6e1bac8a37b7f3d9881d1b22993d.1550839937.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.rc0.258.g878e2cd30e-goog
In-Reply-To: <cover.1550839937.git.andreyknvl@google.com>
References: <cover.1550839937.git.andreyknvl@google.com>
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
index a677b59efd74..d4b7adef9204 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -2730,7 +2730,7 @@ void *copy_mount_options(const void __user * data)
 	 * the remainder of the page.
 	 */
 	/* copy_from_user cannot cross TASK_SIZE ! */
-	size = TASK_SIZE - (unsigned long)data;
+	size = TASK_SIZE - (unsigned long)untagged_addr(data);
 	if (size > PAGE_SIZE)
 		size = PAGE_SIZE;
 
-- 
2.21.0.rc0.258.g878e2cd30e-goog

