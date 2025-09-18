Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A807A1A9FB4
	for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 03:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758165394; cv=none; b=cYnR0A1GfzXQROZnZhEdj/N9gDw1VRW2o5s9CG3BqFjs5YGSAKHusiC44m9s46NJoRTSBLRfiBEA8W+TWW2WKSysgQ6JVHoKfa4atkGdwqhWDgCJvBrIrfxQFTpzkL+dc8P2h4SJ6tU68dTIGxMJKqiARehthXPfgM6OKWZXJDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758165394; c=relaxed/simple;
	bh=npJn/dQ+Xd/IPDNtpwcQp+GICYLo8gdiB+4vh9mgxbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d0W+yc+mxS4hCvgJ4rNU+2Q8ne2jGufcOqHQEZu7ZkOG5UH9DtY5xrGBCpr/aLPUppQnnuwVsADps4fd3wk3E6rUlMJtOZC0GEOlp/mrIMOvI/QqaqZ+G00oDaDhps6DOXHCpk1mDl2IDzBXElQPzV5WHQXW5Dox/Cu8GRVtLB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8El9c89; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8El9c89"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-62f0702ef0dso3072194a12.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Sep 2025 20:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758165391; x=1758770191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqtheR4wlZ9O/7gYx6fou+3S7q/CTsHieCqGSB995as=;
        b=a8El9c89OVraultZJf72WqnosLjJlxZ+EqXdywI3IJES1scNLfpzmV66QiVug8ClMJ
         GFgedY5nl9tQXTLV0My66plfthyPU/DfpnJJy4KlausG744nDns1LLdmV0/bduRtG6K9
         lB+D063DXLMtNLm6OdFGQxMTAoxfEY8VNvVVWcdW30dubsGfk0ckrmQQhW5Qmb0CjV0O
         RMXlzLScIlnVqMpPSfRc7hK5tudaQIx/m3wFBagYE5M5vB8B7rez6/GWWjx7XHLy5tTC
         o5WOjM0s06BCg5op1YOzKmXS+m4dCG6/Pe74cJE/tbFbcxA/K1EyYhHjMBRnLI8RZt4w
         251g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758165391; x=1758770191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JqtheR4wlZ9O/7gYx6fou+3S7q/CTsHieCqGSB995as=;
        b=lOCJS21DxMO5ike2fCXi35KX0X3RRUxJ4Y3M/Pm/R+yIfZx3yqUa3PRYXWVoNCtevv
         d+/PuHqMtFT97/6GCFjQH2R8Qw0SDxfZEqXG8H8wd4od8HS0foXkb22j8JvjD+Z48adM
         FUi2XcP3+Yj2T199KWwS1xJyVul7QuAskd2BCuR42RKv0owrDtl45q4+R799yv3dwE3l
         XePiGzoCvSwV3xyLPpNkjfbXN99+qeo4Nwu5GZeGkdJrK9SUopiQO26p8jU4WjIT/fF8
         OduMmHr81E21LALQZRuPHyMbrSDhF6BzrDh21iIF94Ge1wzXIg0Hu15Wy7UAiF8EuW5P
         Egxw==
X-Forwarded-Encrypted: i=1; AJvYcCVodvXYhqhzspQNjrcBhI6vtSirbkNPC14CUJYkmUeDcRBWtaJKzLwZHzIPhAET4Piunphtdm9r+fg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa7y/8YT5m8uwK7fmk7qHLYobNsXLkBo8H764qPZM3I4sxxbdN
	p1Jt7q/vyXTaOTyyeM9yDuBUsdBjKCOBiQpQqhd5vIzRg519kdwAs677JK3EwDE2SJFgVTWLgrX
	R/VNuZ6MEKSvke+j1T4FUAm5XacrRHKQ=
X-Gm-Gg: ASbGnctRmoRacYmc9Ko19HcVGVTZyEWiGC+3AJ14+mE1Myay2k51KoT/5ryr0i6q2TI
	X3X72IuwHCiSDt2Gvf0jI+IXOrAD7o/lzTd49EnJI5e8i031ES4dqKI3cRLeP4NYP0A7OzHvXaI
	9clpw5DllF8uHK3ZjQTvjAHvDA7+Xr3UKFaXW4WQ3cCqk2uw0iQxA5mewA4dqOux4MqGr1/H9+m
	+c/Ce4EjWOnvi9h3CNLB+BEfgJXNsmDbLSK
X-Google-Smtp-Source: AGHT+IGcwnmFIhcAMhekBQ9Csbtm2KBwYd+IvWRSs6bThMpRF7oE7D7pBPctsa852qoDNH4x4lRvH1nM+zkO+sVrOFg=
X-Received: by 2002:a17:907:2685:b0:b0e:d477:4978 with SMTP id
 a640c23a62f3a-b1faf817706mr161465166b.32.1758165390737; Wed, 17 Sep 2025
 20:16:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJy-Amk5UTE2HN_Pcd5kbvCsa247CZ9sSMNX==itXeJkWuj-NQ@mail.gmail.com>
 <20250917110956338Wld0_KzYq21PXolbufuNn@zte.com.cn>
In-Reply-To: <20250917110956338Wld0_KzYq21PXolbufuNn@zte.com.cn>
From: Alex Shi <seakeel@gmail.com>
Date: Thu, 18 Sep 2025 11:15:54 +0800
X-Gm-Features: AS18NWAk3VZxovz2PZvQXlnhmoSZRX1fgsvWg7Jlofkyifb8onmjTFPYMm-zXdc
Message-ID: <CAJy-AmnK2fFJeoRzUXp7tME6HVYeGJreuXLSecnQLAr=SNzE5w@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Docs/zh_CN: Translate filesystems docs to
 Simplified Chinese
To: shao.mingyin@zte.com.cn
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	yang.yang29@zte.com.cn, xu.xin16@zte.com.cn, yang.tao172@zte.com.cn, 
	wang.longjie1@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<shao.mingyin@zte.com.cn> =E4=BA=8E2025=E5=B9=B49=E6=9C=8817=E6=97=A5=E5=91=
=A8=E4=B8=89 11:10=E5=86=99=E9=81=93=EF=BC=9A
>
> >Applied! Thanks!
> >Alex
> >
> Hi Alex
>
> Thank you for your review!
>
> Previously, Yanteng gave a review suggestion.
>
> https://lore.kernel.org/all/e0233785-b3da-4bd5-a37f-cf4704c49744@linux.de=
v/
>
> Additionally, I also noticed that the header of this
> patch lacks a fixed format.
>
> https://lore.kernel.org/all/20250826190719682yrVrd5e1DHRXx0-XjI19Y@zte.co=
m.cn/
>
> I am preparing to send a new version to fix the above issue.

Good. I have picked v4 on
https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git/log/?h=3Ddo=
cs-next,
could you do me a favor to send a fix base the branch?

Thanks

>
> Thanks,
>
> Mingyin
> ><shao.mingyin@zte.com.cn> =E4=BA=8E2025=E5=B9=B48=E6=9C=8826=E6=97=A5=E5=
=91=A8=E4=BA=8C 19:12=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> From: Shao Mingyin <shao.mingyin@zte.com.cn>
> >>
> >> translate the filesystems docs into Simplified Chinese.
> >> v3->v4
> >> resolve patch damage issues.
> >>
> >> Shao Mingyin (5):
> >> Docs/zh_CN: Translate ubifs.rst to Simplified Chinese
> >> Docs/zh_CN: Translate ubifs-authentication.rst to Simplified Chinese
> >> Docs/zh_CN: Translate gfs2.rst to Simplified Chinese
> >> Docs/zh_CN: Translate gfs2-uevents.rst to Simplified Chinese
> >> Docs/zh_CN: Translate gfs2-glocks.rst to Simplified Chinese
> >>
> >> Wang Longjie (2):
> >> Docs/zh_CN: Translate dnotify.rst to Simplified Chinese
> >> Docs/zh_CN: Translate inotify.rst to Simplified Chinese
> >>
> >>  .../zh_CN/filesystems/dnotify.rst             |  67 ++++
> >>  .../zh_CN/filesystems/gfs2-glocks.rst         | 199 ++++++++++
> >>  .../zh_CN/filesystems/gfs2-uevents.rst        |  97 +++++
> >>  .../translations/zh_CN/filesystems/gfs2.rst   |  57 +++
> >>  .../translations/zh_CN/filesystems/index.rst  |  17 +-
> >>  .../zh_CN/filesystems/inotify.rst             |  80 ++++
> >>  .../filesystems/ubifs-authentication.rst      | 354 +++++++++++++++++=
+
> >>  .../translations/zh_CN/filesystems/ubifs.rst  | 114 ++++++
> >>  8 files changed, 984 insertions(+), 1 deletion(-)
> >>  create mode 100644 Documentation/translations/zh_CN/filesystems/dnoti=
fy.rst
> >>  create mode 100644 Documentation/translations/zh_CN/filesystems/gfs2-=
glocks.rst
> >>  create mode 100644 Documentation/translations/zh_CN/filesystems/gfs2-=
uevents.rst
> >>  create mode 100644 Documentation/translations/zh_CN/filesystems/gfs2.=
rst
> >>  create mode 100644 Documentation/translations/zh_CN/filesystems/inoti=
fy.rst
> >>  create mode 100644 Documentation/translations/zh_CN/filesystems/ubifs=
-authentication.rst
> >>  create mode 100644 Documentation/translations/zh_CN/filesystems/ubifs=
.rst
