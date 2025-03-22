Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948FD19ADB0
	for <linux-doc@vger.kernel.org>; Sat, 22 Mar 2025 13:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742648926; cv=none; b=l4yWDjuoN++rs6CCUej2dBj/97gM2ZUeCu4vCkeokQ+0R8a74YuL+xveBSzVNJYA9jRVdTYdTXZbECzbCEFLwVIkEEWIyiNXxbBElVMtoDz42ilzR6zKAcPdfu1pRxOit2Z5ptrcxkEvq9oiiS3ltLsHHlCDfS6R0HN9NaU4yNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742648926; c=relaxed/simple;
	bh=FgDlhtLgg05mvDD7kbGrgv5xWXoYzJtEFUZT5TeL54U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hge/FbX5eXsU5PlhzPQ5K5gozfvNXtej1rSEWfqMUa26fWA3kr6+WbEAISdqZnVl59gfrDDvff274fqBMQfe8kcXmyiVjz5gBBgwmS8KMmfmVkzOAsJZ/6LpGRE3UiA76BrYFjiXLUKKTSu0k18+DOorf8f5hFVPh6iJ+Je7Rck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lR9HXQtJ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lR9HXQtJ"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso5123591a12.3
        for <linux-doc@vger.kernel.org>; Sat, 22 Mar 2025 06:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742648923; x=1743253723; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15EU3V8jLVS843Npj3ZiK8ADuUfY5n1y9NCvxuCsKi8=;
        b=lR9HXQtJJ39I8FxX922ODtF4TX+02bkTUaujBMr9JvLt9lMeEtSZmCFpWyuJJ041TZ
         N5h+B9B51FZCHqnrIxnyUHyk3OZh+n6xE24+SouXxrCuAMYu+pn0v430Gn7x50ZNMd+N
         RyjcMPt9NJ10fO2wARwW2uTbNKE+nBV1gaQ67H/gAKJ27sB38iaTXofhqk3yReawWjjQ
         IzSngx4s/eBtocAiwBqwrWm0+u0zKgbSI2S1XfYHoPlPX1cI4OKCjVpBISrnA2iF2HRo
         YqqcoL5nPAXfeWOAkSxxcPNOizMP2yGw0sMe/MF6jRRS7a8fVJFV2oNpRBZEdG2Lefn6
         INAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742648923; x=1743253723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15EU3V8jLVS843Npj3ZiK8ADuUfY5n1y9NCvxuCsKi8=;
        b=MvNM2qiTznSOTENpsJ+8Yra5dG+MbdCyfqZx0oWvt6snhzLqGmNaiNYxSSoDNmqpf6
         LQTmPRynGj1vY8DbjWBDNxy10Jf5gJPE6TV/mwRlmAGV8Od6+DjQGBG+cDd2XHukLtbx
         3f/Pfvcwl7Gy4WDwoWZ1WbxTtz3xUlw11FQGfPSN3UOA7rj1al0X54WqWoGQTdrMKNob
         4JE+gnqPk7lHTAVObqAjmcZVbPeg9oOQuJhNxvZH7vQHPh52rs6L+MqVNfKUs1lLL0En
         lVQ/gfhGCzoCcBSo0Vt/PxXcH+q68PZqUfLAlYWTmm8S8EI1x/fn+Nfr2B2fdQiGUo6A
         QI3A==
X-Forwarded-Encrypted: i=1; AJvYcCXdzBJDcNM4u6q3iNDeQ+vT37LaE3fbrHITVztmymuMmxb3VFRC6T86etMr4JidrKK8pRPFrleJN4k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6iXRDR64waxUDu0DX07dbuxr/P5eKykP2wg7SDJ0M5s/DaGmC
	5ABlTDO+hA+NizalF4ITg128VOZgj6SE520RFonhFrnRqZ96D+sYCRMK4TRLlQ80J8RetanOp1v
	jHc67zfn90lQskhw9eKAlvhYo5+c=
X-Gm-Gg: ASbGnctvFvQuH0hTGMHlkiLC23/tZ2ZbEMDNCB5o+3jSWxvlbZD6oG9HKzAIBGvmglD
	DZAp99C8jJpTw7yffRf+4u/IiuALjdWH4D8z8H/e54H0GlZSuCObBLjtdsKOeDq7K037VJsk8L9
	pn/eKHk1H4xvjSV6whR1bcB6FiFA==
X-Google-Smtp-Source: AGHT+IGEHVUs428Y4Za1ZxNq8TQXV8EwYVoks2amnNtQQYllF/Ek0StLAO2VPnX1qNx1rn8xXMr8cTOn2Bs5xO/eG+k=
X-Received: by 2002:a05:6402:440a:b0:5e5:ca1b:c425 with SMTP id
 4fb4d7f45d1cf-5ebcd4680c0mr5678779a12.17.1742648922359; Sat, 22 Mar 2025
 06:08:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1742542887.git.zhaoshuo@cqsoftware.com.cn>
 <1d7b8c13052f008def17b2ad923fc83bc53e32e1.1742542887.git.zhaoshuo@cqsoftware.com.cn>
 <be3aa70b-a9c6-4a37-8b98-29c84177a3ff@linux.dev>
In-Reply-To: <be3aa70b-a9c6-4a37-8b98-29c84177a3ff@linux.dev>
From: Alex Shi <seakeel@gmail.com>
Date: Sat, 22 Mar 2025 21:08:05 +0800
X-Gm-Features: AQ5f1Jp0R6hdEbCyebvbLCRQrX41YpzQnpusN4JvKqGNo1BGTHdmrdjUUhvZm7g
Message-ID: <CAJy-AmkA92jtrkpC9=B1Oo+U4iCKh1W70F4HgHYurPTo=DsGag@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs/zh_CN: Add security lsm-development Chinese translation
To: Yanteng Si <si.yanteng@linux.dev>
Cc: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>, alexs@kernel.org, corbet@lwn.net, 
	zhaoyuehui@cqsoftware.com.cn, zhangwei@cqsoftware.com.cn, 
	maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

your patchset can't be applied, it isn't applicable.

You need to them as a patchset in one thread, with git
format-patch/send-email tool that is best.


Yanteng Si <si.yanteng@linux.dev> =E4=BA=8E2025=E5=B9=B43=E6=9C=8821=E6=97=
=A5=E5=91=A8=E4=BA=94 18:02=E5=86=99=E9=81=93=EF=BC=9A

>
>
> =E5=9C=A8 3/21/25 3:49 PM, Shuo Zhao =E5=86=99=E9=81=93:
> > Translate .../security/lsm-development.rst into Chinese.
> >
> > Update the translation through commit 6d2ed653185b
> > ("lsm: move hook comments docs to security/security.c")
> >
> > Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
>
> Where has my Reviewed-by tag gone?
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
