Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418EA361DDE
	for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2026 13:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776258985; cv=none; b=sObunHv+H7Vc8opm3f/yOnbCaWm/K2PMft8g7MYISILWjx+Kgcw4VPmWvTa9l4aCrjHdVkwS0erQDM4yAyBY9b1/QFM+nU/bfvqtAOumJ4j596S1HCtDS27UExd1acNeRWGQFdG6T3ISCjZl3tr+Gq0wLI2JTIm/eZsNFaN7xZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776258985; c=relaxed/simple;
	bh=iJDfz+FGj7p5bQHWvijWcVvJK5ePgHFYz7kVRYwmn+k=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=okQJvHknA3SlCHPQh4WXX8lEJ8VIPuG4itsfUVatJh1wBxJuc9Ro0mT3OmCB0R4paoD/wf//lejvPvi0gxu+l3nmR04K8TNhm+tBLGE4a+0TIyuq2JLwfBD1rLcPZ1+UB+ESxqXUqHQn7PsM2eRgSt0hwIoFVC15xcCVBoNtf5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=oMhBRQ2a; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="oMhBRQ2a"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2A4514109A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1776258977; bh=6MgGEIz8Bi+NYAgxtcoU/n4MpY8NLiIenL/fmw7Ksbg=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=oMhBRQ2a7490Ep9Qx66xqM35VOYZ7yXVwCDsEXthYKcPIxgsIVRVaiYK5SEh1x1zX
	 MasiXChnu6Y+AK8dkgpiyohUapaCVO4nPrBnRV5uoaIXAAZ6JhN7vygaq46dfCVW/Q
	 3SyoLOhFDbEat6VLCuVauiBk01vLCO9YBsAmDV4eaV0ewo5GVsNxlpQYMgb8mSY+mJ
	 SKXhhfrqGytUkhy9IpfX9HuoqKFUkXWv/UraqGpTyYwwoKhrRuV1hdrmny2tySf5SP
	 upy76PqFVaCtW4+eZxGEZqhMZBpFpznbJbw9jPvDHhoOcLkjWQzCWIZ7Zb+YHYA+IE
	 qoazlHprG0kMw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2A4514109A;
	Wed, 15 Apr 2026 13:16:17 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Konstantin Ryabitsev <mricon@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: Volunteering to do more reviews
In-Reply-To: <20260414-valiant-sticky-piculet-3b7b3f@lemur>
References: <20260414-valiant-sticky-piculet-3b7b3f@lemur>
Date: Wed, 15 Apr 2026 07:16:16 -0600
Message-ID: <87340w2wkf.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Konstantin Ryabitsev <mricon@kernel.org> writes:

> Jon and others:
>
> I need more direct hands-on experience doing reviews and using my own
> tooling, so I'd like to offer to do more reviewing of patches sent to
> linux-doc, if that sort of thing is welcome and I won't be stepping on
> anyone's toes.

Of course it's welcome!  I'd love to see it.

Thanks,

jon
