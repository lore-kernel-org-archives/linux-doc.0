Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4776213E9D
	for <linux-doc@vger.kernel.org>; Fri,  6 Dec 2024 22:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733525539; cv=none; b=B/OF00i7i099SKS47/0Wq2mkBpBVdNcKd4WXIVznAotMZnGgKavQDVQl26vjEBNoXcmD0sH8VVBG2D3Atos2moPA4kvwizYQf/dRwM+NrlBszW2Icl7ndu9L76qRar+6plq2YijkeNw1stYhnblQggPxbq4ghbD4F4SaJTbOrGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733525539; c=relaxed/simple;
	bh=PjabiwPy2/IWTDrO/BYxdaWeCjYeqj9nti52zZnQdks=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pno38Xcx9NDciVo+/acwYGJwOeO6v5UdMcKWqPaR+mKqxpDP7MHn3qkUIM+2iJKoe5FEn35qci7n6fYa199GVUTdBcsoC0hRLg+d+Y6oZqg2jsUhyrfHMgVBSGK96lti6xpjqYnXD3BJMPi9TXQ3VikR2jHx5tX71alCsVppqOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zKJg3MVT; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zKJg3MVT"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ef7fbd99a6so275920a91.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Dec 2024 14:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733525537; x=1734130337; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VpkME8tKt7xRuIeyUR2rAOpo4R/J9PT1fVyVW9ktqRE=;
        b=zKJg3MVTFNPMSj96zpun1Dlpr+0os8zKtsPD3dXCO+EUMN0coUUz4b/JJ646+up4HY
         EcWCmhA0U9ENKZuVBFv+mSQLxNmXRqAFLZFqCZyV/HEdjMThbXlvo8rnRCX5V9D8VciD
         uGJLFmiyHLdBIAtmyPTSx3u+gSOn24uSlTsk/vwlKHgq3snkY4qM6bLHeTkynQXmJGRo
         +L8jkfjC0/FiltI4ZeUPVW3V/ctwrnHt4XNfUS6aTXOlJ5bMpMNfagCXfeDi44Yd4UBw
         gRI/Lf1GVfwnXLcfsosVm0t+I9i6r/xPx78jAhU9niUiitRdUep/pI8hUKrnFxpbTEdv
         FMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733525537; x=1734130337;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VpkME8tKt7xRuIeyUR2rAOpo4R/J9PT1fVyVW9ktqRE=;
        b=sZ3emTt5iQMaGFFQqFn7ur5hN0DmNRAmRojCH9bUggO8lfYW5tjmJKCBBbrTrafyLu
         BRiN1Yt+o+9JKtjDW/+4ChrlZOTPF+gnSEJS8T9w1cdKqDvcmz6CCoyl19WJd02rGGuj
         zUEgqoBgwHNHKzvqvbYWFOuXl+ab/vpMdYw/FmlT3owxsrCYg9ODpTeNq6BHGzbKQCir
         E9gpoSJgu+2erL2cOCXuUj/azg8Hqrh1T3kpLZz7ltc6RY3aMjA/eRvXAxG8LqFywuos
         V7wJ9tDqryErsXc6lXFd/p1qpBDHr31TJ35WLUURLgHLHzTdIBvbDZojt8A70Ec1PQHU
         5y1A==
X-Forwarded-Encrypted: i=1; AJvYcCVp8BBhxCFIUQxbKmMgCTz8cQiGcP/BUXBVDy5pU6SOQ984tRcd5OcbqbDhabT7zGzu5Ik4brdaiY4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4xvmn8yttFmXMFbPNgPZMx3OkihVkGKz0GRlj+CVAcwxtAimd
	Ei298Zdl7KDVHIq3SjY5wRM4ART675Gn/PqgqlS44q+CnRzm/yBOBT8cE1uXfH4j0Ezb56ZLy+j
	gLQ==
X-Google-Smtp-Source: AGHT+IHFlvnZGP/uT3lo2rN1Kek/VGxFz7KPL1PDra1Y7TXq5etwmH5ZVO3EXQpkF7vZG3RxgNCe7HXm2rM=
X-Received: from pjboi8.prod.google.com ([2002:a17:90b:3a08:b0:2ea:4a74:ac2])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1e43:b0:2ee:8008:b583
 with SMTP id 98e67ed59e1d1-2ef69fffa82mr7837910a91.16.1733525537081; Fri, 06
 Dec 2024 14:52:17 -0800 (PST)
Date: Fri,  6 Dec 2024 14:52:02 -0800
In-Reply-To: <20241206225204.4008261-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241206225204.4008261-1-surenb@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241206225204.4008261-6-surenb@google.com>
Subject: [PATCH v5 5/6] mm/slab: allow freeptr_offset to be used with ctor
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: willy@infradead.org, liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, 
	oliver.sang@intel.com, mgorman@techsingularity.net, david@redhat.com, 
	peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, 
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	minchan@google.com, jannh@google.com, shakeel.butt@linux.dev, 
	souravpanda@google.com, pasha.tatashin@soleen.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

There is no real reason to prevent freeptr_offset usage when a slab
cache has a ctor. The only real limitation is that any field unioned
with the free pointer and initialized by ctor will be overwritten since
free pointer is set after @ctor invocation. Document this limitation
and enable usage of freeptr_offset with ctor.

Suggested-by: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/slab.h | 5 +++--
 mm/slub.c            | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index 681b685b6c4e..6bad744bef5e 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -305,8 +305,9 @@ struct kmem_cache_args {
 	 * Using %0 as a value for @freeptr_offset is valid. If @freeptr_offset
 	 * is specified, %use_freeptr_offset must be set %true.
 	 *
-	 * Note that @ctor currently isn't supported with custom free pointers
-	 * as a @ctor requires an external free pointer.
+	 * Note that fields unioned with free pointer cannot be initialized by
+	 * @ctor since free pointer is set after @ctor invocation, so those
+	 * values will be overwritten.
 	 */
 	unsigned int freeptr_offset;
 	/**
diff --git a/mm/slub.c b/mm/slub.c
index 870a1d95521d..f62c829b7b6b 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -5462,7 +5462,7 @@ static int calculate_sizes(struct kmem_cache_args *args, struct kmem_cache *s)
 	s->inuse = size;
 
 	if (((flags & SLAB_TYPESAFE_BY_RCU) && !args->use_freeptr_offset) ||
-	    (flags & SLAB_POISON) || s->ctor ||
+	    (flags & SLAB_POISON) || (s->ctor && !args->use_freeptr_offset) ||
 	    ((flags & SLAB_RED_ZONE) &&
 	     (s->object_size < sizeof(void *) || slub_debug_orig_size(s)))) {
 		/*
-- 
2.47.0.338.g60cca15819-goog

