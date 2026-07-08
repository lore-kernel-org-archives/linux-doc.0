Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19D040683A
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 14:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783519380; cv=pass; b=JWsA97yud9B9ePpFitTIA4umaDFz63i/8A4lrlqi7/9+3gZCqz/fPMm/ZdznZ3HtJSyxJbas+/DVpOCys1OgTCPUyRwmTObJy+69n5Kj2OCrcVDnATrSZrCEBR93J8PT780KUCFolZdSFgUt17lMSWUTeez/k97pCIA+RSeb+Ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783519380; c=relaxed/simple;
	bh=3ZYFE1rOhJaETonX/yn/WpO5nVdnpgJJ8jQu6xZIt1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iorE2zKuEIFUlHlVWOPdF7CulfM1bKnqvvpzYAUn47/r5EumQadcOAiID5LPFA0IfqtPu6FB+t1h9r/ul0gjT0E9Mjcc9wR0q+OcgIDGf32iafFr1+5F4dYSB6wPhwex3SxAh5z5kLRKyZQrk1WnRltdgyXCvZzKIZPd2oXTcwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5QeIcJL; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5QeIcJL"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8f1e274ccb9so3738796d6.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 07:02:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783519378; cv=none;
        d=google.com; s=arc-20260327;
        b=L0TRl3U6hajd4dh34AWoFjWf0v8+ZPu05Wurh2yah3xgKghFVNGvO676BM9N42RH72
         3DRbRhalc3s27wEJn9MPHfAaMBHdaxB3nhmmc9zQuf5Yy/I4JiCbuVRlEecquOLUcGsS
         sjHayTDMmh5chdgFOA/AL//zDCe1sJlyDPku1CzpXkSTxohCdjPR665ZyMtSuVcvHIxk
         EsRMw3zbDAI8IOCHcNrvUFkieArQsPxe/wngTZAHBhX/s45Y6xupbHGPVKwN6KD1mDbz
         pRUIzJ7DT4NJ8Gt2+f31IxVBjcs4M35AB2fDP339pCxaDG6GnESD6tcDFmGdvC6fRcJW
         E52g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3ZYFE1rOhJaETonX/yn/WpO5nVdnpgJJ8jQu6xZIt1k=;
        fh=kPd+0CO5eMXdCCEQ8RVuPiiZeMTY/UsdKBGF0EIcNjI=;
        b=TG2ULbEWmTeHgwCALe02dbzmJLtKS+FLtk+aMfDXc5YxkP/eOln/2NJMVEzxCDPQwt
         jcNMO56d4tMkxSUqUZeT8lNPcqGGF5a+Nq/KjcV/VoyWZAzsQr9gn8MEUtrrBz8lVMVU
         V1r7nx9a9JDENP0vo/F8Aeq5c+Efwmj//8BPR13Hsyzj3DlZNhOIh0pLK2sHj4njpiKQ
         z715lcAhx6Y+RCUmRJcIPTfI/WwkAl9CdKDVuI8DR2WJL8uxdufo569QEJAwa1f0IOQn
         VgWVqXz3ucgu+JFe6ve+/crcwS+05NZW+eM/RrnTUdcfvv5xyTgs6sES5VSnH5xQRwO7
         Z3MQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783519378; x=1784124178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3ZYFE1rOhJaETonX/yn/WpO5nVdnpgJJ8jQu6xZIt1k=;
        b=I5QeIcJLHovs062XIRW0Q1x9n9q8QS0QX6srjhu3iYq/4tRCRYZnltB9iPHhdSyQ3j
         a5pdpTf/2ogmMKaFrmlOuxB7x7La17P8mBM25irfP93DQ5MZDabnmnvtmU9qF57UBkJo
         HuvuY8QGhhwMdZumArCSOoaXiKnsQJJiCYI0abwnay3saQAgpkTj8He9p7q1tA9ZM1kr
         5tgkv56E2fpcftLCWIEJGNteat9AhPDSKGe1WG8Hk3OjL7VnC1SN2lG15gPDoIc8PMhV
         0KyeJJ886TyvO02TBuIR15xUI5JzRkJ5mlRYrL5GmvRccw4z8oxOug2QcZt7ZLofBUi1
         lH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783519378; x=1784124178;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ZYFE1rOhJaETonX/yn/WpO5nVdnpgJJ8jQu6xZIt1k=;
        b=PQYkz97QMyBOQaTeEIjM6NHmFP0T+TSkMI9ZevOdTIyiVFLyfRCyBtDhGPmBERpr0F
         HGlDB6LD1AEkxsPaUS2h2EK8dNndGtR88dvZLBiZDAGzZnuj6zbbkWKL9AEZwZqFFsA9
         /oordSGECuH/rJgH6p1id+PVM5sLu45qzc9QGI20jmqrIbEyA/qyVmBi+S6AK3rouMVJ
         j0fEz5MAUA6+BmfDKhuE19JuR+EAkfQP7JkQnWkiQTUSr+pJI2deG14SsePNKCkJUACw
         sa/nwDup5z0HD2QNGwxh4AydcRo3FjSRfAXUaphtfyUBKVw484Uy0WICk89/7BvEJ0hv
         LT/Q==
X-Gm-Message-State: AOJu0Yyv7ic80RMW8DwyfYndi6tiRNuz1CVvzu9gkrtoLcU4zbWsAmgs
	RO9gQ5kBuDjjCCPPYFyT1oNwCKlfh7CV+gbsMD15pNgGo+AYrzAvW2+a7qSxL7JoQ06HCyLWZG4
	b7N3LdiL7PpiskyfDDpNSYRG3QCK6xWEi2rStC+0=
X-Gm-Gg: AfdE7ckYjxBg9tU20dWdVaF5/tn/LiYsmytc70eQ+LCgkwlNTu82LvLGLaUN2cw0YQN
	yToVmAgH/RbA2D/hBkUgq0dza/UCG3dCoqf5t+gYFmSYFC3jleBPlZTfI0l0Rcjvtsi5ULAM4pU
	YXoOrAEawRa9YUVZnciNAI2ACEFv+T/HCY9S0jsWMsQwUvIuB1NS4/uR+zzRyBuW/+LDr1jr397
	LpuD0e9633eRe3GZidNghN0FRot0I5XD7dNCs07Nh0jFA+TVkT2rpf4O59Yme9s1xY982RiNmIB
	oDMm0+/odsb/mc4dQM4brAzXCmDcNJ2N+oQ4FltRX1F+jPwshpl6QcPaRw0BRcudsjHSTqg5s+i
	9AgTiqngGTco=
X-Received: by 2002:ad4:5f8f:0:b0:8e9:f62b:8f90 with SMTP id
 6a1803df08f44-8fec2f50f89mr24619336d6.54.1783519377022; Wed, 08 Jul 2026
 07:02:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706015213.1828-1-silvapfabio@gmail.com>
In-Reply-To: <20260706015213.1828-1-silvapfabio@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 8 Jul 2026 11:02:44 -0300
X-Gm-Features: AVVi8Cc0cPyEwi1vv_0KP27BmwPAkTWAkNmPhR7_seBpGK97cFNb5sLJVmmJrqU
Message-ID: <CAMAsx6fO3mE3tatXmSCYDGvTUfsTSF6Zzz-+KHcMmkXO8s_rPg@mail.gmail.com>
Subject: Re: [PATCH] docs: pt_BR: process: Translate CVE documentation
To: Fabio Pereira da Silva <silvapfabio@gmail.com>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em dom., 5 de jul. de 2026 =C3=A0s 22:52, Fabio Pereira da Silva
<silvapfabio@gmail.com> escreveu:
>
> Translate Documentation/process/cve.rst into Brazilian Portuguese and lin=
k it from the pt_BR documentation index.

>Somente esses indiv=C3=ADduos, com
> +profundo conhecimento especializado e conhecimento =C3=ADntimo do subsis=
tema, podem
> +avaliar de forma eficaz a validade e o escopo de uma vulnerabilidade rel=
atada e
> +determinar sua designa=C3=A7=C3=A3o CVE apropriada. Qualquer tentativa d=
e modificar ou
> +contestar um CVE fora dessa autoridade designada pode levar a confus=C3=
=A3o, relato
> +impreciso e, em =C3=BAltima an=C3=A1lise, sistemas comprometidos.

Hi Fabio, let's change "conhecimento especializado" to "Conhecimento
t=C3=A9cnico" to avoid repeating "conhecimento" in the same sentence.

> +Qualquer CVE atribu=C3=ADdo contra o kernel Linux para uma vers=C3=A3o d=
e kernel
> +ativamente suportada, por qualquer grupo que n=C3=A3o seja a equipe de a=
tribui=C3=A7=C3=A3o de
> +CVEs do kernel, n=C3=A3o deve ser tratado como um CVE v=C3=A1lido. Por f=
avor, notifique
> +a equipe de atribui=C3=A7=C3=A3o de CVEs do kernel em <cve@kernel.org> p=
ara que ela
> +possa trabalhar para invalidar essas entradas por meio do processo de re=
media=C3=A7=C3=A3o
> +da CNA.

Hi, the phrase 'assigned against the Linux kernel' sounds a bit
unnatural when translated literally to Portuguese. It would be more
fluid to use
 'assigned to' ('atribu=C3=ADdo ao'). Can we update this? Thanks!

> +Aplicabilidade de CVEs espec=C3=ADficos
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Como o kernel Linux pode ser usado de muitas formas diferentes, com muit=
as
> +formas diferentes de acesso por usu=C3=A1rios externos, ou sem nenhum ac=
esso, a
> +aplicabilidade de qualquer CVE espec=C3=ADfico cabe ao usu=C3=A1rio do L=
inux determinar;
> +isso n=C3=A3o cabe =C3=A0 equipe de atribui=C3=A7=C3=A3o de CVEs. Por fa=
vor, n=C3=A3o entre em contato
> +conosco para tentar determinar a aplicabilidade de qualquer CVE espec=C3=
=ADfico.

I noticed a slight redundancy in this translation: 'de muitas formas
diferentes, com muitas formas diferentes...'.
To make the Portuguese text sound more natural and fluid, I suggest
using synonyms to avoid repeating the phrase. Here is a suggestion:
'Como o kernel Linux pode ser usado de m=C3=BAltiplas maneiras, com
diversas formas de acesso por usu=C3=A1rios externos...'
What do you thinks?

> +Al=C3=A9m disso, como a =C3=A1rvore de fontes =C3=A9 muito grande, e qua=
lquer sistema usa
> +apenas um pequeno subconjunto da =C3=A1rvore de fontes, qualquer usu=C3=
=A1rio do Linux
> +deve estar ciente de que grandes n=C3=BAmeros de CVEs atribu=C3=ADdos n=
=C3=A3o s=C3=A3o relevantes
> +para seus sistemas.

 In this section, I suggest updating '=C3=A1rvore de fontes' to '=C3=A1rvor=
e de
c=C3=B3digos-fonte',
 changing 'grandes n=C3=BAmeros' to 'grandes quantidades' for better flow,
and removing the repeated 'qualquer'.

Thanks.

Dan
