Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2298E3EC6A0
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 07:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787554962; cv=none; b=uLHTuCbzHRhjxrQUE0/6Gq+LlMCK5yoWzIYrWnJETDZ8q+dOT2tmINS1zqGsbfdTrr0P4hnDUhIwVRvGGJHiWXtTCtorF2y6682XrKxkgmCxScvuQVpJn86y5oskl8BD9ml6+lM6dBy1zO2VCxMPrQdRWz9bHcFjLEXHfXhZMTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787554962; c=relaxed/simple;
	bh=dAiTN3K2/qWL/BjZQGm3J+P5250uVTACobJF5aguZWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZxbcigijV5x9PN/eOf7rA4t5ArQXMAq1Ib1J2VokaggdD/MIjwe/gq8/y4G7totmguOI73bKBdAxnft+HA617zx2isy18Zr1mFjoSwTj7Ss7tNt62hsdzPa+8v/5nPtIVeZNuhPQxp1IWRKz0gZ5nu88sF1FS/7GeSIFLA7ajLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YZI6lOHM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sq2N30y2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YZI6lOHM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sq2N30y2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787554958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G7d7HgiMHwmpzIOyoUl4AR6/ya+8tZe+ferjW/FC15c=;
	b=YZI6lOHMxobrn8Khnj1cJd0OyZXjI97Awl/KRm+AcEaktQcYm8ftUwh8VNMQTiYEzeSqcY
	9oO+UKTixN3Vhwxe+GYUtBZkp8Xr93s7p7p7aMv9oxw8ZS3sUmRH8x9Vk1vmlSYccg7njA
	GtWWHfEM/uRzTCcRRv1+HLA3MC47DNg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-q6mPGXSpMl6FuH_oMEB77w-1; Mon, 24 Aug 2026 03:02:36 -0400
X-MC-Unique: q6mPGXSpMl6FuH_oMEB77w-1
X-Mimecast-MFC-AGG-ID: q6mPGXSpMl6FuH_oMEB77w_1787554955
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49808ea1b64so24579805e9.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 00:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787554955; x=1788159755; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G7d7HgiMHwmpzIOyoUl4AR6/ya+8tZe+ferjW/FC15c=;
        b=sq2N30y26CG9Fn+ddidWpof/ShyIxtZZ6h7NFWWf29RtWQAHhRGH81Z2X4lJNq83Z/
         Pv+E/GpbhxFgsFt5CXmsYuFuU2Z1QWf0ZtCLmPVwMRTLQkzhJhMlpTY1SDko9YqjzeYE
         T0Qf2BmAMAqqpyamk8w2mn57xJQShNGbl+N4l6R0X4NEOw5NVk+lwcChXERc1I33Ynox
         w0bb4i7SCe3C+SHMmshqWU8HwFu2Mfmw+FSFJ6VPN1asY7tLYd8AsNWxJhDCWwD/ir72
         vsGGalZfo36a6tngERcVIHlaKGwXAdmM9e+i9JGGngUNnsS0sJ6r3yK7Mdj6VV9cwdp/
         HRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787554955; x=1788159755;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7d7HgiMHwmpzIOyoUl4AR6/ya+8tZe+ferjW/FC15c=;
        b=UdU7nDX+Sscss1Uq3vzpte3/f+BU8awoMCU/XbknAXBfcPgeOiAtW83fdRKXWhQv0w
         vnvhtYko8J8JAd/wlldg2Dg4bnW09icxrpPamWWO1kr25zpX4EFGwGQcPgb1P4z8UwEn
         7/ffcAiswo9/C+TNqIMYAeAfIVk14qDnKtW7GZPF4KsUr0LP55/CmMNQFjAdXKpeliwt
         HI+NI3kHuQHoGITyt0Dt7S6mmrf1A5VbLoPKi3pSB5bDoXOsr1/Dcy55SBJl64ex5XGn
         XLirioZeEbjL0GaiAArk57h7QYfwcu+XDldSC1WP51ySjigW18I+GcQXLXoRGKu4DLzj
         e4Rw==
X-Forwarded-Encrypted: i=1; AHgh+RqH3nJLcxRmOCissC2MM5mVWa4HBm6W7WNyDtuxAOC+a3x9dRH+ox9GofxUi7Mld4+IVgmwqVQDvIQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m5dBZic7BrGEeOnf3D4y/ReXh85NH6rl9HrUeVOj9Ch0mTELpq
	+w4sbChrvAKWetpRYTQK974uEEHu12n9LSwYcnaaJCKrSjZAfh3WMmKU58VBp5I/NCVsPZSzlS3
	gP281P2W5IjQxgQK7eVHJ4S+8zsEMiFH2zH6Co5IgElxwoZn+Rt/J25sWgtn5zg==
X-Gm-Gg: AR+sD13wwQaqGyDZwPYlfeqZE7zlqDh0RtBi6CTOztdVnVi+DT0bBkwNyHEfXNGOqFd
	ffoYQAj/EGZIZ41Xi4GQuoVhYVc0MzwZBSGwVZHufNZv345r1/5MMiEzS5AoLM+dg0MbwQSnUXC
	VFt6g1dwAWvq1ld9nQqtZ8HsgDOr3Z4oeec+lvirYrbrM4IFkqDiY5trDU5eM6bcyOaIoB2IwUa
	fA69gNraTuvTQ7Bc1PuZrlZojTl0IhZpQefp1fxtR7WAEFHghEkppE4AL5LABUX6uji4YZ8fZlA
	IemB/qhYxbNvw1oYSaV/s8YnJKT0Eu2OjYwMygRuCvD8YYdO9q1Z514UwQe/KiGsf4Kl+JFdnw=
	=
X-Received: by 2002:a05:600c:4688:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-499b91ad940mr188040165e9.7.1787554954707;
        Mon, 24 Aug 2026 00:02:34 -0700 (PDT)
X-Received: by 2002:a05:600c:4688:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-499b91ad940mr188039125e9.7.1787554954215;
        Mon, 24 Aug 2026 00:02:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:a99:9822:ca7f:54ff:fe01:374c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499bae8bb6fsm103521345e9.0.2026.08.24.00.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:02:32 -0700 (PDT)
Date: Mon, 24 Aug 2026 09:02:30 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Eric Chanudet <echanude@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Albert Esteve <aesteve@redhat.com>
Subject: Re: [PATCH 03/11] cgroup: add memory_cma_accounting mount option
Message-ID: <20260824-poised-meaty-shellfish-9a09d2@houat>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
 <20260821-cma-memcg-regions-v1-3-d21b165b8440@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="l2avhy4pfliwz3eh"
Content-Disposition: inline
In-Reply-To: <20260821-cma-memcg-regions-v1-3-d21b165b8440@redhat.com>


--l2avhy4pfliwz3eh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 03/11] cgroup: add memory_cma_accounting mount option
MIME-Version: 1.0

On Fri, Aug 21, 2026 at 02:56:55PM -0400, Eric Chanudet wrote:
> Add a cgroup v2 mount option that will be used later in this series to
> enable CMA memory accounting under memcg.
>=20
> The option is made opt-in as it will charge allocations to the cgroup's
> overall memory usage, which changes existing expectations.
>=20
> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> ---
>  Documentation/admin-guide/cgroup-v2.rst | 20 ++++++++++++++++++++
>  include/linux/cgroup-defs.h             |  5 +++++
>  kernel/cgroup/cgroup.c                  | 15 ++++++++++++++-
>  3 files changed, 39 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admi=
n-guide/cgroup-v2.rst
> index aed195a71cbf..3dfc13f31a0c 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -246,6 +246,26 @@ cgroup v2 currently supports the following mount opt=
ions.
>            will not be tracked by the memory controller (even if cgroup
>            v2 is remounted later on).
> =20
> +  memory_cma_accounting
> +        Count CMA memory usage towards the cgroup's overall memory usage=
 for
> +        the memory controller, and expose per-CMA-area usage counters. T=
his
> +        behavior is opt-in, so as to not cause regression on existing se=
tups.
> +
> +        A few caveats to keep in mind:
> +
> +        * CMA areas are reserved at boot time, memory is only charged to=
 a
> +          cgroup when a CMA allocation is performed on its behalf.
> +        * CMA pages allocated while this option is not enabled will not =
be
> +          tracked by the memory controller, even if cgroup v2 is remount=
ed
> +          later on with this option. Charges happen at allocation.

And what would happen if it's the other way around, ie mounted with this
option enabled, then remounted with the option disabled?

Maxime

--l2avhy4pfliwz3eh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaovshgAKCRAnX84Zoj2+
dmgFAYD2QpXyIkC2UzudfuMMWSQyhPMvADvZ8Rf/HrEEqUh/MjtRgmrUG5NqgkMI
UAktDh4BgIRrcGChUBI+vsNkyPAnIa8ElouZIe+7PjdeK6u1QPgT/QlxiYNC2N8b
AaFU79ONPw==
=PSxk
-----END PGP SIGNATURE-----

--l2avhy4pfliwz3eh--

