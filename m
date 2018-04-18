Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BB0697DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 18:55:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752903AbeDRSyz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 14:54:55 -0400
Received: from mail-wr0-f196.google.com ([209.85.128.196]:44633 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752953AbeDRSxX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Apr 2018 14:53:23 -0400
Received: by mail-wr0-f196.google.com with SMTP id o15-v6so7522791wro.11
        for <linux-doc@vger.kernel.org>; Wed, 18 Apr 2018 11:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=7LqFHjLc9fmiJK6kWcf35NOcOGeLklJMrxXiJTH3PIY=;
        b=Y5qNS+wHx6+CdgIacN8a4BPFjxE7EoaznGgXPH0N69fY3IWMwTWpEXmbLRVRwyyqry
         voRnd/lDcaZTlJwuhOwlsW9Kj+nnXs59nC3JQ4WOIoy3I7Qopip8meH07jej6FmN37zV
         XpvoTdaIFA/jLueSy1SL9CtUIw1C3MwLNDAVmYy3u7TzGMliMrGWJpxyMF8Cwbp0e6wG
         nmheGOWmiMdRbd3pFcZ3ZocVM/ZWzUELsN+ZO8b27T7/UZyijkP71A8ijZrxFL2OiuG1
         RKQB14fWH4xVs/nyD1rfIzPFk627U2in3JTk3p0kVZhaYo3FVQBbDONs1Bn96/YDJYor
         TGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=7LqFHjLc9fmiJK6kWcf35NOcOGeLklJMrxXiJTH3PIY=;
        b=a7NO6bWTD4hajF/Gh0lOOFOvJ9ZMh52ZAa/tAjXp2KmYqofBMlB6T6X65yD/2uyCAb
         s3no/yV/CE46m3i5rxk/W4Lk9ZISopFtkYG/YsHRJaBUZEbS+syFsW1/gIG7EpswIDg3
         uoOe17Xjuf/5Z4S0CnMuTl/hYNX3peDVta9F1A/dFH3+nKpSUvy5NObjiTxWt74T4djO
         yLeRL3g9nLgHIErnONlQisDLlHcxlZNV9Hl1wOHrNBv5+J3oSA3TtDpiWg+tcpg8GedJ
         jlTvDWE+Z70HKO+37/xQfCcj5CJuv064cicev+am7qxdjJXHDd+Cg02q4Hxs1xfk+6or
         U9Jg==
X-Gm-Message-State: ALQs6tD+ldn4l7Ov1GEPnDeLT3B0c/YQfu1pzXBUejOkbohRMjC/WPRd
        GrwiTw++Z7wlQpkIaPeNHXARSg==
X-Google-Smtp-Source: AIpwx4+B0pjbQyWKQY9fQR9K19/64zAuAzCr4KKSyoP7Syb44CYVgusfIIjx+clr3qT4sbFKWLN/pQ==
X-Received: by 10.28.40.4 with SMTP id o4mr2674684wmo.44.1524077601662;
        Wed, 18 Apr 2018 11:53:21 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id k79sm2616735wmg.39.2018.04.18.11.53.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Apr 2018 11:53:20 -0700 (PDT)
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
Subject: [PATCH 2/6] uaccess: add untagged_addr definition for other arches
Date:   Wed, 18 Apr 2018 20:53:11 +0200
Message-Id: <3001f7c75f1f99b4c7b789cf91da06678df3435e.1524077494.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.484.g0c8726318c-goog
In-Reply-To: <cover.1524077494.git.andreyknvl@google.com>
References: <cover.1524077494.git.andreyknvl@google.com>
In-Reply-To: <cover.1524077494.git.andreyknvl@google.com>
References: <cover.1524077494.git.andreyknvl@google.com>
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
2.17.0.484.g0c8726318c-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
