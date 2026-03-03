Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4667D351C23
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 17:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772557596; cv=none; b=aepsgMnAFaG629nfrW9No99nfVGgjmTEq3xJTgem/QXJJyW3kElC4LwFnqfp8qZqvowv2rf3qTGc5F0vN7XQDPsodaG5RQrsvz9/2Es8HxCh8ZX8lVOT32s+FohLfYmKvygHjlfT2F+eIvR0/9gywAqccaaiMEM+DtbzQSx4EFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772557596; c=relaxed/simple;
	bh=wRHvv374BAxZkGphZck4WmXNRZuv9brr1GQS0TWa22o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OJqVDi4O40hucwITosTiNgmnFnzyc5vM/VyZEjyD0AXGdryM70uqhc2QNSkCCr7jnj+tXTMvYMDcuTMFeZV3yeq/bPClITWfOazVju39YFfj4KIqqKXvE/iAnOWENHGDKFKLwrlqgzpspZI+F0b6V/kF6iMyHnc1p5p0nrTmFRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=N1Zzg/2G; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="N1Zzg/2G"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 946B740429
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1772557594; bh=NHgvPPYsaZmDYNAzbF/EvuaDDYgHTUsxhS0JWwIdfXM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=N1Zzg/2G8pDk1psg+pvBL9NKjtHa47EKx+4jiIghom6rD84c4nqFB9hf9oDqnzW2P
	 FRhf3mQUASUBXOYw+TxzjYEWSKtCPP4t8C7zZRD4T7cMLZA0QoYNwlAOssmmKDKTHp
	 hFqw6hh6Ct8p1KvJMllXa1P7hYATUUn7H7MONB3Fuc+4p9n1o/1sIytq87hR93b6yj
	 pavjt6IuW4YXdjb3kW+5swDXv203AXjmmBuDTcrgjKVFOXG/CxGeeNyC9Di3oib1+m
	 /zalPjy0j9vHQijIFIZZtzNDdfpNm0Eetikj9Xb6GEz9EduuMVhPD+yhUWbtG0bPLY
	 DaOsP7ZYyakjA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 946B740429;
	Tue,  3 Mar 2026 17:06:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH docs-next v2] docs: pt_BR: Add translation for
 maintainer-handbooks
In-Reply-To: <20260226225849.268373-1-danielmaraboo@gmail.com>
References: <20260226225849.268373-1-danielmaraboo@gmail.com>
Date: Tue, 03 Mar 2026 10:06:33 -0700
Message-ID: <87o6l4dequ.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Translate the maintainer-handbooks.rst into Portuguese (Brazil) and
> update the main index to include it. This document provides a starting
> point for subsystem-specific development processes.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> ---
>  Documentation/translations/pt_BR/index.rst                | 1 +
>  .../translations/pt_BR/process/maintainer-handbooks.rst   | 8 ++++++++
>  2 files changed, 9 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/maintainer-h=
andbooks.rst
>
> diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/t=
ranslations/pt_BR/index.rst
> index 55f9f377e..de5c005f9 100644
> --- a/Documentation/translations/pt_BR/index.rst
> +++ b/Documentation/translations/pt_BR/index.rst
> @@ -68,3 +68,4 @@ kernel e sobre como ver seu trabalho integrado.
>=20=20
>     Como come=C3=A7ar <process/howto>
>     Requisitos m=C3=ADnimos <process/changes>
> +   Manuais dos mantenedores <process/maintainer-handbooks>
> diff --git a/Documentation/translations/pt_BR/process/maintainer-handbook=
s.rst b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
> new file mode 100644
> index 000000000..eb650bc60
> --- /dev/null
> +++ b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
> @@ -0,0 +1,8 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Notas sobre o processo de desenvolvimento de subsistemas e mantenedores
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +O prop=C3=B3sito deste documento =C3=A9 fornecer informa=C3=A7=C3=B5es e=
spec=C3=ADficas de
> +subsistemas que s=C3=A3o suplementares ao manual geral do processo de
> +desenvolvimento :ref:`Documentation/process <development_process_main>`.

By now you know what I'm going to say here...:)  That is another useless
top-of-the-file label.  I won't insist you adjust all of these (I've
applied this patch), but I will be removing this label in a patch of my
own.

jon
