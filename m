Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CF717335E
	for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 16:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724085731; cv=none; b=utp2FDcGQZ24ZBpWD12Cc3rQFJNcCbJNE09xrd5Hewccsk8fCRRj90p0xGOgHeA92HbnNDYXn9ff5gLOaP8fB6kZYvhOtO19ASEFfgjE5CtI1688AuRUxYdCGk4LlWGAcgvZMNIdrgur/CIhaPv9GpqkJbU96upEhtEvzFpcWe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724085731; c=relaxed/simple;
	bh=JORu8PK1y6/pGZtgwYUnjQTj9vN+nQrMAQNragoJGJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPqFaDB8SDoTFvbmWQoZLlXHcKhrsQDCykcWWcle2iuaa+zwdVCcrxgbDGRoU7Lb+fz5Ku+CEiETgZyEuqJX8MVpG6GLSzVSFg5FIxQ11PxMFweBXLAiWQXqsRpVnGj78v7c3Mv5ijjN9TKTshdgMKyzImarbFnIGZ+bFhFHFVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LaZPaVSM; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LaZPaVSM"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7a83a968ddso530694066b.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 09:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724085727; x=1724690527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J254iZqXeFW/IBKY25JGG4mlNXWPaB3teDZSrFqr5/M=;
        b=LaZPaVSMxt/pFGRRIGJCB/e9wJNsQcnFQUcDifUKSWaxTSZNGkEGn8JFyu8gBWU6QZ
         6Q847RMrwkDsuE3Fje4rxKIZqEtAmzqjLFpp9ygZ6yYkYeWWN2kDIy1KVBbGPrhi9Bfg
         xERkpl4SfkppMKYUN3JP7TMK5d/xkC4YhrG+ILNsQZ19w9ZdL9jr5OGsPdT7cuMeLf8a
         nkOI1Y8+dQNDOPvJQwzeFk1LcKFJtPcHQk2CrwONN0jZUVWnc2XbkHvGUfNpWHH+L0uO
         KG3CDahoufy2h7PDkhkxngJGEXd/UwJuo+WrvFDi7D6q3gRNGiVS/pOftSyp2tzuYtAO
         Nlmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724085727; x=1724690527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J254iZqXeFW/IBKY25JGG4mlNXWPaB3teDZSrFqr5/M=;
        b=XtfmFUk9L2raMZmG9vDiBzDwJ26/hz1D1+dAdZAqemnPJnUzERV0vbsaIuDW/SqEYp
         IRVhmwoUUBsBjH4IattZtlWgCZGUvjOX8oOt9t7obe5gxjkT2fGbJxJ3wXAwR+oie7ma
         c3wBSqIyY/ZTvKfnWlE/hA0Yv+0TUFn0p7Rk/vsCtm+1zu8TZLXufBWUzQhijP7/QU0R
         MqfbBpbKhstM9pzCu2DMZY+wT3f+NWOE+4e/BQJhIotlarqWnstikSBht7bStxxdVrET
         ufkphx1qV7lAGf9ioFu1K0GNBpMMBbyM9bzc7jntW+h/4xKAmkiwOJlD8ZIkv48qGFzO
         N7VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCIz64b4CWx/ottSoHFoM5NuoeCmdxrP8zF1V8wpaQEUGVIiQZ2sOe/nHm9E0WFtqg5vSfvrZ1ZMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+3KyalcKxoPWTONPwI2kK8SKxUrAHdwNvE+MCvgda57hsk4QL
	R3rCdRrVF8l681NOFBYI9ny1WapVf2nxoa/lBDp8B6ooROXSD1DBR4jrlHm7seE=
X-Google-Smtp-Source: AGHT+IGc7Y3MmAAzORrqsNcvCCVwaOSb2DMB3HTVCcr73ggR8XtsJqc9A/JZXNE6KY6OjUJc51XmJA==
X-Received: by 2002:a17:907:e2a5:b0:a7a:9f0f:ab18 with SMTP id a640c23a62f3a-a83928d7b9emr751698066b.20.1724085727388;
        Mon, 19 Aug 2024 09:42:07 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838cfd5esm653486366b.78.2024.08.19.09.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 09:42:06 -0700 (PDT)
Date: Mon, 19 Aug 2024 18:42:04 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Jan Kratochvil <jkratochvil@azul.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	Michal Hocko <mhocko@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RFC PATCH v5 0/3] Add memory.max.effective for application's
 allocators
Message-ID: <7chi6d2sdhwdsfihoxqmtmi4lduea3dsgc7xorvonugkm4qz2j@gehs4slutmtg>
References: <20240606152232.20253-1-mkoutny@suse.com>
 <ZmH8pNkk2MHvvCzb@P9FQF9L96D>
 <ZsA8b9806Xl8AxLZ@host2.jankratochvil.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3qoufy47xt4jaygv"
Content-Disposition: inline
In-Reply-To: <ZsA8b9806Xl8AxLZ@host2.jankratochvil.net>


--3qoufy47xt4jaygv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Sat, Aug 17, 2024 at 02:00:15PM GMT, Jan Kratochvil <jkratochvil@azul.com> wrote:
> Yes, it would be better to subtract the used memory from ancestor (and thus
> even current) cgroups.

Then it becomes a more dynamic characterstics and it leads to
calculations of available memory. I share a link [1] for completeness
and to prevent repeated discussions (that past one ended up with no
memory.stat:avail).


> The original use case of this feature is for cloud nodes running a
> single Java JVM where the sibling cgroups are not an issue.

IIUC, it's a tree like this:

        O
      / | \
     A  B  C	// B:memory.max < O:memory.max
        |
       ...
        |
        W	// workload

This picture made me realize that memory controller may not be even
enabled all the way down from B to W, i.e. W would have no
memory.max.effective, IOW memory.* attribute would not be the right
place for such an value. That would even apply in the apparently
purposeful case if there was a cgroup NS boundary between B and W.

(At least in the proposed implementation, memory.* file would have to be
decoupled from memory controller, similarly to e.g. cpu.stat:usage_usec.)

Jan, do I get the tree shape right? Are B and W in different cgroup
namespaces?

Thanks,
Michal

[1] https://lore.kernel.org/all/alpine.DEB.2.23.453.2007142018150.2667860@chino.kir.corp.google.com/

--3qoufy47xt4jaygv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZsN12gAKCRAt3Wney77B
SfKMAP98Nu9R8Ci7oQVELkl/Cc/lz32Tor3WKf6p5MrrV1/TiQD+OChE9aRronRA
cPrXjYdbqUEGMJBtWaysDMAsNAK9kAo=
=izr6
-----END PGP SIGNATURE-----

--3qoufy47xt4jaygv--
