Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3C8567D089
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Nov 2018 17:30:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389658AbeKGC5B (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Nov 2018 21:57:01 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37689 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730817AbeKGC5A (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Nov 2018 21:57:00 -0500
Received: by mail-wm1-f68.google.com with SMTP id p2-v6so12900075wmc.2
        for <linux-doc@vger.kernel.org>; Tue, 06 Nov 2018 09:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bOEKal8RBRTtWSpTxNA94ZGJWCyGRWdgsr1BoKcGe9Y=;
        b=Y+JaKNNgXBgr6Jwh77JFn54Ud9LeC25orGV/QEwMUJVZJOpZMlBYwv++U+CYCLelPU
         vj0qUgYsRe3ImvGiWtzR0lfkqoNrpLrIeBHcuByNoVKslQJ9vxAUJSnYAr0poPt78I7D
         mWqMTMtiao+3C5hZyPLfjow9DWPjGjEwY2dy7x8MPT46QXCjUDa+fOuywqKiokAeQM1j
         qgoRzxOd08r7H/xMb2tEYutlTFK3SS/4M8LhMUTq2wa29hMVBvGFDu5SYN5Z0r+gF0mW
         rRw9MzJ+cNMEN8kqmxC1y7d0T7MalzIruz+SoiVY1SLeX4wVbktJFPzOHahQPV5d7jBd
         pxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bOEKal8RBRTtWSpTxNA94ZGJWCyGRWdgsr1BoKcGe9Y=;
        b=OXtlwj6/HSJPJq2WpbJWwqRtCITKKXgb8EdtSDuXS9lz/Eq7MAy2hX2fqV0Pa5QTkr
         6+9vsn4UB8S7w9iK1ZGx7GDGclAmYsw3iHzzpa/6uWSxMzMqvnUXZLWfBJKB5O8SqFdf
         3oFqFKUDv9+qf6zaBTqtfzz1w64oL8s9Adz3z2TJtqYTDglX8QnxyBx1C0yKK59wxcxU
         XnrXuRYC1sZF/wVoC/yBJhMh+8wLbMQUwEo2qlRVzEsBdx+oXNl3VlnfiOQfxJN5ZnEg
         DdD7N9vvx74skzJVEOq8KbJck49ahDsoTd2NKLbSlpP29SyH26TBTs6q5uFt3jkH4uGv
         GPHg==
X-Gm-Message-State: AGRZ1gLx1yeoPtgnccxUSZy5BKUM8gsBN0fO2u1H/IlzEG3lYygjPbQQ
        B2EEa1IJWPSHN2OsGA5H1vQvow==
X-Google-Smtp-Source: AJdET5dBD0E5xJ40vEso8U5nzyUsyOPliGVN3y8L7pt7/Ig65473+BQawanYnU0kxpouZIDmv1Cubw==
X-Received: by 2002:a1c:2dd0:: with SMTP id t199-v6mr2801475wmt.50.1541525444008;
        Tue, 06 Nov 2018 09:30:44 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id z17-v6sm16328416wrm.65.2018.11.06.09.30.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Nov 2018 09:30:43 -0800 (PST)
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
Subject: [PATCH v10 02/22] kasan, slub: handle pointer tags in early_kmem_cache_node_alloc
Date:   Tue,  6 Nov 2018 18:30:17 +0100
Message-Id: <76e40ec9137224352051f1e3ebcd8e8ee95044e1.1541525354.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.1.930.g4563a0d9d0-goog
In-Reply-To: <cover.1541525354.git.andreyknvl@google.com>
References: <cover.1541525354.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The previous patch updated KASAN hooks signatures and their usage in SLAB
and SLUB code, except for the early_kmem_cache_node_alloc function. This
patch handles that function separately, as it requires to reorder some of
the initialization code to correctly propagate a tagged pointer in case a
tag is assigned by kasan_kmalloc.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 mm/slub.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index fdd4a86aa882..8561a32910dd 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -3364,16 +3364,16 @@ static void early_kmem_cache_node_alloc(int node)
 
 	n = page->freelist;
 	BUG_ON(!n);
-	page->freelist = get_freepointer(kmem_cache_node, n);
-	page->inuse = 1;
-	page->frozen = 0;
-	kmem_cache_node->node[node] = n;
 #ifdef CONFIG_SLUB_DEBUG
 	init_object(kmem_cache_node, n, SLUB_RED_ACTIVE);
 	init_tracking(kmem_cache_node, n);
 #endif
-	kasan_kmalloc(kmem_cache_node, n, sizeof(struct kmem_cache_node),
+	n = kasan_kmalloc(kmem_cache_node, n, sizeof(struct kmem_cache_node),
 		      GFP_KERNEL);
+	page->freelist = get_freepointer(kmem_cache_node, n);
+	page->inuse = 1;
+	page->frozen = 0;
+	kmem_cache_node->node[node] = n;
 	init_kmem_cache_node(n);
 	inc_slabs_node(kmem_cache_node, node, page->objects);
 
-- 
2.19.1.930.g4563a0d9d0-goog

