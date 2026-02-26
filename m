Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023833C198F
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 22:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772143669; cv=none; b=cuCsXCPgJTupC8rUjdQmn6M5Jo/FbgeUPYNpmM0IabtVgzsnMlafjxtKayf6jcFOWMbre5WkrvkWA+oZN4PKesX9Pj9AX0CgJ1w6zQfhS6hZhDV1taPtoOWqKpXq+pShOu/xmyXGcZ5FwCPv3w6Y9rHIbynZH4tJQ+hFOhBxk0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772143669; c=relaxed/simple;
	bh=q3cnt4SpIEG+0xzMUJ8U19bIyT5Z1xRjlibZXkCAZVQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=X0uwRj8cgbv/Vid91oBq0H2hYbY/r7Qj+MLUnCPGD9/BEn8lctXc6jz8vujByZT+S1iD8slbvhVhZTpEW6ru21SCb5g5g+n4HwB6uymDoZoBHkTYqFIdMp8y4MsbMkbF7CiYq6/8Ryw4leXDmqLCMegLbdf346Z+Am9nlxNx7Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=RLVvWIB9; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="RLVvWIB9"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C43FC40C9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1772143661; bh=M5Vzfrx6gd4rH4C54SceFcecp7VvTPkdb9PY+1Exrp4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RLVvWIB9YWTXQLCbie/Lij0VX6u9ritmMnocq7CEf5EZiye2ozJg3l22/aguqY6nl
	 H99bwZbaKbI4nRmWBkrQ0Cg060TtyWT7R399Xj0TeJqaQmIhMJ2zDV7I1Ow+SCj6Ka
	 ibgB0UW8D5S+ti8hIoxoaEN8DwMlvC5hOdi6M6iuB3H0JU5JG3fUBXPLElrQGiv3vA
	 sHquJufnbvRZYP0VB7qKh/jP7Kjfd5D23AyAuogFBqJHsg1Wbqzqq2DxpYzqEK0Orm
	 C/ofUOzEW6YK4yoMWhqkhRz3K0pzVlvCRo1VuBTXtbwRcHTOOSksPdckNzXJrh6jiD
	 s8EcjuSuLS2BA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C43FC40C9C;
	Thu, 26 Feb 2026 22:07:40 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH docs-next] docs: pt_BR: Add translation for
 maintainer-handbooks
In-Reply-To: <20260226212716.260546-1-danielmaraboo@gmail.com>
References: <20260226212716.260546-1-danielmaraboo@gmail.com>
Date: Thu, 26 Feb 2026 15:07:39 -0700
Message-ID: <87o6lb5fbo.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Add the Brazilian Portuguese translation for the maintainer-handbooks
> documentation. This document provides subsystem-specific development
> process notes. Also, update the main pt_BR index to include the new
> translation.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> ---
>  Documentation/translations/pt_BR/index.rst            |  1 +
>  .../pt_BR/process/maintainer-handbooks.rst            | 11 +++++++++++
>  2 files changed, 12 insertions(+)
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
> index 000000000..849c7705f
> --- /dev/null
> +++ b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
> @@ -0,0 +1,11 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _pt_maintainer_handbooks_main:

Not really your fault but ... I have been trying for a while to stamp
out this habit of putting unneeded labels at the tops of files.  This
one isn't used at all; when they are used, it is far better to just give
the name of the relevant file and let the automarkup magic do its thing.

> +Notas sobre o processo de desenvolvimento de subsistemas e mantenedores
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +O prop=C3=B3sito deste documento =C3=A9 fornecer informa=C3=A7=C3=B5es e=
spec=C3=ADficas de
> +subsistemas que s=C3=A3o suplementares ao manual geral do processo de
> +desenvolvimento :ref:`Documentation/process <development_process_main>`.
> +

Thanks,

jon
