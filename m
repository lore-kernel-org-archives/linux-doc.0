Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F0934DB41
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 11:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784892113; cv=none; b=btQPljMGFQ3yOIoiX3LQAiDAExiUQfn9qs/DtBoAa1m/AcJPknAtGsaAlyijkP1t6aWjmEXfEs+2+v0LwyziR8T/P1kJE0vvIKaLmR2m3k3wFz4dV6VH06246PSojVehgtz1OvDnRZmlUaGLFulibL9CP5paktAR5Qs5jad7Gjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784892113; c=relaxed/simple;
	bh=YGGOVXEqea3GPNNbncSJ3TBlrL4MxJVLMV0LKqpWNwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oa/p2Gm739YXVWb4TjrRQ/dxEIsFt8X92Gce9jws6I/eCMoG95/D6z1WwipnHm/WFksg3V8zy7CMB6zv0lG8HdIfV5A4RP7rLcKyT3fnYTLfa+DMrD2l0SJtE+C+63ymWb/mdv8Ny6D+lEuN0U9eS3f10lYgCJ+Y5RkHDntf0ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Km21oI2G; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Km21oI2G"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4956242332dso3137225e9.2
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 04:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784892109; x=1785496909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QbZk7VXNsE8q/TG/Qql8FFHe7uCMGrC8uJ2Nzsh+oeU=;
        b=Km21oI2GY7dMvsxThkKgxh5Et8VjCQoWmgyuZfzmG9qA03HJlMkudxZZoHMR1mSP+E
         jhaE0bi2laQc7ZngdWJf6RWZwz5eqtvc5jgp6kLHFiMzAQZY5B4tRW9SI0n7abuDu0xC
         HD4nHuYlgFTxKgf7QBAbkSR3Wu3200XUHVDjkX5sa1JD2e4Qo5kSgAE3eXY/vLUtJRr1
         1VdBLc+b+okwB/6LrvyMLvLJMje503ZPehUYEbsHcRDOrEtKJ3MhpTJ8Dprh/WfU8zpN
         4uBUYBxs8wuWH6hSLejMXSA7C77zwJEz6tJotOTBu72xiuXOFWbDgNOPEs64V5ultfOu
         MEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784892109; x=1785496909;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QbZk7VXNsE8q/TG/Qql8FFHe7uCMGrC8uJ2Nzsh+oeU=;
        b=R1/GAATDXtsRNUl/mqvmo6UHp/7PwuMk/BOJUi5NI6a5BGn3EtlzTEJ2+zvm0xo+zd
         kLLNkW1G7rKt3Z7Y3xcW0hQUyGg7qn+wgTvil5WUmVpWPZYD1Kb64mK404jueXifoaJz
         GOrc6FqoTcKjHjBP53QSB9Rk/Ym+4pkfZfm4uZyrliuZufaoOFOcrEuah1vDqBUXG+vQ
         apzuJXKA8963az1Yvw+dNpaxpAZQ3ei+XAZJ5ZhuPTz3DcP6SD0Fayix4cUcxvAnoTwV
         uKtE5OTNL961NUMMWa4l9TTvHlJbYWIwV5MSQrsGQUff0W2YBA0Z7AC1D8KoZ9ta3J07
         uEPA==
X-Forwarded-Encrypted: i=1; AHgh+RrIuWU2C//ioxwMqCBL/NjaVuJKK9HeQ90rrLc4X6fhTO9//KagG1mhFtYmGveH7Hq/fqH+9PKOwis=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYmv3QUkiuNdbfd8tJKhWrWI8Hnc7K0mFEEgN4YeotFCrcVtkR
	l2Lwozk8llHcV8LeVXV5j6Lfsp1atV/0R5m0p6pikomQ+EdBptgOoMoqWxHVT431j2s=
X-Gm-Gg: AR+sD13zoscVfAzfAyi9ZnmtFEY8hgYexMW/nfvut2ylm9RPRxxO4mj3nXuCB3Sl9wc
	bP3/pcnrQO2rypMHwQykO5OwmyVeS+gNqq4bMcY31fuKtMZn+Z25XnxLFQNBXkjgVsCPBZfM3fb
	z7gMgZjykR47eubqKJ0qzA4vKMH31JD+gkTDmyaaSepVeE1xWnVZbAy/KBpMCsUstvHTRqUA2rL
	m+gxRr8T1ZXWr9FMM8EYfJWterOiJYIgecXxX3SetfiMoWqZMreA0w8oIOjNxaMkIeytPlYU22v
	gg5gYr+kXthBl1WOk46KPicCWegUZtNT5C6ssoP66HFTjWhkurjFlYFwYkgSvEUo1vIBuSxNE+W
	SeJhwKiA9OHuwmKboAQcXVUGz6Szy6kXbVnv3AS5e7F/3u7Xl/1jMuwTFfWArub1J8590t2wBr2
	WHhVTIEA==
X-Received: by 2002:a05:600c:1914:b0:495:4d00:2fc0 with SMTP id 5b1f17b1804b1-49573ccb598mr84264935e9.12.1784892108828;
        Fri, 24 Jul 2026 04:21:48 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af786e4sm63578405e9.8.2026.07.24.04.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 04:21:48 -0700 (PDT)
Date: Fri, 24 Jul 2026 13:21:46 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Shaojie Sun <sunshaojie@kylinos.cn>
Cc: tj@kernel.org, skhan@linuxfoundation.org, hannes@cmpxchg.org, 
	corbet@lwn.net, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Docs/admin-guide/cgroup-v2: document hierarchical
 cpu.max throttling behavior
Message-ID: <amNJyZQj0p38zlDe@localhost.localdomain>
References: <20260724102500.276525-1-sunshaojie@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eeashxwvkr36aub6"
Content-Disposition: inline
In-Reply-To: <20260724102500.276525-1-sunshaojie@kylinos.cn>


--eeashxwvkr36aub6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] Docs/admin-guide/cgroup-v2: document hierarchical
 cpu.max throttling behavior
MIME-Version: 1.0

Hi.

On Fri, Jul 24, 2026 at 06:25:00PM +0800, Shaojie Sun <sunshaojie@kylinos.cn> wrote:
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> index 14b8c571c0d1..3572d3e7f688 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst

> +	                                       and the resulting
> +	throttling may reflect the combined effect of multiple levels
> +	rather than any single level's limit alone (this differs from
> +	other Limits-type controllers such as memory.max and io.max,
> +	where the most restrictive limit along the hierarchy is
> +	applied).

I'm not sure from the description what the "combined effect" is.
Can you give an example where the cpu.max differs from that Limits-type
semantics?

Thanks,
Michal

--eeashxwvkr36aub6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCamNKxhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+Ahs0AD9E2MJd6AyaFbuNaCfPXmW
S6gY1qooua7uU6SnpxVthncA/RwC5B6BM4buZiOSDvt0gD85O1/7fNIv0yv0Erkc
JIsD
=wpPc
-----END PGP SIGNATURE-----

--eeashxwvkr36aub6--
