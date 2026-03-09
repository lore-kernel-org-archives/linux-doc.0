Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DEF3E121A
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 16:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773072020; cv=none; b=NiO6t3qobIl8GrSWmAW1A1vVnz4RZ+YH7/zZ+blQo9R7GzuYzR2duX2f01NqJMOoz1xPemzCPdMktRnqx8h/XLgJ1OYZFwU++Fdiu1EgKBNIslE5O4T5whF4foxO8P7gByJfEyGXmeWfI2VTL8fYqvqYGi0dy/Z60PXk+0xqY0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773072020; c=relaxed/simple;
	bh=svZb6zStY2PMN66jUQRH345llt38Ye32L7shBbuj4+k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dXrcoZK8mE1yxziiP2KPW38YyMmgTl+NS66SM/eXoG2+jLH5gUMtABSi83NwSl8IITQuZq18saAGjIsZypRfRvM4j7kArKZgvrvwtSu2lyo5ui+7fcOODrs1/YoTsmSp0lnlWhNIgxT6EnKVnS/mLRuswXSeRxVmJfA/QVj+OW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=QguJXSmm; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="QguJXSmm"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D6D6740429
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773072018; bh=VSFWIYpv+CZN2yhJD7jT8AWOfSheLe7b1zZSC8MXLLM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QguJXSmmdlpla3Tawr+zFP9izktI0bLlFYHsaCdyFKzemRUsoVji7TjGYC3lPQj+P
	 1g2WGWDJHdbnoKSlxtCg21SttP2VTVY3EAN8KW9MLCvBLjgydZ1r98adnJD/n9zQ3d
	 EL3EGSU4DPPZxwz+vH5CVOK01ms/xWWkQPfxjsfdfeqlp7p+sj0v2iGn6EUlCsuq6H
	 v02BvIG4PLlU1JDgqg+2mMrT0yPYdDe63aBXGy3NEwju6PtctRwhWkcBfu/NyguOUI
	 TGLZQlD+pkW4c2GyOKBTCECC/BECJ4D2NwLC1y8wrTIRMi1yjNLaBQ1YkbezQtTbjc
	 89XGcwL/81NiA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D6D6740429;
	Mon,  9 Mar 2026 16:00:17 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH docs-next v2] docs: pt_BR: add netdev and maintainer
 handbook translations
In-Reply-To: <20260309030411.88945-1-danielmaraboo@gmail.com>
References: <20260309030411.88945-1-danielmaraboo@gmail.com>
Date: Mon, 09 Mar 2026 10:00:17 -0600
Message-ID: <874impxab2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Translate the netdev development process and the maintainer handbooks
> into Brazilian Portuguese. Also, update the main pt_BR index to
> link these documents.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> ---
> v2:
>   - Fixed "Title level inconsistent" error in maintainer-netdev.rst (line=
 233).
>   - Corrected section header hierarchy and length to match Sphinx require=
ments.
>   - Fixed formatting errors in section headers (corrected "=3D=3D" marker=
s).
>   - Cleaned up trailing whitespaces to pass checkpatch.pl.
> v1:
>   - Initial submission.

A couple of minor notes follow...

>  Documentation/translations/pt_BR/index.rst    |   1 +
>  .../pt_BR/process/maintainer-handbooks.rst    |  10 +-
>  .../pt_BR/process/maintainer-netdev.rst       | 788 ++++++++++++++++++
>  3 files changed, 798 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/pt_BR/process/maintainer-n=
etdev.rst
>
> diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/t=
ranslations/pt_BR/index.rst
> index de5c005f9..8822e21cf 100644
> --- a/Documentation/translations/pt_BR/index.rst
> +++ b/Documentation/translations/pt_BR/index.rst
> @@ -69,3 +69,4 @@ kernel e sobre como ver seu trabalho integrado.
>     Como come=C3=A7ar <process/howto>
>     Requisitos m=C3=ADnimos <process/changes>
>     Manuais dos mantenedores <process/maintainer-handbooks>
> +   Processo do subsistema de rede (netdev) <process/maintainer-netdev>
> diff --git a/Documentation/translations/pt_BR/process/maintainer-handbook=
s.rst b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
> index eb650bc60..2d0a029e6 100644
> --- a/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
> +++ b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
> @@ -5,4 +5,12 @@ Notas sobre o processo de desenvolvimento de subsistemas=
 e mantenedores
>=20=20
>  O prop=C3=B3sito deste documento =C3=A9 fornecer informa=C3=A7=C3=B5es e=
spec=C3=ADficas de
>  subsistemas que s=C3=A3o suplementares ao manual geral do processo de
> -desenvolvimento :ref:`Documentation/process <development_process_main>`.
> +desenvolvimento.
> +
> +Conte=C3=BAdos:
> +
> +.. toctree::
> +   :numbered:
> +   :maxdepth: 2
> +
> +   maintainer-netdev
> \ No newline at end of file

Files should have a final newline, you don't really want to see this in
a diff.  Most editors can be configured to ensure that the final newline
is there.

> diff --git a/Documentation/translations/pt_BR/process/maintainer-netdev.r=
st b/Documentation/translations/pt_BR/process/maintainer-netdev.rst
> new file mode 100644
> index 000000000..abda4fe70
> --- /dev/null
> +++ b/Documentation/translations/pt_BR/process/maintainer-netdev.rst
> @@ -0,0 +1,788 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Subsistema de Rede do Linux (netdev)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +tl;dr
> +-----
> +
> +- **Direcione seu patch para uma =C3=A1rvore** =E2=80=93 use ``[PATCH ne=
t]``para corre=C3=A7=C3=B5es
> +  ou ``[PATCH net-next]`` para novas funcionalidades.
> +- **Tag Fixes** =E2=80=93 para corre=C3=A7=C3=B5es, a tag ``Fixes:`` =C3=
=A9 obrigat=C3=B3ria,
> +  independentemente da =C3=A1rvore de destino.
> +- **Tamanho da s=C3=A9rie** =E2=80=93 n=C3=A3o envie s=C3=A9ries grandes=
 (> 15 patches);divida-as em
> +  partes menores.
> +- **Intervalo de envio** =E2=80=93 n=C3=A3o reenvie seus patches dentro =
de um per=C3=ADodo de 24
> +  horas.
> +- **Reverse xmas tree** =E2=80=93 organize as declara=C3=A7=C3=B5es de v=
ari=C3=A1veis locais da mais
> +  longa para a mais curta.
> +
> +netdev
> +------
> +A **netdev** =C3=A9 a lista de discuss=C3=A3o para todos os assuntos do =
Linux
> +relacionados
> +a rede. Isso inclui qualquer item encontrado em ``net/`` (ex: c=C3=B3digo
> +principal
> +como IPv6) e  em ``drivers/net`` (ex: drivers espec=C3=ADficos de hardwa=
re)
> +na =C3=A1rvore
> +de diret=C3=B3rios do Linux.

Why the strange line breaks throughout this file?  That will make
reading the plain text rather harder.

Thanks,

jon
