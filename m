Received: from mail-yx2-f6.google.com (mail-yx2-f6.google.com [74.125.224.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04ABA55820F
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 17:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789060610; cv=none; b=Yp6fWIr/Jx6zaUUHIZNV4K5b9byzTuevhrj2G+xuLaJoKmRiON52Nw1MP5TvrLiIWmFg0SZ6lLppFqMNjgMeEK+mlELFZLr+mXGh0pEBIL4frsdUO/qutcqJewx/lq3z1ke3IhlDw0e7aUVWSc/D8YmCaeT1r2j7xVeb65Zr48w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789060610; c=relaxed/simple;
	bh=YZfMs3Go3WSABp0x0N8hUDVtHdzAJjFeURZfcGTcgG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wh8T+U2W6QtaI1W3K4CIWEvJCwsXxuS2MO5ilLnOnUj5USfKdcZsJ57dn+oFKWpMrEy2ZvAglqSrtxij3rb1GnH4S+qQCGwj9idOTPkupSi1vM50lOU0GqvNsdVgH9lojNnFeU713VSfkPDy6CuK3JTYCWJfm6l4OKD5Lbf/E1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jv4GjPBj; arc=none smtp.client-ip=74.125.224.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jv4GjPBj"
Received: by mail-yx2-f6.google.com with SMTP id 956f58d0204a3-66e61475fa7so2071456d50.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 10:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789060592; x=1789665392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQvOpBVSB7EFzma+xoAdOHr/Eyr0ApRMjSY0dpxZAoA=;
        b=jv4GjPBjRLLxlXy5GOj7/6O5jYvBjmemYz8L6xQHaoUQ7VGX3KtF6M7N1jE9Elg1Ch
         k9IKA9M5iVyPsj/XkTYXJSHvRCsb5e4098X6bsMLHlJtx0UDL3pRHXMybVSG8Zuick+z
         Xi9rfqVhj2QI5bIMRwPSUDHVfMvRC2kV/rxwAaAMXfthuj4E9Ek2bBo55fMk0s6GYnCq
         q/Jo1IwoDJ60Em7LRkzcsw9oazPMU4Y4/U45f3acO624OFwXljqvaVDqlsVQ+XJJfvQd
         V07zC4b3ZAuSweZWIOMo1Xc1akOJGTWPbUwTTZlEuuy1IGqAim09OnQIt65sv8nSzawn
         1LhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789060592; x=1789665392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yQvOpBVSB7EFzma+xoAdOHr/Eyr0ApRMjSY0dpxZAoA=;
        b=ipVSXbGQDDf9fIjI1XKA4TfLDvVvozKNcLvze+rqCFwQu1HitgyBG0kHZ7Yx0ZteVm
         KkOaqU+TWT2hk9sOrdH6h1VGSOgRnaB8Jy6Ub2Pw+8VXXteXR2tK+vtC/WRPGA9kPO1Q
         3fNvCvcOtavM6AraNGDtCQyD+7bfinXa9U9A/NKauvJTGsSLAVD/syNTRIY7H/a/sNyj
         ObYOw5bLFvibOOhMtrGUFGl5xn5mhUGINS2/6Q8HQ98U+isj056KUsYeWc9rL4SzrGSq
         GztBFWkVVEP8UBzUb2dRFgFEJxQe378oyRz8umOFLrwN+EKJiXJ3KjMzhqHFCMz+b1QT
         AtOw==
X-Forwarded-Encrypted: i=1; AKwUvBxgstkqHN8ZnjsgMOtl2TLXJXGgWfrW7Kemg4RVfmge6p+vMPVn9xt7DHUwonGsnv8Qn6B650cxOkc=@vger.kernel.org
X-Gm-Message-State: AFuF++lnRYrHBJG99MxK3+vjdNNl1/4xYaYRaqHlwcuvhOubpGaQD0cB
	A86WwcjRTTTf9+ptDwFCF2qSBfFwJb/Z5LnlzNbzmOWW5tLRzp6QWAM=
X-Gm-Gg: AYBFou0/eYrvkpPLz2t6wSr4PWdtzG5JLIMYjO1o4d3GE+Nvra4KtzKEwTldV+PbVTd
	+Qzm1gTQkTGRmKcnbZuctGja3oJjyY03TtgYXU+Tcu9uFHr68ZZwzrD/WVvFir8MWFFcaRDS4il
	fw9pA37ptixdbW2aN6tQKoTj/huWLQxcXK4mojlxMFxuU/RMt+MU8LCZpf0nmYESIXB1RbIyBu8
	iMuy7hHtPV8dGyIdUToCcJ06w5Iw0IpsvVsuVfgK8Rzl8AkBj7z2uQLLIV6fFWDol2eW6dFk+jX
	agOJ0p/0WheMh0uAuuL2/6Fo6d8E91G2vmrmTnFTqbedq208lsUU514gyyvzqRbGJZiyeFnxOn3
	M+gbn3eHzY1JVOeI01s6doTqvmtBGJJDzaSYgReAU4+184U56L3AeaL8Pu+3wc9wUuVNV7Jk7K2
	ynlsjYfXkconXjUHM631CLab3gTE9kgb9k/seNwW3cpcwVZQBT+KDNMIjW3g9t7cEFlv7uhsvbg
	EIfVITvnebSdZLTx+4DOGC0bKrTybmpD9J0YoKoCgAxmSlC0w==
X-Received: by 2002:a05:690c:e289:20b0:858:41d4:c28 with SMTP id 00721157ae682-884afc19817mr1025287b3.8.1789060592200;
        Thu, 10 Sep 2026 10:16:32 -0700 (PDT)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8848608617fsm2387337b3.9.2026.09.10.10.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 10:16:31 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: sj@kernel.org,
	akinobu.mita@gmail.com,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com,
	ravis.opensrc@gmail.com,
	rientjes@google.com,
	weixugc@google.com,
	jic23@kernel.org,
	gourry@gourry.net
Subject: [RFC PATCH v2 2/9] mm/damon/core: read the CPU number with preemption disabled
Date: Thu, 10 Sep 2026 10:16:16 -0700
Message-ID: <20260910171623.6638-3-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910171623.6638-1-ravis.opensrc@gmail.com>
References: <20260910171623.6638-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

damon_report_page_fault() runs in fault context, which is preemptible, so
reading the CPU number there triggers a "using smp_processor_id() in
preemptible" report.

Read it with preemption disabled, and keep it disabled across the report
so the recorded CPU stays consistent with the per-CPU ring the report is
queued to, which is selected the same way.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 mm/damon/core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index 5fdb5922edb78..991ddb9a09414 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -2514,7 +2514,6 @@ void damon_report_page_fault(struct vm_fault *vmf, bool huge_pmd)
 	struct damon_access_report access_report = {
 		.vaddr = vmf->address,
 		.size = 1,	/* todo: set appripriately */
-		.cpu = smp_processor_id(),
 		.tid = task_pid_vnr(current),
 		.is_write = vmf->flags & FAULT_FLAG_WRITE,
 	};
@@ -2524,7 +2523,15 @@ void damon_report_page_fault(struct vm_fault *vmf, bool huge_pmd)
 	else
 		access_report.paddr = PFN_PHYS(pte_pfn(vmf->orig_pte));
 
+	/*
+	 * This runs in fault context, which is preemptible, so the CPU number
+	 * is read with preemption disabled.  Holding it across the report also
+	 * keeps the recorded CPU consistent with the per-CPU ring the report is
+	 * queued to, which damon_report_access() selects the same way.
+	 */
+	access_report.cpu = get_cpu();
 	damon_report_access(&access_report);
+	put_cpu();
 }
 #endif
 
-- 
2.43.0

