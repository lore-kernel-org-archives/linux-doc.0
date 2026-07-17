Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6653735E95E
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 14:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299756; cv=none; b=NvgsY5Yp31KVlynZxPkMgVWwbdnWC6GJnEiqemNWnfDDnNsP9FvJXzzH1rvhUhxkXcXVRnIsI8uDOzx5tEQDPwiZca4/3hXTqA+8AQ/O73exC98evQscWnMo/C+HKejGFZStejg19Lq/7sIKcBglHYWML15JXxRzlVPWlRlBfSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299756; c=relaxed/simple;
	bh=n7KNhhouRJfPPKsSowjR4uhZpTB4DvWvjk1/uN1YmGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPs3s1mysUluEgtVJ2DeRca4yhfa33cBiEvqAdmdHBj6Go2wxDyeq1EdeucJps8LbQWJlMxwEDzyKQaTBGNnutMp1UoIVKhU9uqRel0M+siGaUQdURm1mm/B2AEhL906z9Prr2CMmwl5XnEIkesVhFyASR1BFdCTWw7EPXT0+34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UXi5CGXv; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UXi5CGXv"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47db714766aso864401f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 07:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784299753; x=1784904553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DQVZwUL5Yj/HZgLc5usvXd7dYSZnepBO0DvOQ94q45E=;
        b=UXi5CGXvBNbX4mxWmW/mq/8rQH7+cFHhYGTgLyWliXV0Kkj32wxB1TS++lx+Nil3kn
         QiFT6Ier1tQyrPMX0IpjjF8Y3tWbwW0uytm5HAXgoL/A1IJFmE0NzthSG6QCk81RKYwu
         Cu8pOByXCn7pmBWPNrDGE4DqMc2G8KOImPAgPks+ga/IzF3Bf7O1RFlt1JA6rixwFx8U
         Na2Y5GlrW5VRqn+YEdadZ+lzcSL1Az2wmiH6n+/qzvj2VxxfXQnhcSvx9wT/Sj7j6fmG
         Ol+GsojYPL0DeUxAv9EJCoXXvjh5ORsJr3d7XECVwWw7kzJvu9XDOo3pND4irqpKjNRt
         5JxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299753; x=1784904553;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQVZwUL5Yj/HZgLc5usvXd7dYSZnepBO0DvOQ94q45E=;
        b=ojAv4fByTVPTzE5H+eZNnoF3WaOwdz6+ONmM/T1Tsaq+w8w4IgVI5iaGURpU7uAwNN
         Os01m3CQGjo1vMas8uJOYg6slMle8kuLBoepciOV0loKowJdhepDyfiF7nhc2TKAsaeH
         nODZVigjkgze1s2jpswFL/23gJkIQ7vaKV3elOu+T/XgZEX0w0FNc+uHJoFqdUgoSM8b
         J1OViqRVWRfDTjzVMGGUjVOvTnqb0kaUAHFVvWjgROiHjFJlCqFFKfcQ+rHcyn5w/Sip
         ZR46jRyj/L1csKMdu59ZmoGlHG/4TuRxZB84VzUj/uEc4dH5P9ceRjkRcr1clJEwPL2S
         ciIA==
X-Forwarded-Encrypted: i=1; AHgh+RqPjhYQXeOglS71XwqdIt9ZLU0ztkn6FAt86bNVP8XzYjyGZX77cuKGzR1VRQ4OEa2BIwvPuSyjF28=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEpM1Mb2xVy3roCqWwoSbmIaqSzd3JX3oIyLf9D1Ju1uHm3fV8
	bb5umDWAoeKw7an6DNZRSPa0waSJOLFduwlBww/H86bCxu6HLA+p4WLtuXv0wovF5AU=
X-Gm-Gg: AfdE7ckiDDVsrHH3u1Z+P2th1d8Hdw2aTozLTGDdplkNSvNNwTaNToAv5YRLh2sqiMn
	2a9iQSV3yEhF66W78NBGwsf6jsnN7+pTM4vlDRugNXy9dhGX5rJkpDrrHmKszVcEy65gc94jH0Y
	2iudoT9rpRqQRUxWCKIQbd3nOc5ZBbBg6xCRpKNQDPNysKJ1u/vpNMd5U1tUDCpREHwf8PEKZcW
	0JpKkeTgS/+KYGZ4AVWX9FOte0Zp4YmR2E3HlnIDlXnINrGv2+gXqjwhfDlkmDMA7MBtTA5vzky
	Zrv6XgLrcL2Rhrne7ZRgXzcA/N4th0OfHg1BLvEyOA6mgcFJATbNzM1qliDA2vX3sP3pXsRVekA
	Su+0g8ATu1fVt8G2li3e7FHCPj/EhL/kuHCJBc7u3XnVOcoZaf5r011fHRb7i/Wpskh/Y0eO2el
	sYte/K2w==
X-Received: by 2002:a05:600c:35d1:b0:495:3a52:71b1 with SMTP id 5b1f17b1804b1-4954aa1a34fmr30304385e9.5.1784299753303;
        Fri, 17 Jul 2026 07:49:13 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3f07esm54400465e9.6.2026.07.17.07.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:49:12 -0700 (PDT)
Date: Fri, 17 Jul 2026 16:49:11 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Tao Cui <cui.tao@linux.dev>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, 
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cuitao@kylinos.cn
Subject: Re: [PATCH v2 2/2] Docs/admin-guide/cgroup-v2: fix delay_nsec unit
 in io.latency doc
Message-ID: <alpA0tsH2cm4029Z@localhost.localdomain>
References: <20260717060225.2019764-1-cui.tao@linux.dev>
 <20260717060225.2019764-3-cui.tao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pye5sop4w5d2exnu"
Content-Disposition: inline
In-Reply-To: <20260717060225.2019764-3-cui.tao@linux.dev>


--pye5sop4w5d2exnu
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] Docs/admin-guide/cgroup-v2: fix delay_nsec unit
 in io.latency doc
MIME-Version: 1.0

On Fri, Jul 17, 2026 at 02:02:25PM +0800, Tao Cui <cui.tao@linux.dev> wrote:
> From: Tao Cui <cuitao@kylinos.cn>
>=20
> The io.latency doc says the io.stat delay field counts microseconds.  The
> field is delay_nsec and is reported in nanoseconds.  Refer to it by its
> real name and correct the unit.
>=20
> Signed-off-by: Tao Cui <cuitao@kylinos.cn>
> ---
>  Documentation/admin-guide/cgroup-v2.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Michal Koutn=FD <mkoutny@suse.com>

--pye5sop4w5d2exnu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCalpA4xsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AixjAEA9/n0vXB3k2HvRBb083Jj
tjUEjDc1NkoJGkZKUybqmTYBAPfbVswDStpRGY75PBl6pVDE9MVPM2cN0AaEGMWW
+9IE
=K1f0
-----END PGP SIGNATURE-----

--pye5sop4w5d2exnu--
