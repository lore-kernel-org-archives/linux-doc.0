Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A3123C4FF;
	Sat, 13 Jun 2026 04:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781326525; cv=none; b=CiKoUhWE7Glo2cBpXk3aNzVnuNGTMJ+Jc6vYNHzbbNBN+h5RBiZVvonBNX3/nyaR4628IQwM9KW+//wwlt2ri2Efxea2CGYdgyfPT84aKx6/GWeRLXMm93ThEeDPw1s6N3ZhItwSjPp+A+cRPnNF7r29FeU1HAQuITN5nbETa0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781326525; c=relaxed/simple;
	bh=ZeoGa1ewmhjJZ09pi9xR1V/Rd37Ks0DWdRA42OUXz80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GAI79h/H69t7aW0jyJzHxNPBJb32pcrJa0HoA9rJzvhbQUK+EHcUvIDCc8tAGW54IVBMBFozzAFv/V+qML0EBZk0yfTau5y/pBG8S1TnQppJ/mpTbiv1/HKR6HVHkj6vdjbSZ56qALjUkRdlrVQW99ZD5fQYBUn0YfJNMJMdn/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VpGWOA5O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VpGWOA5O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 724EB1F000E9;
	Sat, 13 Jun 2026 04:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781326523;
	bh=abm5AXw1uLIy2ex2jA1De6T0yo+csEjm+fB1Q1Ub6dM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VpGWOA5OmxKHHi1Nfiw4PrXtyO5qxnDqrcaKAmQBdzjsxd/qepovq00ZGAo0e6ai0
	 rUx7DEJFj2Hh5+DJ/OxOn+v/9HYT3bmaAi6KD4SzKh9BAnUDNbBDDbmyaFB07PfjaO
	 FMcFo2o5xqlmKAQDjczRccdrEoDoN9nTB4TkbGEZwxhxiZwbO0eHTTKJId4vc9Rc5d
	 1r812sh5yBW5MRYlzmDixkS8dMNy9pI2gxZWxIYB11QHfbeHHbQOjYikzk2H63LnKU
	 76d5+0o0gUz4PsaoyJFNoSFJdJr+LA9D4XlEziibL6DpGyB7k65pEs9DJl9A0iU0BS
	 4lsc+M4c66a8Q==
Message-ID: <25a57a12-0405-4469-8fe8-42554b98e523@kernel.org>
Date: Sat, 13 Jun 2026 13:55:16 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm/mempool: Untangle CONFIG_SLUB_DEBUG_ON abuse and
 switch to static key
To: lirongqing <lirongqing@baidu.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Vlastimil Babka <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>,
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc: Matthew Wilcox <willy@infradead.org>, Usama Arif <usama.arif@linux.dev>
References: <20260604110318.2089-1-lirongqing@baidu.com>
Content-Language: en-US
From: Harry Yoo <harry@kernel.org>
In-Reply-To: <20260604110318.2089-1-lirongqing@baidu.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kBl0Fyz5hJPGyvSUKszm2dfA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kBl0Fyz5hJPGyvSUKszm2dfA
Content-Type: multipart/mixed; boundary="------------Y3YSJpLruN4AtA10Yc7JjJuh";
 protected-headers="v1"
From: Harry Yoo <harry@kernel.org>
To: lirongqing <lirongqing@baidu.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Vlastimil Babka <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>,
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc: Matthew Wilcox <willy@infradead.org>, Usama Arif <usama.arif@linux.dev>
Message-ID: <25a57a12-0405-4469-8fe8-42554b98e523@kernel.org>
Subject: Re: [PATCH v3] mm/mempool: Untangle CONFIG_SLUB_DEBUG_ON abuse and
 switch to static key
References: <20260604110318.2089-1-lirongqing@baidu.com>
In-Reply-To: <20260604110318.2089-1-lirongqing@baidu.com>

--------------Y3YSJpLruN4AtA10Yc7JjJuh
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 6/4/26 8:03 PM, lirongqing wrote:
> From: Li RongQing <lirongqing@baidu.com>
>=20
> The mempool subsystem historically wrapped its debugging logic inside a=
n
> merely defines compile-time defaults for SLUB and caused two flaws:
>=20
> 1. On production kernels where CONFIG_SLUB_DEBUG=3Dy but
>    CONFIG_SLUB_DEBUG_ON=3Dn, mempool debugging was completely compiled =
out
>    at compile time.
> 2. On kernels with CONFIG_SLUB_DEBUG_ON=3Dy, mempool debugging stayed a=
ctive
>    even if a user explicitly disabled slub debugging at boot time.
>=20
> Clean up this mess by removing the #ifdef and switching to a runtime st=
atic
> key (mempool_debug_enabled), allowing mempool debugging to be toggled
> cleanly via its own boot parameter.
>=20
> Suggested-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> Cc: Vlastimil Babka <vbabka@kernel.org>
> Cc: Harry Yoo <harry@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Hao Li <hao.li@linux.dev>
> Cc: Christoph Lameter <cl@gentwo.org>
> Cc: David Rientjes <rientjes@google.com>
> Cc: Roman Gushchin <roman.gushchin@linux.dev>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Usama Arif <usama.arif@linux.dev>
> ---

Reviewed-by: Harry Yoo (Oracle) <harry@kernel.org>

--=20
Cheers,
Harry / Hyeonggon

--------------Y3YSJpLruN4AtA10Yc7JjJuh--

--------------kBl0Fyz5hJPGyvSUKszm2dfA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQQQ1ub6gR5ogjaKRmOGXBN6rc5S1gUCaizitAAKCRCGXBN6rc5S
1ocAAP9Od01upxVUp6/B5+mytUB+pFRAu4iQyQVIsZWljSeLYwEA/xvWpFb8PAZk
XY0hCl0hv/IQf7MZaAWjUV7fMEcNyAU=
=yMi6
-----END PGP SIGNATURE-----

--------------kBl0Fyz5hJPGyvSUKszm2dfA--
