Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03B928EBE0
	for <linux-doc@vger.kernel.org>; Wed,  4 Jun 2025 14:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749046979; cv=none; b=aDXzuUJRG8oWdcAmH8FHWthV+qBR3e+0nB0v8CILsigiDA/ViFTKYyI5NTAl8UPApeB24S95S3NoruWv2TUbNzG6iv7qIBhs8oUCChiPma7OOfuQZOgUYnbiRy6OzZyRBUsGPFs3ykzU58IDmIZRHqkkLJ0LNY2N0IYYuMj66Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749046979; c=relaxed/simple;
	bh=dYm++YnrL8zCQC+sjh+lMcntHVwgY5Sd/ZEmu2bXGoI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gdyA6qou4VtBsrPPTJx4CKpfIIfII6NSCI1mkJMCUH0mWGTCW3WEFUmlblTIKYnXJnjr4g1NKyPY9ILSj/W9ucfrl5Uc3PZeCXZNj2V/e7zCCH6bBp3Q6EfmCeJvwL9OwNMde45d3nmIEd65glIaPLo7dEAN7eTrOWcNtXvVa9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=j7t2zWfK; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="j7t2zWfK"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net ABBA141AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749046976; bh=aGTut64nkL6so8PrKPQrTlqiiRCTLtSzrjI2OA/CS2Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=j7t2zWfKdESIwq0Wqt5IzHHdB+Zu5pz8wi+Y/wOjFkjwZGGfo2JRHIfWGasSdeaNW
	 z+YsqkSsj46HO+CC76uzCqUgNTf+beoXs17pAE09fqXY4VJLyjE3btq4z3jLkLbTJI
	 LIMFkXEZJ98dfbumduZucS9xxpoO6leDaFHBfUe49rpUJb+CzI7kV1ObO0utF/ThXh
	 eTaFaK+KI2DpfB6DqB7m2L/Q7XrpjwxX4Yn3TWOM4qL9znn51ICrRGxBtx62PXp3dZ
	 GQfydkfBy8tzRcmshbKM/la+6kPZe6FwKjwjG2u/I5op0bH3nSr773TJJNMkueZZfP
	 8PBBOjYTdBWgw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id ABBA141AA1;
	Wed,  4 Jun 2025 14:22:56 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 Mauro Carvalho
 Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] docs: automarkup: Mark up undocumented entities too
In-Reply-To: <76dd6fd8-1f6b-4c4c-9c0c-2458f4709ace@notapiano>
References: <87cybklp2n.fsf@trenco.lwn.net>
 <74558759-8fa4-417e-9879-6a34e8685ef9@notapiano>
 <87zfeojzr0.fsf@trenco.lwn.net>
 <e6232bfc-092d-478c-b085-72bf4e9544f6@notapiano>
 <87r000jvcl.fsf@trenco.lwn.net> <87iklcjul5.fsf@trenco.lwn.net>
 <20250604093653.7e2b88e5@foz.lan>
 <76dd6fd8-1f6b-4c4c-9c0c-2458f4709ace@notapiano>
Date: Wed, 04 Jun 2025 08:22:55 -0600
Message-ID: <87sekfio1s.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com> writes:

> FWIW, I haven't tested it, but it looks like there's a text-underline-off=
set CSS
> property that could be used if you do want to use text-decoration for
> better semantics/portability but prevent it from clashing with the underl=
ines
> which would impact legibility.

Ah ... I hadn't known about that.  Of course there's an obscure CSS knob
... it works pretty well.  I'll send a new version using that shortly,
thanks for the suggestion!

jon
