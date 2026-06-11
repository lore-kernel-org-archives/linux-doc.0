Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D21A35C1B2;
	Thu, 11 Jun 2026 07:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781162386; cv=none; b=eBrveEbJv75f1dTQJq5Q3duKFhoaTL9AnUwQ6ESV6xLmwIofIQITbk6ew6qgwg4n7aAzA9ycN89Av5EQHBFyBgxsb7nnsuh90VjpQKNlz1SPCLQPX8B2vDFYR50UV9qTDsF9gTXWxHg0yF0ZRF5mLXtVbKHJmYNmrrs+EtauhN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781162386; c=relaxed/simple;
	bh=ztIz45hab0AvLP/gnjehgcjg/V46iqjqRkXzJ26PE+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b2C6G6kGEH+eBW0WKczUvj0YWc2BdflpBXJMzIFOa2AhHthLmgJSu5p9OuNdfEnqJisw/Ac62I7Sd7Zrk7CjChNMcX5yqv5UMSVoWv44drN04a4MO3IU0z/M1y9/prkczMj9yKLwP5BzeVMfGcK2XvMlFdNZmMwtAJCyfTQbCik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V8lcB+cy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V8lcB+cy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CD01F00893;
	Thu, 11 Jun 2026 07:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781162385;
	bh=ztIz45hab0AvLP/gnjehgcjg/V46iqjqRkXzJ26PE+c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=V8lcB+cykIyGjOy2dxrUzVV/Q3lA3bzfQKE0EKEaizxsQXtCLMAczPlwLgp7xGqQt
	 u+Tv9KNbobe9s7mJxUh7I484+2aw3LoRmftl+hLQBDqVe9Lcuk7KCvhbIFHDowJaTU
	 5qoD06COfhUXCd3IxkyNNS+lamaR0DJC1PLgzvRDaDCs4U/HKd2UExROWuQ94ik22t
	 dbG6cloH+VyTLbJyHTBOkIpew5Q+MQD9qkDen+aLF+6OpvtJeuCjrdmvOqPChWH2sp
	 FllECbyKhd6qro9ysbxGFJZYXs260Qxg9YO/M385HIqqKf0UuVpdCBmE7TvPRobA2f
	 9gr5N/WB/0Fhg==
Message-ID: <2b5577b0-d81a-4dee-b4e2-acadcf7f7db2@kernel.org>
Date: Thu, 11 Jun 2026 16:19:40 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] mm/slub: preserve previous object lifetime
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Vlastimil Babka <vbabka@kernel.org>,
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
Content-Language: en-US
From: Harry Yoo <harry@kernel.org>
In-Reply-To: <20260611063926.38111-1-pengpeng@iscas.ac.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------63UUg0QDpUJ3o0cdIUnrfdpH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------63UUg0QDpUJ3o0cdIUnrfdpH
Content-Type: multipart/mixed; boundary="------------RjLOUOXpcNn5GjJVTPq8Q6Ve";
 protected-headers="v1"
From: Harry Yoo <harry@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Vlastimil Babka <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
 David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 liam@infradead.org, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <2b5577b0-d81a-4dee-b4e2-acadcf7f7db2@kernel.org>
Subject: Re: [RFC PATCH 0/5] mm/slub: preserve previous object lifetime
References: <20260611063926.38111-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260611063926.38111-1-pengpeng@iscas.ac.cn>

--------------RjLOUOXpcNn5GjJVTPq8Q6Ve
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Pengpeng,

On 6/11/26 3:39 PM, Pengpeng Hou wrote:
> SLAB_STORE_USER currently stores one allocation track and one free trac=
k
> for an object. This is useful, but it loses part of the previous lifeti=
me
> when the object is reused: the new allocation overwrites the allocation=

> track, and a later stale free can overwrite the free track.

I'm not sure what you meant by "stale free", UAF is accessing object
that are freed. What makes the free "stale"?

In general, I don't think slab_debug=3DUP is the right tool to debug
use-after-frees, because slab will never know _when_ the object was
overwritten. It can only tell that somebody has overwritten freed
objects by checking if the object content is POISON_FREE or POISON_END.

KASAN is a better tool to debug use-after-frees, because it can
tell you which kernel code is accessing memory it shouldn't. (It also
quarantines slab objects to avoid immediately reusing the object for
better coverage).

So I have to ask, "Why not use KASAN instead?" before enhancing
slab_debug (neither is intended for production anyway).

> For free-after-reuse bugs, the report can therefore contain the victim
> allocation and the stale free, while the earlier alloc/free pair that
> explains where the stale pointer came from is no longer available.

Again, I'm confused. I have no idea what "free-after-reuse" means.
Objects cannot be reused until they are not freed, no?

--=20
Cheers,
Harry / Hyeonggon

--------------RjLOUOXpcNn5GjJVTPq8Q6Ve--

--------------63UUg0QDpUJ3o0cdIUnrfdpH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQQQ1ub6gR5ogjaKRmOGXBN6rc5S1gUCaiphjAAKCRCGXBN6rc5S
1gaOAQChyWUETqFeUG2gvr9ZMZ3Il7reXckMo4X8MOCt7Rc7AAD/Qfkcf8YbQo18
ItCpaSmOiByXdnbuV93+suelFfGbgQg=
=kmYS
-----END PGP SIGNATURE-----

--------------63UUg0QDpUJ3o0cdIUnrfdpH--
