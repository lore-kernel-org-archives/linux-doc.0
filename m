Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A8DD07DF8A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Jun 2018 17:45:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932898AbeFTRps (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 20 Jun 2018 13:45:48 -0400
Received: from mail-wm0-f67.google.com ([74.125.82.67]:37030 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754653AbeFTRkY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jun 2018 13:40:24 -0400
Received: by mail-wm0-f67.google.com with SMTP id r125-v6so997474wmg.2
        for <linux-doc@vger.kernel.org>; Wed, 20 Jun 2018 10:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=w0KS5wF5BL6rD0Y4f1kcghkQJh+byDC5CHCPIBvVtCQ=;
        b=oB65+o0jQ6qB2W2699FbtW2XW66vGi/Teqj7sIvX27wm2wTSHZ3YDvMGRf+qxaxnsl
         dOr8z4/U5995KND4N0UtgUPJa5qqlmqKZjtslOlip+RRCV4rRSig29xMZFtKdKySe6QK
         idgHT4El7SEtMLxZLiXbVYVFNWkC3yclBl7DF46d5gK/D6YikGiZBxc4hMUrsQ33N9to
         drAoTWViBkbS5eVZlCFOW43LVfI7eTo2dI+h+lmXLFV93EiqsJq6e/NhtmUBqTg+kSaX
         Ibcn+BAL2vAM6qg3eKwkM9loUGopvD4Ixi4rrgwOQ5L1l/vxdZHj7rB5HDFnegO/Yj2d
         ZP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=w0KS5wF5BL6rD0Y4f1kcghkQJh+byDC5CHCPIBvVtCQ=;
        b=laBq2wbDxYB0+SrTZHZPMqVU0SshZnxGGcx/BVCGWQjdZL408ciT02VOBmzazBX/T3
         SGMNEpQMtxYkuG7JAJhLMnkx6Wl41Yn50bfaZornEq7ZWYFpW12lpw0rKpk3ODRVdbZh
         qJjC/TfY3wkoj5RJDU+6B9zKGNpenRCz0z5UG0wZqvJXU6p+JWCunmkkeRU5k+Hw1Oed
         qh3a5oBdHGm0/3XGOn7QTcNiHpvFMFvE6j+FB4lqMtciA6WKObAAdALS+Xe4EBJThfVt
         AVfYemLbHVrH/BMdFcAP/qR2DeY9pRagRjCJyeAM4aX8aaCd+S+E8tRSXNS96uEep7Ko
         q/Kw==
X-Gm-Message-State: APt69E1+EcdijZJxcWLQM9XMtUJqgLCdwy6zIGiswiKrsoyqXKAhJYdR
        QD2sZv6AqQ7OumfnNY3OnUwCdw==
X-Google-Smtp-Source: ADUXVKIHy452yLplRLjZDKj8sDFzIOaOQhbaOdQUSN2hzmJutj4WX2Ro1xrWueNxZDkgOiWF/zqi1g==
X-Received: by 2002:a1c:dcd:: with SMTP id 196-v6mr2542897wmn.131.1529516423292;
        Wed, 20 Jun 2018 10:40:23 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id f18-v6sm4388598wro.1.2018.06.20.10.40.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Jun 2018 10:40:22 -0700 (PDT)
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
        Andrey Konovalov <andreyknvl@google.com>
Subject: [PATCH v3 10/17] khwasan, mm: perform untagged pointers comparison in krealloc
Date:   Wed, 20 Jun 2018 19:39:56 +0200
Message-Id: <6ab2ac0b6a7d12d2a6616e847732305dde544a99.1529515183.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.18.0.rc1.244.gcf134e6275-goog
In-Reply-To: <cover.1529515183.git.andreyknvl@google.com>
References: <cover.1529515183.git.andreyknvl@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The krealloc function checks where the same buffer was reused or a new one
allocated by comparing kernel pointers. KHWASAN changes memory tag on the
krealloc'ed chunk of memory and therefore also changes the pointer tag of
the returned pointer. Therefore we need to perform comparison on untagged
(with tags reset) pointers to check whether it's the same memory region or
not.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 mm/slab_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/slab_common.c b/mm/slab_common.c
index c279b52c7565..7746d2ef5d45 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -1509,7 +1509,7 @@ void *krealloc(const void *p, size_t new_size, gfp_t flags)
 	}
 
 	ret = __do_krealloc(p, new_size, flags);
-	if (ret && p != ret)
+	if (ret && khwasan_reset_tag(p) != khwasan_reset_tag(ret))
 		kfree(p);
 
 	return ret;
-- 
2.18.0.rc1.244.gcf134e6275-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
