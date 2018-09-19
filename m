Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 519457DE79
	for <lwn-linux-doc@archive.lwn.net>; Wed, 19 Sep 2018 18:56:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727675AbeITAfy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 19 Sep 2018 20:35:54 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41070 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387555AbeITAek (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Sep 2018 20:34:40 -0400
Received: by mail-wr1-f68.google.com with SMTP id j15-v6so2800178wrt.8
        for <linux-doc@vger.kernel.org>; Wed, 19 Sep 2018 11:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d1iMb39p1prK7niLwUfLvs3mbBI1WfSY9Tra+BtzAxQ=;
        b=op++z0BSZ/nwOadd89i0fho9uQZiZsdFy7N0GRCwHUqVvYMaWvDvVmYOPZbERPOPFx
         ad23W/MQBbvV3/GY7+tuqP2Of9HHtQ5OTJHZQdRaqHLIIauiwl5p5TPXuZcuLja8f+lg
         Gmg1pZr0oyuUyf5jFx3yO97RBema8RQDjlge5Vi/p9u6ZVJyeu/Q/b8sZe3wIn46oBTL
         72/Sm5BUPocqr3OOPUjJ579q43JT4k5eYih4kkSQdo03+dbtwIDYkx5ncimrVvHA8k4o
         PG200V3W+tgEQO46uTpx3RAKoZvVLrCxJ5EK6vEUn1RxqZyP4JQ2BP9MlWsfD2UEcjEy
         JKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d1iMb39p1prK7niLwUfLvs3mbBI1WfSY9Tra+BtzAxQ=;
        b=Xi6NutwBgtY8UmDZC7pZ+QlbhJ/5RkOF9Sfwpm2HRTY15gAv5XYuFIdS6uzyYdo4Tp
         9aj08U71R3nv+8IpYI0eOq/Ba/u9SbANmux0Z8mPx53yGnT6ipqR1MOOannX8lTS3F00
         UB0VOQ5/Px6Nx7npWesnUbyZlqhhEThG67dURiIAef8anbTstljHgvWpiG5pt2lTk/Ia
         XFQvgwxiiklohzPupRhQ2si28H1iQZDI1Rpkb/QJAigV9bkhPQv+3RwxGp2kPZ1A1oFX
         mhu2/DnBRX2WaYiUj/4fJctGfYCzhCdZvy/Ui1wVsGb3yJBvs//d+rcPRvMpvRmAzDVP
         jD1Q==
X-Gm-Message-State: APzg51CQOkl7LZqG/erGxKjsUQ+UE9tVKnqwphQm4fk1e6G0G61SZMdg
        ANWtxES3lMd52Bt35rUFty+ziA==
X-Google-Smtp-Source: ANB0Vdb5o820qjCsQHYsVlC6o405PmMuMtbuK7P7pWLgWe20tanCx9P4Y5oo2MG9QevgZjPd50wONQ==
X-Received: by 2002:a05:6000:10d0:: with SMTP id b16mr30374902wrx.226.1537383324464;
        Wed, 19 Sep 2018 11:55:24 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id b10-v6sm8510065wmc.28.2018.09.19.11.55.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Sep 2018 11:55:23 -0700 (PDT)
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
Subject: [PATCH v8 13/20] kasan, mm: perform untagged pointers comparison in krealloc
Date:   Wed, 19 Sep 2018 20:54:52 +0200
Message-Id: <286fcda449120b643e4665fc9848e81260a1300c.1537383101.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.0.397.gdd90340f6a-goog
In-Reply-To: <cover.1537383101.git.andreyknvl@google.com>
References: <cover.1537383101.git.andreyknvl@google.com>
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

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 mm/slab_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/slab_common.c b/mm/slab_common.c
index 3abfa0f86118..221c1be3f45f 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -1513,7 +1513,7 @@ void *krealloc(const void *p, size_t new_size, gfp_t flags)
 	}
 
 	ret = __do_krealloc(p, new_size, flags);
-	if (ret && p != ret)
+	if (ret && kasan_reset_tag(p) != kasan_reset_tag(ret))
 		kfree(p);
 
 	return ret;
-- 
2.19.0.397.gdd90340f6a-goog

