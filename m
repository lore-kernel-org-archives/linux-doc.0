Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F9FC00140
	for <linux-doc@archiver.kernel.org>; Mon,  8 Aug 2022 13:47:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232257AbiHHNrP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Aug 2022 09:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235211AbiHHNrO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Aug 2022 09:47:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 201DC63A5
        for <linux-doc@vger.kernel.org>; Mon,  8 Aug 2022 06:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659966432;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xOmT+Y+kg4OOX8DXm3hPII7bzcp2Gy2mpH7jSjdpTAw=;
        b=hUGyCD15sborL+wtrfoSC2CY5+4MFEbk8NRStpd3xgXdR9q5ooDAe66HDlkn5vqsJq33SA
        0EEdXpVRsc8A8E776PCsAoyZPkL97aa9UAEPznt5GRy9DbT1KIuxqFnsjfoYUiRgg5dkrg
        eL/HNwJLzbs/bu29RDEccc/G1+SfGrs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-ap1keKVIOP2oo58dy-zYew-1; Mon, 08 Aug 2022 09:47:09 -0400
X-MC-Unique: ap1keKVIOP2oo58dy-zYew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAA7F2999B2F;
        Mon,  8 Aug 2022 13:47:08 +0000 (UTC)
Received: from localhost (unknown [10.39.193.46])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 57651C15BA8;
        Mon,  8 Aug 2022 13:47:08 +0000 (UTC)
From:   Cornelia Huck <cohuck@redhat.com>
To:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
        linux-doc@vger.kernel.org
Cc:     virtualization@lists.linux-foundation.org, mst@redhat.com,
        jasowang@redhat.com, kernel@collabora.com, bagasdotme@gmail.com,
        Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Subject: Re: [PATCH v2 2/2] docs: driver-api: virtio: virtio on Linux
In-Reply-To: <20220804105914.3707389-3-ricardo.canuelo@collabora.com>
Organization: Red Hat GmbH
References: <20220804105914.3707389-1-ricardo.canuelo@collabora.com>
 <20220804105914.3707389-3-ricardo.canuelo@collabora.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date:   Mon, 08 Aug 2022 15:47:06 +0200
Message-ID: <87bksuetk5.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 04 2022, Ricardo Ca=C3=B1uelo <ricardo.canuelo@collabora.com> w=
rote:

> Basic doc about Virtio on Linux and a short tutorial on Virtio drivers.
>
> Signed-off-by: Ricardo Ca=C3=B1uelo <ricardo.canuelo@collabora.com>
> ---
>  Documentation/driver-api/index.rst            |   1 +
>  Documentation/driver-api/virtio/index.rst     |  11 +
>  Documentation/driver-api/virtio/virtio.rst    | 151 ++++++++++++++
>  .../virtio/writing_virtio_drivers.rst         | 189 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  5 files changed, 353 insertions(+)
>  create mode 100644 Documentation/driver-api/virtio/index.rst
>  create mode 100644 Documentation/driver-api/virtio/virtio.rst
>  create mode 100644 Documentation/driver-api/virtio/writing_virtio_driver=
s.rst

(...)

> diff --git a/Documentation/driver-api/virtio/virtio.rst b/Documentation/d=
river-api/virtio/virtio.rst
> new file mode 100644
> index 000000000000..4b73c705c94c
> --- /dev/null
> +++ b/Documentation/driver-api/virtio/virtio.rst
> @@ -0,0 +1,151 @@
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
> +paravirtualized devices, ie. devices that aren't emulated by a
> +hypervisor but rather real host devices that are exposed by the
> +hypervisor to the guest to achieve native performance. In other words,
> +it provides a communication mechanism for a guest OS to use devices on
> +the host machine. Additionally, some devices also implement the virtio
> +interface in hardware.
> +
> +For paravirtualized devices, the concrete hardware details of the real
> +host devices are abstracted in the hypervisor, which provides a set of
> +simplified virtual devices that implement the virtio protocol. These
> +devices are defined in Chapter 5 ("Device Types") of the virtio spec [1]
> +and they're the devices that the guest OS will ultimately handle. So, in
> +that regard, the guest OS knows it's running in a virtual environment
> +and that it needs to use the appropriate virtio drivers to handle the
> +devices instead of the regular device drivers it'd use in a native or
> +purely virtual environment (with emulated devices).

Hm... so I'm not quite happy with those two paragraphs, but I'm not sure
how to make it better.

- While the origins of virtio are hypervisor implementations, the
  standard is describing the mechanisms of device <-> driver
  communication, regardless whether the device is a hardware entity or
  something emulated by a hypervisor.
- I'm not quite sure what you are referring to with "real host
  devices". We can have e.g. a real disk that is handed to a guest via
  virtio-blk as a whole, or we can have some kind of file that is
  exposed via virtio-blk. Other device types can also be completely
  emulated.
- The OS picks the driver depending on what device is discovers; virtio
  device drivers are not any different from other device drivers in that
  regard.

So I think the key pieces of virtio are the following:

- it is an open standard
- it describes a protocol, which can be used to implement a lot of
  different device types
- those devices are exposed to the operating system via standard
  mechanisms such as PCI
- virtio devices can be implemented in various ways, such as in
  hypervisors (more common) or as a real hardware device

For the remainder of this document, it is probably fine to focus on the
hypervisor use case.

(...)

> +How a virtio device is found and configured by the kernel depends on how
> +the hypervisor defines it. Taking the `QEMU virtio-console
> +<https://gitlab.com/qemu-project/qemu/-/blob/master/hw/char/virtio-conso=
le.c>`__
> +device as an example. When using PCI as a transport method, the device
> +will present itself in the PCI bus with vendor 0x1af4 (RedHat, Inc.) and

s/in/on/ ?
s/RedHat/Red Hat/ :)

> +device id 0x1003 (virtio console), as defined in the spec, so the kernel
> +will detect it as it would do with any other PCI device.

(...)

> diff --git a/Documentation/driver-api/virtio/writing_virtio_drivers.rst b=
/Documentation/driver-api/virtio/writing_virtio_drivers.rst
> new file mode 100644
> index 000000000000..139c785a38ef
> --- /dev/null
> +++ b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
> @@ -0,0 +1,189 @@
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
> +Chapter 5 ("Device Types") in the virtio specification [1] defines all
> +the supported virtio device types. Since these devices are, by
> +definition, meant as abstractions for a wide variety of real hardware,

See my comments above, virtio devices can also be fully emulated or real
hardware devices.

> +the addition of new virtio drivers is not expected to be very
> +frequent. Still, this document serves as a basic guideline for driver

I think we should not make any statement regarding frequency of new
additions; sometimes, there's a flurry of activity, sometimes, there's
nothing for ages :)

> +programmers that need to hack a new virtio driver or understand the
> +essentials of the existing ones. See :ref:`Virtio on Linux <virtio>` for
> +a general overview of virtio.
> +
> +
> +Driver boilerplate
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +As a bare minimum, a virtio driver should register in the virtio bus and

s/should/needs to/ ?

> +configure the virtqueues for the device according to its spec, the
> +configuration of the virtqueues in the driver side must match the
> +virtqueue definitions in the device. A basic driver skeleton could look
> +like this::

(...)

> +The device id ``VIRTIO_ID_DUMMY`` here is a placeholder, virtio
> +drivers should be defined only for devices that are defined in the

s/defined/added/ ?

> +spec. See include/uapi/linux/virtio_ids.h.

Maybe "Device ids need to be at least reserved in the virtio spec before
being added to that file." ?

