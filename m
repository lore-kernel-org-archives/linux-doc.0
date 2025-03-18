Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88CC1DB951
	for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 05:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742276426; cv=none; b=hWCVDJk8pl3VP0MOTH7XrWj04A/Rgia2rpqx/SyGRtPfl5UpyBFRNWQGpyjAbpS1g2OQaShtscO+bjp68URyHeAl3cpXJ4yi3k7K0plSv7Ira65kFtnPA9vApIEYWdgE6o2rwVZrlvMj+GqoA2UIz5v+liFjGExvlf2nWDfGrC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742276426; c=relaxed/simple;
	bh=ZL8FKDpEnMtL+RZre3/L8uKFqL9Omy3jYj4PnomvmhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O0GOD8bo75OHKAS1Q/Ftc8FYFAm33YUxbhOfenLcqVJAX+hCYQqeDfRQV9t1zGwkm7OK4Zu2Ik5SyGIDY3DNWQmLgVWIUQYeHNfy185N6R86z4HcgLMxdhUERmZslPuYV2rzLOpPkTk235yBSRPjsybApNaWGqb3XSN5ExXDEM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLt0Tudp; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLt0Tudp"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5b572e45cso9983805a12.0
        for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 22:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742276423; x=1742881223; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqOzAh5A7+rNelIsm8ojRXmPTHXMQlaOuFGyC9AFPD8=;
        b=lLt0TudpimrfNSgepwSXuQOBCwARdmPF9urZcu0RUs+eKg5pF/9torw16eY9vLg3Us
         +PJCU4LdaFmxWShQSIdMxiDmqpiD2smsxVrJ75RI+9yxYhEfRmdVGbzNI7sOoqcnNopi
         1XxAaQPyqZg3mqE0kjDmdxgBi/xhAjgca4uoxi4tjJ40q+BOQVA9yuof1pXvywsOAMUa
         U+t+hhumz5leMYE8n9+4kGwOfaHjagQcmcIFhYRZ/ch1m52TfrnjYxGEkaUH61LEAI68
         fC/Y9XcrpoMiQ2+PPyGw/by+TFHJ2m0ANf5+mavWHQnA3DgZ73C3sBeUN6rf0FlcLqhe
         tFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742276423; x=1742881223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sqOzAh5A7+rNelIsm8ojRXmPTHXMQlaOuFGyC9AFPD8=;
        b=qz3i7vD1lJiIDOJvPcr7anFvaN4fjyQxJFSIfACLGlgcXohJSb+gj+X+AxsF+z9JE4
         Ctzk2eucJrwPBJtbxX3UtRT0gE7SO1zR7yNaA2r/28vmGqjlr6rOnQoG7K5OCfTzuLj4
         A/SN14xqCrBxriGQhb37KfPYLv1Y6dA6a9ruTiSzSPHRJV3VBgvkGuhtqwdp2mQ6cHEn
         xWHMJjEpX28k93Qe39zj4EoIWjhw3t0euHZywmoyli5k6y76+OJ+RV1DlW08rrHNyxlb
         A8cbjNWdO2HIy4SrTUEuxaeaosqKYSi7uv1Uj256FbsekTy1x65jYZb9N9Pcv/i2dxOV
         dwmA==
X-Forwarded-Encrypted: i=1; AJvYcCVryZa0m5CT51GJtITDWR4ShfB7eKKBiPuX5/D7k05+9kTJCX5XJ7a3aFC0r7Szci5GLGgzFbTHybw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFcwEbwsUPZ6KvTd3AHlG2ZIMkk0AlsosbjfyQqw0H/V1hSGB5
	5Z5ttJkpuqP9hCLxhjXBZo791TlbzzAUE5GrNldJyANka54BcVj3kzhcuQ1tHB8nkt56Z0V9bgH
	SlU2fqy/xYXRcGTlYVegPcddrFHc=
X-Gm-Gg: ASbGncvOi5gDuGdpWyqo8OWGHQNP/svf7rtqHiYgKkNGJdfYBlhZO1eGbDLdMa6q5SU
	g29DLhHhNDwsSPjBE+dA9RkVnDg9kJbxOg+3GtKgmdJEdSEa8lpbC8+2pcNUvjU1/JZxE4DY+3h
	rbbzQfAOi8Es38xWNj05iT1fZB7w==
X-Google-Smtp-Source: AGHT+IGv3XvU3SZJqygp1zlZgnaZ6eFamCY03vUDwgwuwWizrTVGXOlyGi4fWQdG/JMnYmMD4T77PDbd6i/fWKZXH+Q=
X-Received: by 2002:a05:6402:2551:b0:5e7:b015:c636 with SMTP id
 4fb4d7f45d1cf-5e89f24f212mr15777997a12.6.1742276423028; Mon, 17 Mar 2025
 22:40:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250312024226.14804-1-zhaoshuo@cqsoftware.com.cn> <98bf374e-7e29-4aa5-ab79-1927b6e20385@linux.dev>
In-Reply-To: <98bf374e-7e29-4aa5-ab79-1927b6e20385@linux.dev>
From: Alex Shi <seakeel@gmail.com>
Date: Tue, 18 Mar 2025 13:39:46 +0800
X-Gm-Features: AQ5f1JoGTCbJtAacFP8h4GSgZjYrXJf5dEmruSV6uIo2Q0bbmSattt2mnZHgpQI
Message-ID: <CAJy-AmkWarpb=x9wsDDrFe0d_n2i+tW6LzDEYmBHRti9mPaouQ@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: Add security lsm-development Chinese translation
To: Yanteng Si <si.yanteng@linux.dev>
Cc: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>, alexs@kernel.org, corbet@lwn.net, 
	zhaoyuehui@cqsoftware.com.cn, zhangwei@cqsoftware.com.cn, 
	maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I can't apply it to
git@gitolite.kernel.org:pub/scm/linux/kernel/git/alexs/linux.git
docs-next, could you rebase the patch and resend for next version?

Thanks!

Yanteng Si <si.yanteng@linux.dev> =E4=BA=8E2025=E5=B9=B43=E6=9C=8818=E6=97=
=A5=E5=91=A8=E4=BA=8C 09:44=E5=86=99=E9=81=93=EF=BC=9A
>
>
> =E5=9C=A8 3/12/25 10:42 AM, Shuo Zhao =E5=86=99=E9=81=93:
> > Translate .../security/lsm-development.rst into Chinese.
> >
> > Update the translation through commit 6d2ed653185b
> > ("lsm: move hook comments docs to security/security.c")
> >
> > Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
>
> Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
>
>
> Thanks,
>
> Yanteng
>
> > ---
> >   .../translations/zh_CN/security/index.rst     |  2 +-
> >   .../zh_CN/security/lsm-development.rst        | 19 ++++++++++++++++++=
+
> >   2 files changed, 20 insertions(+), 1 deletion(-)
> >   create mode 100644 Documentation/translations/zh_CN/security/lsm-deve=
lopment.rst
> >
> > diff --git a/Documentation/translations/zh_CN/security/index.rst b/Docu=
mentation/translations/zh_CN/security/index.rst
> > index 78d9d4b36dca..05d24e3acc11 100644
> > --- a/Documentation/translations/zh_CN/security/index.rst
> > +++ b/Documentation/translations/zh_CN/security/index.rst
> > @@ -18,6 +18,7 @@
> >      credentials
> >      snp-tdx-threat-model
> >      lsm
> > +   lsm-development
> >      sak
> >      self-protection
> >      siphash
> > @@ -28,7 +29,6 @@
> >   TODOLIST:
> >   * IMA-templates
> >   * keys/index
> > -* lsm-development
> >   * SCTP
> >   * secrets/index
> >   * ipe
> > diff --git a/Documentation/translations/zh_CN/security/lsm-development.=
rst b/Documentation/translations/zh_CN/security/lsm-development.rst
> > new file mode 100644
> > index 000000000000..cdd0aa03e089
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/security/lsm-development.rst
> > @@ -0,0 +1,19 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +.. include:: ../disclaimer-zh_CN.rst
> > +
> > +:Original: Documentation/security/lsm-development.rst
> > +
> > +:=E7=BF=BB=E8=AF=91:
> > + =E8=B5=B5=E7=A1=95 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Linux=E5=AE=89=E5=85=A8=E6=A8=A1=E5=9D=97=E5=BC=80=E5=8F=91
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +=E5=9F=BA=E4=BA=8E https://lore.kernel.org/r/20071026073721.618b4778@l=
aptopd505.fenrus.org=EF=BC=8C
> > +=E5=BD=93=E4=B8=80=E7=A7=8D=E6=96=B0=E7=9A=84LSM=E7=9A=84=E6=84=8F=E5=
=9B=BE=EF=BC=88=E5=AE=83=E8=AF=95=E5=9B=BE=E9=98=B2=E8=8C=83=E4=BB=80=E4=B9=
=88=EF=BC=8C=E4=BB=A5=E5=8F=8A=E5=9C=A8=E5=93=AA=E4=BA=9B=E6=83=85=E5=86=B5=
=E4=B8=8B=E4=BA=BA=E4=BB=AC=E4=BC=9A=E6=9C=9F=E6=9C=9B=E4=BD=BF=E7=94=A8=E5=
=AE=83=EF=BC=89=E5=9C=A8
> > +``Documentation/admin-guide/LSM/`` =E4=B8=AD=E9=80=82=E5=BD=93=E8=AE=
=B0=E5=BD=95=E4=B8=8B=E6=9D=A5=E5=90=8E=EF=BC=8C=E5=B0=B1=E4=BC=9A=E8=A2=AB=
=E6=8E=A5=E5=8F=97=E8=BF=9B=E5=85=A5=E5=86=85=E6=A0=B8=E3=80=82
> > +=E8=BF=99=E4=BD=BF=E5=BE=97LSM=E7=9A=84=E4=BB=A3=E7=A0=81=E5=8F=AF=E4=
=BB=A5=E5=BE=88=E8=BD=BB=E6=9D=BE=E7=9A=84=E4=B8=8E=E5=85=B6=E7=9B=AE=E6=A0=
=87=E8=BF=9B=E8=A1=8C=E5=AF=B9=E6=AF=94=EF=BC=8C=E4=BB=8E=E8=80=8C=E8=AE=A9=
=E6=9C=80=E7=BB=88=E7=94=A8=E6=88=B7=E5=92=8C=E5=8F=91=E8=A1=8C=E7=89=88=E5=
=8F=AF=E4=BB=A5=E6=9B=B4
> > +=E6=98=8E=E6=99=BA=E5=9C=B0=E5=86=B3=E5=AE=9A=E9=82=A3=E4=BA=9BLSM=E9=
=80=82=E5=90=88=E4=BB=96=E4=BB=AC=E7=9A=84=E9=9C=80=E6=B1=82=E3=80=82
> > +
> > +=E6=9C=89=E5=85=B3=E5=8F=AF=E7=94=A8=E7=9A=84 LSM =E9=92=A9=E5=AD=90=
=E6=8E=A5=E5=8F=A3=E7=9A=84=E8=AF=A6=E7=BB=86=E6=96=87=E6=A1=A3=EF=BC=8C=E8=
=AF=B7=E5=8F=82=E9=98=85 ``security/security.c`` =E5=8F=8A=E7=9B=B8=E5=85=
=B3=E7=BB=93=E6=9E=84=E3=80=82
