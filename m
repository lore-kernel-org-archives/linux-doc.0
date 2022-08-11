Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D51CCC19F2A
	for <linux-doc@archiver.kernel.org>; Thu, 11 Aug 2022 13:47:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235024AbiHKNrB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Aug 2022 09:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235091AbiHKNq7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Aug 2022 09:46:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 311406C74D
        for <linux-doc@vger.kernel.org>; Thu, 11 Aug 2022 06:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660225617;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YnYbZn3d/ZVf9YlldbRuOvAvqpY0e39cFa9Me7K6+LI=;
        b=SMbU+2xfDCRU6Z4AEE0/nGOyOPVdgKEOxbYU5sFaTinG+R7vjnA6XMl8t93ZjYhwmqtocZ
        C+OSTr2P6vLU4vsXJbWybY003btbqAcOkAxiwlrpFlavFsnhg7fpjv+VGvXNSI36p1oTgG
        699gRIQJ+XbO12WuGeiJBX/S0DaZGHw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-9_1xxhzHMm-uNSyY4kamkA-1; Thu, 11 Aug 2022 09:46:49 -0400
X-MC-Unique: 9_1xxhzHMm-uNSyY4kamkA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10FCC18E0BF9;
        Thu, 11 Aug 2022 13:46:48 +0000 (UTC)
Received: from localhost (unknown [10.39.193.95])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id B8032C15BA6;
        Thu, 11 Aug 2022 13:46:47 +0000 (UTC)
From:   Cornelia Huck <cohuck@redhat.com>
To:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
        linux-doc@vger.kernel.org
Cc:     virtualization@lists.linux-foundation.org, mst@redhat.com,
        jasowang@redhat.com, kernel@collabora.com, bagasdotme@gmail.com
Subject: Re: [PATCH v4 2/2] docs: driver-api: virtio: virtio on Linux
In-Reply-To: <20220810094004.1250-3-ricardo.canuelo@collabora.com>
Organization: Red Hat GmbH
References: <20220810094004.1250-1-ricardo.canuelo@collabora.com>
 <20220810094004.1250-3-ricardo.canuelo@collabora.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date:   Thu, 11 Aug 2022 15:46:46 +0200
Message-ID: <87czd6dha1.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 10 2022, Ricardo Ca=C3=B1uelo <ricardo.canuelo@collabora.com> w=
rote:

> Basic doc about Virtio on Linux and a short tutorial on Virtio drivers.
>
> Signed-off-by: Ricardo Ca=C3=B1uelo <ricardo.canuelo@collabora.com>
> ---
>  Documentation/driver-api/index.rst            |   1 +
>  Documentation/driver-api/virtio/index.rst     |  11 ++
>  Documentation/driver-api/virtio/virtio.rst    | 144 ++++++++++++++
>  .../virtio/writing_virtio_drivers.rst         | 186 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  5 files changed, 343 insertions(+)
>  create mode 100644 Documentation/driver-api/virtio/index.rst
>  create mode 100644 Documentation/driver-api/virtio/virtio.rst
>  create mode 100644 Documentation/driver-api/virtio/writing_virtio_driver=
s.rst
>

(...)

> +.. rubric:: Footnotes
> +
> +.. [#f1] that's why they may be also referred as virtrings.

"referred to"

(...)

> +The ``probe`` method does the minimum driver setup in this case
> +(memory allocation for the device data) and initializes the
> +virtqueue. The virtqueues are automatically enabled after ``probe``
> +returns, sending the appropriate "DRIVER_OK" status signal to the
> +device. If the virtqueues need to be enabled before ``probe`` ends, they
> +can be manually enabled by calling virtio_device_ready():
> +
> +.. kernel-doc:: include/linux/virtio_config.h
> +    :identifiers: virtio_device_ready

Hm, not quite sure what the actual expectations are here: Should the
driver set DRIVER_OK in its probe function, and the core only set it as
a fallback? Michael, Jason?

(...)

LGTM in general.

