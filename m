Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0597F211A05
	for <linux-doc@vger.kernel.org>; Fri, 28 Mar 2025 07:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743147821; cv=none; b=Nl/qctm8R7Hy4f/OcKrEfWXjWulN8M7mdmyHa6lIL/8aMhknc1yvkuVosYxkirVY2TtPLt/Crpyqh1/Du1jw9eUgFN6/971R6mYcsEw3mgOlyeLQ81O4xX9CAqU46J2nkhciUMztiBLH8Swil6sugpbxWL+TWSBH3nNfsXf+nFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743147821; c=relaxed/simple;
	bh=GUwHGHtcekuJHk1xhCjyFJJsexDTEJVvMOtVROHgMUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VTGDn8M6uiTYoDl5yGqukG+xLKs9kVASCdfl3PPwArI3WJrJuiqLK6mGYo3LSIqUZL7RRmgKNnXaZopm8FkeaYRBKKWJYkjY2pO7Hgbn2zeK79NifwyEe6IBWYC1O4hg1XTvcdaXwQzbHL7CRjE6tED9XayigxKDzxalhfk/eRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SamfyIl/; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SamfyIl/"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22435603572so36766585ad.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Mar 2025 00:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743147819; x=1743752619; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhPsI/ZEvgNXitJgR9ckQ3y8+qZ9nTwox9jyo4rmDzU=;
        b=SamfyIl/T1QsiyCwCTcn2AxfXxPBDJcVehgo7JvRz2QXvultucq5fQAm2kRS9zEA44
         yQ1iYpuFYcHo+8BbBYoxuhXzkViHLZ8rjmitzuY+yS8USvZ5nsGn0tv1hywYVtC96eMl
         64/df5pRZcfcvoSt7j6aaSQCMVzGQngL0C9y/zHQ1ZveGYaxCXGaiikkAIf2RaSpQfnD
         uSnmHpNnIehG+H5USYAnez9i8LUr9r6hJT+7poEPNAW9dh2/yE9SwwEXztL+ldlBl2XG
         FHAXjPf4OEO60qKhgwRB0vgKyjB+xlaXiInc+1nyet3QEmT6OIUpa9m8E+g3o4JGMBUL
         OC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743147819; x=1743752619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EhPsI/ZEvgNXitJgR9ckQ3y8+qZ9nTwox9jyo4rmDzU=;
        b=lojVEvDh2zttWsaibDkdUjsdVzxxalzpIOWENMKuLqpxqR++iDWli5mOuLsu1m352K
         niP+NCbMau3K1k8VsbnQs43LNnQt/8GsIh7tmUckYNNnV6I4Fj16AuWfaNfQ1HCa8pA0
         pOcjrYS3Z4oVMg33ht9SaK7+lbuf9IYig7jfr3zSUPDOsr5H3lfpi2eKT5klP5bhaH5w
         +74wn0pH94cC4xeNORwzw6I8TtyPqAQMKvRHVtoj7F2nGYH6fy8ijn7aMRtDEVp0qgdA
         3jhNna04DDZlZviWqg16/8S56OWT9LGudwzJXI5lDmRImB9eLHyjzGE92j8xJDJ5RPGj
         YNLA==
X-Forwarded-Encrypted: i=1; AJvYcCUN+sg9j0oUalc1MarEjaXQxAO8I8jrR55DXIvcw0xdBmt6aznhuDWRgYhoK/vJ9G0b6c0flyhB21Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeMoR7kVVGUvxTJ2RJcZQnkYhV0/0q3hQFGm/qag52j3NbozyF
	X2KeiG7Lzn+SYKasTIl2BTe7oIt+mFUFXuWw7uunEqq3ix/9nZwTX8dZQU4+Ml0G6mCmxB8Z191
	nzSG2KxCj+JRvmO1cJUFEzo0Q3oo+ajztdZYX
X-Gm-Gg: ASbGncs7fkC0f8AfuL4B5SAxuWpynRlGVPZmja/w+6rRJjZ8+tH2fygHzLGfQKJfQvv
	eAmnoEofgUa4zXGd8Y/Dk1DNpo2PVZhCR47ceh+WaFeTzct7RpEwH2tbruW4xF1+U4GUiFgJpKB
	ovdWTGdMmqmFR+he1OFS+vsNmZXQa/fAlHBsFuW+LJeiTrqKmyHH+Cu5bH
X-Google-Smtp-Source: AGHT+IE/m0PqM3Q/R1MJGOYp2CNoRyCUvk7Z2WplHUYzJmL6YLxuW3IrkCSrOJ4naDkFdoQXHdd6i6W39PZ+itf3HRs=
X-Received: by 2002:a17:90b:1f90:b0:2ff:5357:1c7f with SMTP id
 98e67ed59e1d1-303a906c301mr10597175a91.30.1743147818760; Fri, 28 Mar 2025
 00:43:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319005141.312805-1-quic_wcheng@quicinc.com> <20250319005141.312805-4-quic_wcheng@quicinc.com>
In-Reply-To: <20250319005141.312805-4-quic_wcheng@quicinc.com>
From: Puma Hsu <pumahsu@google.com>
Date: Fri, 28 Mar 2025 15:43:00 +0800
X-Gm-Features: AQ5f1JoscHqcjKIzzp3PhAhHjK1iWgRRVM5T75yBZmXckMY8JRIwcMocaWatiQI
Message-ID: <CAGCq0LZBDa9H6wQhvmM3twAJwM_z_XWEy=-N9mp=HA4e+9Ee0g@mail.gmail.com>
Subject: Re: [PATCH v36 03/31] usb: host: xhci-mem: Allow for interrupter
 clients to choose specific index
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz, 
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net, 
	broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org, 
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com, 
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 8:59=E2=80=AFAM Wesley Cheng <quic_wcheng@quicinc.c=
om> wrote:
>
> Some clients may operate only on a specific XHCI interrupter instance.
> Allow for the associated class driver to request for the interrupter that
> it requires.
>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Tested-by: Puma Hsu <pumahsu@google.com>

> ---
>  drivers/usb/host/xhci-mem.c       | 24 ++++++++++++++----------
>  drivers/usb/host/xhci-sideband.c  |  5 +++--
>  drivers/usb/host/xhci.h           |  2 +-
>  include/linux/usb/xhci-sideband.h |  2 +-
>  4 files changed, 19 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index daea0f76e844..ed36df46b140 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -2331,14 +2331,15 @@ xhci_add_interrupter(struct xhci_hcd *xhci, struc=
t xhci_interrupter *ir,
>
>  struct xhci_interrupter *
>  xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs=
,
> -                                 u32 imod_interval)
> +                                 u32 imod_interval, unsigned int intr_nu=
m)
>  {
>         struct xhci_hcd *xhci =3D hcd_to_xhci(hcd);
>         struct xhci_interrupter *ir;
>         unsigned int i;
>         int err =3D -ENOSPC;
>
> -       if (!xhci->interrupters || xhci->max_interrupters <=3D 1)
> +       if (!xhci->interrupters || xhci->max_interrupters <=3D 1 ||
> +           intr_num >=3D xhci->max_interrupters)
>                 return NULL;
>
>         ir =3D xhci_alloc_interrupter(xhci, segs, GFP_KERNEL);
> @@ -2346,15 +2347,18 @@ xhci_create_secondary_interrupter(struct usb_hcd =
*hcd, unsigned int segs,
>                 return NULL;
>
>         spin_lock_irq(&xhci->lock);
> -
> -       /* Find available secondary interrupter, interrupter 0 is reserve=
d for primary */
> -       for (i =3D 1; i < xhci->max_interrupters; i++) {
> -               if (xhci->interrupters[i] =3D=3D NULL) {
> -                       err =3D xhci_add_interrupter(xhci, ir, i);
> -                       break;
> +       if (!intr_num) {
> +               /* Find available secondary interrupter, interrupter 0 is=
 reserved for primary */
> +               for (i =3D 1; i < xhci->max_interrupters; i++) {
> +                       if (!xhci->interrupters[i]) {
> +                               err =3D xhci_add_interrupter(xhci, ir, i)=
;
> +                               break;
> +                       }
>                 }
> +       } else {
> +               if (!xhci->interrupters[intr_num])
> +                       err =3D xhci_add_interrupter(xhci, ir, intr_num);
>         }
> -
>         spin_unlock_irq(&xhci->lock);
>
>         if (err) {
> @@ -2370,7 +2374,7 @@ xhci_create_secondary_interrupter(struct usb_hcd *h=
cd, unsigned int segs,
>                           i, imod_interval);
>
>         xhci_dbg(xhci, "Add secondary interrupter %d, max interrupters %d=
\n",
> -                i, xhci->max_interrupters);
> +                ir->intr_num, xhci->max_interrupters);
>
>         return ir;
>  }
> diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sid=
eband.c
> index 19c58ae60414..742bbc6c2d9b 100644
> --- a/drivers/usb/host/xhci-sideband.c
> +++ b/drivers/usb/host/xhci-sideband.c
> @@ -259,7 +259,7 @@ EXPORT_SYMBOL_GPL(xhci_sideband_get_event_buffer);
>   */
>  int
>  xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
> -                                bool ip_autoclear, u32 imod_interval)
> +                                bool ip_autoclear, u32 imod_interval, in=
t intr_num)
>  {
>         int ret =3D 0;
>
> @@ -273,7 +273,8 @@ xhci_sideband_create_interrupter(struct xhci_sideband=
 *sb, int num_seg,
>         }
>
>         sb->ir =3D xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci=
),
> -                                                  num_seg, imod_interval=
);
> +                                                  num_seg, imod_interval=
,
> +                                                  intr_num);
>         if (!sb->ir) {
>                 ret =3D -ENOMEM;
>                 goto out;
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 3fa8669e3b2d..7eaabe4f6c87 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1853,7 +1853,7 @@ void xhci_free_container_ctx(struct xhci_hcd *xhci,
>                 struct xhci_container_ctx *ctx);
>  struct xhci_interrupter *
>  xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs=
,
> -                                 u32 imod_interval);
> +                                 u32 imod_interval, unsigned int intr_nu=
m);
>  void xhci_remove_secondary_interrupter(struct usb_hcd
>                                        *hcd, struct xhci_interrupter *ir)=
;
>  void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
> diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-s=
ideband.h
> index 4b382af892fa..f8722afb8a2d 100644
> --- a/include/linux/usb/xhci-sideband.h
> +++ b/include/linux/usb/xhci-sideband.h
> @@ -66,7 +66,7 @@ struct sg_table *
>  xhci_sideband_get_event_buffer(struct xhci_sideband *sb);
>  int
>  xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
> -                                bool ip_autoclear, u32 imod_interval);
> +                                bool ip_autoclear, u32 imod_interval, in=
t intr_num);
>  void
>  xhci_sideband_remove_interrupter(struct xhci_sideband *sb);
>  int
>
