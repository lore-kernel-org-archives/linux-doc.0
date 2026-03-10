Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA372F532C
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 14:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773154421; cv=none; b=nDN1YKtqd8rvPfAzuaC/af1qnoe6asr8MekoF8ZjFnXF+/Ws/Y9D5y3C/8uGTEJpX7pR9/fdFnRNRNkHSGUcXdW6dldUBPkU4YN6GhVg6RmzWPpVdF0GL+cmJ1k+Aq6PpKONn/rWFwXMXJkNR98vn9HnPnxxC5C93CUn0HvRJlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773154421; c=relaxed/simple;
	bh=qUi74SydiDbAbb+6ux+6odlAiodLcMMD99osGdEzhG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hPzVW83kyOx6I4Xj/T7Iy2MHP0g2sCD3QF91hupW34ZmcApqym4mpjTIj5KBTH8t6wLCXler5VGvdsoKR3Pde42Q64nTiuDDBVEtLy79tnmV3Ko8faT7zcDOebD3Rp5KimIED+PoX0guYjOlc9uCtCCiI/e3Km/LWW7Wvo/BjbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sqy6aJ9/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sqy6aJ9/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03861C2BCAF
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 14:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773154421;
	bh=qUi74SydiDbAbb+6ux+6odlAiodLcMMD99osGdEzhG0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sqy6aJ9/sJzNSZnAvDWgRfcEogo2l1WfhmEmuKFSjU4k16sdnxcFMKJuHxXLnLfzT
	 jnTxQJmSLA5nObjr4eOHZtzVmxGZVOx++3BJzLcPgdI3RQxtjfKwGXglvSJho61kYP
	 63Vw86BSyxcsSCB4ZGIMBxs+WUMIq7lRMd5kmckst++gAVIfvA0SGgPMKBzPHYuoR1
	 X27XbzqkSgn2ChMxuDuiATcLXMPveWCR9mOaJQChk2xrUyECiEXw4xD6r36SvJhZDS
	 ZZMaQLqET78clBQnnEUjuCq/eawzGfPF+wkBzbfAABHD1jKURnO5nV0mIPihztkSdp
	 xe2CzrraCEcHQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38a45bc61e9so21385181fa.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 07:53:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWoq/iFQ+M5oMF6+bNXWInacN5sNdoM73E6pu2a0eilds85zeybTkU1cyTblu7Qn3SnkW+zob1UEQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKXs6J7XONbWRDgEQo3pZG/L9Bx2ly+ytwjHOpe08ZdLVuNvNu
	mjpAOEm0ygepqHqjOD9NaUHiKyHMhPv2xS6GKviRNQMaFhdq83lG7pBYviSkQ9L03o/0aQpGJ3v
	s1IkeCp3hchXNCyR5MCPug4uI1PccC1BJRboVGR+LJQ==
X-Received: by 2002:a05:651c:2114:b0:38a:2e66:c9f8 with SMTP id
 38308e7fff4ca-38a40da3e0dmr54957351fa.32.1773154419576; Tue, 10 Mar 2026
 07:53:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
 <20260306-reset-core-refactor-v3-13-599349522876@oss.qualcomm.com>
 <0b72286b-33dd-4bc9-8c0e-161c2f4baed8@sirena.org.uk> <581eeac616ad0fa3376303e7136287b956534e69.camel@pengutronix.de>
In-Reply-To: <581eeac616ad0fa3376303e7136287b956534e69.camel@pengutronix.de>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 10 Mar 2026 15:53:26 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdN6Lb_bfbJfNFxcsC_giznWaGABR7UNjV2BWVJtuj3cg@mail.gmail.com>
X-Gm-Features: AaiRm53SsbvBY4IR_u0meojxZ490iKMkQUF2fBORKmLLjWp3V5w-0DsHoEvA4Xw
Message-ID: <CAMRc=MdN6Lb_bfbJfNFxcsC_giznWaGABR7UNjV2BWVJtuj3cg@mail.gmail.com>
Subject: Re: [PATCH v3 13/14] reset: convert reset core to using firmware nodes
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 3:49=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> On Di, 2026-03-10 at 14:16 +0000, Mark Brown wrote:
> > On Fri, Mar 06, 2026 at 06:22:57PM +0100, Bartosz Golaszewski wrote:
> > > With everything else now in place, we can convert the remaining parts=
 of
> > > the reset subsystem to becoming fwnode-agnostic - meaning it will wor=
k
> > > with all kinds of firmware nodes, not only devicetree.
> >
> > This patch is causing issues for me in yesterday's -next on a Toradax
> > Mallow platform with a TI K3 AM625.  Things start to go wrong with a
> > WARN_ON():
> >
> > [   11.544610] WARNING: drivers/reset/core.c:1195 at __fwnode_reset_con=
trol_get+0x488/0x580, CPU#0: (udev-worker)/129
>
> Thank you, that's reset_controller_register() setting
> fwnode_reset_n_cells to 2 since rcdev->of_node is set and rcdev-
> >of_reset_n_cells =3D=3D 2:
>
>           if (rcdev->of_node) {
>                   rcdev->fwnode =3D of_fwnode_handle(rcdev->of_node);
>                   rcdev->fwnode_reset_n_cells =3D rcdev->of_reset_n_cells=
;
>           }
>
> and then overwriting it with 1, because rcdev->fwnode is now set as
> well, rcdev->fwnode_xlate is NULL, and rcdev->of_xlate is ignored:
>
>           if (rcdev->fwnode && !rcdev->fwnode_xlate) {
>                   rcdev->fwnode_reset_n_cells =3D 1;
>                   rcdev->fwnode_xlate =3D fwnode_reset_simple_xlate;
>           }
>
> That then fails because #reset-cells is <2> for k3_reset.
> We also have to check !rcdev->of_xlate here. Could you check if this
> fixes the issue?
>
> ----------8<----------
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index e625cf59cfb0..d52595db5f87 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -143,7 +143,7 @@ int reset_controller_register(struct reset_controller=
_dev *rcdev)
>                 rcdev->fwnode_reset_n_cells =3D rcdev->of_reset_n_cells;
>         }
>
> -       if (rcdev->fwnode && !rcdev->fwnode_xlate) {
> +       if (rcdev->fwnode && !rcdev->fwnode_xlate && !rcdev->of_xlate) {
>                 rcdev->fwnode_reset_n_cells =3D 1;
>                 rcdev->fwnode_xlate =3D fwnode_reset_simple_xlate;
>         }
> ---------->8----------
>

Yeah, I just noticed the same. I'm fixing it and will send a patch shortly.

Bart
