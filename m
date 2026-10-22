Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792688495;
	b=XyeRPtVXBI6ciNgwTR8JPV/rO/bUBuDQz5Wg4908srPfYoVOvDs1W2WD4/tXmBK0AaES
	 nzO6tLnwHgg2P3OX3Ph3IMpYTTIAUx7qhOK6oOpeqiTZWN2Ar1hfgRqMcOERWB6jx+z3B
	 LbIA9g4B9jFHzgvwXmxc36ww4iWEgz8Zf9z1eljiXSUGaSAtViGbpNSexGR8clu395vT7
	 Bvd3IundF3t44JpESyea2CxbKTnyEWkv3i4F/AzhKyBlPNRs74Vcqt9qts9U1f2Ss7DrL
	 zi61HAKR5EK5+s9x55fYu46UFGLGKH2mzQiN+v3SFkgHbQMGOyRGGIpDqN5XtNIWhfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kiZq0PKWOnH0LxJESVXbvI68VTlQMTGxsLs+qUmpYIc=;
	b=aPoSjLyPtYYgBfM03GHZbMF8ChF+VAGkrDwpoeqiSnIdEZDxbNEo4geWsdqEQ1ZPtqWV
	 gz4xIMfM/jBgJA/6Ws+sgDltEYIoG7fvh+VczJkzItTuALOiMUtEuzTHREYoQjVT8nFeV
	 97fyDqSLPyIt6+EePHHFRtarfmTY4G00jPWRCJmVGoPwO1NrNMQxJZ/sJXPtxDvu0GKtN
	 Ep21H2OCv5i9t9MInar2dpoOvPRPm3A7D3k+C79sVObylsdb7XFKCIUbPnYIIF8FCQHs2
	 Ko6Qh6D8UNDi05ijQyiD0QCKbogQcW1yh8wJKRn/HWswBAUo5ZmQ4zpmSnc8a6GXSrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XXLSKwDf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6691606A321
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 17:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6691606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XXLSKwDf
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-917bab38b14so906806d6.3
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 10:01:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792688493; cv=none;
        d=google.com; s=arc-20260327;
        b=CjbryXsEgn0VYZlRCBTcwViTBXJHUDtdZNzBWRMT2a9RzdXYpteL7Lfo6dXgvJQ7Fs
         a8wQWMnurr1oGnqTIXYUVqVGWknhk00FtEsPZgfYtfz9T0RfAIvDr4oaY3rolfGcV5qH
         R+UiGG4q8VCunYBBY9mK3FrG8MgElZQm4rm7XMnz64iHGfRhYxhzyZnjbwOQ1681x+OV
         emh7AB6A6LJ8tNDU4xGKQKOHSE8BlaoZujQXqGvmPBqpclHaEYJGwh3U5vcxMDqiYy9A
         aDhAf6wgPZsYauJCyXt5NVoZQ+QXnn5eMYq8umew7WwEgYa2gGHUHiu/gvN80nP5qut5
         c5ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kiZq0PKWOnH0LxJESVXbvI68VTlQMTGxsLs+qUmpYIc=;
        fh=blZy09OM/BE2zc+7mPAZwhAz5w4hprQuaVUXgRO2Ht8=;
        b=gI9vdhh+gn1l67/9v0UGDdf8LiY/e0jgAZqHfAPvk6d/jxxER8A/X9U1dbbZPC1ePq
         FkaF63v2HFxlzIJAoQ7Nc9E/mW4agva2Bhol+V89IjD0U0jioYA/a2A0CmDO3hN2iLqO
         wnDewM/DrHaiqW1nRX+nZxMFBn/5JwyoKpnobRQyV0bfu62oGyzqSCGASEe50ldtXxtZ
         PIcAuT8zmINeNVms1ZE2AKfU+RphHtXpTEt94pE2yP1lbHrRikn9/hM0Uu/MZIIS6IT+
         UsWEBPBmKT3PAz44/Jnzx/Ol/FEIipUd5uhPO5+WcXWjhpLnpKQ1aAY33W62HHYsHwp6
         8uVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792688493; x=1793293293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kiZq0PKWOnH0LxJESVXbvI68VTlQMTGxsLs+qUmpYIc=;
        b=XXLSKwDfqUzkUuajoUZqXsIWyakY9Ayj3i6Gedf1Oft2PoIyBftSmK32PIj34g/LD2
         QfI0GOHSZBqppnjkzjnWnqScQfcwtTTBcZIUiS5Ny8TkvHhuQK555QQsGHR0tlP/NnGG
         1x/EYMdGKo2fLoKFuDlTO+HEbVmfAjm8JUccY3MMaYvo1Q2CWotaGUi3HPiVus8kn6tl
         19G6fEKblbsVdK3V1Hbz9miuvjag9eNpxHnBTY9qJQPmifEPyhEQ2fgmsxSOhUJo+yAp
         wArnp0r34kkuVYseykxrit+iKk3MVTsu36zi0K2ZScKue89L60up1loNPy9dqrC6nwST
         5qKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792688493; x=1793293293;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kiZq0PKWOnH0LxJESVXbvI68VTlQMTGxsLs+qUmpYIc=;
        b=mxnNwAkf3EQbAZyOzi1yK0N0j+OJOWF9mne81ndaAKBRY27rt8CsomsFutrzzndqOa
         JlHnKoWF6osOyfuFPmubrX3KJIJA80iC4FkNQ5BgLI9vBNWojfOBM7nEprW2Qzkl3k+p
         VtzTvsiWHW1fXhuy6dFV/U901HOy93AYITrLtl5pCI9ZZ0591ExoWDyZqfDctnGkZDSX
         CUfPKv9s8m9diIQFgFYp4vjJD4+0kc9dDguMtoFzIwdYmZlYOcUYh+C0e7KrZOzGNrlF
         Z48GgICmEC4R+WzyytONU4Ojn29oQWGPPvFjbSrJwGHaiC1jQfgxW4OhuFyimb34mDGt
         3/7w==
X-Forwarded-Encrypted: i=1; AKwUvBy7bSYWSUCCqJVDGpif2PQS35DJTfsZx+3Bf9fhopWTOK0yPrUz5J6dErlC2slbSlMQXSUh58eLHIA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMnTp9ebMt7jFltJcKu9vNiCC+2SWoE0fIIzYcDSggpGwPah+I
	ZbtuajTB9TDocH1aMXGBLhRBXLE9nw3xcwwe8EXuwe9kn2D61NmbeEdlM7nyrwq5QXe18izK5de
	rOhyx4QoOckGrouwQS+mRcw/tck8Y9UM=
X-Gm-Gg: AYBFou0uZW7o5pErmO3X66EEPQDiUa6bPslGba2vVN4CyA+QeZ1tNoBo0bKmhWtmJ8P
	4FZ7qpwKANT9h+tkpVwXrNE8VdRlqK3R/4Uw4EJP875oRc67okfr/s9a160H4wXR5wA9ZpD5j0Y
	auOIOcWonsifRmIhW5BqKYoDkVcgsikr/ib+b91G4JUE0PJ5YzRfbiw5lJMbKodXUuNNMvFQH4J
	25wzWQi8GvVi4xh5+E2UvEnAa/DsvQjjonxYcnHkbQ0PSvSCApd1oeRQPlnB4x+3y6WPFk2onwX
	jCxpt+17LgbqsElktvS27Dx3fhOArYNhvNA67scxL4wrVntSDXktks9tJltnsoXjW9aZPanvL8l
	M8APhapJH0u5zQxnqsjeycoGVkH0oGA3HIkbjXKIo1zuGXVRvqS9yfj7p984QbT/QbulMQhOqBd
	7hRntkmpUuPXOM8+6oMvEr6vNSS+wOZ+KqQmb9e/sjyYRWqnvRf7sp9YipGXrQVTuHUpsHdw==
X-Received: by 2002:a05:6214:27e1:b0:915:e85d:8831 with SMTP id
 6a1803df08f44-91c12d1026bmr104360926d6.0.1792688493153; Thu, 22 Oct 2026
 10:01:33 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1791933697.git.lucasadramalho@gmail.com>
 <20261020041340.447727-1-lucasadramalho@gmail.com> <20261020041340.447727-3-lucasadramalho@gmail.com>
In-Reply-To: <20261020041340.447727-3-lucasadramalho@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 22 Oct 2026 14:01:21 -0300
X-Gm-Features: AclHuK8VrE0PtmQ35klQo0h6JGLWtTOFEoIlO1Wdyx1SC66q20AidVK6GrWlT5M
Message-ID: <CAMAsx6f-FyoDtwadLAtrw4wPMAhmu=Da-Hyb_nnKC2Fh2B7XJQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] docs: translations: pt_BR: process: Translate researcher-guidelines.rst
To: lucasadramalho@gmail.com
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 1:13 AM Lucas Adryell Ramalho
<lucasadramalho@gmail.com> wrote:

Hi Lucas,

This one builds cleanly and reads well. Just a few minor nits for the
next version.


> +A comunidade do kernel do Linux acolhe com satisfa=C3=A7=C3=A3o pesquisa=
s
> +transparentes sobre o kernel do Linux, as atividades envolvidas em seu

Nit: the text alternates between "kernel do Linux" and "kernel Linux".
Please use "kernel Linux" consistently, as in the rest of the pt_BR
documentation.


> +* Documentation/process/development-process.rst
> +* Documentation/process/submitting-patches.rst
> +* Documentation/admin-guide/reporting-issues.rst
> +* Documentation/process/security-bugs.rst

Optional: development-process, submitting-patches and security-bugs
(and howto, referenced further below) already have pt_BR translations,
so you could point to the Documentation/translations/pt_BR/ versions
instead.


> +* Qual commit anterior esta altera=C3=A7=C3=A3o corrige? Isso deve const=
ar na tag
> + =E2=80=9CFixes:=E2=80=9D conforme descrito na documenta=C3=A7=C3=A3o.
> +* Quem mais revisou este patch? Isso deve constar nas tags apropriadas
> + =E2=80=9CReviewed-by:=E2=80=9D; veja abaixo.

Nit: these use curly quotes (=E2=80=9C =E2=80=9D), while the English origin=
al and the
rest of the translation use straight quotes ("). The same happens with
=E2=80=9CReviewed-by=E2=80=9D further below.

Thanks,
Daniel


Em ter., 20 de out. de 2026 =C3=A0s 01:14, Lucas Adryell Ramalho
<lucasadramalho@gmail.com> escreveu:
>
> Translate researcher-guidelines.rst into Brazilian Portuguese
> and add it to the process documentation index.
>
> Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
> ---
>  .../translations/pt_BR/process/index.rst      |   1 +
>  .../pt_BR/process/researcher-guidelines.rst   | 188 ++++++++++++++++++
>  2 files changed, 189 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/researcher-g=
uidelines.rst
>
> diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documen=
tation/translations/pt_BR/process/index.rst
> index d072f7e46..31704e28d 100644
> --- a/Documentation/translations/pt_BR/process/index.rst
> +++ b/Documentation/translations/pt_BR/process/index.rst
> @@ -64,6 +64,7 @@ Estas s=C3=A3o as regras pelas quais tentamos viver na =
comunidade do kernel
>     Declara=C3=A7=C3=A3o sobre Drivers do Kernel <kernel-driver-statement=
>
>     A interface de drivers do kernel Linux <stable-api-nonsense>
>     Estilo de gerenciamento do kernel Linux <management-style>
> +   Diretrizes para pesquisadores <researcher-guidelines>
>     Assistentes de c=C3=B3digo <coding-assistants>
>     O manual da =C3=A1rvore tip <maintainer-tip>
>     Conclave (Continuidade do projeto) <conclave>
> diff --git a/Documentation/translations/pt_BR/process/researcher-guidelin=
es.rst b/Documentation/translations/pt_BR/process/researcher-guidelines.rst
> new file mode 100644
> index 000000000..8209b0e17
> --- /dev/null
> +++ b/Documentation/translations/pt_BR/process/researcher-guidelines.rst
> @@ -0,0 +1,188 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _pt_BR_researcher-guidelines:
> +
> +Diretrizes para pesquisadores
> ++++++++++++++++++++++++++++++
> +
> +A comunidade do kernel do Linux acolhe com satisfa=C3=A7=C3=A3o pesquisa=
s
> +transparentes sobre o kernel do Linux, as atividades envolvidas em seu
> +desenvolvimento e quaisquer outros subprodutos de seu desenvolvimento. O
> +Linux se beneficia enormemente desse tipo de pesquisa, e a maioria dos
> +aspectos do Linux =C3=A9 impulsionada por pesquisas, de uma forma ou de =
outra.
> +
> +A comunidade agradece imensamente se os pesquisadores puderem compartilh=
ar
> +descobertas preliminares antes de tornar seus resultados p=C3=BAblicos,
> +especialmente se tal pesquisa envolver seguran=C3=A7a. O envolvimento an=
tecipado
> +da comunidade ajuda a melhorar tanto a qualidade da pesquisa quanto a
> +capacidade do Linux de se beneficiar de seus resultados. De qualquer for=
ma,
> +recomenda-se compartilhar com a comunidade c=C3=B3pias de acesso aberto =
das
> +pesquisas publicadas.
> +
> +Este documento tem como objetivo esclarecer o que a comunidade do kernel
> +Linux considera pr=C3=A1ticas aceit=C3=A1veis e inaceit=C3=A1veis na con=
du=C3=A7=C3=A3o desse tipo
> +de pesquisa. No m=C3=ADnimo, tais pesquisas e atividades relacionadas de=
vem
> +seguir os princ=C3=ADpios fundamentais da =C3=A9tica em pesquisa. Para o=
bter mais
> +informa=C3=A7=C3=B5es sobre =C3=A9tica em pesquisa em geral, =C3=A9tica =
em tecnologia e
> +pesquisa sobre comunidades de desenvolvedores em particular, consulte:
> +
> +* `Hist=C3=B3ria da =C3=89tica em Pesquisa
> +  <https://www.unlv.edu/research/ORI-HSR/history-ethics>`_
> +* `=C3=89tica do IEEE <https://www.ieee.org/about/ethics/index.html>`_
> +* `Opini=C3=B5es de desenvolvedores e pesquisadores sobre a =C3=A9tica d=
e
> +  experimentos em projetos de c=C3=B3digo aberto
> +  <https://arxiv.org/pdf/2112.13217.pdf>`_
> +
> +A comunidade do kernel Linux espera que todos os que interagem com o
> +projeto estejam participando de boa-f=C3=A9 para tornar o Linux melhor.
> +Pesquisas sobre qualquer material dispon=C3=ADvel publicamente (incluind=
o, mas
> +n=C3=A3o se limitando ao c=C3=B3digo-fonte) produzido pela comunidade do=
 kernel Linux
> +s=C3=A3o bem-vindas, embora pesquisas envolvendo desenvolvedores exijam
> +consentimento expl=C3=ADcito dos participantes.
> +
> +Pesquisas passivas baseadas inteiramente em fontes publicamente
> +dispon=C3=ADveis, incluindo postagens em listas de discuss=C3=A3o p=C3=
=BAblicas e commits
> +em reposit=C3=B3rios p=C3=BAblicos, s=C3=A3o claramente permitidas. No e=
ntanto, como em
> +qualquer pesquisa, os princ=C3=ADpios =C3=A9ticos padr=C3=A3o devem ser =
seguidos.
> +
> +A pesquisa ativa sobre o comportamento dos desenvolvedores, no entanto,
> +deve ser realizada com o consentimento expl=C3=ADcito e a plena divulga=
=C3=A7=C3=A3o aos
> +desenvolvedores individuais envolvidos. N=C3=A3o =C3=A9 permitido intera=
gir com os
> +desenvolvedores ou realizar experimentos com eles sem o consentimento; i=
sso
> +tamb=C3=A9m faz parte da =C3=A9tica padr=C3=A3o da pesquisa.
> +
> +Question=C3=A1rios
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +A pesquisa geralmente assume a forma de question=C3=A1rios enviados a
> +mantenedores ou colaboradores.  Como regra geral, por=C3=A9m, a comunida=
de do
> +kernel obt=C3=A9m pouco valor desses question=C3=A1rios.  O processo de
> +desenvolvimento do kernel funciona porque cada desenvolvedor se benefici=
a
> +de sua participa=C3=A7=C3=A3o, mesmo trabalhando com outras pessoas que =
t=C3=AAm objetivos
> +diferentes. Responder a um question=C3=A1rio, por=C3=A9m, =C3=A9 uma exi=
g=C3=AAncia unilateral
> +imposta a desenvolvedores ocupados, sem nenhum benef=C3=ADcio correspond=
ente
> +para eles pr=C3=B3prios ou para a comunidade do kernel como um todo. Por=
 esse
> +motivo, esse m=C3=A9todo de pesquisa n=C3=A3o =C3=A9 recomendado.
> +
> +Os membros da comunidade do kernel j=C3=A1 recebem e-mails em excesso e
> +provavelmente perceber=C3=A3o os pedidos de pesquisa como apenas mais um=
a
> +exig=C3=AAncia sobre seu tempo.  O envio desses pedidos priva a comunida=
de do
> +valioso tempo dos colaboradores e =C3=A9 improv=C3=A1vel que gere uma re=
sposta
> +estatisticamente =C3=BAtil.
> +
> +Como alternativa, os pesquisadores devem considerar participar de evento=
s
> +de desenvolvedores, organizar sess=C3=B5es nas quais o projeto de pesqui=
sa e
> +seus benef=C3=ADcios para os participantes possam ser explicados e inter=
agir
> +diretamente com a comunidade no local.  As informa=C3=A7=C3=B5es recebid=
as ser=C3=A3o
> +muito mais ricas do que as obtidas por meio de uma pesquisa por e-mail, =
e a
> +comunidade tamb=C3=A9m se beneficiar=C3=A1 da oportunidade de aprender c=
om suas
> +percep=C3=A7=C3=B5es.
> +
> +Patches
> +=3D=3D=3D=3D=3D=3D=3D
> +
> +Para ajudar a esclarecer: enviar patches aos desenvolvedores *=C3=A9* in=
teragir
> +com eles, mas eles j=C3=A1 consentiram em receber *contribui=C3=A7=C3=B5=
es de boa-f=C3=A9*.
> +Esse consentimento n=C3=A3o se estende ao envio de patches intencionalme=
nte
> +defeituosos ou vulner=C3=A1veis, nem ao fornecimento de informa=C3=A7=C3=
=B5es enganosas
> +durante as discuss=C3=B5es. Essas intera=C3=A7=C3=B5es podem prejudicar =
os desenvolvedores
> +ao consumir tempo, esfor=C3=A7o e motiva=C3=A7=C3=A3o, al=C3=A9m de prej=
udicar o projeto ao
> +minar a confian=C3=A7a de toda a comunidade de desenvolvedores no colabo=
rador (e
> +na organiza=C3=A7=C3=A3o do colaborador como um todo), prejudicando os e=
sfor=C3=A7os para
> +fornecer feedback construtivo aos colaboradores e colocando os usu=C3=A1=
rios
> +finais em risco de falhas de software.
> +
> +A participa=C3=A7=C3=A3o de pesquisadores no desenvolvimento do pr=C3=B3=
prio Linux, assim
> +como a de qualquer pessoa, =C3=A9 bem-vinda e incentivada. A pesquisa no=
 c=C3=B3digo
> +do Linux =C3=A9 uma pr=C3=A1tica comum, especialmente quando se trata de=
 desenvolver
> +ou executar ferramentas de an=C3=A1lise que produzam resultados que poss=
am ser
> +utilizados na pr=C3=A1tica.
> +
> +Ao interagir com a comunidade de desenvolvedores, enviar um patch tem si=
do,
> +tradicionalmente, a melhor maneira de causar impacto. O Linux j=C3=A1 po=
ssui
> +muitos bugs conhecidos =E2=80=94 o que =C3=A9 muito mais =C3=BAtil =C3=
=A9 dispor de corre=C3=A7=C3=B5es
> +revisadas e verificadas. Antes de contribuir, leia atentamente a
> +documenta=C3=A7=C3=A3o apropriada:
> +
> +* Documentation/process/development-process.rst
> +* Documentation/process/submitting-patches.rst
> +* Documentation/admin-guide/reporting-issues.rst
> +* Documentation/process/security-bugs.rst
> +
> +Em seguida, envie um patch (incluindo uma mensagem de commit com todos o=
s
> +detalhes listados abaixo) e responda aos coment=C3=A1rios dos outros
> +desenvolvedores.
> +
> +Ao enviar patches resultantes de pesquisas, as mensagens de commit devem
> +conter, no m=C3=ADnimo, os seguintes detalhes, para que os desenvolvedor=
es
> +tenham o contexto adequado para compreender a contribui=C3=A7=C3=A3o. Re=
sponda =C3=A0s
> +seguintes perguntas:
> +
> +* Qual =C3=A9 o problema espec=C3=ADfico que foi identificado?
> +* Como o problema poderia ser reproduzido em um sistema em execu=C3=A7=
=C3=A3o?
> +* Que efeito a ocorr=C3=AAncia do problema teria no sistema?
> +* Como o problema foi identificado? Inclua, especificamente, detalhes so=
bre
> +  quaisquer testes, programas de an=C3=A1lise est=C3=A1tica ou din=C3=A2=
mica e quaisquer
> +  outras ferramentas ou m=C3=A9todos utilizados para realizar o trabalho=
.
> +* Em qual vers=C3=A3o do Linux o problema foi identificado? =C3=89 altam=
ente
> +  recomend=C3=A1vel utilizar a vers=C3=A3o mais recente ou um ramo recen=
te do
> +  linux-next (consulte Documentation/process/howto.rst).
> +* O que foi alterado para corrigir o problema e por que se acredita que =
a
> +  corre=C3=A7=C3=A3o esteja correta?
> +* Como a altera=C3=A7=C3=A3o foi testada na compila=C3=A7=C3=A3o e em te=
mpo de execu=C3=A7=C3=A3o?
> +* Qual commit anterior esta altera=C3=A7=C3=A3o corrige? Isso deve const=
ar na tag
> +  =E2=80=9CFixes:=E2=80=9D conforme descrito na documenta=C3=A7=C3=A3o.
> +* Quem mais revisou este patch? Isso deve constar nas tags apropriadas
> +  =E2=80=9CReviewed-by:=E2=80=9D; veja abaixo.
> +
> +Por exemplo::
> +
> +  From: Author <author@email>
> +  Subject: [PATCH] drivers/foo_bar: Add missing kfree()
> +
> +  The error path in foo_bar driver does not correctly free the allocated
> +  struct foo_bar_info. This can happen if the attached foo_bar device
> +  rejects the initialization packets sent during foo_bar_probe(). This
> +  would result in a 64 byte slab memory leak once per device attach,
> +  wasting memory resources over time.
> +
> +  This flaw was found using an experimental static analysis tool we are
> +  developing, LeakMagic[1], which reported the following warning when
> +  analyzing the v5.15 kernel release:
> +
> +   path/to/foo_bar.c:187: missing kfree() call?
> +
> +  Add the missing kfree() to the error path. No other references to
> +  this memory exist outside the probe function, so this is the only
> +  place it can be freed.
> +
> +  x86_64 and arm64 defconfig builds with CONFIG_FOO_BAR=3Dy using GCC
> +  11.2 show no new warnings, and LeakMagic no longer warns about this
> +  code path. As we don't have a FooBar device to test with, no runtime
> +  testing was able to be performed.
> +
> +  [1] https://url/to/leakmagic/details
> +
> +  Reported-by: Researcher <researcher@email>
> +  Fixes: aaaabbbbccccdddd ("Introduce support for FooBar")
> +  Signed-off-by: Author <author@email>
> +  Reviewed-by: Reviewer <reviewer@email>
> +
> +Se voc=C3=AA estiver contribuindo pela primeira vez, recomenda-se que o =
patch
> +seja avaliado por outras pessoas em particular antes de ser enviado =C3=
=A0s
> +listas de discuss=C3=A3o p=C3=BAblicas.
> +(Isso =C3=A9 obrigat=C3=B3rio caso tenha sido explicitamente informado d=
e que seus
> +patches precisam de uma revis=C3=A3o interna mais cuidadosa.) Espera-se =
que
> +essas pessoas tenham sua tag =E2=80=9CReviewed-by=E2=80=9D inclu=C3=ADda=
 no patch resultante.
> +Encontrar outro desenvolvedor familiarizado com contribui=C3=A7=C3=B5es =
para o Linux,
> +especialmente dentro da sua pr=C3=B3pria organiza=C3=A7=C3=A3o, e pedir =
que ele ajude nas
> +revis=C3=B5es antes de envi=C3=A1-las para as listas de discuss=C3=A3o p=
=C3=BAblicas tende a
> +melhorar significativamente a qualidade dos patches resultantes e, com i=
sso,
> +reduz a carga de trabalho sobre outros desenvolvedores.
> +
> +Se n=C3=A3o for poss=C3=ADvel encontrar ningu=C3=A9m para revisar os pat=
ches internamente
> +e voc=C3=AA precisar de ajuda para encontrar essa pessoa, ou se tiver qu=
aisquer
> +outras d=C3=BAvidas relacionadas a este documento e =C3=A0s expectativas=
 da
> +comunidade de desenvolvedores, entre em contato com a lista de discuss=
=C3=A3o
> +privada do Conselho Consultivo T=C3=A9cnico:
> +<tech-board@groups.linuxfoundation.org>.
> --
> 2.55.0
>
