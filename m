Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A454E0B60
	for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 14:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779845; cv=none; b=XJNMA+2Ldmkb4+mdxlaHY+0+ttchvjgIJKRitNbfAAHumraEMeEWXBGckEdI++t0zOaGIa+FlsOGkIn5opk/pxcbun+nb9D+Uqss+ArotO+LWW1XTUq/wI5B71cYytRLb0Cjxih11JFIkSvYDuNwNFAK09AV+RxmSZoVFETKAlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779845; c=relaxed/simple;
	bh=aYgliebE9zpsT289QWtpM7k0O5do8UsYwtdKdEA6ihw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Le/TTNDH2OY1BC3xE5VWme4SN2/CrqO7nsPfhyDLJKxibujHrLh140YdVykXZVJBIwpMTW8smN0I5czhWfl9IuE+ASfdxNPxUQdYDczQZQ3WoFEBRtmjtYZx2J5X+wTWMHwwnvsnaMTNdt+2FrLZO6e+VZPnpkZH0P7ATiwNYno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=fMHpDSZ8; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="fMHpDSZ8"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso40223545e9.2
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 07:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790779830; x=1791384630; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H3qtNVwOX7r6mYzIQEIi64injBAtcVX6qzz09d86hu8=;
        b=fMHpDSZ83Vl/3CG8Ao+igOp6O3VCg8dDeB2Wsww4B9VqNKffjTqLFdRbW32vXnW5QS
         FogALFeXU3gTijkRBhB+KDXZHCIvqck+IvaPxuCVd2qm7lVRePgfj38fK4iYr8fduxV4
         zr2zlFF/FK8fDmivykxKmlFySVeC0HJlFy0mUHbKI4vfz5sRL89I3z+AlhAgv7DdkPcG
         EshPkH10sqFTxy3UF38pL73ehzPAE4OeI8L80TShEc3HWJ7/hZfCc2+jy+nPFayS1Dlg
         yPak2SgN1NySC1NEjNIxxQMc1tJ0Svkz96yBYRZstHwZ8luDCH72vHkOb10XbBBPJ5Ag
         Srkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779830; x=1791384630;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H3qtNVwOX7r6mYzIQEIi64injBAtcVX6qzz09d86hu8=;
        b=T6mBAGFpfQaacrlUHDknvBXdgP0Jzs4I0LdVjs8wbj9kFCFmLYOU5q1q+4Bc3e3LjE
         WUaA+UdZ/3qRR9SyqcypVSFf/sY/l5jh9oFEWFFKf/uQxQFdxEQrbDjFSIqH7DAQEpyx
         mVujfKkNTgKZXswMk6PPgZ4ig5czSU3X7ERXNY6xfp9c6rWC/UEInMxFx6o4u5wGOLY6
         oMLauwoVC29k6Rdm8ziwJQTqMxmCnone1UTxABktjLr4XxHWG9VPprslbHGkLmsL1mQF
         FFTJZKMrvMHtJFhSuHbSgg0cNKDCYwqzHS9YVCVKxNJPsloEo+RdHPrv68HJkC/0vtmS
         wI4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxeNN5XijWis/Du90V528AkHw69A6/wgNGbRpZaXq4kaz29h0mHdO2RE/qvMqUSxFcYz6ZrdRBWt/c=@vger.kernel.org
X-Gm-Message-State: AFuF++m9g4Q0RySL83cRZM/rzQItG99PlIAH+VWSkTeFbtzg4UchxGXi
	GjeA53pQNAJOV9a3awPd0ZgG8DibqVXAxv/4JsK/0y0nZ+n/h8p1u6PivIBP94A1o+RThfnHijN
	4BiOAVGKzHA==
X-Gm-Gg: AYBFou18iS+vNR5qW0yqlegj2y6Y2Y7mYo2Gu0j5dSVz3XfDf9ncjrlEgatwYQ/pY0P
	4P2PGct9y4GqDoP6+FN3RRDmVN0cJKzQh/1G2ixDz9yIAW355pc62CCtkE48nHPLJ77fbb4WedN
	zoBhUFkgvK1Xozt3Rtl5uxp9XUzK5CnCjrXxRfxAJyF4EtPCVTIC/ApjQCfQeUoa4Gmhae2w5eV
	OxGmGp6snBMKlmOG5Vr9f1/CqeOmgdzCnI3E9S/LnwInERexyfSvR4lyJ6RWjjEegH3vXXvC4zO
	LzSfqWHoGBtgoQHX8ZS1D5mmZT1Zklibq4R2WgYXtBQc8rf3SvD5Q6s9zVjr1Wjp27+Bm5r5jNJ
	1MDMy4tRSkC5Ov+p7X/RZR8Rw66FYYGdxEnxk6ztNktHgIPPlvpgELQH82yVfv6uuhEIcXPqntd
	+gGtona0CtVzHMxgDjx+p8as1ZSuMuFi7tYHzm977zxC6xXleLP4d/ClglIhSv1J8ozrQ=
X-Received: by 2002:a05:600c:45d3:b0:4a0:c2a:485e with SMTP id 5b1f17b1804b1-4a01b130b8bmr25639735e9.33.1790779830473;
        Wed, 30 Sep 2026 07:50:30 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::7:e977])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029edea4sm4382698f8f.22.2026.09.30.07.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:50:29 -0700 (PDT)
Date: Wed, 30 Sep 2026 10:50:27 -0400
From: Gregory Price <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org, ljs@kernel.org, liam@infradead.org, 
	rppt@kernel.org, mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	ziy@nvidia.com, ying.huang@linux.alibaba.com, apopple@nvidia.com, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/numa_balancing: allow migrate on protnone reference
 with MPOL_WEIGHTED_INTERLEAVE policy
Message-ID: <ar0fURbLDPrphYMY@gourry-fedora-PF4VCD3F>
References: <20260930121154.687586-1-joshua.hahnjy@gmail.com>
 <2e3f12b7-0dac-428c-b70b-07e1f63de028@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e3f12b7-0dac-428c-b70b-07e1f63de028@bytedance.com>

On Wed, Sep 30, 2026 at 10:02:23PM +0800, Li Zhe wrote:
> The use case is closer to the second one, but the main motivation is not
> only startup-time performance.  The more important point is that each
> workload has its own DDR/CXL budget assigned by the workload manager.
> 

mempolicy is the wrong interface to do budget policy, you'd be better
off looking at Joshua's memcg tiered node solutions for that.

> MPOL_WEIGHTED_INTERLEAVE is useful because it lets new allocations
> follow that per-workload budget from the beginning, instead of placing
> everything on one tier first and correcting the placement later. This is
> important for workload orchestration because the workload starts from a
> placement close to its assigned DDR/CXL ratio.
> 

This however is reasonable to me - you'd prefer to spread out the cost
of initial faulting placement explicitly, rather than simply take
fallbacks when the top-tier budget becomes pressured.

i.e. w/o interleave:

[node 0       ]
^^^^^^^^^^^^^^ alloc until full
                vvvvvvvvv fallback
                [node 1          ]

in this scenario you end up with considerable hot memory
on the remote node consolidated in time-space (everything
allocated after node0 becomes full skews heavily toward
node1)

Tiering then likely takes many faults to rebalance after
you've already reached node0 limits.

w/ interleave

[node 0                                      ]
 ^^^vv^^^vv^^^vv^^^vv^^^vv^^^vv....
[node 1                                      ]

In this scenario you do an initial fill distributed by weight
and then let tiering figure it out without consolidating all
of the pressure to the point where node0 has no space left.

That said - this seems like mostly an initial-fill problem, after
you initially fill your memory, a new allocation largely implies
the memory is hot - and you probably prefer that to be local.

So while it's possible to enable this, I'm struggling to understand
the justification.  I think I would like to see numbers that demonstrate
that this is actually beneficial over the life of a workload.

~Gregory
