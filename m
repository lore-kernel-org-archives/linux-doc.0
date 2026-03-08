Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6D21D47B4
	for <linux-doc@vger.kernel.org>; Sun,  8 Mar 2026 19:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772998040; cv=pass; b=pkjqlFBi+Faqj1n8nxNCjBEvMPReFxChLzHYeTkDuqcwYbVXGHRpb/OBzFPh13pJbZ9nqxmsHjKJSuUIleTRNpsgtlx6xXEVA11TjxMy4L2CEmLm9ZO306crMt97izwtJB8055hHloo8hG2ChBHzHCRlSq0WIjbLO4hUhCh4yRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772998040; c=relaxed/simple;
	bh=MABRAAHRarsahl2IfsPHcCtBAGDUV2IONBXsndiW9YQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cQmzN7bIQ4iseoyXjAzKynJ+bmhvv2XxPXry7e7mNRrknYgHTeN2S4TDM/HDUix72WS3DMa/kWeGJDbvglq6dQMb/qI2bJdopPCx6H548b7BT07j+JyY2BmSW93tLXghivFEVESn56I6vdB870ZHLwyFriojByyBAkhCvpZ/BcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+x1B34y; arc=pass smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+x1B34y"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-67bb4e8955aso60319eaf.0
        for <linux-doc@vger.kernel.org>; Sun, 08 Mar 2026 12:27:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1772998037; cv=none;
        d=google.com; s=arc-20240605;
        b=bdBP91QUJl2VSB6Jww1UOR2jGHQh7HI98Jd/pgqtNQcZ7XdZmIga4HvkxYjBvvlwt9
         2iwAy5Qkdc5J1YXeo3PTQahNw+F8Fidi2PwAvw/AtsUqsvzAxc9k+4oq0gFBuEjjdNQb
         QhI4iN+l/D9X3IctdA+4RgObZusUpAZFlo4wXTNUepD5I2pIcKW9EJNKSxZc/n37Qfna
         GrbdOJyNGaSY3QKMhj/ioMmGBGf38PXlGpJwmW3rRM2CS9UOriwGAnfw1kxvzoi11N6C
         VJyzpsJHYvqHpMNn0k12OH0D4FyA7LcJuftTdd0FKmNqkU5r26MtzTU7WLT7UZ85RGrz
         kN7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/2kiTU2BJXdk253jDNtSToFFL2sFPw9JzT7qSq/+lFo=;
        fh=MrEuju4FK4iljCFH2UsbVJfCW/CGquxOlTBW2d+x2J4=;
        b=JHb07kLAEGdbeJ8wS6it5+C7G4yH9jDQfSQh10m56p0DeN4Qq/QVLStFBrxmE0B7Mn
         j6NOk02XLQo2d5riov7cslrUIILY5c3B9dDKXjjcTIe4zsJpk2PvgcQIc+ULKMbpbb/1
         4+CgNuke2bLho5lWng++HnJR8TO+bnuW7CFIHUPclKq/+X8T7XEkj4RL+xsn5smS8LPZ
         xsYscMQdqcYNFyHvAtY+euFDkA0jkeLWMmvH18EeRfaquGTGtYV05yuayzz9Xe5wQryt
         X9mqUttKKKClzvcUHIAx+cNMhjwEUzLLJL5d1poYMtZNJAL9/dYdzVkCTs9SsF7Z+7EX
         +7CA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772998037; x=1773602837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2kiTU2BJXdk253jDNtSToFFL2sFPw9JzT7qSq/+lFo=;
        b=G+x1B34yUx9x1yolOf76oFqeQi2vlXkPwyK3nxb+zSCcEr4AnEKCecKTcWXWu4AGmQ
         OEX4QFHJQvBc02aXJv8WDUILIDO+NgRVb889QJoz/9Lfut/85Fcq6m+qmZqBnCH35c7j
         YrnEirpnL6rmigGnwk3EX5t8FXEF0Cfz9WTmfJgnwlqzQTYnkP05Qj+uZYNs84lLJCV4
         vJ/LO3y+qiQjbwozYlBhQtvna5GSq6fqbeaz9MCayI5ozg2P1V+vx78gBATAS6JSLFAA
         KhrzIW6nkbMJXXD9pO3k53r3J4x7jJz5KqFgT1vfcy7klvkAw1z8dpNLnzpoIkssDYfY
         37xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772998037; x=1773602837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/2kiTU2BJXdk253jDNtSToFFL2sFPw9JzT7qSq/+lFo=;
        b=s+TsAsCa5Q4S7SrHcSvnFsYDcUkyd8jaEGINRyodUuSB7mXKfq3oeHA2i3CKfbh3+n
         5goTzB1S+YeD9CaU8unq8kKSPxYRogt6f2dqEdCfjqjQa8Evr/3eSLckGbqj+OfslOWD
         +dokHHAzhEt5MbXfXxLQEqxXWWy4UYDkV6RznepBYihQLpGw8GbqA0wHVw2zKZOBxIxO
         cvfBVSL6tbO9iNKiKgpRmOJO9E4m/6qxMeoOhAa20Fg/a/xLWpPygTzcOuY/mE7NkIdW
         6HRQAIPFhEYgnaRocLEJ85LXX6LrDTDdbfFYWMLCC4G5ioQ40Dg+ur/cf4pb1jjHDHw5
         C+Fg==
X-Gm-Message-State: AOJu0YwxwNF2Xr5QL76Wywyfi0XOCSvmm1sm1v2+zmhLiMW7gXiu5o2l
	OMoLfqcEIQ8xsm/CCW8lKE+ywYQmwqel3aQ4cAOvaKZl4Zl6KGUvjJlsPCPFArH2VvSwx5wlzfz
	BnXqkU9TAVQKE9extn0LMSdRIxHJyCtfbbB41IBU=
X-Gm-Gg: ATEYQzzHK16HpgjCy33EWLWStzM1Ky5PCuBxa9Vqntk0YE5dcKCHVdF8vZmVfLrPdTW
	uqbApVIayzbJp81dkHoxqu03vbIkrkBbwFNwmO/miTxh51SdkXhWf9Qd1IGyLFfuw9BYTaBU1H9
	ljMNPceNqZHwftJzAitGjMSLTVgomCdv2UkNcnQZdHYY+e1HVHKn/PRmw/hmHRhmndkoAhVmYpz
	jxOvcjHUcKgRfGdsYr4LX9jsjfBXo+IJJ/tP3OyMxVAnANd82pRXVbofPtzuB5t5nCyXfdQcs7n
	qrinls/CJPXClxp4SA0zQtlRQ3pIZUljDyg3scvFgWttfPZUpSPzcTSGxZAbqnDA8p+sinRSWQ=
	=
X-Received: by 2002:a05:6820:f024:b0:672:7258:c4f0 with SMTP id
 006d021491bc7-67b9bd4c866mr5367083eaf.53.1772998036119; Sun, 08 Mar 2026
 12:27:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305132243.30244-1-danielmaraboo@gmail.com>
In-Reply-To: <20260305132243.30244-1-danielmaraboo@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 8 Mar 2026 16:27:04 -0300
X-Gm-Features: AaiRm50OC-zpY_ix5yMFS9Zp3KEWmfw1l8mo7cwGZbVbHO0ZHj3AmygH-qHPtlo
Message-ID: <CAMAsx6fF46rjehHzGLyop5TCNebJJ8ki4596=MPzsQSCK=0gjA@mail.gmail.com>
Subject: Re: [PATCH docs-next] docs: pt_BR: add netdev and maintainer handbook translations
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 10:23=E2=80=AFAM Daniel Pereira <danielmaraboo@gmail=
.com> wrote:
>
> From: Daniel Silva <danielmaraboo@gmail.com>
>
> Translate the netdev development process and the maintainer handbooks
> into Brazilian Portuguese. Also, update the main pt_BR index to
> link these documents.
>
> - Documentation/translations/pt_BR/index.rst
> - Documentation/translations/pt_BR/process/maintainer-netdev.rst
> - Documentation/translations/pt_BR/process/maintainer-handbooks.rst
>
> Validated with sphinx build and checkpatch.pl.
>
> Signed-off-by: Daniel Silva <danielmaraboo@gmail.com>
> ---
>  Documentation/translations/pt_BR/index.rst    |   1 +
>  .../pt_BR/process/maintainer-handbooks.rst    |   8 +
>  .../pt_BR/process/maintainer-netdev.rst       | 822 ++++++++++++++++++
>  3 files changed, 831 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/maintainer-n=
etdev.rst
>
> diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/t=
ranslations/pt_BR/index.rst
> index de5c005f9..09fc49555 100644
> --- a/Documentation/translations/pt_BR/index.rst
> +++ b/Documentation/translations/pt_BR/index.rst
> @@ -69,3 +69,4 @@ kernel e sobre como ver seu trabalho integrado.
>     Como come=C3=A7ar <process/howto>
>     Requisitos m=C3=ADnimos <process/changes>
>     Manuais dos mantenedores <process/maintainer-handbooks>
> +   Processo do subsistema de rede (netdev) <process/maintainer-netdev>
> \ No newline at end of file
> diff --git a/Documentation/translations/pt_BR/process/maintainer-handbook=
s.rst b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
> index eb650bc60..6cb2bda4c 100644
> --- a/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
> +++ b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
> @@ -6,3 +6,11 @@ Notas sobre o processo de desenvolvimento de subsistemas=
 e mantenedores
>  O prop=C3=B3sito deste documento =C3=A9 fornecer informa=C3=A7=C3=B5es e=
spec=C3=ADficas de
>  subsistemas que s=C3=A3o suplementares ao manual geral do processo de
>  desenvolvimento :ref:`Documentation/process <development_process_main>`.
> +
> +COnte=C3=BAdos:
> +
> +.. toctree::
> +   :numbered:
> +   :maxdepth: 2
> +
> +   maintainer-netdev
> diff --git a/Documentation/translations/pt_BR/process/maintainer-netdev.r=
st b/Documentation/translations/pt_BR/process/maintainer-netdev.rst
> new file mode 100644
> index 000000000..81af13d02
> --- /dev/null
> +++ b/Documentation/translations/pt_BR/process/maintainer-netdev.rst
> @@ -0,0 +1,822 @@
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
t]``
> +para corre=C3=A7=C3=B5es
> +  ou ``[PATCH net-next]`` para novas funcionalidades.
> +- **Tag Fixes** =E2=80=93 para corre=C3=A7=C3=B5es, a tag ``Fixes:`` =C3=
=A9 obrigat=C3=B3ria,
> +  independentemente da =C3=A1rvore de destino.
> +- **Tamanho da s=C3=A9rie** =E2=80=93 n=C3=A3o envie s=C3=A9ries grandes=
 (> 15 patches);
> +divida-as em
> +  partes menores.
> +- **Intervalo de envio** =E2=80=93 n=C3=A3o reenvie seus patches dentro =
de um
> +per=C3=ADodo de 24
> +  horas.
> +- **Reverse xmas tree** =E2=80=93 organize as declara=C3=A7=C3=B5es de v=
ari=C3=A1veis
> +locais da mais
> +  longa para a mais curta.
> +
> +netdev
> +------
> +A **netdev** =C3=A9 a lista de discuss=C3=A3o para todos os assuntos do =
Linux
> +relacionados
> +a rede. Isso inclui qualquer item encontrado em ``net/`` (ex: c=C3=B3dig=
o
> +principal
> +como IPv6) e  em ``drivers/net`` (ex: drivers espec=C3=ADficos de hardwa=
re)
> +na =C3=A1rvore
> +de diret=C3=B3rios do Linux.
> +
> +Note que alguns subsistemas (ex: drivers de rede sem fio/wireless),
> +que possuem
> +um  alto volume de tr=C3=A1fego, possuem suas pr=C3=B3prias listas de di=
scuss=C3=A3o
> +e =C3=A1rvores
> +espec=C3=ADficas.
> +
> +Como muitas outras listas de discuss=C3=A3o do Linux, a lista netdev =C3=
=A9
> +hospedada no
> +`kernel.org <https://www.kernel.org/>`_, com arquivos dispon=C3=ADveis e=
m
> +https://lore.kernel.org/netdev/.
> +
> +=C3=80 exce=C3=A7=C3=A3o dos subsistemas mencionados anteriormente, todo=
 o
> +desenvolvimento de
> +rede  do Linux (ex: RFCs, revis=C3=B5es, coment=C3=A1rios, etc.) ocorre =
na
> +**netdev**.
> +
> +Ciclo de Desenvolvimento
> +------------------------
> +
> +Aqui est=C3=A1 um pouco de informa=C3=A7=C3=A3o contextual sobre a cad=
=C3=AAncia de
> +desenvolvimento
> +do Linux. Cada nova vers=C3=A3o (release) inicia-se com uma "janela de
> +mesclagem"
> +(*merge window*) de duas semanas, onde os mantenedores principais
> +enviam suas
> +novas implementa=C3=A7=C3=B5es para o Linus para incorpora=C3=A7=C3=A3o =
na =C3=A1rvore
> +principal
> +(*mainline tree*).
> +
> +Ap=C3=B3s as duas semanas, a janela de mesclagem =C3=A9 fechada e a vers=
=C3=A3o =C3=A9
> +nomeada/etiquetada  como ``-rc1``. Nenhuma funcionalidade nova =C3=A9
> +incorporada =C3=A0
> +=C3=A1rvore principal ap=C3=B3s  isso -- espera-se apenas corre=C3=A7=C3=
=B5es (*fixes*)
> +para o
> +conte=C3=BAdo da rc1.
> +
> +Ap=C3=B3s cerca de uma semana coletando corre=C3=A7=C3=B5es para a rc1, =
a rc2 =C3=A9
> +lan=C3=A7ada. Isso
> +se  repete semanalmente at=C3=A9 a rc7 (tipicamente; =C3=A0s vezes rc6 s=
e o
> +ritmo estiver
> +calmo, ou rc8 se houver muita instabilidade); uma semana ap=C3=B3s a =C3=
=BAltima
> +vX.Y-rcN
> +ser  conclu=C3=ADda, a vers=C3=A3o oficial vX.Y =C3=A9 lan=C3=A7ada.
> +
> +Para descobrir em que ponto do ciclo estamos agora - carregue a p=C3=A1g=
ina da
> +mainline (Linus) aqui:
> +
> +  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> +
> +e observe o topo da se=C3=A7=C3=A3o de "tags". Se for rc1, estamos no in=
=C3=ADcio
> +do ciclo
> +de desenvolvimento. Se a rc7 foi marcada h=C3=A1 uma semana, ent=C3=A3o =
um
> +lan=C3=A7amento
> +=C3=A9 provavelmente iminente. Se a tag mais recente for uma tag de
> +lan=C3=A7amento
> +final (sem o sufixo ``-rcN``) - muito provavelmente estamos em uma
> +janela de
> +mesclagem (*merge window*) e o ``net-next`` est=C3=A1 fechado.
> +
> +=C3=81rvores git e fluxo de patches
> +------------------------------
> +
> +Existem duas =C3=A1rvores de rede (reposit=C3=B3rios git) em jogo. Ambas=
 s=C3=A3o
> +coordenadas
> +por David Miller, o mantenedor principal de rede. H=C3=A1 a =C3=A1rvore =
``net``
> +e a
> +=C3=A1rvore ``net-next``. Como voc=C3=AA provavelmente pode adivinhar pe=
los
> +nomes, a
> +=C3=A1rvore ``net`` =C3=A9 para corre=C3=A7=C3=B5es de c=C3=B3digo exist=
ente j=C3=A1 na =C3=A1rvore
> +mainline de
> +Linus, e a ``net-next`` =C3=A9 para onde o novo c=C3=B3digo vai para o l=
an=C3=A7amento
> +futuro.
> +Voc=C3=AA pode encontrar as =C3=A1rvores aqui:
> +
> +- https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git
> +- https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
> +
> +Relacionando isso ao desenvolvimento do kernel: no in=C3=ADcio da janela
> +de mesclagem
> +(*merge window*) de 2 semanas, a =C3=A1rvore ``net-next`` ser=C3=A1 fech=
ada --
> +sem novas
> +mudan=C3=A7as ou funcionalidades. O conte=C3=BAdo novo acumulado nas =C3=
=BAltimas
> +~10 semanas
> +ser=C3=A1 passado para a mainline/Linus via um *pull request* para a vX.=
Y --
> +ao mesmo
> +tempo, a =C3=A1rvore ``net`` come=C3=A7ar=C3=A1 a acumular corre=C3=A7=
=C3=B5es para este
> +conte=C3=BAdo enviado
> +relacionado =C3=A0 vX.Y.
> +
> +Um an=C3=BAncio indicando quando a ``net-next`` foi fechada =C3=A9 geral=
mente
> +enviado para
> +a netdev, mas sabendo o que foi dito acima, voc=C3=AA pode prever isso c=
om
> +anteced=C3=AAncia.
> +
> +.. warning::
> +  N=C3=A3o envie novo conte=C3=BAdo para a ``net-next`` para a netdev du=
rante
> +  o per=C3=ADodo
> +  em que a =C3=A1rvore ``net-next`` estiver fechada.
> +
> +Patches RFC enviados apenas para revis=C3=A3o s=C3=A3o obviamente bem-vi=
ndos
> +a qualquer
> +momento (use ``--subject-prefix=3D'RFC net-next'`` com ``git
> +format-patch``).
> +
> +Pouco depois das duas semanas terem passado (e a vX.Y-rc1 ser lan=C3=A7a=
da),
> +a =C3=A1rvore
> +para a ``net-next`` reabre para coletar conte=C3=BAdo para o pr=C3=B3xim=
o
> +lan=C3=A7amento
> +(vX.Y+1).
> +
> +Se voc=C3=AA n=C3=A3o estiver inscrito na netdev e/ou simplesmente n=C3=
=A3o tiver
> +certeza se a
> +``net-next`` j=C3=A1 reabriu, basta verificar o link do reposit=C3=B3rio=
 git da
> +``net-next`` acima para quaisquer novos *commits* relacionados =C3=A0
> +rede. Voc=C3=AA
> +tamb=C3=A9m pode verificar o seguinte site para o status atual:
> +
> +  https://netdev.bots.linux.dev/net-next.html
> +
> +A =C3=A1rvore ``net`` continua a coletar corre=C3=A7=C3=B5es para o cont=
e=C3=BAdo da
> +vX.Y e =C3=A9
> +enviada de volta para Linus em intervalos regulares (~semanais). Isso
> +significa
> +que o foco da ``net`` =C3=A9 a estabiliza=C3=A7=C3=A3o e corre=C3=A7=C3=
=B5es de bugs.
> +
> +Finalmente, a vX.Y =C3=A9 lan=C3=A7ada e todo o ciclo recome=C3=A7a.
> +
> +Revis=C3=A3o de patches da netdev
> +----------------------------
> +
> +Status do patch
> +~~~~~~~~~~~~~~~
> +
> +O status de um patch pode ser verificado olhando a fila principal do
> +patchwork
> +para a netdev:
> +
> +  https://patchwork.kernel.org/project/netdevbpf/list/
> +
> +O campo "State" informar=C3=A1 exatamente onde as coisas est=C3=A3o com =
o
> +seu patch:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Estado do patch    Descri=C3=A7=C3=A3o
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +New, Under review  revis=C3=A3o pendente, o patch est=C3=A1 na fila do m=
antenedor
> +para
> +                   revis=C3=A3o; os dois estados s=C3=A3o usados alterna=
damente
> +                   (dependendo do co-mantenedor exato que estiver lidand=
o
> +                   com o
> +                   patchwork no momento)
> +Accepted           o patch foi aplicado =C3=A0 =C3=A1rvore de rede aprop=
riada,
> +isso =C3=A9
> +                   geralmente definido de forma autom=C3=A1tica pelo pw-=
bot
> +Needs ACK          aguardando um "ack" de um especialista da =C3=A1rea
> +ou testes
> +Changes requested  o patch n=C3=A3o passou na revis=C3=A3o, espera-se um=
a nova
> +revis=C3=A3o
> +                   com mudan=C3=A7as apropriadas no c=C3=B3digo e na men=
sagem
> +                   de commit
> +Rejected           o patch foi rejeitado e n=C3=A3o se espera uma nova
> +revis=C3=A3o
> +Not applicable     espera-se que o patch seja aplicado fora do
> +subsistema de
> +                   rede
> +Awaiting upstream  o patch deve ser revisado e tratado pelo sub-mantened=
or
> +                   apropriado, que o enviar=C3=A1 para as =C3=A1rvores d=
e rede;
> +                   patches
> +                   definidos como ``Awaiting upstream`` no patchwork
> +                   da netdev
> +                   geralmente permanecer=C3=A3o neste estado,
> +                   independentemente de
> +                   o sub-mantenedor ter solicitado mudan=C3=A7as, aceito=
 ou
> +                   rejeitado o patch
> +Deferred           o patch precisa ser reenviado mais tarde, geralmente
> +devido
> +                   a alguma depend=C3=AAncia ou porque foi enviado para
> +                   uma =C3=A1rvore
> +                   fechada
> +Superseded         uma nova vers=C3=A3o do patch foi enviada, geralmente
> +definido
> +                   pelo pw-bot
> +RFC                n=C3=A3o deve ser aplicado, geralmente n=C3=A3o est=
=C3=A1 na
> +fila de
> +                   revis=C3=A3o do mantenedor; o pw-bot pode definir
> +                   patches para
> +                   este estado automaticamente com base nas tags do
> +                   assunto
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Os patches s=C3=A3o indexados pelo cabe=C3=A7alho ``Message-ID`` dos e-m=
ails
> +que os
> +transportaram; portanto, se voc=C3=AA tiver problemas para encontrar seu
> +patch,
> +anexe o valor do ``Message-ID`` =C3=A0 URL acima.
> +
> +Atualizando o status do patch
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Colaboradores e revisores n=C3=A3o t=C3=AAm permiss=C3=B5es para atualiz=
ar o estado
> +do patch
> +diretamente no patchwork. O Patchwork n=C3=A3o exp=C3=B5e muitas informa=
=C3=A7=C3=B5es
> +sobre o
> +hist=C3=B3rico do estado dos patches; portanto, ter v=C3=A1rias pessoas
> +atualizando o
> +estado leva a confus=C3=B5es.
> +
> +Em vez de delegar permiss=C3=B5es do patchwork, a netdev usa um rob=C3=
=B4
> +de e-mail
> +simples (bot) que procura por comandos/linhas especiais dentro dos e-mai=
ls
> +enviados para a lista de discuss=C3=A3o. Por exemplo, para marcar uma
> +s=C3=A9rie como
> +Mudan=C3=A7as Solicitadas (*Changes Requested*), =C3=A9 necess=C3=A1rio =
enviar
> +a seguinte
> +linha em qualquer lugar na thread do e-mail::
> +
> +  pw-bot: changes-requested
> +
> +Como resultado, o bot definir=C3=A1 toda a s=C3=A9rie como Mudan=C3=A7as
> +Solicitadas. Isso
> +pode ser =C3=BAtil quando o autor descobre um bug em sua pr=C3=B3pria s=
=C3=A9rie
> +e deseja
> +evitar que ela seja aplicada.
> +
> +O uso do bot =C3=A9 totalmente opcional; em caso de d=C3=BAvida, ignore
> +completamente a
> +exist=C3=AAncia dele. Os mantenedores classificar=C3=A3o e atualizar=C3=
=A3o o
> +estado dos
> +patches por conta pr=C3=B3pria. Nenhum e-mail deve ser enviado =C3=A0 li=
sta com o
> +prop=C3=B3sito principal de se comunicar com o bot; os comandos do bot
> +devem ser
> +vistos como metadados.
> +
> +O uso do bot =C3=A9 restrito aos autores dos patches (o cabe=C3=A7alho `=
`From:``
> +no envio
> +do patch e no comando deve coincidir!), mantenedores do c=C3=B3digo
> +modificado de
> +acordo com o arquivo MAINTAINERS (novamente, o ``From:`` deve coincidir
> +com a
> +entrada no MAINTAINERS) e alguns revisores seniores.
> +
> +O bot registra sua atividade aqui:
> +
> +  https://netdev.bots.linux.dev/pw-bot.html
> +
> +Prazos de revis=C3=A3o
> +~~~~~~~~~~~~~~~~~
> +
> +De modo geral, os patches s=C3=A3o triados rapidamente (em menos de 48h)=
. Mas
> +seja
> +paciente; se o seu patch estiver ativo no patchwork (ou seja, listado
> +na lista
> +de patches do projeto), as chances de ele ter sido esquecido s=C3=A3o
> +pr=C3=B3ximas de
> +zero.
> +
> +O alto volume de desenvolvimento na netdev faz com que os revisores
> +encerrem
> +discuss=C3=B5es de forma relativamente r=C3=A1pida. =C3=89 muito improv=
=C3=A1vel que novos
> +coment=C3=A1rios e respostas cheguem ap=C3=B3s uma semana de sil=C3=AAnc=
io. Se um
> +patch n=C3=A3o
> +estiver mais ativo no patchwork e a thread ficar inativa por mais de uma
> +semana - esclare=C3=A7a os pr=C3=B3ximos passos e/ou envie a pr=C3=B3xim=
a vers=C3=A3o.
> +
> +Especificamente para envios de RFC, se ningu=C3=A9m responder em uma sem=
ana -
> +ou os
> +revisores perderam o envio ou n=C3=A3o t=C3=AAm opini=C3=B5es fortes a r=
espeito. Se
> +o c=C3=B3digo
> +estiver pronto, reenvie como um PATCH.
> +
> +E-mails dizendo apenas "ping" ou "bump" s=C3=A3o considerados rudes. Se
> +voc=C3=AA n=C3=A3o
> +conseguir identificar o status do patch pelo patchwork ou onde a
> +discuss=C3=A3o
> +parou - descreva sua melhor suposi=C3=A7=C3=A3o e pergunte se ela est=C3=
=A1
> +correta. Por
> +exemplo::
> +
> +  N=C3=A3o entendo quais s=C3=A3o os pr=C3=B3ximos passos. A Pessoa X pa=
rece estar
> +  descontente
> +  com A; devo fazer B e enviar novamente os patches?
> +
> +.. _Solicita=C3=A7=C3=B5es de mudan=C3=A7as:
> +
> +Mudan=C3=A7as solicitadas
> +~~~~~~~~~~~~~~~~~~~~
> +
> +Patches marcados como ``Changes Requested`` precisam
> +ser revisados. A nova vers=C3=A3o deve vir com um registro de altera=C3=
=A7=C3=B5es
> +(changelog),
> +preferencialmente incluindo links para as postagens anteriores, por
> +exemplo::
> +
> +  [PATCH net-next v3] net: faz as vacas dizerem "muuu"
> +
> +  Mesmo os usu=C3=A1rios que n=C3=A3o bebem leite apreciam ouvir as vaca=
s dizendo
> +  "muuu".
> +
> +  A quantidade de mugidos depender=C3=A1 da taxa de pacotes, portanto, d=
eve
> +  corresponder muito bem ao ciclo diurno.
> +
> +  Signed-off-by: Joe Defarmer <joe@barn.org>
> +  ---
> +  v3:
> +    - adicionada uma nota sobre a flutua=C3=A7=C3=A3o do mugido conforme=
 a hora
> +    do dia na
> +      mensagem de commit
> +  v2: https://lore.kernel.org/netdev/123themessageid@barn.org/
> +    - corrigido argumento ausente na kernel doc para netif_is_bovine()
> +    - corrigido vazamento de mem=C3=B3ria (memory leak) em
> +    netdev_register_cow()
> +  v1: https://lore.kernel.org/netdev/456getstheclicks@barn.org/
> +
> +A mensagem de commit deve ser revisada para responder a quaisquer
> +perguntas que
> +os revisores tenham feito em discuss=C3=B5es anteriores. Ocasionalmente,=
 a
> +atualiza=C3=A7=C3=A3o da mensagem de commit ser=C3=A1 a =C3=BAnica mudan=
=C3=A7a na nova
> +vers=C3=A3o.
> +
> +Reenvios parciais
> +~~~~~~~~~~~~~~~~~
> +
> +Por favor, sempre reenvie a s=C3=A9rie completa de patches e certifique-=
se de
> +numerar seus patches de forma que fique claro que este =C3=A9 o conjunto=
 mais
> +recente e completo de patches que pode ser aplicado. N=C3=A3o tente reen=
viar
> +apenas
> +os patches que foram alterados.
> +
> +Lidando com patches aplicados incorretamente
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Ocasionalmente, uma s=C3=A9rie de patches =C3=A9 aplicada antes de receb=
er
> +feedback
> +cr=C3=ADtico, ou a vers=C3=A3o errada de uma s=C3=A9rie =C3=A9 aplicada.
> +
> +N=C3=A3o =C3=A9 poss=C3=ADvel fazer o patch desaparecer uma vez que ele =
foi enviado
> +(pushed);
> +o hist=C3=B3rico de commits nas =C3=A1rvores netdev =C3=A9 imut=C3=A1vel=
. Por favor,
> +envie vers=C3=B5es
> +incrementais sobre o que foi mesclado para corrigir os patches da
> +maneira que
> +eles ficariam se a sua s=C3=A9rie de patches mais recente fosse mesclada=
.
> +
> +Em casos onde uma revers=C3=A3o completa (revert) =C3=A9 necess=C3=A1ria=
, a revers=C3=A3o
> +deve ser
> +enviada como um patch para a lista com uma mensagem de commit explicando
> +os
> +problemas t=C3=A9cnicos com o commit revertido. Revers=C3=B5es devem ser
> +usadas como
> +=C3=BAltimo recurso, quando a mudan=C3=A7a original est=C3=A1 completame=
nte errada;
> +corre=C3=A7=C3=B5es
> +incrementais s=C3=A3o preferidas.
> +
> +=C3=81rvore est=C3=A1vel
> +~~~~~~~~~~~~~~
> +
> +Embora antigamente as submiss=C3=B5es para a netdev n=C3=A3o devessem ca=
rregar
> +tags
> +expl=C3=ADcitas ``CC: stable@vger.kernel.org``, esse n=C3=A3o =C3=A9 mai=
s o caso
> +hoje em dia.
> +Por favor, siga as regras padr=C3=A3o de estabilidade em
> +``Documentation/process/stable-kernel-rules.rst``, e certifique-se de
> +incluir as
> +tags Fixes apropriadas!
> +
> +Corre=C3=A7=C3=B5es de seguran=C3=A7a
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +N=C3=A3o envie e-mails diretamente para os mantenedores da netdev se voc=
=C3=AA
> +acha que
> +descobriu um bug que possa ter poss=C3=ADveis implica=C3=A7=C3=B5es de s=
eguran=C3=A7a. O
> +atual
> +mantenedor da netdev tem solicitado consistentemente que as pessoas
> +usem as
> +listas de discuss=C3=A3o e n=C3=A3o entrem em contato diretamente. Se vo=
c=C3=AA
> +n=C3=A3o estiver
> +de acordo com isso, considere enviar um e-mail para security@kernel.org =
ou
> +ler sobre http://oss-security.openwall.org/wiki/mailing-lists/distros co=
mo
> +poss=C3=ADveis mecanismos alternativos.
> +
> +Envio conjunto de mudan=C3=A7as em componentes de espa=C3=A7o do usu=C3=
=A1rio
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +O c=C3=B3digo de espa=C3=A7o do usu=C3=A1rio (*user space*) que exercita
> +funcionalidades do
> +kernel deve ser enviado juntamente com os patches do kernel. Isso d=C3=
=A1 aos
> +revisores a chance de ver como qualquer nova interface =C3=A9 usada e qu=
=C3=A3o
> +bem ela
> +funciona.
> +
> +Quando as ferramentas de espa=C3=A7o do usu=C3=A1rio residem no pr=C3=B3=
prio
> +reposit=C3=B3rio do
> +kernel, todas as altera=C3=A7=C3=B5es devem geralmente vir em uma =C3=BA=
nica
> +s=C3=A9rie. Se a s=C3=A9rie
> +se tornar muito grande ou se o projeto de espa=C3=A7o do usu=C3=A1rio n=
=C3=A3o for
> +revisado na
> +netdev, inclua um link para um reposit=C3=B3rio p=C3=BAblico onde os pat=
ches de
> +espa=C3=A7o do
> +usu=C3=A1rio possam ser vistos.
> +
> +No caso de ferramentas de espa=C3=A7o do usu=C3=A1rio residirem em um re=
posit=C3=B3rio
> +separado, mas serem revisadas na netdev (por exemplo, patches para
> +ferramentas
> +``iproute2``), os patches do kernel e do espa=C3=A7o do usu=C3=A1rio dev=
em
> +formar s=C3=A9ries
> +(threads) separadas quando postados na lista de discuss=C3=A3o, por exem=
plo::
> +
> +  [PATCH net-next 0/3] net: carta de apresenta=C3=A7=C3=A3o de alguma
> +  funcionalidade
> +   =E2=94=94=E2=94=80 [PATCH net-next 1/3] net: prepara=C3=A7=C3=A3o par=
a alguma
> +   funcionalidade
> +   =E2=94=94=E2=94=80 [PATCH net-next 2/3] net: implementa=C3=A7=C3=A3o =
de alguma
> +   funcionalidade
> +   =E2=94=94=E2=94=80 [PATCH net-next 3/3] selftest: net: alguma funcion=
alidade
> +
> +  [PATCH iproute2-next] ip: adiciona suporte para alguma funcionalidade
> +
> +A postagem em uma =C3=BAnica thread =C3=A9 desencorajada porque confunde
> +o patchwork
> +(a partir da vers=C3=A3o 2.2.2 do patchwork).
> +
> +Envio conjunto de selftests
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Os selftests devem fazer parte da mesma s=C3=A9rie que as mudan=C3=A7as =
de
> +c=C3=B3digo.
> +Especificamente para corre=C3=A7=C3=B5es, tanto a mudan=C3=A7a de c=C3=
=B3digo quanto
> +o teste
> +relacionado devem ir para a mesma =C3=A1rvore (os testes podem n=C3=A3o =
ter
> +uma tag
> +Fixes, o que =C3=A9 esperado). Misturar mudan=C3=A7as de c=C3=B3digo e m=
udan=C3=A7as de
> +teste em
> +um =C3=BAnico commit =C3=A9 desencorajado.
> +
> +Preparando as mudan=C3=A7as
> +----------------------
> +
> +Aten=C3=A7=C3=A3o aos detalhes =C3=A9 importante. Releia seu pr=C3=B3pri=
o trabalho como
> +se voc=C3=AA
> +fosse o revisor. Voc=C3=AA pode come=C3=A7ar usando o ``checkpatch.pl``,=
 talvez
> +at=C3=A9 com
> +a flag ``--strict``. Mas n=C3=A3o seja rob=C3=B3tico e irracional ao faz=
er
> +isso. Se sua
> +mudan=C3=A7a for uma corre=C3=A7=C3=A3o de bug, certifique-se de que seu=
 log de
> +commit indique
> +o sintoma vis=C3=ADvel para o usu=C3=A1rio final, a raz=C3=A3o subjacent=
e de por
> +que isso
> +acontece e, se necess=C3=A1rio, explique por que a corre=C3=A7=C3=A3o pr=
oposta =C3=A9
> +a melhor
> +maneira de resolver as coisas. N=C3=A3o corrompa espa=C3=A7os em branco =
e,
> +como =C3=A9 comum,
> +n=C3=A3o use recuos incorretos em argumentos de fun=C3=A7=C3=A3o que abr=
angem
> +v=C3=A1rias linhas.
> +Se for o seu primeiro patch, envie-o para si mesmo por e-mail para
> +que voc=C3=AA
> +possa testar a aplica=C3=A7=C3=A3o em uma =C3=A1rvore sem patches para c=
onfirmar que a
> +infraestrutura n=C3=A3o o danificou.
> +
> +Finalmente, volte e leia
> +``Documentation/process/submitting-patches.rst``
> +para ter certeza de que n=C3=A3o est=C3=A1 repetindo algum erro comum do=
cumentado
> +l=C3=A1.
> +
> +Indicando a =C3=A1rvore de destino
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Para ajudar os mantenedores e os bots de CI, voc=C3=AA deve marcar
> +explicitamente
> +qual =C3=A1rvore seu patch tem como alvo. Supondo que voc=C3=AA use git,=
 utilize
> +a flag
> +de prefixo::
> +
> +  git format-patch --subject-prefix=3D'PATCH net-next' inicio..fim
> +
> +Use ``net`` em vez de ``net-next`` (sempre em letras min=C3=BAsculas)
> +no comando
> +acima para conte=C3=BAdos de corre=C3=A7=C3=A3o de bugs da =C3=A1rvore `=
`net``.
> +
> +Dividindo o trabalho em patches
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Coloque-se no lugar do revisor. Cada patch =C3=A9 lido separadamente e,
> +portanto,
> +deve constituir um passo compreens=C3=ADvel em dire=C3=A7=C3=A3o ao seu =
objetivo
> +declarado.
> +
> +Evite enviar s=C3=A9ries com mais de 15 patches. S=C3=A9ries maiores lev=
am
> +mais tempo
> +para serem revisadas, pois os revisores adiar=C3=A3o a an=C3=A1lise at=
=C3=A9
> +encontrarem um
> +grande bloco de tempo dispon=C3=ADvel. Uma s=C3=A9rie pequena pode ser r=
evisada
> +em pouco
> +tempo, ent=C3=A3o os mantenedores simplesmente a revisam de imediato. Co=
mo
> +resultado,
> +uma sequ=C3=AAncia de s=C3=A9ries menores =C3=A9 mesclada mais rapidamen=
te e com
> +melhor
> +cobertura de revis=C3=A3o. Reenviar s=C3=A9ries grandes tamb=C3=A9m aume=
nta o tr=C3=A1fego
> +na lista
> +de discuss=C3=A3o.
> +
> +Limitar patches pendentes na lista de discuss=C3=A3o
> +-----------------------------------------------
> +
> +Evite ter mais de 15 patches, em todas as s=C3=A9ries, pendentes de revi=
s=C3=A3o
> +na lista
> +de discuss=C3=A3o para uma =C3=BAnica =C3=A1rvore. Em outras palavras, u=
m m=C3=A1ximo
> +de 15 patches
> +sob revis=C3=A3o na ``net`` e um m=C3=A1ximo de 15 patches sob revis=C3=
=A3o na
> +``net-next``.
> +
> +Este limite tem o objetivo de focar o esfor=C3=A7o do desenvolvedor nos
> +testes dos
> +patches antes da revis=C3=A3o upstream, auxiliando a qualidade das submi=
ss=C3=B5es
> +upstream e aliviando a carga sobre os revisores.
> +
> +
> +Ordena=C3=A7=C3=A3o de vari=C3=A1veis locais ("=C3=A1rvore invertida", "=
RCS")
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +A netdev tem uma conven=C3=A7=C3=A3o para ordenar vari=C3=A1veis locais =
em
> +fun=C3=A7=C3=B5es. Ordene as
> +linhas de declara=C3=A7=C3=A3o de vari=C3=A1veis da mais longa para a ma=
is curta,
> +por exemplo::
> +
> +  struct scatterlist *sg;
> +  struct sk_buff *skb;
> +  int err, i;
> +
> +Se houver depend=C3=AAncias entre as vari=C3=A1veis que impe=C3=A7am a o=
rdena=C3=A7=C3=A3o,
> +mova a
> +inicializa=C3=A7=C3=A3o para fora da linha de declara=C3=A7=C3=A3o.
> +
> +Preced=C3=AAncia de formata=C3=A7=C3=A3o
> +~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Ao trabalhar em c=C3=B3digo existente que utiliza formata=C3=A7=C3=A3o n=
=C3=A3o padr=C3=A3o,
> +fa=C3=A7a com
> +que seu c=C3=B3digo siga as diretrizes mais recentes, para que, eventual=
mente,
> +todo
> +o c=C3=B3digo no dom=C3=ADnio da netdev esteja no formato preferido.
> +
> +Uso de constru=C3=A7=C3=B5es gerenciadas por dispositivo e cleanup.h
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Historicamente, a netdev permanece c=C3=A9tica em rela=C3=A7=C3=A3o =C3=
=A0s promessas
> +de todas as
> +APIs de "auto-limpeza" (auto-cleanup), incluindo at=C3=A9 mesmo os auxil=
iares
> +``devm_``. Eles n=C3=A3o s=C3=A3o o estilo preferido de implementa=C3=A7=
=C3=A3o, apenas
> +um estilo
> +aceit=C3=A1vel.
> +
> +O uso de ``guard()`` =C3=A9 desencorajado em qualquer fun=C3=A7=C3=A3o c=
om mais de
> +20 linhas;
> +``scoped_guard()`` =C3=A9 considerado mais leg=C3=ADvel. O uso de lock/u=
nlock
> +normal
> +ainda =C3=A9 (levemente) preferido.
> +
> +Constru=C3=A7=C3=B5es de limpeza de baixo n=C3=ADvel (como ``__free()``)=
 podem ser
> +usadas ao
> +construir APIs e auxiliares, especialmente iteradores com escopo. No
> +entanto, o
> +uso direto de ``__free()`` dentro do n=C3=BAcleo de rede (networking cor=
e)
> +e drivers
> +=C3=A9 desencorajado. Orienta=C3=A7=C3=B5es semelhantes se aplicam =C3=
=A0 declara=C3=A7=C3=A3o
> +de vari=C3=A1veis
> +no meio da fun=C3=A7=C3=A3o.
> +
> +Patches de limpeza (Clean-up patches)
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +A netdev desencoraja patches que realizam limpezas simples que n=C3=A3o
> +estejam no
> +contexto de outro trabalho. Por exemplo:
> +
> +* Tratar avisos do ``checkpatch.pl`` e outros avisos triviais de estilo =
de
> +  codifica=C3=A7=C3=A3o
> +* Tratar problemas de Ordena=C3=A7=C3=A3o de vari=C3=A1veis locais
> +* Convers=C3=B5es para APIs gerenciadas por dispositivo (auxiliares ``de=
vm_``)
> +
> +Isso ocorre porque se considera que a agita=C3=A7=C3=A3o (*churn*) que t=
ais
> +mudan=C3=A7as
> +produzem tem um custo maior do que o valor de tais limpezas.
> +
> +Por outro lado, corre=C3=A7=C3=B5es de ortografia e gram=C3=A1tica n=C3=
=A3o s=C3=A3o
> +desencorajadas.
> +
> +Reenviando ap=C3=B3s a revis=C3=A3o
> +~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Aguarde pelo menos 24 horas entre as postagens. Isso garantir=C3=A1 que
> +revisores de
> +todas as localiza=C3=A7=C3=B5es geogr=C3=A1ficas tenham a chance de se
> +manifestar. N=C3=A3o espere
> +muito tempo (semanas) entre as postagens, pois isso tornar=C3=A1 mais
> +dif=C3=ADcil para
> +os revisores lembrarem de todo o contexto.
> +
> +Certifique-se de tratar todo o feedback em sua nova postagem. N=C3=A3o
> +envie uma
> +nova vers=C3=A3o do c=C3=B3digo se a discuss=C3=A3o sobre a vers=C3=A3o =
anterior ainda
> +estiver em
> +andamento, a menos que seja instru=C3=ADdo diretamente por um revisor.
> +
> +A nova vers=C3=A3o dos patches deve ser postada como uma thread separada=
,
> +n=C3=A3o como
> +uma resposta =C3=A0 postagem anterior. O registro de altera=C3=A7=C3=B5e=
s (changelog)
> +deve
> +incluir um link para a postagem anterior (veja :ref:`Solicita=C3=A7=C3=
=B5es
> +de mudan=C3=A7as`).
> +
> +Testes
> +------
> +
> +N=C3=ADvel de teste esperado
> +~~~~~~~~~~~~~~~~~~~~~~~
> +
> +No m=C3=ADnimo, suas altera=C3=A7=C3=B5es devem passar por uma compila=
=C3=A7=C3=A3o
> +``allyesconfig`` e
> +uma ``allmodconfig`` com ``W=3D1`` definido, sem novos avisos ou falhas.
> +
> +O ideal =C3=A9 que voc=C3=AA tenha feito testes em tempo de execu=C3=A7=
=C3=A3o
> +espec=C3=ADficos para sua
> +altera=C3=A7=C3=A3o, e que a s=C3=A9rie de patches contenha um conjunto =
de selftests
> +do kernel
> +para ``tools/testing/selftests/net`` ou usando o framework KUnit.
> +
> +Espera-se que voc=C3=AA teste suas altera=C3=A7=C3=B5es no topo da =C3=
=A1rvore de rede
> +relevante
> +(``net`` ou ``net-next``) e n=C3=A3o, por exemplo, em uma =C3=A1rvore es=
t=C3=A1vel
> +ou na
> +``linux-next``.
> +
> +Verifica=C3=A7=C3=B5es do patchwork
> +~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +As verifica=C3=A7=C3=B5es (*checks*) no patchwork s=C3=A3o, em sua maior=
ia, wrappers
> +simples
> +em torno de scripts existentes do kernel; as fontes est=C3=A3o dispon=C3=
=ADveis
> +em:
> +
> +https://github.com/linux-netdev/nipa/tree/master/tests
> +
> +**N=C3=A3o** envie seus patches apenas para execut=C3=A1-los nas
> +verifica=C3=A7=C3=B5es. Voc=C3=AA deve
> +garantir que seus patches estejam prontos, testando-os localmente antes =
de
> +postar na lista de discuss=C3=A3o. A inst=C3=A2ncia do bot de build do p=
atchwork
> +fica
> +sobrecarregada com muita facilidade e a netdev@vger realmente n=C3=A3o
> +precisa de
> +mais tr=C3=A1fego se pudermos evitar.
> +
> +netdevsim
> +~~~~~~~~~
> +
> +O ``netdevsim`` =C3=A9 um driver de teste que pode ser usado para exerci=
tar
> +APIs de
> +configura=C3=A7=C3=A3o de driver sem a necessidade de hardware
> +compat=C3=ADvel. Mock-ups e
> +testes baseados no ``netdevsim`` s=C3=A3o fortemente encorajados ao adic=
ionar
> +novas
> +APIs, mas o ``netdevsim`` em si **n=C3=A3o** =C3=A9 considerado um caso =
de
> +uso/usu=C3=A1rio.
> +Voc=C3=AA tamb=C3=A9m deve implementar as novas APIs em um driver real.
> +
> +N=C3=A3o damos garantias de que o ``netdevsim`` mudar=C3=A1 no futuro de=
 uma
> +forma que
> +quebraria o que normalmente seria considerado uAPI.
> +
> +O ``netdevsim`` =C3=A9 reservado apenas para uso por testes upstream,
> +portanto,
> +quaisquer novos recursos do ``netdevsim`` devem ser acompanhados de
> +selftests
> +em ``tools/testing/selftests/``.
> +
> +Status de suporte para drivers
> +------------------------------
> +
> +.. note: Os requisitos a seguir aplicam-se apenas a drivers de NIC
> +Ethernet.
> +
> +A netdev define requisitos adicionais para drivers que desejam adquirir =
o
> +status ``Supported`` (Suportado) no arquivo MAINTAINERS. Drivers
> +``Supported``
> +devem executar todos os testes de driver upstream e relatar os resultado=
s
> +duas
> +vezes por dia. Drivers que n=C3=A3o cumprirem este requisito devem usar
> +o status
> +``Maintained`` (Mantido). Atualmente, n=C3=A3o h=C3=A1 diferen=C3=A7a na=
 forma como os
> +drivers ``Supported`` e ``Maintained`` s=C3=A3o tratados no upstream.
> +
> +As regras exatas que um driver deve seguir para adquirir o status
> +``Supported``:
> +
> +1. Deve executar todos os testes sob os alvos ``drivers/net`` e
> +   ``drivers/net/hw`` dos selftests do Linux. A execu=C3=A7=C3=A3o e o r=
elato
> +   de testes
> +   privados / internos tamb=C3=A9m s=C3=A3o bem-vindos, mas os testes up=
stream
> +   s=C3=A3o
> +   obrigat=C3=B3rios.
> +
> +2. A frequ=C3=AAncia m=C3=ADnima de execu=C3=A7=C3=A3o =C3=A9 uma vez a =
cada 12 horas. Deve
> +testar o
> +   branch designado a partir do feed de branches selecionado. Observe
> +   que os
> +   branches s=C3=A3o constru=C3=ADdos automaticamente e est=C3=A3o expos=
tos =C3=A0
> +   postagem
> +   intencional de patches maliciosos; portanto, os sistemas de teste
> +   devem ser
> +   isolados.
> +
> +1. Drivers que suportam m=C3=BAltiplas gera=C3=A7=C3=B5es de dispositivo=
s devem
> +testar pelo
> +   menos um dispositivo de cada gera=C3=A7=C3=A3o. Um manifesto do ambie=
nte
> +   de teste
> +   (*testbed manifest* - formato exato a definir) deve descrever os
> +   modelos de
> +   dispositivos testados.
> +
> +1. Os testes devem ser executados de forma confi=C3=A1vel; se m=C3=BAlti=
plos
> +branches
> +   forem ignorados ou se os testes falharem devido a problemas no
> +   ambiente de
> +   execu=C3=A7=C3=A3o, o status ``Supported`` ser=C3=A1 retirado.
> +
> +1. Falhas nos testes devido a bugs no driver ou no pr=C3=B3prio teste,
> +ou falta de
> +   suporte para a funcionalidade que o teste visa, *n=C3=A3o* s=C3=A3o m=
otivo
> +   para a
> +   perda do status ``Supported``.
> +
> +O CI da netdev manter=C3=A1 uma p=C3=A1gina oficial de dispositivos supo=
rtados,
> +listando
> +seus resultados de testes recentes.
> +
> +O mantenedor do driver pode providenciar para que outra pessoa execute
> +o teste;
> +n=C3=A3o h=C3=A1 exig=C3=AAncia de que a pessoa listada como mantenedora=
 (ou seu
> +empregador)
> +seja respons=C3=A1vel pela execu=C3=A7=C3=A3o dos testes. Colabora=C3=A7=
=C3=B5es entre
> +fornecedores,
> +hospedagem de CI no GitHub (GH CI), outros reposit=C3=B3rios sob o
> +linux-netdev,
> +etc., s=C3=A3o muito bem-vindas.
> +
> +Veja https://github.com/linux-netdev/nipa/wiki para mais informa=C3=A7=
=C3=B5es
> +sobre o CI
> +da netdev. Sinta-se =C3=A0 vontade para entrar em contato com os mantene=
dores
> +ou com
> +a lista para quaisquer d=C3=BAvidas.
> +
> +Orienta=C3=A7=C3=B5es para revisores
> +--------------------------
> +
> +Revisar patches de outras pessoas na lista =C3=A9 altamente incentivado,
> +independentemente do n=C3=ADvel de experi=C3=AAncia. Para orienta=C3=A7=
=C3=B5es gerais
> +e dicas
> +=C3=BAteis, consulte `revis=C3=A3o de t=C3=B3picos avan=C3=A7ados de des=
envolvimento`.
> +
> +=C3=89 seguro assumir que os mantenedores da netdev conhecem a comunidad=
e
> +e o n=C3=ADvel
> +de experi=C3=AAncia dos revisores. Os revisores n=C3=A3o devem se preocu=
par com
> +o fato de
> +seus coment=C3=A1rios impedirem ou desviarem o fluxo de patches.
> +Less experienced reviewers are highly encouraged to do more in-depth
> +review of submissions and not focus exclusively on trivial or subjective
> +matters like code formatting, tags etc.
> +
> +Depoimentos / feedback
> +----------------------
> +
> +Algumas empresas utilizam o feedback de colegas em revis=C3=B5es de
> +desempenho de
> +funcion=C3=A1rios. Sinta-se =C3=A0 vontade para solicitar feedback dos
> +mantenedores da
> +netdev, especialmente se voc=C3=AA dedica uma quantidade significativa
> +de tempo
> +revisando c=C3=B3digo e se esfor=C3=A7a al=C3=A9m do esperado para melho=
rar a
> +infraestrutura
> +compartilhada.
> +
> +O feedback deve ser solicitado por voc=C3=AA, o colaborador, e ser=C3=A1=
 sempre
> +compartilhado com voc=C3=AA (mesmo que voc=C3=AA solicite que ele seja e=
nviado
> +ao seu
> +gerente).
> --
> 2.47.3
>

Hello,

I've identified a misalignment error in the "=3D=3D=3D" markers of the
title. My apologies for this.

I will be correcting it and will send version 2 (v2) of the patch
shortly, already in English.

Thanks,

Daniel
