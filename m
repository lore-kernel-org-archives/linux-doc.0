Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AD022FF22
	for <linux-doc@vger.kernel.org>; Fri, 16 May 2025 09:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747386945; cv=none; b=iuTMq2X/KcX0A7+bEE1s5zUBovLH93AdpRTP62+Jbf+LVVvwLK6qKy3Rtzlwi5jOPVeBSwevMWhS7/wbT3YppQE301xvrdM3YF2BNrj28aRVAVjJmBhGZVAisbK8sB6K+c6Dfdvw9N+6w9+4pb3IQia+ybY1roAIMaa801LituU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747386945; c=relaxed/simple;
	bh=7k6aUMabXJr7fbD+8HWrZmO15OPQOClyQSVsosQh4rg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aqnUoyl5ArmZ40ZHLNXhmGZHDtUzHaZLl+LE2mW4TqwlL7C3LXmTQDdD5j92LMaAaZ/0ZiIHRikgKa3yeuXzhu4rQfO7JDjq4UZe8itg5B2GHVhl60uY4TrfkrCDUYVOjNNZmjvdM6XnXSUxUwJrW1np+oKHGsb2oo4EfZ4BBhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=hmz29LSx; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="hmz29LSx"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-708b31650ffso17382747b3.0
        for <linux-doc@vger.kernel.org>; Fri, 16 May 2025 02:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1747386942; x=1747991742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghCVBFohCqPYMNm54QVPyhJ+LtBlN+TIFH3Qtc52S1A=;
        b=hmz29LSxgD/MsB1wUZor7Qrw69h3GHRxm+CsSwBCV1KYj5xcG+0vxreK9qLRcEMhzy
         1AHQCxojvgyJfXJfiSCEVdJAvcS1Nu5FE7prZCZ0oKuvLtF9+LMIr1XnccUn/7BLnZi/
         9sxDyZhdEdlrsm4ZTB3TAqz+Lb5rGnvTfhviZNb6A4r+DetDDxdvWM1xiy+a9q9ni2RO
         qNEzF3HvCbbXMdeGPW39bAUUiXY1EglHMGHfQe4KjxpXG+b6yiedb2emK+h/FhCb0Stt
         RPotN/f85ZQUTRC1EgbDmWc0pr3WSf1ZmzPD1QsVwvRs6DRcpqu8vs+52fHr0E54Rbwz
         7jZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747386942; x=1747991742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ghCVBFohCqPYMNm54QVPyhJ+LtBlN+TIFH3Qtc52S1A=;
        b=lXJtAOX+aEoHGe6rZ8L+YI9BGq4G4E7dlWroyWxJ7Rd23oou9nFpWcuXQTaRbB1rRS
         fLODPvulnAWG2k5E65eoB7MfOUwmmwKg1JnEE0ZOFtlhX/ruBb4+zSaVSRTeM74VsXwb
         CYzLC+/sCfsuRMpLFuHAEdJc3Peoq4IUapXWyl97DW7sg0IbsbRRZs4pbcgG5VH8XuvC
         DGgM0ysh0E3dpJ6uHkhMTczy5bOBQW8S1QXgHzmU6kKccmM6V+/jvwisl3+zo95jTI7g
         dccglFdtmc0T6DBbEZe8u1g53GvnNx801G7+IizH5+bR8QhNoFX/WjQmvpTvB8JuQ/E0
         gA5w==
X-Forwarded-Encrypted: i=1; AJvYcCVmubS5MVFOZ6aVRULrCchwz2XiT+orpOryb7djNW3c0p7T5c9UXHAFylbdGdhsqW8RwMCOtUtDOf0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw56SriTHHp4FIzGNkOlfiu/xflmFhQfmVQE55cA7KilbcbaH6h
	bZSs3nWzLKA//2JTQYOGF3/hTTGM9BYljDNTwv13PRDjZ8FVoacpG04DJmStNexyP9M=
X-Gm-Gg: ASbGnctfI7IZF/vlhm/sOwjBf5Xdbu1xHrbnUjYyBnM3lJQpEzNHSMu6VAjY0jKglXX
	Y8B3cz9yvyKyY8xeKVCltRktAq5SlBVI6RSEqp2VTtkvVbhNHZq72krKkRBjy1MwmNFV2N8/hY/
	HgZr+y9xkKiKde0nKL22o88xiMVCN//K9HpagfYZ9/r8le+eNzJkPxXTlANwIZeO8T/oNnYUTTP
	WqnRn6l56XBd6bAklIW07zMwXTJDUxIc5mIdNaZvMqLIVuAsuHLxvxQW9ss57EPpVAFh34uxRdg
	39XfRmdVfe9r/4noEp41Jqyp4FTzmowubOuzHvtvgoTS33ywS3aw8GrCI4XFT1O2uh8tY6EDR6C
	PIqumHx1BuVKc1PnS7n4pOJJVDtFayA==
X-Google-Smtp-Source: AGHT+IFXRvGO07uW3KpLAS7lsCzMgVKTZR23v8sqD38aoO8MtZDk2+43PJXwza6uDAUP5GjSEj73Tw==
X-Received: by 2002:a05:690c:600a:b0:700:b01b:5ea2 with SMTP id 00721157ae682-70ca7bbdbdamr42010647b3.34.1747386942400;
        Fri, 16 May 2025 02:15:42 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70ca8323efbsm3139887b3.40.2025.05.16.02.15.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 02:15:41 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e7b51381445so1713631276.0;
        Fri, 16 May 2025 02:15:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUeWU9E1yFWsHq1dcjd8qpC719p5jJ/Xn1zRhF872kZHu6MYe3KFsBAU2sRZwr2GXB7JuFf18Bxk1Yh@vger.kernel.org, AJvYcCW5obE7q6zs5LR1se3/eztl0J9Wx7mB7XSYGV2Wg+jG2P+DM8kXj6yhlimkfkeU7JaoJ2PX6KJT3sHg@vger.kernel.org, AJvYcCWfIW4OnSKCqhkF7J2OgC7AKpPx4buUyiCoBYABrKomGloFUJbCoYORYfaS2DVcwmKhtKB+RGfzqfX07N4=@vger.kernel.org, AJvYcCXSobm2jZQ7fF02zQ21ZgoJI2XVheePBOC0omY/UMymygrknrU56UVo6lLToRwCIS+rpGJIcTw78SlbQ2S+@vger.kernel.org
X-Received: by 2002:a05:6902:4888:b0:e7a:b59a:e99 with SMTP id
 3f1490d57ef6-e7b6a08f866mr3989501276.22.1747386940957; Fri, 16 May 2025
 02:15:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <20250225-6-10-rocket-v2-4-d4dbcfafc141@tomeuvizoso.net> <2950819.ElGaqSPkdT@workhorse>
In-Reply-To: <2950819.ElGaqSPkdT@workhorse>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 16 May 2025 11:15:29 +0200
X-Gmail-Original-Message-ID: <CAAObsKBrXZscvhjYnSb2DBL1KGsaMHpPVfB_QrFUPihd2+srdw@mail.gmail.com>
X-Gm-Features: AX0GCFs7JNRTyA51Mp_5c2sfGP8DF36VD9y5YcZK4C0Caod07VePTbyWDenldvk
Message-ID: <CAAObsKBrXZscvhjYnSb2DBL1KGsaMHpPVfB_QrFUPihd2+srdw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] accel/rocket: Add a new driver for Rockchip's NPU
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 8:22=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Tuesday, 25 February 2025 08:55:50 Central European Summer Time Tomeu =
Vizoso wrote:
> > This initial version supports the NPU as shipped in the RK3588 SoC and
> > described in the first part of its TRM, in Chapter 36.
> >
> > This NPU contains 3 independent cores that the driver can submit jobs
> > to.
> >
> > This commit adds just hardware initialization and power management.
> >
> > v2:
> > - Split cores and IOMMUs as independent devices (Sebastian Reichel)
> > - Add some documentation (Jeffrey Hugo)
> > - Be more explicit in the Kconfig documentation (Jeffrey Hugo)
> > - Remove resets, as these haven't been found useful so far (Zenghui Yu)
> > - Repack structs (Jeffrey Hugo)
> > - Use DEFINE_DRM_ACCEL_FOPS (Jeffrey Hugo)
> > - Use devm_drm_dev_alloc (Jeffrey Hugo)
> > - Use probe log helper (Jeffrey Hugo)
> > - Introduce UABI header in a later patch (Jeffrey Hugo)
> >
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > ---
> >  Documentation/accel/index.rst           |    1 +
> >  Documentation/accel/rocket/index.rst    |   19 +
> >  MAINTAINERS                             |    8 +
> >  drivers/accel/Kconfig                   |    1 +
> >  drivers/accel/Makefile                  |    1 +
> >  drivers/accel/rocket/Kconfig            |   25 +
> >  drivers/accel/rocket/Makefile           |    8 +
> >  drivers/accel/rocket/rocket_core.c      |   71 +
> >  drivers/accel/rocket/rocket_core.h      |   29 +
> >  drivers/accel/rocket/rocket_device.c    |   29 +
> >  drivers/accel/rocket/rocket_device.h    |   29 +
> >  drivers/accel/rocket/rocket_drv.c       |  273 ++
> >  drivers/accel/rocket/rocket_drv.h       |   13 +
> >  drivers/accel/rocket/rocket_registers.h | 4425 +++++++++++++++++++++++=
++++++++
> >  14 files changed, 4932 insertions(+)
> >
> > [...]
> > diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/r=
ocket_drv.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..c22d965f20f1239a36b1d82=
3d5fe5f372713555d
> > --- /dev/null
> > +++ b/drivers/accel/rocket/rocket_drv.c
> > @@ -0,0 +1,273 @@
> > [...]
> > +static int rocket_probe(struct platform_device *pdev)
> > +{
> > +     struct component_match *match =3D NULL;
> > +     struct device_node *core_node;
> > +
> > +     if (fwnode_device_is_compatible(pdev->dev.fwnode, "rockchip,rk358=
8-rknn-core"))
> > +             return component_add(&pdev->dev, &rocket_core_ops);
> > +
> > +     for_each_compatible_node(core_node, NULL, "rockchip,rk3588-rknn-c=
ore") {
> > +             if (!of_device_is_available(core_node))
> > +                     continue;
> > +
> > +             drm_of_component_match_add(&pdev->dev, &match,
> > +                                        component_compare_of, core_nod=
e);
> > +     }
> > +
> > +     return component_master_add_with_match(&pdev->dev, &rocket_drm_op=
s, match);
> > +}
>
> Hi Tomeu,
>
> something I've noticed while playing with this: currently, it doesn't see=
m like
> it's possible to support 1-core NPUs. rknn-core-top is a real core, but i=
f no
> rknn-core is enabled beside it, it'll call component_master_add_with_matc=
h with
> match being NULL. This causes a kernel Oops.
>
> I'm not sure what the proper fix is, since the component API doesn't seem=
 to
> really have a consideration for a master with no other components.

Yeah, I think we could add a code path for single-core NPUs that
doesn't make use of the component API at all.

> I ran into this when I was trying to debug why I get job timeouts followe=
d by
> a full SoC lock-up on RK3576 by running with only one of the two cores en=
abled.
>
> As an aside note, my throwaway rocket-on-RK3576-hacking-branch is at [1] =
and
> contains some changes you may want to consider for v3, e.g. [2] and [3]+[=
4]. In
> [4], specifically the `domain-supply` part which means the NPU regulators=
 don't
> have to be always-on. Though feel free to pull in my entire ROCK 5B enabl=
ement
> patch.

Ok, [2] I already had in my WIP branch. Will pick up [3] and [4],
though I cannot test them myself.

Regards,

Tomeu

> Kind regards,
> Nicolas Frattaroli, who discovered that his cat is apparently 5% space he=
ater
> according to mobilenet while playing with this patch series.
>
> [1]: https://gitlab.collabora.com/fratti/linux/-/commits/tomeu-npu?ref_ty=
pe=3Dheads
> [2]: https://gitlab.collabora.com/fratti/linux/-/commit/73aba31a00b34c254=
be575b524da568e115d985d
> [3]: https://gitlab.collabora.com/fratti/linux/-/commit/bd3a7bf5054c54c29=
15a9dc0396730d0f24b3b7c
> [4]: https://gitlab.collabora.com/fratti/linux/-/commit/5da44d61b09c34530=
9f76159574d447d071c295d
>
>
>
