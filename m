Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C894BAAB
	for <linux-doc@vger.kernel.org>; Wed, 10 Jan 2024 15:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Kh3yM69u"
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9B068377;
	Wed, 10 Jan 2024 15:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9B068377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1704900272; bh=m/2WV1pnL9cWBYAOG0ypY+H5UtkkZCjYXKO97e9PFlk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Kh3yM69u7+QNE1bInKmrEiNT3rJxbGUGeJx9kFnOnWkww7DxIH2z/Z42t821wJpgE
	 32SPNpG7nE6YmrgBk45P4ZLPJxv8pWCmn/W9rT1gYpK5WdNEDMPY8HrnTBk/eU5T6/
	 cNFJBSaAn7zzd9A2PohuSSjgks3KMmp5ykeUmkV56zUPMyylWqTgm0Ul2gOuCTZSII
	 G05cKEXem5kn9+FvKaS9YGmWeDAsuLfUmVbgeuKO2YcWtM+pKf9rSs73F2zELObAqs
	 cmxGHB3Q6BUMseGqpQBGrunoRkKkvEGd+N2EUQZ0t5KztvIBkjCofEzEaWsHelzVwp
	 K6gZbf9+HgqZg==
From: Jonathan Corbet <corbet@lwn.net>
To: Vegard Nossum <vegard.nossum@oracle.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>
Subject: Re: [PATCH] Documentation: constrain alabaster package to older
 versions
In-Reply-To: <87a5pdqlkt.fsf@meer.lwn.net>
References: <20240110104646.3647600-1-vegard.nossum@oracle.com>
 <87a5pdqlkt.fsf@meer.lwn.net>
Date: Wed, 10 Jan 2024 08:24:31 -0700
Message-ID: <875y01qki8.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Jonathan Corbet <corbet@lwn.net> writes:

> Vegard Nossum <vegard.nossum@oracle.com> writes:
>
>> The 'alabaster' theme dropped support for Sphinx < v3.4:
>>
>>     0.7.14 =E2=80=93 2024-01-08
>>
>>     * Dropped support for Python 3.8 and earlier.
>>     * Dropped support for Sphinx 3.3 and earlier.
>>     [...]
>>
>> (Source: https://alabaster.readthedocs.io/en/latest/changelog.html)
>>
>> This manifests as an error when running 'make htmldocs' in a virtualenv
>> constructed from Documentation/sphinx/requirements.txt:
>>
>>     Sphinx version error:
>>     The alabaster extension used by this project needs at least Sphinx v=
3.4; it therefore cannot be built with this version.
>>
>> Raising the Sphinx version is not really a good option at this point,
>> since 3.x through 6.x have horrible performance regressions (7.x still
>> does, but not quite as bad).
>>
>> Instead, constrain the 'alabaster' package to versions that still support
>> Sphinx 2.4.4.
>>
>> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
>> ---
>>  Documentation/sphinx/requirements.txt | 2 ++
>>  1 file changed, 2 insertions(+)
>
> So this is a little strange, actually.  Alabaster is bundled with
> Sphinx, so there should always be a version that works; I'm not sure why
> we have it separately in the requirements.txt file (which is
> discouraging, given that I probably put it there).
>
> I'll try to look at this (but not right away); do you have any sense for
> whether things work properly if that line is just taken out?

OK, sorry, I've read a bit more closely now.  I'll look into this, but I
really don't think it should be necessary to specify alabaster
explicitly.

If it *is*, then perhaps we should revisit (again) the discussion of
which version of sphinx we're suggesting that people install.

Thanks,

jon
