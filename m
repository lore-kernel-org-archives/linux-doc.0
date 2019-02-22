Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0FC917D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 22 Feb 2019 12:53:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbfBVMxg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 22 Feb 2019 07:53:36 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38712 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726712AbfBVMxd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 Feb 2019 07:53:33 -0500
Received: by mail-wr1-f66.google.com with SMTP id v13so2269642wrw.5
        for <linux-doc@vger.kernel.org>; Fri, 22 Feb 2019 04:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cci7ZilHiWLbA64Mc6AMOu/bLCyx/LwY/bSfReud1WI=;
        b=mN2rwWcXbmXv4T54C8g+dQZceONkqeqfDnfFBkdS/1z2f+11756LZtilFVL9vmN8Ub
         asXmJYdmjDVQkCK9dtCydjOWxr+KWTUU0EEaMipiA+1WfFsqs10CUXUyp5B+yuljcBc1
         0C0tywzNl+KEsDi5E1V9a1Ws2dGSyCYbuw6oXbdAfIH3UZ7l6SUpfEF4GcTbMbPCNeeB
         Ot4+ZahceUY35FVe2YDPYC6Ax0ARG1yKOQgJNw51FBiolm56hh/XyUho+qccTDZViTri
         rRytDOGFcggeSEQD/tMlfRQXS2V8i4wpp47+jYCO3tkhuGYSljzEFFfYn0oW2evDAak3
         2ugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cci7ZilHiWLbA64Mc6AMOu/bLCyx/LwY/bSfReud1WI=;
        b=B/O1E2NyuNaKZ4a2t1SU0fN0js4RHzmtX2Fy9X/ibht//jdBw+32J0t0GDfcuhTeDN
         k0IqHtciplvueY3QvYEzNNWnisYxUV4/aCilZQFIuN/e4y1HookZrzbEY+voVyOr7Ys9
         dAOQK5OpztBF1yrd37eQMxPQWwWeHeYDSxY99a5Q/JFVmFPZhLEqv/AvaCtjOQ7FcQwr
         9vlvG4SQToEzC/I5nSPvOI/iO2hGMB6U9gg/NbnCQzheX5ijGSGjPxZ+EclTxlt4w8Pu
         XDQ2fw0MSqTDRC9hlsU43Om1Gm5Un5KDCXvmbf6b50pgmYW5zEwsr9vvFvaYL4sescQb
         fVVQ==
X-Gm-Message-State: AHQUAubyrc62GmckXEhxVmSgsxYOZ8tiTNm4Ba/y+bcF0D1vEAFMjZXu
        OxzFqTlrtSPoPJGV2GAaYyiOtA==
X-Google-Smtp-Source: AHgI3IYNE5YTD6dA2Rm0c87bwvFj8qPgC6wZI8wCmOm2tGxzmyo49L1MzMubdg2VCbScaD+W4rhlpw==
X-Received: by 2002:adf:f6ca:: with SMTP id y10mr2869999wrp.148.1550840011806;
        Fri, 22 Feb 2019 04:53:31 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:13:8ce:d7fa:9f4c:492])
        by smtp.gmail.com with ESMTPSA id o14sm808209wrp.34.2019.02.22.04.53.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Feb 2019 04:53:30 -0800 (PST)
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
Subject: [PATCH v10 01/12] uaccess: add untagged_addr definition for other arches
Date:   Fri, 22 Feb 2019 13:53:13 +0100
Message-Id: <2b5a5d7d7a36a75a2a796f0c2b9b30669d81d470.1550839937.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.rc0.258.g878e2cd30e-goog
In-Reply-To: <cover.1550839937.git.andreyknvl@google.com>
References: <cover.1550839937.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

To allow arm64 syscalls to accept tagged pointers from userspace, we must
untag them when they are passed to the kernel. Since untagging is done in
generic parts of the kernel, the untagged_addr macro needs to be defined
for all architectures.

Define it as a noop for architectures other than arm64.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 include/linux/memory.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/memory.h b/include/linux/memory.h
index a6ddefc60517..fc383bc39ab8 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -21,6 +21,10 @@
 #include <linux/mutex.h>
 #include <linux/notifier.h>
 
+#ifndef untagged_addr
+#define untagged_addr(addr) (addr)
+#endif
+
 #define MIN_MEMORY_BLOCK_SIZE     (1UL << SECTION_SIZE_BITS)
 
 struct memory_block {
-- 
2.21.0.rc0.258.g878e2cd30e-goog

