Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6899F345749;
	Fri,  3 Jul 2026 05:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055596; cv=none; b=laeEPXYlUUEQfi97n5yZR709g1a6f5gXOC0FG4slzVxELFNgF9S8Bjn0Y6Cfk1KL0RVFlgMySMYg2QdLefINDx4dlkC12HtwePEJUXoX2kzBl9rCYPgZ2rQW5s0VeLDZ/7jY0KbJaklYqVV/pAi7y9p3/kxe1THUaLa34H/Jqn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055596; c=relaxed/simple;
	bh=jHgPcmQ7YH2y5pNkG74OQy39/eXmCooS5V/ZIXaFSaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BDuSx8tJTsD4nbsyzF0AvUaJRU0dnV3s0lU44sTfu/sYr7Vcz4S35PvOmJv1zFHhVNvDKRa6SbZNckZMs6mxh3eXZS5YpFfe2EHb21Rz2hcbTf5TUNMIm49ap6AQJqvg2ZhGgzBsPWieKjeAjn7g9X+ly3pxVGnmlaMd5UMfTcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HqCnGi2z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HqCnGi2z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30D91F000E9;
	Fri,  3 Jul 2026 05:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783055585;
	bh=d2jmDN8EDDEi8qou1T3zevjnsQGMZ5IhSTwrPgKzFh4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=HqCnGi2zDjWTXnC3MspWlCf9hO0/ZN6ukeuSVhsLMfxoXT1NAObsxCFxHqAbwxAhq
	 GkXe2fpz7+2ch+jjP9jzz/+n1jNKaYIpPTm6uMzqZjLl4XTTcLbA88btfrcAGC64Xk
	 dgjq4bw8U/PPZV/f4PobkEObr81d8waV6vVQOo+o1Odp1XPKZWyM8XDEjD3TN5B5w0
	 hdEFS2+ICzF2WtkZHqm0ISVHal0f+AJpG/kf8goAtMPdHBmG03KOsdT5bzD1s/nd8u
	 MD6x+Z5V57PalXJOwjjAoXjdscFDQ625LKHgM2NrKMYqQDzdZ0pYKtHjY6nJ1g8fzz
	 4/VMxpFvVFrdw==
Message-ID: <77a03a9a-8461-40c3-a383-d9dc62efb801@kernel.org>
Date: Fri, 3 Jul 2026 14:12:59 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: ABI: sysfs-kernel-slab: mark cpu_partial attributes
 deprecated
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Seongjun Hong <hsj0512@snu.ac.kr>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christoph Lameter <cl@gentwo.org>
References: <20260701141755.85119-1-hsj0512@snu.ac.kr>
 <54e75619-3dbc-448c-81fa-122edcdad1f0@kernel.org>
 <f047ceae-4836-40c9-bb7c-a6074bbf1a1f@kernel.org>
Content-Language: en-US
From: Harry Yoo <harry@kernel.org>
In-Reply-To: <f047ceae-4836-40c9-bb7c-a6074bbf1a1f@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NOh23wvTE30Hws23l0EoVgJZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NOh23wvTE30Hws23l0EoVgJZ
Content-Type: multipart/mixed; boundary="------------YgT6oA9Qcxr9YGnpqYJ0rzq5";
 protected-headers="v1"
From: Harry Yoo <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Seongjun Hong <hsj0512@snu.ac.kr>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christoph Lameter <cl@gentwo.org>
Message-ID: <77a03a9a-8461-40c3-a383-d9dc62efb801@kernel.org>
Subject: Re: [PATCH] docs: ABI: sysfs-kernel-slab: mark cpu_partial attributes
 deprecated
References: <20260701141755.85119-1-hsj0512@snu.ac.kr>
 <54e75619-3dbc-448c-81fa-122edcdad1f0@kernel.org>
 <f047ceae-4836-40c9-bb7c-a6074bbf1a1f@kernel.org>
In-Reply-To: <f047ceae-4836-40c9-bb7c-a6074bbf1a1f@kernel.org>

--------------YgT6oA9Qcxr9YGnpqYJ0rzq5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 7/2/26 5:28 PM, Vlastimil Babka (SUSE) wrote:
> On 7/2/26 07:18, Harry Yoo wrote:
>>
>>
>> On 7/1/26 11:17 PM, Seongjun Hong wrote:
>>> The per-cpu slab and per-cpu partial slab mechanisms were removed whe=
n
>>> SLUB was converted to per-cpu sheaves in Linux 7.0. The cpu_slabs,
>>
>> small nit: sheaves were introduced in v6.18,
>> but the cpu (partial) slabs layer were removed later in v7.0.
>=20
> Fixed up when applying by saying "fully converted" :)

Looks good, thanks!

>>> slabs_cpu_partial and cpu_partial sysfs attributes were kept as stubs=

>>> that always return 0 for backwards compatibility, but their
>>> documentation still described them as if they were functional.
>>
>> Right, for backward compatibility, because, unlike files that
>> might not exist w/o SLUB_STATS, userspace tools might assume that
>> they always exist.
>>
>>> Update the three descriptions to state that the attributes are
>>> deprecated and always read 0, and note that they are retained only fo=
r
>>> compatibility. While here, fix a "partialli" typo in the
>>> slabs_cpu_partial description.
>>>
>>> Signed-off-by: Seongjun Hong <hsj0512@snu.ac.kr>
>>> ---
>>
>> Overall looks good to me, so:
>> Acked-by: Harry Yoo (Oracle) <harry@kernel.org>
>=20
> Added to slab/for-next, thanks!

Thanks!

>> By the way.
>>
>> There's still some gap between the documentation
>> and the implementation :)
>>
>> We've dropped a bunch of files that exist only on
>> SLUB_STATS and new files introduced with by
>> sheaves were not documented.
>=20
> While we are touching these files, the question is what contact to use
> there. Some have Christoph, some Pekka, some both.
> Seems inflexible to me and should ideally point to the slab MAINTAINERS=

> entry.

Agreed.

> But not sure if it's possible. Documentation/ABI/README says:
>=20
> Contact:        Primary contact for this interface (may be a mailing li=
st)

Looking at other mm-related sysfs files:

Contact:	Linux memory management mailing list <linux-mm@kvack.org>

> Maybe we can propose that it can also say
>=20
> See the SLAB ALLOCATOR subsystem in MAINTAINERS.

Replacing the contact with linux-mm mailing list and mentioning
SLAB ALLOCATOR subsystem in MAINTAINERS sounds good to me.

--=20
Cheers,
Harry / Hyeonggon

--------------YgT6oA9Qcxr9YGnpqYJ0rzq5--

--------------NOh23wvTE30Hws23l0EoVgJZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQQQ1ub6gR5ogjaKRmOGXBN6rc5S1gUCakdE2wAKCRCGXBN6rc5S
1vfxAP9SCpQIkFDU/oly+VDOPNVw6h+A8ebDHoXAfgGj8xhZlAD/Y8bvDkASXQW4
1jTb04fo5dlGTxe9a/HeHtm79YGbKgU=
=pxDA
-----END PGP SIGNATURE-----

--------------NOh23wvTE30Hws23l0EoVgJZ--
