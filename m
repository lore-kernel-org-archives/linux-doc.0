Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3B9317D082
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 13:13:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727945AbeJBT4G (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 15:56:06 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38376 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727828AbeJBT4G (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 15:56:06 -0400
Received: by mail-wr1-f65.google.com with SMTP id a13-v6so2172930wrt.5
        for <linux-doc@vger.kernel.org>; Tue, 02 Oct 2018 06:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hg72P0CosgRbWoaFLc14vzZ1X5hDU4dYtp5LLPrtPyY=;
        b=YxOsXrwelAI/lXWqUvyP80W002B/7n6YQbPrxkL3Y/miO7blJJ1EdFiyRBNCCwuumv
         LVsj+hqhdHZjOY9W8MhdK1bk6eCDfyjz930bJmURnf6BgQMurMXp2LPNMmBOo23+fUZK
         bFq3knuWoaKlq+KJWir7KTX3naHfXXzSSp8PMJ+wrZA711u4/zKWOTjkyH6Zcnf7lM3X
         HVyooy564WzO4uvgji0Lb8fngQnuYXBqiLiC2s/b/R+py7YRH8VN5vGKUMcUa2NFUR9x
         4we1MwOXrkCACvUvM7bAXHfluyXrVN2H6IKjodbIdeAACkgmslAF0UFZ8S67M8zgYfu6
         VjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hg72P0CosgRbWoaFLc14vzZ1X5hDU4dYtp5LLPrtPyY=;
        b=MfYPSPRHX0UjjBd2bF9FjzLK/4hwf0OksNyiXgCESxGKk4RurrEM8lV6rp5I0rWnmW
         OxLlypKsQPFxq05DLlVPUfbdjeZC+8mFkHNm2VnyvwF1itlldbZ0pmz9XuYG3QVWTSUG
         +Y+w20Thp5xnx0SvRvndZTL2YDJVnjdMYyZ+xD/cZNoxLqAe8TI9hVfYINCm5Dx8BqTN
         vx3gikAuxR+8gBfjGm0IrE14cvnvVNSSn68QBUGteIc+9ht0zg2R4V0KHpyP7sejwmb7
         FMoDL9AMIwNpgfbompww+Z9UJMWTCHyum/U+k2YOJojCGINmd6+Sf9yyJEfTDM5yfl+M
         oT5w==
X-Gm-Message-State: ABuFfoh9hUnyecV12nSHvDS5ZY85IPlOPNzNAkDU7t+g8SMoVjtsoHqJ
        M1UcywyU5YbkbmiN71VGs6ZsUQ==
X-Google-Smtp-Source: ACcGV63EvbNvms24ttmp368a2zKSU61XpI0aSwgZcGP8ZkkbdUH3S7LIgrnqug9JC04dDVPW2NeEoQ==
X-Received: by 2002:adf:9792:: with SMTP id s18-v6mr11252530wrb.283.1538485967668;
        Tue, 02 Oct 2018 06:12:47 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id v10-v6sm17458681wrp.0.2018.10.02.06.12.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Oct 2018 06:12:47 -0700 (PDT)
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
Subject: [PATCH v7 1/8] arm64: add type casts to untagged_addr macro
Date:   Tue,  2 Oct 2018 15:12:36 +0200
Message-Id: <6a951a9d1cd38eac1e49591f70e3cb9410349823.1538485901.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
In-Reply-To: <cover.1538485901.git.andreyknvl@google.com>
References: <cover.1538485901.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
2.19.0.605.g01d371f741-goog

