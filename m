Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECB4C4332F
	for <linux-doc@archiver.kernel.org>; Mon, 19 Dec 2022 06:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbiLSGVR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Dec 2022 01:21:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231237AbiLSGVQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Dec 2022 01:21:16 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75BBB24D
        for <linux-doc@vger.kernel.org>; Sun, 18 Dec 2022 22:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671430830;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nmHgH44YO+1fWxNrpKpYFMutQaCxauHria2kl24sBVY=;
        b=LM/BfjYhlqZ9WN0WJgoF3UTUik7rA85amM1kUUdSnl6EOjmWYzTuOxsoPdaEf93qxg+3DV
        237saVlmvocGKgmmbrXMEKwzu+4eBfoOF+dGJtEKUXyr8Tzt3qTmV/tRmiV8EDS/UO+Kxr
        rmfbGk2Jkm75CJXyjuikrLo0KQB7o/c=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-182-eX0eSwwLOjqBpXo8gF4MLQ-1; Mon, 19 Dec 2022 01:20:21 -0500
X-MC-Unique: eX0eSwwLOjqBpXo8gF4MLQ-1
Received: by mail-qv1-f69.google.com with SMTP id u15-20020a0cec8f000000b004c704e015f7so5158699qvo.1
        for <linux-doc@vger.kernel.org>; Sun, 18 Dec 2022 22:20:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmHgH44YO+1fWxNrpKpYFMutQaCxauHria2kl24sBVY=;
        b=nPn4a9ki1tvzSdPU5Ay8fWloVKbN2vGrnKRZno3uJXkyeMxusBjLOYpud/By8HvJzX
         U8ky9T3jB//POzJikWF9RSO8+drbVMu00LwKdbrP8IG7EWLoS6cYn9vlwNPo5G/XDFPk
         au3Vv+39PG6Hw8TFn/+npmF6qttpjpsNmHzRMO7n+NzXB/LgUKmTgup2i/+nDniGQUnq
         AXUm+katms6KUDsgwIBJRbGhVhRjGUfJGbQT+9OXsx6/fI+EjRgBDNhL+1q38kHgkI5Y
         5KfhITPxTM/+xj3cnLnlbqqPDzMVeGqK4kAKMzxPloxfE1XxguaK9xsn7f813TSc5Pv5
         F4ow==
X-Gm-Message-State: ANoB5pncIIeABWGTJqxz/9tFn+CnScOX8mNpUfd7TLRwN433F7innPAH
        jvbAvjAqwG/mIKi40p+fiIBHUMPFm8HHJVPzE0pVS3VMEPg+HdW2pBqhBm4RI7+sIjYAooN6DJx
        h04IkHqMBpGg78b0Wl6/6
X-Received: by 2002:a0c:f892:0:b0:4c7:6c12:5db with SMTP id u18-20020a0cf892000000b004c76c1205dbmr55819859qvn.40.1671430821201;
        Sun, 18 Dec 2022 22:20:21 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4o5ruKrZQ3mkYIZlLSnXry7UvegxwMnK9f4SJe6lKY1RpuFh1tICbIL0ZeD2iaMWLDvlXWSA==
X-Received: by 2002:a0c:f892:0:b0:4c7:6c12:5db with SMTP id u18-20020a0cf892000000b004c76c1205dbmr55819846qvn.40.1671430820950;
        Sun, 18 Dec 2022 22:20:20 -0800 (PST)
Received: from redhat.com ([45.144.113.29])
        by smtp.gmail.com with ESMTPSA id f1-20020a05620a280100b006ee949b8051sm6470263qkp.51.2022.12.18.22.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 22:20:20 -0800 (PST)
Date:   Mon, 19 Dec 2022 01:20:14 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org,
        corbet@lwn.net, cohuck@redhat.com,
        virtualization@lists.linux-foundation.org, jasowang@redhat.com,
        kernel@collabora.com
Subject: Re: [RESEND PATCH v5 1/1] docs: driver-api: virtio: virtio on Linux
Message-ID: <20221219011647-mutt-send-email-mst@kernel.org>
References: <20221010064359.1324353-1-ricardo.canuelo@collabora.com>
 <20221010064359.1324353-2-ricardo.canuelo@collabora.com>
 <Y0QYTq7KW9C731s0@debian.me>
 <87v8oqsq6k.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v8oqsq6k.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 11, 2022 at 10:46:43AM +0200, Ricardo Cañuelo wrote:
> >> +It's at this stage that the virtqueues will be allocated and configured
> >> +by calling the appropriate ``virtio_find`` helper function, such as
> >> +virtio_find_single_vq() or virtio_find_vqs(), which will end up
> >> +calling a transport-specific ``find_vqs`` method.
> >> +
> >
> > Looks like the wording at the beginning confuses me, so better say:
> >
> > ---- >8 ----
> > diff --git a/Documentation/driver-api/virtio/virtio.rst b/Documentation/driver-api/virtio/virtio.rst
> > index 07fd2d7c51e689..7947b4ca690efd 100644
> > --- a/Documentation/driver-api/virtio/virtio.rst
> > +++ b/Documentation/driver-api/virtio/virtio.rst
> > @@ -123,10 +123,10 @@ When the device is registered to the virtio bus the kernel will look
> >  for a driver in the bus that can handle the device and call that
> >  driver's ``probe`` method.
> 
> I think this is a matter of style as well, maybe a native speaker can
> pitch in about the correctness of it.
> 
> Cheers,
> Ricardo

I think I agree with this comment.  This seems minor enough so I applied
the patch for now. Bagas would you like to post your suggestion as a patch on
top? Would be appreciated. Thanks!

-- 
MST

