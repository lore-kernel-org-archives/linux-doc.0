Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A064C25B0C
	for <linux-doc@archiver.kernel.org>; Thu, 11 Aug 2022 13:57:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235319AbiHKN5c (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Aug 2022 09:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235330AbiHKN5a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Aug 2022 09:57:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 37E7F7E011
        for <linux-doc@vger.kernel.org>; Thu, 11 Aug 2022 06:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660226248;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=affarGx84Vio11tis73UE7PHQcPVD+DI8+ugfRW+1TY=;
        b=AvcQbYOlsLqIHXunEURlkZxgWT8yTnsDuYz501ofp5tR6AvVIsiMSJdEvvEL0Q6Q3oKsi+
        mrBVg0JO2jrAfAYgE5MrmsIvTzmy/YxMXxIg1FmL8m/CZKW2aQGjTRfxdkkdhQ4T5aYDMp
        0hu3wZOIutpKumwE88m4xTABG0VVLwg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-GldvYTgaM52zOdFzdwK_fA-1; Thu, 11 Aug 2022 09:57:26 -0400
X-MC-Unique: GldvYTgaM52zOdFzdwK_fA-1
Received: by mail-ed1-f69.google.com with SMTP id w17-20020a056402269100b0043da2189b71so10751816edd.6
        for <linux-doc@vger.kernel.org>; Thu, 11 Aug 2022 06:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=affarGx84Vio11tis73UE7PHQcPVD+DI8+ugfRW+1TY=;
        b=qYkGk6N6HZBRhe5oH6WXHjJk/CrkQRIVMEWgrfTECfZvpP/KP/aRGokbxBLBKTQhwf
         sjKgECAM8Rrt9sEw8yC8AaYH5Yn9J2qrQCeJmpOc0zTwPj+rbm1AzRGeTh7wED0Gcd+c
         qVS/CMTUWVgAKVzlSFU6kmmIG2XQBJvMWxXDmiIsA+vcYi6ZuAK/b1a3M2/8bKInqv6q
         yjK1JhBAvd2+WNJwOz6OVchj55ZqP702CuafPTHrRXNL1X51lbbBv7ADgpCRcOuHpPoD
         JkWu6W2uKfaIJ2ScStLpPCyRHTlyeir1E8+2UmkK3euNr2UVDthj13Gmni8dv1nTZf4s
         DdcA==
X-Gm-Message-State: ACgBeo1/NAh99ZWhwwkIv0VmwPnGlvC+HoMNv/iCzLEZ00O5uUskxyH9
        Drk9+rxRzp2GomPr1NnYKjl8TQMJkNTNbVCK6chId+XT+G/7//oIyZxp3lh59gYpn1NBiHfBz4+
        WzOLkI+Iuf/OggqXb1Zhn
X-Received: by 2002:a17:907:7347:b0:730:ec0f:fd5c with SMTP id dq7-20020a170907734700b00730ec0ffd5cmr22914428ejc.187.1660226245028;
        Thu, 11 Aug 2022 06:57:25 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4s/hnCBaghYUh5gSU7gbDFNIq0YkkUbwy3aB1boS557sDjokxsn57S/yK/yRA0k+NJuxCoHA==
X-Received: by 2002:a17:907:7347:b0:730:ec0f:fd5c with SMTP id dq7-20020a170907734700b00730ec0ffd5cmr22914416ejc.187.1660226244836;
        Thu, 11 Aug 2022 06:57:24 -0700 (PDT)
Received: from redhat.com ([2.52.152.113])
        by smtp.gmail.com with ESMTPSA id z3-20020aa7c643000000b004424429afd4sm3330607edr.16.2022.08.11.06.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 06:57:24 -0700 (PDT)
Date:   Thu, 11 Aug 2022 09:57:20 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Cornelia Huck <cohuck@redhat.com>
Cc:     Ricardo =?iso-8859-1?Q?Ca=F1uelo?= 
        <ricardo.canuelo@collabora.com>, linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org, jasowang@redhat.com,
        kernel@collabora.com, bagasdotme@gmail.com
Subject: Re: [PATCH v4 2/2] docs: driver-api: virtio: virtio on Linux
Message-ID: <20220811095251-mutt-send-email-mst@kernel.org>
References: <20220810094004.1250-1-ricardo.canuelo@collabora.com>
 <20220810094004.1250-3-ricardo.canuelo@collabora.com>
 <87czd6dha1.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87czd6dha1.fsf@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 11, 2022 at 03:46:46PM +0200, Cornelia Huck wrote:
> On Wed, Aug 10 2022, Ricardo Cañuelo <ricardo.canuelo@collabora.com> wrote:
> 
> > Basic doc about Virtio on Linux and a short tutorial on Virtio drivers.
> >
> > Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> > ---
> >  Documentation/driver-api/index.rst            |   1 +
> >  Documentation/driver-api/virtio/index.rst     |  11 ++
> >  Documentation/driver-api/virtio/virtio.rst    | 144 ++++++++++++++
> >  .../virtio/writing_virtio_drivers.rst         | 186 ++++++++++++++++++
> >  MAINTAINERS                                   |   1 +
> >  5 files changed, 343 insertions(+)
> >  create mode 100644 Documentation/driver-api/virtio/index.rst
> >  create mode 100644 Documentation/driver-api/virtio/virtio.rst
> >  create mode 100644 Documentation/driver-api/virtio/writing_virtio_drivers.rst
> >
> 
> (...)
> 
> > +.. rubric:: Footnotes
> > +
> > +.. [#f1] that's why they may be also referred as virtrings.
> 
> "referred to"
> 
> (...)
> 
> > +The ``probe`` method does the minimum driver setup in this case
> > +(memory allocation for the device data) and initializes the
> > +virtqueue. The virtqueues are automatically enabled after ``probe``
> > +returns, sending the appropriate "DRIVER_OK" status signal to the
> > +device. If the virtqueues need to be enabled before ``probe`` ends, they
> > +can be manually enabled by calling virtio_device_ready():
> > +
> > +.. kernel-doc:: include/linux/virtio_config.h
> > +    :identifiers: virtio_device_ready
> 
> Hm, not quite sure what the actual expectations are here: Should the
> driver set DRIVER_OK in its probe function, and the core only set it as
> a fallback? Michael, Jason?
> 
> (...)
> 
> LGTM in general.

Generally driver should either call device_ready
or defer adding device to linux in a scan callback.

Doing neither is likely a bug since you might
then be asked to add buffers before DRIVER_OK is set,
though e.g. if you are interrupt driven things might work
correctly.

-- 
MST

