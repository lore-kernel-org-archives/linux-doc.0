Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535932AF16
	for <linux-doc@vger.kernel.org>; Wed,  5 Mar 2025 16:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741191360; cv=none; b=b8wPYi5cWXeQhrPna+s9564Xjrzk5liZlc4mLXC5q9ZldD16CEIFnC6U9D2xzett0OFTSGguwRNCdvpQBgirkN9KwsssbBJ9GBdOdsy+1Od4ZIGlw0GillwNXAzOtm4BnvGJDZvvLfRj6xcnpnNX0nVXGtJkxL0Ilv0tDof7g/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741191360; c=relaxed/simple;
	bh=fv4YhRvlWbb2xsBRPo+vB8HbRXMqdTqTfwRar1qvmx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nO485fZc6bK+uvaXRlIUacnoelZWDb2BEKAKgUfAyPCGW8zx/wv6f8lCFU9j+MJFbtdZmXA7IQCGpXBcGNTlBXsAFPZ2Rax7/hNo+TNnEMREMZ3Dq+g1/qgBEkf2SG7sPDYsEm5eBqbclyHm4Aru4JXHxR5w2bNtLp+y2lfc0M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=elU4xBBE; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="elU4xBBE"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-390effd3e85so5486392f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 05 Mar 2025 08:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741191356; x=1741796156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PNAB44QyhnX4KFdgTgmL60qRg10qylEcS57fI8BPRcw=;
        b=elU4xBBEmJhkTMqQ484vLEvFMK7m+hheKUitkLhNtXdoiIP5glSwKQPE2kOQvSDCQr
         jD7KUAHnWsxjV4UyQU/5ITcXa7/Jpans53w4omNE4c1Bs1UaOFY/9sE/bcezQUQs+FhY
         nuR8iQLKnKicUmIbLQ+ZiBxfrSFnlrwX292pSoIeKnutTy0eFNzwaDc/tpXz7Eb080fF
         RKni5sr6M//lpq+HXifkHZUvEzL7gNMii7VCX7F02s1QlqpYr3ULkTArOpGtcHMqObF0
         PKqhuQkH6XyXlYKBbw+11iBaxETGI4bvki887+ebJR+FeMnPLx96hdROq+lOV27y2Uhz
         WSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741191356; x=1741796156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNAB44QyhnX4KFdgTgmL60qRg10qylEcS57fI8BPRcw=;
        b=Mo0+PxeXaSzQOk7QxinO0lOah6m9WZOZbwns9MvKb4qMOQo6zBIH+VJPgDBpghf1Tr
         3Sj9AT1qmv7sI6Iti2araMlKNx9ebBiZ5bv6UKm7W1EC1BWKfrjigU8Aa0GOciqh/YrW
         P+Czg8bN5PmhrzbM2DrYFqDJgvxTLrWkW6NM5iZTUuwNWgfroCI5xJgU36ALvPOyZE+i
         UByFHyqtbzIZ7mPXht4FozXPqFjB7jt2ncsoR03Ni+p8emvlUrCjjZCkq2nX6EePotZx
         jkZmN/2qWg4uJ8sl2bc3mKOTpKhUcoD26Y7RSMJk8hdcAVtCtL2vHrCx19XUHIL+Rc/3
         Qwxw==
X-Forwarded-Encrypted: i=1; AJvYcCX52FqTTxfFrGYQWKPZxTnExckcddEHw0LXKPlmMoog5BOAB+jpkQ5M3tyHp2P/rfajxy8jYMr6eUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGy3IKc+gXBJGvrWISrMwNfTkDneu/Oi8F7QYO9cHtU4Bh4JV2
	BRI0f6Os7SDhG7B2YFRd0BbW09znK4UinNt0JzJ3C+E1l5kdAnOFI25L2LKBIu/l6zbrQgwM42K
	OBnU=
X-Gm-Gg: ASbGncua5ThOPNMXWqVY4f6ARDHvLreCiLH9lApXqTT5RdWEknnzjsOE8sHia155rY4
	m5lx55OuMlRe27pI1qCYPuxTbC39+TG2asKK5AA9Sd6KeMkViXU12C/IvDrP0Z+ugJXzVmGxmwl
	M4s9NkH+wgX9nYbU3n1cry64VQyhrI2/8At4I7Mu/HpGIn0SsTeXAZMQTGQfik7zNKLVS8rh+Fp
	sZja6YhtezmlkuOCK/q52/nIDLpGXDaW1txqFm9F5yqQIfQQeziaoBApqONQCUcqIt88t9Vcv7J
	VEtZVfTGITH9sCFIa4ITkJCS6+6x1WtOkfz+Zcm3lG1mbnM=
X-Google-Smtp-Source: AGHT+IFSFHy1G7JXs9LS6Zp9vf6qrgDOnTuLsUnVpuP6RU8IBq/z8lBT5ioxtv8qoOlGoLHFx2uA7A==
X-Received: by 2002:a05:6000:4185:b0:391:5f:fa4e with SMTP id ffacd0b85a97d-3911f7476b5mr2262201f8f.29.1741191356432;
        Wed, 05 Mar 2025 08:15:56 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b7ddesm21704636f8f.57.2025.03.05.08.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 08:15:56 -0800 (PST)
Date: Wed, 5 Mar 2025 17:15:54 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: shashank.mahadasyam@sony.com
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Waiman Long <longman@redhat.com>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shinya Takumi <shinya.takumi@sony.com>
Subject: Re: [PATCH 1/2] cgroup, docs: Be explicit about independence of
 RT_GROUP_SCHED and non-cpu controllers
Message-ID: <h7xbvvv3727yobsl7vx3vvcpqhdulagmogbuulp3dny4jgggym@gb3yaeuiuwa2>
References: <20250305-rt-and-cpu-controller-doc-v1-0-7b6a6f5ff43d@sony.com>
 <20250305-rt-and-cpu-controller-doc-v1-1-7b6a6f5ff43d@sony.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mohu66pwpewgjwac"
Content-Disposition: inline
In-Reply-To: <20250305-rt-and-cpu-controller-doc-v1-1-7b6a6f5ff43d@sony.com>


--mohu66pwpewgjwac
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] cgroup, docs: Be explicit about independence of
 RT_GROUP_SCHED and non-cpu controllers
MIME-Version: 1.0

On Wed, Mar 05, 2025 at 01:12:43PM +0900, Shashank Balaji via B4 Relay <dev=
null+shashank.mahadasyam.sony.com@kernel.org> wrote:
> From: Shashank Balaji <shashank.mahadasyam@sony.com>
>=20
> The cgroup v2 cpu controller has a limitation that if
> CONFIG_RT_GROUP_SCHED is enabled, the cpu controller can be enabled only
> if all the realtime processes are in the root cgroup. The other
> controllers have no such restriction. They can be used for the resource
> control of realtime processes irrespective of whether
> CONFIG_RT_GROUP_SCHED is enabled or not.
>=20
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> ---
>  Documentation/admin-guide/cgroup-v2.rst | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
>=20

Acked-by: Michal Koutn=FD <mkoutny@suse.com>

--mohu66pwpewgjwac
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ8h4twAKCRAt3Wney77B
Sa/MAQCsVpx3ngjUqnES7cUlQY3BJhxMyIKDkx8/OleeglUqqAEAxOHtAu3BJJAS
Ccs3+43hdTpTkLZ4OmOk8HTZf1FlMgA=
=478H
-----END PGP SIGNATURE-----

--mohu66pwpewgjwac--
