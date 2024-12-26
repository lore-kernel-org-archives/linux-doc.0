Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC4C1459F6
	for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 17:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735232858; cv=none; b=Oo4IdK9oF2F+7ZhjvcB5AfQ8dgWskvPg0NZwLZgG+wrlnnG5wl1AOrOAafbHJnm3UKJVUWcVvzunyWvZm0rDuJH2UOF71WRalgaGA64TR0NRiaUlSXKi+yrA0sPZJ9jopQgr0vRGHk21yqeMz6s/rcojO3itU2nqJpTKoCAD364=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735232858; c=relaxed/simple;
	bh=slEyDSyOmggj5mJJINjjr/YocKsmeusN6XkbngdxcOw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oxGqSeEzYmFTTqsBt4fY132FC+OvklBPpEJdIAxfdlgA4BwLUVMiQb/l+/VMA2VeRQjL8iNPViGeV0I3ogFwe/WlUiFnRjBIY7DdZ3Qe++kal809lLdbGEkEMxi1bwATDYeek/BcysDcSISyXUgyHVmWk6rj46i4NqphH0YZYUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i+1YKpTg; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i+1YKpTg"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ef9204f898so8145850a91.2
        for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 09:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735232856; x=1735837656; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PJyEpzu4DU8rJRmq3ow3hqlNy2LMWwwp3HWnjTLdNPo=;
        b=i+1YKpTg2Mx2oWk2NdqVxtYPcRiHcZ2KZX91e9faaDhq/o+H8+jgSG6lSgC8AtMeMk
         qEsVGnyhSEjtj6ufIaBwldJZ+PznCXN3IPpdU+EMQveD1k3bTslQxThhyeJqRJj/Y+eX
         xP3soaIvvIv0bOJ/e3p5DZV17OjfGd5WTdtW9iWXUtsLEl7oQ7O1hCnMj63NeuTDjywM
         qVEs/d5djwxnG4kBCCA3gfl4aX0GbBx8L+FScoyO75MYBrDawSJASZ9/A+KLyYUnBxYV
         JPaau9aEUKyk8UKA5IBTCF8oW9Pzzr56y4s5lbW3hq9F1umbngK0/dnE43Re37z5xx0Q
         Ixjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735232856; x=1735837656;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PJyEpzu4DU8rJRmq3ow3hqlNy2LMWwwp3HWnjTLdNPo=;
        b=XmHgdPvRdjVPOHbU/B/Tw7i23adLhr+lg+2ape1CHWp2sId2yXMbeDaop3/wGRQtLZ
         0uk/7LTKtAj2C5q0I1t3dcROJ0jTpRLkFKJdlWYJnk9Pmssl3Z3omP97CF8x1XUNVJ43
         BNRAQ1CdUjUNDLXifckBrVK+BTAKTcDCGcuWJnHbxvfAmtDER15RBUYWVar1HyUtZ+5g
         qnSEnDpvvPlRA3V8qdJhFdhAPme/MjHhM2d8BNt2jpTTTPEeakee2B1gJVlkHSWB8Mg7
         mO9kCTUw2dhp/Aq0+3k00fJVn5LgDPIFbW7UG9N7fRLpYsXhIbj8vwR4bsrftlIeMoTd
         KbGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWw+4mlmPNT7wGxnxt/zI4vT4BkWrin3YLpMvBBlWEVWw7OWJd3Cd3zYbM9BFxZCz0bO5d97FwzuxA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYTMVnLpRPIchgpUYLGCHkOVhjpe9ZEyhZJcv+9hQBI/qqGjIB
	z0/cgW9mlZgB994PFEqhurVYGe1gmIGCQELDImITjkab5m2NvEjw4In/+XE1QMItkQAL830iJIc
	uTw==
X-Google-Smtp-Source: AGHT+IEl4ZXzZa5pPyzTXDxPRSH8PuS/I6bpKT2fhAEsb0xYuFK9NMlUOzOSp0EdHvBpo/b42AdwcHR6bBY=
X-Received: from pjtu11.prod.google.com ([2002:a17:90a:c88b:b0:2f2:e933:8ba6])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:528a:b0:2ee:8619:210b
 with SMTP id 98e67ed59e1d1-2f452ec3589mr35645319a91.29.1735232856007; Thu, 26
 Dec 2024 09:07:36 -0800 (PST)
Date: Thu, 26 Dec 2024 09:07:03 -0800
In-Reply-To: <20241226170710.1159679-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226170710.1159679-12-surenb@google.com>
Subject: [PATCH v7 11/17] refcount: introduce __refcount_{add|inc}_not_zero_limited
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	surenb@google.com
Content-Type: text/plain; charset="UTF-8"

Introduce functions to increase refcount but with a top limit above
which they will fail to increase. Setting the limit to 0 indicates
no limit.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/refcount.h | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/include/linux/refcount.h b/include/linux/refcount.h
index 35f039ecb272..e51a49179307 100644
--- a/include/linux/refcount.h
+++ b/include/linux/refcount.h
@@ -137,13 +137,19 @@ static inline unsigned int refcount_read(const refcount_t *r)
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
+		if (limit && old + i > limit) {
+			if (oldp)
+				*oldp = old;
+			return false;
+		}
 	} while (!atomic_try_cmpxchg_relaxed(&r->refs, &old, old + i));
 
 	if (oldp)
@@ -155,6 +161,12 @@ bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
 	return old;
 }
 
+static inline __must_check __signed_wrap
+bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
+{
+	return __refcount_add_not_zero_limited(i, r, oldp, 0);
+}
+
 /**
  * refcount_add_not_zero - add a value to a refcount unless it is 0
  * @i: the value to add to the refcount
@@ -213,6 +225,12 @@ static inline void refcount_add(int i, refcount_t *r)
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

