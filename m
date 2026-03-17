Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C103EE1F2
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 16:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773765804; cv=pass; b=uBSE4aPw61BQYJ2w++CeV+pUt/en7GoS0KXxFy/pS2i8PQqROHWnQyll9t+v+/Y2XCiTWCYLLbb3z8OtAjoJknro9cUCuutYVKzZHR7H6vyQlmuLfiaZliW41gYsxLZ1N7+KqNrK8Z2+eNMuuA9hx/oLRgFYnPiYVYrfwadnF2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773765804; c=relaxed/simple;
	bh=jwRbDMYgbtlqWJWwhDj9hvYL9W4LIvYf2IcmIMd8+YI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jR2+dvpedpNng89Ucoh5iXIiTBaDUFx6QP+ul+kkgrWIil/GSGfCVu8yUXjH3a0vb+TV/yFnf+X2zurMMnPBjIhRXU4XVmUKasBGAxzFBF3Dw8LeyoBIeghQRxWcXYlfDpv26EG2rL+qJaE3/hsaW4lwozrO2uBMBPJALsH/fzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ca0wXfVD; arc=pass smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ca0wXfVD"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-67bad873c3eso3743160eaf.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 09:43:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773765800; cv=none;
        d=google.com; s=arc-20240605;
        b=faxMyyEV3LIyVxvL7/3sPq3QO22XPxN0MrFfxMNkdUlXx8LDmp6OKiM8uSBl/dzGaG
         9P2UPr+PszPlu9auE89S/uhwHXqQGtDhhY6ZydjCyg13uxnGLhgFiU8eggBCHhm8hXPS
         vecCODTdb6E8Rr+QToXVfoEXS+xdnN0n3pLLmiLASTXbs2/RAfkX7gtKe4rlVbalQH4F
         ZJsUF5c6LK68sQtEBw533MLMmTjtkLeHzFJCSdqNSyv9zrD9CLQdu2KuARiSdZYynrmp
         zNmcu8RwCSf4dJFBTL42Y+2zF1Uc1B9AE2kJTowzogZxBg8sE0WHBePw0epBFUCqYo3B
         etpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G+xUO4RCph4e1y+X4jt5c4YckHUtAgE6eCK/nSAvckE=;
        fh=la48+YZmfFuHc8i2pD9VXNZ7yiF+koTXHItNqQTdgs4=;
        b=Uh/Bbe5L2HB8eVZGKx21F595sSgwagaScClB1G/6K+lz9US4h2TTnvkgYSrCyQK5Cu
         dB+LIw0NQXCRpIU3Ba5DQU3+o9PmopmygSa3CX/UJmxzKygqrQW7CFXK0iuuITaSToNa
         Wg8URs00fhYNe/IMQPywge9tXfFqDYAEx8VLTM1iOxZZrmt3icOgyS0FU4iQAz/Qt6jI
         ThPSiAJb9pq87G7K4aLuxSXvVggMYazlF5xhEawEhvuZJKyd2LK4sk2v2SAhbKZ6G5AI
         SaG9nBqkUs1Gc+vk/xudMmzJDtJAUsH7uehSUIRqzL1OFFweQAODO9Asxc9TnqFrpzGu
         7xkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773765800; x=1774370600; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+xUO4RCph4e1y+X4jt5c4YckHUtAgE6eCK/nSAvckE=;
        b=ca0wXfVD9QjyBjgMhAc9OJiNMHRneoh4UesXUZrEjyRkLh77hTSGfIJqmd8Hmhsl/P
         o8611n3zRhNgZAnIRjw4TNiyoWpkw9sK69KNmyg24hMfIrrx387Mu5qdnvuRy/oVLv9E
         QJlzRDhaRIieXIjsozG3a+0XSd0hAOWnLayKvpwvRxGW2DHZPOWhX+k+nGLJZ+jADnEh
         KCLi7wfotdteYBnqlIWGXJNFzMIrPVBmMyVH5hqMlGJdbd9OHD2vmr7U/6bxFJkGcEEN
         3uhScmFYeQ85AGcVzu8KBBz/Ipap/o6c5KcXBUaDYfP3o+Uk8pTHnV6tdc/2c3smhFWo
         /S1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773765800; x=1774370600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G+xUO4RCph4e1y+X4jt5c4YckHUtAgE6eCK/nSAvckE=;
        b=PCFcKVJLJ3XYCZPmz3rGoomLvJc2p0/TZqGO5FymCTTD3YKwJb5jiG0nSEldHDJ/2V
         x7u+Wrg9vFhBgp0trXCNuS3RKjOGosyVF6iyQajhyEf4skcJv9UUHxEzbootfIvD/XXR
         YZIPEoTOjw+u1tN7EO4ksQFKJkdilGVa9dp7m+NuQ/dmP8oz0Hq11Ba5d/EA8go+iVqQ
         NgsxoJ0vAoBS95nDqUhTPXtoGXr396XlpkZV4KOuJBbj8Fv6zG34yJRMjh1REjJKdxTQ
         HvJYNfXqUAis8aj4pCFsZ746DAfWu6IOy5AbpC69KFj+2H87fy8R/7IiAsiXeBgJHuAY
         VHQQ==
X-Gm-Message-State: AOJu0Yw7zIaDaVVTA2iA7W2akVpxT0e6ka/2hXSsif/L2tfS2dr0si9D
	3IuR/+gSDKAz0KLZ87abAGUxvIE5RiVDx3RFLw1PT8ReVOfl8AbaLBvRwDAsPDRx8hWb2tgPkAq
	Lfm60tPFgHWA19zYTY9ZAiZJs1Xs4hZ4=
X-Gm-Gg: ATEYQzxvu8Ok0C5u2W8GvO9y4EMJ2n9F+C4DU5Vq/6S/7bf4+3X5K92kWImzo5t/IBF
	zWGIEBty2oeKTPQ5ZSVi2W7CSkHQlIwBUszJ5n7X0lUwctsL0CLG7MPqdbvRE6P7qBHkdeDWnra
	HRWHArjq/LO5YnvmsuGOoDkCzlvYgT2Mn9VsU7kDZWW/DDgj9BWSV3yJ3I80g9mm2IBfEEmS3wd
	2YTiwrA3g6hiR59wnSYpnTctyks47CJo9hCnEf3Up3DKg8cCEUqy9K9xTSujvQ23mQ/kIuWp1TL
	1OzIGbkyRFrOhJAomsSl932OTXLKSAkoeOuHOSY=
X-Received: by 2002:a05:6820:308c:b0:67b:bf52:9990 with SMTP id
 006d021491bc7-67bdaa69232mr10201540eaf.58.1773765800286; Tue, 17 Mar 2026
 09:43:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316212435.19303-1-arantescastro@gmail.com> <20260317140136.29256-1-arantescastro@gmail.com>
In-Reply-To: <20260317140136.29256-1-arantescastro@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 17 Mar 2026 13:43:08 -0300
X-Gm-Features: AaiRm50Jnpl4ZIH4DIsGHqwxxFAliDeUkT3vbK1ySj2wlMPsfHdcikIf8mmYLnM
Message-ID: <CAMAsx6c_oq5-cuf-N-+RTo-Hym-K+PF-=BOBZySWMN4E7O1s4A@mail.gmail.com>
Subject: Re: [PATCH v2] docs: pt_BR: translate process/1.Intro.rst
To: Daniel Castro <arantescastro@gmail.com>
Cc: linux-doc@vger.kernel.org, corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 11:02=E2=80=AFAM Daniel Castro <arantescastro@gmail=
.com> wrote:
>
> Add Brazilian Portuguese translation of the development process
> introduction (Documentation/process/1.Intro.rst), covering the
> executive summary, importance of mainline code, and licensing.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Daniel Castro <arantescastro@gmail.com>
> ---
> Changes in v2:
> - Remove duplicate reference label (.. _development_process_intro:)
> - Fix "propriedade original" -> "titularidade original" (correct legal te=
rm)
> - Reflow paragraphs for optimal line filling
>
>  Documentation/translations/pt_BR/index.rst    |   1 +
>  .../translations/pt_BR/process/1.Intro.rst    | 269 ++++++++++++++++++
>  2 files changed, 270 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/1.Intro.rst
>
> diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/t=
ranslations/pt_BR/index.rst
> index de5c005f91d6..4f7fcc3c66fb 100644
> --- a/Documentation/translations/pt_BR/index.rst
> +++ b/Documentation/translations/pt_BR/index.rst
> @@ -66,6 +66,7 @@ kernel e sobre como ver seu trabalho integrado.
>  .. toctree::
>     :maxdepth: 1
>
> +   Introdu=C3=A7=C3=A3o <process/1.Intro>
>     Como come=C3=A7ar <process/howto>
>     Requisitos m=C3=ADnimos <process/changes>
>     Manuais dos mantenedores <process/maintainer-handbooks>
> diff --git a/Documentation/translations/pt_BR/process/1.Intro.rst b/Docum=
entation/translations/pt_BR/process/1.Intro.rst
> new file mode 100644
> index 000000000000..2995fa49e4c4
> --- /dev/null
> +++ b/Documentation/translations/pt_BR/process/1.Intro.rst
> @@ -0,0 +1,269 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Introdu=C3=A7=C3=A3o
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Sum=C3=A1rio
> +-------
> +
> +O restante desta se=C3=A7=C3=A3o cobre o processo de desenvolvimento do =
kernel e os
> +tipos de frustra=C3=A7=C3=A3o que os desenvolvedores e empresas podem en=
contrar pelo
> +caminho. Existem diversas raz=C3=B5es que justificam a recomenda=C3=A7=
=C3=A3o para que seja
> +feito o merge do c=C3=B3digo do kernel ao kernel principal ("mainline"),=
 como
> +disponibilidade autom=C3=A1tica aos usu=C3=A1rios, suporte da comunidade=
 em diversas
> +formas, e a oportunidade de influenciar a dire=C3=A7=C3=A3o do desenvolv=
imento do
> +kernel. Contribui=C3=A7=C3=B5es ao kernel Linux obrigatoriamente devem e=
star dispon=C3=ADveis
> +sob uma licen=C3=A7a compat=C3=ADvel com a GPL.
> +
> +:ref:`development_process` apresenta o processo de desenvolvimento, o ci=
clo de
> +lan=C3=A7amento, e a mec=C3=A2nica da janela de merge. As v=C3=A1rias fa=
ses no desenvolvimento
> +de patch, revis=C3=A3o, e ciclo de merge s=C3=A3o explicadas. Algumas fe=
rramentas e
> +listas de e-mail s=C3=A3o discutidas. Desenvolvedores que queiram come=
=C3=A7ar a
> +desenvolver o kernel s=C3=A3o encorajados a buscar e corrigir bugs como =
exerc=C3=ADcio
> +inicial.
> +
> +:ref:`development_early_stage` cobre os primeiros passos do processo de
> +desenvolvimento, com =C3=AAnfase no envolvimento da comunidade de desenv=
olvedores o
> +mais cedo poss=C3=ADvel.
> +
> +:ref:`development_coding` =C3=A9 sobre o processo de codifica=C3=A7=C3=
=A3o; muitas armadilhas
> +j=C3=A1 encontradas por outros desenvolvedores s=C3=A3o discutidas. Algu=
ns requisitos
> +para patches s=C3=A3o explicados, e =C3=A9 feita uma introdu=C3=A7=C3=A3=
o para algumas ferramentas
> +que podem ajudar a garantir que os patches de kernel est=C3=A3o corretos=
.
> +
> +:ref:`development_posting` fala sobre o processo de envio de patches par=
a
> +revis=C3=A3o. Para serem levados em considera=C3=A7=C3=A3o pela comunida=
de desenvolvedora, os
> +patches devem estar devidamente formatados e descritos, assim como devem=
 estar
> +no lugar correto. Seguir os conselhos dessa se=C3=A7=C3=A3o pode ajudar =
na recep=C3=A7=C3=A3o
> +positiva do seu trabalho.
> +
> +:ref:`development_followthrough` cobre o que acontece ap=C3=B3s o envio =
dos patches;
> +o trabalho ainda est=C3=A1 longe de estar conclu=C3=ADdo. Trabalhar com =
os revisores =C3=A9
> +parte crucial do processo de desenvolvimento; essa se=C3=A7=C3=A3o ofere=
ce dicas de como
> +evitar problemas nesse est=C3=A1gio importante. Desenvolvedores s=C3=A3o=
 alertados a n=C3=A3o
> +presumir que o trabalho acabou ap=C3=B3s o merge do patch no "mainline".
> +
> +:ref:`development_advancedtopics` introduz dois t=C3=B3picos mais "avan=
=C3=A7ados":
> +gerenciamento de patches com git e revis=C3=A3o de patches por outros.
> +
> +:ref:`development_conclusion` conclui o documento com indica=C3=A7=C3=B5=
es de fontes com
> +mais informa=C3=A7=C3=B5es sobre o desenvolvimento do kernel.
> +
> +Sobre este documento
> +--------------------
> +
> +O kernel Linux, com mais de 8 milh=C3=B5es de linhas de c=C3=B3digo e be=
m mais de 1000
> +contribuintes a cada lan=C3=A7amento ("release"), =C3=A9 um dos maiores =
e mais ativos
> +projetos de software livre em exist=C3=AAncia. Desde seu modesto in=C3=
=ADcio em 1991,
> +este kernel evoluiu para se tornar um dos melhores componentes de sistem=
as
> +operacionais, rodando em pequenos players de m=C3=BAsica digital, PCs de=
 mesa, os
> +maiores supercomputadores em exist=C3=AAncia, e todos os outros tipos de=
 sistema
> +entre eles. =C3=89 robusto, eficiente, e uma solu=C3=A7=C3=A3o escal=C3=
=A1vel para quase toda
> +situa=C3=A7=C3=A3o.
> +
> +O crescimento do Linux trouxe o aumento no n=C3=BAmero de desenvolvedore=
s (e
> +empresas) desejando participar no seu desenvolvimento. Fabricantes de ha=
rdware
> +querem garantir que o Linux suporte bem os seus produtos, tornando-os at=
rativos
> +para usu=C3=A1rios Linux. Fabricantes de sistemas embarcados, que usam o=
 Linux como
> +componente em um produto integrado, querem que o Linux seja t=C3=A3o cap=
az e
> +adequado quanto poss=C3=ADvel para a tarefa em quest=C3=A3o. Distribuido=
res de software
> +que baseiam seus produtos em Linux t=C3=AAm claro interesse nas capacida=
des,
> +performance, e confiabilidade do kernel Linux. =C3=89 tamb=C3=A9m comum =
que usu=C3=A1rios
> +finais queiram alterar o Linux para atender melhor suas necessidades.
> +
> +Uma das caracter=C3=ADsticas mais atrativas do Linux =C3=A9 sua facilida=
de de acesso a
> +esses desenvolvedores; qualquer um com as habilidades necess=C3=A1rias p=
ode melhorar
> +o Linux e influenciar a dire=C3=A7=C3=A3o do seu desenvolvimento. Produt=
os propriet=C3=A1rios
> +n=C3=A3o conseguem oferecer esse tipo de abertura, que =C3=A9 caracter=
=C3=ADstico do processo
> +de software livre. O kernel =C3=A9 ainda mais acess=C3=ADvel que a maior=
ia dos outros
> +projetos de software livre. Um ciclo t=C3=ADpico de tr=C3=AAs meses de d=
esenvolvimento
> +do kernel pode envolver mais de 1000 desenvolvedores trabalhando para ma=
is de
> +100 empresas (ou absolutamente nenhuma empresa).
> +
> +Trabalhar com a comunidade de desenvolvimento do kernel n=C3=A3o =C3=A9 =
uma tarefa =C3=A1rdua.
> +Contudo, muitos colaboradores potenciais passaram por dificuldades ao te=
ntar
> +trabalhar no kernel. A comunidade evoluiu suas pr=C3=B3prias formas de f=
uncionamento
> +que permitem operar de forma fluida (e produzir um produto de alta quali=
dade)
> +em um ambiente em que milhares de linhas de c=C3=B3digo s=C3=A3o alterad=
as todos os dias.
> +N=C3=A3o =C3=A9 surpresa que o processo de desenvolvimento do kernel Lin=
ux seja muito
> +diferente dos modelos de desenvolvimento propriet=C3=A1rios.
> +
> +O processo de desenvolvimento do kernel pode parecer estranho e intimida=
dor
> +para novos desenvolvedores, mas existem bons motivos e uma s=C3=B3lida e=
xperi=C3=AAncia
> +por tr=C3=A1s disso. Um desenvolvedor que n=C3=A3o entenda os caminhos p=
r=C3=B3prios da
> +comunidade kernel (ou pior, que tente menosprez=C3=A1-los ou contorn=C3=
=A1-los) ter=C3=A1 uma
> +experi=C3=AAncia frustrante pela frente. A comunidade de desenvolvimento=
 ajuda
> +aqueles que tentam aprender, mas gasta pouco tempo com aqueles que n=C3=
=A3o escutam
> +ou n=C3=A3o ligam para o processo de desenvolvimento.
> +
> +Espera-se que aqueles que leiam este documento sejam capazes de evitar e=
ssa
> +experi=C3=AAncia frustrante. H=C3=A1 muito material aqui, mas o esfor=C3=
=A7o envolvido na sua
> +leitura valer=C3=A1 a pena. A comunidade de desenvolvimento sempre neces=
sita de
> +desenvolvedores que ajudem a melhorar o kernel; o texto a seguir deve aj=
udar
> +voc=C3=AA - ou aqueles trabalhando para voc=C3=AA - a se juntar =C3=A0 n=
ossa comunidade.
> +
> +Cr=C3=A9ditos
> +--------
> +
> +Esse documento foi escrito por Jonathan Corbet, corbet@lwn.net. Aprimora=
do
> +pelos coment=C3=A1rios de Johannes Berg, James Berry, Alex Chiang, Rolan=
d Dreier,
> +Randy Dunlap, Jake Edge, Jiri Kosina, Matt Mackall, Arthur Marsh, Amanda
> +McPherson, Andrew Morton, Andrew Price, Tsugikazu Shibata, e Jochen Vo=
=C3=9F.
> +
> +Esse trabalho contou com o apoio da Linux Foundation; agradecimentos esp=
eciais
> +para Amanda McPherson, que viu o valor desse esfor=C3=A7o e fez tudo aco=
ntecer.
> +
> +A import=C3=A2ncia de levar o c=C3=B3digo at=C3=A9 o "mainline"
> +-------------------------------------------------
> +
> +Algumas empresas e desenvolvedores ocasionalmente se perguntam por que d=
evem
> +se importar em aprender como trabalhar com a comunidade do kernel e ter =
seu
> +c=C3=B3digo no "mainline" (o kernel mantido por Linus Torvalds e usado c=
omo base
> +para os distribuidores Linux). No curto prazo, contribuir com o c=C3=B3d=
igo pode
> +parecer um gasto evit=C3=A1vel; parece mais f=C3=A1cil apenas manter o s=
eu c=C3=B3digo =C3=A0
> +parte e oferecer suporte direto aos usu=C3=A1rios. A verdade =C3=A9 que =
manter c=C3=B3digo
> +fora da =C3=A1rvore principal ("out-of-tree") =C3=A9 uma falsa economia.
> +
> +Para ilustrar os custos do c=C3=B3digo "out-of-tree", aqui est=C3=A3o al=
guns aspectos
> +relevantes do processo de desenvolvimento do kernel; a maioria ser=C3=A1=
 discutida
> +com mais detalhes adiante neste documento. Considere:
> +
> +- C=C3=B3digo integrado via merge ao "mainline" fica dispon=C3=ADvel par=
a todos os
> +  usu=C3=A1rios Linux. Estar=C3=A1 automaticamente presente em todas as =
distribui=C3=A7=C3=B5es
> +  que o habilitarem. N=C3=A3o h=C3=A1 necessidade de discos de armazenam=
ento, downloads,
> +  ou as complica=C3=A7=C3=B5es de dar suporte a m=C3=BAltiplas vers=C3=
=B5es de variadas
> +  distribui=C3=A7=C3=B5es; tudo simplesmente funciona, para o desenvolve=
dor e para o
> +  usu=C3=A1rio. Incorpora=C3=A7=C3=A3o ao "mainline" resolve um grande n=
=C3=BAmero de problemas
> +  de distribui=C3=A7=C3=A3o e suporte.
> +
> +- Enquanto desenvolvedores do kernel se esfor=C3=A7am para manter uma in=
terface
> +  est=C3=A1vel para o espa=C3=A7o do usu=C3=A1rio, a API interna est=C3=
=A1 em constante mudan=C3=A7a.
> +  A aus=C3=AAncia de uma interface interna est=C3=A1vel =C3=A9 uma escol=
ha deliberada de
> +  design; permite que sejam feitas melhorias fundamentais a qualquer tem=
po e
> +  resulta em c=C3=B3digo de qualidade superior. Uma consequ=C3=AAncia de=
ssa pol=C3=ADtica =C3=A9
> +  que c=C3=B3digo "out-of-tree" precisa ser constantemente atualizado pa=
ra que
> +  continue funcionando com novos kernels. Manter c=C3=B3digo "out-of-tre=
e" requer
> +  significativo trabalho apenas para mant=C3=AA-lo funcionando.
> +
> +  Por sua vez, c=C3=B3digo que est=C3=A1 no "mainline" n=C3=A3o precisa =
dessa manuten=C3=A7=C3=A3o,
> +  resultado de uma regra simples que exige que qualquer desenvolvedor qu=
e
> +  altere uma API, tamb=C3=A9m conserte qualquer c=C3=B3digo que deixe de=
 funcionar como
> +  resultado da altera=C3=A7=C3=A3o. C=C3=B3digo que teve o merge realiza=
do no "mainline" tem
> +  custo significativamente menor de manuten=C3=A7=C3=A3o.
> +
> +- Al=C3=A9m disso, c=C3=B3digo que est=C3=A1 no kernel ser=C3=A1 muitas =
vezes melhorado por outros
> +  desenvolvedores. Resultados surpreendentes podem surgir ao permitir qu=
e sua
> +  comunidade de usu=C3=A1rios e clientes melhore seu produto.
> +
> +- C=C3=B3digo do kernel est=C3=A1 sujeito a revis=C3=A3o, tanto antes co=
mo depois do merge ao
> +  "mainline". Independentemente das habilidades do desenvolvedor origina=
l, o
> +  processo de revis=C3=A3o invariavelmente encontra maneiras de evolu=C3=
=AD-lo. Bugs
> +  severos e problemas de seguran=C3=A7a s=C3=A3o constantemente encontra=
dos durante o
> +  processo de revis=C3=A3o. Isso =C3=A9 especialmente v=C3=A1lido para c=
=C3=B3digo desenvolvido em
> +  ambiente isolado; tais c=C3=B3digos se beneficiam fortemente ao serem =
revistos por
> +  outros desenvolvedores. C=C3=B3digo "out-of-tree" =C3=A9 c=C3=B3digo d=
e baixa qualidade.
> +
> +- Participa=C3=A7=C3=A3o no processo de desenvolvimento =C3=A9 a forma p=
ela qual voc=C3=AA pode
> +  influenciar a dire=C3=A7=C3=A3o do desenvolvimento do kernel. Usu=C3=
=A1rios que se queixam
> +  externamente s=C3=A3o ouvidos, por=C3=A9m desenvolvedores ativos t=C3=
=AAm maior poder de
> +  articula=C3=A7=C3=A3o - e a habilidade de implementar mudan=C3=A7as qu=
e fa=C3=A7am o kernel
> +  funcionar melhor para suas necessidades.
> +
> +- Quando o c=C3=B3digo =C3=A9 mantido =C3=A0 parte, sempre existe a poss=
ibilidade de que
> +  terceiros contribuam para uma implementa=C3=A7=C3=A3o diferente de uma=
 funcionalidade
> +  parecida. Se isso acontecer, ter seu c=C3=B3digo integrado via merge s=
e tornar=C3=A1
> +  muito mais dif=C3=ADcil - ao ponto de ser imposs=C3=ADvel. Voc=C3=AA e=
nfrentar=C3=A1 duas
> +  alternativas desagrad=C3=A1veis, (1) manter uma funcionalidade "out-of=
-tree"
> +  indefinidamente ou (2) abandonar seu c=C3=B3digo e migrar seus usu=C3=
=A1rios para a
> +  vers=C3=A3o na =C3=A1rvore principal ("in-tree").
> +
> +- Contribui=C3=A7=C3=A3o de c=C3=B3digo =C3=A9 a a=C3=A7=C3=A3o fundamen=
tal que faz todo o processo
> +  funcionar. Ao contribuir com seu c=C3=B3digo voc=C3=AA pode adicionar =
nova
> +  funcionalidade ao kernel e proporcionar capacidades e exemplos que pod=
em ser
> +  usados por outros desenvolvedores de kernel. Se voc=C3=AA desenvolveu =
c=C3=B3digo para
> +  o Linux (ou est=C3=A1 pensando em desenvolver), voc=C3=AA claramente t=
em interesse na
> +  continuidade do sucesso dessa plataforma; contribui=C3=A7=C3=A3o de c=
=C3=B3digo =C3=A9 uma das
> +  melhores maneiras de garantir esse sucesso.
> +
> +Todos os argumentos acima se aplicam a qualquer c=C3=B3digo "out-of-tree=
", incluindo
> +c=C3=B3digo distribu=C3=ADdo de maneira propriet=C3=A1ria, em formato ex=
clusivamente bin=C3=A1rio.
> +Existem fatores adicionais que devem ser levados em considera=C3=A7=C3=
=A3o antes de
> +qualquer distribui=C3=A7=C3=A3o de c=C3=B3digo de kernel apenas em bin=
=C3=A1rio, incluindo:
> +
> +- As quest=C3=B5es legais da distribui=C3=A7=C3=A3o de kernel propriet=
=C3=A1rio s=C3=A3o, no melhor dos
> +  casos, confusas; muitos detentores de direitos autorais do kernel acre=
ditam
> +  que a maioria dos m=C3=B3dulos bin=C3=A1rios s=C3=A3o produtos derivad=
os do kernel e que,
> +  como resultado, sua distribui=C3=A7=C3=A3o =C3=A9 uma viola=C3=A7=C3=
=A3o da Licen=C3=A7a P=C3=BAblica Geral GNU
> +  ("GNU General Public License"), que ser=C3=A1 tratada com mais profund=
idade abaixo.
> +  Este autor n=C3=A3o =C3=A9 um advogado, e nada neste documento pode se=
r considerado
> +  aconselhamento jur=C3=ADdico. O verdadeiro status de m=C3=B3dulos priv=
ados ("closed
> +  source") s=C3=B3 pode ser determinado judicialmente. Independentemente=
 disso, a
> +  incerteza que cerca esses m=C3=B3dulos existe.
> +
> +- Os m=C3=B3dulos bin=C3=A1rios aumentam consideravelmente a dificuldade=
 de depura=C3=A7=C3=A3o de
> +  problemas do kernel ("debugging"), a ponto de a maioria dos desenvolve=
dores
> +  de kernel sequer tentar. Portanto, a distribui=C3=A7=C3=A3o de m=C3=B3=
dulos exclusivamente
> +  bin=C3=A1rios tornar=C3=A1 mais dif=C3=ADcil que os seus usu=C3=A1rios=
 recebam suporte.
> +
> +- O suporte tamb=C3=A9m =C3=A9 mais dif=C3=ADcil para distribuidores de =
m=C3=B3dulos exclusivamente
> +  bin=C3=A1rios, que precisam fornecer uma vers=C3=A3o do m=C3=B3dulo pa=
ra cada distribui=C3=A7=C3=A3o e
> +  cada vers=C3=A3o do kernel que desejam suportar. Dezenas de vers=C3=B5=
es de um =C3=BAnico
> +  m=C3=B3dulo podem ser necess=C3=A1rias para fornecer uma cobertura raz=
oavelmente
> +  abrangente, e seus usu=C3=A1rios ter=C3=A3o que atualizar seu m=C3=B3d=
ulo separadamente
> +  sempre que atualizarem seu kernel.
> +
> +- Tudo o que foi dito acima sobre revis=C3=A3o de c=C3=B3digo se aplica =
em dobro ao
> +  c=C3=B3digo fechado. Como esse c=C3=B3digo n=C3=A3o est=C3=A1 dispon=
=C3=ADvel, ele n=C3=A3o pode ter sido
> +  revisado pela comunidade e, sem d=C3=BAvida, ter=C3=A1 s=C3=A9rios pro=
blemas.
> +
> +Os fabricantes de sistemas embarcados, em particular, podem ser tentados=
 a
> +ignorar grande parte do que foi dito nesta se=C3=A7=C3=A3o, acreditando =
que est=C3=A3o
> +lan=C3=A7ando um produto autossuficiente que usa uma vers=C3=A3o congela=
da do kernel e
> +n=C3=A3o requer mais desenvolvimento ap=C3=B3s o lan=C3=A7amento. Esse a=
rgumento ignora o
> +valor de uma revis=C3=A3o de c=C3=B3digo abrangente e o valor de permiti=
r que seus
> +usu=C3=A1rios adicionem recursos ao seu produto. Mas esses produtos tamb=
=C3=A9m t=C3=AAm uma
> +vida comercial limitada, ap=C3=B3s a qual uma nova vers=C3=A3o deve ser =
lan=C3=A7ada. Nesse
> +ponto, os fornecedores cujo c=C3=B3digo est=C3=A1 no "mainline" e bem ma=
ntido estar=C3=A3o em
> +uma posi=C3=A7=C3=A3o muito melhor para preparar o novo produto para o m=
ercado
> +rapidamente.
> +
> +Licenciamento
> +-------------
> +
> +C=C3=B3digo =C3=A9 submetido ao kernel do Linux sob diversas licen=C3=A7=
as, mas todo ele deve
> +ser compat=C3=ADvel com a vers=C3=A3o 2 da Licen=C3=A7a P=C3=BAblica Ger=
al GNU (GPLv2), que =C3=A9 a
> +licen=C3=A7a que cobre a distribui=C3=A7=C3=A3o do kernel como um todo. =
Na pr=C3=A1tica, isso
> +significa que todas as contribui=C3=A7=C3=B5es de c=C3=B3digo s=C3=A3o c=
obertas pela GPLv2 (com,
> +opcionalmente, uma linguagem que permita a distribui=C3=A7=C3=A3o sob ve=
rs=C3=B5es posteriores
> +da GPL) ou pela licen=C3=A7a BSD de tr=C3=AAs cl=C3=A1usulas. Quaisquer =
contribui=C3=A7=C3=B5es que n=C3=A3o
> +sejam cobertas por uma licen=C3=A7a compat=C3=ADvel n=C3=A3o ser=C3=A3o =
aceitas no kernel.
> +
> +A cess=C3=A3o de direitos autorais n=C3=A3o =C3=A9 exigida (nem solicita=
da) para o c=C3=B3digo
> +contribu=C3=ADdo para o kernel. Todo o c=C3=B3digo incorporado ao kernel=
 principal mant=C3=A9m
> +sua titularidade original; como resultado, o kernel agora tem milhares d=
e
> +propriet=C3=A1rios.
> +
> +Uma implica=C3=A7=C3=A3o dessa estrutura de propriedade =C3=A9 que qualq=
uer tentativa de
> +alterar o licenciamento do kernel est=C3=A1 fadada ao fracasso quase cer=
to. Existem
> +poucos cen=C3=A1rios pr=C3=A1ticos em que o acordo de todos os detentore=
s de direitos
> +autorais poderia ser obtido (ou seu c=C3=B3digo removido do kernel). Por=
tanto, em
> +particular, n=C3=A3o h=C3=A1 perspectiva de migra=C3=A7=C3=A3o para a ve=
rs=C3=A3o 3 da GPL em um futuro
> +pr=C3=B3ximo.
> +
> +=C3=89 imprescind=C3=ADvel que todo o c=C3=B3digo contribu=C3=ADdo para =
o kernel seja legitimamente
> +software livre. Por esse motivo, c=C3=B3digo de contribuidores sem ident=
idade
> +conhecida ou contribuidores an=C3=B4nimos n=C3=A3o ser=C3=A1 aceito. Tod=
os os contribuidores
> +s=C3=A3o obrigados a "assinar" seu c=C3=B3digo, declarando que ele pode =
ser distribu=C3=ADdo
> +com o kernel sob a GPL. C=C3=B3digo que n=C3=A3o tenha sido licenciado c=
omo software
> +livre por seu propriet=C3=A1rio, ou que apresente risco de criar problem=
as
> +relacionados a direitos autorais para o kernel (como c=C3=B3digo derivad=
o de
> +esfor=C3=A7os de engenharia reversa sem as devidas salvaguardas) n=C3=A3=
o pode ser
> +contribu=C3=ADdo.
> +
> +Quest=C3=B5es sobre direitos autorais s=C3=A3o comuns em listas de discu=
ss=C3=A3o de
> +desenvolvimento Linux. Normalmente, essas perguntas recebem muitas respo=
stas,
> +mas =C3=A9 importante lembrar que as pessoas que respondem a essas pergu=
ntas n=C3=A3o s=C3=A3o
> +advogados e n=C3=A3o podem fornecer aconselhamento jur=C3=ADdico. Se voc=
=C3=AA tiver d=C3=BAvidas
> +jur=C3=ADdicas relacionadas ao c=C3=B3digo-fonte do Linux, n=C3=A3o h=C3=
=A1 substituto para
> +conversar com um advogado especializado nessa =C3=A1rea. Confiar em resp=
ostas
> +obtidas em listas de discuss=C3=A3o t=C3=A9cnicas =C3=A9 arriscado.
> --
> 2.53.0
>
Hello Daniel,

Thank you for sending the new version. Please review the following
crucial points before submitting v3:

New Email for Each Version: Always send patches in a new email,
including the version number in the subject (e.g., [PATCH v3] docs:
pt_BR: translate process/1.Intro.rst). This is vital for community
tracking.
Subheading Formatting: The misalignment in the subheading separators
persists (e.g., +Cr=C3=A9ditos/+--------). Please correct this.
Use checkpatch.pl: Always run the checkpatch.pl tool before
submitting. This is mandatory and will catch these style errors,
helping to prevent rejections.
Submission Cadence: Please avoid sending more than one version per
day. The community has many patches to review, and this helps prevent
overwhelming the review process.

Applying these style corrections and following the submission rules
will greatly speed up the integration of your work.

Thank you,

Daniel
