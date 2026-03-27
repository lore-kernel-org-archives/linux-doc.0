Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F5F2ED154
	for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2026 14:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774620301; cv=none; b=uX7OMB0c4l8DmmbfWZqKVy+J5UMlh1t5o5h/1BAZbtzAY/m8bMGo8RiSPBBuiAj+pw6XEGOLgYcgqei2D3NyjlvKOnMUzbO6FfCwET+W8hBEepL/1e8St0+okTgGWzYx3yav6BoEIXbJHqTokpuw2THsUIR3dXhusjOVjZkHE9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774620301; c=relaxed/simple;
	bh=lRWr4C2pnQh1xgkdJ5Cr7CoacJPx+KOgD4rFq7MBhss=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=caSx84gpAFPfwYxVkQ1cVmdZuCY2dClYYzXb63aU7EA2MH0s52MQsf8UJ03rMcZY0HqgZCy05si3JivPkaenbUddg3bAFqwKgt6OkBoc1v36sMavPIUG751Zr0NCvc3DL/i1hMMKTIKMAXVrOcAlIciYZ34CwIEwHtcgNfhiEus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lUTgXvOz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lUTgXvOz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503AAC19423;
	Fri, 27 Mar 2026 14:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774620301;
	bh=lRWr4C2pnQh1xgkdJ5Cr7CoacJPx+KOgD4rFq7MBhss=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lUTgXvOzyWu9j5Au1FhkLU7l+8Lm90ipHUBk8XCfj+X/zSCgeHFf+tkMBVPUoudsJ
	 z9vxbjwvUA15B2d6iKwxj8MYGBwPaQYc289jH/f5rQ/F0hAi2MWnUEGDorCeizWcRs
	 iOUgdw+RxL+Xo1fyQrqzx+pHk19d6MK+OlWoLbyD1JciwLJr5ElhBrfvsVtxRTUvYm
	 VM8woUzJhkpVBgSYSH8SR0rOWcf00zAp63gtAFJZeRdRX2V2eXfumbit0Re88V0azw
	 KZRhftFEQomaPt8H9kA1bG0uhqw49so+GaC2DTFfIPlxSQc7yAnG6usJ2bKd6BSz2L
	 Pyc+Co7RFtPOQ==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w67o3-00000002hbs-0lm1;
	Fri, 27 Mar 2026 15:04:59 +0100
Date: Fri, 27 Mar 2026 15:04:58 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/5] docs: pt_BR: start translation of the PGP
 maintainer guide
Message-ID: <20260327150458.4ae9c695@localhost>
In-Reply-To: <20260327125538.581064-3-danielmaraboo@gmail.com>
References: <20260327125538.581064-1-danielmaraboo@gmail.com>
	<20260327125538.581064-3-danielmaraboo@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Fri, 27 Mar 2026 09:55:33 -0300
Daniel Pereira <danielmaraboo@gmail.com> wrote:

> Translate the initial sections of the Kernel Maintainer PGP guide
> into Brazilian Portuguese.

While I don't intend to review those translations, I ended reading
this one for curiosity and found one issue ;-)

>=20
> This first part covers:
> - The role of PGP in Linux kernel development.
> - The principle of trusting developers instead of infrastructure.
> - GnuPG tool requirements and gpg-agent configuration.
> - Understanding PGP subkeys and their specific capabilities (S, E, A, C).
> - Guidelines for strong passphrases and creating separate signing subkeys.
>=20
> The translation maintains the 80-column limit and adheres to the
> standard cryptographic terminology used in the Portuguese documentation
> subsystem.
>=20
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> ---
>  Documentation/translations/pt_BR/index.rst    |   1 +
>  .../pt_BR/process/maintainer-pgp-guide.rst    | 202 ++++++++++++++++++
>  2 files changed, 203 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/maintainer-p=
gp-guide.rst
>=20
> diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/t=
ranslations/pt_BR/index.rst
> index 4a094d8b7..3d3d42388 100644
> --- a/Documentation/translations/pt_BR/index.rst
> +++ b/Documentation/translations/pt_BR/index.rst
> @@ -75,3 +75,4 @@ kernel e sobre como ver seu trabalho integrado.
>     Processo do subsistema SoC <process/maintainer-soc>
>     Conformidade de DTS para SoC <process/maintainer-soc-clean-dts>
>     Processo do subsistema KVM x86 <process/maintainer-kvm-x86>
> +   Guia de PGP para mantenedores <process/maintainer-pgp-guide>
> diff --git a/Documentation/translations/pt_BR/process/maintainer-pgp-guid=
e.rst b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
> new file mode 100644
> index 000000000..e10336a12
> --- /dev/null
> +++ b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
> @@ -0,0 +1,202 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Guia de PGP para Mantenedores do Kernel Linux
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +:Autor: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> +
> +Este documento =C3=A9 voltado para desenvolvedores do kernel Linux, e es=
pecialmente
> +para mantenedores de subsistemas. Ele cont=C3=A9m um subconjunto das inf=
orma=C3=A7=C3=B5es
> +discutidas no guia mais geral "`Protegendo a Integridade do C=C3=B3digo`=
_" publicado pela
> +Linux Foundation. Leia esse documento para uma discuss=C3=A3o mais aprof=
undada sobre
> +alguns dos t=C3=B3picos mencionados neste guia.
> +
> +.. _`Protegendo a Integridade do C=C3=B3digo`: https://github.com/lfit/i=
tpol/blob/master/protecting-code-integrity.md
> +
> +O papel do PGP no desenvolvimento do Kernel Linux
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +O PGP ajuda a garantir a integridade do c=C3=B3digo que =C3=A9 produzido=
 pela comunidade
> +de desenvolvimento do kernel Linux e, em menor grau, a estabelecer canai=
s de
> +comunica=C3=A7=C3=A3o confi=C3=A1veis entre desenvolvedores por meio da =
troca de e-mails
> +assinados com PGP.
> +
> +O c=C3=B3digo-fonte do kernel Linux est=C3=A1 dispon=C3=ADvel em dois fo=
rmatos principais:
> +
> +- Reposit=C3=B3rios de fontes distribu=C3=ADdos (git)

> +- Snapshots de lan=C3=A7amentos peri=C3=B3dicos (tarballs)
Here, the original text is:
	- Periodic release snapshots (tarballs)

Which is OK on English, but the translation itself sounded
meaningless to my eyes. Also, IMO "release" should not be translated
to plural. Ok, this one is hard as there's no equivalent on Portuguese
to "snapshots" or "tarballs".

Maybe:

	Arquivos de release peri=C3=B3dicos (tarballs)

or:

	Arquivos de release (tarballs)

or, maybe even clearer:

	Arquivos tarballs por release
=09
--=20
Thanks,
Mauro
