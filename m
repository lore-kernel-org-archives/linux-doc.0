Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B98913A3ED
	for <linux-doc@vger.kernel.org>; Wed, 22 Jan 2025 01:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737510232; cv=none; b=BHJtK/HeRwxktMuLo/IH6G2UaL7Wbrx6piz3uFqcKRwpYODFgA2qZfUCDzMrMOGeAYhGmxvnBMxUZRzCsX7D2CVecsXVpU3o24aTbR0c3+qFTKhd0U7rwb9UuzpS14an6ThtUaQmMW4ILmGRriKONsLKPale5qm7OLeU1fsIrWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737510232; c=relaxed/simple;
	bh=jUYM1HOWy2Oy/vaZgaoWa834P0PHo5dWg7UOGf+PrP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I1THkOneM0XIF6JAQvkC0hsXytpzGLTAGy0X2iq5mA7eox0iGNex4h3lQQWRoYIxcRbe8ulb4YvsrTs8/OfrYsyPFgicpmNeBUt89u2+2dZVlkQPg8sXdFIja+tEi+Pzv7BqG7N+trE9kfwklPV3O6KahIZZX10G4ofeirJJZi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJxTlVmX; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJxTlVmX"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d3bbb0f09dso10954303a12.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Jan 2025 17:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737510229; x=1738115029; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XzsTksaRzbCRdu4GPPH9UOLIhTocVRyQPfcvlestC5o=;
        b=NJxTlVmXROt9y0str2fuiQ/KXmFuL1tLFO5pIndL/ue9GenE3HDugGLFIkaa3wKk3A
         tqAqNPtm3UCGNqqoxUi3csBVo4E7Ju+k+iEHn2+aK2djB+G/HffKfBy1XYBN4QKFHDig
         U2gFA91IOAnbOQMMuUF3FukwRnUCp4enWDXTc4wkURmkamFJRAMW6ozfWsuKl+nxrbNN
         DUa+MD7SZMHCiGO4vQQKxw+97UxKzlN8TAAUrnsT6V533nmuiFIpq+AqqW+vSS70U91P
         JSVWQqP7Qu89CwNYd8EhXk4vBTFeJ1vz4yCU4XUqGxEXrJBwVP7gQKa+9bMlAJYGD5cx
         wKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737510229; x=1738115029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XzsTksaRzbCRdu4GPPH9UOLIhTocVRyQPfcvlestC5o=;
        b=BroOer9dh8MgSIHeXuKBGFb4wkj7S+DYHjuZt/eFz96A5xOzhLsqTrZnfctZvWbG2H
         uTfYIVbKY9bRgWl9OC7RUwGwtrjnOZPePJ6xMrqQr3R/nThsar+o0CNLxMp6oZVbVkbw
         i/HZkQT7Z+LhS7hujj4p+kjhD4o9B6/AULtdyBYS41oMnbDy2O9Q+ir9j7LAxriz6PYw
         eI+L+o9SDQ36kNwqxnrffRxJslrCm1mCsBclm5VoIDy58p6I2S2swhh6kdVw/J/Y+gSd
         8IhxbOaCeaHiZhqQodF+iXoHsY79JhWMyZ12oudbGJrCRYEhY9+SRz18/ifpcm8mxu5y
         Z1zA==
X-Forwarded-Encrypted: i=1; AJvYcCXOHg73aprnSMwNpHaMx4umEx9+B6ApolgS7NlRPP6yv5LApHHyHfJ+Ue/7R9XJcexHKM/P62kJCLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzItCxWZiMrOHHTX9N+9n2CaL3tkHXstlTdGvyNxAyV2mbypFkD
	M3+X4gRpF3izqpwN3CY86Ze4jYYv2yY4Z3TYWO2uuEOpW868HYzPUvJ0aRlgCFHFxVKjGEne9Ml
	kT5FxIK4hSy9GsqMRjgcFpEEE3lM=
X-Gm-Gg: ASbGnctpuvInKVHCbIikLwckhPT46PC7f0+P6g+TqjW6npL8hm1uvos5Nl5RxDSQr9s
	7V33P5UTWKZsMMHbXeQ+qH9jwX/S/GE4y17ZmtgNKSB7JbDqb/Uo=
X-Google-Smtp-Source: AGHT+IELo7KellCAzmrRRcksSdVdPD1PDn8KnmVk3zd7rUMtPLRhzKb4fX1OjpM3KFwdMyUXClvZNiORVVRkZWhUEhE=
X-Received: by 2002:a17:906:f59a:b0:aaf:87e6:8fe3 with SMTP id
 a640c23a62f3a-ab38b0b7f0bmr1739129966b.6.1737510228575; Tue, 21 Jan 2025
 17:43:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1737354981.git.zhaoshuo@cqsoftware.com.cn> <ff15a31080a2671da3e114fe95f2a19e294367bc.1737354981.git.zhaoshuo@cqsoftware.com.cn>
In-Reply-To: <ff15a31080a2671da3e114fe95f2a19e294367bc.1737354981.git.zhaoshuo@cqsoftware.com.cn>
From: Alex Shi <seakeel@gmail.com>
Date: Wed, 22 Jan 2025 09:43:12 +0800
X-Gm-Features: AbW1kvZg0hsUMoXrrrahnU6IgXBsXDlQfqNEJEP2KhoGTrE6MC_6YxHDrysJPJ0
Message-ID: <CAJy-AmmkXKX70peEf-bK_V0FHm8q8dtqHL-kUPx+wngEfv_Dsw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] docs/zh_CN: Add tpm index Chinese translation
To: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net, 
	zhaoyuehui@cqsoftware.com.cn, zhangwei@cqsoftware.com.cn, 
	maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Translation is fine for me.

Reviewed-by: Alex Shi <alexs@kernel.org>

Shuo Zhao <zhaoshuo@cqsoftware.com.cn> =E4=BA=8E2025=E5=B9=B41=E6=9C=8820=
=E6=97=A5=E5=91=A8=E4=B8=80 14:51=E5=86=99=E9=81=93=EF=BC=9A
>
> Translate .../security/tpm/index.rst into Chinese
>
> Update the translation through commit 1d479e3cd652
> ("Documentation: tpm: Add TPM security docs toctree entry")
>
> Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> ---
>  .../translations/zh_CN/security/index.rst     |  2 +-
>  .../translations/zh_CN/security/tpm/index.rst | 21 +++++++++++++++++++
>  2 files changed, 22 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/security/tpm/index.r=
st
>
> diff --git a/Documentation/translations/zh_CN/security/index.rst b/Docume=
ntation/translations/zh_CN/security/index.rst
> index 38e9ce7cf471..0aacecabf0c0 100644
> --- a/Documentation/translations/zh_CN/security/index.rst
> +++ b/Documentation/translations/zh_CN/security/index.rst
> @@ -19,6 +19,7 @@
>     lsm
>     sak
>     siphash
> +   tpm/index
>     digsig
>     landlock
>
> @@ -29,6 +30,5 @@ TODOLIST:
>  * lsm-development
>  * SCTP
>  * self-protection
> -* tpm/index
>  * secrets/index
>  * ipe
> diff --git a/Documentation/translations/zh_CN/security/tpm/index.rst b/Do=
cumentation/translations/zh_CN/security/tpm/index.rst
> new file mode 100644
> index 000000000000..a3cfb2d11c86
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/security/tpm/index.rst
> @@ -0,0 +1,21 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/security/tpm/index.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> + =E8=B5=B5=E7=A1=95 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=E5=8F=AF=E4=BF=A1=E5=B9=B3=E5=8F=B0=E6=A8=A1=E5=9D=97=E6=96=87=E6=A1=A3
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. toctree::
> +
> +TODOLIST:
> +*   tpm_event_log
> +*   tpm-security
> +*   tpm_tis
> +*   tpm_vtpm_proxy
> +*   xen-tpmfront
> +*   tpm_ftpm_tee
> --
> 2.47.1
>
