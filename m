Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F772641C3
	for <linux-doc@vger.kernel.org>; Sat, 20 Sep 2025 07:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758354745; cv=none; b=USiVnDeKrK4J6tzM2hxdXxyYk8DIB/RjmUrCvC/tmF0PV23ZKdjUGAVeyghkrhW10dFPLQ+6HDSYV7G2U0SziEqvSL4hAsHHA4MrGOO8PyBMoEVZRikSl733gZrYme6GZKS0yxyy69LQdhsOESuxgsa6jD+/7ZG1foMaCMgaRv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758354745; c=relaxed/simple;
	bh=EORm/MmkkV6KYPxNSogbZVzKarCphgAmqSRBVWNlOQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bFojB/tAIaE1FykgJPEFQ1ofgwdD8deC9JRL3PYbly4o3P4/ovyfBTMxewZuZRnArccQ11hatL1bfQosP/w0RggbJkYaXAcExuQSZOrMZujTyJloe4lEOts1j/qijTb6oarOl6KoOggAAKmZgefbTPMj9ntzlQwDmlpitrap4IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3uQqTf5; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3uQqTf5"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b2381c58941so331162766b.1
        for <linux-doc@vger.kernel.org>; Sat, 20 Sep 2025 00:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758354742; x=1758959542; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaKZucNV7zzQdecv/Ae85e2Ust+5AmXRhL626koXgfM=;
        b=K3uQqTf5II4Yj3q1I5ymddITvmcwmpeS13euPv02vbcaNMsd7ULDoeX9cmnAwudDqH
         2sDDN/EehTirdBTLjSyU4BULl4KDwSfDx1S77cvwqpgqhVaY0cJwJ6taf8J9+avYJDo3
         nMleE1MW30qrpIrlS8Y929HaByZ/V6sE6sa5x/pCYB5kp7dbANvhHUITCnlV0Er8427y
         8ZWI3YmyK20OsB+xpoWqXChHp7X3apB1u/M7rV1+8U7grIykYcEDRsn7HvftSQJb68YC
         Hvi2D/TuCM9+o1u++yAqZaW5EwhDxE9+I9QuwJzP4BrMvcp+UxNWWKqrswUHykrptisR
         PFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758354742; x=1758959542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yaKZucNV7zzQdecv/Ae85e2Ust+5AmXRhL626koXgfM=;
        b=RoftABfZN5NnWX07QI0FiPGvzdd6XsoiK98V70JTM6NgY+Osz6r9yZWE7NFAmTWMjz
         rsG1iY4AoP1hCsheewiwYNW4fqf9jLjw6iyn/T23On4gqxV7kTZcenpH1B6bw2xdnoc6
         rjX53qYzeb7ziFURwN5RxTyNwt7SSljafph3l0GMhPjwEpbDoQ1lHhylU1leoSFzeiO7
         1bg9f+XNon0M1SFP8Qg6J9Y4fFJMSQM/ij1iaxCU5gCB8l62Xo4Vf12hR7OBt1xoUwVr
         tutqtXMahI079OMCm00WqP3J001XAlFo3fCmLGFWAVbLPIVuFv/N814465SzOcjebDZL
         75dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAs+cKhd/4hRKt4C/FCZge/GdtbeICnPX30N1B0zvy3mKecRNADZ1p29JxRlUhjgKG9+sMIbEwIOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaIaHBQmbaxsT78c2yMM88WVcToQIdBtGOsT9jIJvnIwTh8UO7
	z6wA8t8MrRZNM6nQbWCCdXuc+E9qH8cmnlKeG0k13Mp9jHeCKrDn9zxGAssUY5NI70Cp2vRpw9i
	3IqJDwzDNQTfwV2J7Hm81I+v6ROR9uSY=
X-Gm-Gg: ASbGncsEVcZquI+jsZiqlHkt0Q9eJljdLNyd26exQ9mGphHECmAJestnpw+Dw5SluF0
	Qz/R+q/MkrL7xejPWo3FgIl0mtWZ1Eaml/QpL6Nv6IFQQD2YS5S0Q7ty0ujChmFspm3gbu/NcF7
	4g7Jnxsij1Rad30L5ut+DdEbqByxFsJv+jas9LI+7LCU3eWlBP0QRqUqtZnp/Dlri+cJTC0CxC2
	CZfnaSB984BYcrZxg==
X-Google-Smtp-Source: AGHT+IGZznelcYwI4gJcPf3ZFI96nxfCdFg+259eSDoI0okkp1F6NiXst8CwwEvBGCG2IRnI+HbLOAEYI60YEBkhEvM=
X-Received: by 2002:a17:907:8690:b0:b07:883c:e3e2 with SMTP id
 a640c23a62f3a-b24efe465cfmr607216066b.29.1758354742061; Sat, 20 Sep 2025
 00:52:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1757686158.git.doubled@leap-io-kernel.com>
In-Reply-To: <cover.1757686158.git.doubled@leap-io-kernel.com>
From: Alex Shi <seakeel@gmail.com>
Date: Sat, 20 Sep 2025 15:51:45 +0800
X-Gm-Features: AS18NWDJCvNDOTUY-pxn_X_DVGdyIObWFm8b4bBC88LYnSKS7k3rIWv3xB7VaQw
Message-ID: <CAJy-AmkJdY1V8uC8M2Z45m1=_zou8L+8z-Zi2D8AOhJSQapiFQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Add chinese translation for scsi
To: doubled <doubled@leap-io-kernel.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, corbet@lwn.net, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is it ok to pick, or someone like to give some comments?

Thanks
Alex

doubled <doubled@leap-io-kernel.com> =E4=BA=8E2025=E5=B9=B49=E6=9C=8814=E6=
=97=A5=E5=91=A8=E6=97=A5 21:02=E5=86=99=E9=81=93=EF=BC=9A
>
> This patch set adds chinese translations for the SCSI documentation.
>
> doubled (7):
>   docs/zh_CN: Add scsi/index.rst translation
>   docs/zh_CN: Add scsi.rst translation
>   docs/zh_CN: Add scsi_mid_low_api.rst translation
>   docs/zh_CN: Add scsi_eh.rst translation
>   docs/zh_CN: Add scsi-parameters.rst translation
>   docs/zh_CN: Add link_power_management_policy.rst translation
>   docs/zh_CN: Add sd-parameters.rst translation
>
>  .../translations/zh_CN/scsi/index.rst         |   92 ++
>  .../scsi/link_power_management_policy.rst     |   32 +
>  .../zh_CN/scsi/scsi-parameters.rst            |  118 ++
>  .../translations/zh_CN/scsi/scsi.rst          |   48 +
>  .../translations/zh_CN/scsi/scsi_eh.rst       |  482 +++++++
>  .../zh_CN/scsi/scsi_mid_low_api.rst           | 1174 +++++++++++++++++
>  .../translations/zh_CN/scsi/sd-parameters.rst |   38 +
>  .../translations/zh_CN/subsystem-apis.rst     |    2 +-
>  8 files changed, 1985 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/scsi/index.rst
>  create mode 100644 Documentation/translations/zh_CN/scsi/link_power_mana=
gement_policy.rst
>  create mode 100644 Documentation/translations/zh_CN/scsi/scsi-parameters=
.rst
>  create mode 100644 Documentation/translations/zh_CN/scsi/scsi.rst
>  create mode 100644 Documentation/translations/zh_CN/scsi/scsi_eh.rst
>  create mode 100644 Documentation/translations/zh_CN/scsi/scsi_mid_low_ap=
i.rst
>  create mode 100644 Documentation/translations/zh_CN/scsi/sd-parameters.r=
st
>
> --
> 2.25.1
>
