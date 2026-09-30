Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19FC4BF941
	for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 12:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769838; cv=none; b=Xkb/0aZd7IqNUy4fqVeQe222hb50oW20uBQVtzqckQ5plX0fAVlfdulfXoaUawunB90lhXDA+IvjyBnCCOnZDx5p/x81KEbkSlEULK3ptSAGswhrvltWapMwwkOtwix+iqWJ9qP4fl8xd3EAQh8A7CPPhdgFikb2hbZSRcknIZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769838; c=relaxed/simple;
	bh=nva1a+1N6OMLgAq4Mh9QV/dIao63usjnuzDRG/nvAX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMHJaJaVtnYWL5JeYjnN3qM5c52ZsXf2aG3FLnCyqeQXjquz0L9HbZSm39GIurBfdoIFkst4AGMVbWaz8mIueD+iuTzCwgD5R6cIAWlheGDbzerKJZ3GtcEGALm9jVpr95m4a6OiobrOFtaxdsWiVTX6UZjVrbrMS6s4UNtqplQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=AQa4NDex; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="AQa4NDex"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so32425785e9.0
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 05:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790769835; x=1791374635; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wdi3drddBXh2MbeE/kE5oeEb6Dfood/saqLoKtI29Z8=;
        b=AQa4NDexJGaxWiOsHFP0LXqY67EQtobPzOMTq9kSSCtqNlaReFElg7Q4X70JTWxTNe
         CdV+Mc29UtPTYEDwi/N9Pqzi+YhQn1aMDkiivLiCGxlLrYO+zxd/0LYBNCiBD/MFaBZV
         kKP6+OP5t1/RuLUgvOcWBW5tHDvlGf5KVLeeuWpbYfyHah3aXMHx+i/CNS9A6JbcR08p
         ix5vu7OnXOC+7KqucQTpSquVm9qkjcKs1dBY37GdNY36iUhrM0UiKbTjVCKBwhnRC2Zz
         2R0uIBKyzYODZ1p5gvcz4KdVxSuKYuYvDEdYn7kRXhP6ys/IVB0ADgMO8Gl0yxzg1XFU
         /tBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769835; x=1791374635;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wdi3drddBXh2MbeE/kE5oeEb6Dfood/saqLoKtI29Z8=;
        b=vizfWkQCLWshRA+y6koXxlUTiNaU5giskb6pdn40R3j+ng9wFFy8oVRlr7b3YoAVBI
         Toh60+tYBL9wwhdcGUkjoJE08cZvRrKp3xvGEgPk4jFAo5U58l2HoObSIzArV7ngnIfV
         Gt1uHDuX6Ifx8pOlp3iHJcDymM7BKbmvk+unrx3ANCD+Hh9ceLnMmqRqbPzveHCJ4Y3G
         7lyPBjaWYB6Ge95pz9TbCDTwyVDzhLWQwOvdcTRihuCIwktUz80NNftauM44D0IDhGJK
         QfStpb/9C1EDAwAQbzndxjKB31btIJW+qlc2jsYihW/7TXTnIWly9htMDhIdiM+PuvHn
         WsZg==
X-Forwarded-Encrypted: i=1; AKwUvByGrfNF334P+zDxkaKqaJX5PVQf0VzfUND2OnrPZtrqJWKecIDpldi6YhqV5wyiG3WNr07f5MSmXmw=@vger.kernel.org
X-Gm-Message-State: AFuF++l/bakuKTwcoB3wPOQ3W1f8IhBaCamlaZuB2lBOF7XPTaqu1KC9
	iHFzXbktAtBK5CP8lSLTfrgEr6lH/4MiAE2+FjU8rZ51B/PSyZvomPkg0sKb4TFSPGI=
X-Gm-Gg: AYBFou28ypdvUa1E47GUUzzu/tEJjSl1wppHtkTEEVoCoszfDFktsjye6PIIBEVFx5s
	p7xRJ8sGxuQ5IsH9TJUq7ejFmBGCVVRNxxz3SGrNuq8lrjWiDoM9+LrSEuSA8sYIjh4maTFpmuU
	1pNV8/aTbWCIs9Z9EQwl6sZ4NwGVz893BeMwtKgcE3/CO/uxQ/IAZaMpQHnwm2bEhLByTRmdvZJ
	Msou54MOivS8l7ZG4MPtqqItFguV3DlbYpGTCpWVAFRnaQnbIv3BbN73lSRN13IuknIkuAIJowW
	zYBIppXGS4Tzzpho2brBJf1XI1d4hsOtAVLu5CCTyd979x+E344cnRyR9trAxlryG8acDp9vtgT
	gEdiVpgF6VNmEizVPqVgcXE8oh0taZ/IzyK5pBbIL+g/2O03ANfuU6w7ccPpraxuk/2MWs+jzJm
	3UU8ItBxnwx0IclNg/yl8Jc0K7HV2IKtRZdN6OwbkxXKvBXJIYnOrrwA2rkxEdWHoI7c4=
X-Received: by 2002:a05:600c:8a16:10b0:4a0:b9:21b5 with SMTP id 5b1f17b1804b1-4a01b12cbcemr15861675e9.30.1790769835112;
        Wed, 30 Sep 2026 05:03:55 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::6:13b8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a017468b10sm66347925e9.0.2026.09.30.05.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:03:54 -0700 (PDT)
Date: Wed, 30 Sep 2026 08:03:52 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Li Zhe <lizhe.67@bytedance.com>, akpm@linux-foundation.org, 
	ljs@kernel.org, liam@infradead.org, rppt@kernel.org, mhocko@suse.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, ziy@nvidia.com, 
	joshua.hahnjy@gmail.com, ying.huang@linux.alibaba.com, apopple@nvidia.com, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/numa_balancing: allow migrate on protnone reference
 with MPOL_WEIGHTED_INTERLEAVE policy
Message-ID: <arz56nVu8TzSjqlg@gourry-fedora-PF4VCD3F>
References: <20260930072617.64665-1-lizhe.67@bytedance.com>
 <cfdcaaa3-a9e7-4352-ab01-4922ebb8e0c9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfdcaaa3-a9e7-4352-ab01-4922ebb8e0c9@kernel.org>

On Wed, Sep 30, 2026 at 01:26:17PM +0200, David Hildenbrand (Arm) wrote:
> > 
> > Initial placement is only a starting point.  Pages initially allocated on
> > fast memory are not necessarily the long-term hot pages, and pages
> > initially allocated on slower memory may become hot as the workload's hot
> > set changes.  The policy therefore needs to be able to combine weighted
> > initial placement with memory tiering's NUMA fault based hot-page
> > promotion.
> 
> Ok, so memory allocation will respect the weights but balancing will ignore
> them? That really sounds rather odd to me.
> 
> And I assume that was the reason why we might have disallowed the combination:
> it turns a weighted mechanism into an unweighted mechanism.
> 
> So are we really sure these semantics that you would essentially set in stone
> here are the semantics we want? (ignoring weights)
>

Right, but you're requesting this configuration.  If you didn't set
F_NUMA_BALANCING then you get the existing semantics.

In the existing semantics, if we're INTERLEAVE and WEIGHTED_INTERLEAVE
we just always say "no tiering for you".

But as an opt-in option?  I don't quite see the argument for saying
interleaved regions (or tasks) to be opted-out if the user asks for it -
that just seems like an arbitrary limitation.

~Gregory
