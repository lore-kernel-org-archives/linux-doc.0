Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795361529;
	b=T9RrUWAp6CyQUAkNY4Kdueztgh3dZtTU9l4jw9Ir4HWg1+HEhmQt4IfkIHZmCZGI2lf1
	 tv21YQasi3Z2sCPsMWoRb6ypTVZMWYhJDbdHN+4wvnjxsGIswDcn70tQnTisiYb1gWNe/
	 Ik4F7TJNUwJTJP4UZeNEdyhIq6gHznHoGc9ZEN1p1quNhw1K93V6+jJhwoEMDmlJl2qhZ
	 tbi5XwPmmyZoB8MKjgCmOxl2tcfKuUDdGeGZnUOyW8C41iJrvYYs8Q3FuCheFLRojKnTV
	 y7nk3vq9WXr1eC8o4O61UlPfyclbKIVIYtMr3BnF5u8dYLCgLA34TY4P3pAIrbEuvbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4wmxyR+0k8NKGKc9PpA63jQUe7IvwAp2MJ9Li1a6ayI=;
	b=zePHwOJJnaLDCtJ6VEnDC/VdljDx+d2A/jCShTgoOUHOdnAdmGpL7Mb41o2cDPIJ9SWg
	 PHExC4GcFAjTJyxLvQN+RwRRFjc0iYnFWc5Bzl3TZeG5kbR+8rj7x3FrkKyvcrcikTSG5
	 tRN/BdEiRdgCOLYlPlWNJ+/zX5Ix0nY1THChBdVdBAjjF7u+JMDDeNvrxyqj344HeY2tx
	 b2bFJM2+ZLcU0WF/W9YP5xMxWeL6JSzh8Ukee3jI1RXB4IMT88V7Ssp5eXS+znGf1GqnO
	 6fNSKhpg+R7aPL9Uq2iMvCNQBAQSYrvfbAsxqJ1L0ZIpZg1upmjQgLCTBjcPSNGH+cA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t8kYhi7I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8563606A32A
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 15:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8563606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t8kYhi7I
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-9213fddb596so28649246d6.2
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 07:32:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795361527; cv=none;
        d=google.com; s=arc-20260327;
        b=YvoLd2jSKkx+HVUztmRTYm9p7RTHqrYox7xvFhis0BQooOo81Z1JVF7+/6D1AA+qt0
         kgwIQ0/8NqvRiL4Gjv1TZRI9awnOSQCsGGAbbbWa0uKQU264FNop9aqxRNa+sl+UGRNA
         933OlMFPM5mXNrtoTOqxnOG3J/EFAZVTz6p3WwISR/W0cu0pJ9ZeuN5bjEqON//qxdpn
         SNdhsErQFKqaHKpoNIsX75iEFWZo9nll/RwMoVqRqNEa7Rb265jT+A0UcpYxd5JF8KbT
         0tB0/b40opVBWsggYVEwSlCDIJ6lkxYR9S2QN9AlWDse3xwDG4Ze9m+sPXZjISu8l3hN
         wnxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4wmxyR+0k8NKGKc9PpA63jQUe7IvwAp2MJ9Li1a6ayI=;
        fh=fcrbGCpNRcRhBDMZIv7INbYhoCOSq0kPXu5HrwcBIZA=;
        b=OKjGWMhGhrOhtYDiqbdn4ohBtr1OVUXHIanhjR7c60WUZg21IFqq59DA9KNlhJf++2
         UIPDG8somi2mHFJgRRylsS0v/dAXW+Tx3KhvpUSvFyuPTdbnlt4/uZEJKaZ2VGHCSB3m
         TyO45q+XeAY2tw8NKNcn1NTJmN6uc2Vpcp64uU89gZ2ol4OALM3QBUWrAOFEe55ekW4j
         /u13YEnd0r8I0YL6mMK7S/rG3/wCYUeQGGbX8ePZqnZI2Ew6e4abs2Xb1w5yliUva/gN
         ZedMsR4BjEkau6mzVsmbwxsNt9mnDBhI/AIIi5e2UAqhx/sbKBZNoGEzaX1YPWHFAzPt
         eSaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795361527; x=1795966327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4wmxyR+0k8NKGKc9PpA63jQUe7IvwAp2MJ9Li1a6ayI=;
        b=t8kYhi7I7NY28QM4kejO2/SxwNU3QqghBtxForB3bdRenNhW3CUn0dIEoZZ4vYyp6d
         bidtPm101LB2/98Vuhdj7cn4DDSOeCXme37B5V74JsVm/9EO46MNeEPSNAyz4olGbdsw
         fNVlM6R5Ucx3/DB/B6qwGwp5mozG7TC4+akFtf9oLkImB5kjGSFso/O8pmrnX5QHiCZu
         Mu7QwC229KMACpHRSkiUa7mo+4+CnSYyT8MtsSfTHL/8m9fkrz/u6x1eYq1B7bLZuhxD
         7aPiHuut2lmC/n+dkLsPEhzoacmC20/uDAEzx5YvvfNji8pLVeGOL0jLq/V5N7AefICL
         mtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361527; x=1795966327;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4wmxyR+0k8NKGKc9PpA63jQUe7IvwAp2MJ9Li1a6ayI=;
        b=p80+RDOXhU1Z1lPDfHBr/h0GM7nx1uwBB5xyzHbzTYJaEEl/jNFq8/2rTixwTmTxiI
         sbsdTRoPmL0CBwi7hjYHZdl8ARQi+qbk4o8zMo2yHJZIATlTmmoMVWpkz1e8vbVNFfYa
         DEWTIG3Ce20XRDbjx5L64wAMAUyDFzzaHHk2W7LhKWyJ027UyB0qmdsdbk2l0SHsl99f
         /QBH4JK6VaZH59tWvOBj5+gtgbMfZ5H4HlFS/mRD//nCrlDkD5fYpN6mh6flep6bTYhE
         MBxG0cHBibw16Y2WJedUkhiXaL8DIy+Weceqto9h6gMKr7JqQ/UgEcXjG7fXGV2GH7UD
         +Yew==
X-Forwarded-Encrypted: i=1; AL+hErFhDFkEWuNJydylLBcDzV6YZYiFQE3cLb6rq0UR3sp3tEaLjyHSoGkOHNW856JLHqTSQAKIQi6AQZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z92FOC3G6egUUKLYuZfYf8HyQY1SHl0zNj+tAvkhitlKnME3yxE
	RjCzVy+vlzUQVGB/hRIIAyJ5Eojsy7YvvysZ6l7TjnwaaU4b/heK5kcj4eacmdSW8baTf3Ekl6c
	FcTg6DSO8el6iU27MJOn82REfoZwpf9eLP47KMcJ8/g==
X-Gm-Gg: AZFdTZd8Ujr1Yq4YlpIefrC89JbyIB7VtTTNqFWWYRKqprs/CFs8ZDT8bjzlV7RvedI
	fyJFQR3hkQSr+bgA8GEejdqhIb7Tfw9gsQ8fGY3Djw3mj1aIPkyH/l3hBc4bNcuU8Zs2H6FGp2s
	tCe4vXAoacbE9AjHUZupJYqXQhFoz6IwJJ9KG3iN41eZ4VtPClvR3l/NmuhtKU4PsCr6fcFTsjI
	/e6+zgmoP6V73YgJPic4tmFhHblhSzUlXaTIw87K6DGxdAnNbTslMS6kkaBbNW2bdf4uhVswR5A
	wKCxAeBMn3D7BoLcltX4CTl2CVpG96ddfxIzquOL/elhob1OKG0a8Km+2y7TMHp3e0LSYaZVDw1
	PYMkVM3CH32GhakTl1ct3BXdkac67rlKHUMykM7gLToIF/eZQVWRTRctqVUd86i3+f8+9/FR1cb
	7cqvIgKjz+5FvvKH+B2UO8UxLc7VX+kfEW6CicFaLT2vnlPnXF9d/aw5TAqYe9pvoEZqddQp1/N
	69bfARBiF5AMNE1INvtHKBJ9bJ9xyFVmwOI04kA1FFHZ5Q=
X-Received: by 2002:ad4:574b:0:b0:90c:4422:84d1 with SMTP id
 6a1803df08f44-921420e31ddmr105128006d6.30.1795361527417; Sun, 22 Nov 2026
 07:32:07 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-threat-model-pt-br-v1-1-cebfe5cf4b79@gmail.com>
In-Reply-To: <20261122-threat-model-pt-br-v1-1-cebfe5cf4b79@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 22 Nov 2026 12:31:55 -0300
X-Gm-Features: Aa3M54rRT6yXIhWxEZFkZOnhI7xvRiapw35nNtJaQnVvfuvcBp6742R__vvvhGw
Message-ID: <CAMAsx6cVvuJbCSOD7frP=VhYxDdNEF1jiFuNyPeC-4FW5tqVyw@mail.gmail.com>
Subject: Re: [PATCH] docs/translations/pt_BR: process: add threat-model.rst
To: dreduardocruz@gmail.com
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em dom., 22 de nov. de 2026 =C3=A0s 11:06, Eduardo Pereira Cruz
<dreduardocruz@gmail.com> escreveu:

>
> Add the Brazilian Portuguese translation of
> Documentation/process/threat-model.rst, which describes what the kernel
> does and does not protect against, and which classes of problems are
> not considered vulnerabilities.
>
> Signed-off-by: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
>
Hi Eduardo,

this document has already been
translated by Vinicius, and his patch was reviewed and approved.

Please, whenever you are going to translate a document, check the list
first to see whether someone has already submitted it, to avoid
duplicated work.

Thanks,
Daniel


Em dom., 22 de nov. de 2026 =C3=A0s 11:06, Eduardo Pereira Cruz via B4
Relay <devnull+dreduardocruz.gmail.com@kernel.org> escreveu:
>
> From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
>
> Add the Brazilian Portuguese translation of
> Documentation/process/threat-model.rst, which describes what the kernel
> does and does not protect against, and which classes of problems are
> not considered vulnerabilities.
>
> The translation follows the English original as last changed by commit
> fdd100ee60a0 ("docs: process: use gender-neutral pronouns") and
> preserves its structure: section levels, the two :doc: references, the
> code spans, the emphasis markers and all 40 list items.
>
> Signed-off-by: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
> ---
>  Documentation/translations/pt_BR/process/index.rst |   1 +
>  .../translations/pt_BR/process/threat-model.rst    | 259 +++++++++++++++=
++++++
>  2 files changed, 260 insertions(+)
>
> diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documen=
tation/translations/pt_BR/process/index.rst
> index d072f7e46767..b7b505cd5143 100644
> --- a/Documentation/translations/pt_BR/process/index.rst
> +++ b/Documentation/translations/pt_BR/process/index.rst
> @@ -46,6 +46,7 @@ devem estar familiarizados.
>     Adicionando uma nova chamada de Sistema <adding-syscalls>
>     Por que a classe de tipo "volatile" n=C3=A3o deve ser usada <volatile=
-considered-harmful>
>     Como n=C3=A3o Deixar as ioctls malfeitas <botching-up-ioctls>
> +   Modelo de amea=C3=A7as do kernel Linux <threat-model>
>
>  Guias de pol=C3=ADticas e declara=C3=A7=C3=B5es de desenvolvedores
>  ---------------------------------------------------
> diff --git a/Documentation/translations/pt_BR/process/threat-model.rst b/=
Documentation/translations/pt_BR/process/threat-model.rst
> new file mode 100644
> index 000000000000..438a5c852b5a
> --- /dev/null
> +++ b/Documentation/translations/pt_BR/process/threat-model.rst
> @@ -0,0 +1,259 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Modelo de amea=C3=A7as do kernel Linux
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +H=C3=A1 muitas premissas contra o que o kernel protege e n=C3=A3o proteg=
e. Essas
> +premissas costumam causar confus=C3=A3o em relatos de bug (:doc:`os rela=
cionados =C3=A0
> +seguran=C3=A7a <security-bugs>` versus :doc:`os que n=C3=A3o s=C3=A3o
> +<../admin-guide/reporting-issues>`) e podem complicar a aplica=C3=A7=C3=
=A3o de
> +seguran=C3=A7a quando as responsabilidades por algumas fronteiras n=C3=
=A3o est=C3=A3o claras
> +entre o kernel, as distros, os administradores e os usu=C3=A1rios.
> +
> +Este documento procura esclarecer as responsabilidades do kernel nesse
> +dom=C3=ADnio.
> +
> +As responsabilidades do kernel
> +-------------------------------
> +
> +O kernel abstrai o acesso a recursos de hardware locais e a sistemas rem=
otos
> +de forma que permite a v=C3=A1rios usu=C3=A1rios locais obter uma fatia =
justa dos
> +recursos dispon=C3=ADveis concedidos a eles e, quando o hardware subjace=
nte
> +permitir, atribuir um n=C3=ADvel de confidencialidade =C3=A0s suas comun=
ica=C3=A7=C3=B5es e aos
> +dados que processam ou armazenam.
> +
> +O kernel pressup=C3=B5e que o hardware subjacente se comporta conforme a=
s suas
> +especifica=C3=A7=C3=B5es. Isso inclui a integridade do conjunto de instr=
u=C3=A7=C3=B5es da CPU, a
> +transpar=C3=AAncia da unidade de predi=C3=A7=C3=A3o de desvios e das uni=
dades de cache, a
> +consist=C3=AAncia da Unidade de Gerenciamento de Mem=C3=B3ria (MMU), o i=
solamento de
> +perif=C3=A9ricos capazes de DMA (por exemplo, via IOMMU), as transi=C3=
=A7=C3=B5es de estado
> +em controladores, as faixas de valores lidos de registradores, o respeit=
o =C3=A0s
> +limita=C3=A7=C3=B5es de hardware documentadas etc.
> +
> +Quando o hardware falha em manter o isolamento especificado (por exemplo=
,
> +bugs de CPU, canais laterais, resposta do hardware a entradas inesperada=
s), o
> +kernel normalmente tentar=C3=A1 implementar mitiga=C3=A7=C3=B5es razo=C3=
=A1veis. S=C3=A3o medidas de
> +melhor esfor=C3=A7o, destinadas a reduzir a superf=C3=ADcie de ataque ou=
 a elevar o
> +custo de um ataque dentro dos limites das capacidades do hardware; elas =
n=C3=A3o
> +constituem uma garantia de seguran=C3=A7a fornecida pelo kernel.
> +
> +Os usu=C3=A1rios sempre realizam as suas atividades sob a autoridade de =
um
> +administrador, que pode conceder ou negar v=C3=A1rios tipos de permiss=
=C3=A3o que
> +podem afetar como os usu=C3=A1rios se beneficiam dos recursos dispon=C3=
=ADveis, ou o
> +n=C3=ADvel de confidencialidade das suas atividades. Os administradores =
tamb=C3=A9m
> +podem delegar todas ou parte das suas pr=C3=B3prias permiss=C3=B5es a al=
guns usu=C3=A1rios,
> +particularmente via capabilities, mas n=C3=A3o s=C3=B3. Tudo isso =C3=A9=
 feito por meio de
> +configura=C3=A7=C3=A3o (sysctl, permiss=C3=B5es de sistema de arquivos e=
tc.).
> +
> +O kernel Linux aplica um certo conjunto de configura=C3=A7=C3=B5es padr=
=C3=A3o que
> +correspondem ao seu modelo de amea=C3=A7as. As distros t=C3=AAm o seu pr=
=C3=B3prio modelo de
> +amea=C3=A7as e v=C3=AAm com os seus pr=C3=B3prios presets de configura=
=C3=A7=C3=A3o, que o
> +administrador pode precisar ajustar para melhor atender =C3=A0s suas exp=
ectativas
> +(relaxar ou restringir).
> +
> +Por padr=C3=A3o, o kernel Linux garante as seguintes prote=C3=A7=C3=B5es=
 quando executado em
> +processadores comuns que oferecem n=C3=ADveis de privil=C3=A9gio e unida=
des de
> +gerenciamento de mem=C3=B3ria:
> +
> +* **Isolamento baseado em usu=C3=A1rio**: um usu=C3=A1rio sem privil=C3=
=A9gios pode
> +  restringir o acesso aos seus pr=C3=B3prios dados por outros usu=C3=A1r=
ios sem
> +  privil=C3=A9gios que operam no mesmo sistema. Isso inclui:
> +
> +  * dados armazenados, via permiss=C3=B5es de sistema de arquivos
> +  * dados em mem=C3=B3ria (p=C3=A1ginas n=C3=A3o s=C3=A3o acess=C3=ADvei=
s por padr=C3=A3o a outros
> +    usu=C3=A1rios)
> +  * atividade de processos (ptrace n=C3=A3o =C3=A9 permitido a outros us=
u=C3=A1rios)
> +  * comunica=C3=A7=C3=A3o entre processos (outros usu=C3=A1rios n=C3=A3o=
 podem observar dados
> +    trocados via sockets de dom=C3=ADnio UNIX ou outros mecanismos de IP=
C)
> +  * comunica=C3=A7=C3=B5es de rede dentro do mesmo sistema ou com outros=
 sistemas
> +
> +* **Prote=C3=A7=C3=A3o baseada em capabilities**:
> +
> +  * usu=C3=A1rios sem capabilities elevadas (incluindo, mas n=C3=A3o se =
limitando a
> +    CAP_SYS_ADMIN) n=C3=A3o podem alterar a configura=C3=A7=C3=A3o, a me=
m=C3=B3ria nem o estado
> +    do kernel, mudar a vis=C3=A3o de outros usu=C3=A1rios sobre o layout=
 do sistema de
> +    arquivos, conceder a qualquer usu=C3=A1rio capabilities que n=C3=A3o=
 possuem, nem
> +    afetar a disponibilidade do sistema (desligar, reiniciar, entrar em
> +    panic, travar, ou deixar o sistema sem resposta por esgotamento
> +    ilimitado de recursos).
> +  * usu=C3=A1rios sem a capability ``CAP_NET_ADMIN`` n=C3=A3o podem alte=
rar a
> +    configura=C3=A7=C3=A3o de rede, interceptar nem falsificar comunica=
=C3=A7=C3=B5es de rede de
> +    outros usu=C3=A1rios ou sistemas.
> +  * usu=C3=A1rios sem ``CAP_SYS_PTRACE`` n=C3=A3o podem observar a ativi=
dade dos
> +    processos de outros usu=C3=A1rios.
> +
> +Quando ``CONFIG_USER_NS`` est=C3=A1 definido, o kernel tamb=C3=A9m permi=
te que
> +usu=C3=A1rios sem privil=C3=A9gios criem o seu pr=C3=B3prio user namespa=
ce, no qual t=C3=AAm
> +todas as capabilities, mas com uma s=C3=A9rie de restri=C3=A7=C3=B5es (n=
=C3=A3o podem executar
> +a=C3=A7=C3=B5es que tenham impacto no user namespace inicial, como alter=
ar o hor=C3=A1rio,
> +carregar m=C3=B3dulos ou montar dispositivos de bloco). Consulte
> +``user_namespaces(7)`` para mais detalhes; as possibilidades dos user
> +namespaces n=C3=A3o s=C3=A3o cobertas neste documento.
> +
> +O kernel tamb=C3=A9m oferece muitos recursos de diagn=C3=B3stico e depur=
a=C3=A7=C3=A3o, que podem
> +constituir vetores de ataque quando caem em m=C3=A3os erradas. Embora al=
guns sejam
> +projetados para serem acess=C3=ADveis a usu=C3=A1rios locais comuns com =
baixo risco
> +(por exemplo, logs do kernel via ``/dev/kmsg``), alguns exporiam informa=
=C3=A7=C3=A3o
> +suficiente para representar risco na maioria dos lugares, e a decis=C3=
=A3o de
> +exp=C3=B4-los cabe ao administrador (eventos perf, traces), e
> +outros n=C3=A3o s=C3=A3o projetados para serem acessados por usu=C3=A1ri=
os sem privil=C3=A9gios
> +(por exemplo, debugfs). O acesso a esses recursos por um usu=C3=A1rio qu=
e recebeu
> +permiss=C3=A3o expl=C3=ADcita de um administrador n=C3=A3o constitui vio=
la=C3=A7=C3=A3o de seguran=C3=A7a.
> +
> +Bugs que permitem violar os princ=C3=ADpios acima constituem viola=C3=A7=
=C3=B5es de
> +seguran=C3=A7a. Por=C3=A9m, bugs que permitem uma viola=C3=A7=C3=A3o som=
ente depois que outra j=C3=A1
> +foi alcan=C3=A7ada s=C3=A3o apenas fraquezas. O kernel aplica uma s=C3=
=A9rie de medidas de
> +autoprote=C3=A7=C3=A3o cujo prop=C3=B3sito =C3=A9 evitar cruzar uma fron=
teira de seguran=C3=A7a quando
> +certas classes de bugs s=C3=A3o encontradas, mas uma falha dessas prote=
=C3=A7=C3=B5es extras
> +n=C3=A3o constitui uma vulnerabilidade por si s=C3=B3.
> +
> +Que classes de problemas n=C3=A3o s=C3=A3o consideradas vulnerabilidades
> +---------------------------------------------------------------
> +
> +No modelo de amea=C3=A7as do kernel Linux, as classes de problemas a seg=
uir **N=C3=83O**
> +s=C3=A3o consideradas vulnerabilidades do kernel Linux. No entanto, quan=
do se
> +acredita que o kernel poderia fazer melhor, elas devem ser relatadas, pa=
ra
> +que possam ser revisadas e corrigidas onde for razoavelmente poss=C3=ADv=
el, mas
> +ser=C3=A3o tratadas como qualquer bug comum:
> +
> +* **Configura=C3=A7=C3=A3o**:
> +
> +  * kernels desatualizados e, em especial, ramos em fim de vida est=C3=
=A3o fora do
> +    escopo do modelo de amea=C3=A7as do kernel: os administradores s=C3=
=A3o
> +    respons=C3=A1veis por manter o seu sistema atualizado. Para que um b=
ug se
> +    qualifique como vulnerabilidade, =C3=A9 preciso demonstrar que ele a=
feta
> +    vers=C3=B5es ativamente mantidas.
> +
> +  * no n=C3=ADvel de compila=C3=A7=C3=A3o: mudan=C3=A7as na configura=C3=
=A7=C3=A3o do kernel
> +    explicitamente documentadas como redutoras do n=C3=ADvel de seguran=
=C3=A7a (por
> +    exemplo, ``CONFIG_NOMMU``), ou destinadas apenas a desenvolvedores.
> +
> +  * no n=C3=ADvel do sistema operacional: mudan=C3=A7as em par=C3=A2metr=
os de linha de
> +    comando, sysctls, permiss=C3=B5es de sistema de arquivos, capabiliti=
es de
> +    usu=C3=A1rio, exposi=C3=A7=C3=A3o de interfaces privilegiadas, que e=
xplicitamente
> +    aumentam a exposi=C3=A7=C3=A3o, seja oferecendo acesso n=C3=A3o padr=
=C3=A3o a usu=C3=A1rios sem
> +    privil=C3=A9gios, seja reduzindo a capacidade do kernel de aplicar a=
lgumas
> +    prote=C3=A7=C3=B5es ou mitiga=C3=A7=C3=B5es. Exemplo: acesso de escr=
ita a procfs ou debugfs.
> +
> +  * problemas disparados apenas ao usar recursos destinados a desenvolvi=
mento
> +    ou depura=C3=A7=C3=A3o (por exemplo, LOCKDEP, KASAN, FAULT_INJECTION=
): esses
> +    recursos s=C3=A3o conhecidos por introduzir sobrecarga e potencial
> +    instabilidade, e n=C3=A3o s=C3=A3o destinados a uso em produ=C3=A7=
=C3=A3o.
> +
> +  * problemas que afetam drivers expostos sob CONFIG_STAGING, bem como
> +    recursos marcados como EXPERIMENTAL na configura=C3=A7=C3=A3o.
> +
> +  * carregamento de m=C3=B3dulos explicitamente inseguros, quebrados ou =
de
> +    staging, e, de modo geral, o uso de qualquer subsistema marcado como
> +    experimental ou n=C3=A3o destinado a uso em produ=C3=A7=C3=A3o.
> +
> +  * execu=C3=A7=C3=A3o de m=C3=B3dulos fora da =C3=A1rvore de c=C3=B3dig=
o-fonte ou de forks n=C3=A3o
> +    oficiais do kernel;
> +    esses devem ser relatados ao fornecedor correspondente.
> +
> +* **Excesso de privil=C3=A9gios iniciais**:
> +
> +  * a=C3=A7=C3=B5es executadas por um usu=C3=A1rio que j=C3=A1 possui os=
 privil=C3=A9gios necess=C3=A1rios
> +    para executar aquela a=C3=A7=C3=A3o ou modificar aquele estado (por =
exemplo,
> +    ``CAP_SYS_ADMIN``, ``CAP_NET_ADMIN``, ``CAP_SYS_RAWIO``,
> +    ``CAP_SYS_MODULE``, sem que nenhuma outra fronteira seja cruzada).
> +
> +  * a=C3=A7=C3=B5es executadas em user namespace que n=C3=A3o contornam =
as restri=C3=A7=C3=B5es
> +    impostas ao usu=C3=A1rio inicial (por exemplo, uso de ptrace, entreg=
a de
> +    sinais, uso de recursos, acesso a FS/dispositivo/sysctl/mem=C3=B3ria=
, bind de
> +    rede, configura=C3=A7=C3=A3o de sistema/rede etc.).
> +
> +  * qualquer coisa executada pelo usu=C3=A1rio root no namespace inicial=
 (por
> +    exemplo, oops do kernel ao escrever em um dispositivo privilegiado).
> +
> +* **Fora do ambiente de produ=C3=A7=C3=A3o**:
> +
> +  Isso cobre ataques te=C3=B3ricos/probabil=C3=ADsticos que dependem de =
condi=C3=A7=C3=B5es de
> +  laborat=C3=B3rio com ru=C3=ADdo zero no sistema, ou aqueles que exigem=
 um n=C3=BAmero
> +  irrealista de tentativas (por exemplo, bilh=C3=B5es de tentativas) e q=
ue seriam
> +  detectados por monitoramento padr=C3=A3o do sistema muito antes do suc=
esso, tais
> +  como:
> +
> +  * previs=C3=A3o de n=C3=BAmeros aleat=C3=B3rios que s=C3=B3 funciona e=
m um ambiente totalmente
> +    silencioso (como IP ID, portas TCP ou n=C3=BAmeros de sequ=C3=AAncia=
 que s=C3=B3 podem
> +    ser adivinhados em laborat=C3=B3rio).
> +
> +  * observa=C3=A7=C3=A3o de atividade e vazamentos de informa=C3=A7=C3=
=A3o baseados em abordagens
> +    probabil=C3=ADsticas sujeitas a ru=C3=ADdo de medi=C3=A7=C3=A3o e n=
=C3=A3o reproduz=C3=ADveis de forma
> +    realista em um sistema de produ=C3=A7=C3=A3o.
> +
> +  * problemas que s=C3=B3 podem ser disparados por ataques pesados (por =
exemplo,
> +    for=C3=A7a bruta) cujo impacto no sistema torna improv=C3=A1vel ou i=
mposs=C3=ADvel
> +    permanecerem sem ser detectados antes do sucesso (por exemplo, consu=
mir
> +    toda a mem=C3=B3ria antes de ter sucesso).
> +
> +  * problemas vistos apenas em simuladores de desenvolvimento, emuladore=
s ou
> +    combina=C3=A7=C3=B5es que n=C3=A3o existem em sistemas reais no mome=
nto do relato
> +    (problemas envolvendo dezenas de milh=C3=B5es de threads, dezenas de=
 milhares
> +    de CPUs, frequ=C3=AAncias de CPU, tamanhos de RAM ou capacidades de =
disco
> +    irreais, velocidades de rede irreais).
> +
> +  * bem como problemas que podem ser disparados a um custo ordens de gra=
ndeza
> +    maior que os benef=C3=ADcios esperados (por exemplo, um emulador de =
teclado
> +    totalmente funcional apenas para recuperar 7 bytes n=C3=A3o iniciali=
zados em
> +    uma estrutura, ou um m=C3=A9todo de for=C3=A7a bruta com milh=C3=B5e=
s de tentativas de
> +    conex=C3=A3o para adivinhar um n=C3=BAmero de porta).
> +
> +* **Falhas de hardening**:
> +
> +  * capacidade de contornar algumas das medidas de hardening do kernel s=
em
> +    caminho de explora=C3=A7=C3=A3o demonstr=C3=A1vel (por exemplo, cont=
orno de ASLR,
> +    medi=C3=A7=C3=A3o temporal de eventos ou sondagem sem consequ=C3=AAn=
cia demonstr=C3=A1vel). S=C3=A3o
> +    apenas fraquezas, n=C3=A3o vulnerabilidades.
> +
> +  * falta de verifica=C3=A7=C3=A3o de argumentos e falha em relatar cert=
os erros sem
> +    consequ=C3=AAncia imediata.
> +
> +* **Vazamentos aleat=C3=B3rios de informa=C3=A7=C3=A3o**:
> +
> +  Isto diz respeito a vazamentos de pequenas partes de dados que por aca=
so
> +  est=C3=A3o ali e que n=C3=A3o podem ser escolhidas pelo atacante, ou q=
ue enfrentam
> +  restri=C3=A7=C3=B5es de acesso:
> +
> +  * padding de estruturas reportado por syscalls ou outras interfaces.
> +
> +  * identificadores, dados parciais, strings n=C3=A3o terminadas reporta=
dos em
> +    mensagens de erro.
> +
> +  * vazamentos de endere=C3=A7os/ponteiros de mem=C3=B3ria do kernel n=
=C3=A3o constituem
> +    vetor imediatamente explor=C3=A1vel e n=C3=A3o s=C3=A3o vulnerabilid=
ades, embora devam
> +    ser relatados e corrigidos.
> +
> +* **Dispositivos e m=C3=ADdias n=C3=A3o conformes**:
> +
> +  Drivers s=C3=A3o implementados segundo uma especifica=C3=A7=C3=A3o. Qu=
ando um dispositivo
> +  ou uma m=C3=ADdia de armazenamento viola a especifica=C3=A7=C3=A3o seg=
undo a qual o seu
> +  driver foi escrito, o comportamento incorreto resultante =C3=A9 um bug=
 comum a
> +  ser corrigido, n=C3=A3o uma vulnerabilidade, a menos que o driver este=
ja
> +  especificamente documentado como protegido por hardening contra entrad=
as
> +  hostis. Assim, os casos a seguir n=C3=A3o s=C3=A3o considerados vulner=
abilidades:
> +
> +  * bugs disparados ao montar uma imagem de sistema de arquivos corrompi=
da ou
> +    constru=C3=ADda maliciosamente: montar um dispositivo de bloco =C3=
=A9 uma opera=C3=A7=C3=A3o
> +    privilegiada (veja acima), e o administrador =C3=A9 respons=C3=A1vel=
 pela m=C3=ADdia que
> +    monta. Isso inclui problemas resolvidos, mitigados ou detectados ao =
rodar
> +    uma verifica=C3=A7=C3=A3o de consist=C3=AAncia do sistema de arquivo=
s (fsck) na imagem
> +    antes de mont=C3=A1-la.
> +
> +  * bugs cuja reprodu=C3=A7=C3=A3o exige modifica=C3=A7=C3=A3o ou emula=
=C3=A7=C3=A3o de hardware, incluindo
> +    dispositivos USB falsos que se passam por outro, ou dispositivos que
> +    reportam valores fora das faixas documentadas.
> +
> +* **Acesso f=C3=ADsico**:
> +
> +  Problemas que exigem acesso f=C3=ADsico =C3=A0 m=C3=A1quina, modifica=
=C3=A7=C3=A3o de hardware ou o
> +  uso de hardware especializado (por exemplo, analisadores l=C3=B3gicos,
> +  ferramentas de ataque por DMA sobre PCI-E/Thunderbolt) est=C3=A3o fora=
 do
> +  escopo, a menos que o sistema esteja explicitamente configurado com
> +  tecnologias destinadas a proteger o sistema contra tais ataques (por
> +  exemplo, IOMMU).
> +
> +* **Regress=C3=B5es funcionais e de desempenho**:
> +
> +  Qualquer problema que possa ser mitigado definindo permiss=C3=B5es e l=
imites
> +  adequados n=C3=A3o se qualifica como vulnerabilidade.
>
> ---
> base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
> change-id: 20261122-threat-model-pt-br-e7b00ca3af32
>
> Best regards,
> --
> Eduardo Pereira Cruz <dreduardocruz@gmail.com>
>
>
