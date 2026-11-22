Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795328020;
	b=uCVKsGnmOIMxq2pNuVOFglhaHh4k8HWD1Bv+Qt2d4flMUBQ06nhitwAsPSA8d6k9Yb9A
	 YbYeF9xXk4oJpFFZ+jIKgpDjl6f9D13S3HqMiD8/YuwKNKDJS+M79obLg8lUiHWlLjMIc
	 cbM3XzcTiA36P+aSeqsy9PPdfI/zL4mglU8X8a1qlz0gEJMDpuDmi8q32XXGXzi8CBvb7
	 JeMgsfrPYNK+3J2jl6m6zOT78HHUMYwCLxUupdFsP26gRWn4l0UIhpcJ/pejqon06RKT7
	 GDZ/tstSIHZpKaZY5UlWdUeU1fTC92K11UMsOQunf8Cc/NXnix8Q+4ImOPjJ+nHyDMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795328020;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=EReH8gMvuwFjWJ6cbLiJh/fucO3rHRuSzWx9q6zxuko=;
	b=2ruV6TMmwpB30IVjgoWjPqBAZ2B2qNwtWQM/Kixbz8pri8XRWY6IiGgebGhA/PhZt639
	 Dp/klz6irQEgArCrOXIjwpyPG1Cf5Uyur2mpCvzSFpkxJNERyrb/vdpdgwwyOEb7ikwVq
	 PhSdezF92YN2Gu6UdzWGBRKP1TmmHlnKz+hSkQQ+uH6TBdpmzQityQgrm6OC9Ytk2KsOR
	 /dtvJkHu1p6Mtzwy5j+TK9mA4o2mfS+z5hQrBLcdxvLhW5NNd9dQNokxcqF9NHC3Dh6SS
	 fiDzPqtq4LZM3t31Sbd9YhrV4RGx0WMFkjNbgvExGKgVSv8tb9Hsdj+qNvSN/LksOTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=VP7Z02ZQ;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C80E606A320;
	Sun, 22 Nov 2026 06:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C80E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=VP7Z02ZQ
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 852AC40904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1795328013; bh=EReH8gMvuwFjWJ6cbLiJh/fucO3rHRuSzWx9q6zxuko=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VP7Z02ZQPQpJoC9TMUNGhQ3e0PpiBPDP4kDTJ3qAXZLhiUdLV3xDlzwtoLj06dvXM
	 HI5kmhlnGkXzs8x5qPe4lYp9lZu87XZ/ht6zusSDmtqgPv2LuCg+JZUxZ2ZPjfbVL3
	 v2R5KD8RrwXWph7Ex4MQGEXIZUc2PQFzh/N7lRwXzlEjSDG4NLr2vZEub6ntVJtVOS
	 q3gCjcmxhppQPZJrLTSLO/eZbQWF1AwcHcOW8azTXpQAvMSHU/K2CPX17ysbhE06Ag
	 e5M1oJBLkyEf4jDcRlwirRyZ18rus24RARLXRzEQfqhQ5IaNP1r2V6waf1tLa5DM4W
	 nrKU/r4yemAkg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 852AC40904;
	Sun, 22 Nov 2026 06:13:32 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: weibu@redadmin.org, Akira Yokosawa <akiyks@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs/ja_JP: translate submitting-patches.rst (patch
 format)
In-Reply-To: <0ffa9af9fc67900223a1b93d6807dd4e@redadmin.org>
References: <20261106225619.12869-1-weibu@redadmin.org>
 <20261113024405.871312-1-weibu@redadmin.org>
 <d2b47b79-a579-4ac2-84ef-de477dd84a66@gmail.com>
 <0ffa9af9fc67900223a1b93d6807dd4e@redadmin.org>
Date: Sat, 21 Nov 2026 23:13:28 -0700
Message-ID: <878q2l1jhz.fsf@trenco.lwn.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

weibu@redadmin.org writes:

> Hi Jonathan,
>
> A gentle ping on this patch.
>
> Akira has reviewed v2 and provided his Reviewed-by tag.
>
> Could you please take a look when you have a chance?

Patience, I'll get there.  I'm currently "enjoying" an unexpected
residency in a foreign hospital, so things are moving a bit slowly.

jon
