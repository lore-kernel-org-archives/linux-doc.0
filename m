Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA951531C8;
	Sun,  3 May 2026 14:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777819053; cv=none; b=uMu+8QDrZ8dHY9OqTU5Nfn5JLkFFjGDG3mmIYKMhGi64XNmT5zXDt1rV+oIV2LE5R9BJ5nzwRAykPZb+mU5nWHsme1nTsF6lUV3ytmjj31uSpa6Cz/uv0xr7TIlJ+48TjHodw4IvSVFpFVFspkNj3s3eT7u638lJnfaD7Yrytns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777819053; c=relaxed/simple;
	bh=p5NN3aN9Tc8286FljBfpFLF+hXKSE2e5F/VHtoysBPk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OQbkNl131UlEXd1UU8N5W+5bjeb40xiYepD4Xo2srRF/MuT/vFaJk8PCqHclOUT8hX7KmGZc8M6ZXQQkx/xJ7k88a2RwXOyFTnLmo4sfXM2M70siPX4m2AdU9NhL5bMF83vijd/4WOQ5VDu+hJfneH/yP242r9LDXVjTdrI3FR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=UWtv7qCK; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="UWtv7qCK"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4128041084
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777819051; bh=vEOLO21ZIRlIW+r2bLApjpVqMvgnnFkN6u47fE2C/Oo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UWtv7qCKIL1WcAWuvbzIa6vhPkD3NSlCyNl+IScXZ3JwlgRJoDOILRwUDeIcaZoWV
	 a71/6RnqijSEcajW2W8Jpcy7nLVQUnSpvfaoA6Y3zrXyYPEgTQpzAyl5p6Sin0W434
	 BDhN+uQp/9meC55P/SIF6wPFvE2CTyvjEjHd30HWgR5Kghog/Q+RejMc0Sq5WAy6Gq
	 9DWVLaZwOhtXFC0csNzgY5/MTboxRvZJ5PCfh5zkAiGhV3PU5r1QFs5dKs0tJNm2b/
	 GkOhVVRQE4NwdU95Q8cL6rA/yEBJNV0G6q51C7hQgxcbrm9XNqrN1vYWgYnPXlxf3g
	 GFoswq7IJHmGw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4128041084;
	Sun,  3 May 2026 14:37:31 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Costa Shulyupin <costa.shul@redhat.com>, Jakub Kicinski
 <kuba@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>
Subject: Re: [PATCH v2] docs: Remove stale ISDN parameters
In-Reply-To: <20260502120206.1289126-1-costa.shul@redhat.com>
References: <20260502120206.1289126-1-costa.shul@redhat.com>
Date: Sun, 03 May 2026 08:37:28 -0600
Message-ID: <87a4ugeezb.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Costa Shulyupin <costa.shul@redhat.com> writes:

> The icn= and pcbit= parameters referenced drivers removed in
> commit 02bbd9802da7 ("staging: i4l: delete the whole thing").
>
> Remove the stale parameter entries and the now-unused ISDN tag
> from the legend.
>
> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> Assisted-by: Claude:claude-opus-4-6
> ---
> v2: Remove pcbit= and ISDN too
>     Address comments of Randy Dunlap
> V1: Remove icn=
>
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> ---

This arrangement caused your signoff to be stripped out on application.
I've put it back, but please follow the normal patch format in the
future.

Thanks,

jon
