Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2554E1B3
	for <linux-doc@vger.kernel.org>; Mon, 12 Feb 2024 21:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707774729; cv=none; b=LBQlhQvAFSE5u6z3t8zH5VTA9lSll8pS1L9xtStA3+To2LxXZLjLzywWYz74W/672Hm+6X/YXJ/nwm6k7yYZrYEHz6/0JqQomLaUbDOcfGrceZV/TZlDSMZDcEjptkrtNS5/fqbvJy9ER+JTtr4KX0412a5Ud24mlVzf7OwWthk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707774729; c=relaxed/simple;
	bh=1hj8Acdp6WLPlXuPNV5If6VE4nMYBukvcHNMaAL53aE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pgYXPuli5XqJqQtg+ZPH0dB1kjMiRJEwB9dfjkv4i3gIQxwg2ebK5nt6oT+jHJEBnJ4wchTwUmY10mM3f1RVhxHru5GiJ6zI9fRY8KFb1m8ce4yFFve0//+j8yb8hUYVihO6PkTm0971XFvJVqnPXUOXI8+OgIdu6+0A9wUXQ9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=NHf4Q8Fv; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="NHf4Q8Fv"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CE0F145ACA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1707774721; bh=IBNJRd2uCwRLKmP4WhBxhjJyASscgaJapYLN+gyUx/g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NHf4Q8FvQFAAjKbp7SlG32fRhnanbBXJm/y9+c3DZ3tuGFq13xaORRn0F+vhQcwyR
	 b32qUxlFmf/LzCWbgTBn+w5B2AR4hxDxqmZjQzezu4ov+2R8EOE0NR3JrplF+nn9om
	 LeMm0cK6tLUyRW73O2UOx4WDRcFRjfNM690IFdDzynQMIXwtuJe/z9WVszracjWoHh
	 p6X0/kZbIiDTCvzf8XRSrmlkSwFkIPfaQ88r+W/N59J5zkew9qPQR1+/Jw1Xih9as/
	 0X6KcAwPcEvV5o6ZFDnC18at8Od7tkAL8LN8xno7wIA7PXWEiGWAWn/rgE54FJK+fL
	 OxmQd2ze5BwbA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CE0F145ACA;
	Mon, 12 Feb 2024 21:52:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Vegard Nossum <vegard.nossum@oracle.com>, Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: docs: "translations" extension breaks "make latexdocs" with
 6.1.3<=Sphinx<7.2
In-Reply-To: <4806c264-1076-401b-bb5f-283fb7b68fb3@oracle.com>
References: <54a56c2e-a27c-45a0-b712-02a7bc7d2673@gmail.com>
 <37ecca9e-83f9-4f91-9b76-b5bd012dc3ee@oracle.com>
 <4806c264-1076-401b-bb5f-283fb7b68fb3@oracle.com>
Date: Mon, 12 Feb 2024 14:52:00 -0700
Message-ID: <875xyt8i67.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vegard Nossum <vegard.nossum@oracle.com> writes:

> On 12/02/2024 11:28, Vegard Nossum wrote:
>> On 12/02/2024 10:52, Akira Yokosawa wrote:
>>> While testing update of sphinx_pre_install WRT pyyaml, I noticed build
>>> errors in "make latexdocs" against Fedora 39's distro Sphinx (v6.2.1).
>
>> I think we can solve it by making 'current_language' a true element
>> attribute:
> [...]
>> This is probably more correct anyway.
>> 
>> I'll test this more thoroughly with a full build as I think translations
>> won't show up when using SPHINXDIRS= (because the translation is outside
>> the source tree) as well as with older/newer Sphinx versions.
>
> In the end, that first patch caused errors on Sphinx 4.x
> ("TypeError: LanguagesNode.__init__() got multiple values for argument
> 'current_language'").
>
> This seems to work across 2.x/3.x/6.x/7.x for me:

It occurs to me that me we should just have conf.py just not load the
translations extension at all if the builder is not "html"?

Thanks,

jon
