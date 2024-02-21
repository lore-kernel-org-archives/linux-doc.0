Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E598D1E485
	for <linux-doc@vger.kernel.org>; Wed, 21 Feb 2024 20:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708547476; cv=none; b=QQYqY0IFx9Y0UbCNbAJqhPW6VoiEK6B+s1oxhuO54zhe3SZ36q8BusmJqcsoPujyJFbYcddNKUzG+unEdJgk6LMzw3MVkyCrW++mLKKa8uh71v81NTfaJuCBBFy5+qdipJVUzJALGBBkXp1ygUw+yQuCQ5FXRd6zS1owtekcySQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708547476; c=relaxed/simple;
	bh=2vf0yEBfTqYHiwIOZQ1rsenT6EEIlO/W6eMeLF3mvvo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nccHjjpTcVsWvCUZApatbgvBrXTCPo5wUimv6Eqk+o8WXPALuGpp1C4fhLUPyIRhiG45kDsgiM570HtxXtnDPYHOhfpiGWAlUJegA2/xA+wNo4H2FCymbWCSyHDOQ+G2VNKZDPuv93m5BYhPjNWUMbGXIaGLT0qU0FAj/j4yi9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=sFQwYDL9; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="sFQwYDL9"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E5BB545306
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1708547472; bh=AazK0uojV4hpmKSffg3qr0OuJUo55Iy5DM7uwaTU1TQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sFQwYDL9CA+1YG2F9gXHVD8jjSZjANrAwRKmxCDoH0s9BQFXwjz81NhxAMk1pqunZ
	 t9K1AqCzuW41foIBz4uvta/ba8NzDeG6s4WtL2SLOS0AXb60bippstV8i8s570owfN
	 fd8E928bW1x2faBPNzzwU36b25nwUqkfZjz3g49eKnEKGvATTQ3fBg5I6ytjSSmnI7
	 hRqgifIwVVXQVGmMWAJnLeoE39KWmMSGSGcKHB1vp91sAcfsBDZAFEae9jFknbqUgR
	 eScJvILiXXvYAO8YfxBSAXZQflbljmldnZHE1JgHokEVyHltks9boHpJXcM7zAIAEi
	 R/Hkq3uniaK0w==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E5BB545306;
	Wed, 21 Feb 2024 20:31:11 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>, linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Vegard Nossum
 <vegard.nossum@oracle.com>, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] docs: Instruct LaTeX to cope with deeper nesting
In-Reply-To: <9359a5c6-1e54-4c68-9b7c-24177dbbbe01@gmail.com>
References: <87jzn0qw19.fsf@meer.lwn.net>
 <685ad03e-b61c-4c1f-9080-c7298a7625dc@gmail.com>
 <87msrug5s8.fsf@meer.lwn.net>
 <9359a5c6-1e54-4c68-9b7c-24177dbbbe01@gmail.com>
Date: Wed, 21 Feb 2024 13:31:11 -0700
Message-ID: <878r3dd0fk.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> BTW, I expected Vergard's fix to the translations extension would
> also be in the -fixes branch, but it is now in the -mw branch as
> commit 2bd6f4d99e12.

Yeah, I'd meant to do that, got caught up in the PDF nightmare.  I'll
put it there; that will force a rebase onto docs-next, but so it goes.

Thanks,

jon
