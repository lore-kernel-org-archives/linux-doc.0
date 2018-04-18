Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D72F27DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 18:53:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753048AbeDRSxs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 14:53:48 -0400
Received: from mail-wr0-f195.google.com ([209.85.128.195]:46834 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752944AbeDRSx2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Apr 2018 14:53:28 -0400
Received: by mail-wr0-f195.google.com with SMTP id d1-v6so7521622wrj.13
        for <linux-doc@vger.kernel.org>; Wed, 18 Apr 2018 11:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=toZBohlOWDiEKrPW3p9JdtOT1z0eiogSGWK/THMLOZ8=;
        b=wCsTPP/lgPn3EvPWa4udd8AK+U36N1PQjXKBm4wauzo1Eks0os35Ev2seoyEZxxVGI
         dNtXNPM0XOdQzzcykewx4zhfxEt1jzQ3yrCMon3IW+CQ5fKvCanelrSjYSJ2E18Qs7Cf
         txRBCJC5OO4rKPw26uy+83nrK9fJvSKak5ZEkpP5uebqAJVtTqtd4jNEITF2Ez03Ynmt
         ZLPnqP2NWllzuDd64ohHHuebmAk2aNpH4KnWN0CdK2C3wrZv+atI/ujv0IQgtOMa8vUq
         jzTak6Zo2rotICxTwkQ51CHuwzcM/onQ8TSL/KxZLr0TpW1OO2YbcxgEQ+tHj8qVjGhy
         J48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=toZBohlOWDiEKrPW3p9JdtOT1z0eiogSGWK/THMLOZ8=;
        b=kT0xm2p6qjnMmISpL8HWj8Vclop5jcAxQnunk97Vr/YuGAhKtk+il0s7oOxw2DYiP7
         pKt3IxuUNePTQXB21+LDz7PmEYL5Eokex2zSYOLveSx26yZ21KPnhJNrkf8mD/EE3JBT
         cz+8CJ2Ku89hQ5H7N4NHKfwdxYuJ27Ltkxtv/2A66NzKw2x8vJi2ujv4v5Dg2KQk/bny
         c/Zh3M5qSbyTnzxEnFgv/X6IJ4R61urKOmlUPUtZmjrCu6NowntSN3e8+IqhMal4p5Yv
         AJnRq7yRtDaQv2m+PuAcJIVNlZZkagcXbsWKBPWv352OsMQTeQ0LKYIzTos5LWGzfpiN
         6NZg==
X-Gm-Message-State: ALQs6tDTKcuIKPKhIS/GQId29ROIQr128KInRWxmtbYHYd6fAQg8Wxv6
        g2+7EXIVwTiyZtxOQ9ChAzm5KA==
X-Google-Smtp-Source: AIpwx4+S5EFC7jdGqy0sLbR9gOfqpUBQsmSEOETBpuJK0ZJ3gjbYmpNce77c+5swtw0tc6Ghd7tG3Q==
X-Received: by 10.28.34.7 with SMTP id i7mr2438174wmi.97.1524077606692;
        Wed, 18 Apr 2018 11:53:26 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id k79sm2616735wmg.39.2018.04.18.11.53.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Apr 2018 11:53:25 -0700 (PDT)
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
Subject: [PATCH 5/6] lib, arm64: untag addrs passed to strncpy_from_user and strnlen_user
Date:   Wed, 18 Apr 2018 20:53:14 +0200
Message-Id: <82ccccd82c350f9243fc4e1d377cdad9bf23809c.1524077494.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.484.g0c8726318c-goog
In-Reply-To: <cover.1524077494.git.andreyknvl@google.com>
References: <cover.1524077494.git.andreyknvl@google.com>
In-Reply-To: <cover.1524077494.git.andreyknvl@google.com>
References: <cover.1524077494.git.andreyknvl@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

strncpy_from_user and strnlen_user accept user addresses as arguments, and
do not go through the same path as copy_from_user and others, so here we
need to separately handle the case of tagged user addresses as well.

Untag user pointers passed to these functions.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 lib/strncpy_from_user.c | 2 ++
 lib/strnlen_user.c      | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/lib/strncpy_from_user.c b/lib/strncpy_from_user.c
index b53e1b5d80f4..97467cd2bc59 100644
--- a/lib/strncpy_from_user.c
+++ b/lib/strncpy_from_user.c
@@ -106,6 +106,8 @@ long strncpy_from_user(char *dst, const char __user *src, long count)
 	if (unlikely(count <= 0))
 		return 0;
 
+	src = untagged_addr(src);
+
 	max_addr = user_addr_max();
 	src_addr = (unsigned long)src;
 	if (likely(src_addr < max_addr)) {
diff --git a/lib/strnlen_user.c b/lib/strnlen_user.c
index 60d0bbda8f5e..8b5f56466e00 100644
--- a/lib/strnlen_user.c
+++ b/lib/strnlen_user.c
@@ -108,6 +108,8 @@ long strnlen_user(const char __user *str, long count)
 	if (unlikely(count <= 0))
 		return 0;
 
+	str = untagged_addr(str);
+
 	max_addr = user_addr_max();
 	src_addr = (unsigned long)str;
 	if (likely(src_addr < max_addr)) {
-- 
2.17.0.484.g0c8726318c-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
