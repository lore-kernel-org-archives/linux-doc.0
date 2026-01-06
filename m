Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0079821420B;
	Tue,  6 Jan 2026 21:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767735275; cv=none; b=iXPgWhjo++m5uPanVIMJez6TdjcYS15OMJxu0iKSqsE7PuuE07IOwAWpSsT54adNP8W8JU+jX6KeuCBf3edrmJwo7Z7L75wyjLTlbz5PVUxgEv7Z242egiYjUn3TGkgDeN8be63oBpeHHMEebJXdyy4Oq+YYSA6cPg/RkeTsT24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767735275; c=relaxed/simple;
	bh=TE7Qh6kjobG2isW03frNWcmLu+5mgENCwl7Jt2WXMD8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Yzvygy6cII9aVMkFc5HgjEq1m0JfCsnAbXsCzuSFlnmqntf6RW+DidLQd6UGdVuM+jwRYPlWxhFhQ5EtpiG0Z5bSaaiJ9GTLHsRZEkPfALDlwY6IgfQi/GNbCaa/UpA2Mbs4uUe5fE03DCgKc7ME61Q0+KC9OWxOX5CqcDxMQDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=cVyVhcOA; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="cVyVhcOA"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2944D40C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1767735265; bh=yxOgg0jD1d8FQZiR/dnwbLTGFYMm73RH+63zA7RsDas=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cVyVhcOAmtT7/LHcCqcPEKwSZlKx+en+YogM2fXwMAS+WCGkOt49X698FMMHCUWT9
	 +hZxXQ7YmPVSuzsFZxTQlVlZ+C/rdHdEwEjjUWSFX5ojRnZWzW4vt9poJyXYPIEtLA
	 dzuhiad9/UkZzwDoT+Bdvmmo2Qp6sWuHzGLjHH2/JAzeCUHQh5FqBW8wtd+oLILTJ0
	 4QK93+3+UOl4x9x/N7+/rjbHyCuy8DYH0YL4zr4dGnq5fUisuuxjg7507VA4rbgtnb
	 Xs50aqqTd51ftNX6SyfFkiwn4IUIpDrTUSqxwuWnfX2NtJ4V58akKP36+XTlCu4oFe
	 0KIkMGxr92RKg==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2944D40C7D;
	Tue,  6 Jan 2026 21:34:25 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Masaharu Noguchi <nogunix@gmail.com>, Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Masaharu
 Noguchi <nogunix@gmail.com>
Subject: Re: [PATCH v2 0/2] docs/ja_JP: fixes in howto.rst translation
In-Reply-To: <20260104-ja-howto-v2-0-8cac525b3dfe@gmail.com>
References: <20260104-ja-howto-v2-0-8cac525b3dfe@gmail.com>
Date: Tue, 06 Jan 2026 14:34:24 -0700
Message-ID: <87tswye87z.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Masaharu Noguchi <nogunix@gmail.com> writes:

> This series contains two small fixes to the Japanese translation of
> Documentation/translations/ja_JP/process/howto.rst ("HOWTO do Linux kernel
> development").
>
> Patch 1/2 fixes obvious typos and duplicated phrases.
> Patch 2/2 fixes the translation of "freestanding C environment", which
> previously implied that the kernel is independent of the C language.
>
> Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
> ---
> Changes in v2:
> - Adopt =E3=80=8C=E8=87=AA=E7=AB=8B=E3=81=97=E3=81=9F C =E7=92=B0=E5=A2=
=83=E3=80=8D for "freestanding C environment".
> - Link to v1: https://lore.kernel.org/r/20260104-ja-howto-v1-0-53e5564a47=
d9@gmail.com
>
> ---
> Masaharu Noguchi (2):
>       docs/ja_JP: fix typos and duplicated phrases in kernel development =
guide
>       docs/ja_JP: fix translation of freestanding C environment
>
>  Documentation/translations/ja_JP/process/howto.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

jon
