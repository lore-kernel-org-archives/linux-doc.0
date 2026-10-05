Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836CA519916
	for <linux-doc@vger.kernel.org>; Mon,  5 Oct 2026 17:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220692; cv=none; b=EZwmCheKqOtMFM8mpMcIQI578pk6ZaHjuA1PeYwCKViFgVHpWM9Ofpp4pRy7A1wa5SUo/eX30NteQ8HYxXKqFBDE+VV9N4v9Mglu3safZaTAxU6I8yYGQc7farSG/tjqrpJO8vQDhySEAAIpsFi97whaupzx5dvC8x/yIKcl67c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220692; c=relaxed/simple;
	bh=bKK6Ka9Gp+vtwgFDDZYR/jwqeinj7CuEjE6r7sAsMFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tCQdA3i9dpNNb6Kg2YUBgjZyUwIiZW3ZZctRY+MiT3xF6PxSxnSDtC14ka9LJoGFe42Yq6jV1GL2dK1uvqxzfoM13OeuZpYFOmOYAPpoY6qDcxfScqY3+X+zDplO0Nx9CMGM+MM8gihrk258ygU83IJVsHkYTlSaJhkqVaBTXxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzdOK2rw; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzdOK2rw"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccc02279so1228806a91.1
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2026 10:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220690; x=1791825490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJpC50bJQ46wh7HHA0CogRCPQLVQ5kdzi3EXJci6E9Q=;
        b=CzdOK2rw2houwTVvYfMKl3+SKEK/ihH6hDvN1POzG0hHGMmj1V7diGb9/0cCdjin5z
         wQaSvpY27r/WP24Dt9YKJmZYyPaX3kT2PV4xFmcvA9I+o/ASy7ZVytXpErgnJa/pqL4h
         PiHA33DlgPfJ1ug4qhmQ6EftR1lwvbcWC472W0St/HXatjK0iH+ZvJuTQ9kPSpAloE63
         1i2LkGmjv5ZOslybuTrgx6fp9wUhYeGWNQchLtLaiMuNwed7IqSLOVcZGOujP40J3cbC
         Ry/jJZ/3HpRDZU9wtgdnR1b+18cprBnIbJ/BR2WuPbL3mk/IRJace7igt0cDQoZ8eecv
         XCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220690; x=1791825490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cJpC50bJQ46wh7HHA0CogRCPQLVQ5kdzi3EXJci6E9Q=;
        b=zAa0ee1pNPLTQ3dc4lXAngt0e9lECooql6tqfNdQ+yhA7KF00Js1hkUZuykBxOUCjC
         3Ad6YGoMZAHdcqFFB/lMxSrFFk72gyXo5VR/f+mv7zmATMakOGsImE1Vz1P4CMufIw0n
         +r5YPN/htmlGhkfRtITzpUPzgbEI7s5h8EDtmHDp7rYlSmFIeiJxJDNJCVnHrKSmS3cn
         OEImKFh/D0owY0Q3JBm/M4DAqrrrmhcscP1o5xtwx+c914aDhVJKLOzKhDC6S6D4ppJt
         RdiiPI8kQpwRkrmh1pHM0yUlx8+vT/LECAlQ8HXwNV3R8OxnRXRyNKa5zXAynl5bT2Ao
         73Xg==
X-Forwarded-Encrypted: i=1; AKwUvBy4x46XSmwGYOrOPg5Qv4ePhBvr4lE47O3qhOuRuBd8MMiI6K13McLoDRo54oGAdApREMsq9TvTZGM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL22h8+Yuc3OxqymRdfuBYkIBVr11qkn/23V16FLTA3OS3dcYyo
	UUyTTBgEE2aiHszDlqylrYkyAQS9BhLvhh7RzJgw1bFrSZVeoU/i6n5H
X-Gm-Gg: AYBFou28e8bjvm8ZqMx583t1kMr3sshiwdkAgbRj7/dwGDSXS3NfgZKBpFIO6qq2uzC
	N0RxxuxV2yi6Kmj8NRTjDOIjFPVtUgTq8ONvaCudt7FCGbplY9OT7U0Yd44S6+1OSDZcbWemxBm
	DQ6zjZ4LBb0h6j66E45KeKrt8Oe+9EUzS3krGgLDzSaD7SCV8Xp9ieoa1s71QjCSoD3mIZBM37h
	+OdAgD6GhdC9vYBWT1CBH28Hio+v762DThYzHe+HsTpJeD/47umLX27rmZiOb88jgqyS0nhEoOf
	ka+DI53XCgOfX8wELFuXxI+nhf3xZytnxbN70XnJCJuQedrwUvkExFG/oBb5DZ+KlzZzqEy4eZ7
	G4SUdnnHLhgoAc5HeJXw8TmeVWguRwvhHm+9T0BjqfxNxjVCI3HtK2dUMg53tzUlJT/IJljYzwE
	qvUx724ZRaX8s5QOnpyZwsjFp4gJMELkUFblpBmgZQ4okvYq2p9qvGYFNnZih/zLRVDGp2fFuGH
	qUJc4oAr3k5lAs+i+Rb2Bx5RejhuA==
X-Received: by 2002:a17:90b:3846:b0:3a0:bbd8:5ba7 with SMTP id 98e67ed59e1d1-3a6ce996924mr10923539a91.62.1791220689796;
        Mon, 05 Oct 2026 10:18:09 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:18:09 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net,
	lianux.mm@gmail.com
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
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
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH RFC v3 10/15] hazptr: fix kernel-doc of hazptr_release()
Date: Tue,  6 Oct 2026 01:15:24 +0800
Message-ID: <20261005171529.1378809-11-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005171529.1378809-1-kunwu.chan@gmail.com>
References: <20261005171529.1378809-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The second parameter of hazptr_release() is named @addr, not
@addr_p.  It is the address passed to the matching
hazptr_acquire().

Fix the kernel-doc header to match the API.

Fixes: 17969a0e7f7e ("hazptr: Upgrade kernel-doc headers")
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 include/linux/hazptr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hazptr.h b/include/linux/hazptr.h
index 4ee02d23abc9..07f5d9ef5a6d 100644
--- a/include/linux/hazptr.h
+++ b/include/linux/hazptr.h
@@ -293,7 +293,7 @@ static inline void hazptr_release_debug(struct hazptr_ctx *ctx, void *addr) { }
  * hazptr_release - Release the specified hazard pointer
  *
  * @ctx: The hazard-pointer context that was passed to hazptr_acquire().
- * @addr_p: The pointer that is to be hazard-pointer unprotected.
+ * @addr: The address passed to the matching hazptr_acquire().
  *
  * Release the protected hazard pointer recorded in @ctx.
  *
-- 
2.43.0

