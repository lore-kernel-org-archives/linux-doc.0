Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748AB303C8A
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 15:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784216942; cv=pass; b=U4P5pH8HtdLpHeao+E2keIhGNC6u3hZpRRoFFSpCC5ucBdkiVYh2iwQpoJtYVIrSVnRZIH0OhRGS0ROQWHwF1cSLJxk/IT3Wdd9nJlqbg0ufZ/2gKV5dHH4D+62xz8+O7PxM0MF082azCUeJcTm0hZNzdeOOZlM1gDbtJ3tr0NM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784216942; c=relaxed/simple;
	bh=UEXyRcrLR/NC7O5VT7IsT6QSrIvIK2do2cEY+5CAQ8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mXisdVi+RYD01iYATVcGqCtCRq7GdpivySW2xUaOyIthAdgDNVtPJBf+YnpR/xtfcdJLuCx/IdV36bacsjm5WfpHyczJHorw6YXuyDtoqCvDqqJeV+Xg2jETUUzgNeSjHgLHdHGx0Vf02ka1zkArqEejtcQfIlULGwuNyZ9quNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HFvJ22ac; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HFvJ22ac"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c12614b81c9so1251202766b.3
        for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 08:49:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784216939; cv=none;
        d=google.com; s=arc-20260327;
        b=ZG7bK03oDHST1BaSvi/wdKmBA40EI6pXKrBbePkR+9lNGBeafNGIvF8NMuexDG8tT7
         ubg/xMx4AxNaRqcEqSzjPGrVOyME+fS4rOdFtY2xG8w77pTBSladWmT1v3U5gh1OTTsF
         ITqpFuwKVX2XcUfxf2dInMxSXO2hPhqS3oHE5BxHX13J/j864ncazdDC2gapx+obG2BR
         Rqpc2JxxgBeA3/8QSSlEKo8ST5SumJ/IKU4sla0kFemfau9TLROMmFcScXg97SEqh9jn
         4PYK5FhRjZAGHuHhrt8I4VGPiQFKHLKoI+KUZ/BYgESzF9FB3glr2jOSXPAC+IyTEqom
         Kj6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PvF3PECHceKTp1msrpngOjA14xNenycZL6f6YaUqTqA=;
        fh=x56fTRqcvkW3gBnAxI+/h6vsQ3r+RKDRYSsoU+1IPgQ=;
        b=MUNPytdWD9hXz9k7rj6THczBYuVl07fr7rKh3b4gc1swKt9Y4KpYRQDShCJFM+v2Hv
         5x3UGwK7++AgCttpJTXPXy8UTnLknOb6xBc0rI/mRIPHOevYkHIRXWBrhLbOhmyrUw0u
         Vdpm+xS3yE1VTEOc8O1jBuqwXv5YoEhhVJys89uYHIDvr46n2SR5nAo+USxL4DLEUU7Y
         TcWestIPNODDXBwgsEwQLboxap8uz0Xtpn70H/PbeG3F0xEH5kaKPsKlAp0fyIR7pqp3
         w8s4bpmoxfQpctYoH8OvCXzWeKrEIoKPJvrnZ23o62qejytyn8ErDYriAtwi6qyNShSU
         qCeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784216939; x=1784821739; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PvF3PECHceKTp1msrpngOjA14xNenycZL6f6YaUqTqA=;
        b=HFvJ22acY08A0ZH5pzkLrxI9y5eisg+U3AQfIKhxWEX2QlOsaNBogrXrd0+UwYgWRQ
         hT/A/uGDSMAhqNInnZnGD6YWO85ft4YXpyE7rrKE0fRqyOome+GDjtOKUoUkQ24GuPCK
         m3G9qBzv+gOse9t2lMXJe6k8BpK/0Ubu89WnJdB2UUZY7Orm54+VDYqVjBd0zE8//Qkp
         KO81Cboh32JUwgttkq6qEcGou9HONLfy0A5vzxb7PQD34fUYHbZitMxYjnid9yedRETr
         eJ+XIBObv3Zc9RYyvhjN+pemJvEac7zGiYIEAfivr02CpRVKBsj4lvIao7MXQDQJMg2h
         stig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784216939; x=1784821739;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PvF3PECHceKTp1msrpngOjA14xNenycZL6f6YaUqTqA=;
        b=GWRXIov/e2xSNFm71BKjNhzwSUTsQUWUlxKk/5HIxc9eSNXDsRGiaKrxpeUtHZ4Rka
         7E7tikx+V9+NT0TTuoCezvJjCJdwI84DavIXsnJsSfiCLgU6zn8PEBAmtPObornqpXBP
         GEB0W2wlBMcwTH6d0fkjMUTQ4DJNRQ935H+s5UVa8kib6h4Mg2CPjREOeSUQku67V5vs
         acJahxVsN+5nX1QyRgS0iCLl/qkOOnubY5Iu972lSOfCQesdC7wLnzi9GCtYChaAVBAV
         AHNLin7q0Rds/h4YWAF5+azIT0t3HjgVzSMMlqV8nQom1yncFf3jhlRvjN2bIqaMdyLz
         da2g==
X-Forwarded-Encrypted: i=1; AHgh+RoNfmz4E2bWmR8zpGURJcwJuo6h3grMzMc4vOBNp2EuQJZEHCHxp9nt+1RUsKX3AXQ/xcNgOPhtzqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YybOQoVpzmWqqn4Lt4IeeqMJrSl0C23ldg3NnZl5WA5/Fs37gGU
	GrefTd98PqINWnwrhqvAIc/CaQsOdDF4UjtyQzAprH6bGPFt3KvkxSo9Fa8WY87rCu/UZygCESg
	HSeUl7BPU30rr58sj6ysyu6Xplf47NedEeJeXMD7a7Q==
X-Gm-Gg: AfdE7cmIUR1QBGtdjlGrR2z1tK9982i4mAyTnwMYid8tGSNGNT+yUXesLR70zdtkKgz
	6gxE+NigrKCnE02jTzbAlj7DIMCI60323A58hJpjBBlYDluvGsypC0H8zsudb6e0fM1uKzSHDzO
	3IIEWDzxYK18Uwp4ea5hm47ovths+vIlMFsx0GWJoyjbeRlEIesCQV1vx0DvrJwJZrPVRRhDQfm
	fDrv+ukwiFUdRmmQfw6MSe/i/+NMU/DiAZ8fj0DGYt+UGv6ug4OTGFqTaUS2Hb4TOwnp8Xw4hSj
	JogbQ/ie25GIS4cVCX5R
X-Received: by 2002:a17:906:478a:b0:c12:959a:1477 with SMTP id
 a640c23a62f3a-c16792a5896mr462980266b.40.1784216938593; Thu, 16 Jul 2026
 08:48:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710192831.3440427-1-tanmay.shah@amd.com> <20260710192831.3440427-4-tanmay.shah@amd.com>
 <ale0KIu6hXNvN0q9@p14s> <66e4a85c-be14-4bd8-8328-bf17d2437994@amd.com>
In-Reply-To: <66e4a85c-be14-4bd8-8328-bf17d2437994@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 16 Jul 2026 09:48:47 -0600
X-Gm-Features: AUfX_mzLfM9exUpIBMTfqHJwwmxDBQ4xwa4WD88FJUhtRPdx2rllkZk4ggWYQ8c
Message-ID: <CANLsYkyL8_YSb39QqbC0Z+udahMtCV1e+OeoKGvmGSxQ6h3_qA@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jul 2026 at 11:28, Shah, Tanmay <tanmays@amd.com> wrote:
>
> Hi,
>
> Please find my response below:
>
> On 7/15/2026 11:24 AM, Mathieu Poirier wrote:
> > On Fri, Jul 10, 2026 at 12:28:29PM -0700, Tanmay Shah wrote:
> >> 512 bytes isn't always suitable for all case, let firmware
> >> maker decide the best value from resource table.
> >> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
> >>
> >> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >> ---
> >> Changes in v5:
> >>
> >>   - fix documentation about alignment of the buffer size
> >>   - change version field from u16 to u8
> >>   - remove buffer alignment check
> >>   - Separate buffer alignment vs MTU of a single buffer
> >>   - Use buffer alignment only to get next buffer address at alignment
> >>     boundary
> >>
>
> [...]
>
> >> +#ifndef _LINUX_VIRTIO_RPMSG_H
> >> +#define _LINUX_VIRTIO_RPMSG_H
> >> +
> >> +#include <linux/types.h>
> >> +#include <linux/virtio_types.h>
> >> +
> >> +/* The feature bitmap for virtio rpmsg */
> >> +#define VIRTIO_RPMSG_F_NS   0 /* RP supports name service notifications */
> >> +#define VIRTIO_RPMSG_F_BUFSZ        1 /* RP get buffer size from config space */
> >> +
> >> +/* Version of struct virtio_rpmsg_config understood by this driver */
> >> +#define RPMSG_VDEV_CONFIG_V1        1
> >> +
> >> +/**
> >> + * struct virtio_rpmsg_config - config space for rpmsg virtio device
> >> + *
> >> + * @version:        version of this structure, currently %RPMSG_VDEV_CONFIG_V1.
> >> + * @size:   size of this structure in bytes.
> >> + * @rpmsg_buf_align: alignment in bytes for each buffer. Must be a power of
> >> + *               two. If 0 then no alignment will be done. This alignment
> >> + *               will not decide actual size of the buffer but will be
> >> + *               used to decided the start address of the buffer. The
> >> + *               actual size of the buffer can be different than the
> >> + *               aligned size of the buffer.
> >
> > Is there really a need to have a buffer size different from its alignment?  It's
> > not like the (small) delta between the buffer size and its alignment will be
> > used for something else.  I'm fine with a buffer alignment requirement but in
> > those cases, the firmware should set the size of the buffer in accordance with
> > its alignment requirement.  Otherwise, the complexity needed to manage the
> > discrpancy between the two yields a driver that is hard to maintain and prone to
> > bugs.
> >
>
> I had the same concern before. However, following example changed my mind:
>
> So, a single buffer size is the MTU size of a packet for the protocol
> supported by the firmware. Now that can be different than the aligned
> size of the buffer.
>
> For example, the higher level protocol (not rpmsg) has 430 bytes as the
> max size of a payload. However, cache line alignment is 64-bytes. Then
> in that case, the aligned buffer size is 448 bytes. But, that doesn't
> mean we can say protocol's MTU size is 448 bytes. If user end up
> treating MTU size 448 bytes and use space beyond 430 bytes, then the
> higher level apps might discard that data and communication may fail.
>

How is that scenario different from today's 512 byte buffer size?
Most users don't use all 512 bytes and we don't run in the problem
described above?

> The alignment field is used only to decide where the next buffer start
> address is to ease cache operations.
>
> Sure, we need to maintain this complexity, but I think it's worth it.
>

The same as in my previous email to Arnaud applies here - is this an
immediate requirement of something we think may be happening in the
future?


> Thanks,
> Tanmay
>
> >> + * @txbuf_size:     Tx buf size from remote's view. For Linux this is rx buf size.
> >> + * @rxbuf_size:     Rx buf size from remote's view. For Linux this is tx buf size.
> >> + *
> >> + * This is the configuration structure shared by the device and the driver,
> >> + * read when %VIRTIO_RPMSG_F_BUFSZ is negotiated. The fields are laid out so
> >> + * the structure is naturally 32-bit aligned.
> >> + */
> >> +struct virtio_rpmsg_config {
> >> +    u8 version;
> >> +    __virtio16 size;
> >> +    __virtio16 rpmsg_buf_align;
> >> +    /* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
> >> +    __virtio32 txbuf_size;
> >> +    __virtio32 rxbuf_size;
> >> +} __packed;
> >> +
> >> +#endif /* _LINUX_VIRTIO_RPMSG_H */
> >> --
> >> 2.34.1
> >>
>
