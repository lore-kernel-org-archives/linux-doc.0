Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B86434E24
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 15:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784560199; cv=none; b=gZHfYhnr7/DjFsOn6/2nw3xOjzKmUm7LudaelTbTr7F3cVcTQtZt4xM0tx0qty/AINcV9/7OX0TN1EmSP5kErhjPEzHkNuwlyJDG7jTRyKeFEcRvPLt5/Lv4rff/ZpXJmEwftPqLApQ2UDBFIcf2chJHTJ/zrlB13ihrgPZ3tB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784560199; c=relaxed/simple;
	bh=xEizo3hqAqawKaL13o576PFtqu2c+3M9jLJDNF94KvE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uUPHhhZWuL+OCrq5+B7+fKXLSUDuddPocVCD0uHgYM+cMK1w9RSRTC/hMw0jmHpTJ686Ff3wF1bzrRLrWVHTNRpgg0OZLvUAkbx9IuA06Ac0kztcFQFRF+pVepDpcGT5dcrLoe43CYZp7ra5RtSze1ew4qryOad5EpRBaefav2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Tx6hPUR0; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Tx6hPUR0"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 21FEC408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1784560197; bh=NVCZD+w45Z6v3Wu+5N+WHpu//naJuyhaYxswP6vPxiA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Tx6hPUR0Uik5g3UPyAdcfb6sGuH5/9hosObwOTRDK2xmNPSwpNkgulvM1JEv/DKrc
	 /e0jB1J7p0rxt77XhwgHcARHlQm1d3B5RR+2KuGeHDjMjz02mdHeZh2q/vk/w5wc+Y
	 6vx2FAZv5tis6GbmJMNQ/u8lGPhSVOWtunz6AOrxEnpDLuOZbSo4qTS5gLG2bPp4PG
	 ks1O28CqZU0rdkHBBKbSG4S46tRdqfjflNEoAQ/ebMJxx0RhnvcXrajOLxUuCNGj9l
	 XKVNACmdatzmZyRRyQXc6uwxrQCUhDB82BDbSz+Q9B5IIRhrmqpzIriYlilq85I+hR
	 0lZoq2UOLuxVA==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 21FEC408B2;
	Mon, 20 Jul 2026 15:09:57 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re:
In-Reply-To: <CAMAsx6e11Vsc5K0s--bzqr1fd=mr-2BFYsLUNs5Frz--TBiUTQ@mail.gmail.com>
References: <20260716021013.48025-1-danielmaraboo@gmail.com>
 <87ldba5z1u.fsf@trenco.lwn.net>
 <CAMAsx6cO588DcqAT9c=-7aXWLwzAbjrAp=jJ9Ya9dC7draaPZA@mail.gmail.com>
 <87h5lx69wl.fsf@trenco.lwn.net>
 <CAMAsx6e11Vsc5K0s--bzqr1fd=mr-2BFYsLUNs5Frz--TBiUTQ@mail.gmail.com>
Date: Mon, 20 Jul 2026 09:09:56 -0600
Message-ID: <877bmp4rzv.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Daniel Pereira <danielmaraboo@gmail.com> writes:

> I=E2=80=99ve noticed a large volume of new contributions for the pt_BR
> translations recently.
>
> To avoid conflicts during this integration period, could I keep the
> index.rst as it is until these recent patches are applied? Once
> everything is processed, I will make the adjustments to the structure
> to follow the organization of the English documentation as you
> suggested.

In the end, you are in charge of that translation.  I do ask
translations to follow the structure of the English docs, but I'll let
the maintainer decide the best way to get there.

Thanks,

jon
