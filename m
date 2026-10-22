Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792641384;
	b=3fUG6gngObANyjrUvzNR6ozHSoKdPc06RYCHdHbMwL82GSKLjG1c9fI/qQF4d31qrZOp
	 ab4t6XcuyooTlb+ZTcNNN2mksSZSaFhfhlKeLPsDqZ07ARQnNxycuJKe6IXDw8SoOJUh4
	 i9TvFbOJGJeDd0TLcSKQLBDtHFWIiZAV6dCVxEw2c1IeYOzI9rH8njDX5BCWZd3KcvvfD
	 CLaM6UYx/8pHstuTPpWZLpPKpJ+9eud44rYTWtO0lqIQ33iWob0cm22blVzoCLiFJhuZH
	 TCIy/cp7v1H+finrtvl/E56TqBEoLfSRtuLjhhmpPv98bWIc2dWOKrv+ZgTi7lhHTzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792641384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=nBJVMizSkP5mIMubRGP9eWHn8SLS+RX8waQiqIH32K4=;
	b=YGo7zp0fiKvWhpQ8m0Ou0VpCzIw6+bxy4ZxKWKsS8mSyBjkveOZZYPstvU58l0H6Twhs
	 uVgLqVtSLv50FwbXo/hVT2vnsUzo4dyG19DIqqlrXnExf+Y52pORfYRDiyjQabjE4L8g6
	 EhJNO45qLNxIwnpKVzMvTo72iFZRBMWI6Ir/v8ZfwBQk1QCuRq6C7GqB6pdHpBm77g7JX
	 YOCKCv0+Vuhz9gGAdxgn0p6Vbrysz688Jj5uY6m1kbNg4q+eXCeli/CqQsU3lImOuQCcc
	 TATMND3yaCIQVgCj3LRuvMnefJ2NkN57HeQefjsHc3l+0mWtKBqY6O6RZ09gDw8xPAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=onuWEefU;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9784606A31B
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 03:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9784606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=onuWEefU
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f20b304c0so164922085a.3
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 20:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792641383; x=1793246183; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nBJVMizSkP5mIMubRGP9eWHn8SLS+RX8waQiqIH32K4=;
        b=onuWEefU2jjcs+hCjUkLSfdNl69v6fK0TFmwOd7kcR12a6A+gkQYVGBnE9SCneJp34
         OD+o0tgqfx5K/2B1MsiIpnBswsXjL4yIHRvlekKvfiFnHRLApQH4xtEDYw8LDmJNew2T
         MftfIYBedbPSORbGkJ/2pJPSY8a3Af/n0E1eGUYdHjRdxQmVGOdVm0vrum0O64RQoLoD
         6BlwrjGgv2AcZSJTbuS5sjccrjvqZKoxiiL+GlPoe8HGjldsmgPnfYfZTjU3s7zYycXG
         bXsyPwQlkIvXfryr1Qr2xs28H2bZf1hRDGT0Py1cdiMvHU7Q7MrZpNA2eRb5bPFibZE2
         05wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792641383; x=1793246183;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nBJVMizSkP5mIMubRGP9eWHn8SLS+RX8waQiqIH32K4=;
        b=PXxlN4LZPWFKxRi74QtcUXHFV0lQ9tLTqW22p2opDwZDG5t13NOuCNtjN4uxG2gng6
         FAE57q/ZmZ9zaBo8ZpXq7bAHm4n8q0G+x2HAxOch4ElhRcGwR1I4x0WCvXv1eyIjqPN+
         BFt1fvjCTyUJGPJm0E7iu4UTW6QwRSCe+KNEGUt3yIy2LcXgiT6AQe8ditP0Ihi3PphI
         pJcLiz31kv2ClDjapdsC+MN61Ul9+7wedMRQDiSIfnB8KwZ7Ez3ptWQrfgTFiH9IH2ml
         y2gTS6HhGCiZnhqhsxgqejlNg7bpMMgVM++TXcyKtVXz0lLg2nbbPCbbOM2qU7AEOl/D
         RXXA==
X-Forwarded-Encrypted: i=1; AKwUvBxxB0bd+KkiOUovi8ZmFXJe/x00c0itRmw26a64LQ0zB1Y7bY3TpxM1uK6vEqhEswhxN1yf528piYk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcWzHeHOlifz3mQIufyMpwFIkpo4fCq2sgmSUXdPhsn+f4v3X9
	t554EPcriRwkzJx+qv4yPmn/tADDrGE8QkmCgH8oukUjvXJG0eHsQA3s5oFCVDZ/l6k=
X-Gm-Gg: AYBFou39M51m3sKg1tZ2mlsRtYgNK6qqF5R2r0jhBmmPalIBWgHsGSb6N6pF/lmQcE1
	SKe4iw84z32xb+qkAl31EkIjBXSlIKtzPk/2SvFHYrbKIvlvcp5oKy9+Dd0ryUY5ihjjSdDdsjz
	u3jqav0PYwd2do69CkQDBJHnunw3JcjWJ3d08N/qVxL72nAVjAyG55ZbMn2CpF5ukw7DDZKh35S
	KfT03kKBgtYvCbjrBL4nFf1VOKZ+kMqsekEDXwsPFOTHjZvo3rVpLww4MY1GHPYL4HHVou8CjnO
	ghJXkFAlJL0TY1l+1kuNr7unSe/4pNmJNng8tMYGuYjjMnPJlX9jIl5ReQRrz9lVgxU7UFKg5PR
	FLrYYlLevxPBlWdzyhSAaGiv6QrM1tdft5LixfUnZ3YHvh1d22p8mITXOBgxHsfq15lbBbLBti+
	xEbdPfmJ8cPNhcu2hoLUbcIZlfcabcNblAPp2+cYRwvkNttSDThQUw8XDYJZQohH7lO05bQbvlH
	f9vCCF8yp3QDqswt31BG0xCQ16andBP2QPG5Mabkph+S+Bk2WeQnSPRqyNO5PLCp4PVLqjy1cBJ
	L0j0/b3Cp6nlDj3ZDOiuYsXr82M=
X-Received: by 2002:a05:620a:6f9a:20b0:93f:6182:53d with SMTP id af79cd13be357-93f618206b2mr208635085a.3.1792641382767;
        Wed, 21 Oct 2026 20:56:22 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56d9a495sm423380985a.13.2026.10.21.20.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 20:56:22 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC 0/2] mm: add source selectors to memory.reclaim
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: Gregory Price <gourry@gourry.net>, akpm@linux-foundation.org, 
 david@kernel.org, ziy@nvidia.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, 
 ying.huang@linux.alibaba.com, ljs@kernel.org, mhocko@suse.com, 
 muchun.song@linux.dev, roman.gushchin@linux.dev, shakeel.butt@linux.dev, 
 weixugc@google.com, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
In-Reply-To: <30457046-a662-4ff7-a6a8-100398d7a806@bytedance.com>
References: <20261019141401.11927-1-lizhe.67@bytedance.com>
 <atY-LD2AzCYATRii@gourry-fedora-PF4VCD3F>
 <30457046-a662-4ff7-a6a8-100398d7a806@bytedance.com>
Date: Wed, 21 Oct 2026 23:56:20 -0400
Message-Id: <179264138036.2549665.17429111144570830454.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-20 21:01 +0800, Li Zhe wrote:
> On 10/20/26 12:10 AM, Gregory Price wrote:
> 
> I agree that the kernel reclaim and demotion behavior still has room for
> improvement, and the watermark changes and the bottom-up proactive/async
> reclaim idea you mentioned may be useful to explore for some tiering
> scenarios. But I think there is also an unavoidable userspace policy
> component here. The kernel can improve whole-cgroup reclaim, but it
> cannot know every controller's placement goal.
> 
> For example, one controller may want to keep a specific per-tier
> resident ratio for a cgroup. Another use case, as Joshua pointed out in
> another reply, is reclaiming from a lower tier first so that later
> top-tier reclaim has room for demotion. A single default memory.reclaim
> algorithm cannot express these per-cgroup policy choices.
> 

The latter of these should probably be some level of the system default,
that's why I brought it up as well.  (proactive reclaim should prefer to
make progress from the coldest tier first, then work its way up).

I'm not convinced a reclaim interface is the right way to affect a
per-tier resident ratio policy.  That feels like a hack to get around
solving the harder problem of something like tiered memcg counters
(which would otherwise drive reclaim to work exactly the way you
describe for resident ratios).

> I am not sure whether changing the default whole-cgroup reclaim behavior
> in this direction could affect existing userspace dependencies. In the
> old nodes= discussion, Mina mentioned that Meta's reclaim stack relied on
> memory.reclaim triggering demotion [1].
>

Yes and on its surface this is something I could see Meta using, however
I question whether we're simply trying to find a convenient way around
fixing reclaim to do the right thing (not invert the LRU, apply per-tier
memcg limits, etc).

> I also do not intend source= to lock in current reclaim implementation
> details. It should stay consistent with the current design: source= only
> selects the resident source to which reclaim pressure is applied, while
> the kernel remains free to change the reclaim policy.
>

Well, sort of, you get exposed to the implementation details by having
to negotiate what is considered progress under different scenarios.

Lets take one example - what should happen when:
 - 2 node system, node0=DRAM, node1=CXL
 - zswap is configured
 - echo 1G source=nodelist:1 > memory.reclaim
 - node 1 is pressured, zsmalloc falls back to node0 to allocate

Should that be considered progress? We reclaimed from node1, but
increased pressure on node0 - which might have kicked kswapd or memcg
accounting to demote memory from node0 to node1.

Should zswap also take that nodelist as a constraint?

At the very least i think you need to add details in your cover that
demonstrates the process of doing something like per-node resident
ratios, and show that it works as you intend.

-- 
~Gregory

