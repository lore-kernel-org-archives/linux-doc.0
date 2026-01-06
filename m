Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C6721420B;
	Tue,  6 Jan 2026 21:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767735311; cv=none; b=RqcepSCKRJp+zVJUmG4fVBmLKDI3XdQkoJpzJEMQH5iPGJvoO+g8lZCitrdF09MeNcgiMLwWlpVkKdjaVChHLYdKZw+mmLIeFJKiHdCW9+3tZ1fqYl1AK8EZddRWa2Y0u1Zf8r+uDQUfS5rOy3YojCu1Tu+Orl1NsWUv7GmsrCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767735311; c=relaxed/simple;
	bh=mVwUBdfCl/QfCqSvQIULK5gYAj0ePwAoEhOshEXUHCs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MSlMT7LEU15osKP470h71anEWWvodlzeYdcEuPhgi/8m5lYhfr5vkfc6V1D87QubSYe9SGnxzvQFY4LCwiQuKyuvJ4OW9D9Kw4SuI5yt7A1QYcZ/USCa+8qwH1W0aYBILrsl1ub7P/DHH7l1znuTE5+Rsy7mbEbHEkD2mb4WeGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=jW3JYDXC; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="jW3JYDXC"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3AD0840C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1767735309; bh=rSBXZfdb6H2W4KmDM3996hrBu+p5l38FdG9A9GtVZFc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jW3JYDXCl3T26gc4oyy0UAJCKkGQujtmuJw2xHjSiDgzRiPK2hu1rN0mGG92+HU8P
	 SItuLiwynxX3r8Z8ZWLygq3GP/6P4ypBet1UMbTYVVijb2yG7uGQLZ7p4GDTCKKKrD
	 utC4IGWrRGfsHHBiOuvfv13eBdEH5kOEDZVTgml+h0l1OOh7Rz6sOqQR20HMoxtSnH
	 SPIIB4si7DBDP9rRRnDAC0sTwDtwqWDiziIwF4Vi4/kOZ4yf9Kj9g7bFOGiaaKHeRd
	 Lsk0jn3Eint+PD3HDBDTQlI7GJYbcGZezj6Wxj9GX5cBlnjYamop9BoTv4LaRsWvnz
	 vn0GO1O8vHh8A==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3AD0840C7D;
	Tue,  6 Jan 2026 21:35:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Masaharu Noguchi <nogunix@gmail.com>, Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Masaharu
 Noguchi <nogunix@gmail.com>
Subject: Re: [PATCH] docs/ja_JP: fix typos in submit-checklist.rst
In-Reply-To: <20260103-b4-practice-docs-typo-v1-1-d68ad6a22ab5@gmail.com>
References: <20260103-b4-practice-docs-typo-v1-1-d68ad6a22ab5@gmail.com>
Date: Tue, 06 Jan 2026 14:35:08 -0700
Message-ID: <87pl7me86r.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Masaharu Noguchi <nogunix@gmail.com> writes:

> Fix spelling errors in the Japanese translation:
>
> - "Menu attibutes: default value" -> "Menu attributes: default value"
> - "Documentaion/ABI/" -> "Documentation/ABI/"
>
> No change in meaning intended.
>
> Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
> ---
>  Documentation/translations/ja_JP/process/submit-checklist.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

jon
