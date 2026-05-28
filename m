Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD623FDBE5
	for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 14:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779979668; cv=none; b=tasuzXNboSvLqyhOqdfG39JMkllpJ1E2GlAE98hhQUOy0EhbDqOHP+P103GneusA9QSi5Ekr0Do7Co17Vtfhc725yXpVH9NkW+G+QvNxk0AsQujpe3zmy4BicjHYfkxvJxG10Ko6+flhPe3ZkykyfwXG7viBG8vpcF0qFMz6vVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779979668; c=relaxed/simple;
	bh=KxzPMDOITTDBYuK0RK57dwdh6nJNy/wpKd6ysHybiP0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BBJBYKjf9lVg8rJz9qO8b0w/1z6Wynru/16dTjLEzIjeHsOpRCHVmLGjX8UcKVDppxDDNUacAQFncVqHY+IV0MZ3M9VEPQrhx38y33VIo3p8RYlKM7Y/Kpkz0Yj18N5nCqEuMOkXSkS6SgEUcEvVbkYPv5qv7VfuOaH0vHKKT8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=hG+M6LLW; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="hG+M6LLW"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8ADB840E2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1779979664; bh=C11sMLBJC/GF2P7nx8MioQOI4Q+wKU+9Go7IxqBI1Ow=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hG+M6LLWPtEsAQVYDkOAguWjMpWbvDBAKjpbdx5fbfhQxb9lT8uZmg4Dt0rmFsy4n
	 MplGB4PyDwv9MZ0slUKkkWf57hIX5Y03/yoz/m544zq+zdvMmeAYb9QQ/gpSJi0Xo4
	 q2vrlYM0pvMe+Pk3he9kpVdC7HIBVcvzBLWDCk6X79NFwQZ1qDKs4r3INo30GXDEA2
	 /UtOlyx6u5FZrNPO8n7LoGOMpjqkFbjR5IhDkUiR4gIRZUMrZY/QSoX4gzABroxfGw
	 VcJqCrHW0W71JYXhj/IqoyWChr4AvjVFIllvwasz3T6G4LRUb31ct2nYB0I7wgmjBr
	 fYHyEuaLWeqhg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8ADB840E2D;
	Thu, 28 May 2026 14:47:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>, Amanda =?utf-8?Q?Corr=C3=AAa?=
 <amandacorreasilvax@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] docs: pt_BR: update maintainer-handbooks
In-Reply-To: <CAMAsx6fWkQi1BHRPypDQeXL7LsDftfm5SFsgf1-pSUMQAdo8YA@mail.gmail.com>
References: <20260528041958.57231-1-amandacorreasilvax@gmail.com>
 <CAMAsx6fWkQi1BHRPypDQeXL7LsDftfm5SFsgf1-pSUMQAdo8YA@mail.gmail.com>
Date: Thu, 28 May 2026 08:47:43 -0600
Message-ID: <874ijrlhf4.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Daniel Pereira <danielmaraboo@gmail.com> writes:

> On Thu, May 28, 2026 at 1:20=E2=80=AFAM Amanda Corr=C3=AAa
> <amandacorreasilvax@gmail.com> wrote:
>>
>> Update the content of the maintainer-handbooks documentation
>> to Brazilian Portuguese.
>>
>> v2: Update maintainer-handbooks documentation based on the actual latest=
 version of the English
>> documentation. Prior version was based on an older version of the Englis=
h documentation, which caused
>> some inconsistencies between the two versions.
>> This update ensures that the Brazilian Portuguese documentation is in sy=
nc with the latest English
>> version, providing accurate and up-to-date information.
>>
>> Signed-off-by: Amanda Corr=C3=AAa <amandacorreasilvax@gmail.com>
>> ---
>>  .../pt_BR/process/maintainer-handbooks.rst    | 19 +++++++++++--------
>>  1 file changed, 11 insertions(+), 8 deletions(-)
>
> Hi Amanda,
>
> I believe this is your first contribution.
>
> I noticed that the titles for v1 and v2 of this patch were different.
> When sending subsequent versions, please maintain the exact same
> subject line, only updating the version tag (e.g., from [PATCH v1] to
> [PATCH v2]). This helps significantly with identification.
>
> Regarding the content, the Portuguese grammar is correct, and the
> change makes sense.

Is that an Acked-by?

Thanks,

jon
