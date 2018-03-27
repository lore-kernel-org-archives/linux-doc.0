Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EA8477DE76
	for <lwn-linux-doc@archive.lwn.net>; Tue, 27 Mar 2018 16:59:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755372AbeC0Q56 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 27 Mar 2018 12:57:58 -0400
Received: from mail-wr0-f195.google.com ([209.85.128.195]:43417 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751316AbeC0Q5v (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Mar 2018 12:57:51 -0400
Received: by mail-wr0-f195.google.com with SMTP id p53so15591624wrc.10
        for <linux-doc@vger.kernel.org>; Tue, 27 Mar 2018 09:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=eJaUh+CmLgN3GGwHqK4N3gE7joHAOCvWBMJLvmKkuIs=;
        b=j0fTrT7HrngKQMXZNOj8n7NOGfUo7qd6xupuNYgm8COVky1GMwI9bSCEc8MjvQ7NO8
         93iyZCaluHos1YVwStlHfoZlMjzkdOsAQOZsArayGVshCigPKgFiRXAtFbRcMbpeZwU1
         prBhUOwx6yo4L6mN+2n5zuQ7jQEnoiOVOrke4JaaZoFy9MAg3TVXXSIJR7TIVFNCAs9/
         QC6ISTtVaJn0sUbwcZ3/+QCW7t+0uRCl6Po0QQJ3rzqvHUFTVC7zSoW2pl7njQKkpacn
         vWn7ySQGDpa0TNh5zj8oi0e8d43aPXGBJRAbMc1FsKSp1A3FRiF8o86BGAfDPm1oKBLx
         4dUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=eJaUh+CmLgN3GGwHqK4N3gE7joHAOCvWBMJLvmKkuIs=;
        b=BXG6bl8pHokbGKeMyOlyG62935WRrm0tnVj3C+eOSjAWfJQsXWOnaKpALY01R7oT1Y
         0pa2VxSwi4I9NkyP6ML82Q0NH20+nQyRXmOlMcFToP4CUoJnvl26+PwRiPTt7mPfx+YU
         nHEvhE/CXFrSefjWDXTYslZvNRMfAWvHIxFUDuqofuUMUOTFRS8a9gDpd+vHyAdcDJjp
         2OUVGccR9yHk6O7RB9J1Z+MLkfED9/ngCK+I6d3UCdiN8YgulqitISxX51d4N0UjYRBR
         nBFkZeEnntcUsbBSuemRvcAgYvyCwXVn2C4q5PPftQVfpZkGh6KSyZAk/Fw53Y7olXef
         /FGw==
X-Gm-Message-State: AElRT7FwiAPYz8LczOhdlGa+wVfGGIrht+Tc5tBW7KGNLe8XGDh4eTxe
        zT381tJkjeiT1cfkaBxrcnAlDw==
X-Google-Smtp-Source: AIpwx486DN8+yq+du0k+qQSl+nN6KjPkVcB/PM1Wof913SgviRcF5T935zJkvApGf4eM5HikxxMJWw==
X-Received: by 10.223.136.146 with SMTP id f18mr108268wrf.57.1522169869849;
        Tue, 27 Mar 2018 09:57:49 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id 93sm1622992wrh.46.2018.03.27.09.57.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Mar 2018 09:57:48 -0700 (PDT)
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
Subject: [RFC PATCH v2 2/6] uaccess: add untagged_addr definition for other arches
Date:   Tue, 27 Mar 2018 18:57:38 +0200
Message-Id: <82fadd039625707fea89668cd50cfae24d19681e.1522169685.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.rc0.231.g781580f067-goog
In-Reply-To: <cover.1522169685.git.andreyknvl@google.com>
References: <cover.1522169685.git.andreyknvl@google.com>
In-Reply-To: <cover.1522169685.git.andreyknvl@google.com>
References: <cover.1522169685.git.andreyknvl@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

To allow arm64 syscalls accept tagged pointers from userspace, we must
untag them when they are passed to the kernel. Since untagging is done in
generic parts of the kernel (like the mm subsystem), the untagged_addr
macro should be defined for all architectures.

Define it as a noop for other architectures besides arm64.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 include/linux/uaccess.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index efe79c1cdd47..c045b4eff95e 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -13,6 +13,10 @@
 
 #include <asm/uaccess.h>
 
+#ifndef untagged_addr
+#define untagged_addr(addr) addr
+#endif
+
 /*
  * Architectures should provide two primitives (raw_copy_{to,from}_user())
  * and get rid of their private instances of copy_{to,from}_user() and
-- 
2.17.0.rc0.231.g781580f067-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
