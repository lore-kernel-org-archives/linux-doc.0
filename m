Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A1F4028FD
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 15:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779463582; cv=none; b=DJGoYtE3TDvkLSsghVQP9wvkprS30W3WxpMGRacs35s7j/e1dSqTChZC0BjyqxBCIwoRcMhm4TeX1mXdzPVmmu+cl2FXUJWm5RiDZQXiXwLgB4Q1cGEG4rf1zVxr0kL6kiKPC/zu0ZQCJLUvMntc/XZ0R/m+mHULXyRAQguUt8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779463582; c=relaxed/simple;
	bh=j3asqpI8gDocPiQLjR114Plzov6j1keIlqNEsz+jjpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1DCbJ4fGYb2rbW5DF0gcEvwJ+tt5ugAGmALvOcJ/uSACyiq2RO2/31dE5Ft2vJIt36fd1yuTM+NHZsLMW4bx8BYZgUg0kVrc/KGVWxE26MlETgEbEGaJ0LWnqOUao3LB9D9vHWnRcDPEjWhuAJbgmpvMWv9ScwLcmZonTHdSrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=frOLufSF; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="frOLufSF"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso78493065e9.3
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 08:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779463579; x=1780068379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1vEySuvchtiTT5/Luvk9UxfuyTrDBUvQ3fx5cuplJao=;
        b=frOLufSFn6M9m9T+s5hdMx7NvCM4OttOO5BOmqDn17pFqOhJTWA0DrZEaM+oHNiHZM
         iqjkeejV72hcowzoi4bYFuXyll9t2Xb5NpFwBN0cA/CoiArH8VnSFCXGWhXkCWL/YkSq
         pp66NmumIFoWIKZFwP818kVOBqi8osg/x+6w8huwNXdfBVOhNciuer4tl0Rkhx238m0I
         ukO7xLMjkPOC61UgUFso8DOnuB1dEK6XiIa6uJpsrT1ae42YF+bwIgmEMVyj9q2LsP98
         Um7qihWRA57WzR/ZVM2dcnOssFs4slDczpeIPFunbcBBUdoFCHmaOqJKp1nyjjMt3ZNV
         64Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779463579; x=1780068379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vEySuvchtiTT5/Luvk9UxfuyTrDBUvQ3fx5cuplJao=;
        b=iAa/4z390q1vTyuE2kfNClcmw3EYqGRTtnSUVkR/5r+mS5GFJNPJvVa1R21exRUF/8
         yvYnfkF4B7D4PTz+eNTLpsAltsCrYWPWm57/QaCjv66yS3ggM7mHSI01d1S+THPTLNEC
         dhomhYbAX05yPUXTjXY7aQk4gH8l+GQiuRzagsd+DS0K4TYNNb7eZCfKBnFLn9uCb2Ar
         whSznWZrhf9hJuxdswaEbrJuP58EZhSbxLMonKDRO6Q7Mt7MBcQGdCSSbPBnbCJpaKpS
         74OW7BvDBv8bd6D2xM0bgrhQzhxBmgocFPVXJGho40qME+7pJru/XGPYafU2Aazldtjc
         1iBA==
X-Forwarded-Encrypted: i=1; AFNElJ/hSmrJbYRF1W1cRFGhx1YgrZ3hH7psoVpNL90LzsRgrRzk/JpLvqp08zul1ICP0mY9EBCHou4OZQg=@vger.kernel.org
X-Gm-Message-State: AOJu0YymU5r8QcF3PTHzojjG3fWM+loBDSgfoXYMS7fEcmHIQpAjy5QQ
	L1CnXRJKdW2ULHOTf/JvDcB4k6tH26oFqrmO+QdkmVQ3jnyYP3EZmZE71NBPp5iSdeQ=
X-Gm-Gg: Acq92OHW73eQFspzO39ZTcQh8gie5szfiuOx5Jp4Nv6bg7d0BEOLfOqwrrPjBu0d5+/
	7nrShWgZYfVzZb44nc74DpLaO0TxZV9YGkiJOkDHKWymcHN7Rao93aSB5xbGxUuIXDpRMgcnMjx
	vzRBqnXGbKy+G10oZomnqMEHAbOSWWLE8v7BNvHowGX+eo+stS8PqnrxF+fexeUMuKnV4Ce7hzG
	UYqVyEOf7IYMDpuykP0Wz7O73+pwHa0Kt82LruGGBo16s+oRnSd4kOCq8ZvXA5VC4/UtM6rYasp
	El3niwcSvKuvHtDdJ50ZvPVhDpx6DW6ByvMQr75Gmi7C7ppiI97mRPiq5uzuO/09pxAgPVVLpJU
	geYpau1NM1/duR6wmz0JhtJONZQqxsFTa2U7wJUv1u7BuWIFZUGUHyHL/SzadQJP1uyAx68r0Ui
	A7u2052FZeOn7Ge8UPwEqpLkOk3vbv3D2n19aUlDNOdaDFVZqfoXKtq5EJqAg=
X-Received: by 2002:a05:600c:4ecc:b0:48a:56de:d62a with SMTP id 5b1f17b1804b1-490424b3c7fmr53184145e9.11.1779463579036;
        Fri, 22 May 2026 08:26:19 -0700 (PDT)
Received: from localhost.localdomain (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm53694435e9.9.2026.05.22.08.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 08:26:18 -0700 (PDT)
Date: Fri, 22 May 2026 17:26:16 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Eric Chanudet <echanude@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Maarten Lankhorst <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>, 
	Natalie Vock <natalie.vock@gmx.de>, Tejun Heo <tj@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Maxime Ripard <mripard@redhat.com>, Albert Esteve <aesteve@redhat.com>, 
	Dave Airlie <airlied@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] cgroup/dmem: add dmem.memcg control file for
 double-charging to memcg
Message-ID: <ahBxB5a9sX9DEWvl@localhost.localdomain>
References: <20260519-cgroup-dmem-memcg-double-charge-v2-0-db4d1407062b@redhat.com>
 <20260519-cgroup-dmem-memcg-double-charge-v2-2-db4d1407062b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="af2hel7jza3hmfqp"
Content-Disposition: inline
In-Reply-To: <20260519-cgroup-dmem-memcg-double-charge-v2-2-db4d1407062b@redhat.com>


--af2hel7jza3hmfqp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] cgroup/dmem: add dmem.memcg control file for
 double-charging to memcg
MIME-Version: 1.0

Hello Eric.

On Tue, May 19, 2026 at 11:59:02AM -0400, Eric Chanudet <echanude@redhat.co=
m> wrote:
> Add a root-only cgroupfs file "dmem.memcg" that lets an administrator
> configure whether allocations in a dmem region should also be charged to
> the memory controller.

This kinda makes sense as it is not unlike io.cost.* device
configurators.

Just for my better understanding -- will there be a space for userspace
to switch this? (No charged dmem allocations happen before responsible
userspace runs, so that the attribute remains unlocked.)

(I'm rather indifferent about the actual double charging/non-charging
matter.)


>=20
> To handle inheritance, dmem adds a depends_on the memory controller,
> unless MEMCG isn't configured in.
>=20
> Double-charging is disabled by default. Once a charge is attempted, the
> setting is locked to prevent inconsistent accounting by a small 4-state
> machine (off, on, locked off, locked on).
>=20
> The memcg to charge is derived from the pool's cgroup, since the pool
> holds a reference to the dmem cgroup state that keeps the cgroup alive
> until it gets uncharged.
>=20
> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> ---
>  Documentation/admin-guide/cgroup-v2.rst |  23 +++++
>  kernel/cgroup/dmem.c                    | 158 ++++++++++++++++++++++++++=
+++++-
>  2 files changed, 178 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admi=
n-guide/cgroup-v2.rst
> index 6efd0095ed995b1550317662bc1b56c7a7f3db23..1d2fa55ddf0faa17baa916a89=
14d3033e8e42359 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -2828,6 +2828,29 @@ DMEM Interface Files
>  	  drm/0000:03:00.0/vram0 12550144
>  	  drm/0000:03:00.0/stolen 8650752
> =20
> +  dmem.memcg
> +	A readwrite nested-keyed file that exists only on the root
> +	cgroup.

Strictly speaking this is not nested-keyed but flat keyed [1],
which leads me to realization that this is the first instance of a boolean.
All in call, such a composition comes to my mind (latter is RO):

	drm/0000:03:00.0/vram0 enable=3D0|1 locked=3D0|1




> +static ssize_t dmem_cgroup_memcg_write(struct kernfs_open_file *of, char=
 *buf,
> +				       size_t nbytes, loff_t off)
> +{
> +	while (buf) {
> +		struct dmem_cgroup_region *region;
> +		char *options, *name;
> +		bool flag;
> +
> +		options =3D buf;
> +		buf =3D strchr(buf, '\n');
> +		if (buf)
> +			*buf++ =3D '\0';

I recall there was a discussion about accepting only a single device per
write(2) (at the same time I see this idiom is still present in other
dmem.* files, so this is nothing to change in _this_ patch).

Thanks,
Michal

[1] https://www.kernel.org/doc/html/latest/admin-guide/cgroup-v2.html#format

--af2hel7jza3hmfqp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCahB1lBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AhJyQEA4ebIAV+4wgYjb7Cax+hS
43nEgrk4mA0GQOKjivEd/KMA/A581miemqm16N6I0lzKn9Fm64QJ/G5K9t45IDQW
dr8L
=9Z82
-----END PGP SIGNATURE-----

--af2hel7jza3hmfqp--
