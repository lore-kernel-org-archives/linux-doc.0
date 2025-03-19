Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60653209F32
	for <linux-doc@vger.kernel.org>; Wed, 19 Mar 2025 09:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742375724; cv=none; b=CgDFax+zVeWhKsnvxCZYvh7m5OpFL5s/qLrVyorQG0l7gnnXHg9bRVtSwhqe2/szIsaRbpn/sqbnupX0/DDN4u4AGFYyNj8ivVLV2HFhR101psOYZOljSUFVyZFd8URn7qP9ZcbY7KqOrZuMIwrdbjO1BIHNZcNYkCX+4v8OY9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742375724; c=relaxed/simple;
	bh=sdoWtmP8lcFKkLO6YKHdSDaFP6raFIU4DI5wjtYIURA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdJp2VuyNMO/apk+0E1QHaeCaqz9IhjQNN6SVAnqSJ7X8mcoVhWT2q0rOPwJlUtWfIV3k6vp2EXomyhY4U4DnhFDbCaBBrA+n1FsVqkcimp9ClaMPhTslFVejdqVvFxLACEj6ZNoxGA6HycuhDnKQ5Xw5VsmFaUmb8PFqp6GQnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=edF5KG9j; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="edF5KG9j"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso3036075e9.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Mar 2025 02:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742375720; x=1742980520; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ahIpFM+QNyoBpC1gPfBS5sPiHVhg0tBQ7r3MPVtw/d8=;
        b=edF5KG9jLZLUN18XPd0AqVDW5B35OYV942dGR6Gam5ddWNuNE1O/QDkojmyhFLuJo6
         R5OHvmHwe1ZwV1uYmb3hg4UdrmyVyoEOdaQHmP5EjROsMVl2qj1okO2BJ0m3u61FiBfA
         TgDvnAlO4/tWPskMz1a9BzBevQU8dSBxdEpuy4deuveDuw4V40lbJg1UJRWszB133UAy
         8AVUcyngjPNm65vIcbBVVrdwhJKP3DA6PhANX7fWO0gsTK24Vw+2ZZK5mUafT5st0Jj6
         RVht+tdj//U7tIJ4ZxFrNQHwetJpV4ufw9hVmp5jxEQIkt49Amtn41U8mKec9BNVJ4u5
         j/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742375720; x=1742980520;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahIpFM+QNyoBpC1gPfBS5sPiHVhg0tBQ7r3MPVtw/d8=;
        b=cBRwO2tgsnCn4hME2AO0tk1qjWmzIF5L7uDIpI8FLdHcA8YaOSls+uTg6lfjZPP+x+
         yfMGweB/Np9xBMaMviFdlOtWbsyVDiKhEY0M3p4AtbUM2ofu6ukDm84oxzAlZPADctJq
         anUgXajJUlZ9EnawxxUrzwj1rO9zv8tgZHZmUhvuEz9y2O4uBR6X5c448gl8l7qZQ126
         GQJIAvr+OGHDiM/g1BcIrBF9RpJDLsZfWLJH2S0o8ioOMqJ+yHvvXjHKrl7m9USFeFcF
         JxJe3g6ibDpxoIBt3uRqMs6Yn4VDToRzcfpS21MpFyXRlJrKN2cB6uvycDTtmiCMsetA
         fSrw==
X-Forwarded-Encrypted: i=1; AJvYcCXjmJ2w+I35c9C4o1+oMJn3+havDktywunIC5s0uq9iJooY6L84P9yuElrBCNc0dhXkc8prdEUBI+I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzalnmyhq7ZSqYz7zt/PN/uHbfJZNpJxiXkm21TmjJkk4Fjpulh
	Eo8nSuMRYWCWkz08v6490jyxtSKWOPpvyH3qd+zzhvO5NgjO0SsGeVQOJwFavvU=
X-Gm-Gg: ASbGncuff6M4LSH4XIMYzTQLX5g4dCJOZSPYFR/wSbylC8TuhgruIJ/K3SRKxNeqdOS
	aSKzaDMgQP4UlUFqppD8I4PfOH/wZ5vRke4llCUwz2A8Tq/oJssDGPVTYu7sBnhhSppeBkAngiY
	0D841cP6xkISVdkwPtJeVoGwgL7EKLXfMnaPDXWhCFmt5vtIq/b+ouLWDOJK74tiyVhPGjPRZaH
	Ly1egfzx5j8BtN2wdqg59egfZZyAFryHhhLEac+vcdwkn7ISvTzEty0UbF3ydZKoeEghexaeOHm
	ZPpJilKDZMc2jqsA4qi+fyafumd6oK7w5JmAanEXWhg4hYA=
X-Google-Smtp-Source: AGHT+IEHJqVdsFhvFTJ0j9XFeF9mtqW2S/78HUhgtYFtcniJo8M+ZzwHHxF5ImTnWsi+nzTq3v24/g==
X-Received: by 2002:a05:600c:46c7:b0:439:5f04:4f8d with SMTP id 5b1f17b1804b1-43d4309c628mr12508825e9.12.1742375720499;
        Wed, 19 Mar 2025 02:15:20 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f7460fsm12870405e9.28.2025.03.19.02.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 02:15:20 -0700 (PDT)
Date: Wed, 19 Mar 2025 10:15:18 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: hannes@cmpxchg.org, akpm@linux-foundation.org, tj@kernel.org, 
	corbet@lwn.net, mhocko@kernel.org, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, muchun.song@linux.dev, cgroups@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Subject: Re: [PATCH 1/2] mm: vmscan: Split proactive reclaim statistics from
 direct reclaim statistics
Message-ID: <hvdw5o6trz5q533lgvqlyjgaskxfc7thc7oicdomovww4pn6fz@esy4zzuvkhf6>
References: <20250318075833.90615-1-jiahao.kernel@gmail.com>
 <20250318075833.90615-2-jiahao.kernel@gmail.com>
 <qt73bnzu5k7ac4hnom7jwhsd3qsr7otwidu3ptalm66mbnw2kb@2uunju6q2ltn>
 <f62cb0c2-e2a4-e104-e573-97b179e3fd84@gmail.com>
 <unm54ivbukzxasmab7u5r5uyn7evvmsmfzsd7zytrdfrgbt6r3@vasumbhdlyhm>
 <b8c1a314-13ad-e610-31e4-fa931531aea9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2vr2zym4stjkfz33"
Content-Disposition: inline
In-Reply-To: <b8c1a314-13ad-e610-31e4-fa931531aea9@gmail.com>


--2vr2zym4stjkfz33
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 1/2] mm: vmscan: Split proactive reclaim statistics from
 direct reclaim statistics
MIME-Version: 1.0

On Wed, Mar 19, 2025 at 10:38:01AM +0800, Hao Jia <jiahao.kernel@gmail.com> wrote:
> However, binding the statistics to the memory.reclaim writers may not be
> suitable for our scenario. The userspace proactive memory reclaimer triggers
> proactive memory reclaim on different memory cgroups, and all memory reclaim
> statistics would be tied to this userspace proactive memory reclaim process.

It thought that was what you wanted -- have stats related precisely to
the process so that you can feedback-control the reclaim.

> This does not distinguish the proactive memory reclaim status of different
> cgroups.

	a
	`- b
	`- c

Or do you mean that you write to a/memory.reclaim and want to observe
respective results in {b,c}/memory.stat?

(I think your addition to memory.stat is also natural. If the case above
is the explanation why to prefer it over per-writer feedback, please
mention that in next-rev commit message.)

Thanks,
Michal


--2vr2zym4stjkfz33
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ9qLJAAKCRAt3Wney77B
Sdz/AQDecvjUIrBbge909wB9b5M9WL2CyeFc32hNE+fRPTIFHAEA6LHJUMgFCinA
+J9mJe//Ur+z8K0lQBS3T8v+E9CbmQQ=
=VFn0
-----END PGP SIGNATURE-----

--2vr2zym4stjkfz33--
