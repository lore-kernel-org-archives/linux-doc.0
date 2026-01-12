Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBBD34B415
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 10:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215074; cv=none; b=dHUtuDaIC62dYotwHNbOJyY+2OPVEig29koqigukt40kU8D8BeJUuySycuQOgvNBnWbTviTnQVny1t0IhqPJquysn+nIIe8YD4hC/c6YpgpkbfW+v60CCCzNpnrQ3pLREJKvUzWYevDvqJ5ZA1uByNa0PW8pLxxnhmvYTUxJNqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215074; c=relaxed/simple;
	bh=d2stOG09yHhXfcz1z58368ywCaRrCh7SQR2/JCWJnCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cvl0NGdNICH3mmDkREaXBGRuko+gMPLAiZH7tLKLJrbHI2ByTyrIGXa36GJTQ6gwYgN9b8qz156GruUaW5EIA7EXYsKJ3tEElcoX1vsUnpBeDua68j1DW2YiCR+VfmuqrRby9Ame/sH6UzEjJhkog51MrFQE5RF5fMz2g1elQr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FbpRmhZx; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FbpRmhZx"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-432d2c96215so3151661f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 02:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768215071; x=1768819871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BbnNA/ao8/3Ln3FmkTUo19ha4VBC3QnDgXcQ8RvPuJA=;
        b=FbpRmhZxFqFL4BpKaF3UEL0Q6vVK6GuyNq7JavFW9XJ3pxnlDCHmrx5x8ZxwbzEtV9
         Xsn2dVnCvn99BqVK/22Yh6g2gTSUewOZqP7hywuEblaHLTMNBdxf2mYCMbS9KxbUMBXH
         3sqTMSr6skz7eXU6nNTWyKfmnNo2BmhtwbrF8Jgt3MMQ+xhMymRdhFGBj1duMNfVUVXw
         yo0HfKcqpSAsUCeaYaJAFPIlWBA/sOf730153MXOi7SS3me+IP4VBxqU3yHn5plzwDef
         B4eJynKe+BGQdzXlod/ed7790FXejMXtMwA/iVe7E7bqTtcgDMe56eH5dbsrFRh5E6fR
         4RRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768215071; x=1768819871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbnNA/ao8/3Ln3FmkTUo19ha4VBC3QnDgXcQ8RvPuJA=;
        b=U6h5UnBgDPNCIPqz9uEHRW171EkmZMiNMOPGt1LT33KEBHVEiboDZU1Tdy2JYPyw7I
         J5hcQxxAREofUgaZgLp+wIlYZD+YO4dcOo7vA7si86+V2TxpqubFdj4bnQOPf0YNOetp
         KQe/Nk5esr1KkKUYt060n3w4AeoW/wNr7JdhJP+du/xu7zxZBZ61JDDmbauQ3kL1iBGj
         6ttfYIXciECybXEn2XSIkTyB18avptttMCSXPxqC4UGcRwOBjom7NZwfg3xPiuDaUlwO
         AVunfT5szgfqr0Vs8GMaUkknXB9Mn6iXI8QEDOYeJQ13w+U9GIwQP9maC5l+VjuYl4BJ
         6awg==
X-Forwarded-Encrypted: i=1; AJvYcCWqTxad2512WxxJRkJAccux/LNzun5mD3CErR7A+FANz2FhcK15KJc1Wxb54m/ZdqoPZIyjyDAOaww=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+kPVDpnaL3SrM5MIq+jJujK/FRaLx3VtQde0BUWYabDVQ+dRM
	aJRXnFML+qhv21JyWG07dRQo8t6KAGshm8LdDvROOS1yEF0I/dx8hKjbOHpX/Hi2vb0=
X-Gm-Gg: AY/fxX4U/0AFjh276rHPB3L4U4W1XqYXhaEGAaw31htOU1yW+8epLjB/YsaSc0T4EWf
	KJPh6m8fB0/je3vQ2rS4uzjDKCmpKinWUXefvuiumTyBW9B+qqwKlOxymBchrYRU9Hit/ihCBeW
	kre135dJOhHKX/hlgF6buPuFj4ICCaUZ2+iq4PusCvb5pvO/G8Img0Yp+NErWb+weQGjWftyyEc
	jnvrtoIhakDbHm1wqJsDxI5gezPJKiXcUT3nADzj2G689CWEnluFOYpsN6eS07wfkRBTm2ObmcR
	4N9SyOYaLipfhWh1pZ6ETMYA+Itx7nZMc5OEBkUPDCq1D20RwIM+odkWFM6osCaDmnAlT5Do0g+
	MboFejii3QMxsTMlCLSHaL+ceo+SXIOpY1Kji60gdQt05M84ELXLQgxv5DzCQZTiePK4Y1J2CX3
	qtpYvnb2wYuAoyiQxnpYHpUX5pAt0Y+EY=
X-Google-Smtp-Source: AGHT+IH+Khm6su1F8LUf1cesIsikszUVjZeLHQaUjpzyZCvwEGQobilC3JrtRYG8ZH5GDGKVjZ91jg==
X-Received: by 2002:a05:6000:613:b0:431:855:c791 with SMTP id ffacd0b85a97d-432c378a0e4mr20292971f8f.3.1768215070936;
        Mon, 12 Jan 2026 02:51:10 -0800 (PST)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e1adbsm38477364f8f.17.2026.01.12.02.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:51:10 -0800 (PST)
Date: Mon, 12 Jan 2026 11:51:08 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Waiman Long <longman@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	Sun Shaojie <sunshaojie@kylinos.cn>, Chen Ridong <chenridong@huaweicloud.com>, 
	Chen Ridong <chenridong@huawei.com>
Subject: Re: [PATCH cgroup/for-6.20 v4 4/5] cgroup/cpuset: Don't invalidate
 sibling partitions on cpuset.cpus conflict
Message-ID: <2naek52bbrod4wf5dbyq2s3odqswy2urrwzsqxv3ozrtugioaw@sjw5m6gizl33>
References: <20260112040856.460904-1-longman@redhat.com>
 <20260112040856.460904-5-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5j3aaen3y3pbtxcu"
Content-Disposition: inline
In-Reply-To: <20260112040856.460904-5-longman@redhat.com>


--5j3aaen3y3pbtxcu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH cgroup/for-6.20 v4 4/5] cgroup/cpuset: Don't invalidate
 sibling partitions on cpuset.cpus conflict
MIME-Version: 1.0

On Sun, Jan 11, 2026 at 11:08:55PM -0500, Waiman Long <longman@redhat.com> =
wrote:
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admi=
n-guide/cgroup-v2.rst
=2E..
> @@ -2632,6 +2641,9 @@ Cpuset Interface Files
> =20
>  	The root cgroup is always a partition root and its state cannot
>  	be changed.  All other non-root cgroups start out as "member".
> +	Even though the "cpuset.cpus.exclusive*" control files are not
> +	present in the root cgroup, they are implicitly the same as
> +	"cpuset.cpus".

cpuset.cpus.effective (that one is on root cpuset cg)

(This was likely lost among my v2 comments.)

--5j3aaen3y3pbtxcu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaWTSGhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIACgkQfj0C55Tb+AhAKQEA5MnoTf/ZgNMJd2RCvY+5
T8yKXr1El8dcvCqPe2apCssA/Rojz8LiubJgbDgSox/wtvX4dX+cs6YxgNKyvD3E
COQJ
=UJle
-----END PGP SIGNATURE-----

--5j3aaen3y3pbtxcu--
