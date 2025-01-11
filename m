Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111E618FDB2
	for <linux-doc@vger.kernel.org>; Sat, 11 Jan 2025 04:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736569591; cv=none; b=hOcdlKSW38r1wa6TlefwAbNMzgruojnl9LS87OMLkV/4ZxG+iIKoU9b1JvcVIpSkjt+yuAE+gZxYH5rZMg9p0vo9pZzWa+EXjvxddfkh57en7PyxMH1pbrB+VMKIrsKfZdlJk6uMjLmlBfXKRLxhu9Cvu1d+unO5ejNKommBdSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736569591; c=relaxed/simple;
	bh=ClFnDYClt/1mzZUhQ7YHEE3ht4KWxc0BIqAtptsG1rc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lXjnri18h2LsGJ7I4aOHk5Q2TOEc35ikX3JQz62Mp91fCEbM4UmfBNdUC754pV16uRuY3gb70mLxr8ZafjBAhM+y1BaVBD8SbrWmtChA/YezQ5pnNWD97okCRBKRN/g9/zWBQImGGGaWSNbTL/waWJugqzKQ8I/v+3+eqMPKb8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AdvXjKeM; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AdvXjKeM"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2efa0eb9cfeso4860369a91.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 20:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736569589; x=1737174389; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VwcbS0dFv6CgCNycrk/1CQg6vwwJAzf/LstwUATtKHM=;
        b=AdvXjKeMe7qWZornGiSIIUqZbtl63WNHwgGzV0QV2XAEKAdfMLJrb1BxW5Q6O4do5V
         1+ZqlHWMy7WbpxQZ70vyS1sPQlY9d2RIiOwVeg3xA9sVOX8kyRxTTi0xFwg4uZbaMMVu
         rKiSNRR3KPSZ51DGozyEY+MZ+9KqKjpvtfxk4VTY9w+76NVGFWmz78DPCbBSbDwfKebb
         kqQDYNtwrCIPuUL3vTx4saUwNrQokgYA+yEHYh24gPmWBcBkKMLwhHqpF+ZfP6zvEdTZ
         Uyng78A+UEBzk71ZOQ3FurUQQ/hln8WvY/K44G09uMmpcmo1A4H1CjjcQDe0HEt1uvnW
         vqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736569589; x=1737174389;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VwcbS0dFv6CgCNycrk/1CQg6vwwJAzf/LstwUATtKHM=;
        b=pgIHHxSR2EgKkJJfb6xazqKjVP6vSL0Ikm0emqNbx9Bi4MSFs6IHgBWISsBwzHt1Lu
         gSaNsLq7vjzwAwaepT6nspdgyci+SqEM20vDigdejWzK2sEaI8wXKZYq8WUk4Rq7Ow/I
         plET6pv7TFrEQNNBrQk4zgtkiftwj5zVR84LYNPlhaOkX+KEMSKRBut+JZlWEAXB4NIE
         J3WeFxFpcNN6CBOEhwm3dY6OoxulIpSVn8ggnfuKRO6ggh4VsHzBqzylWEIjLL0TiymK
         ahYURzsQgXL8D+miPvi4tzE63SfeoKY9zOkhHdZIBEqRktA4B5CzoXq1AxblT+xnLIvH
         fhOA==
X-Forwarded-Encrypted: i=1; AJvYcCV1oiUNE5ZaNM712YXD3p7fW/gZIj90B+PMoxibxyIz4F/nIHl1hWsmWfQtEr3RmpY29R3QvUrhe/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNTal/NBACtrcpXWQWQvBp+M5pcLPRdosdVWK+OzdlU/J3jzFB
	BJh3Vjxm+8kUGZHcZs67mV1rTOSwghDwijNo7rAJTdId9OV46waT1OzsLZVitN3uyAd6ySIOxiu
	KMQ==
X-Google-Smtp-Source: AGHT+IHRdmdmZQsqrHxmHBpzkjciwsLRGCl3+kAbA70quP18hv457pqxyHwgZacevWuPeHpfl252t4i39B0=
X-Received: from pjuj6.prod.google.com ([2002:a17:90a:d006:b0:2ea:4139:e72d])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3b4f:b0:2f2:a974:fc11
 with SMTP id 98e67ed59e1d1-2f554603e39mr14016432a91.17.1736569589540; Fri, 10
 Jan 2025 20:26:29 -0800 (PST)
Date: Fri, 10 Jan 2025 20:25:57 -0800
In-Reply-To: <20250111042604.3230628-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111042604.3230628-11-surenb@google.com>
Subject: [PATCH v9 10/17] refcount: introduce __refcount_{add|inc}_not_zero_limited
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

Introduce functions to increase refcount but with a top limit above which
they will fail to increase (the limit is inclusive). Setting the limit to
INT_MAX indicates no limit.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/refcount.h | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/include/linux/refcount.h b/include/linux/refcount.h
index 35f039ecb272..5072ba99f05e 100644
--- a/include/linux/refcount.h
+++ b/include/linux/refcount.h
@@ -137,13 +137,23 @@ static inline unsigned int refcount_read(const refcount_t *r)
 }
 
 static inline __must_check __signed_wrap
-bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
+bool __refcount_add_not_zero_limited(int i, refcount_t *r, int *oldp,
+				     int limit)
 {
 	int old = refcount_read(r);
 
 	do {
 		if (!old)
 			break;
+
+		if (statically_true(limit == INT_MAX))
+			continue;
+
+		if (i > limit - old) {
+			if (oldp)
+				*oldp = old;
+			return false;
+		}
 	} while (!atomic_try_cmpxchg_relaxed(&r->refs, &old, old + i));
 
 	if (oldp)
@@ -155,6 +165,12 @@ bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
 	return old;
 }
 
+static inline __must_check __signed_wrap
+bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
+{
+	return __refcount_add_not_zero_limited(i, r, oldp, INT_MAX);
+}
+
 /**
  * refcount_add_not_zero - add a value to a refcount unless it is 0
  * @i: the value to add to the refcount
@@ -213,6 +229,12 @@ static inline void refcount_add(int i, refcount_t *r)
 	__refcount_add(i, r, NULL);
 }
 
+static inline __must_check bool __refcount_inc_not_zero_limited(refcount_t *r,
+								int *oldp, int limit)
+{
+	return __refcount_add_not_zero_limited(1, r, oldp, limit);
+}
+
 static inline __must_check bool __refcount_inc_not_zero(refcount_t *r, int *oldp)
 {
 	return __refcount_add_not_zero(1, r, oldp);
-- 
2.47.1.613.gc27f4b7a9f-goog

