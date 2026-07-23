Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CA74477E9
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 14:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784816051; cv=pass; b=TXTOC/x8hVD+zS1y2/1mSnhJgq+JKbCVq0NssyWG9peR8pScHl3JIzMLaM4MGwpcKcVL3+WLvUDLtGrdVGg8JF0BvHq2IGGnIHoY8yuggb61GEVxTn4q2tIMnyyhhEloX2Hq/m66oX0a41PtjdPLguT1neCHpYYtS6KWVw0qrAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784816051; c=relaxed/simple;
	bh=gC/VgX74FIWj0zWFA6nhR09WrZwkJ3I0vrcDBdVwE68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VGM44Q4IaTUquFedw4xRm1Fj7CdtH24rhBvtTjsEKLL6LV90Ua5Sp5E18zxVF0WJeouMrvKYK7kc0CT26gXYYQdTu61D9Q1UV8hd3preycas1JZtsFpazLT4oxUfx5EFfHfu6tlQfuzausNCX2G4ATP9bgsVLaBMxzp+BiE5dDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tIwoCQl8; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tIwoCQl8"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-698bf7a1a2dso928143a12.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 07:14:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784816044; cv=none;
        d=google.com; s=arc-20260327;
        b=IXNRlMpqrFtV2wWlIZnk1qDn9n0qh3nhmuOD27/22sjaDD6xTKC7uL0OXy3D2ZqIT+
         Q5SChosA7Tej4/VZBmzTApLN01u4Eldtp4BmeGvhtwyPl70zIQm6bp14wUHrkGRHbVYa
         WHElgsannat//h7bwQ3qGMDRWLKzXOQ4iYWw3w4epfDnLgkY3RsqKRGZYasrfeili5xV
         yKxaplXwiBujdDZGP+iy/8D2QK8tpLY0criuu9qxwwh4hwc4MmfPC6pDuEGSmB5LXQca
         sPaBHrypEyhtrgwHT3L7qPqcOIqVMPLBRuRHArx+ffx/4FYKS1sdmSpbbIHY87um/tq7
         QI6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HWcJ9GwPAKyLQW8VPPe1AOSiEe8FXr4AE1Gxor8Na4g=;
        fh=W/PBWm0+27a5A+Kw/DzKSJ9grcY6x+moIYtLGggF0Hk=;
        b=jZWQgUWT0PX7b21/JM+NmqTNPYS3Qu3H/wdbDbtSYdq1uixJoxTBIOmxZV7LpwjAth
         QHGYboNXocua2nqbyi5fwxqlqbqvWjsTSvSUI3DOgjqSWR/2Foj2Hhl89ndqXklpg5Q9
         ykIilZIgRx3s7tRf26V0dCTKXdUA683Lp43ztIkvfeUVOJx/D4U1zXMxlZ9WOr4Hn4MW
         +ftKeM6oUkAQzMERMzcPRpqLmx2KF1Xvq3no3lHZW4C4Jb6weqSxAeCcAzm3d5dVPNql
         oFgQXMxYPw7ULWgLmrlKQVV/QOntzqjm3VqRTL7ktXUzEXgCxRJxZwrIBE3jrISNPbcb
         wxcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784816044; x=1785420844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HWcJ9GwPAKyLQW8VPPe1AOSiEe8FXr4AE1Gxor8Na4g=;
        b=tIwoCQl8ZXvYJnDQ02TcxHKJRBCgmgStwE85AdRcYq+6N2dkHwYgRRGlf4mg1brMAr
         p7ARgVGNU+SYF1+VkQV2GT/NEIZIItejn+WNsIZGwmNTicHLBN5AnwI8VsGxyi1gHbgf
         YoRDED+/f6ONCZVQrb5avrrmLO45CtaA97vVMtrEW54LMNS3s5vuPpPhBLOdcbGkCT6a
         mBUEaFiW0R7iGkUE1cUws5p8GVjONj8j6dykzoTna2SacuCoJ9Bw+MM1abxTJ17NRC9G
         aA7TlZ8D0oe8tvZfVn9MFgPi80eeoek6u08pHLMZ/9WFzKUaYnqzNTeKzM/Tff05cJw7
         ODZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784816044; x=1785420844;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HWcJ9GwPAKyLQW8VPPe1AOSiEe8FXr4AE1Gxor8Na4g=;
        b=qV6a2/Fqv5G7BJj6UkMI1+famWxk5fbx/4wUjdDtIuh7afKL35w6XL/0MhN3hInIwN
         s5OUl4nMjXbZz5rcDVYExURvRZaWa3ZkKwO2eVoo7AgoplnT/+oXhX4lonL2Csa3P9yQ
         ymfB/1S9bQkq8wDJQM2L10KKZq6k8oO5JGwEL26wH4eNnA9qgoKYSuTF4PioKTk8yeA7
         ULuu1gcMMxRyYjeD7yQHGvOMwR4cvMNmGb0AQWxxDb4lG95+cBqKGXqQDmJSGjljc9br
         n1SCOF16DlWN2J5hHQmOPiHBejalkSEYMwAeLfbTUE55U5TFB2gzpSu1BEBuCHyFRjPm
         hZFg==
X-Forwarded-Encrypted: i=1; AHgh+RqIdPEizk1pGOPNwRPi1G9SPDc7L1qR2gZY1HI5wNAjTd7ty4nrNwfDHXJLi5W8Tjb8/lhvQMJ/mJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuwbUFxCX9drAewTP0kgh9LTCu31REkfg61PrCmrAu9pX6N2Eq
	c533F5p0/wAz62YhyQtulCGw7wb91eafFx5ADoipB78kUxycvt0xYow0O3pIpEUIL8T/wnB+jhS
	0Rrqd/3Zig5UlWRveBpD/Nxd8gCzeOZg99Nh0KNrhHw==
X-Gm-Gg: AR+sD12knMnIxLjTSA7yncdloM+hoNw4kpL/+IJzDC/0w1ZAmTuBLdlbsWm54qD1EG9
	dUAm15Oc5y/wqWTDTEMMQ9PpUA3Gf/yIw2LX6Zy0i2fXXc95L9pXIqRK1PXgsvrNiiV/EZE5NrY
	gKUiIJTPp6hOFTrctG0a7BIR64qqCN1rHJEIc52uAxqJZiSqcjNlaa1oFI6sf9fPRcDnlceNtdF
	zH2DzxqFh1ybbCQddMOWTv+QW1zWuMkeCXPrNfzlW8S46FK7UD8B6WXHfhM1WStfv0PJRa45WSF
	Ei0qsb9W9mM6iMNTq9l5HsbHv5VIidQ=
X-Received: by 2002:a05:6402:a0db:b0:69c:2fc1:d4dc with SMTP id
 4fb4d7f45d1cf-69f6ccee4demr1117119a12.39.1784816044225; Thu, 23 Jul 2026
 07:14:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710192831.3440427-1-tanmay.shah@amd.com> <20260710192831.3440427-4-tanmay.shah@amd.com>
 <ale0KIu6hXNvN0q9@p14s> <66e4a85c-be14-4bd8-8328-bf17d2437994@amd.com>
 <CANLsYkyL8_YSb39QqbC0Z+udahMtCV1e+OeoKGvmGSxQ6h3_qA@mail.gmail.com>
 <c8f62152-fb7b-4771-87d7-9420c7e3f452@amd.com> <al-VRUCcl6NWzQkY@p14s>
 <a37bb772-2b27-44fa-9bf1-30707c419141@amd.com> <amDYiyTFFLkkTv5K@p14s> <c1d24c44-8daf-48bc-9785-7ab394353356@foss.st.com>
In-Reply-To: <c1d24c44-8daf-48bc-9785-7ab394353356@foss.st.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 23 Jul 2026 08:13:51 -0600
X-Gm-Features: AUfX_mzMzEDdNaBDhSkCuSBMjLAwRxftstrsP31mfy393FDcs6LCt5yMW8A7mcU
Message-ID: <CANLsYkzCKpNG-2W24EA1FEjEEr1J+w6VvM=sPwr8wMRDNqm9jg@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: tanmay.shah@amd.com, andersson@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-remoteproc@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Jul 2026 at 03:11, Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
> Hello Mathieu,
>
> On 7/22/26 16:49, Mathieu Poirier wrote:
> > On Tue, Jul 21, 2026 at 11:02:13AM -0500, Shah, Tanmay wrote:
> >>
> >>
> >> On 7/21/2026 10:50 AM, Mathieu Poirier wrote:
> >>> On Thu, Jul 16, 2026 at 11:12:55AM -0500, Shah, Tanmay wrote:
> >>>>
> >>>>
> >>>> On 7/16/2026 10:48 AM, Mathieu Poirier wrote:
> >>>>> On Wed, 15 Jul 2026 at 11:28, Shah, Tanmay <tanmays@amd.com> wrote:
> >>>>>>
> >>>>>> Hi,
> >>>>>>
> >>>>>> Please find my response below:
> >>>>>>
> >>>>>> On 7/15/2026 11:24 AM, Mathieu Poirier wrote:
> >>>>>>> On Fri, Jul 10, 2026 at 12:28:29PM -0700, Tanmay Shah wrote:
> >>>>>>>> 512 bytes isn't always suitable for all case, let firmware
> >>>>>>>> maker decide the best value from resource table.
> >>>>>>>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >>>>>>>> ---
> >>>>>>>> Changes in v5:
> >>>>>>>>
> >>>>>>>>    - fix documentation about alignment of the buffer size
> >>>>>>>>    - change version field from u16 to u8
> >>>>>>>>    - remove buffer alignment check
> >>>>>>>>    - Separate buffer alignment vs MTU of a single buffer
> >>>>>>>>    - Use buffer alignment only to get next buffer address at ali=
gnment
> >>>>>>>>      boundary
> >>>>>>>>
> >>>>>>
> >>>>>> [...]
> >>>>>>
> >>>>>>>> +#ifndef _LINUX_VIRTIO_RPMSG_H
> >>>>>>>> +#define _LINUX_VIRTIO_RPMSG_H
> >>>>>>>> +
> >>>>>>>> +#include <linux/types.h>
> >>>>>>>> +#include <linux/virtio_types.h>
> >>>>>>>> +
> >>>>>>>> +/* The feature bitmap for virtio rpmsg */
> >>>>>>>> +#define VIRTIO_RPMSG_F_NS   0 /* RP supports name service notif=
ications */
> >>>>>>>> +#define VIRTIO_RPMSG_F_BUFSZ        1 /* RP get buffer size fro=
m config space */
> >>>>>>>> +
> >>>>>>>> +/* Version of struct virtio_rpmsg_config understood by this dri=
ver */
> >>>>>>>> +#define RPMSG_VDEV_CONFIG_V1        1
> >>>>>>>> +
> >>>>>>>> +/**
> >>>>>>>> + * struct virtio_rpmsg_config - config space for rpmsg virtio d=
evice
> >>>>>>>> + *
> >>>>>>>> + * @version:        version of this structure, currently %RPMSG=
_VDEV_CONFIG_V1.
> >>>>>>>> + * @size:   size of this structure in bytes.
> >>>>>>>> + * @rpmsg_buf_align: alignment in bytes for each buffer. Must b=
e a power of
> >>>>>>>> + *               two. If 0 then no alignment will be done. This=
 alignment
> >>>>>>>> + *               will not decide actual size of the buffer but =
will be
> >>>>>>>> + *               used to decided the start address of the buffe=
r. The
> >>>>>>>> + *               actual size of the buffer can be different tha=
n the
> >>>>>>>> + *               aligned size of the buffer.
> >>>>>>>
> >>>>>>> Is there really a need to have a buffer size different from its a=
lignment?  It's
> >>>>>>> not like the (small) delta between the buffer size and its alignm=
ent will be
> >>>>>>> used for something else.  I'm fine with a buffer alignment requir=
ement but in
> >>>>>>> those cases, the firmware should set the size of the buffer in ac=
cordance with
> >>>>>>> its alignment requirement.  Otherwise, the complexity needed to m=
anage the
> >>>>>>> discrpancy between the two yields a driver that is hard to mainta=
in and prone to
> >>>>>>> bugs.
> >>>>>>>
> >>>>>>
> >>>>>> I had the same concern before. However, following example changed =
my mind:
> >>>>>>
> >>>>>> So, a single buffer size is the MTU size of a packet for the proto=
col
> >>>>>> supported by the firmware. Now that can be different than the alig=
ned
> >>>>>> size of the buffer.
> >>>>>>
> >>>>>> For example, the higher level protocol (not rpmsg) has 430 bytes a=
s the
> >>>>>> max size of a payload. However, cache line alignment is 64-bytes. =
Then
> >>>>>> in that case, the aligned buffer size is 448 bytes. But, that does=
n't
> >>>>>> mean we can say protocol's MTU size is 448 bytes. If user end up
> >>>>>> treating MTU size 448 bytes and use space beyond 430 bytes, then t=
he
> >>>>>> higher level apps might discard that data and communication may fa=
il.
> >>>>>>
> >>>>>
> >>>>> How is that scenario different from today's 512 byte buffer size?
> >>>>> Most users don't use all 512 bytes and we don't run in the problem
> >>>>> described above?
> >>>>>
> >>>>
> >>>> 512 buffer size is hardcoded, so it is enforced on the protocol by t=
he
> >>>> framework. But by allowing the configuration of the buffer size we a=
re
> >>>> allowing the protocol to decide what the buffer size should be. So, =
when
> >>>> user request the buffer via rpmsg_get_mtu() API, then that should be=
 the
> >>>> original buffer size which is expected by the protocol, which may no=
t be
> >>>> same as the aligned buffer size.
> >>>
> >>> Regardless of the buffer size, whether it is set to 512 byte or some =
arbitrary
> >>> value by the remote processsor's firmware, there is a possibility of =
a
> >>> discrepancy with what is expected by the protocol.  Right now rpmsg_g=
et_mtu()
> >>> returns 512 regardless of what a protocol uses.  The only thing that =
should be
> >>> important to the protocol is not to exceed that limit.
> >>>
> >>
> >> I think I am missing something. Are you saying that buffer size can no=
t
> >> be configured greater than 512 bytes?
> >
> > I am not.
> >
> > What I am saying is that if alignment is important to a remote processo=
r, it
> > should choose the buffer size accordingly.  rpmsg_get_mtu() should retu=
rn the
> > value of the buffer size, exactly the way it is today.
>
> Did you get a chance to look to my previous reply [1]?
>

Unfortunately I haven't had the opportunity to reach that point in my Inbox=
.

>  From my understanding, due to the Virtio specification, we cannot
> guarantee that
> the buffer size will not be updated by the main processor. Having an
> alignment
> field ensures that the main processor takes the remote processor=E2=80=99=
s
> constraints
> into account if it updates the RPMsg buffer size.
>

Where does the main processor change the buffer size?

> That said, if we decide to remove the alignment field, we must clearly
> document the constraints for the RPMsg Virtio config space:
>
> - virtio_rpmsg_config cannot be changed by the Virtio driver.
> - the sizes must respect the device and driver alignment constraint.
>

If the size chosen by the device isn't compatible with what the driver
can accommodate, then initialization simply fails.

> This is not my preferred solution,because that means that the remote
> processor has
> to know the alignment constraints of the main processor.
>

It would have to anyway wouldn't it?

 And as I said from the beginning, this is not something that has come
up in the 20 years this subsystem existed.  There is no point in
adding all this complexity for a something that _may_ happen.

> [1]https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2643398.h=
tml
>
> Regards,
>
> Arnaud
> >
> >>
> >> If the higher level protocol (not RPMsg) wants to use 4030 bytes for
> >> single packet payload then that is what the MTU size should be. And so
> >> the firmware will configure 4030 bytes as single buffer size in the vd=
ev
> >> config space. That is why alignment should be treated separately.
> >> Because it is not equal to payload size needed by higher level protoco=
l.
> >
> > In that case and assuming alignment is required, the buffer size should=
 be 4096
> > and rpmsg_get_mtu() should also return 4096.  How a higher protocol use=
s the
> > buffer space is none of our concern.
> >
> > Currently, the buffer size is set to 512 and users don't always fill th=
e entire
> > buffer.  I don't see why things should be different with a configurable=
 buffer
> > size.
> >
> >>
> >>>>
> >>>> If for internal management we want to treat buffer size =3D aligned =
buffer
> >>>> size, I am okay. But rpmsg_get_mtu() must give unaligned buffer size
> >>>> which is expected by the protocol.
> >>>
> >>> I agree with the first sentence but not the second.  The only thing p=
rotocols
> >>> should care about is the start address of a buffer and that its size =
is
> >>> sufficient for what it needs.
> >>>
> >>>>
> >>>> Thanks,
> >>>> Tanmay
> >>>>
> >>>>>> The alignment field is used only to decide where the next buffer s=
tart
> >>>>>> address is to ease cache operations.
> >>>>>>
> >>>>>> Sure, we need to maintain this complexity, but I think it's worth =
it.
> >>>>>>
> >>>>>
> >>>>> The same as in my previous email to Arnaud applies here - is this a=
n
> >>>>> immediate requirement of something we think may be happening in the
> >>>>> future?
> >>>>>
> >>>>
> >>>> IMHO, vendors will use it if the feature is available, otherwise the
> >>>> need to optimize alignment is not easily encountered.
> >>>>
> >>>>>
> >>>>>> Thanks,
> >>>>>> Tanmay
> >>>>>>
> >>>>>>>> + * @txbuf_size:     Tx buf size from remote's view. For Linux t=
his is rx buf size.
> >>>>>>>> + * @rxbuf_size:     Rx buf size from remote's view. For Linux t=
his is tx buf size.
> >>>>>>>> + *
> >>>>>>>> + * This is the configuration structure shared by the device and=
 the driver,
> >>>>>>>> + * read when %VIRTIO_RPMSG_F_BUFSZ is negotiated. The fields ar=
e laid out so
> >>>>>>>> + * the structure is naturally 32-bit aligned.
> >>>>>>>> + */
> >>>>>>>> +struct virtio_rpmsg_config {
> >>>>>>>> +    u8 version;
> >>>>>>>> +    __virtio16 size;
> >>>>>>>> +    __virtio16 rpmsg_buf_align;
> >>>>>>>> +    /* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFS=
Z) */
> >>>>>>>> +    __virtio32 txbuf_size;
> >>>>>>>> +    __virtio32 rxbuf_size;
> >>>>>>>> +} __packed;
> >>>>>>>> +
> >>>>>>>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
> >>>>>>>> --
> >>>>>>>> 2.34.1
> >>>>>>>>
> >>>>>>
> >>>>
> >>
> >
>
