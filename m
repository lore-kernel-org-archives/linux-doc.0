Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90393337110;
	Mon,  5 Jan 2026 15:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767627352; cv=none; b=owdd08S9AVc89Qo8D1yzXkq+UKEv7jQeTQ003h9TeEfLwvw/28APw34zTtuU11R3PDIKnxkkGNZ+hp/MbMoXjQVoritffCpac3DJth6lC0LZ/vowtrxVmOQDGTdZxAS5T+fB/pxiQJ5Qyxz8wl30FGXPBqxNBxEaQeSPt2I28aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767627352; c=relaxed/simple;
	bh=v3DgVBV9KEXQj9k2s7ykmMUDiZlPDal7thAflutU8Dc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=m8g4YkQWLPZjEaOiPZbCW4h0OFf0dcBpYqBQQdHMEYzhmOX1lKJwqqpuQknLtlYOgCc9KF0IpXhglA+5vlRPbmDgSzZtSeV+Yvzx6cJM3n3tGRWdk6OG1ecOP/4YdGBKacnMlPgxhAscUBPNKwClnQZk4db2sSmxxbbDXVvp/DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=J93z0ct3; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="J93z0ct3"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 26F5A40B45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1767627344; bh=v3DgVBV9KEXQj9k2s7ykmMUDiZlPDal7thAflutU8Dc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=J93z0ct3RZrhCH1z0CrEQSnbcc0YSrXQkWYz6C/9YaY+UkSaWpwN3a/ePooP5KxLg
	 eT5wvSe31Xo2j/Q0ToRBvHjGE0y4s1g1q7gHNQNQ6u+ww5ZdYsrflIGpHcsBXs8m12
	 CD61SfYNvM4LlMqnXy1a+nPsvG+XSolj4j3CGZproqzzRumujjRgpOgAfERRf6AB4t
	 d7ePpr6ZxLdKVmb2F/DTnw5umlCcNjlItZ21lEvcWTxyiX0dk99mIfQFPdOM6osR71
	 nsaMj4YLnqblETj9sBQofRqsCrF8fdzJIQkV226WsMprMSxzQvX062Vk29s9afd6If
	 iRrP19R4RiLXw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 26F5A40B45;
	Mon,  5 Jan 2026 15:35:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: duchangbin <changbin.du@huawei.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Cc: duchangbin <changbin.du@huawei.com>
Subject: Re: [PATCH] tools: jobserver: Add validation for jobserver tokens
 to ensure valid '+' characters
In-Reply-To: <f1755f03f74e4e4ba8a0a91c9da1a74f@huawei.com>
References: <20251225062622.1500046-1-changbin.du@huawei.com>
 <f1755f03f74e4e4ba8a0a91c9da1a74f@huawei.com>
Date: Mon, 05 Jan 2026 08:35:43 -0700
Message-ID: <87zf6sjcmo.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

duchangbin <changbin.du@huawei.com> writes:

> Kindly ping for this fix. This patch resolves the issue where kernel compilation
> gets stuck in certain situations.

Patience, we're just coming out of the holiday period.

Thanks,

jon
