Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB596188596
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 03:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789098067; cv=none; b=bM4sP8qJ1dgucZRBkbnJKI2Jtak/mM7QvA8vThLBfZ+6nqUAO3Tv2rpKS22dDIDcuomTEY1Hzt3N3bIXJ0ckLTn/9KcIed4nRGL0z+3eCM5H/G2E6CDpNhM5INd3PJW4wDBoTnITosAatHHalBAM4+QvWREL+W/zw93DAAJSBMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789098067; c=relaxed/simple;
	bh=PCjRlXLyzUnojV5TSsYLQGF4tgeA4WOLxoJttOsyuAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZAFzGoanzGY5dc2qFdrkj985pW5pt8iaOhEv1CDNe8TEtVpw7BIlVXdv7tTfp1ARhbCfwT3gZ8+waB60xXfgYXg7+L9mu76n98AYLBiRZxJ0VwlVcs9zf1SJ+HfByr6HHiDraf4geBqIXbq4/ebYJycu4DnjYhnVyRfUch7dBk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pSdkzsUZ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pSdkzsUZ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2db18e5cb56so5060445ad.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 20:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789098065; x=1789702865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nsz3/yKBStl6PSJ3ECifchvs/rkKffL6cy7VoJvWr6U=;
        b=pSdkzsUZhtD+MwRkuLq+pEBv80FYz/OVrqx8k+O5K1iFlfR5hA3aSL6h8NFe27SnBu
         rFra7aRIA4y/1QMYHzXp4ZgNH/ctBzAtUjnW5e3xIOFjZxth5xc51Llijo4MU1WE+IVj
         EShCYsD7ba1NHsKc90p+PMQHZByOn8sOiEMt3cwnu7hN5EFxM3NMKbIDdaVxqgjh5k26
         iijyyHQdboFJbZozu2qByti+XWZym5yNOjQh+WMTk5MK4SBY+aM6O/XLTDtYErno2Alt
         WWIXrUrfGP1B2O5Yq9kcBLE7nG1DecnGBRXcJuXNQgucZ453Jb78ouTHssv8RMTFrbA/
         RD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789098065; x=1789702865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nsz3/yKBStl6PSJ3ECifchvs/rkKffL6cy7VoJvWr6U=;
        b=OrkegTvAEJIwI/GBr+fomCnBlD6o82C42O3R8ujWPMxIyaE+nIQMVAwieWd3fQ+lBI
         MeHg7BctrYTIOJYwg8bIhx1xzJy7kDeYDsLhs5DlEDFIZaTkq4AqM3MAMgRFML1xD/rW
         lY/batUPkOabbfuspJABus4cXPfC7WvZq7lU1IUGjsW2oMzbt75pXKjaOor33tlZdviI
         EHM2+KG+m0mOYs3s26nN+gvXIN9LEuzEOOJ/RxZJJdOU0dIcHtJ5q+aDnguh/z7X6WE4
         FP/Mu4IUOQQMqAGuwLbnP0YUNUv+Euv5rcVAeOnBRw5o32tApXH31Cg4fso5BmjgnVwl
         aqxw==
X-Forwarded-Encrypted: i=1; AKwUvBxrEAYH0uyLjgHkaA8pkfkdisMClqVvH9fJgaq5EQPB9C+ImPU7/usLiq3pWlEPjP0jjAN5/LO/xYE=@vger.kernel.org
X-Gm-Message-State: AFuF++lzO4fDQDvqOV0NttV6EvOmz6MtXlqPoKuB3DiSC18TGJONDFQK
	p/+/dnO9E1iC7uv9CaKHgogQlEKReYjmD8WZ9VsA/d3BuxPLu1Fl3UqY
X-Gm-Gg: AYBFou3D/+aQ7kwiKdXl3JJhXZ+dQqmpWu4sdwuwu3OfWFv/Q4AFbgYtuUqdRIABnKt
	8G88H87Bf69FDhYm4iD42KF/Kiizu1ZZJmyiIZUT3hrzVrJ+qxz0E4Mqa+cGpmX+z5q8oMu5kpH
	WNCrXFrWJkR2RsA/uCQs8Pk12JG68h0i2+mwzHjRsKuIBoz1T1Q/HmT0Ir9dlnTpwSoAFQ+6drs
	HA94/JyKUe+E44syem2i8mOoolemSapxajzlOC0LX+gNGU/NDnOPbdcaV/U+u6WwSBxCSGcoQIz
	DDf5Qov+fun0Qb+iEB6nuTOXrdFTK6czOEs7LY2N/V3zgCGOuhxqYMelPNIQHAue30zfJV8qNX+
	45WHupMikfeuDHWLqeMxdE3qGTanMhrcSaaQp3ajtb0eRlVBYe4sv9CIVjUFsbGX5cCa0Ufk9Me
	pUOR0e+r+yJYL6U+E6hfalBkzadAvQ36QwUUOIDOHF26gYxlvz352x6yKsMdA31CD2szK5Uhtyq
	2j5c9w35evhwjhZIlkDF6SyVwqxhJCixrjvI5Vuu372lJAzGSi2FRL4z2oK0t2HoYWNZta1i/WX
	QoHMkOYIgoDc6ii0MlE9Nk5esIkMEMcjqT8MORR33qiDGHn0GRw+ufHIwkDawFGnDhsGQiBnhA=
	=
X-Received: by 2002:a17:90a:dfc6:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-39d9bbdedc2mr3577728a91.3.1789098065012;
        Thu, 10 Sep 2026 20:41:05 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9afa367bsm558148a91.0.2026.09.10.20.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 20:41:04 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: paulmck@kernel.org,
	urezki@gmail.com,
	harry@kernel.org
Cc: frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	josh@joshtriplett.org,
	boqun@kernel.org,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	surenb@google.com,
	vbabka@kernel.org,
	rcu@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/1] rcu: make userspace barrier hook drain kvfree_rcu work
Date: Fri, 11 Sep 2026 11:40:58 +0800
Message-ID: <20260911034059.3569914-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6092a9d0-0125-4da4-ac48-85ccaeb83beb@paulmck-laptop>
References: <6092a9d0-0125-4da4-ac48-85ccaeb83beb@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Extend rcutree.do_rcu_barrier to drain kfree_rcu() batches and per-CPU
SLUB sheaves as well as ordinary callbacks. This strengthens the documented
test interface, implementing the follow-up proposed when
kvfree_rcu_barrier() was added in 2024:

  https://lore.kernel.org/all/20240820155935.1167988-1-urezki@gmail.com/

While testing bcachefs performance changes, ktest's /proc/allocinfo check
falsely reported leaks despite repeated hook writes and a 20-second wait.
An earlier prototype let the same unmodified workload pass: eight
checkpoints in one VM, after 50 through 400 option changes, found zero
retained reconcile_scan objects. The original kernel's retained count
eventually fell as a sheaf filled; no unbounded growth or OOM was observed.

Following Paul's v2 review, retain the entry sequence snapshot and check
it after the unconditional kvfree_rcu() drain. If complete, retain smp_mb()
and skip the final ordinary barrier; otherwise, call rcu_barrier(). An
unrelated ordinary barrier cannot justify skipping the deferred-free
drain. The start-rate throttle remains unconditional. The documentation
now scopes completion to work queued before the request, without
preventing new concurrent work.

This can avoid an extra barrier operation: v2's trailing rcu_barrier()
takes a fresh snapshot and need not reuse the internal barrier. No
elapsed-time improvement has been measured.

Exact-v3 builds and interface smoke checks passed in four fresh two-vCPU
TREE_RCU VMs: two with kvfree batching and two with SLUB_TINY (unbatched).
Each completed three true requests, remained idle after false, and
rejected invalid input with EINVAL. Full kernel logs showed no WARN,
oops, panic or RCU-stall diagnostics. The v1/v2 private-cache completion
and ordinary-callback regression tests have not been rerun on v3. These
smoke tests neither prove concurrency/weak-memory correctness nor force
the guarded fallback.

v2:
https://lore.kernel.org/all/20260910170040.344864-1-matthias.goergens@gmail.com/

Matthias Goergens (1):
  rcu: make userspace barrier hook drain kvfree_rcu work

 .../admin-guide/kernel-parameters.txt         |  9 ++++--
 kernel/rcu/tree.c                             | 30 ++++++++++++-------
 2 files changed, 26 insertions(+), 13 deletions(-)

-- 
2.55.0
