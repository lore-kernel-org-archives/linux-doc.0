Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426245;
	b=VFSlIcaeE07fGc/WIUKEQoB/56KQw70XlhLtYi/GXBL1HCpzPAfn5dmxu0Wfj0LF34bg
	 +J09cif2MuAbPzWmwYAtH6QQoCcpIWp9gA4OK6Ks46/S0Kp9+QK7ezuBi8ALagmMMBrPZ
	 Hxn5pzppg6zEeb1/d50vRFh1sEh1UPy89g5qg2LYrKFKF1k2qugVIz3AJyDxuUxHGl5hr
	 UYf3Whg+jYSt6Zwwn9ML3E1plRhznlk+j+Hq7eobhryUUeucZPpA75kwY4Dw8+VwBSvaT
	 xu7NqytL9VSdJWmEptBdYzdiQMNphi5T641DGZw3j/BbUlis3+cwvL0ng0AKzRoZ5Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=524VuOfFgYNOliyeGIEdLFsd0yqaT8bQWUr86gODCAI=;
	b=fHH7tdies20L2XQc1fsMHFPiGfwm34CLNpkZi0PmCBZxdal+eHnNCRl/BvIRZ3rKEYGT
	 wHll/K2bakpjO31yLo41afJu1cPhftbdmlu83lN4qi6EFxqR+IGYEYl0UAyAugUn6xnuQ
	 szl0XPEJLdm/RWqkMBlu7nazoYUJZMC0YJ3ZvNOx8+xnQ+M+I4NZG9Fkd6gwQb9nRw6lT
	 A0Qd9vXYGsxULr87Q1MDi0Gf54MuHdDgUBTgSLJjUfpxORTpR1w7P/TwyWIQEVP4mU8Dh
	 waqnzk7896hvFmkkOHejv+QQTfxp3eB4Ip8QwBnyFWkKjqYGNPQTjJDyAOQlmW2jWXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=TAJh4Er4;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4F1606AAC8
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 16:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A4F1606AAC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=TAJh4Er4
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-53512cd2f85so26085961cf.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 09:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792426243; x=1793031043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=524VuOfFgYNOliyeGIEdLFsd0yqaT8bQWUr86gODCAI=;
        b=TAJh4Er47ofnVCoUNWaumAYwysFjlSVRNjlHTmpTj1ZVtJ8fNPL1utvGKmXgV/4eBn
         WKml7mwNMk1f4tolbgazAnDGzkiSTKi9S8sXbDLJ3mZ6RBuEISEJCFx34RfbbToZYejN
         GZebR7UyU1PJt5HKc8XJur2s0Ojoh9U+eB+PjNvpRdBhPztdPt7yw5yjOZKUqVcf41Mn
         RZ4zmBu7vhessj9FGFWqp3joEv9m+RJWapnFHDaFxtO/DoPP+9H0PcsSGKdsdK9xVNIg
         JhR5TvhtMwla4ZgbDGqUQtnivSkJ958HLCYzNQxMzV2lswOONH30M2fjJylmos/D2s/+
         K9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426243; x=1793031043;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=524VuOfFgYNOliyeGIEdLFsd0yqaT8bQWUr86gODCAI=;
        b=Yf2VQpOqZ8ZoOBEaMySfy43oHjCa80gZurDIoO8+J+xdJ0W16q31hKWKKcSBk5EbrH
         Ji975FghCi6zxBYja0yJboS1zjIgau/OI2OodS4Uj3F92pTFNh6LDzhLMTZe5WvBznHk
         d8bVl6YDPEB62MjRtQGBdh13+EFM4LPzfvPdwoRf1/FcRBsrcvLGC/dqzfnf2OsTuEgQ
         mUjRhA9FBL6RSzmKQ7LgkOwtYrwg+uioQ5PUxFNyfdOCB9tJrzsw/visJ64DzWDKCV8s
         gJSDu8l/OirqWiR3g9yVmpkL/48Z+qSs/o1Wvpl95CsIOXNFiqDFVz0eqYk+fwbfczXn
         8WNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNGy7SljofJefKWvEz6GJtn4DnEZWAxhYW8BoHuDEF/KictEW1v3FmcWLpPrRbTY+eBuvkfDaCdm4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ64TXdagTgifRSJXBuCE+A9SclIBp0GKmOzKCmesbyaF0+1uah
	V28N6pEu2v3xkiG9jvPPqlWKz+Q1uusVIjDugGEqJNWnU6EGaBTZjYjDDf9X/IrWJsE=
X-Gm-Gg: AYBFou3DbaD3ChhxiIFzzqElEqGCNr7vYDM9oPTPIxiuDKX6VoBNVf1EYdauNcY01jF
	nOjkk7IyayY9NjS8ghTfgo5CQ3oSkH5hD8zR01s67E4bk91mJ3NHl3zsZ2k9+sQ/jGhCk3oprCb
	JkcTtesPfEfUnEDYLUUGwSaF60Qn5eQsk8Tkom2toon0tAIYYdicgOtRV4M0vGtX0L4/Kic0u50
	S7pyrb0MlXMTEh5/PBxn2/Sa/PDnG46z6K108BW2zFglPmZYIVeHAiktEoIX5iLweBl/cOo264S
	frKYb1Vg89dAlezwZX/0r9Akm8tJHMds7VcusOzZgWw6axOf6f9DhRjQKry38g1ZE3ZUmt0t0Il
	QnBaoqlaPCg2WuisIlVpLiBat7kurPvFGfkAmFwDxzeOuhppWoSZiEi69rJJEYPWSFpdvyhUxNG
	6Ojw/t3Gu6d1+Gzd/7SGWYARuwBEil+hrEn0OtwdhjM5aL80GZhibQiSaDhBQSJahzYu0xr5xMv
	LeSVIkkKlFJAor54sSERz15SD3e/DfJmCzkxiWVcvjV4gMqHQN31RE=
X-Received: by 2002:a05:622a:90b:b0:536:48df:345a with SMTP id d75a77b69052e-53648df3cb9mr103473081cf.32.1792426243229;
        Mon, 19 Oct 2026 09:10:43 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5367b3d1ccbsm12827051cf.0.2026.10.19.09.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:10:42 -0700 (PDT)
Date: Mon, 19 Oct 2026 12:10:40 -0400
From: Gregory Price <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, 
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, ying.huang@linux.alibaba.com, ljs@kernel.org, 
	mhocko@suse.com, muchun.song@linux.dev, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, weixugc@google.com, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC 0/2] mm: add source selectors to memory.reclaim
Message-ID: <atY-LD2AzCYATRii@gourry-fedora-PF4VCD3F>
References: <20261019141401.11927-1-lizhe.67@bytedance.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019141401.11927-1-lizhe.67@bytedance.com>

On Mon, Oct 19, 2026 at 10:13:59PM +0800, Li Zhe wrote:
> memory.reclaim is a useful proactive reclaim interface for memcgs, but
> tiered memory makes "reclaim N bytes from this memcg" underspecified for
> userspace controllers that manage memory placement across tiers. The
> kernel's reclaim policy is aging-based, and on tiered systems aging may
> demote folios before they are eventually evicted. Without a way to
> declare where reclaim pressure should start, userspace can only reclaim
> from the memcg as a whole and observe one aggregate progress value.

This is not a good argument for pushing the complexity of managing tiers
into userspace - it is an argument for fixing the reclaim interface to
handle demotion and eviction sanely - which presently we do not do.

My best examples:
  1) the watermarks don't make sense for lower tiers that need to absorb
     large amounts of demotions from upper tiers.  It's likely lower
     tiers need larger WMARK_PROMO to let low-tier kswapd run longer.

  2) proactive and async reclaim current reclaim top-down, which results
     in swapping directly from top-tiers because lower tiers don't have
     space to absorb demotions.  We should experiment with async /
     proactive reclaim applying bottom-up (lowest tier first) so aging
     the top-tiers demotes into lower tiers more successfully.

     direct reclaim should stay top-down because we want the best page
     with the least work to minimize stalls.

I have a strong suspicion if we made these change, then memcg.reclaim
would work more or less the way you'd want - and anything else can be
managed more directly with madvise/process_madvise.

I also have concerns with extending memory.reclaim this way permanently
locking in reclaim implementation details that prevent us from making
changes like this in the future.

~Gregory
