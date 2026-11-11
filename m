Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421038;
	b=QrbFB2AcLxWIdHyc51oSSbeahVmw1Rn+27ze2gkJ1rJkpIX9WgesyP8j2XG33rglKIWU
	 /Zq5ZxQiizPMXmeyiWuMs4nx4jiTtPJVEWSx7sSASptAtF2OZ4f5wTx5NzE3Hc+mBomNh
	 nOh42ud2/pJE+5BirHB8LCHMDzEyj0+WOLGg4cCsrUoU6W0h/aZnYuDodilZauunlbEv/
	 WN58TLgGkw6pAWnW3Lned+oto9rOFhR8kjp6aUq76ktKeJR+DYMVttN1awgCcU6bArTle
	 ReWoDR9+aByTsCU/0eD5CHGa0mbvj6GY9c01ZGuIsxJZIxDx+qbKBv/5IR51oM14JAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JAFBic9FeqiTcoA9Sc56oOZoN08uUZIC/3Jq0YqoHLY=;
	b=eNUzX2aixedFVbdjrovaV/UbIpnAsaKjfmzlt7sV2+xxYl1rF447IuXxdSrX0NGoRR5q
	 TJlRjgblAkk0fMcaGC3MDclqQL57nRQfqJhE9x8J0qesf+Tv3ajTyfIeOfmsZUZmyQNE8
	 bQHvZswv32G/qWmuo5kk1IG90qbd1oE0dEXCa4q3BmLGCHvrmShdlFs3gkzf0BzIosBxb
	 UW+jpAUoO+VHmk6tbsRV6qBssM5plqjJ3H0nCQ3/YGBiTIsMUGa1INLZnlyZlyHX0thI/
	 LFee1FnFNo37vOQdQQbs3CApyNrg3ksQhBQSYd3C6TSEgj25f8tq2pJER1/J9yE+NSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhRh2+QK;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA733606C17C
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 18:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA733606C17C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhRh2+QK
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso48321487b3.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 10:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421036; x=1795025836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JAFBic9FeqiTcoA9Sc56oOZoN08uUZIC/3Jq0YqoHLY=;
        b=UhRh2+QKrJuMUqoVkAZwLp8mjesVP5rOdbeqxz4Qd7xPhFQ7cqnpBQcOCKce2Dv+Ys
         JDUyUFr3MiMLq6MxAJzkSqEfhTzdl76LeLgd+pOsMx2+XeQYBoYuKI7QkF1fp8IymDmk
         KJX1eeF9+XTsdNrPc8KEwUSLMb7634nwNpC+cTuxn0Z2TIOeFQMk9n/Y0ie3/+B/3X05
         7xZwGQl7MS/HdOcR4MHHCdM5R+x16qvI2Pj+MyhpUkNOORYFs5pTh9M9jPGXP7mIW18c
         9Sfu3b+GWiqTy1rQATsAE0TIfLiAlTwki7umXwi8lBrYXDH2KUD6EEKFHHhrwwKziBC0
         RgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421036; x=1795025836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JAFBic9FeqiTcoA9Sc56oOZoN08uUZIC/3Jq0YqoHLY=;
        b=Od0UgNQfjOWxUGQRrg5jOnNeT+E116yPkKQGFs74GbFafnhfO/HWylRRYTuhdwoqTU
         TgzV3D/xbjF++QmFNQEkt/l2BJ55HbafPopQMonOpmmUfrYz9NTzrrn4657iJC5vvE+h
         Aec9n5WYzq7paegvhU28kR+fKiOL/g6W5ZOVVB+klkQ0aJaGihKMYzaHkqWlgqyJxL2K
         oxZKiF4yP1bFQj+A/fbJHFONJ/did2wCXl3U+8oVUGONRALamOHyimjAwx8stB9fpYF0
         0EHg9AOnhMQF6dh5/JxjwhqV2aO7eTvc5GjfCheGGaBWkrE1hIdtQuqt61CYcpHNPRDS
         7gcg==
X-Forwarded-Encrypted: i=1; AL+hErFjDTgZHVOl0+F+3Ov5xLxr7t25saYqJ/7v1cpGE2CEP8Y2EkSx6JvMgdqvGAeKOf/fBrIhnH0dto4=@vger.kernel.org
X-Gm-Message-State: APuU4Z89ixyIUy95IWHkriJYZjej9TedXh+FEMAf8NBn0y5vzomg90UF
	Xc+XfaeqRs76CR/cxKOmisa84vtilUSjL84AMr67QzjamlzvNKXFxd0x
X-Gm-Gg: AYBFou3pRKsIK/MzOtdqSiuex2RpvRvsAXOVeqvecr8hxRoiNCPePu9Ep3TnV84BWir
	CHkITxrJNRN9f5Z2EGWfhyzyqlM+ZHT3xpbaAE7/XhP9fjhKHou0QgdMhy5bS/X42tyFJ9Cx6YV
	ORFOCYRZbYztK4EdyP/lfOhbOc6OtlRrrczoZnxQfZ4wOQIEkCmV9bl9BHHTqt2iIQPyul7TTQo
	3+B2DlMAraN9/vRhn1RZa+0nyjqmV08bCyr5X+5j18GjqBeeO9FDoyknIYZpPWhqZ5QHE86iznn
	kkumrKRBRFCxpysgjq5LbIkPRZ/Dosk/5RkOco0sW051rXX757GAVnu0Lbm2I5yVVsGhFDN+ggH
	ngnXnwpQI29z+fvuyeqCTvCMx/7SxXr1gPdLAYdsx+RztEqAFHbWi5nzfO/47wC0iRJUcLTMMPe
	ULilWzPmZYYecJPNZf711H4RHo7tMxf0A3OZOdpAVc1TmtfqKjK2aEQjFGqyrpceE3QscKjlpdd
	/NTBXCc6ZJzb8k06JRLJti1/8fJkLxBhHpRQg+pJQubszo0AHmU2Y3pGITGhNyRF/IYGio+eVAs
	vtnvV265y5xB4POa8bevcP59lAoGPEsphi15FDY602gYgYDg2mdRRUkA49+GLINiE5nfU2cMFr3
	NBug4zw==
X-Received: by 2002:a05:690c:4f07:b0:8b0:d837:364b with SMTP id 00721157ae682-8b3a7e3b702mr19660887b3.7.1794421036454;
        Wed, 11 Nov 2026 10:17:16 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:5b::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b39324c124sm49936597b3.6.2026.11.11.10.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:17:15 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: "Li Zhe" <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	ljs@kernel.org,
	mhocko@suse.com,
	muchun.song@linux.dev,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	weixugc@google.com,
	cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Johannes Weiner <hannes@cmpxchg.org>
Subject: Re: [RFC 0/2] mm: add source selectors to memory.reclaim
Date: Wed, 11 Nov 2026 10:17:13 -0800
Message-ID: <20261111181714.1463827-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019141401.11927-1-lizhe.67@bytedance.com>
References: 
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

On Mon, 19 Oct 2026 22:13:59 +0800 "Li Zhe" <lizhe.67@bytedance.com> wrote:

> memory.reclaim is a useful proactive reclaim interface for memcgs, but
> tiered memory makes "reclaim N bytes from this memcg" underspecified for
> userspace controllers that manage memory placement across tiers. The
> kernel's reclaim policy is aging-based, and on tiered systems aging may
> demote folios before they are eventually evicted. Without a way to
> declare where reclaim pressure should start, userspace can only reclaim
> from the memcg as a whole and observe one aggregate progress value.

Hi Zhe,

I hope you have been doing well. I'm circling back to this discussion
to see if there have been any updates since we last spoke about this.

I'm wondering how feasible it would be to enforce some kind of placement
decision from userspace with this new tool. That is, I think I would be
interested to see if this solution was enough to grant fair placement
of memroy across tiers within a memcg.

Were you able to run tests to demonstrate how effective this was at
managing placement decisions for memory?

Of course, I think we should answer the ABI questions below. Maybe some
of the memcg folks could chime in a bit about what kinds of interfaces
they would like to see.

To start, I'll reiterate what I've said in the previous response, I
think we should keep this a node extension until we can demonstrate a
scenario where there needs to be tier-awareness (to be honest, I don't
think there is one).

Cc-ing Johannes who is a memcg maintainer but was not CCed in the
original series:
Cc: Johannes Weiner <hannes@cmpxchg.org>

Thanks, have a great day!
Joshua

> There is prior history here [1]. The old nodes= proposal tried to let
> memory.reclaim scan selected NUMA nodes, but the discussion left several
> ABI questions unresolved:
> 
> - nodes= did not clearly say whether the mask was a source selector, a
>   reclaim domain, or a demotion-target constraint.
> - The implementation did not apply the mask to the whole reclaim path,
>   so demotion could allocate outside the mask. If userspace interpreted
>   the mask as a domain or target constraint, the ABI did not provide
>   that.
> - Selecting top-tier nodes could become an implicit way to request
>   demotion without uncharge. That would make userspace depend on a
>   particular reclaim policy and could make future policy changes hard.
> - The separate completion-accounting question remained: demotion can
>   count as reclaim progress even though memory.current is not reduced.
> 
> This series takes a narrower approach. It adds a typed source= key which
> declares only the source on which the existing memory.reclaim aging
> pipeline should be applied. It is not a demotion target selector, not a
> demotion-only goal, not an eviction-only goal, and not a change to the
> existing completion accounting. Leaving source unspecified preserves the
> existing memory.reclaim behavior.
> 
> In that sense, this series extends node-scoped reclaim pressure to the
> memcg memory.reclaim interface. The existing node memory_reclaim
> interface can apply pressure to a node, but it is not scoped to a
> particular memcg. This series lets userspace apply the same kind of
> source-scoped pressure to a cgroup's resident memory on selected nodes
> or tiers, while still using the normal memcg reclaim path.
> 
> The main benefit of this series is to give userspace a steering knob
> for per-node and per-tier memory placement control. A tiering controller
> can observe the resident memory distribution across nodes or memory
> tiers, and then apply reclaim pressure to the source that should be
> relieved. For example, it can apply pressure to top-tier nodes so that,
> under the existing tiering policy, cold folios can be aged and usually
> demoted to lower tiers, or reclaim from a terminal tier when it needs
> actual charge reduction.
> 
> The existing memory.reclaim interface cannot express this. It applies
> pressure to the memcg as a whole, so on a multi-tier system the kernel
> may make progress in a tier different from the one userspace is trying
> to control. That makes feedback control of tier ratios ineffective: the
> controller can observe that a specific tier is over its desired resident
> footprint, but it cannot direct the next reclaim request to that tier.
> 
> Patch 1 adds source=nodes:<nodelist>, which is the basic source
> selector. Patch 2 adds source=tier:<N>, where N is the memory_tierN id
> exposed by /sys/devices/virtual/memory_tiering/. The tier selector is
> only a convenience layer over the same source semantics: it resolves the
> current tier nodelist at write time and then uses the same source-scoped
> reclaim path as source=nodes:<nodelist>.
> 
> The remaining issues from the old discussion are intentionally left out
> of this series. If userspace needs to control demotion targets, that
> should be a separate target/demotion-policy ABI rather than folded into
> source=. If userspace needs a strict "bytes actually uncharged"
> completion mode, that should be discussed as a separate accounting or
> goal extension because it would change the observable meaning of
> memory.reclaim progress. This series only adds source selection for the
> existing reclaim policy.
> 
> References:
> [1] https://lore.kernel.org/all/Y5bsmpCyeryu3Zz1@dhcp22.suse.cz/
> 
> Li Zhe (2):
>   mm: add source selector to memory.reclaim
>   mm: add tier source selector to memory.reclaim
> 
>  Documentation/admin-guide/cgroup-v2.rst | 29 +++++++++++
>  include/linux/memory-tiers.h            |  6 +++
>  mm/internal.h                           |  3 +-
>  mm/memcontrol-v1.c                      |  6 ++-
>  mm/memcontrol.c                         | 11 +++--
>  mm/memory-tiers.c                       | 24 ++++++++++
>  mm/vmscan.c                             | 64 +++++++++++++++++++++++--
>  7 files changed, 133 insertions(+), 10 deletions(-)
> 
> -- 
> 2.20.1
