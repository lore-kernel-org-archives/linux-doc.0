Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 696E57D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Nov 2018 17:32:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389841AbeKGC5W (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Nov 2018 21:57:22 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41549 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389813AbeKGC5V (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Nov 2018 21:57:21 -0500
Received: by mail-wr1-f67.google.com with SMTP id x12-v6so14472385wrw.8
        for <linux-doc@vger.kernel.org>; Tue, 06 Nov 2018 09:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wyLKUPGn9jgKs5kyhcnEkFlESwFUwxhfNlag9MpDnKY=;
        b=NdZcOdV+SeQJsPz94m7H4XbZIwYUVU7yfboopa1Zjkyz1uIe2LlTLBqR71KPODjk4w
         w2i8lDUlVZAZkkOc9R+Q3ZJezDsbmPNngjH5GGihgainLZsCuwZov11A/67GWeqlJcfq
         +nbTxxtex/VSTC6mj0qA21CD7O1h+ebTAPCJNL2lovRDEHcZNUuJySqcFbS+ZbxwDr/E
         K2ifbpcrlmfB0NCeAVLhsJelIHCbITz8Q/LhoU36zDmoN+csn7I9AlcesdomO9yOLYsd
         khQiU+Km8JaWBY1mrboUqf+Qb5s/GZ9L6HQqsuN/RYVQLW821T971uEQ1HkkHYY5Jlsp
         V76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wyLKUPGn9jgKs5kyhcnEkFlESwFUwxhfNlag9MpDnKY=;
        b=Dc4WqS8mKEe2l7CwYRsmKWgoZL1/f1Sz4bkGQ3LJi7LKEhr1hWf/q5uPquvkhYX8B1
         2XY+llKzJWZdVF48gJXPLiEmC9dH+3PpWW7zkv79j56kEBC+xHAT1fXKLKcwFmQRXWGI
         5izs0uEIdmJgwY5HlUSL0rgeGBlCMNGpORQ9fKbcVRrMJ88/64PydDRVHso1p3CZrI8h
         zJW8fBf25TEbHRXW2r9jMvReYv/PGQg/8EklK3oIFj3N+7nw+NdbQlFrqRuHlFVyU3G3
         4nmz9YLGYl4z112dfaOhvr2klE52WJZFV6JV3UasdcmLvjswhiOg64VUXD374fEUkho3
         vDVg==
X-Gm-Message-State: AGRZ1gKW1QAl9Q+ZYVWGxRsl5xxsBoyRACqrGX3+N7oUfxSbY+voD6OK
        PPzFwxLHo5FHsAPYPImITTa3jw==
X-Google-Smtp-Source: AJdET5d8EgWArhBW85rMDSm87h+TZuEVQo4IoirzvQvLb/UzVNBtYXRv1TEEXHRWUFUXNfkKIR1brQ==
X-Received: by 2002:a5d:6551:: with SMTP id z17-v6mr20589467wrv.231.1541525464645;
        Tue, 06 Nov 2018 09:31:04 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id z17-v6sm16328416wrm.65.2018.11.06.09.31.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Nov 2018 09:31:03 -0800 (PST)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Dave Martin <dave.martin@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Ingo Molnar <mingo@kernel.org>,
        Paul Lawrence <paullawrence@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        kasan-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sparse@vger.kernel.org, linux-mm@kvack.org,
        linux-kbuild@vger.kernel.org
Cc:     Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Jann Horn <jannh@google.com>,
        Mark Brand <markbrand@google.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Vishwath Mohan <vishwath@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Subject: [PATCH v10 14/22] kasan, mm: perform untagged pointers comparison in krealloc
Date:   Tue,  6 Nov 2018 18:30:29 +0100
Message-Id: <1d9612a508dd95248cc1cd3b4a4b332b4a198212.1541525354.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.1.930.g4563a0d9d0-goog
In-Reply-To: <cover.1541525354.git.andreyknvl@google.com>
References: <cover.1541525354.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The krealloc function checks where the same buffer was reused or a new one
allocated by comparing kernel pointers. Tag-based KASAN changes memory tag
on the krealloc'ed chunk of memory and therefore also changes the pointer
tag of the returned pointer. Therefore we need to perform comparison on
untagged (with tags reset) pointers to check whether it's the same memory
region or not.

Reviewed-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 mm/slab_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/slab_common.c b/mm/slab_common.c
index 5f3504e26d4c..5aabcbd32d82 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -1534,7 +1534,7 @@ void *krealloc(const void *p, size_t new_size, gfp_t flags)
 	}
 
 	ret = __do_krealloc(p, new_size, flags);
-	if (ret && p != ret)
+	if (ret && kasan_reset_tag(p) != kasan_reset_tag(ret))
 		kfree(p);
 
 	return ret;
-- 
2.19.1.930.g4563a0d9d0-goog

