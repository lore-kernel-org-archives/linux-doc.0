Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B813257824
	for <linux-doc@vger.kernel.org>; Sun,  3 May 2026 14:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777819405; cv=none; b=AhHUcDuQtaiPdcY0MTtp1j2ITT0bzERMGp0cdPEK1U3YAFk9gSd3PslwztlQXL15L5+hRcOX3g9na5MgwMfjiyxi6EnSeVW2EzIsDoyGffD27NG5xMK5xwmLc1bXFJQmCcPtkhgvIT3y3dDbbYXfSV0qH+U62S5QlqkBtlUNKtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777819405; c=relaxed/simple;
	bh=6w0szqBLvYhAJ2eH/MVtgwXyovRHc+SlxSB8CHxLfOg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dUZDjfAK2m7L4UzKOjRZZg5W5nPB5cyUalVsItWoepmmK7kICyR+AB6pPC+mAiFkr0yXxYdpHU4KdCsY2/XHHM+UoqyBKQwk2jQHPC9b9e0azaFKEMutYE710/Vgb66/vEFmqnMH9EhHj2QsJ+BXPgO0pVvcBNf24+ghfmwrIgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=jqOVe1AS; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="jqOVe1AS"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3194141084
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777819403; bh=O1HEGrpmkJhbq4CEkkDJj5MAKb2ig0EC82kFbR9JEHs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jqOVe1ASh7wyuuGf8hNjcGjPm4q3l435M/zfA2x1hWHGFNB0T5H9LjCt2V2zoLznM
	 2gpFwcvxCZHnZWYA+HU+DvJYlq3XIPY2vU9yUMiAcWmEnyyfo/ajbnr66mZUxHB9Lz
	 G579z5e+UHeFGoi4hsKc85gaWr3t/DGeE1fqVJQAZLFUQIOF6mFfVm5bwhx6DLD6Cd
	 Ac8FmmJcc+qop710J1M/JmzNvsRr+D1pQjWZYRV9pBB8tWJ1RA4dFvM+Z7r/j9Vz4j
	 77PpO8GfnKb9/4ZFijcS3Zy/AT8yeCXuXxbhXuoQz8wIfGdwsEmjJVF+SXeuuV93Rg
	 lolmjnybUQCMw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3194141084;
	Sun,  3 May 2026 14:43:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH] docs: pt_BR: translate process/license-rules.rst
In-Reply-To: <20260501053046.666628-1-danielmaraboo@gmail.com>
References: <20260501053046.666628-1-danielmaraboo@gmail.com>
Date: Sun, 03 May 2026 08:43:20 -0600
Message-ID: <871pfseepj.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Translate the license-rules.rst document into Brazilian Portuguese.
> This document provides guidelines on how licenses should be identified
> and handled within the kernel source code.
>
> Additionally, update the pt_BR/process/index.rst to include the new
> translation in the documentation tree.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> ---
>  Documentation/translations/pt_BR/index.rst    |   1 +
>  .../pt_BR/process/license-rules.rst           | 484 ++++++++++++++++++
>  2 files changed, 485 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/license-rule=
s.rst

This patch adds a new build warning:

  Documentation/translations/pt_BR/process/license-rules.rst:73: WARNING: L=
ine block ends without a blank line. [docutils]

That is caused by...

> diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/t=
ranslations/pt_BR/index.rst
> index 4a094d8b7..77c1a1cdc 100644
> --- a/Documentation/translations/pt_BR/index.rst
> +++ b/Documentation/translations/pt_BR/index.rst
> @@ -67,6 +67,7 @@ kernel e sobre como ver seu trabalho integrado.
>     :maxdepth: 1
>=20=20
>     Introdu=C3=A7=C3=A3o <process/1.Intro>
> +   Regras de licenciamento <process/license-rules>
>     Como come=C3=A7ar <process/howto>
>     Requisitos m=C3=ADnimos <process/changes>
>     Conclave (Continuidade do projeto) <process/conclave>
> diff --git a/Documentation/translations/pt_BR/process/license-rules.rst b=
/Documentation/translations/pt_BR/process/license-rules.rst
> new file mode 100644
> index 000000000..93ecc57f3
> --- /dev/null
> +++ b/Documentation/translations/pt_BR/process/license-rules.rst
> @@ -0,0 +1,484 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Regras de licenciamento do kernel Linux
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +O Kernel Linux =C3=A9 fornecido apenas sob os termos da licen=C3=A7a GNU=
 General Public
> +License vers=C3=A3o 2 (GPL-2.0), conforme estabelecido em LICENSES/prefe=
rred/GPL-2.0,
> +com uma exce=C3=A7=C3=A3o expl=C3=ADcita para syscalls descrita em
> +LICENSES/exceptions/Linux-syscall-note, conforme descrito no arquivo COP=
YING.
> +
> +Este arquivo de documenta=C3=A7=C3=A3o fornece uma descri=C3=A7=C3=A3o d=
e como cada arquivo-fonte
> +deve ser anotado para tornar sua licen=C3=A7a clara e inequ=C3=ADvoca. E=
le n=C3=A3o substitui
> +a licen=C3=A7a do Kernel.
> +
> +A licen=C3=A7a descrita no arquivo COPYING aplica-se ao c=C3=B3digo-font=
e do kernel como
> +um todo, embora arquivos-fonte individuais possam ter uma licen=C3=A7a d=
iferente, a
> +qual deve ser obrigatoriamente compat=C3=ADvel com a GPL-2.0::
> +
> +    GPL-1.0+  :  GNU General Public License v1.0 ou posterior
> +    GPL-2.0+  :  GNU General Public License v2.0 ou posterior
> +    LGPL-2.0  :  GNU Library General Public License v2 apenas
> +    LGPL-2.0+ :  GNU Library General Public License v2 ou posterior
> +    LGPL-2.1  :  GNU Lesser General Public License v2.1 apenas
> +    LGPL-2.1+ :  GNU Lesser General Public License v2.1 ou posterior
> +
> +Al=C3=A9m disso, arquivos individuais podem ser fornecidos sob uma licen=
=C3=A7a dupla
> +(dual license), por exemplo, uma das variantes GPL compat=C3=ADveis e,
> +alternativamente, sob uma licen=C3=A7a permissiva como BSD, MIT, etc.
> +
> +Os arquivos de cabe=C3=A7alho da API do espa=C3=A7o do usu=C3=A1rio (UAP=
I), que descrevem a
> +interface dos programas do espa=C3=A7o do usu=C3=A1rio com o kernel, s=
=C3=A3o um caso especial.
> +De acordo com a nota no arquivo COPYING do kernel, a interface de syscal=
l =C3=A9 um
> +limite claro, que n=C3=A3o estende os requisitos da GPL a qualquer softw=
are que a
> +utilize para se comunicar com o kernel. Como os cabe=C3=A7alhos UAPI dev=
em ser
> +pass=C3=ADveis de inclus=C3=A3o em quaisquer arquivos-fonte que criem um=
 execut=C3=A1vel
> +executado no kernel Linux, a exce=C3=A7=C3=A3o deve ser documentada por =
uma express=C3=A3o de
> +licen=C3=A7a especial.
> +
> +A forma comum de expressar a licen=C3=A7a de um arquivo-fonte =C3=A9 adi=
cionar o texto
> +padr=C3=A3o (boilerplate) correspondente no coment=C3=A1rio inicial do a=
rquivo. Devido a
> +varia=C3=A7=C3=B5es de formata=C3=A7=C3=A3o, erros de digita=C3=A7=C3=A3=
o, etc., esses "textos padr=C3=A3o" s=C3=A3o
> +dif=C3=ADceis de validar por ferramentas usadas no contexto de conformid=
ade de
> +licen=C3=A7a.
> +
> +Uma alternativa aos textos padr=C3=A3o =C3=A9 o uso de identificadores d=
e licen=C3=A7a
> +Software Package Data Exchange (SPDX) em cada arquivo-fonte. Os identifi=
cadores
> +de licen=C3=A7a SPDX s=C3=A3o abrevia=C3=A7=C3=B5es precisas e analis=C3=
=A1veis por m=C3=A1quina para a
> +licen=C3=A7a sob a qual o conte=C3=BAdo do arquivo =C3=A9 contribu=C3=AD=
do. Os identificadores de
> +licen=C3=A7a SPDX s=C3=A3o gerenciados pelo Grupo de Trabalho SPDX na Li=
nux Foundation e
> +foram acordados por parceiros em toda a ind=C3=BAstria, fornecedores de =
ferramentas
> +e equipes jur=C3=ADdicas. Para mais informa=C3=A7=C3=B5es, consulte http=
s://spdx.org/
> +
> +O kernel Linux exige o identificador SPDX preciso em todos os arquivos-f=
onte.
> +Os identificadores v=C3=A1lidos usados no kernel s=C3=A3o explicados na =
se=C3=A7=C3=A3o
> +`Identificadores de Licen=C3=A7a`_ e foram obtidos da lista de licen=C3=
=A7as
> +oficial do  SPDX em https://spdx.org/licenses/ junto com os textos das l=
icen=C3=A7as.
> +
> +Sintaxe do identificador de licen=C3=A7a
> +-----------------------------------
> +
> +1. Posicionamento:
> +
> +   O identificador de licen=C3=A7a SPDX em arquivos do kernel deve ser a=
dicionado na
> +   primeira linha poss=C3=ADvel do arquivo que possa conter um coment=C3=
=A1rio. Para a
> +   maioria dos arquivos, esta =C3=A9 a primeira linha, exceto para scrip=
ts que
> +   requerem o '#!CAMINHO_PARA_INTERPRETADOR' na primeira linha. Para ess=
es
> +   scripts, o identificador de licen=C3=A7a SPDX deve ser colocado na se=
gunda linha.
> +
> +   A linha do identificador de licen=C3=A7a pode ent=C3=A3o ser seguida =
por uma ou
> +   m=C3=BAltiplas linhas de SPDX-FileCopyrightText, se desejado.
> +
> +|

...^ that character there.

Please fix and resend.

jon
