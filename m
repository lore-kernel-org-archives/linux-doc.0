Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A3420D4FC
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 15:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768230515; cv=none; b=f8ihMm/Vo/3pG5hUBq88nqAKE7+vcuKkQwUx8BIuCX+QpbyH1FZ9Zm+fHDe+b93qLuL/+MeGtliOcFQCzw9C777EWAbPOLSCqvCJWcv8lnEQaqJkoaJkCD+jv3m/ulHL4Yl5cKq7Ze1gVr+lyvwtqeHKt6dfQiA3u4KNeInzJ0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768230515; c=relaxed/simple;
	bh=2LlAdcFOMuNXqy8VLk9nvlKy5s1t5Qbb33Ri0Pt3etU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=beHzX0CZRQf82GKzXY+JG7GM1uWWEf4wMWFEpw8O3c32rVb1z3Jx14HQhz25vkPgtx6J9T+U0ry0KdPEccxQNhp8uEVGJ/mXNGNeeVGxg/M42paMxQ5qHK33qdi2T4wxhYN4UCcaLuEGQIeCnld6Do8eLoQbggi4c6yQffHBlBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DP6dRaIZ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DP6dRaIZ"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so5437636f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 07:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768230512; x=1768835312; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2LlAdcFOMuNXqy8VLk9nvlKy5s1t5Qbb33Ri0Pt3etU=;
        b=DP6dRaIZSrMKN4qVhz6g/WgTf35PDGl+VFZw/EDha+a+cA+3myVw7WOKXDS2So94Py
         DA2TSiGdlx7nLSwpNWFFEcPXM0d7rfzwJP2IyDsx/sH4NBl75K3RnJD2wt5JjtTLn6We
         bqm965mwxDAZwKLgGKNK6h03qUwhbedVdPgBW+EGOpWDW73Iiy8NXxB9WFcNGeMEC4on
         /qGWZMeZzRuPnsd/VGPHYkacC+hziO3XR+tY3flqQ2Hbmqm7RPaAya5r57Ag3Nm26T41
         Hhbf1O1W8scP3LJR8TtakvX2HMOvGOU78+A4KwNEzQ3VdDcqb/D0ivWaaWyNTcASpOL3
         8ANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768230512; x=1768835312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LlAdcFOMuNXqy8VLk9nvlKy5s1t5Qbb33Ri0Pt3etU=;
        b=fo6GNx0FKhhfWL03vrloxFxxQOn5nCLP5luBp8jbakLPRRhjvgHd66thJwJ3jPWo2C
         ugUghrx+0H//qf1qnbwZDO61H6LRFNOUf7ZPdJWLfJecmE1uWebXuk5ULX+Ii3egMjL6
         gbmTKp1hztSZwUqmPMvNlee/YXY0pMRljV/6CAHkUcnU7qmIUVy76IcgM1LyB+cw2XPs
         kB/iotQsuxvqwTeT3d5mjGmWQkZ0kWN/R+nayeBD7jcPfEyFclibSJKmh8ROeqnugr5q
         SFhQB9+JBfiGT9HP9D0n8mJUqRagJZoK9okrBuz5UmD/HuTZRi5Mpqch/v/dxR9xQ9HW
         r3+A==
X-Forwarded-Encrypted: i=1; AJvYcCWWEfFwLi3jRycex9s4Ma+IQ7uKH/dWE9uijcusn/HOvmCB/c1ZpX9DIcNu7OJDaS2OXysxOhFuP7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvEkJoT/ZMjvrOt34+tKdbggsTGMNTzkO+QOzAf0hMD+Np2ycz
	AasKtHU6I8VgXoTnSH+5+Q0UgyKfAryYeL6l4qd3A3IFDMY+bidNdKJhvdEzjR6+dDc=
X-Gm-Gg: AY/fxX6HjZy9g4Nrq5Uk9LZ4Jwe4dM2grPVvpiIBCOl3DnjHUw9iMU7CaeHjA5IHmAd
	IIe3MFAS9RULB5hClQ5+kMSlJPzSgTDi2S59GEj6tTBqP8iwFmOXCDIK97vGkrB7aksMKul7SIX
	6lJ9ODWWLRrakaPwiXKn35yXri9MkOFOXjJssWAvkp1Z/ZGxZ/aAex5ySNqboZZ37nSBFt18NO2
	iG8Qhp0AjAAXxVa/aq6GPG0AJZ3/7sohB/nKzDprfnE3faBwz4kY4RmrVGlsShab0PPqWNsUbhZ
	CF7LWy9gfnelJRUu5QmQ+OIEP+4ilLzk31rKJGJr3BivAzV4Pq1o+8AXLzNL8X/uHW1GXNJ9I1u
	NctwnoqwiVv/Qmj3Qw1qT2ilBxR5ka/ngWZYgSN2OdPIg0Zl3muWpk/a8WV/iD/vUINuhLOLMjT
	hScenDaz/5V6iaGa3N7z8/0JPcmLk42Dhqb69BJQUZ+Q==
X-Google-Smtp-Source: AGHT+IHKV1LEX2Kg3/u/Laf0CuUnSDbfVay62iMr9BZEu/EkpT7Nz24/p9OPfOdHBurpeZ+kYCwV8Q==
X-Received: by 2002:a05:6000:2311:b0:42f:b707:56dd with SMTP id ffacd0b85a97d-432c37c878bmr22055424f8f.33.1768230512058;
        Mon, 12 Jan 2026 07:08:32 -0800 (PST)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16f4sm40089995f8f.11.2026.01.12.07.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 07:08:31 -0800 (PST)
Date: Mon, 12 Jan 2026 16:08:30 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Waiman Long <llong@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	Sun Shaojie <sunshaojie@kylinos.cn>, Chen Ridong <chenridong@huaweicloud.com>, 
	Chen Ridong <chenridong@huawei.com>
Subject: Re: [PATCH cgroup/for-6.20 v4 4/5] cgroup/cpuset: Don't invalidate
 sibling partitions on cpuset.cpus conflict
Message-ID: <uogjuuvcu7vsazm53xztqg2tiqeeestcfxwjyopeapoi3nji3d@7dsxwvynzcah>
References: <20260112040856.460904-1-longman@redhat.com>
 <20260112040856.460904-5-longman@redhat.com>
 <2naek52bbrod4wf5dbyq2s3odqswy2urrwzsqxv3ozrtugioaw@sjw5m6gizl33>
 <f33eb2b3-c2f4-48ae-b2cd-67c0fc0b4877@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="57d4b62ug42tsq4v"
Content-Disposition: inline
In-Reply-To: <f33eb2b3-c2f4-48ae-b2cd-67c0fc0b4877@redhat.com>


--57d4b62ug42tsq4v
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH cgroup/for-6.20 v4 4/5] cgroup/cpuset: Don't invalidate
 sibling partitions on cpuset.cpus conflict
MIME-Version: 1.0

On Mon, Jan 12, 2026 at 09:51:28AM -0500, Waiman Long <llong@redhat.com> wrote:
> Sorry, I might have missed this comment of yours. The
> "cpuset.cpus.exclusive" file lists all the CPUs that can be granted to its
> children as exclusive CPUs. The cgroup root is an implicit partition root
> where all its CPUs can be granted to its children whether they are online or
> offline. "cpuset.cpus.effective" OTOH ignores the offline CPUs as well as
> exclusive CPUs that have been passed down to existing descendant partition
> roots so it may differ from the implicit "cpuset.cpus.exclusive".

Howewer, there's no "cpuset.cpus" configurable nor visible on the root
cgroup. So possibly drop this hunk altogether for simplicity?


Michal

--57d4b62ug42tsq4v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaWUObBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIACgkQfj0C55Tb+AgfBQD+LRMv2fmPFzKZKYK7xH07
xkhePTg1NW33sf1/vTxdhDQBAOhjME1GIwRPEdrHWZa/OJA8akS3jrgvjUc32oNZ
W/AE
=x6DT
-----END PGP SIGNATURE-----

--57d4b62ug42tsq4v--
