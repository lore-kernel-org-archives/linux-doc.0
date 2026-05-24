Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801152F531B
	for <linux-doc@vger.kernel.org>; Sun, 24 May 2026 22:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779662922; cv=none; b=ffEnjLoBlglOpfiYIKKL8ypTjzfwIukkPypSIfM4lSaf/d6kxrHE5Cthtd3Nri+RgG/JW15VpYANUjIl2xbfMzG34K2nZ3iYii6HDXLafRUBPgMgqNH/Nl9UJ5b05GHLStiqAuhZVip5J3szgRa5iSNHARXL7nfDCqwoQDdirUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779662922; c=relaxed/simple;
	bh=8Dywp8qieHnOll/eyXaZorlygUaejtk0PcmrJribK/U=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gEybu76gqZBCcBz6QWYyhPN+x9niImOsKIy8luZojRDe1xhyoA3itvhvPO3uv0r29Wi8yxoTa1qQQQ6e+HxZPaBtF/qtBf+qVyDwfd7+s8A/J639x52ozcfU364unXg1IN8ogYIhzrM4ISuy32HrYtsCdMA941ims6TijgBS4xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=LZ8bqUP3; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="LZ8bqUP3"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7F07740B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1779662915; bh=/MDquMr5QEzzkeO7gsAwcecZe+y5ZD9+kJH2naCzgHE=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=LZ8bqUP38wjXtbWFF1PCoh9L1nlJSFj2f1WRTf+TS4YfVI5Fa/PaYRiPzI7qTaaLv
	 /Qa4svc3Z9nak6Li0SvaQxDTaCQlAgLAkfEt1hascd/ZgIWyD23qTzqlLGLR96Wvcw
	 u+RXVhnzG1DU3ZI5ldJoscCiZG5g2qST5Pjatp/2m6d+MJzaOly2awiqSelG0WlVyl
	 wGqByUHKCq6xjuLhZTvH73KtVCbGjwyjVJSLA5Tldy30ghiY4OuVbqoR7F0iHzpErI
	 CLyKRKW0KkIxGLZbTmdh1XMurKVjcjefLKtTdIHBNpV+zwZjDFifcGtmGjjIh+aPus
	 seh/rShbbTMwQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7F07740B0C;
	Sun, 24 May 2026 22:48:35 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: pt_BR: Translate process/kernel-docs.rst into
 Portuguese
In-Reply-To: <CAMAsx6fBZTSvtNcWKKQvWTXZAvh9W3GuA5ZES0RdY6gLwH8n0A@mail.gmail.com>
References: <20260519163434.1045462-1-danielmaraboo@gmail.com>
 <CAMAsx6fBZTSvtNcWKKQvWTXZAvh9W3GuA5ZES0RdY6gLwH8n0A@mail.gmail.com>
Date: Sun, 24 May 2026 16:48:34 -0600
Message-ID: <8733zg2zlp.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Daniel Pereira <danielmaraboo@gmail.com> writes:

> I=E2=80=99m just checking in to see if you had a chance to look at my pat=
ch,
> "docs: pt_BR: Translate process/kernel-docs.rst into Portuguese",
> which I sent on May 19.
> 1

Five days is a bit quick to be sending pings.  You must have seen by now
that I always get there in the end :)

jon
