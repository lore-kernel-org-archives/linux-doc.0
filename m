Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CF944C4FE
	for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 08:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757836; cv=none; b=oRxqxWkoKl+TR5uVPCGaehq8YpFXu/mgvGolbBL4aJW0W8TPFh+5W1bxh0Vcsd+gU9GkDO9Ij+Lzny9DHPQU95Iv8vGsvlnsvPl0exdxKw+BEsGA5PygMmf/HtVRtwhuQ1z9GdR297lGv3yLiCr1fYi4c7/MbGa+36e1bMS5cA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757836; c=relaxed/simple;
	bh=UHIktq9hHohxcsnuW+PjvAGKUTvxgMu5Z3skfDIeIVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P5jLURlKI8dMBrctNcGwtY8YVKoRq49RaD6/r5rAswU8sjK7bzGt5OGbdGQDbmW069nTnlYnE6ZcHHPDb1CmvY+/x4J03MEwyTy34cAWiJgVT2Fx3W535flAoq2HiPgfB5pwsBzL2oVpnvpY2MBVG3WyCKyv2DUY8sz3Onv3k84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Qm9JQ4sJ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Qm9JQ4sJ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c294ad260fdso289630866b.1
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 01:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790757831; x=1791362631; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=11O/i4eaHiTKOHQj5oOKeDGVuB1F5PuQ9vQoJ/Gyud8=;
        b=Qm9JQ4sJp9p8W9kvU+Yl49C3WZmKFu4Zn+8vFMeElBfWaU09zE00j6c1Uw7QTfJ0YQ
         yHaBKmtxZAIs1U7BeIAXpnnOLX8iq+IKe2JY8+A2ay7rYZrU9DV48LKitCQ5ofH7n1xK
         RdnwZOWNRJUoeQouhjF41LNl7CYXApelGOT5os4sb7GFPB8pj22mNv3o//RHHrOCKgjB
         xW85O4qsP0X9l2u4TufTFX/dSM5F6GepUAnWrU6c/BtV/tjfM0KXfBL1HiGgFWwQGsXf
         /PnQ0UcRqj16VOXyNT55DXWUU/l8KZ1XGf3ZMIIcEpPINJWrjEL9z5heSXuUVel4cYXT
         WyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790757831; x=1791362631;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11O/i4eaHiTKOHQj5oOKeDGVuB1F5PuQ9vQoJ/Gyud8=;
        b=ckleUuYyywjMbaL0HlLbVKUkKpHdczmRbd+ToPThFdTdrzwOISP2Emi399vsIuaiyN
         muPnZDVA9tZQyXvKSJjrXxm8z4PAIYFOg7KyHoFYSNVeyemAzsJ/pWVjh56spQ2v0KC1
         65Y00/vzK/W+/krVeABFn3dK1MrqUDE/y2Ui2VmKuIRlG73O+ay2jpOYO0T3NbhBYLWC
         wtHqDDRgvYmS7jbhYLsxcyjxV6bNbu2yLuEpxbiEEWG8aiJ5G6gBJdDfJaCHs9TXig5o
         UJj7u9skgM4hFVa0V5rSxS814tNO4dvuxdEqeGXNnaJdzS0TDyiFYLJsBC54L2XaGgja
         ZCww==
X-Forwarded-Encrypted: i=1; AKwUvBy1vZMUyiPTnICJJ7wuSqZvZ5C97b4PScUZ9nce/kqhNFRaO1qERUlynFMqUQQHu8uKgeQBa84AP3A=@vger.kernel.org
X-Gm-Message-State: AFuF++l9K3LgQ+OEI9KNt2J2FyeGqJYyKr4M2UrcoqfyOyENSFA5KJps
	gwqDEHN0NcUdDOFGR3nPzVuFZBdCm7XWB7KRfN8F/2DTOFiY4D/NaXyL6S/GJ7ea/Cg=
X-Gm-Gg: AYBFou0HiyEhLgpO7sdR/qhis+trOPKIZW/Jbtls1xYXDLQIQCRrZJXIgFOsg7WhwSk
	cJVlrgI+4UJvs5klkfat6HbbrJcQaYZ9ftpNhMQvwfMD9D45ZczgG/bAkxhWnrbsfeYLmPyXEEk
	sGqsXOFYwpN61ZtQpGeiubDM7O3xKLMO27NAJrNKeD1TlUvTJFeT6Y6RPCLh18lY4U1KJpDvzXD
	MtE38FyEzhFavyoFeN9JTPvpmtIcIIVap0HGXITgUL84fTb1b9p8rQuPgfUTB4ODJaJhbH2yf6a
	WJkofOdf2/goN0RdJWqf/gPOBd1aUIULvyq6ug6TRg8QHRxJZFEXnkPv2XbNnFuAPPVumBbDXfI
	st0J7LFnJwSMceysONWfJfIycFK8iLjH2OZm9aCtBw1ip95Xn2BC/+4YLAXeEicztRMLKaY8sKY
	fRJf5eCrF5NInoYb0p8spgI4/VrHviQ6Z55KcAqBbORF6lZPvpzGBthN83BWo=
X-Received: by 2002:a17:907:94c4:b0:c2e:22f7:59c5 with SMTP id a640c23a62f3a-c2e23cabdb0mr57793966b.7.1790757830388;
        Wed, 30 Sep 2026 01:43:50 -0700 (PDT)
Received: from fedora ([84.207.203.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f5f676sm29571566b.26.2026.09.30.01.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:43:49 -0700 (PDT)
Date: Wed, 30 Sep 2026 09:43:47 +0100
From: Gregory Price <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	liam@infradead.org, rppt@kernel.org, mhocko@suse.com,
	corbet@lwn.net, skhan@linuxfoundation.org, ziy@nvidia.com,
	joshua.hahnjy@gmail.com, ying.huang@linux.alibaba.com,
	apopple@nvidia.com, linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/numa_balancing: allow migrate on protnone reference
 with MPOL_WEIGHTED_INTERLEAVE policy
Message-ID: <arzLw18RiTN6Hmey@fedora>
References: <20260930072617.64665-1-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930072617.64665-1-lizhe.67@bytedance.com>

On Wed, Sep 30, 2026 at 03:26:17PM +0800, Li Zhe wrote:
> Allow MPOL_F_NUMA_BALANCING for MPOL_WEIGHTED_INTERLEAVE.  As with
> MPOL_BIND and MPOL_PREFERRED_MANY, keep migration constrained by the
> policy nodemask: if the CPU's node is outside the nodemask, do not
> migrate the folio there.
>

Why for WEIGHTED_INTERLEAVE and not INTERLEAVE as well?

Otherwise this seems reasonable.

~Gregory
