Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EC941E6C1
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 19:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057425; cv=pass; b=M4L4FZFW5CQxg0hURgNmeqd6Gaf/BQz3MOYFTXFR/mrW9chA+i+qdKZwyJUCZmHWE+ehYYkbxjwN3i+qq4uwfGMSwFbdFjWB26c2h/ZDdkfrbMP0ZqjtoIjHkhFuIkC54wCPWcXWRZUYweeZsS4TSOxWmXER/J8VPI6JffumYu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057425; c=relaxed/simple;
	bh=x0m3ObdJkBlLDNmCmmUryHA7jvgytycVP57uV5aQXPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bXPC4WAjOfu4Vrymx3lM7t7aEyX0vjFoCcMpiiCqbAxoMTy7DdA96Ui1MX6LeL7yRRWUh/nRD5ra8p9tFmWHLokj8d3o8wisn2SyXwQ/ObtwVakrIvRi5+pDmSy4FTYi1w+EYJZP/YzJCBWS9hcvnjRw6vGMWXKCnSbv7FVcPEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7DMD5dZ; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7DMD5dZ"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-902fc790cd5so48775136d6.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 12:30:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784057423; cv=none;
        d=google.com; s=arc-20260327;
        b=aas562U4HJWI8gZEqxLhXCUjWYAhY9r/ehJJ4InN4ScoXFvnadFvFCihfTmQ0n11f4
         mlAQyRBjHZOtMMAjYvP5WeiuklcO8+L91vQ/FSmYIZTzMcWCtjl1k4rwMIdsVmoftx0v
         mlW4uBMqkABjEDxv1oeEg6FtoEzuq0zXYngz0JAKjBEA8Efy+rQPeFgaI7eeaCPFS3eq
         ESXjh6ju0I1zt3ESZTkBljzYvnwCTH0yd3+e/TWfRhhXgLdKsgLOJBCcheubyx2cFfyV
         qPN0otVa8gLDK83gv66g3PW8r6+UnL3YPKZgnNF+ODjzcOi4ryjnNdK5FX8bAMj2jSNL
         V8nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Ehv0COJd4mRW+0Sc4WuTe1nqKkao9mPDPxw2Q+4Vps=;
        fh=KTwrOiR6EdSv4cNBfnSmK43ujfSnQIWwROLjkuNIdXw=;
        b=DA+yjE1BAERYI7GiUTNiesyqXfbx76llk86H13WvtOpOTqL6p0vOk49/LjVm32DsLI
         Uj2CiJXZ7A0ojqPUECNhsb6YfKtRZRrVAiGe9+LaSpGVK3u9Qy43g56Bfem77KDZkWV0
         7tk5F9nX/RhyHPu86V4bb4R1Ibb8GxlkkCw39sKfYZMn8FT2IbOPnXQrWJUWGwfglvVa
         m94M8CREYk4YSWhuTEFzpNNOrd3pM413QX1HgTyLxNx0URxo6vaPXdhqhV1IVGm+8eZL
         1HcE4cPnXnMkXrgtL/gllVTHWF4vLbrMDEZBf2TrLBZ0BFCmYefpKR7cllIFMDMQUheA
         r4IQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784057423; x=1784662223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Ehv0COJd4mRW+0Sc4WuTe1nqKkao9mPDPxw2Q+4Vps=;
        b=d7DMD5dZEUbhcdl7rZuMa23k5aArnvOQ2+Lk+ciUInMvcAZpDduTjPtAIXEyhE9HvG
         AY1d1C/0+UtIYKeGdwshKIgRQb95r95+n94g50a+toIlajyJtCnmB9pjUmmmhcod8JAZ
         JgPwY0VvCbQZfxHEFhaUViiEBZnaPStoocaWMqO46a8E2SIkBY5iRVnIRNq/f1i36QqB
         7oOMpwmTXmTD6TYH3yn6hIutKYS9l3marQtlSdHfKikiO5yIQDpD5AEo2Zlfka+2G5Iy
         UHY4Oh2ZHcC/dCvUxQoM3RQ0DzgmqFNZprPjt9zcMaYemS1F/FZ5u3xSaUYzvQGaqvrV
         D+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057423; x=1784662223;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Ehv0COJd4mRW+0Sc4WuTe1nqKkao9mPDPxw2Q+4Vps=;
        b=C3XAQuPWPzbYguiqJo/IHK1IFrcn6l8zOGdWMwuf2GTcoEyEYLqpTGMQDWnivi4AN0
         mkk7LDLW4o667iXKVN/lgJZtJ4Ui6RXrxg7Tf5BTLvLAce64hXLZ8ggDp87+5FnX1gaO
         hufLEpSPN+lhdfIQl7eIqRqXjKDaIEBpeBvfwAdameQripCTD/BMTB2PbMrb/WWvJ1ds
         3HYS3F8tqIKY9ppfyk/txJ7SUmoCS7waYGpZoWAaiPjKXdVq50Qj/9+2kzdeGn9icBXO
         0MNsKuHMkybw8Y0WpW524U7VL7fghVj5nxC2EXxLSJp35H+8PHN5rAE4hvgalE0QFM6E
         xqhg==
X-Gm-Message-State: AOJu0YyI0Vh1+vn9FJBq35IASxiyj8kaPsPmKHUj4gx5sf85Q+5O/Tbr
	eupIoPFuvPDCZDWtvloAG6yPVNmzm8wEPS0X/1/icC6n2Z07Oa64jM+lsZzHB/VvlwGL6iIyhOf
	TR1R+CRlP/DzlKOBNgSjQrXT/SqA5CLQ=
X-Gm-Gg: AfdE7ckzwoCID8L3HIlKjv4uV5EmykRUQUoAv/jVyp8wbTRWb6ELW22ooLg4/ZEcLs0
	TdHlrr6gOjC/N8RuybBPcJK0UFJahMclKS9NVxpwoo7AjADNpKSMIC3q1Qa07ZjvJEwRL0voZLD
	iYS7O/PNnRfINaknDiSWHpy/AvxwIRRqIcrgOjILxg5x9SKnL8pXzFKudeS9N4/71UcsdsyOk2Q
	ySo/D2CpGZcIkBWPufo8+SrkXmUufSIAuXSuv8SpclBSxYlcRwMQNvQ5ZGfl+ltVJqn0mQUyudK
	HRnXQVY1wvVljgPz4v/rG2dpvYiVXXytINQaUuCmqHFK0cPpWYBtHmMtW91291TO9/K1Ax8KF1V
	diEK96e/DHw==
X-Received: by 2002:a05:6214:1248:b0:8cc:f72d:6a5 with SMTP id
 6a1803df08f44-90747ccc65dmr58824716d6.36.1784057422845; Tue, 14 Jul 2026
 12:30:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714102632.25093-1-alyssongleyson.dev@gmail.com>
In-Reply-To: <20260714102632.25093-1-alyssongleyson.dev@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 14 Jul 2026 16:30:11 -0300
X-Gm-Features: AUfX_mw0umFdOCYFKa8Pdf0UxppuGMaNU_IKFntvLjQ_CXBt9mozP9eW222_rBw
Message-ID: <CAMAsx6cdfyQ7t3pR_=pd7AJC+PR6VSEUXSn4xKu3uzb4hES3RQ@mail.gmail.com>
Subject: Re: [PATCH] docs: pt_BR: process: Translate the security-bugs.rst
To: =?UTF-8?Q?=C3=81lysson_Gleyson_da_Silva?= <alyssongleyson.dev@gmail.com>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 14 de jul. de 2026 =C3=A0s 07:28, =C3=81lysson Gleyson da Silva
<alyssongleyson.dev@gmail.com> escreveu:
>
> +++ b/Documentation/translations/pt_BR/process/security-bugs.rst
> @@ -0,0 +1,370 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _securitybugs_pt_BR:

=C3=81lysson, as a standard for the Portuguese documentation, if you need
to include a label
please place 'pt_BR' at the beginning to maintain consistency with the
translations we
already have.

> +  * **descri=C3=A7=C3=A3o do problema**: uma descri=C3=A7=C3=A3o detalha=
da do problema, com rastros
> +    mostrando sua manifesta=C3=A7=C3=A3o, e por que voc=C3=AA considera =
o comportamento
> +    observado como um problema no Kernel, =C3=A9 necessa=C3=A1ria.

I noticed a small typo in the 'descri=C3=A7=C3=A3o do problema' section: th=
e
word 'necessa=C3=A1ria'
 is misspelled and should be corrected to 'necess=C3=A1ria'.

> +  * **reproduzir**: os desenvolvedores precisar=C3=A3o ser capazes de re=
produzir o
> +    problema para considerar uma corre=C3=A7=C3=A3o como eficaz. Isso in=
clui tanto uma
> +    maneira de acionar o problema quanto uma maneira de confirmar que el=
e
> +    ocorre. Ser=C3=A1 necess=C3=A1rio um reprodutor com depend=C3=AAncia=
s de baixa
> +    complexidade (c=C3=B3digo-fonte, script de shell, segu=C3=AAncia de =
instru=C3=A7=C3=B5es,

I noticed a typo in the 'reproduzir' section: 'segu=C3=AAncia' should be
corrected to 'sequ=C3=AAncia'.

> +Al=C3=A9m disso, as seguintes informa=C3=A7=E1=BA=BDos s=C3=A3o altament=
e desej=C3=A1veis:

In the section starting with 'Al=C3=A9m disso...', the word 'informa=C3=A7=
=E1=BA=BDos'
is misspelled; please correct it to 'informa=C3=A7=C3=B5es'.

> +Uma dificuldade para a maioria dos relatores de primeira viagem =C3=A9 d=
escobrir a
> +lista certa de destinat=C3=A1rios para enviar um relat=C3=B3rio. No kern=
el Linux, todos
> +os mantenedores oficiais s=C3=A3o confi=C3=A1veis, portanto as consequ=
=C3=AAncias de incluir
> +acidentalmente o mantenedor errado s=C3=A3o apenas um pequeno ruido para=
 essa
> +pessoa, ou seja, nada dram=C3=A1tico.

One small typo catch in the 'Identificando contatos' section: the word 'rui=
do'
is missing an accent and should be corrected to 'ru=C3=ADdo'.

I also noticed a few other grammatical and punctuation errors
throughout the document that need attention:

'gostariamos': Should be 'gostar=C3=ADamos' (missing accent).
'rel=C3=A1torio': Should be 'relat=C3=B3rio' (incorrect accent).
'A propor': Should be 'Ao propor' (requires a preposition change for
this context).
'=C3=88 =C3=BAtil': Should be '=C3=89 =C3=BAtil' (incorrect accent).
'=C3=B2rg=C3=A3o': Should be '=C3=B3rg=C3=A3o' (incorrect accent).
