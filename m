Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35231A6830;
	Sat, 13 Jun 2026 06:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781330524; cv=none; b=tzd2m/KzND0QCeHNSITaDw5gdW6mK6zziwew/6ZbgKG6Kx+wBOtsHvCUFO3TEutKtTuDjYXEBd8zpltqlamJJBtrNNS7jDMqvu6p46ClcldwvTxWkoFLjCHLWWVhSuxsRaaT0TizhQ9oI1J0FzohimFS1CX2O9dHHdtS4EbNkPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781330524; c=relaxed/simple;
	bh=iM1mm9BLVP7BwrpS2cLQRgYuPWTuEt/5Kbci/3Gxbh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GzQF58crxBAY3K9jbEhih9LCpXA4o4ssAn2+WFUaTairCyM17nsIZRz9qDxTPXqu5VitH74UcpToJIYe76xqr0eSR4TkoTfZLNy0hrEaLIct6JpBMHMiw6f049TvP0Y/n0061OWf+/AvCxHq3/rlYGTQoz6z1ATPRL10n6HR2/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gn8YLTHL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gn8YLTHL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540F51F000E9;
	Sat, 13 Jun 2026 06:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781330523;
	bh=iM1mm9BLVP7BwrpS2cLQRgYuPWTuEt/5Kbci/3Gxbh8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gn8YLTHLhVP/c8feGWDahVIvnchCQMGLG4RFcYZz7U5vfzJMPAYwSWpO3l+bum5Yp
	 yYVZeGUpLpWQoiIWZ3CagYJH7uDtAj4a+3bgZazJV6VjvOSZcm/eYHWvNCrghC3OmA
	 HDcOfIOqAfhMOvk+KSkc5lfarC27x23VLGwwNMOS8ehWwrYScuB72B06B3AghzSClX
	 U1P3lGcR8zBvX+xJofkA+hEFEnCvbkWuyY2d3JFfdE87mGglKoTbXro2Nw98nfQnII
	 /Ssza1aGy6TMF9xqrzXbqcIGQJ86rWyNHK4Wg5IJ54jgzSUUT+Bmq517mdRx5NnOtc
	 vZazN7fU3JOdg==
Message-ID: <763e61e9-9270-4057-938f-daf9184a41ae@kernel.org>
Date: Sat, 13 Jun 2026 15:01:58 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] mm/slub: preserve previous object lifetime
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
 David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 liam@infradead.org, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260611063926.38111-1-pengpeng@iscas.ac.cn>
 <55b1b674-6487-4585-8a0d-919373e66d3a@kernel.org>
Content-Language: en-US
From: Harry Yoo <harry@kernel.org>
In-Reply-To: <55b1b674-6487-4585-8a0d-919373e66d3a@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Pry6HKXvR97fF73yGuINWk3U"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Pry6HKXvR97fF73yGuINWk3U
Content-Type: multipart/mixed; boundary="------------l598mhoMA2K7tROMKi453KGs";
 protected-headers="v1"
From: Harry Yoo <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
 David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 liam@infradead.org, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <763e61e9-9270-4057-938f-daf9184a41ae@kernel.org>
Subject: Re: [RFC PATCH 0/5] mm/slub: preserve previous object lifetime
References: <20260611063926.38111-1-pengpeng@iscas.ac.cn>
 <55b1b674-6487-4585-8a0d-919373e66d3a@kernel.org>
In-Reply-To: <55b1b674-6487-4585-8a0d-919373e66d3a@kernel.org>

--------------l598mhoMA2K7tROMKi453KGs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 6/12/26 2:28 AM, Vlastimil Babka (SUSE) wrote:
> On 6/11/26 08:39, Pengpeng Hou wrote:
>> SLAB_STORE_USER currently stores one allocation track and one free tra=
ck
>> for an object. This is useful, but it loses part of the previous lifet=
ime
>> when the object is reused: the new allocation overwrites the allocatio=
n
>> track, and a later stale free can overwrite the free track.
>>
>> For free-after-reuse bugs, the report can therefore contain the victim=

>> allocation and the stale free, while the earlier alloc/free pair that
>> explains where the stale pointer came from is no longer available.
>>
>> This RFC adds an opt-in SLUB debug option to keep one previous complet=
ed
>> object lifetime. The option is disabled by default, is not part of the=

>> default debug flags, and only takes effect when user tracking is alrea=
dy
>> enabled:
>=20
> Sounds useful!
>=20
>> This is sent as RFC because the user-visible interface and the cost/be=
nefit
>> tradeoff should be agreed on before this becomes a normal patch series=
=2E
>> In particular, feedback would be useful on:
>>
>> - whether a separate H option is preferable to extending U directly
>=20
> I think before we converted U to stackdepot, the memory overhead of the=

> stacks was higher than U+H with stackdepot. So I think it would be
> acceptable to extend directly. If a user is willing to pay the current =
U
> overhead to debug something in production, the addition of U+H shouldn'=
t
> make it suddenly unacceptable.

Agreed on extending U directly rather than having a separate option.

>> - whether H should require U, as implemented here, or imply U
>> - whether the extra per-object metadata is useful enough for this debu=
g path
>=20
> One could think of scenarios where even longer object history would be
> needed to find the culprit. But adding one extra lifetime probably has =
the
> biggest impact.

Heh, I was actually wondering if it would make sense to have e.g.) a
hash table (per cache) where each bucket can store N "extra" lifetime
history of objects with the same key, with each element storing
stackdepot handles and the object address :P

--=20
Cheers,
Harry / Hyeonggon

--------------l598mhoMA2K7tROMKi453KGs--

--------------Pry6HKXvR97fF73yGuINWk3U
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQQQ1ub6gR5ogjaKRmOGXBN6rc5S1gUCaizyVgAKCRCGXBN6rc5S
1nUOAQDlXaaQEVOEBZ0HQ9jcCa19uWCiFVFiHV7ZykbZB16pHwEA6DzCrVGXhxz6
+icLtlCrRsP9S6bLj647cUaoi+NAdQQ=
=LQMZ
-----END PGP SIGNATURE-----

--------------Pry6HKXvR97fF73yGuINWk3U--
