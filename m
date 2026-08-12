Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D147341F5C8
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 10:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529695; cv=none; b=Lw61EYI/e83dqFSPNIWLfcfIA8W0YZ0Rad8fWaaLd43Zm5jv4T2xu1OmTIsHN3l0rH2xrPjCgqKPnqliwuC8iIGS77Ej2CTUN1m/FrOsVuOGGEwpGoMLejfkg39VWX8hSk4Dx8ufeihICTXyPZ6t55HLFFaJ1X57Vco8KJxZz+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529695; c=relaxed/simple;
	bh=Z172tjNjqzh5mkYPZ0j1co633i4QB4Lcb4ua9lN1k6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gcs0jympr5bzq1qh1c39AgZ7p/DRDsUfvUHiAzlWkBa8S7tD2f3Ta1iZGlk31yf2fal7Pop59BcbQZT9cGu/S2u3J/OOtK5uSrM1F7Gp36+FLYDL6vi7IpBSqZ+462PHpucsutWa/Jr/6wlIXu9paAG+ExOl7DGFVQD/cUcIEWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+iDRr8t; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+iDRr8t"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so601459a12.2
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 03:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786529693; x=1787134493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d6i2BJcq4+Poqe237T7rKheo3pdYjmKajfreOcZZTS8=;
        b=I+iDRr8tl+yCGbnxmS9BvAoiErjhBcMJmlCgkaWsOqbLzbsAMZkGGVfqSMZtx1TULN
         IcSRLRq3v6/tDLeGxvUehsAochC7aoIZDOeC9OwPVsLFtNVywy5yQipt0nqPh6VKEToW
         jRIwC28EQyP+R2MkpeiuSkBiHkIHsVCqcAdkr/6y4b/64gjy12AA8jwselUH7nE9YxCw
         yCM2sp9d1ExfEqPV6vwozxCqRfvvC/h4qL+CWInhDFp/U+oLsbk2ZxgKoGlnypOecx+v
         bIE4vrQNeF9xrP3KuPsVml4JFobh7pRQ8O+dv/y+CypL/XsUlj00yvFE7yOFTpSq2Cqa
         l3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529693; x=1787134493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d6i2BJcq4+Poqe237T7rKheo3pdYjmKajfreOcZZTS8=;
        b=arIzyFpgU5GfT1JCf78Z17tZXXD6+bNtZSTL3BM2tu7pggvGWbdAs4WzKKsqIh8roh
         /YbHPNKRWUHfyyGeHuQCERQInoPjP0cSMn+kOAChUN6XCt3iC446Xc6iF7bCu+FFS9Fc
         t+qZZSNXzq4Qim4bZAae0DFLczmd/8wu4LceZCw/TlqZRugOqitpTy2Njccbu6vNPgAV
         RK5P4QPMLwdQpnY9W9oKPsMz3m019ppGro74P+3fwWsHfz5iqF9OCbym3N8ATy43ufjV
         tqblccAk/udHFUUCYRgNWcj6EISX+PgAkmr47NCF1aedPlYdc/8pzEB6em6oJv6zlhxF
         0olg==
X-Forwarded-Encrypted: i=1; AHgh+Rq28SmAckZH5t5NgizHNEbdvSl2gjxI1zXZ+C25l9QxNXvxmiAlLZuCaMNHaeHmdRlE0xh8geJfgRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDNDuHgBE22UxKT02Y0Q0Lj/oGsKOTJrKJr4VEhBZxsDhMSHQl
	nOk4rLkmQmVBQ6WZDVZ1bt1g4IDX82TCeCQj1zyAycxl9LDn3dFYadra
X-Gm-Gg: AR+sD127hKb9pJ6TxmMjdLVLIheVjMyTq9BjRj9th0npkYiKavLImyGhWi6dgPVZeQ7
	ms66TSrIe3JrN3m+pJDvDM1xDuqd4ys371lMDuwEW70GiicDmV4tj++yGyJ4x5c+5IyMjhx0Sg3
	0L7GRsKRaiSyzsa6HHkLPvmHCj44IrFpUcyAnTggA7AvPU4+CP4hZQUkEBG6m+aPvxre+CLfrw2
	nGWBgPC5G09WSiJpG6p3/wfTg0KbZ4nHnXo95ikWzms5zdlNrbKf2qmTnJKECHCmpMZalHdhmeo
	ULBszUXZsGAWm6iHUklVcG/jJwuEHSFmN02g8hhNQhSWpPj202kiVu21u7buYPt+cQ/GaabvETj
	exx6GCurST4OL1wqeoGxgYFEye1kwhpGS5cY25Mw0bzpFgX9EI0JL9TnzsFE/ukCJknV5ZJBq06
	ZEVr3zw9byw1R7XZBqkJ0AIUVxmbUZx65BohOE3fkL0fzYvjMnvOTbfKGdyHxO55jwGVnPaHKr6
	/9R1J72hxwu6Bg=
X-Received: by 2002:a05:6a20:6a1e:b0:3cb:b5f6:43d4 with SMTP id adf61e73a8af0-3cc3f734079mr3137808637.23.1786529692949;
        Wed, 12 Aug 2026 03:14:52 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:85a:5c46:85a5:ec7:8aa8:72be])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf678ca12sm8940240eec.20.2026.08.12.03.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:14:50 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: aethernet65535@gmail.com
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	damon@lists.linux.dev,
	david@kernel.org,
	liam@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	sj@kernel.org,
	skhan@linuxfoundation.org,
	surenb@google.com,
	vbabka@kernel.org
Subject: Re: [PATCH 0/3] docs/mm/damon/design: add explanation of nr_snapshots
Date: Wed, 12 Aug 2026 18:14:56 +0800
Message-ID: <20260812101456.3845-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812100433.6288-1-aethernet65535@gmail.com>
References: <20260812100433.6288-1-aethernet65535@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 11 Aug 2026 18:18:38 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:

> Add an explanation of nr_snapshots to avoid misunderstandings.
> 
> Liew Rui Yan (3):
>   docs/mm/damon/design: accurate semantics of nr_snapshots
>   docs/mm/damon/design: difference between watermarks and nr_snapshots
>   docs/mm/damon/design: fix typo of max_nr_snapshots
> 
>  Documentation/mm/damon/design.rst | 7 ++++---
>  include/linux/damon.h             | 5 +++--
>  2 files changed, 7 insertions(+), 5 deletions(-)

This patch series still contain some error, I will resend them later.
Please skip reviewing these patches.  Apologize for the noise.
