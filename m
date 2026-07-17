Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FA83DFC8C
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 14:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299726; cv=none; b=Yyhp6eF48kI1eHGkr1higbzvJXOj7H8hmvLMqi9/BvnCRx/Up9yIIZEHsz5apv7cjwtxdPzokcBXjxIH+Kt2NMSFb4aLAAx9o1xdE2e3+kwLWK8i6dgurxM64dMnW9p8brcm4CIYuivCN//6PSPcJtIK8d4QRqwAnAYwhuVuYwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299726; c=relaxed/simple;
	bh=mRjlo0h7XqajHkCi0tOJU+estaZg0reyf7n06FlL9no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYAsbMVg9gC4BDx5YFsME866GTUMLDA22fUkPsPlQ9a+wAq0QYY0dXxzFho+8P6yULIWHKh/s4BL92EzWu+wNBMKlCY0IPfbBBa1EbuDS8Uqgxg1MezK1i+TCHOsh3k7LuCtWO4AbKlctAv8qn5LWBwLTuUAtZBIbdP9LFXa7EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QZV5B4fA; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QZV5B4fA"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c15f020a223so1049869466b.1
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 07:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784299723; x=1784904523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xuE8UsHFqi/drBf67Pe9stpmyquoxdJrOltp395q5AQ=;
        b=QZV5B4fAuJ+EIhH+HVQldJVqNGZvlMXOeWPFJolvm7jmv/7T/Puhob0g1vQMlINS9K
         EYTja3uA4/abAn1g120m5JykLnYxJyyQtm1rz1T9rG7+UEDuTShrmbsOQdvHh+m9+L+O
         mmgblntVR670K35+XOQu4KIberAhhDwPWxfJnzEkwL/GAKACYmhhGHjo5ADLzXeaBAW6
         AUyFxpUtVynN1CcmVyHfQSg7Cwz9oWtpcrypxWszv/lD3IdQNmkyaGfjzY0o5U+l0yeE
         68xmqZWuQEEJPNRpXUn0T87DOvsPp46wYnAD87piXjm5XECX++N282LHQKdAusPxYsRF
         h7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299723; x=1784904523;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xuE8UsHFqi/drBf67Pe9stpmyquoxdJrOltp395q5AQ=;
        b=ASO+sEwDThSRlnn2Kb767GTtzdf2y77cMg3IvccLJALkbXrN2mW/GXg2H4jftH3jKu
         XLjyjKruvjERDCAVQ/JtwupDxpAThxFNRwvZaOUC6K6jj9Qa9XENCq7U/+MujBOWY7rs
         w4i2vYI7X+DRDRsfLKzCitoZc7Y5rSoeVfgtlyOVyBPuoKxSOn9jIgVecBgtHbgh3iib
         YfeEUOkIHEGAKVRqMcOQX1x8pI+9nSFCZKNXaJZQLiflDY2TdZo8QVu1SQJ39E8JzaJi
         4zqlGWTQ/gPpYG7znezcZUbUwH1Up1u0Fnq5fSEqTKiZpEFw3u/P6uy6sjjaXxMD62Kk
         YyIQ==
X-Forwarded-Encrypted: i=1; AHgh+RpQa6m+74gvOEmadoqZRrzAH9XQ0LlhvZcIwZDHs94AP50eW8K8+XraWg0czPpWFSYSRvy9y8Rw190=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWf7g8FTvhDIJU81zbL75IBZtgkCRo/eWaFPcXOQjNCmYXY/mM
	nX9AJGq62eJtv2Ehq+pwUoi+ZCQFa1gMoKVngvMZweSDE71zY4MogHSw+j0ieTw1ok8=
X-Gm-Gg: AfdE7cmuxR4Oqpred5Z1fghPlTDo5+vWilYNpRS0yg6YFiQt6gDWV77Zjwk++OWVAAG
	vR9JKOprM9WeJky3O7e6UM3v0H06RpZxDs5XTkOvkLVhAwqUww56an0WlmK2XXFnSo0jHlMLq9A
	ulAZcanO8P2bT99ntqfV/LL8Px5sKbVehTK22h0V9R0G9OssdI6KyrrXXro9UU8VIknBgixiPXE
	6TagVHY4g9BH8ajLLGJT2ZGnBriRwijVc9cZUBeBO26Qyfi/ahEDMOz8KqptQ0I4Vy4IaC2CiSJ
	7uHoeYBHC1y08VYHI8o+pAOT90bnukt+1i+tdjKkQ3Ezq/bPNPebP5tjCVWNlhnnLudvLG0aEFL
	1HQuE8ldyme8kQ7XEt576KfpTyj4uEdtnovC8j3a9tLSCGHjRezGrU18tXpPvtoZzNtxTg6Ssf9
	dtvPcW7A==
X-Received: by 2002:a17:906:fd82:b0:c15:e8c8:340 with SMTP id a640c23a62f3a-c16b46f5139mr134693366b.23.1784299723240;
        Fri, 17 Jul 2026 07:48:43 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705a08476sm90682266b.17.2026.07.17.07.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:48:42 -0700 (PDT)
Date: Fri, 17 Jul 2026 16:48:40 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Tao Cui <cui.tao@linux.dev>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, 
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cuitao@kylinos.cn
Subject: Re: [PATCH v2 1/2] Docs/admin-guide/cgroup-v2: document io.latency
 rotational vs non-rotational behavior
Message-ID: <alpADmJBLHpHAS_G@localhost.localdomain>
References: <20260717060225.2019764-1-cui.tao@linux.dev>
 <20260717060225.2019764-2-cui.tao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ephr2qisqe6yuncj"
Content-Disposition: inline
In-Reply-To: <20260717060225.2019764-2-cui.tao@linux.dev>


--ephr2qisqe6yuncj
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/2] Docs/admin-guide/cgroup-v2: document io.latency
 rotational vs non-rotational behavior
MIME-Version: 1.0

Hi.

On Fri, Jul 17, 2026 at 02:02:24PM +0800, Tao Cui <cui.tao@linux.dev> wrote:
> -		The sampling window size in milliseconds.  This is the minimum
> -		duration of time between evaluation events.  Windows only elapse
> -		with IO activity.  Idle periods extend the most recent window.
> +		(Rotational devices only.)  The sampling window size in
> +		milliseconds.  This is the minimum duration of time between
> +		evaluation events.  Windows only elapse with IO activity.  Idle
> +		periods extend the most recent window.
> +
> +	  missed
> +		(Non-rotational devices only.)  The number of IOs in the
> +		current window whose latency exceeded the target.

		A group is considered to be missing its target once
		missed reaches certain ratio of total.

I would not bind to the exact value in the docs and put the explanation
to the "missed" stanza.

Thanks for documenting missed (pun intended) fields.

Besides that
Acked-by: Michal Koutn=FD <mkoutny@suse.com>

--ephr2qisqe6yuncj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCalpAwxsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AiRZgD/bio1yk4KiA4j0+myiFeL
qPwIOp6V3p27lhF4qdBRVG4BAKC8MSZvi8+DOi/IuzdUE6EZRv3f7G9bIN6msiE4
JWQP
=tTpT
-----END PGP SIGNATURE-----

--ephr2qisqe6yuncj--
