Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7147B7DE78
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 May 2018 14:15:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750978AbeECOP6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 May 2018 10:15:58 -0400
Received: from mail-wr0-f194.google.com ([209.85.128.194]:36838 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751007AbeECOPx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 May 2018 10:15:53 -0400
Received: by mail-wr0-f194.google.com with SMTP id f2-v6so5983468wrm.3
        for <linux-doc@vger.kernel.org>; Thu, 03 May 2018 07:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=wXNsOIULzRBowlkHlt/Dd2liRl3+STS0XzbkUxVElPM=;
        b=cKfcqw7OehAu6sY0jYTYgvFAKeiqX4rmTWXzo9tmakVGK40VkXlaUnz5a8Z53Qhu2Q
         Gh5OtrObUQocBRBjVI7Z8CoDIEvKdeK59I7DkrR5c8m6ydG9Mcj/Qqx5oqQXJOg8yMDu
         bds1ptMh30yiHgIO/cUBougBwYQWYkjGIhddP3NjGd18fWY/2D7Mrwl+xRSdwVP6CraB
         WCXbL3g9DTSGN6lWa6DjJ6eHwYFEacCD+fEIlxrlLuXwrB9YpgusfvWSnaCfAVUj7A4u
         1D+X9jceL+7Yvnrel8cBHdZMrEF2UJ/uN4ZiIIItgFjD/PpbHKTpqpSzek/YQsl4a00B
         WOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=wXNsOIULzRBowlkHlt/Dd2liRl3+STS0XzbkUxVElPM=;
        b=bMfprrQSU5msMGzKTU9YCSjhcwL86X89qEDI0D07ePMMmUD72mZM2VFl99QwrwoV3V
         vuSJAGXQHaRcof8vvbanGdAO2P3XJ2rh1zzjNTgWdmOulJ4ODMmT0tJCHH6RZQl82BaS
         peDCcR7LEX1kOlYtM+sNIM17Iucm9/STK9iL6nYuP3Edc3ybT4L9fao+JV66DIYy8BKG
         poDti8GAlq+KKPV1NgbdRd6qje6Kaeig0z/+02qdZ9JC3m+MNECz81sLSY1uatwSjR/G
         DTadjCu8Qw0SYm8pYrdk2RUdCIJbynMWYFcaNCZF15i36ShAEYUy4eyzp7iplXwuL5Ji
         mwPQ==
X-Gm-Message-State: ALQs6tA7ryVunqpIeh4w5vt7Cnd8032KGqYSp75s/xme72Yiu/WTBfep
        ihKZgv0PE80EoQSEGqSSY8satw==
X-Google-Smtp-Source: AB8JxZoPsEixtvtPtjFL5/kf9+eJmruA8lLTNPHuSDxpygbMTUZneSzwIrOUpIYddWNTRGnTIGl+ig==
X-Received: by 2002:adf:ec41:: with SMTP id w1-v6mr19831174wrn.211.1525356952020;
        Thu, 03 May 2018 07:15:52 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id u20-v6sm22090298wru.33.2018.05.03.07.15.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 May 2018 07:15:51 -0700 (PDT)
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
Subject: [PATCH v2 2/6] uaccess: add untagged_addr definition for other arches
Date:   Thu,  3 May 2018 16:15:40 +0200
Message-Id: <f63094e20c1eb163ba3ae6f3531e791d2675a2a5.1525356769.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.441.gb46fe60e1d-goog
In-Reply-To: <cover.1525356769.git.andreyknvl@google.com>
References: <cover.1525356769.git.andreyknvl@google.com>
In-Reply-To: <cover.1525356769.git.andreyknvl@google.com>
References: <cover.1525356769.git.andreyknvl@google.com>
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
2.17.0.441.gb46fe60e1d-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
