Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87BA38D400
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 15:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054480; cv=pass; b=Ks6gXKzRrVYTzGguUwZ9WW7swAI1oewqKpQh6PE1Ce9HNs773Onvg5c7yd2mAT0DooNbs7VJ8mxPOmcnnN6albH4fHkNGzeTAsvIp4i/eohOY2HceVlSPIC0aK/P9mqgYHeGbs9jKksMGh8pa0524P4uCsIb2b/rZvzoUn3bF30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054480; c=relaxed/simple;
	bh=2od7uDWTNcOnpdZfjGMGh5EV2ChR+kA7PFT1WHgHOFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fFociz4qDV/CZqMGfOseho+Ec2Qk05lPAu3wZltnoh4PDoyM51bdKCgyapvo7dHnWSIkdI28NKSVaHEgknkESBuTzygs5kUYmVw8unJgysGQzg+pqxsdBmGv9s1mlicGk4BTvQd6kaY6NphgVZzXVFGpqpHDnTDRcEUgW7EkXW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/FViIkR; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/FViIkR"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9106feddbdfso18675436d6.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 08:34:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789054478; cv=none;
        d=google.com; s=arc-20260327;
        b=RCq9fBg91ngsUnfp1KDRITPEHFlILS4zTX6x+h9slF7DDgq79mGL/XY13Pz7cJ3Pm3
         R+wDi2BTnGr0Q5J0Xpp93qXQBfbitu66TATLvzgVMzMqwha2w0Wv1LB2U7uDrVK4MjD2
         ZtMGnBPXC9AbxysBLI7zCYGTMQbZPPCYWUVLppKaFHp8RfCqhc10sgQoStc+duQyKUj/
         Jo/DcVkebBi0V9IDoONU17qFDFNyzDfuStjqODHf9On6GjWzz46BcUUr0L8T2EXw4bj8
         7n141MVo4586NzKNIoVD0S3A1LheEecJL1cu4iJp03satTrtjjAjkQ/1vS7D3wQrPj+3
         mwoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c5EBaxWndWZ/tFBDJMyO+eIbBqaMdLPXHS2oT2RIvx4=;
        fh=Jss5Mo6RgGJ5ZtWN+WD+5HJ9B8gd4wcspiEuVp7Q3mk=;
        b=W2v3GvOjQ17TSSpYFfYeCI7NiXAIi7UkPrFPxEL/Xlnt/THhXMmHn0fMJ7L4dRgud0
         q8r0iGrgQ0lNA0WeLUC9vPwv9C7raPuqoDlLtpMFYc0KYLpGBeU9xmtx6Rqod0Q091sB
         VrvRohohKpuUjHfOHduu0sNzcHbxKGb0Ws2a5fSqiXps+ePNBNobSpQkr8dR2BdGR94c
         WrHJcEfbH5a7nnXzm0ooICjD2fj69dcs/sC+HmoCjUMYowd4rIAKsFs9Xe+4/amE9RmU
         4RQD7yNra5ZMY75OXdLhUrKoxGYiEUnX2vEiAoeOdr7wo6jRgIVJ5R/xTDkw0v+Bmg9z
         Cubw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789054478; x=1789659278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c5EBaxWndWZ/tFBDJMyO+eIbBqaMdLPXHS2oT2RIvx4=;
        b=a/FViIkRQrykLOxiOy+AwljfU7WcaJ2nhUCk5nLebbgCXpVloTG45DDdkI3qEJrupL
         CHY9mz0B0FRIT7cBu218HX5YdtsiTikBLlNTj10He2plAEIbg5hcS7Jmnpc5ARmXDOM4
         MBylY8/Zr1yLbL2vhBPnzvTv+iBl+t53YeyHJvGTobqigpI3qEREdi3z0pMgpIYdnXDS
         DzKTtXpt3dDD3A6tcnMpU9lwD/SFO0tCQ3mS+pRKfgFoUDoAefnE3BeUqOqX6mhVvNCD
         q1AHJgXQrY7yBVr18aTJyJvGZlefUQe1nLz8Igj7qZjWFCy7Dio/pSUS4pNu4eKPbc+d
         tZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054478; x=1789659278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c5EBaxWndWZ/tFBDJMyO+eIbBqaMdLPXHS2oT2RIvx4=;
        b=KUy/KSzZBb3fg/5mnnk5SLSCTs7QD96odr6BIhoiX9ZYH0MybfmjKpdiGEfieFF1DU
         yX8p80Ghc79LoXMXobGxJNDlp9NRl0ZZ6sW3nTysTDHbn+VR34LGWJoP6cUGlTN1y0Mx
         w+BrQNAdxcycvNQJnhCbQEwgwp9AEBOs9fuBpTxJlBnS25NExAamNXWQL4aR6CwHnYlc
         1avYHJw09dF3uP+cOJh3e4Hw5imsAtu1NGhT1k5nLMwkxuo+x63bDKOYTavTgQcCAhTl
         FUBEOA335Oyk0/TpLSTfGP6M3L10DbQKOM881VQqC255Z3ALFaciLuEp/NdTUiZP6sD7
         2leQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdkBZr0DnWKg8pvLrp5olpT9mq4HEI7ME/KqWBXaM5h4eMlE7VGfCav5UFAXFHJ++DMbQgLL00p94=@vger.kernel.org
X-Gm-Message-State: AFuF++lmXCLeggOASmDgK1gvSs1RRSHJE3L3HtQKmNxzIcpMbdEYlc2T
	AA4SwY//bSXdNQciG1cC0LA97zf3wPuS6DTRQDhG+ANeTUQ1GTp0HiNmkxUXmsogPyzLPEXSXU2
	g4aHO2KXLln42Q6MRBYMXRlvcLN2JmBE=
X-Gm-Gg: AYBFou33dDPtXgEW5VqaIXsv9jiBChGyhSmP9yHqd5O07YNa2ehWx+6ZU9dkbuUf3UO
	642OnhtYeH60x74KaNlxUj6s1/U0X83m+UgxJdUFMaQuhFVA2yxuW0txCttVW3zx+JP6AN/n3JF
	iIHCjzBC2YWwEtuKfsiHC2nHaYb19LpjaktKCjHwqT0p4JmADnZ/cTNWfH2uIrBmOJc/qgW5eAu
	GGn6vyRlIyxAWynyC2bHlOW+NGNPUkzfZAURwja9TfJAlO3YvJGDGSzaxWZbjkqNeR+WXHGLbzH
	oVUSNl2KdTDOTmUbKzZCdbAwmVONXJHJdduJuYtYRltnwQLvx7qy1RcrgPLMzElmZuKXAmxBJ8I
	CzqhdXRq6Da7fw0VxVEggwZYjvy+TUB4/+P8qAs3LzMKQ8PKzk13prx77qSZwPWcunbGL
X-Received: by 2002:a05:6214:8009:b0:910:6f61:f912 with SMTP id
 6a1803df08f44-9106f61fb4amr159837536d6.33.1789054477363; Thu, 10 Sep 2026
 08:34:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910151155.1237-1-silvapfabio@gmail.com>
In-Reply-To: <20260910151155.1237-1-silvapfabio@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 10 Sep 2026 12:34:25 -0300
X-Gm-Features: AcwNN1V6dSZ6EOm-vGHlNEX6EoW0BT5RWPCrnAUADC_f6plTmbKVKc6egJD402g
Message-ID: <CAMAsx6eOyOfL7tMU6rxB+WKMehRVx9iO=moGPXkPT16Jz309ug@mail.gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: translate researcher-guidelines.rst
To: Fabio Pereira da Silva <silvapfabio@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 10 de set. de 2026 =C3=A0s 12:12, Fabio Pereira da Silva
<silvapfabio@gmail.com> escreveu:
>
> Translate researcher-guidelines.rst into Brazilian Portuguese and add it
>
> to the pt_BR process documentation index.
>
> Signed-off-by: Fabio Pereira da Silva <silvapfabio@gmail.com>
>
> diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/t=
ranslations/pt_BR/index.rst
> index 71eb024fbec8..af4c085c39e8 100644
> --- a/Documentation/translations/pt_BR/index.rst
> +++ b/Documentation/translations/pt_BR/index.rst
> @@ -73,6 +73,7 @@ kernel e sobre como ver seu trabalho integrado.
>     Requisitos m=C3=ADnimos <process/changes>
>     CVEs <process/cve>
>     Lista de verifica=C3=A7=C3=A3o para patches <process/submit-checklist=
>
> +   Diretrizes para pesquisadores <process/researcher-guidelines>
>     Interface de drivers do kernel Linux <process/stable-api-nonsense>
>     Conclave (Continuidade do projeto) <process/conclave>
>     Manuais dos mantenedores <process/maintainer-handbooks>


Hello Fabio,

In this patch, you made the same mistakes mentioned in this patch:
https://lore.kernel.org/linux-doc/CAMAsx6f3DiyOkfmy90T_SHxkmMxoJm9kaoppAB3u=
Pq1WT6QXtQ@mail.gmail.com/
. Please fix them and send a V2.

Best regards,
