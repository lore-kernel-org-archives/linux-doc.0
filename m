Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4B48D7DF8A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 25 May 2018 17:22:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S967614AbeEYRV2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 25 May 2018 13:21:28 -0400
Received: from mail-wr0-f196.google.com ([209.85.128.196]:34822 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967402AbeEYRVX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 May 2018 13:21:23 -0400
Received: by mail-wr0-f196.google.com with SMTP id i14-v6so10446458wre.2
        for <linux-doc@vger.kernel.org>; Fri, 25 May 2018 10:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZDgTBkc7SgtSMHD63ovogp2w1o0H2E+utv6QzLdbKbE=;
        b=CWX2KrxtOpOGEhzQyMghOdwHK2k6aPH3o7eD3rNp8WSLhYe0UdTc042AN8ik/cwOWc
         x9hQeNVDL8PxiCrCBp0iDPKGYbfjmv5iUZZG/ReZsXe5eO0oSnrMIYju+BlmlnHvvI2s
         vFwmZ6WoxDfmFQSS0yXGCfEnWDW5AWfooh19S+g5u3Zef/0344xDlJ34NPWtnDZDQwea
         /htXuR2NK85coCDPG7azc5VoiRrW6gus1MfAmaNZRtx+zvQuvwgjT7SAiSJjYj8Ixsye
         XpA73/ICdqmO2ybICF4N9DRstkCLBjufVzOA4sS/u8Z5Ykhwub2ec3A2+OUUzAiLVDX2
         E5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZDgTBkc7SgtSMHD63ovogp2w1o0H2E+utv6QzLdbKbE=;
        b=Gz4bd/SreklMHnEbkJdG8Sj4bPTT9hReko8GrTasBHmSCl86jey8fViSorXHbl/CtD
         18BqJ2C5j5VX/yrs5Ubeop8XONGqVlDEj4+c7A/f4OijSvuuJwnTPlS308+ZeQ4KxP3u
         SbNC8uaFBcyWL9DLOx+mmhTScNAbpesmcy2od6qcI4D3HtgB2XUKGEHPlBTJfmWToV5e
         bAgxP39ROHFU3BolPWESUJiKCKf6IqnGnjLPdDSnVWi5HBTpQRaKXkH6u6Y6483G5w7N
         ECq/+Lt+hz8evZkNeWJjD8H7cPuzG2m4+uly+qJ/FhT/0vm2GR3nenTkhIfJGeoAb893
         Cf6Q==
X-Gm-Message-State: ALKqPwfPPu9R2f/GzQ27TdNy7kGcvvRpPHt67pyU/in5iYxBh7x/0mWU
        jcHJ9PZcMvsyhV1LOEAeTReXnA==
X-Google-Smtp-Source: AB8JxZqdncVPgboUx+muPIF6UZylHBYvo3cLcj9D5apljZ+baBrO3bD8dYoz6bx4+7Zz/q2kAv0kFg==
X-Received: by 2002:adf:80ad:: with SMTP id 42-v6mr3255242wrl.211.1527268882429;
        Fri, 25 May 2018 10:21:22 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id s5-v6sm26579964wra.48.2018.05.25.10.21.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 May 2018 10:21:21 -0700 (PDT)
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
Subject: [PATCH v3 2/6] uaccess: add untagged_addr definition for other arches
Date:   Fri, 25 May 2018 19:21:12 +0200
Message-Id: <8213858e15e7ad5f27cccb442a62db141269c973.1527268727.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.921.gf22659ad46-goog
In-Reply-To: <cover.1527268727.git.andreyknvl@google.com>
References: <cover.1527268727.git.andreyknvl@google.com>
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
2.17.0.921.gf22659ad46-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
