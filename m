Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92196C00140
	for <linux-doc@archiver.kernel.org>; Mon,  8 Aug 2022 12:14:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237718AbiHHMOR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Aug 2022 08:14:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242200AbiHHMOP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Aug 2022 08:14:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 744A15FCD
        for <linux-doc@vger.kernel.org>; Mon,  8 Aug 2022 05:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659960853;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DdZ8nPGu01RNMjwipZUjvN2eZPFJM8suhgA2+FpsgEk=;
        b=EReaLd4yXid83za0t+5xQTSi5og2pDFSRuTVhNUpwJQt2ocGN6ylsJkDPo071q2HDrqj55
        SuM7jrvYViISdLZ2IMFmwvNlhxmPzRxo+vnALvbSqM/7wSO8rt0//E8ZW7JxkCQnu5EtnG
        n7M0AwGE9Z3xBP2Z4Om4dR4yjNHDDqE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-yaN86KFiNjKcokbGURhygA-1; Mon, 08 Aug 2022 08:14:10 -0400
X-MC-Unique: yaN86KFiNjKcokbGURhygA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B504D801585;
        Mon,  8 Aug 2022 12:14:09 +0000 (UTC)
Received: from localhost (unknown [10.39.193.46])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 67F1B9457F;
        Mon,  8 Aug 2022 12:14:09 +0000 (UTC)
From:   Cornelia Huck <cohuck@redhat.com>
To:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
        linux-doc@vger.kernel.org
Cc:     virtualization@lists.linux-foundation.org, mst@redhat.com,
        jasowang@redhat.com, kernel@collabora.com, bagasdotme@gmail.com,
        Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Subject: Re: [PATCH v2 1/2] virtio: kerneldocs fixes and enhancements
In-Reply-To: <20220804105914.3707389-2-ricardo.canuelo@collabora.com>
Organization: Red Hat GmbH
References: <20220804105914.3707389-1-ricardo.canuelo@collabora.com>
 <20220804105914.3707389-2-ricardo.canuelo@collabora.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date:   Mon, 08 Aug 2022 14:14:07 +0200
Message-ID: <87edxrdjao.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 04 2022, Ricardo Ca=C3=B1uelo <ricardo.canuelo@collabora.com> w=
rote:

> Fix variable names in some htmldocs, naming in others.
> Add htmldocs for struct vring_desc and vring_interrupt.

Isn't that "kerneldoc"? But maybe I'm a bit behind on the current
terminology.

>
> Signed-off-by: Ricardo Ca=C3=B1uelo <ricardo.canuelo@collabora.com>
> ---
>  drivers/virtio/virtio_ring.c     |  8 ++++++++
>  include/linux/virtio.h           |  6 +++---
>  include/linux/virtio_config.h    |  6 +++---
>  include/uapi/linux/virtio_ring.h | 16 +++++++++++-----
>  4 files changed, 25 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index a5ec724c01d8..e2091345c5c2 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -2147,6 +2147,14 @@ static inline bool more_used(const struct vring_vi=
rtqueue *vq)
>  	return vq->packed_ring ? more_used_packed(vq) : more_used_split(vq);
>  }
>=20=20
> +/**
> + * vring_interrupt - notify a virtqueue on an interrupt
> + * @irq: the IRQ number

This is being ignored, however. Append "(ignored)"?

(I think it is only there so that this function can be used as an
irq_handler_t.)

> + * @_vq: the struct virtqueue to notify
> + *
> + * Calls the callback function of @_vq to process the virtqueue
> + * notification.
> + */
>  irqreturn_t vring_interrupt(int irq, void *_vq)
>  {
>  	struct vring_virtqueue *vq =3D to_vvq(_vq);

(...)

> diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
> index b47c2e7ed0ee..997801018ae4 100644
> --- a/include/linux/virtio_config.h
> +++ b/include/linux/virtio_config.h
> @@ -225,7 +225,7 @@ int virtio_find_vqs_ctx(struct virtio_device *vdev, u=
nsigned nvqs,
>=20=20
>  /**
>   * virtio_synchronize_cbs - synchronize with virtqueue callbacks
> - * @vdev: the device
> + * @dev: the device

As you're touching this anyway: maybe s/device/virtio device/ ?

>   */
>  static inline
>  void virtio_synchronize_cbs(struct virtio_device *dev)
> @@ -244,7 +244,7 @@ void virtio_synchronize_cbs(struct virtio_device *dev)
>=20=20
>  /**
>   * virtio_device_ready - enable vq use in probe function
> - * @vdev: the device
> + * @dev: the device

Same here.

>   *
>   * Driver must call this to use vqs in the probe function.
>   *

