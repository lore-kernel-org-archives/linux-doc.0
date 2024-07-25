Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2DA1990BB
	for <linux-doc@vger.kernel.org>; Thu, 25 Jul 2024 13:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721913331; cv=none; b=Pt0cBO6jka+55B94euwfpjMQrGzHwR37P2ed2NCPFwo37ssmqEN6kWYfpcXwMpsFMrVz8A1yT6/ORoOqCWdmvY6m6jiKbA0UNPE+y9EgPhfX6nR1UpjrDJY2LLP0xJ70heEKNWuYC6ZD63WUp+bB2zrFpxWvxERxKUmTzRJR7a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721913331; c=relaxed/simple;
	bh=wBQvpVohbd2W4vplmrY5Z64LjAwjMZD6ae8o/85wxuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EurMfPJ4gOavsyYAu0hrnhcdv/8oFCMZFjh9MFKNuUF6mAfJklGq2uIbnH9HZO82uvTFaVvr5xbP6hDQTihWs6ZYbgeHWg4k7aW2bIFY6jqCE9IMi94vdiHwauC0CAcPI32GCd3xvCXWm1mEmKcxS8Nn/Ree8tlTwLIXTx+8LXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JK9Ag9XY; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JK9Ag9XY"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-59f9f59b827so1159317a12.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Jul 2024 06:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721913327; x=1722518127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=efjrSpUOXuKmG3Wgod3ChlCv7XK4z1uzPlvVqgjPuBA=;
        b=JK9Ag9XYaZqA8OukqAJzzxy4jhUF8yUERMSQyfToSjG+wbQoOK0HvDiFGtHxr4GJpa
         I61DfPMfgV/syuDVSQ1zVg29Y18mZLzIa/ciRI9jBT3RhTFMV+PGDnFopyvpb6hKwiPw
         U4jZRWw60YPUFcDEEqkXCGVpH2lR2/l04poff53RpaDxaPQ2OA+ZtvAsX3Ohdo1ttfsw
         L78BOtzudFPIQu+/8BszZxBs7G4GCj39d8iSa2FKoH0pd7l6iHdSuAALnd+QhCZHMeKK
         WFM2yZ6aYafnJP3N+0mLCskF4smXCR/b5T7Rq94ojOjwtf7ae/6IxXM/I6lhrTitlgXS
         QkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721913327; x=1722518127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=efjrSpUOXuKmG3Wgod3ChlCv7XK4z1uzPlvVqgjPuBA=;
        b=bOKxllxbSyR1vjShEOLvgZPtmOcULh4ed9YrtCrBwhEO446BfzMwiZEbCxnJAJlMZj
         fsnmpDqdk6H1F5vNoDCxMgOMH91GSBEaykC5zH80Pllje3zgY9bnRiXTJQsKQMtsJhyy
         8G8gRUMVZ++6rtDjJKJVnhRGCWl5u6/aI2E9IoXi8Abkyah47uDQwm7BIYdlGcHh5M9K
         pfCTOZVngjj1KJGDoJ6jtsEBOKG2w0JyZ9WY/TJgC2KHZAxGUrP/5nKt4uwvRiw39INn
         23pj3jY32UOIJ6yEYrLpogXcIVJrZPqTx2uMpAlYYnD0Ygzeqd4GTykbpST6uOAKJemp
         3IrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu35990IzZng2Q7ZYoU7CLnqviKqT9+BLpAFziZ+fVhgRGTx9zCX3sxQ4mYbpXu97exsE0EotjT/nTvAz2/6TpDXjYbjha65rQ
X-Gm-Message-State: AOJu0Yy/jWcjhYB4aeUcV4ljfy1cFcGy/Xg7CZD6DckNJFQ4aYv1FucR
	ii0/woPCQFdl8fUTonOglGSBA8Fpl2Bgtkv7cY/u9pvGEh9F7G0mkwivdJtDbtM=
X-Google-Smtp-Source: AGHT+IE7ycVbMTwcSDtveSbfPhTy1z6/v17KCNgRLQqdkNtT7UyXHl1UgyXUGldYyjNB28P9hbc4oA==
X-Received: by 2002:a17:907:3da7:b0:a7a:c106:3659 with SMTP id a640c23a62f3a-a7ac506f2f6mr222422866b.60.1721913327478;
        Thu, 25 Jul 2024 06:15:27 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad418f1sm71234566b.135.2024.07.25.06.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 06:15:26 -0700 (PDT)
Date: Thu, 25 Jul 2024 15:15:25 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Waiman Long <longman@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kamalesh Babulal <kamalesh.babulal@oracle.com>, Roman Gushchin <roman.gushchin@linux.dev>
Subject: Re: [PATCH-cgroup v4] cgroup: Show # of subsystem CSSes in
 cgroup.stat
Message-ID: <23hhazcy34yercbmsogrljvxatfmy6b7avtqrurcze3354defk@zpekfjpgyp6h>
References: <20240711025153.2356213-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p4ikx4ra2wliee3i"
Content-Disposition: inline
In-Reply-To: <20240711025153.2356213-1-longman@redhat.com>


--p4ikx4ra2wliee3i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello.

On Wed, Jul 10, 2024 at 10:51:53PM GMT, Waiman Long <longman@redhat.com> wr=
ote:
> As cgroup v2 had deprecated the use of /proc/cgroups, the hierarchical
> cgroup.stat file is now being extended to show the number of live and
> dying CSSes associated with all the non-inhibited cgroup subsystems
> that have been bound to cgroup v2 as long as it is not zero.  The number
> includes CSSes in the current cgroup as well as in all the descendants
> underneath it.  This will help us pinpoint which subsystems are
> responsible for the increasing number of dying (nr_dying_descendants)
> cgroups.

This implementation means every onlining/offlining (only additionally)
contends in root's css updates (even when stats aren't ever read).

There's also 'debug' subsys. Have you looked at (extending) that wrt
dying csses troubleshooting?
It'd be good to document here why you decided against it.

> --- a/kernel/cgroup/cgroup.c
> +++ b/kernel/cgroup/cgroup.c
> @@ -3669,12 +3669,36 @@ static int cgroup_events_show(struct seq_file *se=
q, void *v)
>  static int cgroup_stat_show(struct seq_file *seq, void *v)
>  {
>  	struct cgroup *cgroup =3D seq_css(seq)->cgroup;
> +	struct cgroup_subsys_state *css;
> +	int ssid;
> =20
>  	seq_printf(seq, "nr_descendants %d\n",
>  		   cgroup->nr_descendants);
>  	seq_printf(seq, "nr_dying_descendants %d\n",
>  		   cgroup->nr_dying_descendants);
> =20
> +	/*
> +	 * Show the number of live and dying csses associated with each of
> +	 * non-inhibited cgroup subsystems bound to cgroup v2 if non-zero.
> +	 *
> +	 * Without proper lock protection, racing is possible. So the
> +	 * numbers may not be consistent when that happens.
> +	 */
> +	rcu_read_lock();
> +	for_each_css(css, ssid, cgroup) {
> +		if ((BIT(ssid) & cgrp_dfl_inhibit_ss_mask) ||
> +		    (cgroup_subsys[ssid]->root !=3D  &cgrp_dfl_root))
> +			continue;

Is this taken? (Given cgroup.stat is only on the default hierarchy.)

Thanks,
Michal

--p4ikx4ra2wliee3i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZqJP6wAKCRAt3Wney77B
SZZcAP9TGigif3uPku2ECmJ0PKbMFe2LxRWwMcG2m30wn2EgNwD/VDV8rVWE4gVZ
ht3p54KnGh7JUfslrPNkV9B/ivtzXgU=
=Nn+B
-----END PGP SIGNATURE-----

--p4ikx4ra2wliee3i--
