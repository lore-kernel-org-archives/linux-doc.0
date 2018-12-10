Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8AF327D8BA
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Dec 2018 12:51:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727469AbeLJMvP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Dec 2018 07:51:15 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53063 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727457AbeLJMvO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Dec 2018 07:51:14 -0500
Received: by mail-wm1-f65.google.com with SMTP id r11-v6so10754284wmb.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Dec 2018 04:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EnNoEMrMgUcWWKorAen45ktTirJw06vWZl+y3HjnYKc=;
        b=ZFDzySXH+RcGKbu7apwOJhQV89JvZa+gIzkdi3lCpAr8rANmuaA696lcNSMihz5jsd
         Mgc8z5GDqlKqPiGIFUGFJV5LZ6mPD1yG7h/fXqDnZeBSJrvzsxOfDPf/WQ2TgUnbPF+K
         BulPEM7LRkLz/+A0NCyQ10FFjDpEaoS17rWmhBEhu1vWUWzxbXcbBgiYI+GWlU+bKJpF
         hbHErYklHv8F4KC/8y3KrbRg/WdRewnyb+I6zzpz2QW0JhyjVBllF1qeuzcMDR2q476/
         85vwRgG7I3nE+1b5PDbnOhjIJiH5ILXwm/PcvsVjUrvLOA0sv3kgXe81o9mc0j3Nhaf+
         o9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EnNoEMrMgUcWWKorAen45ktTirJw06vWZl+y3HjnYKc=;
        b=J7FeMdM1U0Sl/P65qbZlMW+gUOowvi5+qk86/AkfSEteiWCrFlVq2lOA1B5bSHYfMg
         +crB0yu1k3GKrR/3dVHbCrbswuUBYyaeKiB04SFnMp0eBOTa+yt8DCjRXZOPFxHZQdmz
         PKV6MzFo83RucOdAgWggCRhQfEyfBpweBJNSTL8ITvrJWySlPMAo7mug2s8o4/Jjd6NX
         tP+V0LPEBfZ9X7old+dzBvbaHSnQw/NXFaWGrfUtwOQe2jxkQe0EamFD/3LDj/Mf3TDt
         h9yC8WELiB/QNAUyj2ekJuF1zUTRLHAyxYChyP6kextk0XVNz2PApGyz1l4Ms0hCTsgN
         nIew==
X-Gm-Message-State: AA+aEWYry5b2cuu/rW64NU/8LDflriLcjLGNTwtf60z4LpJ8flX8Mllh
        XXXhTUQBXSt8PSkX5DDnHf+W4A==
X-Google-Smtp-Source: AFSGD/XfpH+7b2MBHMbSzaZiRmsmRTBYGLOi6i4h/Gy2a0EmicqS+e3KfIv69EriIxjgI+TvTV5Ofg==
X-Received: by 2002:a1c:d08b:: with SMTP id h133mr10494086wmg.8.1544446272635;
        Mon, 10 Dec 2018 04:51:12 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:3180:41f8:3010:ff61])
        by smtp.gmail.com with ESMTPSA id l197sm36893363wma.44.2018.12.10.04.51.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Dec 2018 04:51:11 -0800 (PST)
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
Subject: [PATCH v9 2/8] uaccess: add untagged_addr definition for other arches
Date:   Mon, 10 Dec 2018 13:50:59 +0100
Message-Id: <35f97a89d5cc881f0f4052f43d56b3b7ed736581.1544445454.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.20.0.rc2.403.gdbc3b29805-goog
In-Reply-To: <cover.1544445454.git.andreyknvl@google.com>
References: <cover.1544445454.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

To allow arm64 syscalls accept tagged pointers from userspace, we must
untag them when they are passed to the kernel. Since untagging is done in
generic parts of the kernel, the untagged_addr macro needs to be defined
for all architectures.

Define it as a noop for other architectures besides arm64.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 include/linux/uaccess.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index efe79c1cdd47..42b7a4ac65e2 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -13,6 +13,10 @@
 
 #include <asm/uaccess.h>
 
+#ifndef untagged_addr
+#define untagged_addr(addr) (addr)
+#endif
+
 /*
  * Architectures should provide two primitives (raw_copy_{to,from}_user())
  * and get rid of their private instances of copy_{to,from}_user() and
-- 
2.20.0.rc2.403.gdbc3b29805-goog

