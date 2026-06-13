Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEED1D5CFE;
	Sat, 13 Jun 2026 05:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781329370; cv=none; b=HiZbVBHyBAs2GiEHINqKLQUNn9f89uTToO6unlerJh7trM+9T32cUuGL0w68jITnr2aJ58Hy5RjtugYAk3ViYfcSqg+zU8vq4FbVsQ0sRdgf61m6ehkryjQ1WK5Ota+pFNYuVwR4J9l72UPVVZatRFQ3jJ6H3+KgaUfvMS/cLLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781329370; c=relaxed/simple;
	bh=0+/4tNbscRJRxyQO0C7bSu7XO7WjLbRdkgC3AUSEseE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tx/c4NaeHneqFFX9ooCBuWSHMExgwOjs/iggE67OscegYeCiJV7HeAO5WXF+ZEIn9fsPbhWracf4mSz6zWAcyTyw/n9XmisINsoHWQQYrdF7NkM+m3g6FoQY+SrVndslOlZKMz/JnA+WbkRN3WrMrvgciZ+WXNxPJdmFpGsrbpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Deu9DwUf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Deu9DwUf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A124D1F000E9;
	Sat, 13 Jun 2026 05:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781329367;
	bh=cQ9VuLrT9lWjXA95UmdYTFa3mfcUEGbFNAD+hFt7gJI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Deu9DwUfPvX+pf8YXRD2gCfZxGgvy5aGSubS/nTu0DBGOffo/JU1Whk7S/8xIFAeH
	 YD/VbMOYUhz1r16cGhJ8UAdwozjbE7z8kD4y22AgfpRatKCt4cEg4gPy/Py8QvrUZw
	 yem6a+k8nfXV5LDD0BdIyoXjbtXxVVDwlRtNwxAoNGPlpyPVtT2X0hlyiKeiUoKFBr
	 J77x6YwhS1lt87mUu4BlRZqMDb+X025LBPSNdWT6ugI82/MNQGS4PqnaOIrPHA8n/d
	 zOKRfr8VklRuYBFMkgo08nD0HpVYlDs80yDGxlb1pOseSwDNHOb82Bwz5vDpjsqbS6
	 t/+dBDQ4mqq6Q==
Message-ID: <d09bdcf2-c713-4195-a1f6-84117ac9884e@kernel.org>
Date: Sat, 13 Jun 2026 14:42:41 +0900
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
 <2b5577b0-d81a-4dee-b4e2-acadcf7f7db2@kernel.org>
 <8c5d67d1-e4b0-4cb2-9336-875f4f2ca96b@kernel.org>
Content-Language: en-US
From: Harry Yoo <harry@kernel.org>
In-Reply-To: <8c5d67d1-e4b0-4cb2-9336-875f4f2ca96b@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------B9SkLUiW8DsmSGOmWKChDNmd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------B9SkLUiW8DsmSGOmWKChDNmd
Content-Type: multipart/mixed; boundary="------------TC5JMruIL0kh5xzF0eWK8sF5";
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
Message-ID: <d09bdcf2-c713-4195-a1f6-84117ac9884e@kernel.org>
Subject: Re: [RFC PATCH 0/5] mm/slub: preserve previous object lifetime
References: <20260611063926.38111-1-pengpeng@iscas.ac.cn>
 <2b5577b0-d81a-4dee-b4e2-acadcf7f7db2@kernel.org>
 <8c5d67d1-e4b0-4cb2-9336-875f4f2ca96b@kernel.org>
In-Reply-To: <8c5d67d1-e4b0-4cb2-9336-875f4f2ca96b@kernel.org>

--------------TC5JMruIL0kh5xzF0eWK8sF5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


On 6/12/26 2:13 AM, Vlastimil Babka (SUSE) wrote:
> On 6/11/26 09:19, Harry Yoo wrote:
>> Hi Pengpeng,
>>
>> On 6/11/26 3:39 PM, Pengpeng Hou wrote:
>>> SLAB_STORE_USER currently stores one allocation track and one free tr=
ack
>>> for an object. This is useful, but it loses part of the previous life=
time
>>> when the object is reused: the new allocation overwrites the allocati=
on
>>> track, and a later stale free can overwrite the free track.
>>
>> I'm not sure what you meant by "stale free", UAF is accessing object
>> that are freed. What makes the free "stale"?
>=20
> I'm guessing it means 'second/duplicated free" of the previous owner.

Okay, it wasn't clear in the cover letter but now assuming the same...

> Accesses (UAF) perhaps may not happen by that owner, or if they happen =
after
> he object is reallocated, they are not recognized as such.

Right.

User A				User B
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
allocates an object
frees the object
				allocates the object
frees the object again
(poison the object)
				overwrites the object
				(not detected until freed)
				frees the object, UAF detected!

By the time it detects a UAF, free trace is from user A (of the second
free) (since we perform consistency checks before updating free trace),
alloc trace is from user B.

So the only thing we know about user A is the stack trace of double free
but no original alloc/free traces of user A.

>> In general, I don't think slab_debug=3DUP is the right tool to debug
>> use-after-frees, because slab will never know _when_ the object was
>> overwritten. It can only tell that somebody has overwritten freed
>> objects by checking if the object content is POISON_FREE or POISON_END=
=2E
>=20
> It could give more information about double frees like this, however.

Right.

>> KASAN is a better tool to debug use-after-frees, because it can
>> tell you which kernel code is accessing memory it shouldn't. (It also
>> quarantines slab objects to avoid immediately reusing the object for
>> better coverage).
>>
>> So I have to ask, "Why not use KASAN instead?" before enhancing
>> slab_debug (neither is intended for production anyway).
>=20
> From my distro experience, it's very useful to tell a user to just enab=
le
> slub_debug for a specific cache with the existing kernel, with some but=
 not
> prohibitive overhead. And with some luck it gives you enough informatio=
n to
> find the root cause too. So in that sense it can be used in production.=


Right.

> KASAN is indeed superior wrt catching issues, but almost never applicab=
le in
> such environment. It would need a rebuilt kernel and the overhead is mu=
ch
> higher. So it's a tradeoff.

Right and not all users reporting bugs are willying to do that...

--=20
Cheers,
Harry / Hyeonggon

--------------TC5JMruIL0kh5xzF0eWK8sF5--

--------------B9SkLUiW8DsmSGOmWKChDNmd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQQQ1ub6gR5ogjaKRmOGXBN6rc5S1gUCaizt0QAKCRCGXBN6rc5S
1k1IAQDlH9d73y9KVNOffoPOZhCVjmizsVyS5PKhR8KGaNd15QD9EF1XWBhLH5GL
sjIkxJykNrDMs321EfQtA+bvk0WZEw4=
=y2SJ
-----END PGP SIGNATURE-----

--------------B9SkLUiW8DsmSGOmWKChDNmd--
