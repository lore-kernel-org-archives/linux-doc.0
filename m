Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B605A39EF16
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 15:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649036; cv=none; b=MTL3Oa/0XItXT362EYt3Qpvzt4Q4ebHkFlRuQc7qOocxoHUt2T39CIDtDlBZAsB1wjfM42lAdWeOmpv8ip45UMXAT+Ggr0rzjSxX0Ri4PHUwI+n5gTaTX/MFnfZQ60swcqDddgo8bFIdtrTC5UN3hawfAbEwp+dvI93Wnhp+Q6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649036; c=relaxed/simple;
	bh=7CVdcgzMEBtOLHi624QRfV7vyVwmvtKlpwd38gFsLuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dDmJIcgEuwgT+CW0s9UwlqpwtFJDodDFR9w7Z64oagyCzRukewd6HE/ga3lAMjMQX0MY7Ew4u2QQGcDvkijqQ/tQdY675cucgYPiz35PeqF/4lCgFKAmw0da4jr/aSLFRoaZCQstoiwmCJseB4rAKd+JpNaZEjONeMlGcuDP7Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r0Lkx3mI; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r0Lkx3mI"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8487088510aso11644354b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 08:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784649033; x=1785253833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NTPRHwIAQMAZCQdln6Y6l/vUpdn4JkUqUfExMvJBVXc=;
        b=r0Lkx3mIfgGyuk22YnC/ZyiHAUEBEChNWl/CIEk98FrjBOA8zhLzWswzI1PQnYgep3
         bce74GmdFqWqhKuqUGHgr2JjCbWFMcrStNN9ESKFVvPXE8dVF0I4XNBgtby0bmFGaVZo
         SiJCHax5dpN5Txme42VjTc8efMqzQtpeRXX+Ajus9gYZ2+5xegCDbtpN8fW8ge7nZKNC
         nJV0ml4gVIrPQ8f9A3PR2I5547cWxTNZSeW0HgtPyBG3CwYYioxz2qJZs1wBXceQ2fcN
         OsCekNiBc8rl3mlsZTGUVw4Gbla8j3lQkL8ADSBjJIg60MKV10Zkuje/+Cr9Xmq6b+q5
         ubaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784649033; x=1785253833;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NTPRHwIAQMAZCQdln6Y6l/vUpdn4JkUqUfExMvJBVXc=;
        b=La3JFJE9wofLHudNor3Ua0j6rSh1DS99p1Ag95a9AFv7atwiUOXSxKWevbH7NS3YAF
         cqT6Cj9fJcpbh5Ia05vvRMK8Jc1AloPTw+4HFlIoZujt4oLxczeBGWrG70MHhkMPPeiM
         te2ky8E9x6XWNaVIi/G1lYgQca+m86uiwx3ZVIhXJAXmGOpafCytcU02wT5Xx7gjsTts
         4HRjVBiYer6P4zaVlgNJZW5dRg2tkTEm8P4ix5lDuS4XeUDs5suLW3cLBCucp5Lkkb3c
         LH8IyKm6dEYQIwOcq6S22dXuu8UxMtBbpaj/ulA7gvDWADNsfRoFajmHoIbm6zm3qNtv
         zR3w==
X-Forwarded-Encrypted: i=1; AHgh+RrHzRN+plLxbHv0b64jDppPrwg7LCQ7mbxaXClA985mdIThRZMytVoqEgkcPkUlwMgJNiDWuk03jPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW5sozQvxNiHVvcsx/NaRJrI4tKVtGZpIxpFABLBOHWgl8O13w
	oTyMFP7aH1+yP19yCaCcr8QbmedBgMcL4Nr8I4HgxuwvubWU0CJOFy9nZnvSKqyDZlM=
X-Gm-Gg: AR+sD13Q/Asjb/IaDpdGPQeu/pepXLtjDNdOA17EPHfFTIF0FHjgH+rbQW4b4qt66wf
	wY9v/zsAkZwjJXPdEfpQokVt7ZEG7uNySJMWaww9R7KE5oQCQVLsGCaD6o4/rbpcxUBMfMdU/1G
	HEVxlKSWOxC7jztkThMjmN/bAcBAxqcItpyQte2peN3y1A89DlPXl2t7Nc0tyxZ/EMGoOaD2+c3
	aA7vRdz0jPJxdTfLYQBbgTmwwYw45RvVBEgPFQmRRAUxm0C5LW2+ACn7lG2JEUT4l/prTF0i7w7
	wcD+/B3djFK00yJ9vbhYPQ8GLOgEvyitId0yu/fqeg+KJqoHh4bdttMeNhCWOaVHnYYFIyD73lW
	KTSatozHhrXE55QrAwPlvjNYtW3hMorv4qTWSDC1CBKzG6S7A4u+sDj3cPfKmsn1Oc/rIaEz9Kt
	vgCLGQcw==
X-Received: by 2002:a05:6a00:600a:b0:848:2f73:8ffd with SMTP id d2e1a72fcca58-84c29527f98mr18553911b3a.70.1784649032854;
        Tue, 21 Jul 2026 08:50:32 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d5fc:59b3:7d06:7bd9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af9ef6dsm7830107b3a.57.2026.07.21.08.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 08:50:32 -0700 (PDT)
Date: Tue, 21 Jul 2026 09:50:29 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
Message-ID: <al-VRUCcl6NWzQkY@p14s>
References: <20260710192831.3440427-1-tanmay.shah@amd.com>
 <20260710192831.3440427-4-tanmay.shah@amd.com>
 <ale0KIu6hXNvN0q9@p14s>
 <66e4a85c-be14-4bd8-8328-bf17d2437994@amd.com>
 <CANLsYkyL8_YSb39QqbC0Z+udahMtCV1e+OeoKGvmGSxQ6h3_qA@mail.gmail.com>
 <c8f62152-fb7b-4771-87d7-9420c7e3f452@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8f62152-fb7b-4771-87d7-9420c7e3f452@amd.com>

On Thu, Jul 16, 2026 at 11:12:55AM -0500, Shah, Tanmay wrote:
> 
> 
> On 7/16/2026 10:48 AM, Mathieu Poirier wrote:
> > On Wed, 15 Jul 2026 at 11:28, Shah, Tanmay <tanmays@amd.com> wrote:
> >>
> >> Hi,
> >>
> >> Please find my response below:
> >>
> >> On 7/15/2026 11:24 AM, Mathieu Poirier wrote:
> >>> On Fri, Jul 10, 2026 at 12:28:29PM -0700, Tanmay Shah wrote:
> >>>> 512 bytes isn't always suitable for all case, let firmware
> >>>> maker decide the best value from resource table.
> >>>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
> >>>>
> >>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >>>> ---
> >>>> Changes in v5:
> >>>>
> >>>>   - fix documentation about alignment of the buffer size
> >>>>   - change version field from u16 to u8
> >>>>   - remove buffer alignment check
> >>>>   - Separate buffer alignment vs MTU of a single buffer
> >>>>   - Use buffer alignment only to get next buffer address at alignment
> >>>>     boundary
> >>>>
> >>
> >> [...]
> >>
> >>>> +#ifndef _LINUX_VIRTIO_RPMSG_H
> >>>> +#define _LINUX_VIRTIO_RPMSG_H
> >>>> +
> >>>> +#include <linux/types.h>
> >>>> +#include <linux/virtio_types.h>
> >>>> +
> >>>> +/* The feature bitmap for virtio rpmsg */
> >>>> +#define VIRTIO_RPMSG_F_NS   0 /* RP supports name service notifications */
> >>>> +#define VIRTIO_RPMSG_F_BUFSZ        1 /* RP get buffer size from config space */
> >>>> +
> >>>> +/* Version of struct virtio_rpmsg_config understood by this driver */
> >>>> +#define RPMSG_VDEV_CONFIG_V1        1
> >>>> +
> >>>> +/**
> >>>> + * struct virtio_rpmsg_config - config space for rpmsg virtio device
> >>>> + *
> >>>> + * @version:        version of this structure, currently %RPMSG_VDEV_CONFIG_V1.
> >>>> + * @size:   size of this structure in bytes.
> >>>> + * @rpmsg_buf_align: alignment in bytes for each buffer. Must be a power of
> >>>> + *               two. If 0 then no alignment will be done. This alignment
> >>>> + *               will not decide actual size of the buffer but will be
> >>>> + *               used to decided the start address of the buffer. The
> >>>> + *               actual size of the buffer can be different than the
> >>>> + *               aligned size of the buffer.
> >>>
> >>> Is there really a need to have a buffer size different from its alignment?  It's
> >>> not like the (small) delta between the buffer size and its alignment will be
> >>> used for something else.  I'm fine with a buffer alignment requirement but in
> >>> those cases, the firmware should set the size of the buffer in accordance with
> >>> its alignment requirement.  Otherwise, the complexity needed to manage the
> >>> discrpancy between the two yields a driver that is hard to maintain and prone to
> >>> bugs.
> >>>
> >>
> >> I had the same concern before. However, following example changed my mind:
> >>
> >> So, a single buffer size is the MTU size of a packet for the protocol
> >> supported by the firmware. Now that can be different than the aligned
> >> size of the buffer.
> >>
> >> For example, the higher level protocol (not rpmsg) has 430 bytes as the
> >> max size of a payload. However, cache line alignment is 64-bytes. Then
> >> in that case, the aligned buffer size is 448 bytes. But, that doesn't
> >> mean we can say protocol's MTU size is 448 bytes. If user end up
> >> treating MTU size 448 bytes and use space beyond 430 bytes, then the
> >> higher level apps might discard that data and communication may fail.
> >>
> > 
> > How is that scenario different from today's 512 byte buffer size?
> > Most users don't use all 512 bytes and we don't run in the problem
> > described above?
> > 
> 
> 512 buffer size is hardcoded, so it is enforced on the protocol by the
> framework. But by allowing the configuration of the buffer size we are
> allowing the protocol to decide what the buffer size should be. So, when
> user request the buffer via rpmsg_get_mtu() API, then that should be the
> original buffer size which is expected by the protocol, which may not be
> same as the aligned buffer size.

Regardless of the buffer size, whether it is set to 512 byte or some arbitrary
value by the remote processsor's firmware, there is a possibility of a
discrepancy with what is expected by the protocol.  Right now rpmsg_get_mtu()
returns 512 regardless of what a protocol uses.  The only thing that should be
important to the protocol is not to exceed that limit.

> 
> If for internal management we want to treat buffer size = aligned buffer
> size, I am okay. But rpmsg_get_mtu() must give unaligned buffer size
> which is expected by the protocol.

I agree with the first sentence but not the second.  The only thing protocols
should care about is the start address of a buffer and that its size is
sufficient for what it needs.

> 
> Thanks,
> Tanmay
> 
> >> The alignment field is used only to decide where the next buffer start
> >> address is to ease cache operations.
> >>
> >> Sure, we need to maintain this complexity, but I think it's worth it.
> >>
> > 
> > The same as in my previous email to Arnaud applies here - is this an
> > immediate requirement of something we think may be happening in the
> > future?
> > 
> 
> IMHO, vendors will use it if the feature is available, otherwise the
> need to optimize alignment is not easily encountered.
> 
> > 
> >> Thanks,
> >> Tanmay
> >>
> >>>> + * @txbuf_size:     Tx buf size from remote's view. For Linux this is rx buf size.
> >>>> + * @rxbuf_size:     Rx buf size from remote's view. For Linux this is tx buf size.
> >>>> + *
> >>>> + * This is the configuration structure shared by the device and the driver,
> >>>> + * read when %VIRTIO_RPMSG_F_BUFSZ is negotiated. The fields are laid out so
> >>>> + * the structure is naturally 32-bit aligned.
> >>>> + */
> >>>> +struct virtio_rpmsg_config {
> >>>> +    u8 version;
> >>>> +    __virtio16 size;
> >>>> +    __virtio16 rpmsg_buf_align;
> >>>> +    /* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
> >>>> +    __virtio32 txbuf_size;
> >>>> +    __virtio32 rxbuf_size;
> >>>> +} __packed;
> >>>> +
> >>>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
> >>>> --
> >>>> 2.34.1
> >>>>
> >>
> 
