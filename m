Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD15CC25B06
	for <linux-doc@archiver.kernel.org>; Wed, 10 Aug 2022 09:41:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232191AbiHJJkl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Aug 2022 05:40:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232194AbiHJJkh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Aug 2022 05:40:37 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2BD7B87
        for <linux-doc@vger.kernel.org>; Wed, 10 Aug 2022 02:40:30 -0700 (PDT)
Received: from localhost.localdomain (unknown [213.194.152.135])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: rcn)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 6C3A06601C5B;
        Wed, 10 Aug 2022 10:40:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1660124429;
        bh=C1gtPnZiOB+cssTueUKtZdi5hUhjH8ZzT2t1tvkSKmA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DasQahpy6Lw2X10KsXxnHEHLwYsZPdOJflYetOG1Y6GCBHpvML5mW4MG4/7NgzHd2
         cM9XBUSgBIOA2lPnzjB4hMqUSiKaulWPKO8wNWzW9Pz3E+CJ+W82FO4x31QWTcCa2m
         20K6tJl3s59funxv2r/FteLBEusbqdoYqpuMXsUQPutPG/xEKbaIx5dDMeCk3VeAZl
         W7XdInnpgwnflpynwjaSfCVB2p7skuYx7k177+RhPjQC1ipJIA2xjGgx685eeD42kI
         8kmq1HaI+b/sW27YNhzYvSjwxBXWW5KVPuaufBGnjKh5BH0ijVM9P0qyqagKzGf1uJ
         QGxC0zQHnArwQ==
From:   =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     linux-doc@vger.kernel.org
Cc:     virtualization@lists.linux-foundation.org, mst@redhat.com,
        jasowang@redhat.com, kernel@collabora.com, cohuck@redhat.com,
        bagasdotme@gmail.com
Subject: [PATCH v4 2/2] docs: driver-api: virtio: virtio on Linux
Date:   Wed, 10 Aug 2022 11:40:04 +0200
Message-Id: <20220810094004.1250-3-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220810094004.1250-1-ricardo.canuelo@collabora.com>
References: <20220810094004.1250-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Basic doc about Virtio on Linux and a short tutorial on Virtio drivers.

Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
---
 Documentation/driver-api/index.rst            |   1 +
 Documentation/driver-api/virtio/index.rst     |  11 ++
 Documentation/driver-api/virtio/virtio.rst    | 144 ++++++++++++++
 .../virtio/writing_virtio_drivers.rst         | 186 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 5 files changed, 343 insertions(+)
 create mode 100644 Documentation/driver-api/virtio/index.rst
 create mode 100644 Documentation/driver-api/virtio/virtio.rst
 create mode 100644 Documentation/driver-api/virtio/writing_virtio_drivers.rst

diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index d3a58f77328e..30a3de452b1d 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -106,6 +106,7 @@ available subsections can be seen below.
    vfio-mediated-device
    vfio
    vfio-pci-device-specific-driver-acceptance
+   virtio/index
    xilinx/index
    xillybus
    zorro
diff --git a/Documentation/driver-api/virtio/index.rst b/Documentation/driver-api/virtio/index.rst
new file mode 100644
index 000000000000..528b14b291e3
--- /dev/null
+++ b/Documentation/driver-api/virtio/index.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======
+Virtio
+======
+
+.. toctree::
+   :maxdepth: 1
+
+   virtio
+   writing_virtio_drivers
diff --git a/Documentation/driver-api/virtio/virtio.rst b/Documentation/driver-api/virtio/virtio.rst
new file mode 100644
index 000000000000..921758fc3b23
--- /dev/null
+++ b/Documentation/driver-api/virtio/virtio.rst
@@ -0,0 +1,144 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _virtio:
+
+===============
+Virtio on Linux
+===============
+
+Introduction
+============
+
+Virtio is an open standard that defines a protocol for communication
+between drivers and devices of different types, see Chapter 5 ("Device
+Types") of the virtio spec `[1]`_. Originally developed as a standard
+for paravirtualized devices implemented by a hypervisor, it can be used
+to interface any compliant device (real or emulated) with a driver.
+
+For illustrative purposes, this document will focus on the common case
+of a Linux kernel running in a virtual machine and using paravirtualized
+devices provided by the hypervisor, which exposes them as virtio devices
+via standard mechanisms such as PCI.
+
+
+Device - Driver communication: virtqueues
+=========================================
+
+Although the virtio devices are really an abstraction layer in the
+hypervisor, they're exposed to the guest as if they are physical devices
+using a specific transport method -- PCI, MMIO or CCW -- that is
+orthogonal to the device itself. The virtio spec defines these transport
+methods in detail, including device discovery, capabilities and
+interrupt handling.
+
+The communication between the driver in the guest OS and the device in
+the hypervisor is done through shared memory (that's what makes virtio
+devices so efficient) using specialized data structures called
+virtqueues, which are actually ring buffers [#f1]_ of buffer descriptors
+similar to the ones used in a network device:
+
+.. kernel-doc:: include/uapi/linux/virtio_ring.h
+    :identifiers: struct vring_desc
+
+All the buffers the descriptors point to are allocated by the guest and
+used by the host either for reading or for writing but not for both.
+
+Refer to Chapter 2.5 ("Virtqueues") of the virtio spec `[1]`_ for the
+reference definitions of virtqueues and to `[2]`_ for an illustrated
+overview of how the host device and the guest driver communicate.
+
+The :c:type:`vring_virtqueue` struct models a virtqueue, including the
+ring buffers and management data. Embedded in this struct is the
+:c:type:`virtqueue` struct, which is the data structure that's
+ultimately used by virtio drivers:
+
+.. kernel-doc:: include/linux/virtio.h
+    :identifiers: struct virtqueue
+
+The callback function pointed by this struct is triggered when the
+device has consumed the buffers provided by the driver. More
+specifically, the trigger will be an interrupt issued by the hypervisor
+(see vring_interrupt()). Interrupt request handlers are registered for
+a virtqueue during the virtqueue setup process (transport-specific).
+
+.. kernel-doc:: drivers/virtio/virtio_ring.c
+    :identifiers: vring_interrupt
+
+
+Device discovery and probing
+============================
+
+In the kernel, the virtio core contains the virtio bus driver and
+transport-specific drivers like `virtio-pci` and `virtio-mmio`. Then
+there are individual virtio drivers for specific device types that are
+registered to the virtio bus driver.
+
+How a virtio device is found and configured by the kernel depends on how
+the hypervisor defines it. Taking the `QEMU virtio-console
+<https://gitlab.com/qemu-project/qemu/-/blob/master/hw/char/virtio-console.c>`__
+device as an example. When using PCI as a transport method, the device
+will present itself on the PCI bus with vendor 0x1af4 (Red Hat, Inc.)
+and device id 0x1003 (virtio console), as defined in the spec, so the
+kernel will detect it as it would do with any other PCI device.
+
+During the PCI enumeration process, if a device is found to match the
+virtio-pci driver (according to the virtio-pci device table, any PCI
+device with vendor id = 0x1af4)::
+
+	/* Qumranet donated their vendor ID for devices 0x1000 thru 0x10FF. */
+	static const struct pci_device_id virtio_pci_id_table[] = {
+		{ PCI_DEVICE(PCI_VENDOR_ID_REDHAT_QUMRANET, PCI_ANY_ID) },
+		{ 0 }
+	};
+
+then the virtio-pci driver is probed and, if the probing goes well, the
+device is registered to the virtio bus::
+
+	static int virtio_pci_probe(struct pci_dev *pci_dev,
+				    const struct pci_device_id *id)
+	{
+		...
+
+		if (force_legacy) {
+			rc = virtio_pci_legacy_probe(vp_dev);
+			/* Also try modern mode if we can't map BAR0 (no IO space). */
+			if (rc == -ENODEV || rc == -ENOMEM)
+				rc = virtio_pci_modern_probe(vp_dev);
+			if (rc)
+				goto err_probe;
+		} else {
+			rc = virtio_pci_modern_probe(vp_dev);
+			if (rc == -ENODEV)
+				rc = virtio_pci_legacy_probe(vp_dev);
+			if (rc)
+				goto err_probe;
+		}
+
+		...
+
+		rc = register_virtio_device(&vp_dev->vdev);
+
+When the device is registered to the virtio bus the kernel will look
+for a driver in the bus that can handle the device and call that
+driver's ``probe`` method.
+
+It's at this stage that the virtqueues will be allocated and configured
+by calling the appropriate ``virtio_find`` helper function, such as
+virtio_find_single_vq() or virtio_find_vqs(), which will end up
+calling a transport-specific ``find_vqs`` method.
+
+
+References
+==========
+
+_`[1]` Virtio Spec v1.2:
+https://docs.oasis-open.org/virtio/virtio/v1.2/virtio-v1.2.html
+
+Check for later versions of the spec as well.
+
+_`[2]` Virtqueues and virtio ring: How the data travels
+https://www.redhat.com/en/blog/virtqueues-and-virtio-ring-how-data-travels
+
+.. rubric:: Footnotes
+
+.. [#f1] that's why they may be also referred as virtrings.
diff --git a/Documentation/driver-api/virtio/writing_virtio_drivers.rst b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
new file mode 100644
index 000000000000..3e5e4648dd5e
--- /dev/null
+++ b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
@@ -0,0 +1,186 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _writing_virtio_drivers:
+
+======================
+Writing Virtio Drivers
+======================
+
+Introduction
+============
+
+This document serves as a basic guideline for driver programmers that
+need to hack a new virtio driver or understand the essentials of the
+existing ones. See :ref:`Virtio on Linux <virtio>` for a general
+overview of virtio.
+
+
+Driver boilerplate
+==================
+
+As a bare minimum, a virtio driver needs to register in the virtio bus
+and configure the virtqueues for the device according to its spec, the
+configuration of the virtqueues in the driver side must match the
+virtqueue definitions in the device. A basic driver skeleton could look
+like this::
+
+	#include <linux/virtio.h>
+	#include <linux/virtio_ids.h>
+	#include <linux/virtio_config.h>
+	#include <linux/module.h>
+
+	/* device private data (one per device) */
+	struct virtio_dummy_dev {
+		struct virtqueue *vq;
+	};
+
+	static void virtio_dummy_recv_cb(struct virtqueue *vq)
+	{
+		struct virtio_dummy_dev *dev = vq->vdev->priv;
+		char *buf;
+		unsigned int len;
+
+		buf = virtqueue_get_buf(dev->vq, &len);
+		/* spurious callback? */
+		if (!buf)
+			return;
+
+		/* Process the received data */
+	}
+
+	static int virtio_dummy_probe(struct virtio_device *vdev)
+	{
+		struct virtio_dummy_dev *dev = NULL;
+
+		/* initialize device data */
+		dev = kzalloc(sizeof(struct virtio_dummy_dev), GFP_KERNEL);
+		if (!dev)
+			return -ENOMEM;
+
+		/* the device has a single virtqueue */
+		dev->vq = virtio_find_single_vq(vdev, virtio_dummy_recv_cb, "input");
+		if (IS_ERR(dev->vq)) {
+			kfree(dev);
+			return PTR_ERR(dev->vq);
+
+		}
+		vdev->priv = dev;
+
+		return 0;
+	}
+
+	static void virtio_dummy_remove(struct virtio_device *vdev)
+	{
+		struct virtio_dummy_dev *dev = vdev->priv;
+
+		/*
+		 * Disable vq interrupts: equivalent to
+		 * vdev->config->reset(vdev)
+		 */
+		virtio_reset_device(vdev);
+
+		/* remove virtqueues */
+		vdev->config->del_vqs(vdev);
+
+		kfree(dev);
+	}
+
+	static const struct virtio_device_id id_table[] = {
+		{ VIRTIO_ID_DUMMY, VIRTIO_DEV_ANY_ID },
+		{ 0 },
+	};
+
+	static struct virtio_driver virtio_dummy_driver = {
+		.driver.name =	KBUILD_MODNAME,
+		.driver.owner =	THIS_MODULE,
+		.id_table =	id_table,
+		.probe =	virtio_dummy_probe,
+		.remove =	virtio_dummy_remove,
+	};
+
+	module_virtio_driver(virtio_dummy_driver);
+	MODULE_DEVICE_TABLE(virtio, id_table);
+	MODULE_DESCRIPTION("Dummy virtio driver");
+	MODULE_LICENSE("GPL");
+
+The device id ``VIRTIO_ID_DUMMY`` here is a placeholder, virtio drivers
+should be added only for devices that are defined in the spec, see
+include/uapi/linux/virtio_ids.h. Device ids need to be at least reserved
+in the virtio spec before being added to that file.
+
+If your driver doesn't have to do anything special in its ``init`` and
+``exit`` methods, you can use the module_virtio_driver() helper to
+reduce the amount of boilerplate code.
+
+The ``probe`` method does the minimum driver setup in this case
+(memory allocation for the device data) and initializes the
+virtqueue. The virtqueues are automatically enabled after ``probe``
+returns, sending the appropriate "DRIVER_OK" status signal to the
+device. If the virtqueues need to be enabled before ``probe`` ends, they
+can be manually enabled by calling virtio_device_ready():
+
+.. kernel-doc:: include/linux/virtio_config.h
+    :identifiers: virtio_device_ready
+
+
+Sending and receiving data
+==========================
+
+The virtio_dummy_recv_cb() callback in the code above will be triggered
+when the device notifies the driver after it finishes processing a
+descriptor or descriptor chain, either for reading or writing. However,
+that's only the second half of the virtio device-driver communication
+process, as the communication is always started by the driver regardless
+of the direction of the data transfer.
+
+To configure a buffer transfer from the driver to the device, first you
+have to add the buffers -- packed as `scatterlists` -- to the
+appropriate virtqueue using any of the virtqueue_add_inbuf(),
+virtqueue_add_outbuf() or virtqueue_add_sgs(), depending on whether you
+need to add one input `scatterlist` (for the device to fill in), one
+output `scatterlist` (for the device to consume) or multiple
+`scatterlists`, respectively. Then, once the virtqueue is set up, a call
+to virtqueue_kick() sends a notification that will be serviced by the
+hypervisor that implements the device::
+
+	struct scatterlist sg[1];
+	sg_init_one(sg, buffer, BUFLEN);
+	virtqueue_add_inbuf(dev->vq, sg, 1, buffer, GFP_ATOMIC);
+	virtqueue_kick(dev->vq);
+
+.. kernel-doc:: drivers/virtio/virtio_ring.c
+    :identifiers: virtqueue_add_inbuf
+
+.. kernel-doc:: drivers/virtio/virtio_ring.c
+    :identifiers: virtqueue_add_outbuf
+
+.. kernel-doc:: drivers/virtio/virtio_ring.c
+    :identifiers: virtqueue_add_sgs
+
+Then, after the device has read or written the buffers prepared by the
+driver and notifies it back, the driver can call virtqueue_get_buf() to
+read the data produced by the device (if the virtqueue was set up with
+input buffers) or simply to reclaim the buffers if they were already
+consumed by the device:
+
+.. kernel-doc:: drivers/virtio/virtio_ring.c
+    :identifiers: virtqueue_get_buf_ctx
+
+The virtqueue callbacks can be disabled and re-enabled using the
+virtqueue_disable_cb() and the family of virtqueue_enable_cb() functions
+respectively. See drivers/virtio/virtio_ring.c for more details:
+
+.. kernel-doc:: drivers/virtio/virtio_ring.c
+    :identifiers: virtqueue_disable_cb
+
+.. kernel-doc:: drivers/virtio/virtio_ring.c
+    :identifiers: virtqueue_enable_cb
+
+
+References
+==========
+
+_`[1]` Virtio Spec v1.2:
+https://docs.oasis-open.org/virtio/virtio/v1.2/virtio-v1.2.html
+
+Check for later versions of the spec as well.
diff --git a/MAINTAINERS b/MAINTAINERS
index 779f599f9abf..6ecdddb89da4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21488,6 +21488,7 @@ S:	Maintained
 F:	Documentation/ABI/testing/sysfs-bus-vdpa
 F:	Documentation/ABI/testing/sysfs-class-vduse
 F:	Documentation/devicetree/bindings/virtio/
+F:	Documentation/driver-api/virtio/
 F:	drivers/block/virtio_blk.c
 F:	drivers/crypto/virtio/
 F:	drivers/net/virtio_net.c
-- 
2.25.1

