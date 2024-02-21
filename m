Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD21126F0F
	for <linux-doc@vger.kernel.org>; Wed, 21 Feb 2024 19:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708544466; cv=none; b=L/mb/YtwefENBWTXF+FTgnSdozCXVyG1UFbfFOiqkoOWt3VEXerQ2F/VIEklcrb1U38JO1jACEvvbkDhK019Pee6yTtoGuiIymuE6KiH/ldhjDr5ykDnioMzT8ER5Zma5uA0NAqLE2L6pjKMq7XxJxXy7k5xqA3Z/McYyP/prF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708544466; c=relaxed/simple;
	bh=0jXC3LDzUrrolAiGzpejaFGts6g9gPbvSne6eR9EGZ0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DAPLnTykwPLno8oUpY98xUQGrjNW1T4XdMZsf6hKKwMH+nb8h9ja9nOQMzl6kglxP3mqHjlvlKiRVYBqtBcwj63JifwDJbXlk9xxFeWGhk7x+iVBCiNWfberEy+atGdNxRntJ2sM5VyS0CuNVWWCProArVg8pquaxl5S1qYnrZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yAuSI3zF; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yAuSI3zF"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dccc49ef73eso8343424276.2
        for <linux-doc@vger.kernel.org>; Wed, 21 Feb 2024 11:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708544463; x=1709149263; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aDZXV5wClyo81E7oQNbL7t5gFNRFpKZi8JXsyoMDgnM=;
        b=yAuSI3zFtBXJEqtOJqcZ7nFCZUwHdfr+Wu9iAy+CuCFuvUw5k6vUh7m1pSo109/ecX
         eSPLwSRNwaXOqgo30uW6xG4srrJBOp0FJJJ9WQg25TVgBagpMiS06f8PbtRUhpgZfJ+G
         /BENEgZ40l/qfZlXROmPnL3iaMo3Ir8io6yPVmam5fXDzpRaKEV2XWFuOw5c5anxWg4F
         L2iIEHk/SziLOzPkLdx9HL0V/ZcRdUwSWr2v+rTGBLMnGn/wimFfRjzk3cSpVk5LhOHb
         PA9J1utGbhUv15ENpNNyZeGO/9eT+53mAsavVQfxW85P+kvMf8JguBecVxFwrDEEHdth
         E2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708544463; x=1709149263;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aDZXV5wClyo81E7oQNbL7t5gFNRFpKZi8JXsyoMDgnM=;
        b=QisHaalUUfPZzR1+VzLpnn4zpQx51fVSyygopZ64lZ41kfe0Pf9KnrP5Ai12jlK7FC
         WELXFj0UjbLRUvGVy1lly6kgYX+Cesd8PlDp1dP3LCPpynk8PqOhh3fty2QMLW9B8XvB
         SsyPLbxOarfMzTRNVFJDKYOlekqXSm/kxIDn1GU9rWWjgzj10N2Ts01TfkSZhKnAqMGD
         RtQWEaLhlC1iuznIvEXd4E6wnK1EYFzSlVIzVRb5pxJ6JWZSynzPeA3D7zPHwbMrdM3B
         2KCmni2uJzj0UtgTxIoptX1Q9Ma+ULS91As4aG4/bWoV/hqZUscohS+9zYDYzbex8r0u
         Sybw==
X-Forwarded-Encrypted: i=1; AJvYcCUYg6xQfyEC9mQSI0HC7MjjcTddy7qk6v3EpGMP/7us4o8lhBXHkzXscTIWBRUyJ5+2eMCo9BQOK/pYOTEIFfuLkg5DjctABqXG
X-Gm-Message-State: AOJu0YyRggVvfxxa8GNK5emewsZNkUvagjkLEtZ/Xhcxnm8RqLdPB5Qr
	UXBhRmcQLByRmAPpOimgDW/VWlCb9SoE5eCALxKPTSqT1USvitCmUM1OPCZaWw0lsH8c3xkAWZQ
	bEA==
X-Google-Smtp-Source: AGHT+IHYTX89gbhdUEyuW7HvamV6v1+4UrLx/voxHAa1LwjOId1uGP/0Vg+lc29zmz5uf9mDtRdIligkWrQ=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:953b:9a4e:1e10:3f07])
 (user=surenb job=sendgmr) by 2002:a05:6902:1008:b0:dc6:d9eb:6422 with SMTP id
 w8-20020a056902100800b00dc6d9eb6422mr17397ybt.10.1708544463028; Wed, 21 Feb
 2024 11:41:03 -0800 (PST)
Date: Wed, 21 Feb 2024 11:40:16 -0800
In-Reply-To: <20240221194052.927623-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240221194052.927623-1-surenb@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221194052.927623-4-surenb@google.com>
Subject: [PATCH v4 03/36] mm/slub: Mark slab_free_freelist_hook() __always_inline
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net, void@manifault.com, 
	peterz@infradead.org, juri.lelli@redhat.com, catalin.marinas@arm.com, 
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
This is done for performance reasons only.

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 mm/slub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/slub.c b/mm/slub.c
index 2ef88bbf56a3..d31b03a8d9d5 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -2121,7 +2121,7 @@ bool slab_free_hook(struct kmem_cache *s, void *x, bool init)
 	return !kasan_slab_free(s, x, init);
 }
 
-static inline bool slab_free_freelist_hook(struct kmem_cache *s,
+static __always_inline bool slab_free_freelist_hook(struct kmem_cache *s,
 					   void **head, void **tail,
 					   int *cnt)
 {
-- 
2.44.0.rc0.258.g7320e95886-goog

