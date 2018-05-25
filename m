Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3C9667DF8F
	for <lwn-linux-doc@archive.lwn.net>; Fri, 25 May 2018 17:24:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S967351AbeEYRW6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 25 May 2018 13:22:58 -0400
Received: from mail-wr0-f196.google.com ([209.85.128.196]:32812 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754711AbeEYRVW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 May 2018 13:21:22 -0400
Received: by mail-wr0-f196.google.com with SMTP id a15-v6so10454608wrm.0
        for <linux-doc@vger.kernel.org>; Fri, 25 May 2018 10:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lILut2XwFIpu+wyBXiRPzyeQQvgUlNIl5NNAqzVkiro=;
        b=bxIlA/zEYViQiJmcuaKWjyYnGbEDIPus0BzLAXbcTO2iRGnPP5+0SkrWIWN1GR7Id5
         +/pNn0GbgMsiJ4i6odcVGf+quRhk+K+AO2y0ySnOJqnvfiQF6hydPisF5QjdH0B1FcEK
         g8DT8AVaHH65HUV8d4x8pYElhLPpoNW22DndvMkCPiixxH7la1WUFI/IIg+suvxbLvLr
         tiJGMq/RBG1EOdyV2tvFWyptb5GvwMFfHEvINaMIeR171U3SqQXYKqSDvg94n+Ndo/Cn
         0FnngwQL7JEp58O7WMjJHI4mQ352yvar0zSZn+mD6DdAahSsaiqR/KEXjV4OCKaPzlJf
         idGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lILut2XwFIpu+wyBXiRPzyeQQvgUlNIl5NNAqzVkiro=;
        b=R8IzFcM2sMiDNm1eBqxeex3UOO1JNiJKe3JG9EmcEcaNY7baVD17a9NNwQOoK8Lnqv
         0q0go7Xf5dsmmZ31kgwKU7BU/M1HnMewpGGhjxFITBsV42hO22WHlZOvB0zJobGxix1w
         XyJ7KDuBvd1nJRBoK9aQDmwN0yNCE6Q3JlWc0wDefM+z4RqKSQVjajB2iRF7tEGMlg+/
         6dajUAZaRb3BXxUG1MbzuTnAeF9FsifBc4SnrVrnmzTyaJoKkG4VWYXVx7kHetB6MXOX
         0o5nWoDvgZVnrnjcH5NeOPxww3aBcXqnQCVNMG3/7iBZNa385UseHoWRO5O5iR1J5pvA
         Fysw==
X-Gm-Message-State: ALKqPwfwgDa6ZWzR0I6tZnBjfYyDWdChtDyty5+WgwDO0kcEpH4e2iKh
        YdP3mgDIsg+pecVbfXXdPFCdvg==
X-Google-Smtp-Source: AB8JxZoNyGldGXQkycJ5mcoEPhF9vnulrogiFTAP4ZCnDO2Pj/NdNxHxwUAovLOaOe9xqtcrTu6nAw==
X-Received: by 2002:adf:b201:: with SMTP id u1-v6mr3216472wra.2.1527268880959;
        Fri, 25 May 2018 10:21:20 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id s5-v6sm26579964wra.48.2018.05.25.10.21.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 May 2018 10:21:20 -0700 (PDT)
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
Subject: [PATCH v3 1/6] arm64: add type casts to untagged_addr macro
Date:   Fri, 25 May 2018 19:21:11 +0200
Message-Id: <3207c33dfa90a225b57121041d425b21ec142f62.1527268727.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.921.gf22659ad46-goog
In-Reply-To: <cover.1527268727.git.andreyknvl@google.com>
References: <cover.1527268727.git.andreyknvl@google.com>
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
2.17.0.921.gf22659ad46-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
