Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D18C212B11
	for <linux-doc@vger.kernel.org>; Fri, 28 Mar 2025 07:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743148099; cv=none; b=PNy5HBCA0mkWJfSjUcYf8d/VfIIfI3P8uZjNEL09m4bFCxaMJmBnltP1gIUthj0wT9718ZfuafGoyB3JpMh+uaPmT+DKzxL5dpAO5d+lqDAPtpICJ0s7ifO4pGDQBFPAgXB/9+muDHrhxMj8vAMdoAHqOTA3Oc2MqpAq2EKUI9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743148099; c=relaxed/simple;
	bh=1VRG5gptAlPsvHDNKA/iNCN3DmfzeGWVXmFnEWaIm8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dvxYWUBoJGBxAi6P8nrcRDuryHBOo04eJWpHoezkDdwKdY4cu04V1jNl6kfGmDowX7/6bXYlJWUmn1ed1B9oc3L5do88aro05nru1tOeH0qz4u9qpBjHhHrjAo0QgJ9H7hS5aGKN1ip2Pfbg2cF/nGvDeaApb1vP17dUvkfnQ58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GhNKDRh+; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GhNKDRh+"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3018e2d042bso2172863a91.2
        for <linux-doc@vger.kernel.org>; Fri, 28 Mar 2025 00:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743148096; x=1743752896; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRzjJUpNQVaJwaxONUg7oIZp4mvWCO0S0U577rY3xUE=;
        b=GhNKDRh+8za6emkYm3zB+1svPtZsuKZfHMXkjR67qgoXb+RRsqj9TIUvo0IJOIEaMN
         9XkY9jrSXp18Lp2nJOHLyGyhYjhbS7zyFGeT/L+4wFmRXfmvUnePmFUDvory/ork7SPa
         wEfDBbb6U3kIp7/w/3FcCIDzT9/Xd8wqDMF0z7mtnQkPDavyDrp/PPLBbC9xp7OBR+rH
         Kyje2oJGFqOJiIJZRmjEdj0Zxtmr+ZrnWHb8/BkFhNOGYROz1BjcWupoKvsXmQSsgIgF
         wFA7vyvnxDqZUHbwKBikk3pa8Edr7eH9kaLj1am71FoIKmPKN5NsJlCDXL8WPip259gQ
         TNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743148096; x=1743752896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRzjJUpNQVaJwaxONUg7oIZp4mvWCO0S0U577rY3xUE=;
        b=Ygi3z53Z9aJR4rJKlE9d+qfbecZ85k/9dn3daQhlJRTPQ3W1ZrFkcmJJbg9kQAK84N
         N7vhVRdeXw0bUG6g5YIBEpiFkEO0MKKJqTuj2B0D0hYFbQ2pwlbiVFM/N8FMAU8j57ar
         7smtPvguhGoyRZTfeB3mitojj5xynbCmrHiBmPkhTl1sNaI1i0bt+ajOWjPxFAuLolni
         y1yEmVZu6nQrV/W5rlBjSGAnw/OwIyG/gnc2MqIe9IofW3whPvhVoxbuR5I2mgns9O5A
         tWPXIA8V2VU1kf+2IVfMjUjocFQpo1US7mZcxBzlm9C4EyWcGyyrT7zt/auyKeayIl3y
         J13Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/g2y+zJ1xKMEGTGX2mrGlG6YKDMAqLpJH4YWkUT3XyOOeT3r/oDu3Pihc3W/vRW9JpqTkbM1HxQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0+DGjpVaUr7hIznjztc2rs7Oh9DJmiDXw/Hg39ETengOCGhfP
	VGZHYrA9E8fq9zvEsMBncUFNqfdZ/vk2Noac+zn8cOJr+P/dJIUSBs0Z5snRkJEcOYPZuOYrllq
	1BVmO/RdiYHvf+YneGep45KXRZz/Dd9L5GM3N
X-Gm-Gg: ASbGnctAN4Fj063164nU6nVQEiyY0g4GpbOIxGmle+E51qxjA1q4RFYlKHnD2PFQ6jv
	Uu0xHPZ64FFIV7V+oe+RlxbPMjdCv6VKH6z0ZTYSiaXJKdkya3IIRLxS04nO2ACUk9FmlekxNa2
	v6DR3P9d8zuLM8eXXFc8d+s1g8vqIK7/m34Xe8dCHc2J9+pWXGvekbdNUb
X-Google-Smtp-Source: AGHT+IEBaxbL6HDDZL1bOaRlCywyrAoYUcEN4dxkxdnp4CwBP8mzj2N3dlVlnb1ED+EAow643ibowia8gXssCwa290c=
X-Received: by 2002:a17:90b:2590:b0:2ee:bc7b:9237 with SMTP id
 98e67ed59e1d1-303a85c8a48mr9336414a91.27.1743148095893; Fri, 28 Mar 2025
 00:48:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319005141.312805-1-quic_wcheng@quicinc.com> <20250319005141.312805-13-quic_wcheng@quicinc.com>
In-Reply-To: <20250319005141.312805-13-quic_wcheng@quicinc.com>
From: Puma Hsu <pumahsu@google.com>
Date: Fri, 28 Mar 2025 15:48:00 +0800
X-Gm-Features: AQ5f1JrlHT0yIgJWcDgTjea01A8oianDjLUwfLWklDsfjSug36IyOZb6G4iSTYk
Message-ID: <CAGCq0LYvXsRpfhWrvWu0=hQHBVYqJ2ifnv0wEbPWtmTw7j6-CQ@mail.gmail.com>
Subject: Re: [PATCH v36 12/31] ALSA: usb-audio: Introduce USB SND platform op callbacks
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

On Wed, Mar 19, 2025 at 8:56=E2=80=AFAM Wesley Cheng <quic_wcheng@quicinc.c=
om> wrote:
>
> Allow for different platforms to be notified on USB SND connect/disconnec=
t
> sequences.  This allows for platform USB SND modules to properly initiali=
ze
> and populate internal structures with references to the USB SND chip
> device.
>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Tested-by: Puma Hsu <pumahsu@google.com>

> ---
>  sound/usb/card.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++++
>  sound/usb/card.h | 10 ++++++++++
>  2 files changed, 59 insertions(+)
>
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index 6c5b0e02e57b..4ac7f2b8309a 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -118,6 +118,42 @@ MODULE_PARM_DESC(skip_validation, "Skip unit descrip=
tor validation (default: no)
>  static DEFINE_MUTEX(register_mutex);
>  static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
>  static struct usb_driver usb_audio_driver;
> +static struct snd_usb_platform_ops *platform_ops;
> +
> +/*
> + * Register platform specific operations that will be notified on events
> + * which occur in USB SND.  The platform driver can utilize this path to
> + * enable features, such as USB audio offloading, which allows for audio=
 data
> + * to be queued by an audio DSP.
> + *
> + * Only one set of platform operations can be registered to USB SND.  Th=
e
> + * platform register operation is protected by the register_mutex.
> + */
> +int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops)
> +{
> +       guard(mutex)(&register_mutex);
> +       if (platform_ops)
> +               return -EEXIST;
> +
> +       platform_ops =3D ops;
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_usb_register_platform_ops);
> +
> +/*
> + * Unregisters the current set of platform operations.  This allows for
> + * a new set to be registered if required.
> + *
> + * The platform unregister operation is protected by the register_mutex.
> + */
> +int snd_usb_unregister_platform_ops(void)
> +{
> +       guard(mutex)(&register_mutex);
> +       platform_ops =3D NULL;
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_usb_unregister_platform_ops);
>
>  /*
>   * Checks to see if requested audio profile, i.e sample rate, # of
> @@ -954,7 +990,11 @@ static int usb_audio_probe(struct usb_interface *int=
f,
>         chip->num_interfaces++;
>         usb_set_intfdata(intf, chip);
>         atomic_dec(&chip->active);
> +
> +       if (platform_ops && platform_ops->connect_cb)
> +               platform_ops->connect_cb(chip);
>         mutex_unlock(&register_mutex);
> +
>         return 0;
>
>   __error:
> @@ -991,6 +1031,9 @@ static void usb_audio_disconnect(struct usb_interfac=
e *intf)
>         card =3D chip->card;
>
>         mutex_lock(&register_mutex);
> +       if (platform_ops && platform_ops->disconnect_cb)
> +               platform_ops->disconnect_cb(chip);
> +
>         if (atomic_inc_return(&chip->shutdown) =3D=3D 1) {
>                 struct snd_usb_stream *as;
>                 struct snd_usb_endpoint *ep;
> @@ -1138,6 +1181,9 @@ static int usb_audio_suspend(struct usb_interface *=
intf, pm_message_t message)
>                 chip->system_suspend =3D chip->num_suspended_intf;
>         }
>
> +       if (platform_ops && platform_ops->suspend_cb)
> +               platform_ops->suspend_cb(intf, message);
> +
>         return 0;
>  }
>
> @@ -1178,6 +1224,9 @@ static int usb_audio_resume(struct usb_interface *i=
ntf)
>
>         snd_usb_midi_v2_resume_all(chip);
>
> +       if (platform_ops && platform_ops->resume_cb)
> +               platform_ops->resume_cb(intf);
> +
>   out:
>         if (chip->num_suspended_intf =3D=3D chip->system_suspend) {
>                 snd_power_change_state(chip->card, SNDRV_CTL_POWER_D0);
> diff --git a/sound/usb/card.h b/sound/usb/card.h
> index cdafc9e9cecd..d8b8522e1613 100644
> --- a/sound/usb/card.h
> +++ b/sound/usb/card.h
> @@ -209,7 +209,17 @@ struct snd_usb_stream {
>         struct list_head list;
>  };
>
> +struct snd_usb_platform_ops {
> +       void (*connect_cb)(struct snd_usb_audio *chip);
> +       void (*disconnect_cb)(struct snd_usb_audio *chip);
> +       void (*suspend_cb)(struct usb_interface *intf, pm_message_t messa=
ge);
> +       void (*resume_cb)(struct usb_interface *intf);
> +};
> +
>  struct snd_usb_stream *
>  snd_usb_find_suppported_substream(int card_idx, struct snd_pcm_hw_params=
 *params,
>                                   int direction);
> +
> +int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops);
> +int snd_usb_unregister_platform_ops(void);
>  #endif /* __USBAUDIO_CARD_H */
>
