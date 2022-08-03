Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F36C19F2A
	for <linux-doc@archiver.kernel.org>; Wed,  3 Aug 2022 06:54:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237320AbiHCGyn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Aug 2022 02:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233079AbiHCGyk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Aug 2022 02:54:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 749CF4D4F0
        for <linux-doc@vger.kernel.org>; Tue,  2 Aug 2022 23:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659509677;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=P3EneSF/8Mv/FNQxWkoBHt2CXBmoIATKrbqAR1msilw=;
        b=GW0LrQ1Bci32iMGfkkY5IHi/TqMG7Oen6Deb7npJ3iU07IONkK6pgV1b9d6wAmwlkXKLUz
        0fyFzPekhJ4b6dFQQoojEGzvVynL8YJ5RAMHTh9ihkOIIew0qPxn8uP4xEroQwgZ7ZLB4p
        qnC95IqKt95ZRAOHHjVQAF8lMuaGOQk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-2CBivtVfPJOxypxbI4fuNg-1; Wed, 03 Aug 2022 02:54:34 -0400
X-MC-Unique: 2CBivtVfPJOxypxbI4fuNg-1
Received: by mail-wm1-f71.google.com with SMTP id h10-20020a1c210a000000b003a4f57eaeaaso16988wmh.8
        for <linux-doc@vger.kernel.org>; Tue, 02 Aug 2022 23:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=P3EneSF/8Mv/FNQxWkoBHt2CXBmoIATKrbqAR1msilw=;
        b=cRUFWke0WDbflbq83yStbmENoFSRjHMHD9BdfIxOSWyVKOwBaaeB3hurkRrOF/Kjsn
         8EUwcxOx4TknKv4bGzbXdhxDjIA7G9hyl+HMc7j9Ot9qh7HEZXf7CwH4URhehm906ZKS
         0cGHg9hqNNIWF1lAVMjpr4Lm92qwhp9XjknSvwVnWPjKGGuOXbPtspYtoxgk/iN/iFQA
         Wbb0sPsJp++YWhMPYOsiyAFVYglAjeuhRGLSB3Ib3mRQZY4kUzqgTjZFtxlnk9nOR9zN
         nUxQIN1getuBeZS/hErQM7vZ2Y+C2l159bpjcW3jF2sVwTXhzVmfFoLKEBGfyr4AOPPk
         xWQQ==
X-Gm-Message-State: ACgBeo2E4F0l1WNOUlSY5k1UvqxmP4HjNfB10KUWwWA2qQNKRkwmFH/y
        sC0nrISsSfmzYHKH9esfGKfeKFQywWsDolkgPGijHQDX1JZqa9KlDLCutCv8aYOuTA78T/Dokdf
        XoRB1fImBjgWlIT6xm2Gy
X-Received: by 2002:adf:cd90:0:b0:21f:ba2:2b20 with SMTP id q16-20020adfcd90000000b0021f0ba22b20mr14615272wrj.162.1659509672602;
        Tue, 02 Aug 2022 23:54:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR77Kz6cP6KVqkdNl2AgRHe7Rwhg078/2xc/1lOIG3ulkp0Eqq2PmJcfMyGqZfBh1KFxLx3Rng==
X-Received: by 2002:adf:cd90:0:b0:21f:ba2:2b20 with SMTP id q16-20020adfcd90000000b0021f0ba22b20mr14615259wrj.162.1659509672161;
        Tue, 02 Aug 2022 23:54:32 -0700 (PDT)
Received: from redhat.com ([2.54.191.86])
        by smtp.gmail.com with ESMTPSA id y14-20020adffa4e000000b0021eb309c97dsm16843148wrr.25.2022.08.02.23.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 23:54:31 -0700 (PDT)
Date:   Wed, 3 Aug 2022 02:54:28 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Cc:     linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org, jasowang@redhat.com,
        kernel@collabora.com, Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] docs: driver-api: virtio: virtio on Linux
Message-ID: <20220802090507-mutt-send-email-mst@kernel.org>
References: <20220802124222.3563378-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220802124222.3563378-1-ricardo.canuelo@collabora.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 02, 2022 at 02:42:22PM +0200, Ricardo Cañuelo wrote:
> Basic doc about Virtio on Linux and a short tutorial on Virtio drivers.
> Minor fixes to existing virtio kerneldocs.
> 
> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
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
>  create mode 100644 Documentation/driver-api/virtio/writing_virtio_drivers.rst
> 
> diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
> index d3a58f77328e..30a3de452b1d 100644
> --- a/Documentation/driver-api/index.rst
> +++ b/Documentation/driver-api/index.rst
> @@ -106,6 +106,7 @@ available subsections can be seen below.
>     vfio-mediated-device
>     vfio
>     vfio-pci-device-specific-driver-acceptance
> +   virtio/index
>     xilinx/index
>     xillybus
>     zorro
> diff --git a/Documentation/driver-api/virtio/index.rst b/Documentation/driver-api/virtio/index.rst
> new file mode 100644
> index 000000000000..528b14b291e3
> --- /dev/null
> +++ b/Documentation/driver-api/virtio/index.rst
> @@ -0,0 +1,11 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +======
> +Virtio
> +======
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   virtio
> +   writing_virtio_drivers
> diff --git a/Documentation/driver-api/virtio/virtio.rst b/Documentation/driver-api/virtio/virtio.rst
> new file mode 100644
> index 000000000000..049a8aefad92
> --- /dev/null
> +++ b/Documentation/driver-api/virtio/virtio.rst
> @@ -0,0 +1,274 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _virtio:
> +
> +===============
> +Virtio on Linux
> +===============
> +
> +Introduction
> +============
> +
> +Virtio is an open standard interface for virtual machines to access
> +paravirtualized devices, ie. devices that aren't emulated by a
> +hypervisor, but rather real host devices that are exposed by the
> +hypervisor to the guest to achieve native performance. In other words,
> +it provides a communication mechanism for a guest OS to use devices on
> +the host machine.
> +
> +The concrete hardware details of the real host devices are abstracted in the
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
> +=========================================
> +
> +Although the Virtio devices are really an abstraction layer in the
> +hypervisor, they're exposed to the guest as if they are physical devices
> +either PCI or MMIO-based. We refer to that as the transport method and
> +it's orthogonal to the device itself. The Virtio spec defines these two
> +and other transport methods in detail, including device discovery,
> +capabilities and interrupt handling.
> +
> +The communication between the driver in the guest OS and the device in
> +the hypervisor is done through shared memory (that's what makes virtio
> +devices so efficient) using specialized data structures called
> +virtqueues. The use of these virtqueues for data transfers is referred
> +to as the data plane, while the process of setting them up and
> +coordinating the driver and the device during the setup stage is called
> +the control plane.
> +
> +Virtqueues, which are used to communicate the driver and the device
> +regardless of the transport method used, are actually ring buffers
> +[#f1]_ of buffer descriptors similar to the ones used in a network
> +device:
> +
> +.. kernel-doc:: include/uapi/linux/virtio_ring.h
> +    :identifiers: struct vring_desc
> +

So I'm okay with a high level overview up to this point.
Below starts getting into details and they are not up to date
and I don't think we want to maintain a copy here.


> +All the buffers the descriptors point to are allocated by the guest and
> +used by the host either for reading or for writing but not for both.
> +
> +Refer to [2] for an illustrated overview of virtqueues and how the host
> +device and the guest driver communicate.


> +
> +Each virtqueue defines three areas: the descriptor area (`desc`), which
> +is an array of descriptors as described above, and the avail and used
> +rings.
> +
> +The `avail` ring is where the driver puts the indexes of the descriptors
> +that it has set up for the device to consume. The `used` ring is used by
> +the device to return the consumed buffers (read or written) to the
> +driver. For each used descriptor, the ring also contains the used buffer
> +length in case it was written.

the part above is duplicating too much from the spec I think.


> +
> +These rings are laid out in the :c:type:`vring_virtqueue` struct
> +together with other necessary management data, including a pointer to a
> +transport-specific ``notify`` function that is used to let the host side
> +know when new buffers have been put in the virtqueue for
> +processing. Embedded in this struct is the :c:type:`virtqueue` struct,
> +which is the data structure that's ultimately used by virtio drivers:
> +
> +.. kernel-doc:: include/linux/virtio.h
> +    :identifiers: struct virtqueue
> +
> +The callback saved in this struct serves the same purpose as the
> +``notify`` function in :c:type:`vring_virtqueue` but in the
> +opposite direction. That is, the callback is triggered when the host has
> +used the provided buffers. More specifically, the trigger will be an
> +interrupt issued by the hypervisor (QEMU, for example). Interrupt
> +request handlers are registered for a virtqueue during the virtqueue
> +setup process::
> +
> +	static int vp_find_vqs_intx(struct virtio_device *vdev, unsigned int nvqs,
> +			struct virtqueue *vqs[], vq_callback_t *callbacks[],
> +			const char * const names[], const bool *ctx)
> +	{
> +		struct virtio_pci_device *vp_dev = to_vp_device(vdev);
> +		int i, err, queue_idx = 0;
> +
> +		vp_dev->vqs = kcalloc(nvqs, sizeof(*vp_dev->vqs), GFP_KERNEL);
> +		if (!vp_dev->vqs)
> +			return -ENOMEM;
> +
> +		err = request_irq(vp_dev->pci_dev->irq, vp_interrupt, IRQF_SHARED,
> +				dev_name(&vdev->dev), vp_dev);
> +		...
> +
> +In this case, when the interrupt arrives :c:func:`vp_interrupt` will be
> +called and it will ultimately lead to a call to
> +:c:func:`vring_interrupt`, which ends up calling the virtqueue callback
> +function::
> +
> +	irqreturn_t vring_interrupt(int irq, void *_vq)
> +	{
> +		struct vring_virtqueue *vq = to_vvq(_vq);
> +
> +		...
> +
> +		pr_debug("virtqueue callback for %p (%p)\n", vq, vq->vq.callback);
> +		if (vq->vq.callback)
> +			vq->vq.callback(&vq->vq);
> +
> +		return IRQ_HANDLED;
> +	}
> +
> +Virtqueues are allocated by the guest kernel and their memory addresses
> +are then communicated to the hypervisor so it can access them. In the
> +host side there could be some differences in this process depending on
> +who is acting as the hypervisor, but from the guest point of view this
> +communication depends on the transport method used. So for a PCI device
> +in QEMU, for example, the QEMU setups the PCI BARs (which are memory
> +regions defined in the virtual PCI device) and the guest kernel maps
> +them to virtual memory, so when it writes to them it's actually writing
> +to the host userspace memory, acting like some kind of guest-host IPC
> +mechanism on top of PCI::

The reference to BARs seems bogus.

> +
> +	/*
> +	 * vp_modern_queue_address - set the virtqueue address
> +	 * @mdev: the modern virtio-pci device
> +	 * @index: the queue index
> +	 * @desc_addr: address of the descriptor area
> +	 * @driver_addr: address of the driver area
> +	 * @device_addr: address of the device area
> +	 */
> +	void vp_modern_queue_address(struct virtio_pci_modern_device *mdev,
> +				     u16 index, u64 desc_addr, u64 driver_addr,
> +				     u64 device_addr)
> +	{
> +		struct virtio_pci_common_cfg __iomem *cfg = mdev->common;
> +
> +		vp_iowrite16(index, &cfg->queue_select);
> +
> +		vp_iowrite64_twopart(desc_addr, &cfg->queue_desc_lo,
> +				     &cfg->queue_desc_hi);
> +		vp_iowrite64_twopart(driver_addr, &cfg->queue_avail_lo,
> +				     &cfg->queue_avail_hi);
> +		vp_iowrite64_twopart(device_addr, &cfg->queue_used_lo,
> +				     &cfg->queue_used_hi);
> +	}
> +
> +
> +Device discovery and probing
> +============================
> +
> +How a virtio device is found and configured by the kernel depends on how
> +the hypervisor defines it. Taking the `QEMU virtio-console
> +<https://gitlab.com/qemu-project/qemu/-/blob/master/hw/char/virtio-console.c>`__

why gitlab? why not https://git.qemu.org/ then?

> +device as an example, which uses PCI as a transport method, the device
> +will present itself in the PCI bus with vendor 0x1af4 (RedHat, Inc.) and
> +device id 0x1003 (Virtio console), as defined in the spec, so the kernel
> +will detect it as it would do with any other PCI device.
> +
> +In more detail:
> +
> +The virtio core subsystem is composed of multiple modules/drivers, among
> +them:
> +
> +- virtio.c: implements the virtio bus driver.
> +- virtio_mmio.c: implements the MMIO transport, this is a platform
> +  driver (virtio-mmio).
> +- virtio_pci_common.c and virtio_pci_modern.c (and, optionally,
> +  virtio_pci_legacy.c): implement the virtio-pci PCI driver
> +
> +Then there are individual virtio drivers for specific device types, such
> +as the virtio-console driver. These are registered to the virtio bus
> +driver.
> +
> +During the PCI enumeration process, if a device is found to match the
> +virtio-pci driver (according to the virtio-pci device table, any PCI
> +device with vendor id = 0x1af4)::
> +
> +	/* Qumranet donated their vendor ID for devices 0x1000 thru 0x10FF. */
> +	static const struct pci_device_id virtio_pci_id_table[] = {
> +		{ PCI_DEVICE(PCI_VENDOR_ID_REDHAT_QUMRANET, PCI_ANY_ID) },
> +		{ 0 }
> +	};
> +
> +then the virtio-pci driver is probed. This includes setting up the
> +device ``virtio_config_ops`` functions and its virtqueue handling
> +methods, such as :c:func:`setup_vq` to allocate and configure them, (but
> +this method is not called yet)::
> +
> +	int virtio_pci_modern_probe(struct virtio_pci_device *vp_dev)
> +	{
> +		struct virtio_pci_modern_device *mdev = &vp_dev->mdev;
> +		struct pci_dev *pci_dev = vp_dev->pci_dev;
> +		int err;
> +
> +		mdev->pci_dev = pci_dev;
> +
> +		err = vp_modern_probe(mdev);
> +		if (err)
> +			return err;
> +
> +		if (mdev->device)
> +			vp_dev->vdev.config = &virtio_pci_config_ops;
> +		else
> +			vp_dev->vdev.config = &virtio_pci_config_nodev_ops;
> +
> +		vp_dev->config_vector = vp_config_vector;
> +		vp_dev->setup_vq = setup_vq;
> +		vp_dev->del_vq = del_vq;
> +		vp_dev->isr = mdev->isr;
> +		vp_dev->vdev.id = mdev->id;
> +
> +		return 0;
> +	}
> +
> +If the probing goes well, the device is registered to the virtio bus::
> +
> +	static int virtio_pci_probe(struct pci_dev *pci_dev,
> +				    const struct pci_device_id *id)
> +	{
> +		...
> +
> +		if (force_legacy) {
> +			rc = virtio_pci_legacy_probe(vp_dev);
> +			/* Also try modern mode if we can't map BAR0 (no IO space). */
> +			if (rc == -ENODEV || rc == -ENOMEM)
> +				rc = virtio_pci_modern_probe(vp_dev);
> +			if (rc)
> +				goto err_probe;
> +		} else {
> +			rc = virtio_pci_modern_probe(vp_dev);
> +			if (rc == -ENODEV)
> +				rc = virtio_pci_legacy_probe(vp_dev);
> +			if (rc)
> +				goto err_probe;
> +		}
> +
> +		...
> +
> +		rc = register_virtio_device(&vp_dev->vdev);
> +
> +When the device is registered to the virtio bus the kernel will look
> +for a driver in the bus that can handle the device and call that
> +driver's ``probe`` method.
> +
> +It's at this stage that the virtqueues will be setup by calling the
> +appropriate `virtio_find` helper function, such as
> +:c:func:`virtio_find_single_vq` or :c:func:`virtio_find_vqs`, which will
> +end up calling the device ``find_vqs`` config op (transport-specific),
> +which will allocate the virtqueues and configure them. In the case of
> +virtio PCI devices, that's done by the ``setup_vq`` method seen above.
> +
> +
> +References
> +==========
> +
> +[1] Virtio Spec v1.1:
> +https://docs.oasis-open.org/virtio/virtio/v1.1/virtio-v1.1.html

1.2 is out.

> +
> +[2] Virtqueues and virtio ring: How the data travels
> +https://www.redhat.com/en/blog/virtqueues-and-virtio-ring-how-data-travels
> +
> +.. rubric:: Footnotes
> +
> +.. [#f1] that's why they may be also referred as virtrings.
> diff --git a/Documentation/driver-api/virtio/writing_virtio_drivers.rst b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
> new file mode 100644
> index 000000000000..5cb088b817ae
> --- /dev/null
> +++ b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
> @@ -0,0 +1,190 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _writing_virtio_drivers:
> +
> +======================
> +Writing Virtio Drivers
> +======================
> +
> +Introduction
> +============
> +
> +The `Virtio spec
> +<https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-1930005>`__
> +defines all the supported Virtio device types. Since these devices are,
> +by definition, meant as abstractions for a wide variety of real
> +hardware, the addition of new virtio drivers is not expected to be very
> +frequent. Still, this document serves as a basic guideline for driver
> +programmers that need to hack a new Virtio driver or understand the
> +essentials of the existing ones. See :ref:`Virtio on Linux <virtio>` for
> +a general overview of Virtio.
> +
> +
> +Driver boilerplate
> +==================
> +
> +As a bare minimum, a virtio driver should register in the virtio bus and
> +configure the virtqueues for the device according to its spec, the
> +configuration of the virtqueues in the driver side must match the
> +virtqueue definitions in the device. A basic driver skeleton could look
> +like this::
> +
> +	#include <linux/virtio.h>
> +	#include <linux/virtio_ids.h>
> +	#include <linux/virtio_config.h>
> +	#include <linux/module.h>
> +
> +	/* device private data (one per device) */
> +	struct virtio_dummy_dev {
> +		struct virtqueue *vq;
> +	};
> +
> +	static void virtio_dummy_recv_cb(struct virtqueue *vq)
> +	{
> +		struct virtio_dummy_dev *dev = vq->vdev->priv;
> +		char *buf;
> +		unsigned int len;
> +
> +		buf = virtqueue_get_buf(dev->vq, &len);
> +		/* spurious callback? */
> +		if (!buf)
> +			return;
> +
> +		/* Process the received data */
> +	}
> +
> +	static int virtio_dummy_probe(struct virtio_device *vdev)
> +	{
> +		struct virtio_dummy_dev *dev = NULL;
> +
> +		/* initialize device data */
> +		dev = kzalloc(sizeof(struct virtio_dummy_dev), GFP_KERNEL);
> +		if (!dev)
> +			return -ENOMEM;
> +
> +		/* the device has a single virtqueue */
> +		dev->vq = virtio_find_single_vq(vdev, virtio_dummy_recv_cb, "input");
> +		if (IS_ERR(dev->vq)) {
> +			kfree(dev);
> +			return PTR_ERR(dev->vq);
> +
> +		}
> +		vdev->priv = dev;
> +
> +		return 0;
> +	}
> +
> +	static void virtio_dummy_remove(struct virtio_device *vdev)
> +	{
> +		struct virtio_dummy_dev *dev = vdev->priv;
> +
> +		/*
> +		 * Disable vq interrupts: equivalent to
> +		 * vdev->config->reset(vdev)
> +		 */
> +		virtio_reset_device(vdev);
> +
> +		/* remove virtqueues */
> +		vdev->config->del_vqs(vdev);
> +
> +		kfree(dev);
> +	}
> +
> +	static const struct virtio_device_id id_table[] = {
> +		{ VIRTIO_ID_DUMMY, VIRTIO_DEV_ANY_ID },
> +		{ 0 },
> +	};
> +
> +	static struct virtio_driver virtio_dummy_driver = {
> +		.driver.name =	KBUILD_MODNAME,
> +		.driver.owner =	THIS_MODULE,
> +		.id_table =	id_table,
> +		.probe =	virtio_dummy_probe,
> +		.remove =	virtio_dummy_remove,
> +	};
> +
> +	module_virtio_driver(virtio_dummy_driver);
> +	MODULE_DEVICE_TABLE(virtio, id_table);
> +	MODULE_DESCRIPTION("Dummy virtio driver");
> +	MODULE_LICENSE("GPL");
> +
> +This assumes the device is of a new virtio device type not defined
> +before: ``VIRTIO_DEVICE_DUMMY``, which we should define in
> +include/uapi/linux/virtio_ids.h. The device has only one virtqueue which
> +is meant to be used to send data from the host to the guest.
> +
> +If your driver doesn't have to do anything special in its ``init`` and
> +``exit`` methods, you can use the :c:func:`module_virtio_driver` helper to
> +reduce the amount of boilerplate code.
> +
> +The ``probe`` method does the minimum driver setup in this case
> +(memory allocation for the device data) and initializes the
> +virtqueue. The virtqueues are automatically enabled after ``probe``
> +returns, sending the appropriate "DRIVER_OK" status signal to the
> +device. If the virtqueues need to be enabled before ``probe`` ends, they
> +can be manually enabled by calling :c:func:`virtio_device_ready`:
> +
> +.. kernel-doc:: include/linux/virtio_config.h
> +    :identifiers: virtio_device_ready
> +
> +
> +Sending and receiving data
> +==========================
> +
> +The :c:func:`virtio_dummy_recv_cb` callback in the code above will be
> +triggered when the device notifies the driver after it finishes
> +processing a descriptor or descriptor chain, either for reading or
> +writing. However, that's only the second half of the Virtio
> +device-driver communication process, as the communication is always
> +started by the driver regardless of the direction of the data transfer.
> +
> +To configure a buffer transfer from the driver to the device, first you
> +have to add the buffers -- packed as `scatterlists` -- to the
> +appropriate virtqueue using any of the :c:func:`virtqueue_add_inbuf`,
> +:c:func:`virtqueue_add_outbuf` or :c:func:`virtqueue_add_sgs`, depending
> +on whether you need to add one input `scatterlist` (for the device to
> +fill in), one output `scatterlist` (for the device to consume) or
> +multiple `scatterlists`, respectively. Then, once the virtqueue is set
> +up, a call to :c:func:`virtqueue_kick` sends a notification that will be
> +serviced by the hypervisor that implements the device::
> +
> +	struct scatterlist sg[1];
> +	sg_init_one(sg, buffer, BUFLEN);
> +	virtqueue_add_inbuf(dev->vq, sg, 1, buffer, GFP_ATOMIC);
> +	virtqueue_kick(dev->vq);
> +
> +.. kernel-doc:: drivers/virtio/virtio_ring.c
> +    :identifiers: virtqueue_add_inbuf
> +
> +.. kernel-doc:: drivers/virtio/virtio_ring.c
> +    :identifiers: virtqueue_add_outbuf
> +
> +.. kernel-doc:: drivers/virtio/virtio_ring.c
> +    :identifiers: virtqueue_add_sgs
> +
> +Then, after the device has read or written the buffers prepared by the
> +driver and notifies it back, the driver can call
> +:c:func:`virtqueue_get_buf` to read the data produced by the device (if
> +the virtqueue was set up with input buffers) or simply to reclaim the
> +buffers if they were already consumed by the device:
> +
> +.. kernel-doc:: drivers/virtio/virtio_ring.c
> +    :identifiers: virtqueue_get_buf_ctx
> +
> +The virtqueue callbacks can be disabled and re-enabled using the
> +:c:func:`virtqueue_disable_cb` and the family of
> +:c:func:`virtqueue_enable_cb` functions respectively. See
> +drivers/virtio/virtio_ring.c for more details:
> +
> +.. kernel-doc:: drivers/virtio/virtio_ring.c
> +    :identifiers: virtqueue_disable_cb
> +
> +.. kernel-doc:: drivers/virtio/virtio_ring.c
> +    :identifiers: virtqueue_enable_cb
> +
> +
> +References
> +==========
> +
> +[1] Virtio Spec v1.1:
> +https://docs.oasis-open.org/virtio/virtio/v1.1/virtio-v1.1.html
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c0f958dfd289..1ea754e45e07 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21465,6 +21465,7 @@ S:	Maintained
>  F:	Documentation/ABI/testing/sysfs-bus-vdpa
>  F:	Documentation/ABI/testing/sysfs-class-vduse
>  F:	Documentation/devicetree/bindings/virtio/
> +F:	Documentation/driver-api/virtio/
>  F:	drivers/block/virtio_blk.c
>  F:	drivers/crypto/virtio/
>  F:	drivers/net/virtio_net.c
> diff --git a/include/linux/virtio.h b/include/linux/virtio.h
> index d8fdf170637c..fd8440e85933 100644
> --- a/include/linux/virtio.h
> +++ b/include/linux/virtio.h
> @@ -11,7 +11,7 @@
>  #include <linux/gfp.h>
>  
>  /**
> - * virtqueue - a queue to register buffers for sending or receiving.
> + * struct virtqueue - a queue to register buffers for sending or receiving.
>   * @list: the chain of virtqueues for this device
>   * @callback: the function to call when buffers are consumed (can be NULL).
>   * @name: the name of this virtqueue (mainly for debugging)
> @@ -90,7 +90,7 @@ dma_addr_t virtqueue_get_avail_addr(struct virtqueue *vq);
>  dma_addr_t virtqueue_get_used_addr(struct virtqueue *vq);
>  
>  /**
> - * virtio_device - representation of a device using virtio
> + * struct virtio_device - representation of a device using virtio
>   * @index: unique position on the virtio bus
>   * @failed: saved value for VIRTIO_CONFIG_S_FAILED bit (for restore)
>   * @config_enabled: configuration change reporting enabled
> @@ -146,7 +146,7 @@ size_t virtio_max_dma_size(struct virtio_device *vdev);
>  	list_for_each_entry(vq, &vdev->vqs, list)
>  
>  /**
> - * virtio_driver - operations for a virtio I/O driver
> + * struct virtio_driver - operations for a virtio I/O driver
>   * @driver: underlying device driver (populate name and owner).
>   * @id_table: the ids serviced by this driver.
>   * @feature_table: an array of feature numbers supported by this driver.
> diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
> index b47c2e7ed0ee..997801018ae4 100644
> --- a/include/linux/virtio_config.h
> +++ b/include/linux/virtio_config.h
> @@ -225,7 +225,7 @@ int virtio_find_vqs_ctx(struct virtio_device *vdev, unsigned nvqs,
>  
>  /**
>   * virtio_synchronize_cbs - synchronize with virtqueue callbacks
> - * @vdev: the device
> + * @dev: the device
>   */
>  static inline
>  void virtio_synchronize_cbs(struct virtio_device *dev)
> @@ -244,7 +244,7 @@ void virtio_synchronize_cbs(struct virtio_device *dev)
>  
>  /**
>   * virtio_device_ready - enable vq use in probe function
> - * @vdev: the device
> + * @dev: the device
>   *
>   * Driver must call this to use vqs in the probe function.
>   *
> @@ -292,7 +292,7 @@ const char *virtio_bus_name(struct virtio_device *vdev)
>  /**
>   * virtqueue_set_affinity - setting affinity for a virtqueue
>   * @vq: the virtqueue
> - * @cpu: the cpu no.
> + * @cpu_mask: the cpu mask
>   *
>   * Pay attention the function are best-effort: the affinity hint may not be set
>   * due to config support, irq type and sharing.
> diff --git a/include/uapi/linux/virtio_ring.h b/include/uapi/linux/virtio_ring.h
> index 476d3e5c0fe7..f8c20d3de8da 100644
> --- a/include/uapi/linux/virtio_ring.h
> +++ b/include/uapi/linux/virtio_ring.h
> @@ -93,15 +93,21 @@
>  #define VRING_USED_ALIGN_SIZE 4
>  #define VRING_DESC_ALIGN_SIZE 16
>  
> -/* Virtio ring descriptors: 16 bytes.  These can chain together via "next". */
> +/**
> + * struct vring_desc - Virtio ring descriptors,
> + * 16 bytes long. These can chain together via @next.
> + *
> + * @addr: buffer address (guest-physical)
> + * @len: buffer length
> + * @flags: descriptor flags
> + * @next: index of the next descriptor in the chain,
> + *        if the VRING_DESC_F_NEXT flag is set. We chain unused
> + *        descriptors via this, too.
> + */
>  struct vring_desc {
> -	/* Address (guest-physical). */
>  	__virtio64 addr;
> -	/* Length. */
>  	__virtio32 len;
> -	/* The flags as indicated above. */
>  	__virtio16 flags;
> -	/* We chain unused descriptors via this, too */
>  	__virtio16 next;
>  };
>  
> -- 
> 2.25.1

