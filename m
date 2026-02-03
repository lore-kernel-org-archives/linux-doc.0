Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0706930FF27
	for <linux-doc@vger.kernel.org>; Tue,  3 Feb 2026 15:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770131296; cv=none; b=pRqACggi6vt4nxh/qj5gUs7IuNDja8RRzypKEnKUNlXpgZkI2zKJrR5b1SyQZl4MlgRQFPisyt5OYaunnJcxgbVhuCURL/iFe1ZFEB3Ogd9CqWFENGy/5AQvw7HfElN8zYytS7iGcKxO6mj7L05SsOikFGhbidj2bCow4Rj/M2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770131296; c=relaxed/simple;
	bh=8GINnqKygDpTFkA/KD3M9ROxHpLiGrhuMp4u7WmWTb0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mLaRfHpsVMQ17abDqj9rproBe8OrSzmhlkCVvyLR20pDCNHGtPFLt3EgwDg2PB4zEzw8Nxyo5/mzUUovJmxc5dreL/IgkNTzFmpC/hR3vmbyvrCk6PCFQo4StVYAqkb7AB4O3/mvJpTFtJBlZj14AyC2wqnsOWlwpFeUccv1CmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=dxtdAFlL; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="dxtdAFlL"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 31D5B40428
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1770131294; bh=XwcsmKHL2I8l4sDav0F02wWrfqCgU3ERULDiwmJRWL8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dxtdAFlLxNb7TtR91hkpKgcQSg/rdRhvs2En4yvS+XActJhX2cCx6S9EbuZfStLzR
	 q3TsVguWfZqnYxZyvYPTYZfPQQY/WHTmC2DHBsJ5Dlf041M3m5Qs/DrC7rXRtZPhcf
	 A01Aveux3Ini7lWFX0+qlV9MIk2yaGbnsNnp9l/Byw1u1kEAkCn4r7z9eWz5FDIQNc
	 w6/60TRjLMTuPnoeBrvZt/URk24fZgX+B+abTsdyRh1k3P0vBt2EL7Ayf2HFVjvH12
	 5+l+bxS5wngJyEUKW2/mMATgmIkH8TNZ1a5ZGmygAyLckj64zNX8fjwM250HszJIHK
	 NBFbpQ7ge7CuQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 31D5B40428;
	Tue,  3 Feb 2026 15:08:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH v3] docs: pt_BR: add initial Portuguese translation
In-Reply-To: <20260203120859.65735-1-danielmaraboo@gmail.com>
References: <20260203120859.65735-1-danielmaraboo@gmail.com>
Date: Tue, 03 Feb 2026 08:08:13 -0700
Message-ID: <87h5rxrhk2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Daniel Pereira <danielmaraboo@gmail.com> writes:

> This patch introduces the initial Portuguese (Brazilian) translation
> for the Linux kernel documentation. It includes the mandatory
> disclaimer, the translation of the HOWTO document, and establishes
> the directory structure for the pt_BR locale.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>

I've taken a look and have a few brief comments...

> ---
> v3:
>   - Fix alphabetical order in MAINTAINERS file.
>   - Remove trailing whitespaces in RST files.
>   - Fix indentation in Documentation/translations/index.rst.
>
> v2:
>   - Include pt_BR/index in the main translations index.
> ---
>  Documentation/translations/index.rst          |   1 +
>  .../translations/pt_BR/disclaimer-pt_BR.rst   |  11 +
>  Documentation/translations/pt_BR/index.rst    |  67 ++
>  .../translations/pt_BR/process/howto.rst      | 637 ++++++++++++++++++
>  MAINTAINERS                                   |   8 +
>  5 files changed, 724 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/disclaimer-pt_BR.rst
>  create mode 100644 Documentation/translations/pt_BR/index.rst
>  create mode 100644 Documentation/translations/pt_BR/process/howto.rst
>
> diff --git a/Documentation/translations/index.rst b/Documentation/transla=
tions/index.rst
> index b826c3479..b799eacb8 100644
> --- a/Documentation/translations/index.rst
> +++ b/Documentation/translations/index.rst
> @@ -13,6 +13,7 @@ Translations
>     ko_KR/index
>     ja_JP/index
>     sp_SP/index
> +   pt_BR/index

If you look at the rendered page, you'll see that the translations are
in alphabetical order.  Not hugely important but we might as well
continue that tradition.

>=20=20
>  .. _translations_disclaimer:
> diff --git a/Documentation/translations/pt_BR/disclaimer-pt_BR.rst b/Docu=
mentation/translations/pt_BR/disclaimer-pt_BR.rst
> new file mode 100644
> index 000000000..fe7518de6
> --- /dev/null
> +++ b/Documentation/translations/pt_BR/disclaimer-pt_BR.rst
> @@ -0,0 +1,11 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _pt_disclaimer:

You don't need this label here; you don't use it.  In truth, it seems
like this file isn't used in the build at all?  That should have
generated a warning?

> +Aviso sobre tradu=C3=A7=C3=B5es para portugu=C3=AAs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Esta documenta=C3=A7=C3=A3o foi traduzida para portugu=C3=AAs brasileiro=
 por volunt=C3=A1rios.
> +Em caso de qualquer diverg=C3=AAncia entre esta tradu=C3=A7=C3=A3o e o d=
ocumento original
> +em ingl=C3=AAs, a vers=C3=A3o em ingl=C3=AAs (encontrada no diret=C3=B3r=
io Documentation/)
> +deve ser considerada a =C3=BAnica fonte de verdade.
> diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/t=
ranslations/pt_BR/index.rst
> new file mode 100644
> index 000000000..f0e229568
> --- /dev/null
> +++ b/Documentation/translations/pt_BR/index.rst
> @@ -0,0 +1,67 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _pt_BR_linux_doc:

Here too, no label.  If you need to refer to this file, just use its name.

> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Documenta=C3=A7=C3=A3o do Kernel Linux em Portugu=C3=AAs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. raw:: latex
> +
> +	\kerneldocCJKoff
> +
> +:mantenedor: Daniel <danielmaraboo@gmail.com>
> +
> +Este =C3=A9 o n=C3=ADvel principal da documenta=C3=A7=C3=A3o do kernel e=
m l=C3=ADngua portuguesa (Brasil).
> +A tradu=C3=A7=C3=A3o ainda est=C3=A1 em seu est=C3=A1gio inicial e incom=
pleta; voc=C3=AA notar=C3=A1 avisos
> +sinalizando a falta de tradu=C3=A7=C3=B5es para grupos espec=C3=ADficos =
de documentos.
> +
> +De maneira geral, a documenta=C3=A7=C3=A3o, assim como o pr=C3=B3prio ke=
rnel, est=C3=A1 em constante
> +desenvolvimento; isso =C3=A9 especialmente verdade agora, pois estamos t=
rabalhando
> +na reorganiza=C3=A7=C3=A3o da documenta=C3=A7=C3=A3o de forma mais coere=
nte. Melhorias na
> +documenta=C3=A7=C3=A3o s=C3=A3o sempre bem-vindas; se voc=C3=AA deseja a=
judar, inscreva-se na lista
> +de discuss=C3=A3o linux-doc em vger.kernel.org.
> +
> +.. _pt_BR_disclaimer:

...and another label to take out.  This seems to be a different disclaimer?

> +Avisos
> +=3D=3D=3D=3D=3D=3D
> +
> +O objetivo desta tradu=C3=A7=C3=A3o =C3=A9 facilitar a leitura e compree=
ns=C3=A3o para aqueles que
> +n=C3=A3o dominam o ingl=C3=AAs ou t=C3=AAm d=C3=BAvidas sobre sua interp=
reta=C3=A7=C3=A3o, ou simplesmente
> +para quem prefere ler em sua l=C3=ADngua nativa. No entanto, tenha em me=
nte que a
> +*=C3=BAnica* documenta=C3=A7=C3=A3o oficial =C3=A9 a em l=C3=ADngua ingl=
esa: :ref:`linux_doc`
> +
> +A propaga=C3=A7=C3=A3o simult=C3=A2nea de uma altera=C3=A7=C3=A3o em :re=
f:`linux_doc` para todas as
> +tradu=C3=A7=C3=B5es =C3=A9 altamente improv=C3=A1vel. Os mantenedores da=
s tradu=C3=A7=C3=B5es =E2=80=94 e seus
> +contribuidores =E2=80=94 acompanham a evolu=C3=A7=C3=A3o da documenta=C3=
=A7=C3=A3o oficial e tentam manter
> +as respectivas tradu=C3=A7=C3=B5es alinhadas na medida do poss=C3=ADvel.=
 Por este motivo, n=C3=A3o
> +h=C3=A1 garantia de que uma tradu=C3=A7=C3=A3o esteja atualizada com a =
=C3=BAltima modifica=C3=A7=C3=A3o.
> +Se o que voc=C3=AA ler em uma tradu=C3=A7=C3=A3o n=C3=A3o corresponder a=
o que ler no c=C3=B3digo,
> +informe o mantenedor da tradu=C3=A7=C3=A3o e =E2=80=94 se puder =E2=80=
=94 verifique tamb=C3=A9m a
> +documenta=C3=A7=C3=A3o em ingl=C3=AAs.
> +
> +Uma tradu=C3=A7=C3=A3o n=C3=A3o =C3=A9 um *fork* da documenta=C3=A7=C3=
=A3o oficial; portanto, os usu=C3=A1rios n=C3=A3o
> +encontrar=C3=A3o nela informa=C3=A7=C3=B5es diferentes daquelas contidas=
 na vers=C3=A3o oficial.
> +Qualquer adi=C3=A7=C3=A3o, remo=C3=A7=C3=A3o ou modifica=C3=A7=C3=A3o de=
 conte=C3=BAdo deve ser feita primeiro nos
> +documentos em ingl=C3=AAs. Posteriormente, quando poss=C3=ADvel, a mesma=
 altera=C3=A7=C3=A3o deve
> +ser aplicada =C3=A0s tradu=C3=A7=C3=B5es. Os mantenedores das tradu=C3=
=A7=C3=B5es aceitam contribui=C3=A7=C3=B5es
> +que afetem puramente a atividade de tradu=C3=A7=C3=A3o (por exemplo, nov=
as tradu=C3=A7=C3=B5es,
> +atualiza=C3=A7=C3=B5es, corre=C3=A7=C3=B5es).
> +
> +As tradu=C3=A7=C3=B5es buscam ser o mais precisas poss=C3=ADvel, mas n=
=C3=A3o =C3=A9 poss=C3=ADvel mapear
> +diretamente uma l=C3=ADngua em outra. Cada l=C3=ADngua possui sua pr=C3=
=B3pria gram=C3=A1tica e
> +cultura, portanto, a tradu=C3=A7=C3=A3o de uma frase em ingl=C3=AAs pode=
 ser modificada para
> +se adaptar ao portugu=C3=AAs. Por esse motivo, ao ler esta tradu=C3=A7=
=C3=A3o, voc=C3=AA poder=C3=A1
> +encontrar algumas diferen=C3=A7as de forma, mas que transmitem a mensage=
m original.
> +
> +Trabalhando com a comunidade de desenvolvimento
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +As guias fundamentais para a intera=C3=A7=C3=A3o com a comunidade de des=
envolvimento do
> +kernel e sobre como ver seu trabalho integrado.
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   Como come=C3=A7ar <process/howto>
> diff --git a/Documentation/translations/pt_BR/process/howto.rst b/Documen=
tation/translations/pt_BR/process/howto.rst
> new file mode 100644
> index 000000000..43a2be263
> --- /dev/null
> +++ b/Documentation/translations/pt_BR/process/howto.rst
> @@ -0,0 +1,637 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _process_howto:

You know what I'm going to say here :)

> +COMO FAZER o desenvolvimento do kernel Linux
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

...and this is where I'll stop; I'm not in a position judge the quality
of the translation itself.

Thanks,

jon
