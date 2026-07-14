Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5175435F615
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 22:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784067685; cv=none; b=pKxEOlarbkwM5R/oTO3eA/UcuM58/HnyiA5lyxogt6pHGOB2h2bEC9K3QDe6q+YJHtNxtCBELQ2m1HcgpHqwduOuJZBe7VguNv/wiAN8GtvFikh79APGYjVMYF5u0GMDSKuenzzO1Dz8oD3gexvUkr8KOz2p50GGY8fYBwUG9FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784067685; c=relaxed/simple;
	bh=baqF8AmnWKjBCJqEowFp8BuHg9T8XAks+xfH5wKSIy8=;
	h=Subject:From:To:Cc:Date:Message-ID:MIME-Version:Content-Type; b=dR/7EVz2zKNI0WJeURyFpkdT/Ex7vJSpOvag/t1qiGid2jYhA1pgrBMPYFDiAYXaua2SHSdBplb5vnBFPrOL8SBq/N8vQkmten35Zvi9OIS/Stxn6RWonxcLQwu+XEUhfkUwREnnDSpxUD4GNhFpkpceWxzR0/34AUnvhhUBPHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pcNipKXv; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pcNipKXv"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c85b73ffb52so2662135a12.3
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 15:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784067684; x=1784672484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:cc:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vv0t/+7auxcbtGWpvakmJ0ritrqSQFOQmC0jKQCZU2I=;
        b=pcNipKXvX6w9m52Uie0ZbWhEqv7c2yWACBgxCRWNfzqvz9nfaVeNbcMDzMXhFb/mo8
         viXdEgN7YCmj4B+PlsqAPXPgL6c9hwqu19stFCd2QQX2oBCBCv1wVje+kLzzmT7QTHqS
         slNnVlFlUvvZdM4G9AaTgreOJTZJqI9pBz38oi7E5y/OC20YA30IcmDfnovmrqyW6dzf
         bdBvcO0WbU5k7YADa3EMRNUS9YHCXLSea6oMzVM7GSwKzURIX2P5EAQ5om9Gb1hcyYVU
         b+rnqY9B9iFiUeTwLiAtdbSva3mQScSJME3RjDSuLErWJ6/XSepBC7O/qO5WgTydfpVj
         TMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784067684; x=1784672484;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:cc:to:from:subject:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vv0t/+7auxcbtGWpvakmJ0ritrqSQFOQmC0jKQCZU2I=;
        b=QILFYxtyAUDZpZocN2V5CRN6T4e9zFA+J0JZhfc9uTEFaGrPPkxxZYjPCgEJdH8+ic
         ll71bXhC5YNTej0BBrrhg3xp6oEIPS8mGF1ElGDiatSaN1gistC6M5sKfGy8D+sZx0t+
         zkGPdaKPp1hA2KdswYxn2hFhY4oSy1Ku+DA93L7Y3EO57KTJmdAf2gZr8mAy2xD3/gz/
         ARHKud+R66rt4a8wTCK1Xl0Q6mC3Z++TCVhMD1ew3DNVhzpru/70p0W1P0oBAJY4LkEd
         AZdVuyx3YGywTENzCI2++B7cdnWqZkzkuOfYxIxeOCHMUYAn1akjeKNNbIaw9sBRnN6m
         HNQQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJ/l66Ps3GiJ9bibvDXjjcWP7f9bMx0gIq+xb3f7iJpjoWPxYnrPWsR37yEQMqxMTDzk/eqd5lMMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQGGJQLncWpD+nHjapyUMvP/BoI6SuEpkS+sV9mGmyXpFoyJpZ
	kh94jL/lx8E9RSd+GaiZdFW53xXOww4X5H5udS8thHOp7X6LnVeuxPck
X-Gm-Gg: AfdE7clA4QyNeXi2Lqnmge5uSYi5dtkJGJ2LCct1MdVmZtP4q9Dc93fvDojAvo+uehB
	Iap+JAQUuBiBWBR7UDOJMpKfVQrkF8FqvdH+ynemywieWfM9x16uNxQK4OSzmNoJlkWY4FmHzy9
	P61XI9hnR0TCNLou0HTaRjiIYl0daM6OyIV7aT0r1pCuNVuN7DWnLsRjTZdFmV4hId0FjkHISxK
	wBphZeFXXsrOxN8UJDu4S7+u0qLpHeUfX3qiv+I8HnXXE/YGCn6f4D7ww6rE+m4Df36X3rBljhb
	k/CwnfcftKiDdrB1IUHF8NbgODpC9t34cJij91trtaAJpDMgbx44ShK7QwUrh9fVGXB1pdsqllo
	YM3hgNMng/QXk7KkxnvyBd+e7H+hyDmjFBzeUBwuf0uQsrsguZa8H+yHLUxSkqQL3VUuqUK0zqp
	5UULRRuVd2wwpngv2+ANmBeNXZHEvU4NZ7wPnqEUc4HpZtXDgBAF29mtt2HpU=
X-Received: by 2002:a05:6a00:b4c:b0:848:6895:b763 with SMTP id d2e1a72fcca58-84a6735881cmr262012b3a.40.1784067683556;
        Tue, 14 Jul 2026 15:21:23 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643cd6sm10622134a12.26.2026.07.14.15.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:21:23 -0700 (PDT)
Subject: [PATCH v2 0/4] mm/hmm: Clarify notifier retry state and scope HMM
 timeouts
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
 corbet@lwn.net, dakr@kernel.org, david@kernel.org, jgg@ziepe.ca,
 kees@kernel.org, leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com,
 ljs@kernel.org, lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
 rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, skinsburskii@gmail.com, surenb@google.com,
 tzimmermann@suse.de, vbabka@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org
Date: Tue, 14 Jul 2026 15:21:21 -0700
Message-ID: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

This small fixup series applies on top of:

  [PATCH v8 0/8] mm/hmm: Add mmap lock-drop support for userfaultfd-backed mappings

The first patch updates the HMM documentation example to make the
mmu_interval_read_retry() state explicit: callers should use the notifier and
notifier_seq stored in the same hmm_range that was passed to
hmm_range_fault_unlocked_timeout().

The remaining patches adjust nouveau, amdxdna, and drm_gpusvm users so the
timeout passed to hmm_range_fault_unlocked_timeout() is treated as a relative
HMM retry budget. These callers no longer keep an absolute deadline around
their outer driver retry loops or pass a computed remaining time into HMM.

This keeps the timeout scoped to HMM's internal mmu-notifier retry handling. If
HMM succeeds and the driver later observes an invalidation through
mmu_interval_read_retry(), the driver retries the operation with a fresh HMM
retry budget.

Changes in v2:
  - Kept the nouveau outer absolute timeout around the
    mmu_interval_read_retry() loop. hmm_range_fault_unlocked_timeout() only
    bounds HMM’s internal retries, while nouveau faults are handled from a GPU
    fault worker, so userspace fatal signals cannot break an endless stream of
    invalidations there.
  - Updated nouveau to use time_after_eq() before calling HMM, so the remaining
    timeout passed to hmm_range_fault_unlocked_timeout() is always positive and
    never 0, which would mean retry indefinitely.
  - Updated the nouveau fixup commit message to explain the worker-thread
    timeout issue and the time_after_eq() boundary behavior.
  - Fixed the amdxdna fixup commit message. It now describes
    aie2_populate_range() correctly instead of carrying stale nouveau prose,
    and notes that command submission still keeps its broader timeout while HMM
    gets a fresh relative retry budget.


---

Stanislav Kinsburskii (4):
      fixup! mm/hmm: add hmm_range_fault_unlocked_timeout() for mmap lock-drop support
      fixup! drm/nouveau: use hmm_range_fault_unlocked_timeout() for SVM faults
      fixup! accel/amdxdna: use hmm_range_fault_unlocked_timeout() for range population
      fixup! drm/gpusvm: use hmm_range_fault_unlocked_timeout() for range faults


 Documentation/mm/hmm.rst              |    5 +++--
 drivers/accel/amdxdna/aie2_ctx.c      |   12 ++++--------
 drivers/gpu/drm/drm_gpusvm.c          |   21 ++++++---------------
 drivers/gpu/drm/nouveau/nouveau_svm.c |   14 ++++++++++----
 4 files changed, 23 insertions(+), 29 deletions(-)

