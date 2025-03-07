Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C0119DF66
	for <linux-doc@vger.kernel.org>; Fri,  7 Mar 2025 21:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741384061; cv=none; b=LOXG4UJ8stvoBxnpnrFgMXkn+AlwK0zpfJW9jp9rsYC25MoIjH680U3czZCKJ4CPi2xXRMQdhNgQ7xhiyD6/UP1kfncQpXZLaPNmBswT4rQ3BftPbTiXf5VhWzHjIkhEiriJlhB+NDMhfrDcBZBS9MYDpgLQVP080zhUq9qkRpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741384061; c=relaxed/simple;
	bh=5SlHf/j+MxulukGiEuxyngzhk509+mhRku8ndimaR/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mpVGRVzA2PZdiA49+N/X4z6KHgC4IsyzavIcl8cOe0fbiMERnGs4gwdiYWm0ESmUwSYawkZIHUty0LfAeawh5cy/wnVUg7VdU5/JKLZym7eCcGrqeyBxwlAgo6afrizy6ym+A6hruFYpv6rbx1zIQ9EVKixDFm5pufwF/7CmlL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=PeTyds/Y; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="PeTyds/Y"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6f4bc408e49so23315677b3.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Mar 2025 13:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1741384059; x=1741988859; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMZSxFoi6f7PWqlB1UKx8jVewEGITwIyJyqUhCV0Las=;
        b=PeTyds/YRZaOKyWEvKKluUqD02sp5Ucg1ZypKlCC4qzl2W0I1eERLLb5NORq/zONsW
         9VMHs2Jm7l9UDaBEy3XNzQ8oxheOux3LDPcYasi+pZGrB8rzh2A4rEbEjkIa5kKJhFHc
         x3nCuszI3YEgK/Fmb/h+cHmeJk/jicUPH4Ph2Qqor0iz3HIQCX0qDLYB0/LEXarEWiGu
         fgXFzXbsxIqGtmRpGq9frH3JvvWqLODoy+xHeGPSZpa5POGIdNorNyYeo3D3qX0dLfeh
         qk6sJoVol0THmL4CMgLt48ayLVmQPrINNl/sHSQqAUmUEMxJOBsqTn4185khl+0FOETw
         r4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741384059; x=1741988859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMZSxFoi6f7PWqlB1UKx8jVewEGITwIyJyqUhCV0Las=;
        b=gv1ar/0WZJ8u6b+UWD5O5ez+BCVTiM+hjI7IwIwp5peBzseY36rLaURVQDdKKaRPxB
         5VZFfUYBZBWmiOx3V/7l7mrbYoxeGUw6R1o2bQ6mi5dSF9tw0TeHANc/OiZkAvXOngw3
         rL9CgZ/U3pyz6ZJDEQNARdDFSucM+D2VzsCn9fEN7ho67FN99b/SmCsJaZHhiXYx41Af
         1A3MdhIdcSmf/5Z3xlTqYCGjB4Rh0Mo2/G8hC4+mXjP2alO1wRoX4z6qE3xk/bbk2Dlv
         y0Te63tdfyHABtbfrMr1Tw3xvLTsoOrMgNvWaKlWUtNc6sP4bmSXpJJb4rZQd4eDXWG3
         XuHA==
X-Forwarded-Encrypted: i=1; AJvYcCV3ewRNLbkQGhPvTyzNcWUNCFV3XxBmwAbjmj68maVDRjQmYZ1T6nEuzUhdpWCmGaHU5PEWm1SFUa8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtN+h7CtHkbFyeN3ZqxjX6i3cIPJP/ZD3Pmh+7Hqiaa89d355C
	C64j6ZtBtiFtRBuPn8vVJ4BWlKwmdeU8Ssmm0/tbFP1X+rH7HfgwB358Ur1256e95YvA1LoOw+8
	ZiCwoua8eCceS7+LDfjo2Fj11151u/syQb6+g
X-Gm-Gg: ASbGncsA/PSmXYuHGLd2rpOfga+FtoDuTdCV5zX/iujHicICitkg6Jr5NRtZJlYMSAL
	78Kbqi8qSCudEIedSK8p8Ws+4jb+G5ZRD4+OoHp4mnkFWqyS7Ai387Y2Q3zA+ov2LaLOeHWJENy
	tzSzjCWyN/XIcUNJRePbz5YCoBWQ==
X-Google-Smtp-Source: AGHT+IEcSv7KnFplQDoJAzSnv6OCFFu3SqXY9ZAVwkGHVMz9+vJYZBnkjrWTKmrQW0KqO3a/jWFEzcl+IcxOBSAP5Fo=
X-Received: by 2002:a05:690c:74c6:b0:6f9:8605:ec98 with SMTP id
 00721157ae682-6febf3afe8dmr69020767b3.28.1741384059104; Fri, 07 Mar 2025
 13:47:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303200212.3294679-1-dualli@chromium.org> <20250303200212.3294679-2-dualli@chromium.org>
In-Reply-To: <20250303200212.3294679-2-dualli@chromium.org>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 7 Mar 2025 16:47:28 -0500
X-Gm-Features: AQ5f1Jrw6DpflBp7nmSaYvneP_J8K-vWp_dYABd5t8DUNhQRxL3G83QnXuzfnEI
Message-ID: <CAHC9VhRiZS2Dh+0-GqHE+um7T05p4_=EXG7tOtC5pciWMteDDw@mail.gmail.com>
Subject: Re: [PATCH v16 1/3] lsm, selinux: Add setup_report permission to binder
To: Li Li <dualli@chromium.org>
Cc: dualli@google.com, corbet@lwn.net, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	donald.hunter@gmail.com, gregkh@linuxfoundation.org, arve@android.com, 
	tkjos@android.com, maco@android.com, joel@joelfernandes.org, 
	brauner@kernel.org, cmllamas@google.com, surenb@google.com, 
	omosnace@redhat.com, shuah@kernel.org, arnd@arndb.de, masahiroy@kernel.org, 
	bagasdotme@gmail.com, horms@kernel.org, tweek@google.com, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	netdev@vger.kernel.org, selinux@vger.kernel.org, hridya@google.com, 
	smoreland@google.com, ynaffit@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 3:02=E2=80=AFPM Li Li <dualli@chromium.org> wrote:
>
> From: Thi=C3=A9baud Weksteen <tweek@google.com>
>
> Introduce a new permission "setup_report" to the "binder" class.
> This persmission controls the ability to set up the binder generic
> netlink driver to report certain binder transactions.
>
> Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>
> Signed-off-by: Li Li <dualli@google.com>
> ---
>  include/linux/lsm_hook_defs.h       |  1 +
>  include/linux/security.h            |  6 ++++++
>  security/security.c                 | 13 +++++++++++++
>  security/selinux/hooks.c            |  7 +++++++
>  security/selinux/include/classmap.h |  3 ++-
>  5 files changed, 29 insertions(+), 1 deletion(-)

...

> diff --git a/security/security.c b/security/security.c
> index 8aa839232c73..382e3bbab215 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -1043,6 +1043,19 @@ int security_binder_transfer_file(const struct cre=
d *from,
>         return call_int_hook(binder_transfer_file, from, to, file);
>  }
>
> +/**
> + * security_binder_setup_report() - Check if process allowed to set up b=
inder reports.

Please keep the line length in the LSM and SELinux code to 80
characters or less.

> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 0d958f38ff9f..2fafa8feafdf 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -2092,6 +2092,12 @@ static int selinux_binder_transfer_file(const stru=
ct cred *from,
>                             &ad);
>  }
>
> +static int selinux_binder_setup_report(const struct cred *to)
> +{
> +       return avc_has_perm(current_sid(), cred_sid(to), SECCLASS_BINDER,
> +                           BINDER__SETUP_REPORT, NULL);
> +}

There should also be an associated patch{set} against the
selinux-testsuite to add tests for the binder/setup_report permission
introduced here.  My apologies if you've already posted one, but I'm
looking now and I don't see anything either on the lists or on GH.

* https://github.com/SELinuxProject/selinux-testsuite

--=20
paul-moore.com
