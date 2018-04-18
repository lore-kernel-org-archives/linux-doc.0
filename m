Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E3F147DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 18:54:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752983AbeDRSxY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 14:53:24 -0400
Received: from mail-wr0-f195.google.com ([209.85.128.195]:45497 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752939AbeDRSxV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Apr 2018 14:53:21 -0400
Received: by mail-wr0-f195.google.com with SMTP id u11-v6so7512100wri.12
        for <linux-doc@vger.kernel.org>; Wed, 18 Apr 2018 11:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=upppdIDGgX4DchLqIIxDa1ACj7PSs1Jc4nEJzkc95m8=;
        b=YcvbuTuHQTQasRgn+75bEOw/WjWlJrm2p9f3ulUY4yhG4ZjrDgwmBO4Ts8t9t4DQ2h
         CcvbibYeCeKDUi8beUhiZUHHic51ImmzKtq8AI+d/2UzeZUBw/B5c49Np/+jEv9H9Tv2
         jNVzhijqmNRY6HRTV6tP0U0hhOtvsC1hTvPx5tR03dwSDvy9i8ZmK1FQ8xRV+SBhpphc
         Rwdl5zS55ovlppZKFKNnU97uuPjx9+Iy7w9ZRsw8Q0gMEoZ5pZVx8pBXm7JwjBuHvXhf
         CXpHmDQQ7h265fAf49raQaM3nxI7WeNvICwTGWMWGiFMcuSLhnXYdcYK9qqyg1gvtCRy
         vFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=upppdIDGgX4DchLqIIxDa1ACj7PSs1Jc4nEJzkc95m8=;
        b=UwEphHovKZm4+gyenrES+YwnyAWIGj6SS2+NL7C+2z/whbtQDQrtie7MNREPJ9SEMX
         y4U3swctyZrLafi2XqSjegvWfrYswKm8Qj3FILf6I2O+8TcMefCcG5orfUU/Ad9vYLLM
         N97K+lwxMEVQ5SPrZz+5F/B4I7RcilU2C25t9m04UcForiPpgNrWLuTHJvp233qYi0R2
         ao24NgTF/V9SurMs9gcIqiri/jIDFmi11hSNNaeKXuh4IB987+9Tg8R6FVKkVRP7pvnw
         e1MfiP8Es1BxSJ8l+lYpXnbokgK8ZsSZmHFKYqpqrjs3Bvz7EsSy9D97dojJcDgzQEAy
         Fgvg==
X-Gm-Message-State: ALQs6tCVhoQjrdrXmbvXUYalJpvUck0LW3X37n+iXqGE6DLsCM2Pcmez
        LgDPTdhWXM7vfYT+DAk8C/Pv6Q==
X-Google-Smtp-Source: AIpwx4+mCNu3FKyFByPV3u1yjEnA8QViNl6fr0SMUnpjf3SaNtOBhM1DMB4b84D7rEhq1vAwSLRQ9Q==
X-Received: by 10.28.177.197 with SMTP id a188mr2390658wmf.121.1524077600112;
        Wed, 18 Apr 2018 11:53:20 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id k79sm2616735wmg.39.2018.04.18.11.53.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Apr 2018 11:53:19 -0700 (PDT)
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
Subject: [PATCH 1/6] arm64: add type casts to untagged_addr macro
Date:   Wed, 18 Apr 2018 20:53:10 +0200
Message-Id: <f3557f02473500f1d8baa7c0fa6bde21a9a13c8d.1524077494.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.484.g0c8726318c-goog
In-Reply-To: <cover.1524077494.git.andreyknvl@google.com>
References: <cover.1524077494.git.andreyknvl@google.com>
In-Reply-To: <cover.1524077494.git.andreyknvl@google.com>
References: <cover.1524077494.git.andreyknvl@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch makes the untagged_addr macro accept all kinds of address types
(void *, unsigned long, etc.) and allows not to specify type casts in each
place where it is used. This is done by using __typeof__.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/include/asm/uaccess.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index e66b0fca99c2..2d6451cbaa86 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -102,7 +102,8 @@ static inline unsigned long __range_ok(const void __user *addr, unsigned long si
  * up with a tagged userland pointer. Clear the tag to get a sane pointer to
  * pass on to access_ok(), for instance.
  */
-#define untagged_addr(addr)		sign_extend64(addr, 55)
+#define untagged_addr(addr)		\
+	((__typeof__(addr))sign_extend64((__u64)(addr), 55))
 
 #define access_ok(type, addr, size)	__range_ok(addr, size)
 #define user_addr_max			get_fs
-- 
2.17.0.484.g0c8726318c-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
