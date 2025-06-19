Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5762248AA
	for <linux-doc@vger.kernel.org>; Thu, 19 Jun 2025 19:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750362708; cv=none; b=XOiOx3TDdEE3/GHPdn90ATBXyMytQWS3zidEEEkhrCiAdqtemaVuXpDrkuelbZy1qT2Ps4IgIyHsMmDN8a4Cbay5nJN1AaINhmtypjByB0YEzfB/dSK46q8mawR5R55HjFgJ/aKBU3+PpgdMP/Tr01KMXwb2JIWePVFJEpBtfGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750362708; c=relaxed/simple;
	bh=m+IS52kyLR92meFMSc55i6NzxbfxCW0kDeKpWYzBkLA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CfNGDqd4LVenPs8EYublpNbBevSv6WdfrBwGbvE9r3O0DpIhFlfC72AZori2QOs591dJ+YfxOc2DoDdcmbJbvYbntZP7YYdXBNHIOikuoi8blhc5VOiWaHiEiqeXJkS9E731K7boPXhUz/enNKKGfA+k4Qy8Rv3OdumnJqGbP2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=shQsfOY5; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="shQsfOY5"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CCEDB41AD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750362706; bh=EX5ea/huQRHSAu4M5JjXieZ/TdJW2jjEvrEQutLyR3o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=shQsfOY5kqQ2Q9FcN6ATLObYGv8ixYm+2TqcMLH0vkgX44307a5zG3HqwYifgLsch
	 iVAD62ChSO7bz2pRab0zEJ2hZhg+2O7BHsKLfmJd48mTpI49LQTUenyg8oVzNUqvuo
	 XS3vaZriCIv4u09XVXytEAkCgf2CM/GVFJXk1Ybm/G3h8K0sOATDGNFLy+VF7x20+o
	 3iOVBNb46dtQ2ijhy+sSCr4kg8TsDPGNibGN/jyKsvI0AcpXT/beALu58wgdZeIEyw
	 QVviM8BaS+RAuAJtn+3TgTdWfFVeumSq3JvsNBH9r27QGoJDaGQOY0hGm4vuit+yBN
	 GGscyGxqj8M8Q==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CCEDB41AD8;
	Thu, 19 Jun 2025 19:51:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Akira Yokosawa
 <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: Error at www.kernel.org/doc/html/next/ since next-20250610
In-Reply-To: <20250617-translucent-crouching-poodle-a826e2@lemur>
References: <de7bae91-3200-481f-9db2-c0dc382c91dd@gmail.com>
 <20250617-translucent-crouching-poodle-a826e2@lemur>
Date: Thu, 19 Jun 2025 13:51:45 -0600
Message-ID: <87frfvh5m6.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> On Mon, Jun 16, 2025 at 08:18:22PM +0900, Akira Yokosawa wrote:
>> I'm not sure but there might have been some minor incompatibility
>> between past versions of dependencies.
>> 
>> I'd rather upgrade Sphinx to 8.2.3 (latest).
>> 
>> Konstantin, could you try it?
>
> Looks like 8.2.3 requires python-3.11, which I don't have readily
> available on the system that builds the documentation. However,
> upgrading to 7.4 also fixed the problem, so the latest next tree is
> now built and should be propagating shortly.

[Catching up after some much-needed time in the wilderness...]

Konstantin, is there any easy way to get a notification when the build
there fails?  I was entirely unaware of the problem, needless to say.

Once I've dug out a little further, I'll try to figure out why my change
makes things explode.  It really shouldn't...so it should be possible to
find a way to work around the problem and avoid putting in version
requirements (and tests) that we haven't needed so far.

Thanks,

jon
