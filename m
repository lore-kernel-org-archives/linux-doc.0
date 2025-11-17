Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3987A1E9B1A
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 05:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763357207; cv=none; b=Zcr2pdAc1TC57lzKF2pfXCmrpLK1c84Ys6id9BTuosWeCM5Wo2RaoAX25Rvwfcza9sKZZ7fRT3lEJT097Yy9PJmCk7swDzyknS5o8LoETcJtNZWqJ36wcKj9vSUPqHGfgk+Cxrw690oB6XbGdKVECikUijz4/KW1yfBbtAXzD8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763357207; c=relaxed/simple;
	bh=VZysm0N+a3WVmcZ8Le2hk1S55Q+WIa8+AMtZfgyiu2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D9jJHmUwUxnSFhRz3lSg91S6DbZtIENw+1vqK3eWBISWTrj478/R+/pK7TsW1rX+T5tA7LzSenUIJpvaeOrmNm5VvXQUIMLOWZ64MqJGSezK6SDDqlNu7jbnnBw0oy4e7ZCm5L4+cTUDxLDdpyY7E1XqVcMSbOeF2EAysJaMxMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9tqJL+6; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9tqJL+6"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so581189666b.3
        for <linux-doc@vger.kernel.org>; Sun, 16 Nov 2025 21:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763357203; x=1763962003; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T60J/9DPfSOtw35T83Irgreu/zouV8vRwt3ub5mqVN8=;
        b=d9tqJL+6tx4qm+eP4DuB9pEqlS2tXC6PaYNUQbFt7WtJVmMaaO4fwi/iyXp39kcQPY
         dnXXnhMCrUFgCaCz+cLecCLIFUl7WEufFCwoYU7tyEXr6V2zJHSm7Z5DKLn05My/aEoC
         HwPrpX/WCinrHY68fhok330HwTH5DUFTPypo/Zgijeeqyogibu50jHKr6DN0bADknz6O
         zDp/NW/7yFkyduiA0DlnsR5wwfPcyoCEks8sFgPeFMgDQ5N1ktQt9YSZoeMH6ix6o3BM
         segW3uKO+zAtEPnHXcNFImjPKISdxfigS26j/zwK1+qoaLeAYUGbcdMYwopbdpCLM/zW
         GrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763357203; x=1763962003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T60J/9DPfSOtw35T83Irgreu/zouV8vRwt3ub5mqVN8=;
        b=fg+sJme8PzfuRZdjGonYx/MIONpnJtN7O0AhafjxKLmvYvU/xw/MZ8YvNrGm6NPkO7
         CQPz64PW5NulVe9DavMRe5EKyt3PTk8OQN9F0UEjjeLI0rCMAWdGAV8MGlsjPXhc7T2f
         9dBEi7SVkampD6XaA00nfuB7WxSymzZW7SNJACkv8AFuHd2de+j1l7uFdLukuzH8hdie
         0jDEt64Iz/ATbaFlvV7oKHc0K+/kjv+Mcfzo4naKVYPwsnGoVZHXm6KK92CXMN8dHiQV
         nd7DO00QFvvapAd4PlQykm7+spBetza/eT3+uHaWvdT+k8TEsxqaSiJxlRz5lewdNGwf
         ywYw==
X-Forwarded-Encrypted: i=1; AJvYcCWsqTl97y7AVa4cF4lFxKNKM+OLmPnGDXobQGLpe373hRBJt6GMTraGr3mxtKwsnq6MrZ3vea8Ha58=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgL/MsXm7UGp/IYTlngoEP9W15ZRqP2MDHmGiFmOt5AfyMnbSw
	CJYI/3c1GJTXLk+1M/5ya3jL+d8OsvmuLKvIEQR1NOwpZeW44bAfloHZcyP+DyT23WfFqktCYsB
	s5B2R0kJvI7p1AQ5JyIG71RpgJeX7ZT0=
X-Gm-Gg: ASbGncs3e5abe288y2MtYoFVLfcuzTo2dEE1YF02GZCxen6pmlqt7oBxENMz/HrMreX
	j2jf2lv0IegF/gFcWmVO418mUDhEo+DISUOMpy3/BssriqSQpvxRt+Qdk9grZo7vzOaTqE6uK+d
	Wj/YGcBke2ICOM0Tcwcatzn/Fr1xp8/C3xO4Iyz6aw7qzr2jNZLI3pvGk7blQaKwzQ9BltDsXvj
	HHJ+EfNJgXiVmk/xmfoURonVSU0GWXXyAfPnwFYU5n0QSzus8OQgDNZ5yiybVwrT/5jXCDmwE5d
	jKjD6g==
X-Google-Smtp-Source: AGHT+IH57UrqfjLE1M02miwqFOGlIUAnt/xIUz8fV+n/IT6BRCwF4vnqg210EO42lNrjp/Ry/oAXxIZT4kfHWa3F6uk=
X-Received: by 2002:a17:907:6e8b:b0:b73:4c5e:eb5f with SMTP id
 a640c23a62f3a-b7367bad2b5mr1064983966b.37.1763357203251; Sun, 16 Nov 2025
 21:26:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251116085102.1740613-1-kezijie@leap-io-kernel.com> <20251116085102.1740613-2-kezijie@leap-io-kernel.com>
In-Reply-To: <20251116085102.1740613-2-kezijie@leap-io-kernel.com>
From: Alex Shi <seakeel@gmail.com>
Date: Mon, 17 Nov 2025 13:26:06 +0800
X-Gm-Features: AWmQ_bmBJm1KVk6eQ2hdX5p0Y6rtTz-uYekD4HXhJHurLe03Xvnk47u4jRrEf_c
Message-ID: <CAJy-Amm2cPTvaBKe_XBVLOpxWUQY6211iOi7BBNMhM4dwj22MQ@mail.gmail.com>
Subject: Re: [PATCH] docs: zh_CN: scsi: fix broken references in scsi-parameters.rst
To: ke zijie <kezijie@leap-io-kernel.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, corbet@lwn.net, 
	linux-doc@vger.kernel.org, doubled@leap-io-kernel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, Thanks!

ke zijie <kezijie@leap-io-kernel.com> =E4=BA=8E2025=E5=B9=B411=E6=9C=8816=
=E6=97=A5=E5=91=A8=E6=97=A5 17:26=E5=86=99=E9=81=93=EF=BC=9A
>
> 0day CI reported several broken references under
> Documentation/translations/zh_CN/scsi/scsi-parameters.rst.
> These files do not exist under the translations directory.
> The correct references are the original English documents under
> Documentation/scsi/.
>
> This patch updates all broken paths accordingly.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202511130315.WOiKJQTu-lkp@i=
ntel.com/
> Signed-off-by: ke zijie <kezijie@leap-io-kernel.com>
> ---
>  .../translations/zh_CN/scsi/scsi-parameters.rst  | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/scsi/scsi-parameters.rst b/=
Documentation/translations/zh_CN/scsi/scsi-parameters.rst
> index 53cdc3094a9a..ace777e070ea 100644
> --- a/Documentation/translations/zh_CN/scsi/scsi-parameters.rst
> +++ b/Documentation/translations/zh_CN/scsi/scsi-parameters.rst
> @@ -31,16 +31,16 @@ SCSI=E5=86=85=E6=A0=B8=E5=8F=82=E6=95=B0
>                         =E8=AF=B7=E6=9F=A5=E9=98=85 drivers/scsi/advansys=
.c =E6=96=87=E4=BB=B6=E5=A4=B4=E9=83=A8=E3=80=82
>
>         aha152x=3D        [HW,SCSI]
> -                       =E8=AF=B7=E6=9F=A5=E9=98=85 Documentation/transla=
tions/zh_CN/scsi/aha152x.rst=E3=80=82
> +                       =E8=AF=B7=E6=9F=A5=E9=98=85 Documentation/scsi/ah=
a152x.rst=E3=80=82
>
>         aha1542=3D        [HW,SCSI]
>                         =E6=A0=BC=E5=BC=8F=EF=BC=9A<portbase>[,<buson>,<b=
usoff>[,<dmaspeed>]]
>
>         aic7xxx=3D        [HW,SCSI]
> -                       =E8=AF=B7=E6=9F=A5=E9=98=85 Documentation/transla=
tions/zh_CN/scsi/aic7xxx.rst=E3=80=82
> +                       =E8=AF=B7=E6=9F=A5=E9=98=85 Documentation/scsi/ai=
c7xxx.rst=E3=80=82
>
>         aic79xx=3D        [HW,SCSI]
> -                       =E8=AF=B7=E6=9F=A5=E9=98=85 Documentation/transla=
tions/zh_CN/scsi/aic79xx.rst=E3=80=82
> +                       =E8=AF=B7=E6=9F=A5=E9=98=85 Documentation/scsi/ai=
c79xx.rst=E3=80=82
>
>         atascsi=3D        [HW,SCSI]
>                         =E8=AF=B7=E6=9F=A5=E9=98=85 drivers/scsi/atari_sc=
si.c=E3=80=82
> @@ -69,19 +69,19 @@ SCSI=E5=86=85=E6=A0=B8=E5=8F=82=E6=95=B0
>                         =E8=AF=B7=E6=9F=A5=E9=98=85 drivers/scsi/NCR_D700=
.c =E6=96=87=E4=BB=B6=E5=A4=B4=E9=83=A8=E3=80=82
>
>         ncr5380=3D        [HW,SCSI]
> -                       =E8=AF=B7=E6=9F=A5=E9=98=85 Documentation/transla=
tions/zh_CN/scsi/g_NCR5380.rst=E3=80=82
> +                       =E8=AF=B7=E6=9F=A5=E9=98=85 Documentation/scsi/g_=
NCR5380.rst=E3=80=82
>
>         ncr53c400=3D      [HW,SCSI]
> -                       =E8=AF=B7=E6=9F=A5=E9=98=85 Documentation/transla=
tions/zh_CN/scsi/g_NCR5380.rst=E3=80=82
> +                       =E8=AF=B7=E6=9F=A5=E9=98=85 Documentation/scsi/g_=
NCR5380.rst=E3=80=82
>
>         ncr53c400a=3D     [HW,SCSI]
> -                       =E8=AF=B7=E6=9F=A5=E9=98=85 Documentation/transla=
tions/zh_CN/scsi/g_NCR5380.rst=E3=80=82
> +                       =E8=AF=B7=E6=9F=A5=E9=98=85 Documentation/scsi/g_=
NCR5380.rst=E3=80=82
>
>         ncr53c8xx=3D      [HW,SCSI]
>
>         osst=3D           [HW,SCSI] SCSI=E7=A3=81=E5=B8=A6=E9=A9=B1=E5=8A=
=A8
>                         =E6=A0=BC=E5=BC=8F=EF=BC=9A<buffer_size>,<write_t=
hreshold>
> -                       =E5=8F=A6=E8=AF=B7=E6=9F=A5=E9=98=85 Documentatio=
n/translations/zh_CN/scsi/st.rst=E3=80=82
> +                       =E5=8F=A6=E8=AF=B7=E6=9F=A5=E9=98=85 Documentatio=
n/scsi/st.rst=E3=80=82
>
>         scsi_debug_*=3D   [SCSI]
>                         =E8=AF=B7=E6=9F=A5=E9=98=85 drivers/scsi/scsi_deb=
ug.c=E3=80=82
> @@ -112,7 +112,7 @@ SCSI=E5=86=85=E6=A0=B8=E5=8F=82=E6=95=B0
>                         =E8=AF=B7=E6=9F=A5=E9=98=85 drivers/scsi/sim710.c=
 =E6=96=87=E4=BB=B6=E5=A4=B4=E9=83=A8=E3=80=82
>
>         st=3D             [HW,SCSI] SCSI=E7=A3=81=E5=B8=A6=E5=8F=82=E6=95=
=B0=EF=BC=88=E7=BC=93=E5=86=B2=E5=8C=BA=E5=A4=A7=E5=B0=8F=E7=AD=89=EF=BC=89
> -                       =E8=AF=B7=E6=9F=A5=E9=98=85 Documentation/transla=
tions/zh_CN/scsi/st.rst=E3=80=82
> +                       =E8=AF=B7=E6=9F=A5=E9=98=85 Documentation/scsi/st=
.rst=E3=80=82
>
>         wd33c93=3D        [HW,SCSI]
>                         =E8=AF=B7=E6=9F=A5=E9=98=85 drivers/scsi/wd33c93.=
c =E6=96=87=E4=BB=B6=E5=A4=B4=E9=83=A8=E3=80=82
> --
> 2.25.1
>
