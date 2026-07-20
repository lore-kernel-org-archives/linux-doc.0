Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB533C4546
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 09:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784540631; cv=none; b=mhCEq5sf29w7It9aTTg9t1KcRTs+lgSXXDZcBnX1lpcxgkQ/B8ln0CEX8By4TetxWx/YPM4vp6vHjxOnRSamMcxzU4n8S3iLOMmfiWvDmqTKVSO13otyUB4SWZ98gh+eW0DKI5ROJMGiBikgtyaE+eEaU2QeyZaJixJThvRO89s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784540631; c=relaxed/simple;
	bh=j1ZETi3/x4sDxuf8Hs5LtAyEh/7dlbEqRaEfZJkmiaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sqm03kMyyNz1570/kW4wA7CWKxPaZJKQOBPXyR6qzX32nC4MhRge1A/R8CNxzwfvOh/ZnBmQLml8MDD3R9SeRw5XMRflgopOwmvUvVWyO124imsZWoJw7JTvqKFk2nOqSOg/xrJLP8Dp/TWYbXsqZXO6QEHxhunLjGozvnOVsfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyPNt2RZ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyPNt2RZ"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-848d21bbaffso9723258b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 02:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784540630; x=1785145430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kAmuH3TrSH/JKaELSX3UxD4gJHLMVKkSvtSAo6OO6Tg=;
        b=XyPNt2RZ5zXsSoTLgGPCnUu4N5JtAs4GPipXwMnyNquOtuKXuMyqSUPEWSNFue9QJz
         ses6S6qIfrSs6OR2RxExI4hcDUYjrA9ZMCFOPUuwQl409vBorPHyxAwF6XSNqKs+3mEO
         94OXaZ+yOlzrAtljTdL4qo1pBMsIyC0WmrD2xV22lxczB8GQBJgJ/raE9bDGP9DjjopK
         FQ7ZqeRfUH5Ol9/tYo4NROXJ5U413K8N9MOAZharhgKx+6F3MKQNiW8xNEWcWseoerxF
         +TFcjLchxwhY4TYT78gMK9QfvSKuqbrlQsXLxomTRdWYHY05scgsWx/PGfjMmalHOkYw
         AdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784540630; x=1785145430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kAmuH3TrSH/JKaELSX3UxD4gJHLMVKkSvtSAo6OO6Tg=;
        b=oeGsqKfFYj0aha/sZQ3e4VT6REb9fTMowb+CY5jG5NP0aVu1vdLGgnP095hjt4X3KF
         N547YWpSrNEMFYv0kjcCpv7Qk5bmdGnRB3bn+4JWHUjSkq6AuOtXBTDkbSeog6uTzfI6
         WVYTW0y4ZO1QLPAHUdVQbVrg5B0pv2eGRwzA66NucMNflgmz+tStsNKOn/L8za1vMVyW
         LPt/R78CIVDrMFNkwBbxNbfMFJ+wX5GvQT1SdRSiv2OG04CLfQrjxfDqeAncW0bCJj5D
         ZIXBN/GJVeucCfGDE2OoTUKzs3dPqoo9uiBVCl8XtvGGDAx3WvqUgSivTZkn66pmgcby
         Qe2w==
X-Forwarded-Encrypted: i=1; AHgh+RqDdYGwTDuQ9rIZKFTWYZY24KdXXcO3WVX4Rfk00PQbu4jbd4SwWjWK/KKWQCjhZJdTe2G1x36CYk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC+Ca4Ytu419xjnACucTukuBaT4I+Hp8DkZzk8irJvn1FFJNGQ
	0Ae3xCF6lCuD1XJ9RaPy7R/2ShYydx8z3p7jMBXytu2iYPJtt4JBR+e/
X-Gm-Gg: AfdE7clPaejaMNQL6Py2QDqtA/gUI1artu4Edn6XMeZGuyeTIwXPWxuIBHiXUlEFEBC
	jueDHetyVidqv5F29RteJSbpGT+eGhQyE4+yec1LvsWfy1OCLZTnHzHk0MBe4UuSct8Lxxeduj9
	RJT87olNHHhaFKjvbzh/JEI5r0RjarhudZmU0ZKQ/6OIN/5Kw3rJNJ+JMI0QR+HLtg0P6u96FLg
	9p7BGhuvn7ML3h4huR05mQTOBJXsBThIZgaZNTccbXlEA9w+1a4TLwxa5ooxBIpPDiLNscmOJYV
	nbneBnPcUA2fb6AUOyWsRVAGEveeniNb/fs7wIRzwPD35SGjPHQcdlHYC0qWs2Y7xgEGI4OuBqd
	VIxi3O9cdVuIJq1TpqQvMStRE3nO4jPqliyEZJ1a2VaYs1iou5CdVhW/2BiLNOVkRvmhriwFj42
	ErVn1k4lJf5i7AYyl5xFukNEQjaKw=
X-Received: by 2002:a05:6a00:2ea4:b0:848:5010:ad39 with SMTP id d2e1a72fcca58-84c2948a214mr13304609b3a.46.1784540629544;
        Mon, 20 Jul 2026 02:43:49 -0700 (PDT)
Received: from localhost.localdomain ([112.65.87.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2ad89d0csm5369285b3a.6.2026.07.20.02.43.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 20 Jul 2026 02:43:49 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: gutierrez.asier@huawei-partners.com
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	sj@kernel.org,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	npache@redhat.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	ryan.roberts@arm.com,
	daichaobing@sangfor.com.cn,
	wangkefeng.wang@huawei.com,
	zengheng4@huawei.com,
	kasong@tencent.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	lianux.mm@gmail.com,
	lianux.wang@processmission.com,
	kunwu.chan@linux.dev
Subject: Re: [RFC PATCH v3 0/3] mm/damon: introduce DAMOS_SPLIT action
Date: Mon, 20 Jul 2026 17:43:40 +0800
Message-ID: <20260720094340.31733-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <a168a9f2-953b-4ecb-98ee-ec6b27f4d963@huawei-partners.com>
References: <a168a9f2-953b-4ecb-98ee-ec6b27f4d963@huawei-partners.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Asier,

Thanks for the quick feedback.

On 7/20/2026 12:28 PM, Gutierrez Asier wrote:
> You should mention why page split is be needed. The fact that page
> collapsing exist doesn't necessarily mean that split should exist.

Fair point.  The underlying problem I'm trying to address is that
DAMON's vaddr monitoring loses accuracy under PMD-mapped THP:
multiple sampled addresses share a single Accessed bit, so the
observed hot set is coarser than the true working set.  Split is one
way to restore fine-grain monitoring -- by dismantling the PMD
mapping, each base page gets its own PTE Accessed bit and DAMON can
see the real access distribution again.

Split is not the only possible approach, and it is certainly not
intended to be "the opposite of collapse".  It is just one concrete
proposal to start the discussion.  What I really care about is
whether the community agrees that this monitoring granularity problem
is worth solving.  If there are better ways to address it, I'm very
open to that direction.

The RFC is as much about the problem as it is about the mechanism.
Feedback on real workloads that suffer from this coarsening, and on
alternative approaches, is exactly what I'm hoping for.

> Could you add v1 as well?

Good catch, will add in the next revision.

[1] https://lore.kernel.org/20260620203915.82947-1-sj@kernel.org/

Thanks,
Lian Wang
