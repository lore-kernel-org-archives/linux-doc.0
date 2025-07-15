Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7E82248B5
	for <linux-doc@vger.kernel.org>; Tue, 15 Jul 2025 15:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752592555; cv=none; b=senqhpAIvmjg6YpEwVbOmmXjxoGZPNva9mZbEDTjVq8ctXnBKr02pM5KiCqNiAWLNOsnbGMRkJVlNmSUHIpp+HmKXucWC8uEeygBYsyZHY/h7geV94LurTz8ODiUtGRIYQadIVQLfdSqU9nV42FS0+E5LK7yWgiyPOKQpALYB8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752592555; c=relaxed/simple;
	bh=kA7Tc0YyD8NMu5sGrY2IU4ip9Dwu2U/CiZk8LkiU/JQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=sGxsUjUu6mbUNILVJ9QiNzgqVcLsnN+APth0Nh90fxJ1KIES+I9oATc2DAK34b3PKVHZRiQ1M3t3LbPNu3ypE2YBx19D5LXfpggrZuz8TkOOpUGEB90tWdwtFJScJlo5SDYOfokWibDPKPjKqvuYXkZ+UG/WQd1HK98VsNGb5PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/qu15gj; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/qu15gj"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so9226175a12.2
        for <linux-doc@vger.kernel.org>; Tue, 15 Jul 2025 08:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752592552; x=1753197352; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJ4/9sTPH3OFAATKO9czyzuAEdg89x7sWwCyPMjl+Fc=;
        b=C/qu15gjhAMREuQkL0JFd/4UbaKH32qC++YmPCZNwRwx46YqDoLk2oy5GBD5O5ovod
         tCuyeGCgVcLxDMusLlr5RGUCCLsPs39SF3mWaTBuh+ePMZgcG/hMtKwgiIS4EGF4kGZl
         l/HYchdeWoxDQ+QVp7YxTFhhmGSzTXrTc80JQ2i+k8uawVD0JaiCy1tNinxORONphPNV
         y26XlRdxbibbHfvZX/TDjcDMSbQuf28y68jMDuqfL7OKNjS/mxrsZXmwhf6PV74SH4GA
         /fdlWOTWaenu1TUwLgQpUxpZktOLXxuqR2Ode8C5UG+9XVkTDeI10SryLWBd/KbSHjdI
         HwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752592552; x=1753197352;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJ4/9sTPH3OFAATKO9czyzuAEdg89x7sWwCyPMjl+Fc=;
        b=PerGcC2vvzmUa+zpf7DNyO32GOhcpS9nU4ET4IB7MZ3u+OcjsHVS6bVEge6VPfppri
         H3H4/QQI9jC+mv4g+/99q4qcg/7hPVVWhrYDVxTbN5zI7DZHFrGxgqRVjrtUOhwdILY9
         3gqmu/Ce8ZdAU2GEi9ylFVVcNn7E89eb0kSc7CZ1PhREuf+V1quKjg+2NpotsPyI4f/U
         8kprkkCmr8ijPZ6pW0WiWX3HJLmBF/DgcaMdimHsZ+BH96UZJ3c277dOXmc3u/+cgxN0
         KFgH0WOIfHznv0qusyKiGglZYrVk6AKv7obZPf+lZ0C5A5iQ8m7yxpPlZgKzn3moz9qq
         r+Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXvb4WpUPFmF3PdjrSBFACyv09STFOE9Hlkfna84sfHRLKoUNwxJpeMZUor26GkbLiSQSX4yI4pF2k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOs2VE8aICXAbF9WU+IDt7PHjHdLVxtPjNVH+jg8NIATCLGC0S
	4UeB5VVTiBq0wy/AE5Yez9+yQMt4ClRAZ8TNwNbx/joC5N/7GZFAmx6W93LWB9CTRvFd1683xhu
	vVbbPR3oAWgchXg0utr5Q7isvSUtZE5IUKMkWaKo=
X-Gm-Gg: ASbGncvBAnM4RVxhkqphBpr/HkUxtNzucuA9csfw0R0IIKH88ghkZ9cZIqIyG5aPf9b
	SxHMHExPbCypoaGkuSrnqC6OKariIKAeU6+80PtSoKK9478RQD+Lv/zqAU5IIRW1olr6xtN1MHb
	pDyJunbSLvFJcfirCMVx3zlhMwWrthadzosPMAF5DKBkjMY+7xKdEiYWdzOu3ZOrY1zf+yAVgZo
	nKeoh4=
X-Google-Smtp-Source: AGHT+IEUjNv/WLlMNJ5mkHOrfM36GPJWkkIbi/gDvjLZ0DC4BM7ze2SDS0QoFYHrHhkrLAhxcTRt1KxW5rqIw112puU=
X-Received: by 2002:a05:6402:5291:b0:604:bbd2:7c88 with SMTP id
 4fb4d7f45d1cf-611e84cd12fmr16132184a12.26.1752592551896; Tue, 15 Jul 2025
 08:15:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJy-AmkHszv8wV2qjVuALNfF4dpmwfk4APavqXUso+ebkJtHNA@mail.gmail.com>
In-Reply-To: <CAJy-AmkHszv8wV2qjVuALNfF4dpmwfk4APavqXUso+ebkJtHNA@mail.gmail.com>
From: Alex Shi <seakeel@gmail.com>
Date: Tue, 15 Jul 2025 23:15:14 +0800
X-Gm-Features: Ac12FXxMikujHfPP_3krFz_zewJnTgE5RwlOaKCkJ8DfqSeJsqTjQkvPAFx9MyA
Message-ID: <CAJy-Amk=37wZCJOQjkYGQHCwcvf+48EGObp=dNKZse95rwfniw@mail.gmail.com>
Subject: Re: [GIT PULL] Chinese-docs changes for v6.15-rc1
To: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, forgive the typo in subject line: s/v6.15/v6.16/

Alex Shi <seakeel@gmail.com> =E4=BA=8E2025=E5=B9=B47=E6=9C=8815=E6=97=A5=E5=
=91=A8=E4=BA=8C 23:06=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Jon,
> Please merge the Chinese translation docs for v6.16-rc1.
>
> Thanks
> ----
> The following changes since commit d3f825032091fc14c7d5e34bcd54317ae42469=
03:
>
>   docs/sched: Make the sched-stats documentation consistent
> (2025-06-09 16:23:58 -0600)
>
> are available in the Git repository at:
>
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/alexs/linux.git
> tags/chinese-doc-6.16-rc1
>
> for you to fetch changes up to 744cc616b8d80ae57b6fdb3d23dd2fa27bd25d2f:
>
>   Docs/zh_CN: Translate alias.rst to Simplified Chinese (2025-07-06
> 21:13:46 +0800)
>
> ----------------------------------------------------------------
> Chinese translation docs for 6.16-rc1
>
> This is the Chinese translation subtree for 6.16-rc1. It
> includes few changes:
>         - Updates to the process documentation
>         - Added translations for network and speculation docs
>         - Polished zh_CN/how-to.rst
> The above patches have been tested by 'make htmldocs'
>
> Signed-off-by: Alex Shi <alexs@kernel.org>
>
> ----------------------------------------------------------------
> Cui Wei (1):
>       Docs/zh_CN: Translate speculation.rst to Simplified Chinese
>
> Dongliang Mu (7):
>       docs/zh_CN: update the translation of process/1.Intro.rst
>       docs/zh_CN: update the translation of process/6.Followthrough.rst
>       docs/zh_CN: update the translation of process/7.AdvancedTopics.rst
>       docs/zh_CN: update the translation of process/2.Process.rst
>       docs/zh_CN: update the translation of process/5.Posting.rst
>       docs/zh_CN: improve formatting and content clarity
>       docs/zh_CN: update git command examples in how-to.rst
>
> Qiu Yutan (2):
>       Docs/zh_CN: Translate vxlan.rst to Simplified Chinese
>       Docs/zh_CN: Translate alias.rst to Simplified Chinese
>
> Wang Yaxin (4):
>       Docs/zh_CN: Translate napi.rst to Simplified Chinese
>       Docs/zh_CN: Translate netif-msg.rst to Simplified Chinese
>       Docs/zh_CN: Translate xfrm_proc.rst to Simplified Chinese
>       Docs/zh_CN: Translate netmem.rst to Simplified Chinese
>
>  Documentation/translations/zh_CN/how-to.rst                   | 108 ++++=
++-----
>  Documentation/translations/zh_CN/networking/alias.rst         |  56 ++++=
++
>  Documentation/translations/zh_CN/networking/index.rst         |  12 +-
>  Documentation/translations/zh_CN/networking/napi.rst          | 362
> +++++++++++++++++++++++++++++++++++
>  Documentation/translations/zh_CN/networking/netif-msg.rst     |  92 ++++=
+++++
>  Documentation/translations/zh_CN/networking/netmem.rst        |  92 ++++=
+++++
>  Documentation/translations/zh_CN/networking/vxlan.rst         |  85 ++++=
++++
>  Documentation/translations/zh_CN/networking/xfrm_proc.rst     | 126
> ++++++++++++
>  Documentation/translations/zh_CN/process/1.Intro.rst          |  10 +-
>  Documentation/translations/zh_CN/process/2.Process.rst        |   7 +-
>  Documentation/translations/zh_CN/process/5.Posting.rst        |  11 ++
>  Documentation/translations/zh_CN/process/6.Followthrough.rst  |   5 +
>  Documentation/translations/zh_CN/process/7.AdvancedTopics.rst |  14 ++
>  Documentation/translations/zh_CN/staging/index.rst            |   2 +-
>  Documentation/translations/zh_CN/staging/speculation.rst      |  85 ++++=
++++
>  15 files changed, 1004 insertions(+), 63 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/networking/alias.rst
>  create mode 100644 Documentation/translations/zh_CN/networking/napi.rst
>  create mode 100644 Documentation/translations/zh_CN/networking/netif-msg=
.rst
>  create mode 100644 Documentation/translations/zh_CN/networking/netmem.rs=
t
>  create mode 100644 Documentation/translations/zh_CN/networking/vxlan.rst
>  create mode 100644 Documentation/translations/zh_CN/networking/xfrm_proc=
.rst
>  create mode 100644 Documentation/translations/zh_CN/staging/speculation.=
rst
