Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A1E1898EA
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 02:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736389852; cv=none; b=JKOs1nDpOtEgYarwG1+XY4QnQ4YWl1jSdBySMgqPXr7P1ZIZrulB0OGfmjkL4KWJHIj4B9CDr7/mxHdUG456HhowHlbzX5niMZq6m49x3MQOzTVnIxbemUS/tsdxbA2AX4Q7IjBd1xJi/esqBE51NvuCOSKEPcxb93ViPzmvNxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736389852; c=relaxed/simple;
	bh=BuXyVw4ezCQ1JAf9BAOIg/Ukfu4Sp8IUeASwcXyb1yU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BXQze6gw+f47QexB4BurEzb+bzXyeAWlcJPzgcNe+R6zYgLITgpDYJxhytyL7e9fcSUpbQaIwRSVQS+i1oZ645pbWAkV8kcVJ+0F6GW5VgztWfaAz14qUjhh8X+YFUqf4LBOjQ1l3LKmuB0QpnBySyJA1/l8mMZqh54hizl/zZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I4xgzVAV; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I4xgzVAV"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21a7cbe3b56so6118225ad.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 18:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736389850; x=1736994650; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YDQWvgnM3ecpsVy1JQGtTknKWtLSYOOH2mwLaEelsWk=;
        b=I4xgzVAVKQGRc1ibuWjkN6nmUSDcKMo0dUxJ8V9d4uw5Xpi047A7kTNdjGC6NfM5+R
         U1dFJ93xuIx0eUwwAYL8S29NLTP4JIUgZs3cnE3/GEwjexNIaElNa2Vw0LAHDL2xKZkl
         Aywaz65GeV6bcKlFUkFsxYwAPnt1uPIyYbznfzX9AxJSc+wqVMVF9k7I7THoP6bRHzhj
         V+a/LXXQDl/M13Nphn/vQUrxtgrUiQXI2qRVRthUqKr2wsME5RnGKIyrnOMYIIN8e1Fi
         UakJq9Zu31qTkJdZ3rS2ok6ZWSyTy6jpEmqvB2j0hvhFzoxqOShNBbOhQ3nelm2pEzf3
         ++Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736389850; x=1736994650;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YDQWvgnM3ecpsVy1JQGtTknKWtLSYOOH2mwLaEelsWk=;
        b=ofkv4tEg7Gpoz4fQI+da+pi01+Fm4XYqc8j9TTGRafoo7d2MgXlPOSg/laBmNS9gwN
         cbNdXxbXtpWMFrbIvBef0xOcCUrwK7750d/HG1aIii1UE/7+y+TYvWpfi8wwdHRKCueT
         kpIE43FvqElmEI/r5RqvcGgBPNvmTBLl5T8nuZDYs1V6hVfWjrSmokj07e38fFgLi4TE
         O+FSOLlRrJ09Q2SPBuZ7TSlwf4U8GSY+wq/UaLzds6PPRfy0gpcFMGAe5101DfaRNJ25
         D4MRy4qbFGAPIEHunyqgvnLpN4EI/6AuuIQ5mf9Lwi/g7WQKGNcE/5Hbm1+pXDEK5Bpd
         5dzg==
X-Forwarded-Encrypted: i=1; AJvYcCXyfqqLy0dx2IMA2vlwtwuK2HDQwd0nFB6vgKtSlIjuwUuCRS8hH5QfMT7IoP8f0kDPkMJzTn+Fmgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyThStT63C6FdOVLAt0EayIUMUlCVd3PidXD9atboSK+0OIQanG
	uz6vpoGfJcV6k5XEB6nAqcmxQxV3CdFf4FUc7wJJC0FPw1hn6HI7lbNPGWHuD31PiugC/8VwVov
	P6Q==
X-Google-Smtp-Source: AGHT+IGU1GveoKiXtMIwX3Dsvx/aQojyG0Nha/qg6tCj4vgO60tNC7tTkojOSt/gTC0vj2nSfdWqvyuR7Jc=
X-Received: from pfbea18.prod.google.com ([2002:a05:6a00:4c12:b0:725:dec7:dd47])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:93a1:b0:1e1:9f24:2e4c
 with SMTP id adf61e73a8af0-1e88cfa6b60mr8471434637.16.1736389850547; Wed, 08
 Jan 2025 18:30:50 -0800 (PST)
Date: Wed,  8 Jan 2025 18:30:19 -0800
In-Reply-To: <20250109023025.2242447-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109023025.2242447-11-surenb@google.com>
Subject: [PATCH v8 10/16] refcount: introduce __refcount_{add|inc}_not_zero_limited
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
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

Introduce functions to increase refcount but with a top limit above which
they will fail to increase (the limit is inclusive). Setting the limit to
INT_MAX indicates no limit.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/refcount.h | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/include/linux/refcount.h b/include/linux/refcount.h
index 35f039ecb272..4934247848cf 100644
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
+		if (i > limit - old) {
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
+	return __refcount_add_not_zero_limited(i, r, oldp, INT_MAX);
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

