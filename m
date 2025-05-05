Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5650C25D528
	for <linux-doc@vger.kernel.org>; Mon,  5 May 2025 17:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746467204; cv=none; b=H3OjZAw0PHu+OMtwffgU1kh53EPHZqUJwqqpDgdN3f+hTomed13mgSqrmR9NxqSwQEpGy3bYJE3V642Q762jUpo1ju4H7pryc8hsm/YfgaMsmL5OFfvXNQ8GLbEaslYNQPLQWlPa76OS1kUNCtfASjKUA+2L3bArNNd9gn6jHLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746467204; c=relaxed/simple;
	bh=flx8Ljw5SKcwo6d908KI2oJJPOswRDybxWbQ0sBwqXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qL5pNmyStHCBUpWUuwwgYHlQFyTN+7HEDQWzGKMXw/NqbVlnMXb0h2ZAoFzyQUK96QDwTR/1XMma2CRjJVyA4mO41t7Db7Ceb8hvWZexEHLGqKuzADfLLQD8rZijwSSvbkaenojsupiCNw0ouIy+pw8CUfGMh0/xhlfvj+XStno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WfoQlf4j; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WfoQlf4j"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso779106566b.3
        for <linux-doc@vger.kernel.org>; Mon, 05 May 2025 10:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746467198; x=1747071998; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=43yWpaDFlvzQdOUfoFXBeY0L6VRPaAC57++Wqp89Ras=;
        b=WfoQlf4jXViXBpXOQLTbOnWIO5RZV2Gq/6MNcaBBHXu4feRPDHYy+ZYqykb+pQRd5e
         ktyZeAyaWz+4rvU6rZPnty17yBJGLz+r7LUq+655ZcDoreE+kmU3nMD1bVYO+hEYMz6m
         rsYoH5SU0KL8yErHMcDDDAfWSDcAt5fiAR2wSZJ1gfwWUXuaL27PrUoQ8bsoYa9OyBuf
         CKMoIFo071qwd0s46F9KJQVu9wXgj3FxQgjNdxy3anU+x2N+X6RX6DS/qXBoRGLfQcfE
         J6jTTChziU+sYdXTGraI/Hi4c/nIqeCg7ACy1FRDNJvDuMJEBFnqH9GYw0CaNf3dRZrL
         0NPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746467198; x=1747071998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43yWpaDFlvzQdOUfoFXBeY0L6VRPaAC57++Wqp89Ras=;
        b=Vplp76OwRqG6XGL053ddfJbHISG72YKtlcgJYc7SJhXz9yNKgbwWCwoj4hF4CP1qhi
         osRZvcDm+4Xn1uJ3IMAt10sXMvgjPJ7uCBGdRz8j8/TIhCkA1wrLjjOmssyMg7bMI8E2
         mY2SLwq6Ya/cJhXuS26UHf+ZU+ajnNMkcy/W6y8Gw84FCMQ9P+CrOwuQgG3L9CLRAamU
         WzFKESiyKFkfwUA5XJmTaZHT9dRAP6N2UIl2Z1nAz9j92LiFLfUDObbItmjNdfshiFFj
         s8RCa5AWxnOSc8QiIH2559P9D0niGDHQv+MaNvx+F2bt3aS3xbqI7VBrsKlo7/KEZDxg
         si7A==
X-Forwarded-Encrypted: i=1; AJvYcCXAOKpGak8TwbLbO67kR059mMcrjcYfxJFlFrceEre4M976GqU53lOuQxVCLrUyNRMJmhXgb9BFdNg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx097tSZngChp40US+x5uflXKuS8thsUoBSNrDWQJnUUdXFDOTp
	9xHLHF7uF5LmBQgFKQ3rtRUBA3JYB59/Y33sCQsceNEnw7la0wfW622g/ISw5g8=
X-Gm-Gg: ASbGnctsJpEddnx5s3VENpOvZFGpOmfnuwBBQG5rf9N0JXh6sBTs38duwB0H4kYC4dU
	J0VaDGr9RjilLR2T/RzjAJwRgVKSLFVcAJvPUm8oPbaV/FJMw0o70WR8Dx+RV8oioUPjPZRmPXk
	8CFkFwVLQlXs2qbaWuxKyohxEiJriDBFN4BEPnNh7Fp0hBlRZT6zCSr/0R9v8flxrI1zMCrknWA
	I1k5D74mKLy/aNRS4fGlno0lTrwPXpUOY8gPf2msQhWS2x2F3WoU+lvFY17vfvwR6/0cYF/DL4T
	aEh4C4BiaKzyMWhCsLkKVIo7XP2a3/RxtETZiZNEuEM=
X-Google-Smtp-Source: AGHT+IHZlXsEPKMLo2zRS60G2WHXFj+ckZOv4p4jkB4sqgQ0nGSrOlorMH5olM9T7Zhs5WwmEyP8Cg==
X-Received: by 2002:a17:906:bf48:b0:ace:4197:9ac5 with SMTP id a640c23a62f3a-ad1906a9acdmr985756166b.27.1746467198490;
        Mon, 05 May 2025 10:46:38 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a311bsm532577666b.54.2025.05.05.10.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 10:46:38 -0700 (PDT)
Date: Mon, 5 May 2025 19:46:36 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: "Chen, Yu C" <yu.c.chen@intel.com>
Cc: "Jain, Ayush" <ayushjai@amd.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	Mel Gorman <mgormanmgorman@suse.de>, Michal Hocko <mhocko@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, "Chen, Tim C" <tim.c.chen@intel.com>, 
	Aubrey Li <aubrey.li@intel.com>, Libo Chen <libo.chen@oracle.com>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>, 
	Neeraj.Upadhyay@amd.com, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v3] sched/numa: add statistics of numa balance task
 migration
Message-ID: <tkfh4h5ntl42jc2tnwyj6dhiqouf6mowin7euvrnbs2tyiqlay@bpzdptv3plsf>
References: <20250430103623.3349842-1-yu.c.chen@intel.com>
 <8b248ff3-43ae-4e40-9fa4-ba4a04f3c18b@amd.com>
 <bd936eba-e536-4825-ae64-d1bd23c6eb4c@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="22qdon36iehurhxm"
Content-Disposition: inline
In-Reply-To: <bd936eba-e536-4825-ae64-d1bd23c6eb4c@intel.com>


--22qdon36iehurhxm
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] sched/numa: add statistics of numa balance task
 migration
MIME-Version: 1.0

On Mon, May 05, 2025 at 11:03:10PM +0800, "Chen, Yu C" <yu.c.chen@intel.com=
> wrote:
> According to this address,
>    4c 8b af 50 09 00 00    mov    0x950(%rdi),%r13  <--- r13 =3D p->mm;
>    49 8b bd 98 04 00 00    mov    0x498(%r13),%rdi  <--- p->mm->owner
> It seems that this task to be swapped has NULL mm_struct.

So it's likely a kernel thread. Does it make sense to NUMA balance
those? (I na=EFvely think it doesn't, please correct me.) ...

>  static void __migrate_swap_task(struct task_struct *p, int cpu)
>  {
>         __schedstat_inc(p->stats.numa_task_swapped);
> -       count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> +       if (p->mm)
> +               count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);

=2E.. proper fix should likely guard this earlier, like the guard in
task_numa_fault() but for the other swapped task.

Michal

--22qdon36iehurhxm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaBj5egAKCRAt3Wney77B
SanGAPwNhmE23Z/0QW0JWDF2KTaNoo6f1GDl48W1opF0LxB1lQD+MNowOWLQ/L5v
tgd+J+GBmSPm7cJPRvC8MFMHKdQZTQE=
=EAuC
-----END PGP SIGNATURE-----

--22qdon36iehurhxm--
