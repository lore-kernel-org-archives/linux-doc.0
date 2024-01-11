Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482D94F88D
	for <linux-doc@vger.kernel.org>; Thu, 11 Jan 2024 16:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="c4qkbO2i"
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 512705CC;
	Thu, 11 Jan 2024 16:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 512705CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1704989869; bh=DzaE1A+tlyq5He06Aa6bO1v6x4kUso9pv2ShlFV8rJ8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=c4qkbO2iVv1ZMa7k0318CKIiWXue3QUv2hOnvrrxlXed0T1rFMjzbroMikZ0/la+b
	 vw8A1er14zp5TRrTZD96ftX8cMTAL7IEZ3wmEA0wEjh5+gLZD8Kc8ckGBoEd1dyMXq
	 TLIHc+LnvkpWLuBeJGyQ6O2obd2yWcX6u9ICROD8ob/0Py+/BjJlVS2abt8wvnL7BU
	 OWGy9LtiNkOwFgBl5hyUVGV2X3nVz7qvyzNMB5jI/gtUkdYLyWKW7eXevgE/s/dIy+
	 c2PM74xLM36ozUZYlIGGNniDDG0hm5uT1djEoaUlyRCSYS12G8oqcCxyHMWuxT/ufE
	 N4oGDMwkdqiDg==
From: Jonathan Corbet <corbet@lwn.net>
To: Vegard Nossum <vegard.nossum@oracle.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>
Subject: Re: [PATCH] Documentation: constrain alabaster package to older
 versions
In-Reply-To: <20240110104646.3647600-1-vegard.nossum@oracle.com>
References: <20240110104646.3647600-1-vegard.nossum@oracle.com>
Date: Thu, 11 Jan 2024 09:17:48 -0700
Message-ID: <87frz3n8sz.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Vegard Nossum <vegard.nossum@oracle.com> writes:

> The 'alabaster' theme dropped support for Sphinx < v3.4:
>
>     0.7.14 =E2=80=93 2024-01-08
>
>     * Dropped support for Python 3.8 and earlier.
>     * Dropped support for Sphinx 3.3 and earlier.
>     [...]
>
> (Source: https://alabaster.readthedocs.io/en/latest/changelog.html)
>
> This manifests as an error when running 'make htmldocs' in a virtualenv
> constructed from Documentation/sphinx/requirements.txt:
>
>     Sphinx version error:
>     The alabaster extension used by this project needs at least Sphinx v3=
.4; it therefore cannot be built with this version.
>
> Raising the Sphinx version is not really a good option at this point,
> since 3.x through 6.x have horrible performance regressions (7.x still
> does, but not quite as bad).
>
> Instead, constrain the 'alabaster' package to versions that still support
> Sphinx 2.4.4.
>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  Documentation/sphinx/requirements.txt | 2 ++
>  1 file changed, 2 insertions(+)

OK, I'm going to go ahead and apply this, probably for 6.8.

I do think that we need to be thinking about leaving 2.x behind,
performance notwithstanding....experience says that it is just going to
get harder to support over time.  But that's not something to do in a
day, and this is worth fixing now.

Thanks,

jon
