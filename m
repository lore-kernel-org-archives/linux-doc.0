Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99748255F52
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 14:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765464414; cv=none; b=fjzoURryOcNKxhPf1UFUZbfejJwmS//YnDATk37l9YK2myj2ArPTZ7URLh0f5dknA9Idj5GkQJL51iFVXMJmAJFjOeR9/094Lu8DoTLCq3L0pWxA4ZqJsSLub9bgi91MNhPtcv95Oms51RfPrNXUkPUW0TWfVnqu3ekEglPeBxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765464414; c=relaxed/simple;
	bh=Z8pwXA3E9NvlNSAbfNFGW711RMsclhI4mGoYLMvcV1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jJUTAsMR6tcpc/PcujISkJ2IHB9XoEh19KvhXpFl0oKPFW1tkLuclzh7Vqry8Pifxy4x0XA2PE08RcoP+UJwXYfo0FoM6QPXE4VajP3Z29a1XVwP2XL5ITVpy5fDSVz9bXAQQ6CR9j6RqJnl9Mj0tWKuDmU1gMijaTlIEil+/Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EopJAEP6; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EopJAEP6"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37902f130e1so1734551fa.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 06:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765464411; x=1766069211; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kfi80okuvZYcN9lPw2PbCSm5AvfB6SEfDQ+chpjk5ho=;
        b=EopJAEP61w7/YltiLtsqH+/KG7Ua8WRhqulEXZM/I/xE4miTfH8VNu0nyaKoPAw9c0
         aaxgmiGR7aWUsRlCiY64YKpItR2YuQ21RIAxOoWvXr/wgkZU2zDjAtE1nrLk7U43u0ON
         qN651sS8Yv/k0at/itMN18tOPCD2l569Wzr8afBSQVVc+VxE72so68Gqv5Pb3sA9NQin
         MToa9BTFPwZFMeQU6Mdw3CQdL7Y8uQaDyoBLdPixXYUiby7qVVXVtlsTY6xat4Zlnplf
         zoPPLVFIvvKcMxoWcEfNyiTboUB2DHcjKE19AZcjNhyUq20afIJHKaf/3//oLWk8U9ce
         DHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765464411; x=1766069211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kfi80okuvZYcN9lPw2PbCSm5AvfB6SEfDQ+chpjk5ho=;
        b=k1MXXvWa5gsoHHs8uicRz8IFO1jUv9K2Z3azZ9Rc9gHxRU641Vo6bR1gaGmwfCgg1m
         bfSg5sSz1C0mYKzx41gTiXiKKYws3D/CRkS+0KOwHYl3QlyG4VA5EkGhQ3Lo9AsfZV2I
         pGFn/QP2H6nQVqgZ5WwzoLqaBZS7aHdL2cu+D5XobdhKDeNsRFyPtkgSA9DueXZ0sdEg
         rKx+rZKrLOQClxkTJvpfGhC3k+5rQ0RNdLclGcsMHrd28VlbkBKQL7mqezfviWDL+q2i
         W8kDtN8kSuSrY8Luaq6G+Z5gJYWheT0u3XSIK5pceSy4dWZy65Qe7g/qui5a3Ir6LipQ
         1LFw==
X-Forwarded-Encrypted: i=1; AJvYcCWWPfxz9z7HUwe2h9ACtVHnUhs5k2hBg+bVAC50nj4k7c9SF18OZY/jhMQEaTQ84nnnXis+HRZxCPo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwivAU8kSYAeZbSiV2TlyG96CmlrYDVfTcGW6po6iSBH/g+5Ixc
	C0jK6yrEFKbwmA0HCZouNUhxKJlfBJt2hUt1L0I+974kgmJglB+Rgf4fS/O1G8lUby/zTvNqY+0
	CTl/pdlI2riNfnlrTISq4FvhlkAxPAY/td/b81Fye3g==
X-Gm-Gg: AY/fxX4rJP+9hDpU+iV91STo4bWYsxQrOktvru3QHxWG9WGSRWswgdABzJEO7Hywfsr
	bCVCqkoMWpsvmW84VqO4q7ntzTqBogqaj10pM4EWAENba02KpwZm/EeHyDrGGsnQ2EPU4tl7ygb
	2bCQ/2UGkT3OZmFNgvpD2zKwWWOxbazivKetAHH9PjKxFq86hxbFzzmUuCmcK+uOx9W/DCgapvn
	pDg+hvKSog0JCqKhnV1kQFhRBOVWcnrxEj3T9v9uaUGgzeQNYTYnrol055js6DSgPv7dWZ5jXFx
	2I7WRHl1/kjr8T/o0oP/ix8qRaQB
X-Google-Smtp-Source: AGHT+IERof09vBwYW6Dusa4ESex7D3E3lmDizgOtvwohmRz9tPqKmbQKRDJ3NyiWTHVawhoa/4Iz5XZwXW5E5XjxWk8=
X-Received: by 2002:a05:651c:31da:b0:37e:5602:4a53 with SMTP id
 38308e7fff4ca-37fb21548b3mr18569841fa.22.1765464410490; Thu, 11 Dec 2025
 06:46:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251129002533.9070-1-vishnuocv@gmail.com> <20251129002533.9070-2-vishnuocv@gmail.com>
 <he73fiwxso45ykidteqz2s2gjklezsyd47xwxtwlfes27kxuq3@ucwhmacbtsn4>
In-Reply-To: <he73fiwxso45ykidteqz2s2gjklezsyd47xwxtwlfes27kxuq3@ucwhmacbtsn4>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Thu, 11 Dec 2025 23:46:13 +0900
X-Gm-Features: AQt7F2qKZRA9_LzFSrr86WtwwgCQD2YzopRBEv1hQn9SUqGi0iGUOpwH4ifiZ08
Message-ID: <CABxCQKt8U-QkT-LWiFR72X_XkRrkeUFsbC_rWOb=90LQxJ7MjQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] input: trackpoint - Enable doubletap by default on
 capable devices
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: corbet@lwn.net, hmh@hmh.eng.br, derekjohn.clark@gmail.com, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, mpearson-lenovo@squebb.ca, 
	linux-doc@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
	platform-driver-x86@vger.kernel.org, vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dimitry,

Thank you so much for the review.



On Thu, Dec 11, 2025 at 3:49=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Vishnu,
>
> On Sat, Nov 29, 2025 at 09:25:31AM +0900, Vishnu Sankar wrote:
> > Enable doubletap functionality by default on TrackPoint devices that
> > support it. The feature is detected using firmware ID pattern matching
> > (PNP: LEN03xxx) with a deny list of incompatible devices.
> >
> > This provides immediate doubletap functionality without requiring
> > userspace configuration. The hardware is enabled during device
> > detection, while event filtering continues to be handled by the
> > thinkpad_acpi driver as before.
> >
> > Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> > Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > ---
> > Changes in v4:
> > - Simplified approach: removed all sysfs attributes and user interface
> > - Enable doubletap by default during device detection
> > - Removed global variables and complex attribute infrastructure
> > - Uses minimal firmware ID detection with deny list
> > - Follows KISS principle as suggested by reviewers
> >
> > Changes in v3:
> > - No changes
> >
> > Changes in v2:
> > - Improve commit messages
> > - Sysfs attributes moved to trackpoint.c
> > - Removed unnecessary comments
> > - Removed unnecessary debug messages
> > - Using strstarts() instead of strcmp()
> > - is_trackpoint_dt_capable() modified
> > - Removed _BIT suffix and used BIT() define
> > - Reverse the trackpoint_doubletap_status() logic to return error first
> > - Removed export functions as a result of the design change
> > - Changed trackpoint_dev->psmouse to parent_psmouse
> > - The path of trackpoint.h is not changed
> > ---
> >  drivers/input/mouse/trackpoint.c | 51 ++++++++++++++++++++++++++++++++
> >  drivers/input/mouse/trackpoint.h |  5 ++++
> >  2 files changed, 56 insertions(+)
> >
> > diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/tra=
ckpoint.c
> > index 5f6643b69a2c..67144c27bccd 100644
> > --- a/drivers/input/mouse/trackpoint.c
> > +++ b/drivers/input/mouse/trackpoint.c
> > @@ -393,6 +393,48 @@ static int trackpoint_reconnect(struct psmouse *ps=
mouse)
> >       return 0;
> >  }
> >
> > +/* List of known incapable device PNP IDs */
> > +static const char * const dt_incompatible_devices[] =3D {
> > +     "LEN0304",
> > +     "LEN0306",
> > +     "LEN0317",
> > +     "LEN031A",
> > +     "LEN031B",
> > +     "LEN031C",
> > +     "LEN031D",
> > +};
> > +
> > +/*
> > + * Checks if it's a doubletap capable device
>
> Please finish the sentence with a period.
Got it.
I will complete the sentence in the comment:
>
> > + * The PNP ID format is "PNP: LEN030d PNP0f13".
> > + */
> > +static bool is_trackpoint_dt_capable(const char *pnp_id)
>
> Let's call it trackpoint_is_dt_capable() to keep with common
> "trackpoint_" prefix in the file.
Agreed.
Will use trackpoint_is_dt_capable() instead of is_trackpoint_dt_capable.
>
> > +{
> > +     const char *id_start;
> > +     char id[8];
> > +     size_t i;
> > +
> > +     if (!strstarts(pnp_id, "PNP: LEN03"))
> > +             return false;
> > +
> > +     /* Points to "LEN03xxxx" */
> > +     id_start =3D pnp_id + 5;
> > +     if (sscanf(id_start, "%7s", id) !=3D 1)
> > +             return false;
> > +
> > +     /* Check if it's in the deny list */
> > +     for (i =3D 0; i < ARRAY_SIZE(dt_incompatible_devices); i++) {
> > +             if (strcmp(id, dt_incompatible_devices[i]) =3D=3D 0)
>
> Why can't we use strncmp(pnp_id + 5, dt_incompatible_devices[i], 7) here
> (after ensuring that pnp_id is of sufficient length to begin with) and
> avoid sscanf()?
>
Agreed.
I can avoid the temporary buffer completely and compare directly using
strncmp().
Thank you.
> > +                     return false;
> > +     }
> > +     return true;
> > +}
> > +
> > +static int trackpoint_set_doubletap(struct ps2dev *ps2dev, bool enable=
)
> > +{
> > +     return trackpoint_write(ps2dev, TP_DOUBLETAP, enable ? TP_DOUBLET=
AP_ENABLE : TP_DOUBLETAP_DISABLE);
> > +}
>
> This wrapper seems an overkill given that it is called only once and
> always to enable the doubletap.
Understood.
Will call trackpoint_write() directly instead of using the
trackpoint_set_doubletap() wrapper.
>
> Thanks.
>
> --
> Dmitry



--=20

Regards,

      Vishnu Sankar
     +817015150407 (Japan)
