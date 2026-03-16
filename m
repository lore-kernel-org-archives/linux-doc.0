Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CEC21B1BF
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 22:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773701992; cv=pass; b=P/4vDvmAw3jhD8LHxjBUgXa57ioM4WfJy/rWhw+C7mY2NeYmfQhbu698TBesaK7sAM76sxZ71PWPq+yMZULki9kAq5MzNPtTP+uAnNOpA/IGyA67jn1JqNSocxNGGyfLUA9icDsV4IXEVCva24cJGV1ogQgaH4mT3fKk+Hl7kcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773701992; c=relaxed/simple;
	bh=8wYs8x4omXbt0racZwRd6gKq9PNtTacE6OJj6dcVDHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mieU4X+DVe1QV34qyV5Kt8wI2Xf07NTPCPcaRlXmcyHfo1RcYz6ffICrWCmhqJ4l/lM2Txu7/t2G/FpafgTzJEFAGwkw5GsyLCOxw5xDCWj16JzITsUrS3t0kDjhaFspqPM8j//sFFk/LOZ7t3c+t5VbhqBIX3qiWoDDvWWNPRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azH4cm7T; arc=pass smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azH4cm7T"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d74c1157a4so5130309a34.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 15:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773701989; cv=none;
        d=google.com; s=arc-20240605;
        b=HmLs8e4Wm/5v49qyfyHeIoOrb2hUxZf5RrJBACzE2ydSw+Qg9eginioaHKAeLp+uvt
         o7fdt6f6MIdLN6KNHyRBgOhTxZkfasBtnv7aNSaXo5Q3cbXWUYeO5k/kydzl6zjSqfjv
         YawuOsgCFfjTwHCpVlde1NE0SgMcTpiidtfojvNyStNRGJDLANQAWtYtVEQzYfFfLHtP
         TCzCDWF9bWqr7EcvRJNhlFZRJmCXBybbcF5e8N7iH+ZH36eaw9t/ddFDRoGnZaF/qT5W
         3VT/1E5aN1byd+zLZXTaGSKiQarWFMhFCehfWs//nIMZIBgsnwpapJ5S+mtGTbwmrH4g
         lPDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HEkA/kKGMfrO2HG+farnN5nEbeq4woQMsj3oeLnHWjI=;
        fh=azEqO9abGNXeJmmWL3hmSt/EDadE0sLxkD86uM87K6w=;
        b=hvW7ihrBpMgpUCwwcz7+OEvVmjx0wnQeoWUcJfJIfhqoaIMNSlAAaHZgLHl2Fitd+D
         84LHR/ZK7APPttMpKnbWvjUH6Wf9lvWOx9q4RcW/bjTFOp4VMb9PibcjFPchpFRhWz75
         1Z0LOUS3TDRKn9dT2u5rD8l91RBsLYjwgc1yAg3/wPa1lfgpSfNcCBFsCjqkQ/aPVsGn
         yJ2iOxxn/MFnZz+OCgFUB9D29HaJg4GYQFdP1V4kjUpQiAv4oQKa8ioQz7J8qYQBPEgc
         0UlnzOeI/2XeYWPD+CazpPjzEFTtPbseKsyG0FnNuLQgfw9LTOaWUHXHNIWnRhsKgdKY
         2KUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773701989; x=1774306789; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEkA/kKGMfrO2HG+farnN5nEbeq4woQMsj3oeLnHWjI=;
        b=azH4cm7TPfQScJDCqIKQDj60bLXSud3A3KSQuEmD7GDpGIPD3F9RqYZcIM7sR1Hzrz
         RhsQaski/1RrDeYFgvO1sJmPmB2rwvF+mrB023BdMiAGaPRLmS0uf9VJ5jZ1rlzi4rFP
         7gx85z0nNmaxhniAbpxgmOWDISC3XbyREYoxCWHjG9paSMo03fVzKlBpHDDKNXcrhym8
         ypjbU7KlUJfx8fCiPTZCqSRSrn4h/+3UawUsElydkm2HjnGQnjT/4BDGNSMBpY8sjO/N
         vMqDoImh9FPBuXvelMGQ/IkFmyiw7f4cgADikXjOba0uGWqxUhYTrLk/fNSbHeu6GQ0w
         8QRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773701989; x=1774306789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HEkA/kKGMfrO2HG+farnN5nEbeq4woQMsj3oeLnHWjI=;
        b=hfJlXZHztusuaAT26lm808T45zPHSm4Oyh09gTKGuNR6H7+U6GC1F+jh5Zuzxi3SqB
         q6vFgfU7ZpQ9zMzTNAaF1U1bHvC+PlCibfL8mi449TD7TT6TBOUnOFQPfPZuCCv1Dm7A
         Oa20fw+QKXCjxFcV/Dzw56e9YWofzU4/fuzMTAPkswn8MUhKAQIBBTIzu3Eu9eTEdEvF
         vH96T2jKz77gtxApZfbEU8eF5Mp7cM3HctIbLR0hPs5iOScq+fc7IOp7eFkXUWrg3tvA
         O4xY2o0zG5/unq8cDsg/4DD4OAHUVHb5KJtON5twJtrmcmdrladfOUxSoAdWasFCSwvb
         M5Eg==
X-Gm-Message-State: AOJu0YzbKdYl7VJjWiDINDz+5X3gu3ey4yrCyTNVW3vPxcM91QDxypkf
	SUiw5vBchzSqQVXU82M1c9tf22XjWpdNhNLmFPSvaj9EDFwC4iWBW9WVbQ9HCigD3GIqVlOmAtn
	R1n5lulmDpB/LRYXoRImL8WvsUKeGCaE=
X-Gm-Gg: ATEYQzznL5Z+IzEtgWK0zsNyHYoR8NuBAYCYk5tucc0gJYk6xOwKEWMXDKwfxrkkmnk
	Bm3eIHGXcQcycJQiqGEtWEjpt/kcQY2FlF/f50jflKiQZ4wKr64ak2MB8MTZNtvexhbMTaz4Sbg
	yd2dBxvX0Z9BqEoF7aBz7T8Wu0eRHwVP8AaZw5vPGSXjTh4hofQbxFlPvvQXvvPQCYwE5iLFRPt
	Gs2ps1FT0wWQoiG7ogi02u+rAyahAS8dcdfRoitOMMsyRG0e2vdGPjPyHTlDcIeMs82A6LnAAN1
	HN4jRJTyKS/ysdTSta/Si80duhn38SiNGgXrUbjsQ97McJOyb0NoVuKBCKh8cfoKa39E6+6BTQ=
	=
X-Received: by 2002:a05:6820:460c:b0:67b:a4fa:7a0 with SMTP id
 006d021491bc7-67bdaa2ef02mr7809725eaf.44.1773701988593; Mon, 16 Mar 2026
 15:59:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316212435.19303-1-arantescastro@gmail.com>
In-Reply-To: <20260316212435.19303-1-arantescastro@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 16 Mar 2026 19:59:37 -0300
X-Gm-Features: AaiRm52DXzXztdjh5YdSbWiAcwmQnR3kKfQyRbc_BQV2xEJyz6XGLuxlIKWkwKk
Message-ID: <CAMAsx6e9qqdw+aBGkkU3tDONdAmF=ATiCOn50FMfmd1Mzsfuxw@mail.gmail.com>
Subject: Re: [PATCH] docs: pt_BR: translate process/1.Intro.rst
To: Daniel Castro <arantescastro@gmail.com>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 6:25=E2=80=AFPM Daniel Castro <arantescastro@gmail.=
com> wrote:
>
> Add Brazilian Portuguese translation of the development process
> introduction (Documentation/process/1.Intro.rst), covering the
> executive summary, importance of mainline code, and licensing.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Daniel Castro <arantescastro@gmail.com>
> ---
>  Documentation/translations/pt_BR/index.rst    |   1 +
>  .../translations/pt_BR/process/1.Intro.rst    | 300 ++++++++++++++++++
>  2 files changed, 301 insertions(+)
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
> index 000000000000..e39470e9ce52
> --- /dev/null
> +++ b/Documentation/translations/pt_BR/process/1.Intro.rst
> @@ -0,0 +1,300 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _development_process_intro:
> +
> +Introdu=C3=A7=C3=A3o
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Sum=C3=A1rio
> +-------
> +
> +O restante desta se=C3=A7=C3=A3o cobre o processo de desenvolvimento do =
kernel e
> +os tipos de frustra=C3=A7=C3=A3o que os desenvolvedores e empresas podem=
 encontrar
> +pelo caminho. Existem diversas raz=C3=B5es que justificam a recomenda=C3=
=A7=C3=A3o para
> +que seja feito o merge do c=C3=B3digo do kernel ao kernel principal
> +("mainline"), como disponibilidade autom=C3=A1tica aos usu=C3=A1rios, su=
porte da
> +comunidade em diversas formas, e a oportunidade de influenciar a dire=C3=
=A7=C3=A3o
> +do desenvolvimento do kernel. Contribui=C3=A7=C3=B5es ao kernel Linux
> +obrigatoriamente devem estar dispon=C3=ADveis sob uma licen=C3=A7a compa=
t=C3=ADvel com
> +a GPL.
> +
> +:ref:`development_process` apresenta o processo de desenvolvimento, o
> +ciclo de lan=C3=A7amento, e a mec=C3=A2nica da janela de merge. As v=C3=
=A1rias fases no
> +desenvolvimento de patch, revis=C3=A3o, e ciclo de merge s=C3=A3o explic=
adas.
> +Algumas ferramentas e listas de e-mail s=C3=A3o discutidas. Desenvolvedo=
res
> +que queiram come=C3=A7ar a desenvolver o kernel s=C3=A3o encorajados a b=
uscar e
> +corrigir bugs como exerc=C3=ADcio inicial.
> +
> +:ref:`development_early_stage` cobre os primeiros passos do processo de
> +desenvolvimento, com =C3=AAnfase no envolvimento da comunidade de
> +desenvolvedores o mais cedo poss=C3=ADvel.
> +
> +:ref:`development_coding` =C3=A9 sobre o processo de codifica=C3=A7=C3=
=A3o; muitas
> +armadilhas j=C3=A1 encontradas por outros desenvolvedores s=C3=A3o discu=
tidas.
> +Alguns requisitos para patches s=C3=A3o explicados, e =C3=A9 feita uma i=
ntrodu=C3=A7=C3=A3o
> +para algumas ferramentas que podem ajudar a garantir que os patches de
> +kernel est=C3=A3o corretos.
> +
> +:ref:`development_posting` fala sobre o processo de envio de patches
> +para revis=C3=A3o. Para serem levados em considera=C3=A7=C3=A3o pela com=
unidade
> +desenvolvedora, os patches devem estar devidamente formatados e
> +descritos, assim como devem estar no lugar correto. Seguir os conselhos
> +dessa se=C3=A7=C3=A3o pode ajudar na recep=C3=A7=C3=A3o positiva do seu =
trabalho.
> +
> +:ref:`development_followthrough` cobre o que acontece ap=C3=B3s o envio =
dos
> +patches; o trabalho ainda est=C3=A1 longe de estar conclu=C3=ADdo. Traba=
lhar com
> +os revisores =C3=A9 parte crucial do processo de desenvolvimento; essa s=
e=C3=A7=C3=A3o
> +oferece dicas de como evitar problemas nesse est=C3=A1gio importante.
> +Desenvolvedores s=C3=A3o alertados a n=C3=A3o presumir que o trabalho ac=
abou ap=C3=B3s
> +o merge do patch no "mainline".
> +
> +:ref:`development_advancedtopics` introduz dois t=C3=B3picos mais
> +"avan=C3=A7ados": gerenciamento de patches com git e revis=C3=A3o de pat=
ches por
> +outros.
> +
> +:ref:`development_conclusion` conclui o documento com indica=C3=A7=C3=B5=
es de
> +fontes com mais informa=C3=A7=C3=B5es sobre o desenvolvimento do kernel.
> +
> +Sobre este documento
> +--------------------
> +
> +O kernel Linux, com mais de 8 milh=C3=B5es de linhas de c=C3=B3digo e be=
m mais de
> +1000 contribuintes a cada lan=C3=A7amento ("release"), =C3=A9 um dos mai=
ores e
> +mais ativos projetos de software livre em exist=C3=AAncia. Desde seu mod=
esto
> +in=C3=ADcio em 1991, este kernel evoluiu para se tornar um dos melhores
> +componentes de sistemas operacionais, rodando em pequenos players de
> +m=C3=BAsica digital, PCs de mesa, os maiores supercomputadores em exist=
=C3=AAncia,
> +e todos os outros tipos de sistema entre eles. =C3=89 robusto, eficiente=
, e
> +uma solu=C3=A7=C3=A3o escal=C3=A1vel para quase toda situa=C3=A7=C3=A3o.
> +
> +O crescimento do Linux trouxe o aumento no n=C3=BAmero de desenvolvedore=
s (e
> +empresas) desejando participar no seu desenvolvimento. Fabricantes de
> +hardware querem garantir que o Linux suporte bem os seus produtos,
> +tornando-os atrativos para usu=C3=A1rios Linux. Fabricantes de sistemas
> +embarcados, que usam o Linux como componente em um produto integrado,
> +querem que o Linux seja t=C3=A3o capaz e adequado quanto poss=C3=ADvel p=
ara a
> +tarefa em quest=C3=A3o. Distribuidores de software que baseiam seus
> +produtos em Linux t=C3=AAm claro interesse nas capacidades, performance,=
 e
> +confiabilidade do kernel Linux. =C3=89 tamb=C3=A9m comum que usu=C3=A1ri=
os finais
> +queiram alterar o Linux para atender melhor suas necessidades.
> +
> +Uma das caracter=C3=ADsticas mais atrativas do Linux =C3=A9 sua facilida=
de de
> +acesso a esses desenvolvedores; qualquer um com as habilidades
> +necess=C3=A1rias pode melhorar o Linux e influenciar a dire=C3=A7=C3=A3o=
 do seu
> +desenvolvimento. Produtos propriet=C3=A1rios n=C3=A3o conseguem oferecer=
 esse tipo
> +de abertura, que =C3=A9 caracter=C3=ADstico do processo de software livr=
e. O
> +kernel =C3=A9 ainda mais acess=C3=ADvel que a maioria dos outros projeto=
s de
> +software livre. Um ciclo t=C3=ADpico de tr=C3=AAs meses de desenvolvimen=
to do
> +kernel pode envolver mais de 1000 desenvolvedores trabalhando para mais
> +de 100 empresas (ou absolutamente nenhuma empresa).
> +
> +Trabalhar com a comunidade de desenvolvimento do kernel n=C3=A3o =C3=A9 =
uma tarefa
> +=C3=A1rdua. Contudo, muitos colaboradores potenciais passaram por
> +dificuldades ao tentar trabalhar no kernel. A comunidade evoluiu suas
> +pr=C3=B3prias formas de funcionamento que permitem operar de forma fluid=
a (e
> +produzir um produto de alta qualidade) em um ambiente em que milhares
> +de linhas de c=C3=B3digo s=C3=A3o alteradas todos os dias. N=C3=A3o =C3=
=A9 surpresa que o
> +processo de desenvolvimento do kernel Linux seja muito diferente dos
> +modelos de desenvolvimento propriet=C3=A1rios.
> +
> +O processo de desenvolvimento do kernel pode parecer estranho e
> +intimidador para novos desenvolvedores, mas existem bons motivos e uma
> +s=C3=B3lida experi=C3=AAncia por tr=C3=A1s disso. Um desenvolvedor que n=
=C3=A3o entenda os
> +caminhos pr=C3=B3prios da comunidade kernel (ou pior, que tente
> +menosprez=C3=A1-los ou contorn=C3=A1-los) ter=C3=A1 uma experi=C3=AAncia=
 frustrante
> +pela frente. A comunidade de desenvolvimento ajuda aqueles que tentam
> +aprender, mas gasta pouco tempo com aqueles que n=C3=A3o escutam ou n=C3=
=A3o
> +ligam para o processo de desenvolvimento.
> +
> +Espera-se que aqueles que leiam este documento sejam capazes de evitar
> +essa experi=C3=AAncia frustrante. H=C3=A1 muito material aqui, mas o esf=
or=C3=A7o
> +envolvido na sua leitura valer=C3=A1 a pena. A comunidade de desenvolvim=
ento
> +sempre necessita de desenvolvedores que ajudem a melhorar o kernel; o
> +texto a seguir deve ajudar voc=C3=AA - ou aqueles trabalhando para voc=
=C3=AA -
> +a se juntar =C3=A0 nossa comunidade.
> +
> +Cr=C3=A9ditos
> +--------
> +
> +Esse documento foi escrito por Jonathan Corbet, corbet@lwn.net.
> +Aprimorado pelos coment=C3=A1rios de Johannes Berg, James Berry, Alex
> +Chiang, Roland Dreier, Randy Dunlap, Jake Edge, Jiri Kosina, Matt
> +Mackall, Arthur Marsh, Amanda McPherson, Andrew Morton, Andrew Price,
> +Tsugikazu Shibata, e Jochen Vo=C3=9F.
> +
> +Esse trabalho contou com o apoio da Linux Foundation; agradecimentos
> +especiais
> +para Amanda McPherson, que viu o valor desse esfor=C3=A7o e fez tudo
> +acontecer.
> +
> +A import=C3=A2ncia de levar o c=C3=B3digo at=C3=A9 o "mainline"
> +------------------------------------------------
> +
> +Algumas empresas e desenvolvedores ocasionalmente se perguntam por que
> +devem se importar em aprender como trabalhar com a comunidade do kernel
> +e ter seu c=C3=B3digo no "mainline" (o kernel mantido por Linus Torvalds=
 e
> +usado como base para os distribuidores Linux). No curto prazo,
> +contribuir com o c=C3=B3digo pode parecer um gasto evit=C3=A1vel; parece=
 mais
> +f=C3=A1cil apenas manter o seu c=C3=B3digo =C3=A0 parte e oferecer
> +suporte direto aos usu=C3=A1rios. A verdade =C3=A9 que manter c=C3=B3dig=
o fora da
> +=C3=A1rvore principal ("out-of-tree") =C3=A9 uma falsa economia.
> +
> +Para ilustrar os custos do c=C3=B3digo "out-of-tree", aqui est=C3=A3o al=
guns
> +aspectos relevantes do processo de desenvolvimento do kernel; a maioria
> +ser=C3=A1 discutida com mais detalhes adiante neste documento. Considere=
:
> +
> +- C=C3=B3digo integrado via merge ao "mainline" fica dispon=C3=ADvel par=
a todos
> +  os usu=C3=A1rios Linux. Estar=C3=A1 automaticamente presente em todas =
as
> +  distribui=C3=A7=C3=B5es que o habilitarem. N=C3=A3o h=C3=A1 necessidad=
e de discos de
> +  armazenamento, downloads, ou as complica=C3=A7=C3=B5es de dar suporte =
a
> +  m=C3=BAltiplas vers=C3=B5es de variadas distribui=C3=A7=C3=B5es; tudo =
simplesmente
> +  funciona, para o desenvolvedor e para o usu=C3=A1rio. Incorpora=C3=A7=
=C3=A3o ao
> +  "mainline" resolve um grande n=C3=BAmero de problemas de distribui=C3=
=A7=C3=A3o e
> +  suporte.
> +
> +- Enquanto desenvolvedores do kernel se esfor=C3=A7am para manter uma
> +  interface est=C3=A1vel para o espa=C3=A7o do usu=C3=A1rio, a API inter=
na est=C3=A1 em
> +  constante mudan=C3=A7a. A aus=C3=AAncia de uma interface interna est=
=C3=A1vel =C3=A9 uma
> +  escolha deliberada de design; permite que sejam feitas melhorias
> +  fundamentais a qualquer tempo e resulta em c=C3=B3digo de qualidade
> +  superior. Uma consequ=C3=AAncia dessa pol=C3=ADtica =C3=A9 que c=C3=B3=
digo "out-of-tree"
> +  precisa ser constantemente atualizado para que continue funcionando
> +  com novos kernels. Manter c=C3=B3digo "out-of-tree" requer significati=
vo
> +  trabalho
> +  apenas para mant=C3=AA-lo funcionando.
> +
> +  Por sua vez, c=C3=B3digo que est=C3=A1 no "mainline" n=C3=A3o precisa =
dessa
> +  manuten=C3=A7=C3=A3o, resultado de uma regra simples que exige que qua=
lquer
> +  desenvolvedor que altere uma API, tamb=C3=A9m conserte qualquer c=C3=
=B3digo que
> +  deixe de funcionar como resultado da altera=C3=A7=C3=A3o. C=C3=B3digo =
que teve o
> +  merge realizado no "mainline" tem custo significativamente menor de
> +  manuten=C3=A7=C3=A3o.
> +
> +- Al=C3=A9m disso, c=C3=B3digo que est=C3=A1 no kernel ser=C3=A1 muitas =
vezes melhorado por
> +  outros desenvolvedores. Resultados surpreendentes podem surgir ao
> +  permitir que sua comunidade de usu=C3=A1rios e clientes melhore seu
> +  produto.
> +
> +- C=C3=B3digo do kernel est=C3=A1 sujeito a revis=C3=A3o, tanto antes co=
mo depois do
> +  merge ao "mainline". Independentemente das habilidades do desenvolvedo=
r
> +  original, o processo de revis=C3=A3o invariavelmente encontra maneiras=
 de
> +  evolu=C3=AD-lo. Bugs severos e problemas de seguran=C3=A7a s=C3=A3o co=
nstantemente
> +  encontrados durante o processo de revis=C3=A3o. Isso =C3=A9 especialme=
nte v=C3=A1lido
> +  para c=C3=B3digo desenvolvido em ambiente isolado; tais c=C3=B3digos s=
e
> +  beneficiam fortemente ao serem revistos por outros desenvolvedores.
> +  C=C3=B3digo "out-of-tree" =C3=A9 c=C3=B3digo de baixa qualidade.
> +
> +- Participa=C3=A7=C3=A3o no processo de desenvolvimento =C3=A9 a forma p=
ela qual voc=C3=AA pode
> +  influenciar a dire=C3=A7=C3=A3o do desenvolvimento do kernel. Usu=C3=
=A1rios que se
> +  queixam externamente s=C3=A3o ouvidos, por=C3=A9m desenvolvedores ativ=
os t=C3=AAm
> +  maior poder de articula=C3=A7=C3=A3o - e a habilidade de implementar m=
udan=C3=A7as
> +  que fa=C3=A7am o kernel funcionar melhor para suas necessidades.
> +
> +- Quando o c=C3=B3digo =C3=A9 mantido =C3=A0 parte, sempre existe a poss=
ibilidade de
> +  que terceiros contribuam para uma implementa=C3=A7=C3=A3o diferente de=
 uma
> +  funcionalidade parecida. Se isso acontecer, ter seu c=C3=B3digo integr=
ado
> +  via merge se tornar=C3=A1 muito mais dif=C3=ADcil - ao ponto de ser im=
poss=C3=ADvel.
> +  Voc=C3=AA enfrentar=C3=A1 duas alternativas desagrad=C3=A1veis, (1) ma=
nter uma
> +  funcionalidade "out-of-tree" indefinidamente ou (2) abandonar seu
> +  c=C3=B3digo e migrar seus usu=C3=A1rios para a vers=C3=A3o na =C3=A1rv=
ore principal
> +  ("in-tree").
> +
> +- Contribui=C3=A7=C3=A3o de c=C3=B3digo =C3=A9 a a=C3=A7=C3=A3o fundamen=
tal que faz todo o processo
> +  funcionar. Ao contribuir com seu c=C3=B3digo voc=C3=AA pode adicionar =
nova
> +  funcionalidade ao kernel e proporcionar capacidades e exemplos que
> +  podem ser usados por outros desenvolvedores de kernel. Se voc=C3=AA
> +  desenvolveu c=C3=B3digo para o Linux (ou est=C3=A1 pensando em desenvo=
lver),
> +  voc=C3=AA claramente tem interesse na continuidade do sucesso dessa
> +  plataforma; contribui=C3=A7=C3=A3o de c=C3=B3digo =C3=A9 uma das melho=
res maneiras de
> +  garantir esse sucesso.
> +
> +Todos os argumentos acima se aplicam a qualquer c=C3=B3digo "out-of-tree=
",
> +incluindo c=C3=B3digo distribu=C3=ADdo de maneira propriet=C3=A1ria, em =
formato
> +exclusivamente bin=C3=A1rio. Existem fatores adicionais que devem ser le=
vados
> +em considera=C3=A7=C3=A3o antes de qualquer distribui=C3=A7=C3=A3o de c=
=C3=B3digo de kernel
> +apenas em bin=C3=A1rio, incluindo:
> +
> +- As quest=C3=B5es legais da distribui=C3=A7=C3=A3o de kernel propriet=
=C3=A1rio s=C3=A3o, no
> +  melhor dos casos, confusas; muitos detentores de direitos autorais do
> +  kernel acreditam que a maioria dos m=C3=B3dulos bin=C3=A1rios s=C3=A3o=
 produtos
> +  derivados do kernel e que, como resultado, sua distribui=C3=A7=C3=A3o =
=C3=A9 uma
> +  viola=C3=A7=C3=A3o da Licen=C3=A7a P=C3=BAblica Geral GNU ("GNU Genera=
l Public License"),
> +  que ser=C3=A1 tratada com mais profundidade abaixo. Este autor n=C3=A3=
o =C3=A9 um
> +  advogado, e nada neste documento pode ser considerado aconselhamento
> +  jur=C3=ADdico.
> +  O verdadeiro status de m=C3=B3dulos privados ("closed source") s=C3=B3=
 pode ser
> +  determinado judicialmente. Independentemente disso, a incerteza que
> +  cerca esses m=C3=B3dulos existe.
> +
> +- Os m=C3=B3dulos bin=C3=A1rios aumentam consideravelmente a dificuldade=
 de
> +  depura=C3=A7=C3=A3o de problemas do kernel ("debugging"), a ponto de a=
 maioria
> +  dos desenvolvedores de kernel sequer tentar. Portanto, a distribui=C3=
=A7=C3=A3o
> +  de m=C3=B3dulos exclusivamente bin=C3=A1rios tornar=C3=A1 mais dif=C3=
=ADcil que os seus
> +  usu=C3=A1rios recebam suporte.
> +
> +- O suporte tamb=C3=A9m =C3=A9 mais dif=C3=ADcil para distribuidores de =
m=C3=B3dulos
> +  exclusivamente bin=C3=A1rios, que precisam fornecer uma vers=C3=A3o do=
 m=C3=B3dulo
> +  para cada distribui=C3=A7=C3=A3o e cada vers=C3=A3o do kernel que dese=
jam suportar.
> +  Dezenas de vers=C3=B5es de um =C3=BAnico m=C3=B3dulo podem ser necess=
=C3=A1rias para
> +  fornecer uma cobertura razoavelmente abrangente, e seus usu=C3=A1rios =
ter=C3=A3o
> +  que atualizar seu m=C3=B3dulo separadamente sempre que atualizarem seu
> +  kernel.
> +
> +- Tudo o que foi dito acima sobre revis=C3=A3o de c=C3=B3digo se aplica =
em dobro
> +  ao c=C3=B3digo fechado. Como esse c=C3=B3digo n=C3=A3o est=C3=A1 dispo=
n=C3=ADvel, ele n=C3=A3o pode
> +  ter sido revisado pela comunidade e, sem d=C3=BAvida, ter=C3=A1 s=C3=
=A9rios
> +  problemas.
> +
> +Os fabricantes de sistemas embarcados, em particular, podem ser tentados
> +a ignorar grande parte do que foi dito nesta se=C3=A7=C3=A3o, acreditand=
o que
> +est=C3=A3o lan=C3=A7ando um produto autossuficiente que usa uma vers=C3=
=A3o congelada
> +do kernel e n=C3=A3o requer mais desenvolvimento ap=C3=B3s o lan=C3=A7am=
ento. Esse
> +argumento ignora o valor de uma revis=C3=A3o de c=C3=B3digo abrangente e=
 o valor
> +de permitir que seus usu=C3=A1rios adicionem recursos ao seu produto. Ma=
s
> +esses produtos tamb=C3=A9m t=C3=AAm uma vida comercial limitada, ap=C3=
=B3s a qual uma
> +nova vers=C3=A3o deve ser lan=C3=A7ada. Nesse ponto, os fornecedores cuj=
o c=C3=B3digo
> +est=C3=A1 no "mainline" e bem mantido estar=C3=A3o em uma posi=C3=A7=C3=
=A3o muito melhor
> +para preparar o novo produto para o mercado rapidamente.
> +
> +Licenciamento
> +-------------
> +
> +C=C3=B3digo =C3=A9 submetido ao kernel do Linux sob diversas licen=C3=A7=
as, mas
> +todo ele deve ser compat=C3=ADvel com a vers=C3=A3o 2 da Licen=C3=A7a P=
=C3=BAblica Geral
> +GNU (GPLv2), que =C3=A9 a licen=C3=A7a que cobre a distribui=C3=A7=C3=A3=
o do kernel como um
> +todo. Na pr=C3=A1tica, isso significa que todas as contribui=C3=A7=C3=B5=
es de c=C3=B3digo s=C3=A3o
> +cobertas pela GPLv2 (com, opcionalmente, uma linguagem que permita a
> +distribui=C3=A7=C3=A3o sob vers=C3=B5es posteriores da GPL) ou pela lice=
n=C3=A7a BSD de tr=C3=AAs
> +cl=C3=A1usulas. Quaisquer contribui=C3=A7=C3=B5es que n=C3=A3o sejam cob=
ertas por uma
> +licen=C3=A7a compat=C3=ADvel n=C3=A3o ser=C3=A3o aceitas no kernel.
> +
> +A cess=C3=A3o de direitos autorais n=C3=A3o =C3=A9 exigida (nem solicita=
da) para o
> +c=C3=B3digo contribu=C3=ADdo para o kernel. Todo o c=C3=B3digo incorpora=
do ao kernel
> +principal mant=C3=A9m sua propriedade original; como resultado, o kernel
> +agora tem milhares de propriet=C3=A1rios.
> +
> +Uma implica=C3=A7=C3=A3o dessa estrutura de propriedade =C3=A9 que qualq=
uer tentativa
> +de alterar o licenciamento do kernel est=C3=A1 fadada ao fracasso quase
> +certo. Existem poucos cen=C3=A1rios pr=C3=A1ticos em que o acordo de tod=
os os
> +detentores de direitos autorais poderia ser obtido (ou seu c=C3=B3digo
> +removido do kernel). Portanto, em particular, n=C3=A3o h=C3=A1 perspecti=
va de
> +migra=C3=A7=C3=A3o para a vers=C3=A3o 3 da GPL em um futuro pr=C3=B3ximo=
.
> +
> +=C3=89 imprescind=C3=ADvel que todo o c=C3=B3digo contribu=C3=ADdo para =
o kernel seja
> +legitimamente software livre. Por esse motivo, c=C3=B3digo de contribuid=
ores
> +sem identidade conhecida ou contribuidores an=C3=B4nimos n=C3=A3o ser=C3=
=A1 aceito.
> +Todos os contribuidores s=C3=A3o obrigados a "assinar" seu c=C3=B3digo, =
declarando
> +que ele pode ser distribu=C3=ADdo com o kernel sob a GPL. C=C3=B3digo qu=
e n=C3=A3o
> +tenha sido licenciado como software livre por seu propriet=C3=A1rio, ou =
que
> +apresente risco de criar problemas relacionados a direitos autorais
> +para o kernel (como c=C3=B3digo derivado de esfor=C3=A7os de engenharia =
reversa
> +sem as devidas salvaguardas) n=C3=A3o pode ser contribu=C3=ADdo.
> +
> +Quest=C3=B5es sobre direitos autorais s=C3=A3o comuns em listas de discu=
ss=C3=A3o de
> +desenvolvimento Linux. Normalmente, essas perguntas recebem muitas
> +respostas, mas =C3=A9 importante lembrar que as pessoas que respondem a =
essas
> +perguntas n=C3=A3o s=C3=A3o advogados e n=C3=A3o podem fornecer aconselh=
amento
> +jur=C3=ADdico. Se voc=C3=AA tiver d=C3=BAvidas jur=C3=ADdicas relacionad=
as ao c=C3=B3digo-fonte
> +do Linux, n=C3=A3o h=C3=A1 substituto para conversar com um advogado esp=
ecializado
> +nessa =C3=A1rea. Confiar em respostas obtidas em listas de discuss=C3=A3=
o t=C3=A9cnicas
> +=C3=A9 arriscado.
> --
> 2.53.0


Hi Daniel,

Thank you for the translation. For this patch to be accepted, you must
perform the following manual adjustments:

Removal of AI credits: Remove the Assisted-by: Claude tag. Kernel
documentation requires full human review to ensure no conceptual or
literal translation errors. As the author, you are legally responsible
for the integrity of the text under the DCO.

There are lines with residual white spaces (visible as isolated +
symbols in the diff). Remove these to prevent rendering warnings in
Sphinx.

Legal Terminology: In the licensing section, change "propriedade
original" to "titularidade original". This is the technically correct
term for copyright in Portuguese.
 Remove the reference label at the top of the file (..
_development_process_intro:), as it is unnecessary for this stage of
the translation.

I look forward to the v2 version corrected by you.
