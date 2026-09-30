Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F634E01F2
	for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 13:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775659; cv=none; b=TUSqBtKNAMLpoOtlBnca5YLN7t4jjtsBp2HPsTabu790lOfMcJvyj/ai66HATeV55m+jyO/GchtJDolmb7Z2n8Z04AtDYW4opr9uAGXrOQ9f4Zk+/Yp88NJuAZTU7tPUqzRyuoyZvRRUBSVwoC57DylNWnwOV58gE6+bbjvXTQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775659; c=relaxed/simple;
	bh=TN0et96wk0KsRAeHUBwRAJLFU31hTDc5CY9QHL8nnWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHQnehpuZrbiZoD7vsdOD9foTKO/j4ZHfaAEJ0e52tqFO3vAMOZRUE17fCRhcDKBsdsx/XLJ5B9YOFrY/UBMj4TCtgKGftukmZqYImD75eO3HU7PwIf4jclS7pUPUSH3GDcVDrCfsjqlt1ph0v+x9AGNiUNbde7Z7wt2DyN9e/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=UbOcf/vW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="UbOcf/vW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so30336745e9.1
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 06:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790775640; x=1791380440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eojcGFVlS5R1p8FpQbuCoxDLXSD0EodVKDy7T+pbRu8=;
        b=UbOcf/vWKFVbzwcX+8OZqz/tiiolzoXqtLzo58zMW4HKOQqdsU7PiMIeqiTKRiJ82n
         5nI1WSPrha4/QzX/+70yeVuSHK7UOBp81wmeDK81PZIkZ5zWfqd+4BP0yLfKXAhJko1/
         yB6XnEPPDHDMTVUsvCgGAHQN2frqzV8ooyMmOzX+bNSNS9pYS57AxLyUgnsCIZMIjBzF
         0J2y11nXqQ0HUQzqTbBM/QsdG2xDe7LLTJUi3BDTONShEvqCre0GEEsPWEUUtMa1t+6/
         60x3BL+Drlxj7aWZ5Pd90hjsIPW8nn7AdMLM4sjm070t6KVrxP1U+lMHTewD0Szwoald
         4VJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775640; x=1791380440;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eojcGFVlS5R1p8FpQbuCoxDLXSD0EodVKDy7T+pbRu8=;
        b=njM+YLQwBQmJ2UgFoFwNDaVVn7auQ9DL4L18iYEevd1BGIEtgMmpoyf1WhNMw27MLs
         WWaIIb3q0w2FO1BLm1EjHuWtUThIo7YmgJgH/2Ydcz99q1BAnY9Rh5gPjLc/hPEwNRky
         gjbFDtkSwrh5jEQ9iXA98GrI1QWGTQc4zv9yiYzAvo2jr41LVo+10yuMQ+d+DsIGVdFL
         0rmo/bybAP6LZxp/18scjWi1Wol3UKUDbgttvCwFbo8E9gRqYShfRYxwyXgYffJijsLU
         b2Cwh94yua81KyFZuMg65X1SBSkPE7dsQExIvh0oqEfIruJzsY4eVfcK9pkZybELV8qq
         /OEA==
X-Forwarded-Encrypted: i=1; AKwUvByj/2rEtC0DG5Uw3dZyuXM6SoyrcAZiKc1T894JrB5lgQTc861q1xB8rhkVbwvtIrdqg3fKbB5CtUc=@vger.kernel.org
X-Gm-Message-State: AFuF++kaOow0Wv9dC28QB+rn2mmBPBa9/x1h9US0q9G0Qxx2C8op22FP
	hIpAr8MNqG6F+7+DoKhlk84fhuZqbUC8OfmoNjHjhT5cvW5DS1ZdGP25KXNTJOuUs7Q=
X-Gm-Gg: AYBFou0dH0cAfJc03jUEty3YxbKe60y9rASuHJ1SrgrkgO8Pu7Z5CZU0Yz7HiIvgDxu
	WZ1qkbduhN803xGZWqiljloJLn88hG934K8ZjfDKQwf3XvMWflBjatY5hu4Ss7gCEkRd4Ht5ERj
	MiqTVHbdcl8zlYTim4Q/4HPA1iZ+5go8eGYsJRcL2AC8S+YzuAja2CqNWGzqiMB0rE2AwFIb7j8
	01oI4YmwrowixA+4A6AXHKE6GbFljJTeRY6PWTpR3et+HMv+p7jfeIWlOd9ypmaDx44v5hJWClX
	VyGM7Z6i8BALS3GgLT2RhHYHPYAqBvgJFgEoKFmMxr/o7NiGfHjC4R6musOA/87uFhHm/v/qXl6
	/1xjk4g3/Y7ntY9cYUXY6EKE45S0IVMLAEYcq5cseRbYPHBtIefpzAVzLQTx39oHyUz8sKEMjB+
	r932VbT3isRNfi9IFOYj2wJ7kfOXi4T2xgNHvRfDxjid4c64E4oUQJBCDXDzg8RLF7/Ic=
X-Received: by 2002:a05:600c:45d3:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a01aff9b3dmr20989845e9.12.1790775640194;
        Wed, 30 Sep 2026 06:40:40 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::6:13b8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01e662409sm125005e9.5.2026.09.30.06.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:40:39 -0700 (PDT)
Date: Wed, 30 Sep 2026 09:40:37 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Li Zhe <lizhe.67@bytedance.com>, akpm@linux-foundation.org, 
	ljs@kernel.org, liam@infradead.org, rppt@kernel.org, mhocko@suse.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, ziy@nvidia.com, 
	joshua.hahnjy@gmail.com, ying.huang@linux.alibaba.com, apopple@nvidia.com, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/numa_balancing: allow migrate on protnone reference
 with MPOL_WEIGHTED_INTERLEAVE policy
Message-ID: <ar0LqjO3-cwU6-Jy@gourry-fedora-PF4VCD3F>
References: <20260930072617.64665-1-lizhe.67@bytedance.com>
 <cfdcaaa3-a9e7-4352-ab01-4922ebb8e0c9@kernel.org>
 <arz56nVu8TzSjqlg@gourry-fedora-PF4VCD3F>
 <ca35c989-9aa1-491f-a247-ed36724f10a0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca35c989-9aa1-491f-a247-ed36724f10a0@kernel.org>

On Wed, Sep 30, 2026 at 02:32:16PM +0200, David Hildenbrand (Arm) wrote:
> > 
> > Right, but you're requesting this configuration.  If you didn't set
> > F_NUMA_BALANCING then you get the existing semantics.
> > 
> > In the existing semantics, if we're INTERLEAVE and WEIGHTED_INTERLEAVE
> > we just always say "no tiering for you".
> > 
> > But as an opt-in option?  I don't quite see the argument for saying
> > interleaved regions (or tasks) to be opted-out if the user asks for it -
> > that just seems like an arbitrary limitation.
> 
> Just to be clear, what I am saying is: the proposed semantics are inconsistent
> (weighted when mechanism A honors them and mechanism B doesn't honor them), but
> once we set these semantics in stone like that, we cannot easily change them
> later because some user might depend on that behavior.
> 
> So you'll need yet another flag to say "NUMA balancing really also honors the
> weights". And that's where it all gets ugly.
> 

I would agree with you if demotion didn't entirely ignoring mempolicy.

On a tiered system, mempolicy *only* applies to initial (or fault-in)
placement, and otherwise is more or less entirely ignored.  This is
a case where it's not ignored - which is actually inconsistent with
the rest of the tiering tools (demotion, damon).

This is why I said this distinction may only make sense in TIERING
mode, while in NORMAL mode you likely just want to fault it back to
its original interleave location.

Also file interleave (indexed by offset) vs task (counter-incremented)
policies are affected by these changes very differently, which I asked
for some thought on.

As tiering develops, the less I think task-mempolicy as a whole makes
much sense (because it's at-best advisory).

~Gregory
