Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888A41FBEB9
	for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 13:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758031001; cv=none; b=dSVMEp1yw4FM4qIuyOsR+QqTQThqT9n90jouBnnrCSte+U/VXWDqtGdc1YTdvDaMZzORMxpHUWl94wiYS9wzB2q9OMn9M75OWUpWuJfeKOivkk4YkqP+Q0HaHihEZOVvMEpvpBJ+nv8Be4hEOxDpJEFL6wzEa1QSUgZepO8EHZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758031001; c=relaxed/simple;
	bh=swafjqRkYo1Qofehaln5uYwzO504wq6qPhljaQoOz5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QdkwZFscQ3TWyLfBEl/MaH931SGZmTEVPwr4jQwtV8Mp31x1yBkF53yT5wg+yFGcq9Bwn000yVcZXrfFtI5Gg3UfAP5mnTv3OMZfNIe85hLuBuoEKkdc+z6WmXGG8s4fbUEXHhhsknc1AIHpoyyGAmnkzfo25V+Yz5IMZR8pVy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5JdZbh2; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5JdZbh2"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b07c081660aso797359166b.0
        for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 06:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758030998; x=1758635798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/8NFHmVgcrLB+z2i3wUg9yikPhCWEc4n4xSDaXEMAs=;
        b=k5JdZbh2L7PQ2z7Oa/HvtBnVRFugS5IGPlZuJCcRWNSJ8mAYD6HK3NELwtCW77LdUv
         UX3OefTJqAFRqo0EaQXM2wLfdEYyistLcREhM8BlHLKvFJ0DHCOVsQ2YrkdhbMeRvo1d
         /LZyBPF6iKkVX9+u5k0XePtZyxfxgGmX7gmMksySSXTLKnADK0GIm66/qm+bR65WTmmn
         AI0Dy3QF6xdN6SI9MP9ROlZFvzSRgt1FGWwX/zp4XyJ0uH1qF9uL28owmAxXQ7nFWv94
         qH4JeNct+jssdo95IpxzqYoHso7HrnmE/BBzaZIauU4XLA3uhfrjYCJJQwW/SJKW6dVP
         odUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758030998; x=1758635798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4/8NFHmVgcrLB+z2i3wUg9yikPhCWEc4n4xSDaXEMAs=;
        b=eHlD/GIy5PI270oZmRMke+Jfr0To4vGKIbCeVxee/NK6XtWjuEcjAp7S1WnxsiQjvh
         ig//p22ZBsAzJZzfNfyrkAXqRYkHsW+j1tKtOUYduPiRHMHET/FEAsczIovN9mltT6He
         4NBeRKeRd3eT9lR0Y6CuEaHjOmyrwcAsRTd3+UHK2CYkYc76C2RRxKDKl0CDYsaMe+NI
         6dx9KALFjZ03CRcH4qCXZJRlgBlXBRbKYfjijtyWjYrAumfwCuonN+jRDd4zDzUVMbx3
         0I+OD83Jb8RpwoOWhg2FSepYtfLS+TyRY0Zwy/vYoEncUd2YEqEiWyDUYtpJ7TO2XYNc
         YBSg==
X-Forwarded-Encrypted: i=1; AJvYcCUhNQiXIkC9LjwinvO17hU3/+LWx15vecFxaefcR2fJBF8ZIDOx98e4L4MxjXjbM9pKGXD7msBNWt4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIAu+baFgdns2fKyTZ0Er/tUKUzs1byCZn/ckaif1zlSwII0uz
	zadGxd1x4WBpclgM930174jJDnAD/XgaKTPFHfzZ3Ar+0+tBmDVssXYXtfdksQccg7sw4sgZQVP
	jTJDjjihsv/baxhT32SkiT4mki+1blTnIJioK0eU=
X-Gm-Gg: ASbGnctqlwwOQZp0qn65p3tmCXE0TRa56pXVeSEkGQd/sjVwjmwlfvt8M/ws036XGnP
	CWsNIfNrrG2bOQ5tiLMGRlpYYbiYoxTh8kWzrG/wqCASNGPWs7SCCTPisAvH1VPNTfNfLPAKFA+
	55txWJ9S8TQcQnweUhhnJTlas0vYJUK+6xypZXvdHxC5OTpXJj9Q3NoEMe+byrg004sYpCFp1bW
	+byAKw=
X-Google-Smtp-Source: AGHT+IF+nasoZf8gbu7u3t1rd/ERtHcp3WqjPgk+l8YyAsVs/dnqfMl0ZdWf+dOAHPxwbyZvqtPjecdMnX689zX9hoo=
X-Received: by 2002:a17:906:4790:b0:b04:9468:4a21 with SMTP id
 a640c23a62f3a-b07c357bdcemr1535346066b.14.1758030997726; Tue, 16 Sep 2025
 06:56:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025083016571123360dlV3pxVqfCY35MOQnma@zte.com.cn>
In-Reply-To: <2025083016571123360dlV3pxVqfCY35MOQnma@zte.com.cn>
From: Alex Shi <seakeel@gmail.com>
Date: Tue, 16 Sep 2025 21:56:00 +0800
X-Gm-Features: AS18NWBawKjrrZ-2GaysUCIuYoPMNcHMcCkS6L1U5IrlJn8D0qStKkH9BTrPhGw
Message-ID: <CAJy-AmmJOReSOnLXuQaWRdTLwaBx5Sn1ks42+FE5oO4ETPJAXw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=C2=A0=5BPATCH_0=2F4_linux_next_v3=5D_Docs=2Fzh=5FCN=3A_Translat?=
	=?UTF-8?Q?e_networking_docs_to_Simplified_Chinese?=
To: wang.yaxin@zte.com.cn
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, xu.xin16@zte.com.cn, 
	yang.yang29@zte.com.cn, fan.yu9@zte.com.cn, he.peilin@zte.com.cn, 
	tu.qiang35@zte.com.cn, qiu.yutan@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, Thanks!

Alex

<wang.yaxin@zte.com.cn> =E4=BA=8E2025=E5=B9=B48=E6=9C=8830=E6=97=A5=E5=91=
=A8=E5=85=AD 16:57=E5=86=99=E9=81=93=EF=BC=9A
>
> From: Wang Yaxin <wang.yaxin@zte.com.cn>
>
> translate networking docs to Simplified Chinese
>
> v1->v2:
> https://lore.kernel.org/all/20250728153954564ePWG4rm0QdFoq2QGWUGlt@zte.co=
m.cn/
> https://lore.kernel.org/all/CAD-N9QW7=3DfrNYSJDhaUiggSF9p_v33R8BQ0t8vypWU=
CXO+pyZQ@mail.gmail.com/
> 1. resend by plain text.
> 2. remove unneccessary empty line in subject.
>
> v2->v3:
> 1. add reviewer tag
>
> Sun yuxi (2):
>   Docs/zh_CN: Translate mptcp-sysctl.rst to Simplified Chinese
>   Docs/zh_CN: Translate generic-hdlc.rst to Simplified Chinese
>
> Wang Yaxin (2):
>   Docs/zh_CN: Translate skbuff.rst to Simplified Chinese
>   Docs/zh_CN: Translate timestamping.rst to Simplified Chinese
>
>  .../zh_CN/networking/generic-hdlc.rst         | 176 +++++
>  .../translations/zh_CN/networking/index.rst   |   8 +-
>  .../zh_CN/networking/mptcp-sysctl.rst         | 139 ++++
>  .../translations/zh_CN/networking/skbuff.rst  |  44 ++
>  .../zh_CN/networking/timestamping.rst         | 674 ++++++++++++++++++
>  5 files changed, 1037 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/networking/generic-h=
dlc.rst
>  create mode 100644 Documentation/translations/zh_CN/networking/mptcp-sys=
ctl.rst
>  create mode 100644 Documentation/translations/zh_CN/networking/skbuff.rs=
t
>  create mode 100644 Documentation/translations/zh_CN/networking/timestamp=
ing.rst
>
> --
> 2.25.1
