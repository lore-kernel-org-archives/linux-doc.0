Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297683064A7
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 08:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757491991; cv=none; b=tkb9JCNkD5IPBsHg+kSHeHuxzTf5Un5MIBSduqzYZijw47RsCa77BpfXj0R+nUEwJEXmF4HhR7NCO+MrwS1oMfRO33mcZAaINNw/0kdgG+tQ3XKLB33tT1A88n2fIvpLCPG0Dof7fXflIV4rmA92wqrSm2rIyzyJf+Jar5mNSqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757491991; c=relaxed/simple;
	bh=WzuI3CMsDUiGxWbPrHa8EMk9iyln79qsPIz6k8J16HI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdzyQC+a38kXHJOPKtNTXzRR0ciCQ2G7M86gzOF5qJZXPoDW9XITPyLASZjRLqBvYsl0plSsEiuOYE5A018MWFAdIJ8ptOu6sHOuIcaJPB6RiJAA4X/aLAU3LkaWWHOKJ6MOhWhfMxihRic0HgNyN+veoWfi4BrY/i+G7sv3C+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=b/yl0ujl; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="b/yl0ujl"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3e249a4d605so5229776f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 01:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757491987; x=1758096787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WzuI3CMsDUiGxWbPrHa8EMk9iyln79qsPIz6k8J16HI=;
        b=b/yl0ujl7jCtvtVHI0mgGhlMT59/Q/1n7d7/KVljpycf2Gs2NKDy9QCzcYVaK51jNH
         rGHEXYSs1L6ma5kwj2W5ofvL0yyBvik4ROM8Elraxptzw+GXeLTLXA+M5JjKCJ80uAWR
         ka0cAXlHjmMkjP/ZLUoTihguecErF4ZzTdSYwtUztRuefvCUt0upeUSLSzl1gs2ggB6+
         Fc/U0YGA//0G38mq21L7ntBQbBdETLlSVDLfbcoNzNQrSB+YriS5igSB4W5hmD1kCp6s
         cVVbwmaGDlY3mL8zOCyeJByKncwegQZFT/9YHmgQZaApc7MdarQq8BP5XNbU4r33h78B
         +l/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757491987; x=1758096787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzuI3CMsDUiGxWbPrHa8EMk9iyln79qsPIz6k8J16HI=;
        b=GWSVegNwP3bpBNEhAoiZUGP78Nj0kPZVQZBQkmql8ABRWlgQl/ikMXuzq3xi1S9Cjs
         Xv1CW+QTHJmu3LZKUzRI8LRl6Kil0BxG0ry3ewwYAbUSHbQsFR0061GwMhSSN4vnEhJt
         YCKYObFiGCTlaDsaLfr/M8A8xJUYHLIllhlCD3fGg85FB1qql14u07aHUYQSvP58nGUy
         18fHinpYAl2cRMN137W++y5SM+cmYSNvj3OdXUqg9Q2aklr1c2n5AE1ViGUhk5EGNSTA
         k1vjNzZSHkZm6hbBowLWUbUFVAlp3NV2JTBmrrk1MA2K32HbjHR1wwl0HzDlMpq8a3cR
         cUFA==
X-Forwarded-Encrypted: i=1; AJvYcCUqrqcOGYyehJZ10iN94sKokgWonFg27iCR0eBDTprl82KUYiLAaWE+0J3fgYUbnc103569ofAscx0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9JZnM6ohtNzmb57R30BxLcG/MbITF2Nuf49T4t0qOhmhysfqW
	mGEXfiBpiLlkPNAZYH+ZQvOsbRAHRHXuKc+kLr2UQVcM35I6X660kkqBvMeCSIVv7LI=
X-Gm-Gg: ASbGncs57IzuS4rcVDkzlrcRX4dh/RGEJo4IIEFR4aTXMCbkhiSfNcl+DSBenwWM9dJ
	J+fRMpidN9nKWOFaw5zTzS+dNb6AQyQxm9U0IpOmgz0cNIkU7VDgeLdgW0GKWMU2VgHieydzzBP
	ouZ+UQvSgl6De6k4Fd1sDwqn8e3piHsEdBXeY5R6u68En6kinvi6ISe0K3AMuF2yvIxJBK9thut
	UX+h5i7Suv1H2z4wpltt0gTViT3dALJwr+IkQsb9N2f5PQaSSdFtkXqchAGdfXTm27UkB3khL1W
	wqyQkuI2bTRb5g6EOdIw33a+53xqdQ3Y9MbeXPikTdSlfNBWaq/xPDL2H/VF/wQOdygEdtAeBoC
	oa3TBkHEghp2KPmDKaXIhAPqVADHAkTuRExeKAWJdtUKMuq9HKkJHyA==
X-Google-Smtp-Source: AGHT+IEQFBT7dp7RNc2ogdQdpjqsbXKvm1ZndRkmh8I7BnWy1MBMxBpMsBWKneKvH3SpeB8F/HcCIw==
X-Received: by 2002:a05:6000:26cb:b0:3e7:42d9:e0d with SMTP id ffacd0b85a97d-3e742d91343mr10263125f8f.11.1757491987198;
        Wed, 10 Sep 2025 01:13:07 -0700 (PDT)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521ca2ddsm5932578f8f.23.2025.09.10.01.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 01:13:06 -0700 (PDT)
Date: Wed, 10 Sep 2025 10:13:05 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Documentation <linux-doc@vger.kernel.org>, Linux cgroups <cgroups@vger.kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Andrea Righi <arighi@nvidia.com>, Johannes Bechberger <me@mostlynerdless.de>, 
	Changwoo Min <changwoo@igalia.com>, Shashank Balaji <shashank.mahadasyam@sony.com>, 
	Ingo Molnar <mingo@kernel.org>, Jake Rice <jake@jakerice.dev>, Cengiz Can <cengiz@kernel.wtf>
Subject: Re: [PATCH 2/2] Documentation: cgroup-v2: Replace manual table of
 contents with contents:: directive
Message-ID: <6geggl3iu2hffdop43rtd6yp2ivd26ytfn4xdclurwce6mapal@4ve46y652dbj>
References: <20250910072334.30688-1-bagasdotme@gmail.com>
 <20250910072334.30688-3-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fjrh6im5iknzgd4m"
Content-Disposition: inline
In-Reply-To: <20250910072334.30688-3-bagasdotme@gmail.com>


--fjrh6im5iknzgd4m
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] Documentation: cgroup-v2: Replace manual table of
 contents with contents:: directive
MIME-Version: 1.0

On Wed, Sep 10, 2025 at 02:23:34PM +0700, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> manually-arranged table of contents (as reST comments) gets out-of-sync
> with actual toctree as not all of these are added to it.

Is this true? I generated HTML with this patch and the resulting ToC
matches what's in the comment.

> Replace it with automatically-generated table of contents via contents::
> directive.

Mauro, what's the best practice wrt consistent ToC and having it in
plaintext form?

Thanks,
Michal

--fjrh6im5iknzgd4m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaMEzCBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIACgkQfj0C55Tb+AjMBQD/czZJpdQcPqjKDSvqxMKL
C14p0XW7rwMr8yfTpDWhSHkBAIZ5qwuYKRcjhrXgD7FALHOwDlB6kJdMj0DFfVOz
u8gF
=IlII
-----END PGP SIGNATURE-----

--fjrh6im5iknzgd4m--
