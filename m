Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811349;
	b=WqAD4su9bxeXkh+4M8qZdd1hjgjBxGsKZegrPUVrGcs2g7uYgV8+s+PL2p2TYO4GuvVD
	 RJmgl+B9k7kZOh7FqI5ACnn6YOoiJTeWd4ShxvdoL6qTnHghT7sQuY9sCbR00c+llxjwI
	 X+zzOuFCQvezIZ5oXgPEoG6wqxiTvauD+zrqFShPUqX2noi4BNERmqeM0Jg6cUjHZ/AW8
	 P8OmOjfcLnnjHgsej8qExrnffd46OTABpFvIyRKhB3Gcc2hnT/eUh+8icxZseUjv78pie
	 sZrGCYC0yfDhG0scboDd+eQlXlZUqzU+plKoayBAiN5sh9Fw+Upo7iXRhdUmsAJb94w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zN0OMa6DsitFd0I63/8rm5wsSSArSxIu8WmzT7WDGsU=;
	b=fXVNF4KfQ8Y/kgCysXwdwL1LGofqEjruf7o1P5Ua8hUooDBJ5I8lKmAJ1KukIycVGcyd
	 vliaedZwqgyyVJJmadx28paVkCO+2V9Lm8ExIBywGr/+JXkjYiNByjRd6Bfzt4S4CVrt2
	 1EcxAZlGfMxsF6oeQSn7rSjxWA2cO/7QX+29kdcLDeqcVO0JermdGDbJznpTdghHzSRz6
	 RKea6GHpZw/5ALRK4n1thg58vZaV29VXiE1JNOQrXNmhZ5r2xUCxqFlCA/MNJeklNhCE6
	 c+qyVlEEDq4pdaL/LlJWgaAspYKzGNaBVOM7jLylKKL8WK9P+IH3qn/UFAVscYpM+rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GfhIGsI1;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A3D606A32E
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 16:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08A3D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GfhIGsI1
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a18fc7a38so2022757eec.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 08:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811348; x=1794416148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zN0OMa6DsitFd0I63/8rm5wsSSArSxIu8WmzT7WDGsU=;
        b=GfhIGsI1A79J7jj8MJAkxgJjudxW5sb6BpufeqVLWo4k5o9TBPAOkoCPeNcDs2elCb
         91bVJsIm83LcNhiO5mYbF39oD7VEjY9BiK+zk6u8gqDTaVdUFDv0uslgPSVOPnH1Kwk0
         hW0fpiJUPDSulT9sjmuAXODm7KaVFn2/qcZ5VCjidr1u9VELGD6xVErSX1p9jDOreK11
         c0wqkNvo4FFRBO0j78kT2Pted/n+mcjMpXtVQKHfEYds8sVK4NeBEAWete0R+fJr2Z8Q
         gVmU+4MLZBzoKT47koTB0I9kNjDp1iWCjikr7bMtNUnkLsmXm+5nFGPVV+slNHi8wJzC
         BIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811348; x=1794416148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zN0OMa6DsitFd0I63/8rm5wsSSArSxIu8WmzT7WDGsU=;
        b=0o4ZeiTsbZJPntCHeZZAVJ/Ir5gWnex6PyYF1GEtGEst1RU2pA1cmkbMXHW+h6OwH/
         +c+cfytRVCht6K4MRgbAtK6u6i/e7HXuuOephMP1TRhjEby4lYEFq+5o7qaCS/x2cAR/
         uN4dSPPM5gFrsekaMI3cxbFfGVLPAHH/ixDfEZFo3wsO5PhqR9qypRBF9qby73oQn4y8
         GqA/9gZUd9pSRQEOh5dch8YAaOwoxZERbdYyYUf84GBfb1vuFCcZXZXxxBkWFvVZHb/H
         Z7Gt9fJCiehZk2DUYjFUPPQMp16IDLDoeWKFJSUM4qz1a+1Cw0I2KExDXVbvaY+NDgos
         VW+A==
X-Forwarded-Encrypted: i=1; AKwUvBw0VYs9E+jVgIHy93Z+t2PDr0t2aa+gQ82GeRKETde8jAqPnwM6MDlU5bKsvyr0a0NOGO7b6a+IukM=@vger.kernel.org
X-Gm-Message-State: APuU4Z83XHOY7dTxd28C6bLuuMuEB9sV5mMoM4Hau4GHrh/zB3ittLxQ
	+oyn3hM78Cm9Ey9M55cGETKYeiCxGrrMiQ45WfdzF4UBna0TBISc1seg
X-Gm-Gg: AYBFou3fX98O86o+gA8tOwQHSAEQle3y51QzNcdF+4LblfneiUE1B2KcjROWTQhtGEg
	wGEKRPkbobDCn2RUtpmCNyZjchSS3U3m/JBzYBqsI0t8rhcC58l4GZE3179G62KPuw2AhmkgUzB
	6hQhNpPVhkTsNS06RDvVoBUXZxihxpdb1656JzUg9nQyOJM02R4U+FIWNgopMgGVV/prknzxbHU
	kF6thYla1sacd9UpGcUugHYjJ27lcuozZB5zzy0wn7H/ur6Su6hHVOBrwVaM7Ja3pqTD0pT6nv8
	WRSQpsL8bPVvAGBOpYPOqs3eC2enTO8w3agNTDMWC0TQoRfNYpCtEYOoXIs32f4Ss8hGK25RozW
	sUYsRYvRH6m3mz9FA4MIcPHrly0ckwS40EWFlSL75qNEEKJOKxyG4pogyJGKfzfV4tlOGs9ggt6
	JemOllx0readgiCs7roBSmWdey5G8RSywEVdPpoVaB11o8sq8qJZtvCoJAznJBCrNkYkGY1PTVI
	qHrvCWb4zkZ+h8DJHvT5F4gOUJg3rbD7W0bALefw7M+rFxfdBzeb8CTDtneU1CcTaV1xzuCqRCq
	av9mTyIHr3wg7h6AYuwZzrLZFZ7JBhMzTGdwggSgPUa/uoI++oi8kDQqBkiH
X-Received: by 2002:a05:693c:6092:b0:369:1084:8ee3 with SMTP id 5a478bee46e88-36a423e52c8mr29321886eec.23.1793811347548;
        Wed, 04 Nov 2026 08:55:47 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:55:47 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 03/28] hazptr: Add scoped_guard() support
Date: Thu,  5 Nov 2026 00:54:21 +0800
Message-ID: <20261104165504.2430480-4-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a scoped_guard() class for hazptr so that callers can pair
hazptr_acquire() with hazptr_release() on scope exit.

The guard holds a pointer to a caller-provided hazptr_ctx rather
than embedding it.  The ctx must remain at a stable address while
the hazard pointer is held because the slow path can chain its
backup slot into the overflow list by address.

Suggested-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 include/linux/hazptr.h | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/include/linux/hazptr.h b/include/linux/hazptr.h
index d37792af3493..3372b1cdbee6 100644
--- a/include/linux/hazptr.h
+++ b/include/linux/hazptr.h
@@ -341,6 +341,43 @@ void hazptr_release(struct hazptr_ctx *ctx, void *addr)
 		hazptr_unchain_backup_slot(ctx);
 }
 
+
+/**
+ * struct hazptr_guard - cleanup.h guard for a single hazard pointer
+ *
+ * @ctx: Pointer to the caller-provided hazard-pointer context.
+ * @addr: The address returned by the matching hazptr_acquire().
+ */
+struct hazptr_guard {
+	struct hazptr_ctx *ctx;
+	void *addr;
+};
+
+/**
+ * hazptr_guard_acquire - Acquire a hazard pointer for scoped_guard() use
+ *
+ * @ctx: The caller-provided hazard-pointer context.
+ * @addr_p: Pointer to the pointer that is to be hazard-pointer protected.
+ *
+ * Acquire a hazard pointer using @ctx and return a guard that
+ * cleanup.h releases via hazptr_release() on scope exit.
+ */
+static inline struct hazptr_guard
+hazptr_guard_acquire(struct hazptr_ctx *ctx, void * const *addr_p)
+{
+	struct hazptr_guard g;
+
+	g.ctx = ctx;
+	g.addr = hazptr_acquire(ctx, addr_p);
+	return g;
+}
+
+DEFINE_CLASS(hazptr, struct hazptr_guard,
+	     hazptr_release(_T.ctx, _T.addr),
+	     hazptr_guard_acquire(ctx, addr_p),
+	     struct hazptr_ctx *ctx, void * const *addr_p)
+DEFINE_CLASS_IS_UNCONDITIONAL(hazptr)
+
 void hazptr_init(void);
 
 #endif /* _LINUX_HAZPTR_H */
-- 
2.43.0

