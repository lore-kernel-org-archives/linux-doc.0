Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B9B131745
	for <linux-doc@vger.kernel.org>; Tue,  2 Apr 2024 15:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712071915; cv=none; b=tndTpajdPkef2UZROOlGD4mqjtat6jIGVIlBt/YxypU7yiwQTBH9H1LqkyZtc9czzzI7DJkN+BuVWibaBh1ul2djfvUep01Ss36dt3/gl4h7g79wSvY7TAiEjher6sjy6v2TIBLPfNFh6awj0P505G5h43ZAEUhERq/iq14iDBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712071915; c=relaxed/simple;
	bh=bYVVKMjogRnw/uMvri1bHvGPMbImewtmZaM+z5yLJZU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=M1mYVwY0g2qo64Is2Bd/dCbZTl4hblpLMkoFnjhdQMUFAkv1jFohcTlUpdU9G8mMHTnwMi+gy5+O4pApi92OL3HKGrBMUJLLXkJEmxmqmiUWlTLgMMWH8N/cZOS7cWA3Z/vt//QzT5sgig/HC49Qu7gduB2Id/I2SlVXLuswHuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=sn4ZJ4GW; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="sn4ZJ4GW"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 265BE47C1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1712071913; bh=mahJa5pAbCK7y0tcnQaiWo1AR7oTow3P3zqn0g9OI9Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sn4ZJ4GWv8/npgHfv71LG50BsbtA6q4Yd2qidZwGpw8eajDi5VXzDrqqRE1mYyQZ6
	 WmlQ8em/HrIYgqzN124D6AXLJo9whNnRj5FT7SvRsutgkrtig8g6tYIXrg8iUA3nEt
	 O3pPg55fgaxQf0GFer2DiY5wqjtzrFJIY/gOn0l5T+lfYY+VIOFhD4sP5FdVVH6EkX
	 tYYzNAh4I6Sh31fjTuenoBlMyBrqLSRlJkZJz1b39wgabBqvdTfnPixJzY+BNb0gB0
	 XPye2GTn0RaM3sjz1pq3dcjlpfvqrLi4WncSFZevburiWcP1i1ANP/rMgcCq/03K6O
	 uOiz/HG459qhQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 265BE47C1D;
	Tue,  2 Apr 2024 15:31:53 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Maki Hatano <maki.y.hatano@gmail.com>
Cc: linux-doc@vger.kernel.org, Maki Hatano <Maki.Y.Hatano@gmail.com>
Subject: Re: [PATCH] doc: fix spelling about ReStructured Text
In-Reply-To: <20240323062141.14863-1-Maki.Y.Hatano@gmail.com>
References: <20240323062141.14863-1-Maki.Y.Hatano@gmail.com>
Date: Tue, 02 Apr 2024 09:31:52 -0600
Message-ID: <87plv7wzkn.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Maki Hatano <maki.y.hatano@gmail.com> writes:

> - ReStructured Text should be exactly reStructuredText
> - "reStructuredText" is ONE word, not two! according to https://docutils.sourceforge.io/rst.html
>
> Signed-off-by: Maki Hatano <Maki.Y.Hatano@gmail.com>
> ---
>  Documentation/doc-guide/parse-headers.rst  | 2 +-
>  Documentation/index.rst                    | 2 +-
>  Documentation/translations/it_IT/index.rst | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Applied.

jon
