Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A9DCC00140
	for <linux-doc@archiver.kernel.org>; Tue,  2 Aug 2022 15:56:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237215AbiHBP40 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Aug 2022 11:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237846AbiHBP4F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Aug 2022 11:56:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E252549B47
        for <linux-doc@vger.kernel.org>; Tue,  2 Aug 2022 08:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659455746;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CrN9dTcJ526THvYUpBUNsHyrLG3+8hg7Xx2pB/otObU=;
        b=IAcsyJLxPTUgR8RqssvrysJ9zlwIyuLTp7HBSiskHTe3DO8Q/srTRZTtg6KkPzEm1C0+Uc
        TSPFeDpH3oyB7q25l6EhL15vdE3uLXtHaBKv8kfdX3BXVyaUBQ7/lLizhXKCA7b7UqmVfU
        GWK84oNIpeDezxpfU5q+dK0K8mHS7lI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-MofozQC7MSaWBPzxDfMUUw-1; Tue, 02 Aug 2022 11:55:45 -0400
X-MC-Unique: MofozQC7MSaWBPzxDfMUUw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A9248037AF;
        Tue,  2 Aug 2022 15:55:45 +0000 (UTC)
Received: from localhost (unknown [10.39.192.238])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 00AE1400DEF8;
        Tue,  2 Aug 2022 15:55:44 +0000 (UTC)
From:   Cornelia Huck <cohuck@redhat.com>
To:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
        linux-doc@vger.kernel.org
Cc:     mst@redhat.com, kernel@collabora.com,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH] docs: driver-api: virtio: virtio on Linux
In-Reply-To: <20220802124222.3563378-1-ricardo.canuelo@collabora.com>
Organization: Red Hat GmbH
References: <20220802124222.3563378-1-ricardo.canuelo@collabora.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date:   Tue, 02 Aug 2022 17:55:43 +0200
Message-ID: <87pmhi8wsg.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 02 2022, Ricardo Ca=C3=B1uelo <ricardo.canuelo@collabora.com> w=
rote:

> Basic doc about Virtio on Linux and a short tutorial on Virtio drivers.
> Minor fixes to existing virtio kerneldocs.

I think kerneldoc updates should be split out into a separate patch.

[No proper review, just some things I noticed below.]

>
> Signed-off-by: Ricardo Ca=C3=B1uelo <ricardo.canuelo@collabora.com>
> ---
>  Documentation/driver-api/index.rst            |   1 +
>  Documentation/driver-api/virtio/index.rst     |  11 +
>  Documentation/driver-api/virtio/virtio.rst    | 274 ++++++++++++++++++
>  .../virtio/writing_virtio_drivers.rst         | 190 ++++++++++++
>  MAINTAINERS                                   |   1 +
>  include/linux/virtio.h                        |   6 +-
>  include/linux/virtio_config.h                 |   6 +-
>  include/uapi/linux/virtio_ring.h              |  16 +-
>  8 files changed, 494 insertions(+), 11 deletions(-)
>  create mode 100644 Documentation/driver-api/virtio/index.rst
>  create mode 100644 Documentation/driver-api/virtio/virtio.rst
>  create mode 100644 Documentation/driver-api/virtio/writing_virtio_driver=
s.rst
>

(...)

> diff --git a/Documentation/driver-api/virtio/virtio.rst b/Documentation/d=
river-api/virtio/virtio.rst
> new file mode 100644
> index 000000000000..049a8aefad92
> --- /dev/null
> +++ b/Documentation/driver-api/virtio/virtio.rst
> @@ -0,0 +1,274 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _virtio:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Virtio on Linux
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Virtio is an open standard interface for virtual machines to access

There are devices that implement virtio in hardware.

> +paravirtualized devices, ie. devices that aren't emulated by a
> +hypervisor, but rather real host devices that are exposed by the
> +hypervisor to the guest to achieve native performance. In other words,
> +it provides a communication mechanism for a guest OS to use devices on
> +the host machine.
> +
> +The concrete hardware details of the real host devices are abstracted in=
 the
> +hypervisor, which provides a set of simplified virtual devices that
> +implement the Virtio protocol. These devices are defined in the Virtio
> +spec [1] and they're the devices that the guest OS will ultimately
> +handle. So, in that regard, the guest OS knows it's running in a virtual
> +environment and that it needs to use the appropriate Virtio drivers to
> +handle the devices instead of the regular device drivers it'd use in a
> +native or purely virtual environment (with emulated devices).
> +
> +
> +Device - Driver communication: virtqueues
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Although the Virtio devices are really an abstraction layer in the
> +hypervisor, they're exposed to the guest as if they are physical devices
> +either PCI or MMIO-based. We refer to that as the transport method and

Please also mention CCW (s390 channel devices), as Linux supports it as
well.

> +it's orthogonal to the device itself. The Virtio spec defines these two
> +and other transport methods in detail, including device discovery,
> +capabilities and interrupt handling.

(...)

> +Device discovery and probing
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +How a virtio device is found and configured by the kernel depends on how
> +the hypervisor defines it. Taking the `QEMU virtio-console
> +<https://gitlab.com/qemu-project/qemu/-/blob/master/hw/char/virtio-conso=
le.c>`__
> +device as an example, which uses PCI as a transport method, the device

Should be the "virtio-console (...) device when using PCI...", I guess?

> +will present itself in the PCI bus with vendor 0x1af4 (RedHat, Inc.) and
> +device id 0x1003 (Virtio console), as defined in the spec, so the kernel
> +will detect it as it would do with any other PCI device.

(...)

> +References
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +[1] Virtio Spec v1.1:
> +https://docs.oasis-open.org/virtio/virtio/v1.1/virtio-v1.1.html

v1.2 is out now :)

(I think it would be better to refer to the base spec directory?)

> +
> +[2] Virtqueues and virtio ring: How the data travels
> +https://www.redhat.com/en/blog/virtqueues-and-virtio-ring-how-data-trave=
ls
> +
> +.. rubric:: Footnotes
> +
> +.. [#f1] that's why they may be also referred as virtrings.
> diff --git a/Documentation/driver-api/virtio/writing_virtio_drivers.rst b=
/Documentation/driver-api/virtio/writing_virtio_drivers.rst
> new file mode 100644
> index 000000000000..5cb088b817ae
> --- /dev/null
> +++ b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
> @@ -0,0 +1,190 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _writing_virtio_drivers:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Writing Virtio Drivers
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The `Virtio spec
> +<https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.ht=
ml#x1-1930005>`__

Chapter 5 ("Device Types") in the virtio specification [1]

(and add the same reference as above in this file)?

> +defines all the supported Virtio device types. Since these devices are,
> +by definition, meant as abstractions for a wide variety of real
> +hardware, the addition of new virtio drivers is not expected to be very
> +frequent. Still, this document serves as a basic guideline for driver
> +programmers that need to hack a new Virtio driver or understand the
> +essentials of the existing ones. See :ref:`Virtio on Linux <virtio>` for
> +a general overview of Virtio.

Very important point here: Don't add a device driver for a device that
has no reserved device id in the spec. Preferably, don't add a device
driver if no spec is available (it is useful to develop
devices/drivers/spec at the same time to avoid incompatibilities/fixups
later; and you can consider a device spec "final" if it has been
accepted into the spec, even if it isn't in a released version yet.)

(...)

> +This assumes the device is of a new virtio device type not defined
> +before: ``VIRTIO_DEVICE_DUMMY``, which we should define in
> +include/uapi/linux/virtio_ids.h. The device has only one virtqueue which

Don't do that :) You need to make clear that VIRTIO_DEVICE_DUMMY is only
a placeholder.

> +is meant to be used to send data from the host to the guest.

