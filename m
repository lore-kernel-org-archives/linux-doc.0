Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD7A21254D
	for <linux-doc@vger.kernel.org>; Sat, 20 Sep 2025 07:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758354637; cv=none; b=uNz7imsZMZQ1v4IvDVQV7l/08L7jUhW2Sn3MjwN4qmRyr4Q4uMc2DyvyW7JMHNaiM9UmOJWF/SZjVKA87cyWYnc7Li/4OubXPQtpKpQPaDGgsLNjcDX61g520rRKdqI1FL0R5FL0/Y47H/v1jIOyz76TMsFTXIt3g3R8qG3bLOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758354637; c=relaxed/simple;
	bh=qmpkTUzydRQujIKnBGKdiN+Ji++u8QEmHCc0F/vPKUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ONOz+7XlkPZ5Oz9NWGm5MmRV4eog0EpMnO/XhNNWlpCbvvA57DY4RsTLVxSRXelClX2tGca2Af5jXBH4E1yu1Y0hca1XFJXNxs/g8g0TiRbSuPwGDzKElH04wyKeQhhbHpRcM018Xz+1bZbc0k6UARNsClPXUOp/djlwLqDXX2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JynfH7aj; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JynfH7aj"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b07d4d24d09so468471166b.2
        for <linux-doc@vger.kernel.org>; Sat, 20 Sep 2025 00:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758354634; x=1758959434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knrhMCywQQbRVUMOa6NYTtOeTCJV68hMiq9CpjYL5Ig=;
        b=JynfH7ajbCH3+wXOVxcC3gwazdpDg/wQdqWKCeUJk+rlfosl/0CyhdpTl+H1yky5xX
         tDwre3Yu5j5VH9PWWR/oprAXnkY92tibTgwXO/GGLz9ocN2CwdEsJOPgnD5cJvHtcDfF
         f8RajvN3QIVlKPYMj7W8mlgpmZqNPb7q8l6qamk3uCdLmgD1pGNY7FhWHrFTscrbVg5l
         9PbMioQse0BZfUAueLhA4XCQHFJbfgYcIGbIck9CTZrbh3P0n94LGKFLFFqDmIT+toA2
         GL7J/UljRDAuUcbOD5C/BIePlg3xRdURqOxRagDCVxQNe8+LfymS+gCNJveDbUQpjiia
         Nhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758354634; x=1758959434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knrhMCywQQbRVUMOa6NYTtOeTCJV68hMiq9CpjYL5Ig=;
        b=Qq+ZU63FyixoUubCkrxUucz9Y2pVsQuru1FXmnCs8d1XT+i57xZtZ51fNz52bvcGu6
         MYiofHzDRVrjuHRUY9LorMFpqUyRIl8prKo8ZZRgryZJyk8CMWxvQpR1CNDCGDYGEBBy
         xALxZvXgoaoRcX5nQhfAlMDTDmOg4TdvpcTGvPRsAUAQakLg5npSBR5Jvl0P2lNaAryX
         H/9heY2ntpBi341UMCbxh9HAzuFXjsX5TH09tndKJKTxYf/C5utbQsbqIf8aol22wzlx
         6CcBRF97fJq9sLkLvTyfugGzS/Hdij3KRem3qHONho056dXkFiw+OQDrmu2dORQHYTFR
         QZWg==
X-Forwarded-Encrypted: i=1; AJvYcCX0btRNoiIIyQ750RAlqqjb+MQDbrYsqMx6TCWudKocJW4E3Qay17tv8+2bXHRse1gSRMs9oMPIiIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbKtauoyJ8zy4znsQygsnxzEVzDkr0pRKupxhGKL1iHuBFzclZ
	BZT/KEghRh4mErZo4y3J0U6bg4/eiVt/4yFZD5no1UO/yb9N7FoC/PFsufH0WlfmZp0LE78zn6y
	zL8mL5fUBoauU5p8XE4WEMQaC6bVBKBs=
X-Gm-Gg: ASbGncvhGU07RnbHJf24mdExKbHRO0BJL9i+FSMTj5OYasmOpZECKK2VmkFjfs9auFC
	tKKjSbuGhDJ9AaWqffg7UcJvmc52GJgfTHkvpeDRwaEcTy2l+MbTMPfkxRGi1hm0XKuNtaDFMPv
	SJC6niOOL6QK0I4ugKT1MiIgIsto2JxiwArm3R1GE0hkVv+QpR/E9UBSBulClloTfjhCxynq9Ht
	w2C7do=
X-Google-Smtp-Source: AGHT+IHmG1fxyCSJTQF/lVZDDieCsvChFigTVcILMjcYaPs1hBu7xmp9rm6MWNpYRtLeq9vcyYIobarHjZM0ACSqzJ0=
X-Received: by 2002:a17:907:3cc9:b0:b07:c715:31 with SMTP id
 a640c23a62f3a-b24f5f3097cmr625719566b.65.1758354634061; Sat, 20 Sep 2025
 00:50:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJy-AmnK2fFJeoRzUXp7tME6HVYeGJreuXLSecnQLAr=SNzE5w@mail.gmail.com>
 <20250918160701503LAL5d3yUvPccri9n1foeC@zte.com.cn>
In-Reply-To: <20250918160701503LAL5d3yUvPccri9n1foeC@zte.com.cn>
From: Alex Shi <seakeel@gmail.com>
Date: Sat, 20 Sep 2025 15:49:57 +0800
X-Gm-Features: AS18NWCndUXQ50dMCXwNE8epdcyfCdXUNYuQDgeFiwJDWXpwFBoSoRcCzVwXjDY
Message-ID: <CAJy-Am=wsBOC9QH4A_-784KZF3L8D6-s1Yttp62viwAoQ8G4rA@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Docs/zh_CN: Translate filesystems docs to
 Simplified Chinese
To: shao.mingyin@zte.com.cn
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	yang.yang29@zte.com.cn, xu.xin16@zte.com.cn, yang.tao172@zte.com.cn, 
	wang.longjie1@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

All applied, Thanks!

<shao.mingyin@zte.com.cn> =E4=BA=8E2025=E5=B9=B49=E6=9C=8818=E6=97=A5=E5=91=
=A8=E5=9B=9B 16:07=E5=86=99=E9=81=93=EF=BC=9A
>
> >> >Applied! Thanks!
> >> >Alex
> >> >
> >> Hi Alex
> >>
> >> Thank you for your review!
> >>
> >> Previously, Yanteng gave a review suggestion.
> >>
> >> https://lore.kernel.org/all/e0233785-b3da-4bd5-a37f-cf4704c49744@linux=
.dev/
> >>
> >> Additionally, I also noticed that the header of this
> >> patch lacks a fixed format.
> >>
> >> https://lore.kernel.org/all/20250826190719682yrVrd5e1DHRXx0-XjI19Y@zte=
.com.cn/
> >>
> >> I am preparing to send a new version to fix the above issue.
> >
> >Good. I have picked v4 on
> >https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git/log/?h=
=3Ddocs-next,
> >could you do me a favor to send a fix base the branch?
> >
> >Thanks
> I have sent 3 fix patch.
>
> 1.
> https://lore.kernel.org/all/20250918151349743KS4zJHQOoG-yPHSeAY3dv@zte.co=
m.cn/
> 2.
> https://lore.kernel.org/all/20250918143643417OPRH_RjCXkCa3aCtQEX3Y@zte.co=
m.cn/
> 3.
> https://lore.kernel.org/all/202509181556503857h2V0skOmjONfEzUrZ-ok@zte.co=
m.cn/
>
> Thanks.
>
> Mingyin
> >
> >>
> >> Thanks,
> >>
> >> Mingyin
> >> ><shao.mingyin@zte.com.cn> =E4=BA=8E2025=E5=B9=B48=E6=9C=8826=E6=97=A5=
=E5=91=A8=E4=BA=8C 19:12=E5=86=99=E9=81=93=EF=BC=9A
> >> >>
> >> >> From: Shao Mingyin <shao.mingyin@zte.com.cn>
> >> >>
> >> >> translate the filesystems docs into Simplified Chinese.
> >> >> v3->v4
> >> >> resolve patch damage issues.
> >> >>
> >> >> Shao Mingyin (5):
> >> >> Docs/zh_CN: Translate ubifs.rst to Simplified Chinese
> >> >> Docs/zh_CN: Translate ubifs-authentication.rst to Simplified Chines=
e
> >> >> Docs/zh_CN: Translate gfs2.rst to Simplified Chinese
> >> >> Docs/zh_CN: Translate gfs2-uevents.rst to Simplified Chinese
> >> >> Docs/zh_CN: Translate gfs2-glocks.rst to Simplified Chinese
> >> >>
> >> >> Wang Longjie (2):
> >> >> Docs/zh_CN: Translate dnotify.rst to Simplified Chinese
> >> >> Docs/zh_CN: Translate inotify.rst to Simplified Chinese
> >> >>
> >> >>  .../zh_CN/filesystems/dnotify.rst             |  67 ++++
> >> >>  .../zh_CN/filesystems/gfs2-glocks.rst         | 199 ++++++++++
> >> >>  .../zh_CN/filesystems/gfs2-uevents.rst        |  97 +++++
> >> >>  .../translations/zh_CN/filesystems/gfs2.rst   |  57 +++
> >> >>  .../translations/zh_CN/filesystems/index.rst  |  17 +-
> >> >>  .../zh_CN/filesystems/inotify.rst             |  80 ++++
> >> >>  .../filesystems/ubifs-authentication.rst      | 354 ++++++++++++++=
++++
> >> >>  .../translations/zh_CN/filesystems/ubifs.rst  | 114 ++++++
> >> >>  8 files changed, 984 insertions(+), 1 deletion(-)
> >> >>  create mode 100644 Documentation/translations/zh_CN/filesystems/dn=
otify.rst
> >> >>  create mode 100644 Documentation/translations/zh_CN/filesystems/gf=
s2-glocks.rst
> >> >>  create mode 100644 Documentation/translations/zh_CN/filesystems/gf=
s2-uevents.rst
> >> >>  create mode 100644 Documentation/translations/zh_CN/filesystems/gf=
s2.rst
> >> >>  create mode 100644 Documentation/translations/zh_CN/filesystems/in=
otify.rst
> >> >>  create mode 100644 Documentation/translations/zh_CN/filesystems/ub=
ifs-authentication.rst
> >> >>  create mode 100644 Documentation/translations/zh_CN/filesystems/ub=
ifs..rst
