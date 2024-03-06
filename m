Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7558C13F00B
	for <linux-doc@vger.kernel.org>; Wed,  6 Mar 2024 18:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709749492; cv=none; b=cyPfCClv7dWuzNKuBmK0aYba9Nydwfkz8qzvG7zeMVnGoHJL7gOrpjD0Jgu+4WiBUdW1+fjcYF20EftwyyrkTIBGF599HZji1TLP5gMho9gtp70BNzqnnwWotciwgBgWTEMraQPxQjwjxRKJTFY7B/Ai5UTyng/TmNbJQ+/T7NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709749492; c=relaxed/simple;
	bh=WLWDcJtwdBHze169gQOcBi865vcRSQ+3nZi2PdvDZ/I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tcTdLzRiZaZTQIcwJaBOgMgnmg8YP4LKP2ZQP9Fdm3h7J8vJXwN8rW24moJb4XTL5G3WE979vYOPrEprBDGy1n+AQ3JGZFxnMqAnN6NhKxw0vK0SLbIx4DQeb9wQk7WD/GQ0+5ANP9Yv5l5VwkBdBcXdKMz+2PaApxAlZb6g79Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1KfMp0PK; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1KfMp0PK"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dcdc3db67f0so1395614276.1
        for <linux-doc@vger.kernel.org>; Wed, 06 Mar 2024 10:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709749489; x=1710354289; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IB/ApQiOXGBR0WmAItdSsQq8CBMweolDZikHX0/GsD8=;
        b=1KfMp0PK5sV5fxGjrToabD8KFuTy7c2KLrtthvHdsw9bYvxmbdBEfYqMsA3t6p3hug
         PKR133x6UYvB8tg532ueA425iSPUq/+f3uUqOUygBb9+LhcbRTR/CAm47ye5mUojs3fb
         rxhjipNeDQMMTkgV9OkKN7DELynUc/O0bidvJiQZ/WyCLK/bwL8flJFyI8YVN3vxOZ3w
         VKFHW/nBRyfxXn88trP3JLJuDICHOUW0j+wJ0mpYyYApSOaTTH0UQEwNLYLEfrkW4fjB
         6OiTIgXGG8YQBbO2huzbhp/QWb44h+0kX+skM6nn2lDkbCI7YUiZ6X33Vm+DZoWIJXQW
         ecCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709749489; x=1710354289;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IB/ApQiOXGBR0WmAItdSsQq8CBMweolDZikHX0/GsD8=;
        b=Cs32ojahWW5pR5XL4j7ZfIe7Xm63zZpFmOO/hk+KcYs8No6HfQDSTv8P8+AcLNHGdR
         fYl9Rmb8en82VC50VjMjCLocskumPXwS+EPErdjxmOdSmOY8aX3AUz2Ukj89Rj2bajNm
         lqQul66lEXmXLUTKPA7ZsF/4AhX3maVfOoJmIdq+Zb56R4Kjz55YbN5S5SsoXElsZK0n
         UHWzkcCyGQjjVpzwghxfpbHkTVxGB+QvJbcxmr7e3jbkhX/5OCHLbcPMVUuZdRmSdz9K
         LSWsYjO1ED8VtIaUAosx2Zejjb8MiS8QzhI7UQ13LCX5t8GwNZqXVo5QKGSQp6r/ka+C
         bHpA==
X-Forwarded-Encrypted: i=1; AJvYcCVcM34rDPxo3cfY2JwV5f3yEHc0jIrVFLnKwqkACI4lYDvkuFpPMnicTiuivZTk/7E/kM1DyjEigv3PrTv3CU07EUolPDQUm+kz
X-Gm-Message-State: AOJu0Ywl+OjsakP75uVRwLhiANlkxp0Y7sj+fSTcl7SGaslRhYIDLMS3
	o5D18Mu4PXkSyPMDPPz50hQdAQXyqikEWqFbPT15VCEORFXL+nB427Mq1p0uotFp3KcOyqhNoh6
	b7Q==
X-Google-Smtp-Source: AGHT+IFVqihldBNv4wgyZ0iAVVxZ+bY4OMcJ5N94UurEgGn8+DdCU01VG5gLaZEk+WmQHH2kGW3d+2j2Wcc=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:85f0:e3db:db05:85e2])
 (user=surenb job=sendgmr) by 2002:a05:6902:110c:b0:dc6:e884:2342 with SMTP id
 o12-20020a056902110c00b00dc6e8842342mr1897962ybu.5.1709749489247; Wed, 06 Mar
 2024 10:24:49 -0800 (PST)
Date: Wed,  6 Mar 2024 10:24:00 -0800
In-Reply-To: <20240306182440.2003814-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240306182440.2003814-1-surenb@google.com>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Message-ID: <20240306182440.2003814-3-surenb@google.com>
Subject: [PATCH v5 02/37] asm-generic/io.h: Kill vmalloc.h dependency
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
	nathan@kernel.org, dennis@kernel.org, jhubbard@nvidia.com, tj@kernel.org, 
	muchun.song@linux.dev, rppt@kernel.org, paulmck@kernel.org, 
	pasha.tatashin@soleen.com, yosryahmed@google.com, yuzhao@google.com, 
	dhowells@redhat.com, hughd@google.com, andreyknvl@gmail.com, 
	keescook@chromium.org, ndesaulniers@google.com, vvvvvv@google.com, 
	gregkh@linuxfoundation.org, ebiggers@google.com, ytcoode@gmail.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, bristot@redhat.com, vschneid@redhat.com, cl@linux.com, 
	penberg@kernel.org, iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, 
	glider@google.com, elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, aliceryhl@google.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	surenb@google.com, kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Kent Overstreet <kent.overstreet@linux.dev>

Needed to avoid a new circular dependency with the memory allocation
profiling series.

Naturally, a whole bunch of files needed to include vmalloc.h that were
previously getting it implicitly.

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/asm-generic/io.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
index bac63e874c7b..c27313414a82 100644
--- a/include/asm-generic/io.h
+++ b/include/asm-generic/io.h
@@ -991,7 +991,6 @@ static inline void iowrite64_rep(volatile void __iomem *addr,
 
 #ifdef __KERNEL__
 
-#include <linux/vmalloc.h>
 #define __io_virt(x) ((void __force *)(x))
 
 /*
-- 
2.44.0.278.ge034bb2e1d-goog

