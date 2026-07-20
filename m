Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85CB433BAC
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 15:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784560066; cv=none; b=FLXt/CcpZO0cBEhiiJbY2uzYAyyDmC1TQD2CDKu1Vy8vRyAlYt5xoxv1+oCN5j7aniZeOas0/ureekJCitPODPvK8NZnoJB6vQexdoin68XUakhglSMM+AsWbPg0lBcWBWtH3qDFo74NNmkpClWI7LvDSLyAysqCcjLhGj+TBHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784560066; c=relaxed/simple;
	bh=kZekYJjdgA9jTrzaGEtUfryy0E1YgJzlFnQXBMIRaKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AUcbA40wpHqkOc/TbuMGfqEgI9wmfEjTLFYzB/cwdzEyuxhRgt/gkwqDxLKTs+nC8uDroJjFl8EY3oJlhj+uhbn+VjId0Y1joQJPtIq906GJ0n4M3XDQX/MxMdFYAd/wPUnyBmisihix1nGseFpjLAnp04+cPwo5QbUnzIWhMr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Nq46wl7g; arc=none smtp.client-ip=74.125.225.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Nq46wl7g"
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-495501e57beso6864505e9.1
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 08:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784560063; x=1785164863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kZekYJjdgA9jTrzaGEtUfryy0E1YgJzlFnQXBMIRaKc=;
        b=Nq46wl7gxlR152+ZG41X3BSQ0vuIxUtf8Y08Yo8zunhwOLIlMma879FXWFJn5PLcRR
         555sM50uVPLk5ZknHfz4KTc1aIrrbzY3f5MuxUHFFGZpHQLhAwTZqU508wEFPLpjZXAD
         MiJPbXs2orBAJpiCAZSKM08t3sPBTTuZmn/BkGPWUNSM0dnF+rhHdHnfAxSprSlLzoM7
         95MUkD9xlykP4wrNzpxJ+zEI5gur21dkt3qdjNWJIdtEY8iyUXKiJF8uCtqfq9YdhBAH
         nJRFz+2Zv6LCOpxk+gGspY55H/i/J46UcIg3Pga2z68xGhIYUqrlfB5s8VtIQWOnmZuB
         Zszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784560063; x=1785164863;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZekYJjdgA9jTrzaGEtUfryy0E1YgJzlFnQXBMIRaKc=;
        b=jqN4NBbtROUoR6CGscWG/qVYVLFwZvETXKmAFsrKakdaalx6cQBbcZCAlDl78rWCuv
         V10tQQutP8lmGY9eEYsI6W8wbljK57daQOuKT+2U+01IV+uKukd0kSk/gqCd7c43j90Z
         fvBy/6SXJxlaL/qXj4WAbrhoEe30Mfk07sekwCRd4qzAj1OGlvQT/F1CIpgWT3rNBzNX
         KiaxgJUOPEdOiBVs90zuC5mDq/LO7xiVWMqz8hCh/hfp+vXJjmOPbKF1SsVbd2CwZLQT
         cDLkU9tW2CQZ6+PthyZzpAtZT4kvNkb+f8k/fEwPJ8jgYsVc4Byvc05vxLBxQu7MxU7F
         asHg==
X-Forwarded-Encrypted: i=1; AHgh+RrMxQB4VhQXQiN8IFFkrgGPt2TuSfber3kaA0u1DgdutRhLVtvcefSTMApMNtMUzWc3PxoNnhRqf/s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy4F5dcP/qPlSnfH0v2kWBJl6F0c5qbxLvsOkRzncHxHScXcpK
	YNFqdtvxaeVkwDtAn7Q45zXMcWAohh/+39l3iSI5BQ+HuV17gFp9Ri/8nO+Nn8gP2mk=
X-Gm-Gg: AfdE7cmURkpBarcQh8RN1eHBtVEvu13vaPNBZpRGpC0mjaScQ6pqIvMUR+TQtsEACdI
	AiHD+gAAJHyyDf1N19/5EdS6hc8xoki9M9Pe8bl1SUuVlL0WdgVTNMHMPboxFgOjFkdq1/ZlmOi
	7EriZk+qNEXnotGfe3HdIXAxawbCILCO3vHtARdHCHFemtNMUsZ3zv5TG9+tLIWu4F0WdsIXsTg
	FaaWIcE09wufauYxDK3OMrPoCDKTwo7speQMpYUQUumAIzUpLAqmtDOSig4zOq/I7Y+l+gfrHCF
	W83ZTI1i2EIM4NxY/lPAmuJ1Zj7xOhA1ewdO40SbK36qtk81o0B2oLxFeoBcyxcIP4hvtKDRy+r
	KP3KcU6PGHZqpgEQoQdMBBSm0oDLhJNmUtMIxphUsq6w3Pc/AOy5mJzwICTGbZiRQOcYMfScAoZ
	8UfqpNHw==
X-Received: by 2002:a05:600c:1986:b0:495:64a8:c35c with SMTP id 5b1f17b1804b1-49564a8c364mr5779205e9.24.1784560059737;
        Mon, 20 Jul 2026 08:07:39 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2aa698sm264192565e9.4.2026.07.20.08.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:07:39 -0700 (PDT)
Date: Mon, 20 Jul 2026 17:07:37 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Tao Cui <cui.tao@linux.dev>, cgroups@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, cuitao@kylinos.cn
Subject: Re: [PATCH] cgroup/cpu: document cpu.stat nice_usec and
 core_sched.force_idle_usec
Message-ID: <al45RUAYKgGt5IYS@localhost.localdomain>
References: <20260718080100.2334415-1-cui.tao@linux.dev>
 <20260720150226.926730-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6epftcfwmdm62r3v"
Content-Disposition: inline
In-Reply-To: <20260720150226.926730-1-joshua.hahnjy@gmail.com>


--6epftcfwmdm62r3v
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] cgroup/cpu: document cpu.stat nice_usec and
 core_sched.force_idle_usec
MIME-Version: 1.0

On Mon, Jul 20, 2026 at 08:02:26AM -0700, Joshua Hahn <joshua.hahnjy@gmail.=
com> wrote:
> I have to ask, which tree is this based on? I can't seem to find a single
> tree that contains the "(including those in descendant cgroups)" section
> anywhere.=20

It is most likely linux-next which contains a nearby modification from
[1] (or it was based on that regardless).

HTH,
Michal

[1] https://lore.kernel.org/lkml/20260629060636.200118-1-sunshaojie@kylinos=
=2Ecn/

--6epftcfwmdm62r3v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCal45tRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AjM6gD9Fm0pi8Et/bcFqnkqiw4H
49e+XSsvzEjwawApGizXmPIBAJkcQKWuepD6r2fr/W5aFr5Y6UcGdVKXnZjLgnh+
XH0N
=qiy3
-----END PGP SIGNATURE-----

--6epftcfwmdm62r3v--
