Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CAD36B16
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 13:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0SfEDlsj"
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB3B1FF9
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 06:47:38 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5a7b10c488cso55330817b3.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 06:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698155257; x=1698760057; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OUWmo6RLkaXHvLlOp0/KP9HFW8MtULS71POlQ8HMTCI=;
        b=0SfEDlsjFph2hfUTgDdtPdJfD9EF4HnWhHqceRZHKqOWdnDRz/D+lsJ6i5WJmxMsQs
         3JG5/BQVP6jsoW8qmY13rD+i5tsNDHkUezUqCuKjv/aVuMkaI6euHBKWSZQCUyfhTBtf
         2uZ1EG0mcSHGlLbMH+miFiUgWP00R9bPULDuxZ1ywnc0AtARr2M+QImcmXoJ/Qqm/3Ug
         5iMQDTr6ICjIQcAcL0sVQHIsqp9OJHZHl+4oTb4jjfDgiSetrKlMmhdpjF+BTkGvmnqs
         zvy3Qdy2V8spEMyfMeoF/eNqsgZ2pTEOC5gPILWYtlTEcypaKn7grh68F4KHNT2PtFs/
         aWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698155257; x=1698760057;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OUWmo6RLkaXHvLlOp0/KP9HFW8MtULS71POlQ8HMTCI=;
        b=uVoKNZnFi6waU02jizc/fjzH+QZtyvNIyaRwnhCRM2bCPmixiJRYTTv7Cl5alNYijm
         PTkjTkFaMIWWNTh86WAzRk0xIZuC9QPy5tKhQOZfDPmYANZRmNd/bchjBuYMZZ5LHejl
         +Usrmz803RoZEcUBaoYPscVRKTxZKUSdC7fo8jcYR6pYLvMsLKEIe8SgFqhtzJYI7jyI
         H4w3qPuKxwjsI8ILtd8VBa+hW97vsfdcm5QPvbcg9XPz9adHy59+R0DW4XJrgZDPLdEs
         +kM1fuwQ0LuDlXNztj5HI8ibmFjjqg+5xkjybfsxwo6sf0TpkBIzyT7ilxlMU0kzM1TL
         B5tA==
X-Gm-Message-State: AOJu0Yxe1+bJjTgkfrLpibVccHr4Xk0Ss+1MbycZh3i3i+1TsPrL4Fup
	2BFhQ9T07D8E7q94Gc3H37bZJCBphUE=
X-Google-Smtp-Source: AGHT+IHQ3VEMdDHth6teCnTo9GNQ4j4PajdUPKRUHryC857gV5hBaW9Bct9jFesWnWbFdQlkFZvB05Yolzc=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:45ba:3318:d7a5:336a])
 (user=surenb job=sendgmr) by 2002:a81:48c9:0:b0:5a7:db29:40e3 with SMTP id
 v192-20020a8148c9000000b005a7db2940e3mr273153ywa.7.1698155257303; Tue, 24 Oct
 2023 06:47:37 -0700 (PDT)
Date: Tue, 24 Oct 2023 06:46:22 -0700
In-Reply-To: <20231024134637.3120277-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231024134637.3120277-1-surenb@google.com>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
Message-ID: <20231024134637.3120277-26-surenb@google.com>
Subject: [PATCH v2 25/39] mm/slub: Mark slab_free_freelist_hook() __always_inline
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	corbet@lwn.net, void@manifault.com, peterz@infradead.org, 
	juri.lelli@redhat.com, ldufour@linux.ibm.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, pasha.tatashin@soleen.com, 
	yosryahmed@google.com, yuzhao@google.com, dhowells@redhat.com, 
	hughd@google.com, andreyknvl@gmail.com, keescook@chromium.org, 
	ndesaulniers@google.com, vvvvvv@google.com, gregkh@linuxfoundation.org, 
	ebiggers@google.com, ytcoode@gmail.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	bristot@redhat.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org, 
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com, 
	elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, surenb@google.com, 
	kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Kent Overstreet <kent.overstreet@linux.dev>

It seems we need to be more forceful with the compiler on this one.

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/slub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/slub.c b/mm/slub.c
index f5e07d8802e2..222c16cef729 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -1800,7 +1800,7 @@ static __always_inline bool slab_free_hook(struct kmem_cache *s,
 	return kasan_slab_free(s, x, init);
 }
 
-static inline bool slab_free_freelist_hook(struct kmem_cache *s,
+static __always_inline bool slab_free_freelist_hook(struct kmem_cache *s,
 					   void **head, void **tail,
 					   int *cnt)
 {
-- 
2.42.0.758.gaed0368e0e-goog

