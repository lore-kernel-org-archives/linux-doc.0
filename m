Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3934A32
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 01:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762391962; cv=none; b=myISgDfTFXBTLRL+qWKsPx+aHfjmbXoeJ3xiU4xy/bU/C5B7/6CyGet/VUolziOqpzFzJtnnmntCkSRq9+AqLsu/g7kAXY78Y/z+mG408LJjtTDQx7J2LpvsLiqeww/I6xzPNVAKzFqJYSV6hSffJ0ZSMqm7NhrqViKUF2ICEME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762391962; c=relaxed/simple;
	bh=ZnRMpnL4bAiOhL8yWk+I3kysj/17LsVDm4UhPGPGtv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sR7uyMhZ88dNYXCxkuzEfZTtjsuemsHJhhOu6dxguBkxG9SNWStcUrluLFlcZfCg7AOyZX8jG31rgLcOj2iOrSrvcReX3E/EkaVbzgJ8o36bAaK1iFHKn7txBW+psBjlSUN+OlgBu4DD7FqzGF/IfQ7NemPLPcuICpQazR5b2P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mOnry2p1; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mOnry2p1"
Date: Wed, 5 Nov 2025 17:19:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762391948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZnRMpnL4bAiOhL8yWk+I3kysj/17LsVDm4UhPGPGtv4=;
	b=mOnry2p1ie0P8EBhhaXgljXMfwXpy1/R1n++WgQqr/oRrX8xIdtOgG+Rn2FiLGsyJ8IA8F
	P2ks1VfHs3p02mGfR7JXr0Ao2CqckyibWVEGNErlgbG58dWih3TlDoX+ACjKF8Zpb4WxUV
	Mu8cruvPgnOeIq6EYAphgyAQCjW9kbc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Leon Huang Fu <leon.huangfu@shopee.com>
Cc: linux-mm@kvack.org, hannes@cmpxchg.org, mhocko@kernel.org, 
	roman.gushchin@linux.dev, muchun.song@linux.dev, akpm@linux-foundation.org, 
	joel.granados@kernel.org, jack@suse.cz, laoar.shao@gmail.com, mclapinski@google.com, 
	kyle.meyer@hpe.com, corbet@lwn.net, lance.yang@linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	JP Kobryn <inwardvessel@gmail.com>
Subject: Re: [PATCH mm-new v2] mm/memcontrol: Flush stats when write stat file
Message-ID: <6kh6hle2xp75hrtikasequ7qvfyginz7pyttltx6pkli26iir5@oqjmglatjg22>
References: <20251105074917.94531-1-leon.huangfu@shopee.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105074917.94531-1-leon.huangfu@shopee.com>
X-Migadu-Flow: FLOW_OUT

+Yosry, JP

On Wed, Nov 05, 2025 at 03:49:16PM +0800, Leon Huang Fu wrote:
> On high-core count systems, memory cgroup statistics can become stale
> due to per-CPU caching and deferred aggregation. Monitoring tools and
> management applications sometimes need guaranteed up-to-date statistics
> at specific points in time to make accurate decisions.

Can you explain a bit more on your environment where you are seeing
stale stats? More specifically, how often the management applications
are reading the memcg stats and if these applications are reading memcg
stats for each nodes of the cgroup tree.

We force flush all the memcg stats at root level every 2 seconds but it
seems like that is not enough for your case. I am fine with an explicit
way for users to flush the memcg stats. In that way only users who want
to has to pay for the flush cost.

