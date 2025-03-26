Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8748B13C8EA
	for <linux-doc@vger.kernel.org>; Wed, 26 Mar 2025 15:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743002184; cv=none; b=pTbz0VMSmvlhB92ECd5384CvDm/Yr1XBigeBL7neChBaSCgjdaGrVJwNO5FIfX8I1KXscBm2jmpNtKEbBn56BjJftklyrSo9C3yt0Q0Emg5aAwm4oe55F6It8nAOVDlo9uMXIWBH3LGBkrqtMAgllD1loB7A8XHaZbLC9D44K3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743002184; c=relaxed/simple;
	bh=A3BN3txhfbJaGTMZrZ44hHQrFhuiyt1GSQFht8ELqdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AfLceuR5RtzDY4sam7fkc691BgYXpnPZXbkRQECH5vmP6dJCphEnjtBLlaKd+2TGLkP4NY6O+yT4SKDKLq4c7kyNlxzIZeZE82UKX0XyEMw3wG5NZy/a2MUmwAnxhgSIbocIhKlBD4Oakuh0kivGRR9xd35HdzkBRQoUEjg5KMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Olf/hnGz; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Olf/hnGz"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-601ad30bc0cso656397eaf.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Mar 2025 08:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743002181; x=1743606981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GnED5etJ3NPsu4RXDeepK8OZ4sWclog72tDGWbwxypY=;
        b=Olf/hnGzKg6qRijKZB11eSbZwO28giBlUQbLEnyyzoMXPdlzzpjhtLylkULtR98+LL
         Ciydq6Kux8SNSuGi5VgTs8K93XRPIeEfKtBdQPu2HLEpAX0wrXUQGfreBCpculdMGYq7
         z+gJVoGmOB9u5qB8vHHEBrDeBfwYIRd1o9aB+by2KSK4g92FRqMethlHg4P63ExvTHPV
         Ci6Sw81eDKwQBKqK3b3wJ4rnA3j1YvRC4TLUUMyHOMrK3sp9T1zZmMqLKjfDyPGl4ND2
         xIzn0ebh9N6SH4tDpHgz13q06qSpEfYfHe+XCD3P54xOSI/AE/Wx3eZu/j9UHWrRF9J6
         KCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743002181; x=1743606981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GnED5etJ3NPsu4RXDeepK8OZ4sWclog72tDGWbwxypY=;
        b=G0+BD8a7Tw8GThFIvqzJQHD9QTt4hZhH8+1TTJosWCcF6cBWU/XJzCosgdsA0Ux+SS
         5ITEwvjGR9t/ORBk8JuoqRyH0KwXfxJ/zubKoL86nnMDRIiUutnPhN+v4w2Yu8oGD7By
         TlF42w8KZga6gBuFcs6iDeJBc5U6tET0kUy6e+FaeUw3PkMUxwhLJIYa8jpwKc4ZofYx
         BaK0B4DMO0wUS8R5IG3Vu21qcunoQ0VcaWfV/plOUIXtKI9xmgE90b6x2dCLByeXD1z9
         /IRtD2pBoVUKyIZjTjrg3JdcFSJHViYAbFVXaoWtmfV97W4N+d2AJ7xO951PHOR3VT3T
         0zFw==
X-Forwarded-Encrypted: i=1; AJvYcCXZmjDCFxukKOLHgsmDpw3nHD5atuINMUm6413/I9RxM78MCQiKQ6slaY6CAFgt2CUa4qi5V5F1GO4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH7P0oCMqLCihJJ44G8uKG7fDjLwkpm3UqHePJQOJsfA2d/ugk
	XerjDZRkGcmaV39s46fUmlwMnTlqu3ycXgEtRWLFSPybUXcTrQtN
X-Gm-Gg: ASbGnctU2nhrbmhtbjEDgIdeOpsaAebEMpfnbMSPUwSiZsmVjxj4gwCB/iO5bXV1+Lz
	r09i3RUenZ95JndwRLPTjIpGRFcZFp4M0KDx+k5/WFnO9XScoJ8GmghstAwBX8RNC4dhddvv01q
	WOd8GWwXfzzVPYZ0js8zf2bzLHrf/M7sMKDrgFalA4khVKnW7xbXicZV7map4S9E6cTqopJv4P9
	1RS3SW0S13Fvi2Br1Lqg63GSYUT+IX6dCq6tvBaxT5152P1V0ls237tmfcdt0DGLmUUZH+LILio
	dPZxVq+7gwR/S0ZsAxEKhDKPFuPOqtSsCbiLujWDB1e6jUE1wgXaCZv+4Jj3DlYusu1vkhvj/um
	SyfR39r5bZQ+KTUBpy9uEtKED7YnOeqQt
X-Google-Smtp-Source: AGHT+IGhICqCEzSJazKmcQnDbiDzw4ekuYZ1vRoxEz5fdxgG26zy5/mYCxHBhokJkLozfJZ6IiixHA==
X-Received: by 2002:a4a:db56:0:b0:601:fde2:c681 with SMTP id 006d021491bc7-6026cb38aebmr2578246eaf.1.1743002181093;
        Wed, 26 Mar 2025 08:16:21 -0700 (PDT)
Received: from ?IPV6:2603:8080:7400:36da:dff5:4180:2562:4c1e? ([2603:8080:7400:36da:dff5:4180:2562:4c1e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6026c5038a1sm345053eaf.34.2025.03.26.08.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 08:16:20 -0700 (PDT)
Message-ID: <94e693ea-5ffe-49c6-ad9c-56962004d472@gmail.com>
Date: Wed, 26 Mar 2025 10:16:20 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/sp_SP: fix links to mailing list services
To: Andres Urian Florez <andres.emb.sys@gmail.com>, carlos.bilbao@kernel.org,
 avadhut.naik@amd.com, corbet@lwn.net
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org
References: <20250324164613.12639-1-andres.emb.sys@gmail.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20250324164613.12639-1-andres.emb.sys@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hey Andres,


Thanks for this. Will look into it and get back to you.


On 3/24/25 11:45, Andres Urian Florez wrote:
> With the changes in the way mailing lists are hostet at kernel.org, there
> is a need to sync the Spanish documentation to:
>
> 1. fix links that are pointing at the outdated resources
> 2. remove an outdated patchbomb admonition
>
> Signed-off-by: Andres Urian Florez <andres.emb.sys@gmail.com>
> ---
>  .../translations/sp_SP/process/2.Process.rst        | 11 ++++++-----
>  Documentation/translations/sp_SP/process/howto.rst  | 10 +++++-----
>  .../translations/sp_SP/process/kernel-docs.rst      |  5 ++---
>  .../sp_SP/process/submitting-patches.rst            | 13 +++++--------
>  4 files changed, 18 insertions(+), 21 deletions(-)
>
> diff --git a/Documentation/translations/sp_SP/process/2.Process.rst b/Documentation/translations/sp_SP/process/2.Process.rst
> index 5993eed71563..c21b0134cfa1 100644
> --- a/Documentation/translations/sp_SP/process/2.Process.rst
> +++ b/Documentation/translations/sp_SP/process/2.Process.rst
> @@ -428,13 +428,14 @@ los desarrolladores, que corren el riesgo de quedar enterrados bajo una
>  carga de correo electrónico, incumplir las convenciones utilizadas en las
>  listas de Linux, o ambas cosas.
>  
> -La mayoría de las listas de correo del kernel se ejecutan en
> -vger.kernel.org; la lista principal se puede encontrar en:
> +La mayoría de las listas de correo del kernel se alojan en kernel.org; la
> +lista principal se puede encontrar en:
>  
> -	http://vger.kernel.org/vger-lists.html
> +	https://subspace.kernel.org
>  
> -Sim embargo, hay listas alojadas en otros lugares; varios de ellos se
> -encuentran en redhat.com/mailman/listinfo.
> +Sin embargo, hay listas alojadas en otros lugares; consulte el archivo
> +MAINTAINERS para obtener la lista relevante para cualquier subsistema en
> +particular.
>  
>  La lista de correo principal para el desarrollo del kernel es, por
>  supuesto, linux-kernel. Esta lista es un lugar intimidante; el volumen
> diff --git a/Documentation/translations/sp_SP/process/howto.rst b/Documentation/translations/sp_SP/process/howto.rst
> index 72ea855ac9dc..e1a6e6a52ae4 100644
> --- a/Documentation/translations/sp_SP/process/howto.rst
> +++ b/Documentation/translations/sp_SP/process/howto.rst
> @@ -334,7 +334,7 @@ con el árbol principal, necesitan probar su integración. Para ello, existe
>  un repositorio especial de pruebas en el que se encuentran casi todos los
>  árboles de subsistema, actualizado casi a diario:
>  
> -	https://git.kernel.org/?p=linux/kernel/git/next/linux-next.git
> +	https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>  
>  De esta manera, linux-next ofrece una perspectiva resumida de lo que se
>  espera que entre en el kernel principal en el próximo período de "merge"
> @@ -378,13 +378,13 @@ desarrolladores del kernel participan en la lista de correo del kernel de
>  Linux. Detalles sobre cómo para suscribirse y darse de baja de la lista se
>  pueden encontrar en:
>  
> -	http://vger.kernel.org/vger-lists.html#linux-kernel
> +	https://subspace.kernel.org/subscribing.html
>  
>  Existen archivos de la lista de correo en la web en muchos lugares
>  distintos. Utilice un motor de búsqueda para encontrar estos archivos. Por
>  ejemplo:
>  
> -	http://dir.gmane.org/gmane.linux.kernel
> +	https://lore.kernel.org/linux-kernel/
>  
>  Es muy recomendable que busque en los archivos sobre el tema que desea
>  tratar, antes de publicarlo en la lista. Un montón de cosas ya discutidas
> @@ -398,13 +398,13 @@ los diferentes grupos.
>  Muchas de las listas están alojadas en kernel.org. La información sobre
>  estas puede ser encontrada en:
>  
> -	http://vger.kernel.org/vger-lists.html
> +	https://subspace.kernel.org
>  
>  Recuerde mantener buenos hábitos de comportamiento al usar las listas.
>  Aunque un poco cursi, la siguiente URL tiene algunas pautas simples para
>  interactuar con la lista (o cualquier lista):
>  
> -	http://www.albion.com/netiquette/
> +	https://subspace.kernel.org/etiquette.html
>  
>  Si varias personas responden a su correo, el CC (lista de destinatarios)
>  puede hacerse bastante grande. No elimine a nadie de la lista CC: sin una
> diff --git a/Documentation/translations/sp_SP/process/kernel-docs.rst b/Documentation/translations/sp_SP/process/kernel-docs.rst
> index a62c6854f59b..b9e0ca4be324 100644
> --- a/Documentation/translations/sp_SP/process/kernel-docs.rst
> +++ b/Documentation/translations/sp_SP/process/kernel-docs.rst
> @@ -170,9 +170,8 @@ Recursos varios
>  
>      * Título: **linux-kernel mailing list archives and search engines**
>  
> -      :URL: http://vger.kernel.org/vger-lists.html
> -      :URL: http://www.uwsg.indiana.edu/hypermail/linux/kernel/index.html
> -      :URL: http://groups.google.com/group/mlist.linux.kernel
> +      :URL: https://subspace.kernel.org
> +      :URL: https://lore.kernel.org
>        :Palabras Clave: linux-kernel, archives, buscar, search, archivos.
>        :Descripción: Algunos de los archivadores de listas de correo del
>          kernel de Linux. Si usted tiene uno mejor/otro, por favor hágamelo
> diff --git a/Documentation/translations/sp_SP/process/submitting-patches.rst b/Documentation/translations/sp_SP/process/submitting-patches.rst
> index 328ec80bd61d..ecb08b14c2c0 100644
> --- a/Documentation/translations/sp_SP/process/submitting-patches.rst
> +++ b/Documentation/translations/sp_SP/process/submitting-patches.rst
> @@ -136,11 +136,11 @@ algo documentado en la web, referencie esto.
>  
>  Cuando se vincule a archivos de listas de correo, preferiblemente use el
>  servicio de archivador de mensajes lore.kernel.org. Para crear la URL del
> -enlace, utilice el contenido del encabezado ("header") ``Message-Id`` del
> +enlace, utilice el contenido del encabezado ("header") ``Message-ID`` del
>  mensaje sin los corchetes angulares que lo rodean.
>  Por ejemplo::
>  
> -    Link: https://lore.kernel.org/r/30th.anniversary.repost@klaava.Helsinki.FI/
> +    Link: https://lore.kernel.org/30th.anniversary.repost@klaava.Helsinki.FI
>  
>  Verifique el enlace para asegurarse de que realmente funciona y apunta al
>  mensaje correspondiente.
> @@ -257,10 +257,10 @@ archivo MAINTAINERS una lista específica de los subsistemas; su parche
>  probablemente recibirá más atención allí. Sin embargo, no envíe spam a
>  listas no relacionadas.
>  
> -Muchas listas relacionadas con el kernel están alojadas en vger.kernel.org;
> +Muchas listas relacionadas con el kernel están alojadas en kernel.org;
>  puedes encontrar un listado de estas en
> -http://vger.kernel.org/vger-lists.html. Existen listas relacionadas con el
> -kernel alojadas en otros lugares, no obstante.
> +https://subspace.kernel.org. Existen listas relacionadas con el kernel
> +alojadas en otros lugares, no obstante.
>  
>  ¡No envíe más de 15 parches a la vez a las listas de correo de vger!
>  
> @@ -907,9 +907,6 @@ Referencias
>  
>    <http://www.kroah.com/log/linux/maintainer-06.html>
>  
> -NO!!!! Gente, no mas bombas enormes de parches a linux-kernel@vger.kernel.org!
> -  <https://lore.kernel.org/r/20050711.125305.08322243.davem@davemloft.net>
> -
>  Kernel Documentation/process/coding-style.rst
>  
>  Email de Linus Torvalds sobre la forma canónica de los parches:


Thanks,

Carlos

