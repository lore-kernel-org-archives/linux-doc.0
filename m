Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 27AE67D92A
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Aug 2019 07:46:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbfH2HqO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Aug 2019 03:46:14 -0400
Received: from mail-pf1-f202.google.com ([209.85.210.202]:41402 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727860AbfH2HqN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 03:46:13 -0400
Received: by mail-pf1-f202.google.com with SMTP id 191so1850598pfz.8
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 00:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=g9neP1BMd9+Wtn3CRZXwPOPnH9RFKMYcA30E3wwujtE=;
        b=Yjxatas0C4IwQKRotypNbKpfKgceY9v+TzPrOZP8pzE/6GmAr/izNBfD4Y0tl1l6OB
         scCOHhEaDq2dat/3Gw1CR1MoWtCI6+xMbsyexb2s+96I9fMmCu8PxJVj4J/q1HE9YN8E
         7yXCr2o00LyKCXwj7DCqhLBi4/Z8UYZkyZi6lqH7O2YCGXU73YvWeD6No8IrrcJS+Fnn
         +Xgh+UIZmlkDyzQWHVm+yKVYbb7ibOURCuD1aZtnSABI+cczwBfO2fHJzG/tbVJKr9IP
         9BFh2o/yGs7IviTHa5I7/tCskRQaPtQDIvubr9Li6ZMQVM+EPhu820HHhvi+CMRh/QLj
         XGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=g9neP1BMd9+Wtn3CRZXwPOPnH9RFKMYcA30E3wwujtE=;
        b=TSt9Flo8Hr5ECeCtO/VWLGkYOxFY2XY8ownOnDSRlYnAn3K7amSLmC37pBdNDp2vOZ
         aa2nDoxuIhAtyvykhRE5FXNQz69lFn6qpYuvb+iTJTJk0Oq5nvmWC42k+ybB0XABnY/j
         GZmRfk6L5z2fQxxV0yFJxrmS0Jiw3KguAD6OkWG7zrrsAEMKx+9k4VSIPghPlx5izZ5K
         DfhFHPE98lyAr5kMc3q/PA5gQTCka9yZvi95tgkWSk9sSQHnoVv8mNIQ9yNlUSVI5GQO
         k8HVoza0FgUK0QGy00h7PP5T4RB0rQqHY0Da4WhOxzVqIiCutd9F5H68pqwUuxUv0GPW
         pSDw==
X-Gm-Message-State: APjAAAXnp8/UcTRIFGxJkxP4wRRsw2nOUkERlHxNoxI03v3kBFr1hgOe
        4VJllp7O+ka5YK6KcclbBzyH6KwDpMdLEXE=
X-Google-Smtp-Source: APXvYqwhMeQU3fz28Lvj2V0wRdHc3nSTlHNET5OWwSBTrVD3J/QGaEW8Ye9Q8ONxl2B6ofCSveZ9ALitA/jb9uY=
X-Received: by 2002:a63:2b84:: with SMTP id r126mr7241298pgr.308.1567064771823;
 Thu, 29 Aug 2019 00:46:11 -0700 (PDT)
Date:   Thu, 29 Aug 2019 00:45:57 -0700
In-Reply-To: <20190829074603.70424-1-saravanak@google.com>
Message-Id: <20190829074603.70424-2-saravanak@google.com>
Mime-Version: 1.0
References: <20190829074603.70424-1-saravanak@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v10 1/7] driver core: Add support for linking devices during
 device addition
From:   Saravana Kannan <saravanak@google.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>
Cc:     Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-acpi@vger.kernel.org, clang-built-linux@googlegroups.com,
        David Collins <collinsd@codeaurora.org>,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The firmware corresponding to a device (dev.fwnode) might be able to
provide functional dependency information between a device and its
supplier and consumer devices.  Tracking this functional dependency
allows optimizing device probe order and informing a supplier when all
its consumers have probed (and thereby actively managing their
resources).

The existing device links feature allows tracking and using
supplier-consumer relationships. So, this patch adds the add_links()
fwnode callback to allow firmware to create device links for each
device as the device is added.

However, when consumer devices are added, they might not have a supplier
device to link to despite needing mandatory resources/functionality from
one or more suppliers. A waiting_for_suppliers list is created to track
such consumers and retry linking them when new devices get added.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 Documentation/driver-api/device_link.rst |  3 +-
 drivers/base/core.c                      | 89 ++++++++++++++++++++++++
 include/linux/device.h                   |  2 +
 include/linux/fwnode.h                   | 17 +++++
 4 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/device_link.rst b/Documentation/driver-api/device_link.rst
index 1b5020ec6517..bc2d89af88ce 100644
--- a/Documentation/driver-api/device_link.rst
+++ b/Documentation/driver-api/device_link.rst
@@ -281,7 +281,8 @@ State machine
   :c:func:`driver_bound()`.)
 
 * Before a consumer device is probed, presence of supplier drivers is
-  verified by checking that links to suppliers are in ``DL_STATE_AVAILABLE``
+  verified by checking the consumer device is not in the wait_for_suppliers
+  list and by checking that links to suppliers are in ``DL_STATE_AVAILABLE``
   state.  The state of the links is updated to ``DL_STATE_CONSUMER_PROBE``.
   (Call to :c:func:`device_links_check_suppliers()` from
   :c:func:`really_probe()`.)
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 2db62d98e395..39633bb75f0f 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -44,6 +44,8 @@ early_param("sysfs.deprecated", sysfs_deprecated_setup);
 #endif
 
 /* Device links support. */
+static LIST_HEAD(wait_for_suppliers);
+static DEFINE_MUTEX(wfs_lock);
 
 #ifdef CONFIG_SRCU
 static DEFINE_MUTEX(device_links_lock);
@@ -430,6 +432,58 @@ struct device_link *device_link_add(struct device *consumer,
 }
 EXPORT_SYMBOL_GPL(device_link_add);
 
+/**
+ * device_link_wait_for_supplier - Add device to wait_for_suppliers list
+ * @consumer: Consumer device
+ *
+ * Marks the @consumer device as waiting for suppliers to become available by
+ * adding it to the wait_for_suppliers list. The consumer device will never be
+ * probed until it's removed from the wait_for_suppliers list.
+ *
+ * The caller is responsible for adding the links to the supplier devices once
+ * they are available and removing the @consumer device from the
+ * wait_for_suppliers list once links to all the suppliers have been created.
+ *
+ * This function is NOT meant to be called from the probe function of the
+ * consumer but rather from code that creates/adds the consumer device.
+ */
+static void device_link_wait_for_supplier(struct device *consumer)
+{
+	mutex_lock(&wfs_lock);
+	list_add_tail(&consumer->links.needs_suppliers, &wait_for_suppliers);
+	mutex_unlock(&wfs_lock);
+}
+
+/**
+ * device_link_add_missing_supplier_links - Add links from consumer devices to
+ *					    supplier devices, leaving any
+ *					    consumer with inactive suppliers on
+ *					    the wait_for_suppliers list
+ *
+ * Loops through all consumers waiting on suppliers and tries to add all their
+ * supplier links. If that succeeds, the consumer device is removed from
+ * wait_for_suppliers list. Otherwise, they are left in the wait_for_suppliers
+ * list.  Devices left on the wait_for_suppliers list will not be probed.
+ *
+ * The fwnode add_links callback is expected to return 0 if it has found and
+ * added all the supplier links for the consumer device. It should return an
+ * error if it isn't able to do so.
+ *
+ * The caller of device_link_wait_for_supplier() is expected to call this once
+ * it's aware of potential suppliers becoming available.
+ */
+static void device_link_add_missing_supplier_links(void)
+{
+	struct device *dev, *tmp;
+
+	mutex_lock(&wfs_lock);
+	list_for_each_entry_safe(dev, tmp, &wait_for_suppliers,
+				 links.needs_suppliers)
+		if (!fwnode_call_int_op(dev->fwnode, add_links, dev))
+			list_del_init(&dev->links.needs_suppliers);
+	mutex_unlock(&wfs_lock);
+}
+
 static void device_link_free(struct device_link *link)
 {
 	while (refcount_dec_not_one(&link->rpm_active))
@@ -564,6 +618,17 @@ int device_links_check_suppliers(struct device *dev)
 	struct device_link *link;
 	int ret = 0;
 
+	/*
+	 * Device waiting for supplier to become available is not allowed to
+	 * probe.
+	 */
+	mutex_lock(&wfs_lock);
+	if (!list_empty(&dev->links.needs_suppliers)) {
+		mutex_unlock(&wfs_lock);
+		return -EPROBE_DEFER;
+	}
+	mutex_unlock(&wfs_lock);
+
 	device_links_write_lock();
 
 	list_for_each_entry(link, &dev->links.suppliers, c_node) {
@@ -848,6 +913,10 @@ static void device_links_purge(struct device *dev)
 {
 	struct device_link *link, *ln;
 
+	mutex_lock(&wfs_lock);
+	list_del(&dev->links.needs_suppliers);
+	mutex_unlock(&wfs_lock);
+
 	/*
 	 * Delete all of the remaining links from this device to any other
 	 * devices (either consumers or suppliers).
@@ -1712,6 +1781,7 @@ void device_initialize(struct device *dev)
 #endif
 	INIT_LIST_HEAD(&dev->links.consumers);
 	INIT_LIST_HEAD(&dev->links.suppliers);
+	INIT_LIST_HEAD(&dev->links.needs_suppliers);
 	dev->links.status = DL_DEV_NO_DRIVER;
 }
 EXPORT_SYMBOL_GPL(device_initialize);
@@ -2198,6 +2268,25 @@ int device_add(struct device *dev)
 					     BUS_NOTIFY_ADD_DEVICE, dev);
 
 	kobject_uevent(&dev->kobj, KOBJ_ADD);
+
+	/*
+	 * Check if any of the other devices (consumers) have been waiting for
+	 * this device (supplier) to be added so that they can create a device
+	 * link to it.
+	 *
+	 * This needs to happen after device_pm_add() because device_link_add()
+	 * requires the supplier be registered before it's called.
+	 *
+	 * But this also needs to happe before bus_probe_device() to make sure
+	 * waiting consumers can link to it before the driver is bound to the
+	 * device and the driver sync_state callback is called for this device.
+	 */
+	device_link_add_missing_supplier_links();
+
+	if (fwnode_has_op(dev->fwnode, add_links)
+	    && fwnode_call_int_op(dev->fwnode, add_links, dev))
+		device_link_wait_for_supplier(dev);
+
 	bus_probe_device(dev);
 	if (parent)
 		klist_add_tail(&dev->p->knode_parent,
diff --git a/include/linux/device.h b/include/linux/device.h
index ec598ede9455..76458cfbb267 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1131,11 +1131,13 @@ enum dl_dev_state {
  * struct dev_links_info - Device data related to device links.
  * @suppliers: List of links to supplier devices.
  * @consumers: List of links to consumer devices.
+ * @needs_suppliers: Hook to global list of devices waiting for suppliers.
  * @status: Driver status information.
  */
 struct dev_links_info {
 	struct list_head suppliers;
 	struct list_head consumers;
+	struct list_head needs_suppliers;
 	enum dl_dev_state status;
 };
 
diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index a11c8c56c78b..068b0024adef 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -65,6 +65,21 @@ struct fwnode_reference_args {
  *			       endpoint node.
  * @graph_get_port_parent: Return the parent node of a port node.
  * @graph_parse_endpoint: Parse endpoint for port and endpoint id.
+ * @add_links:	Called after the device corresponding to the fwnode is added
+ *		using device_add(). The function is expected to create device
+ *		links to all the suppliers of the device that are available at
+ *		the time this function is called.  The function must NOT stop
+ *		at the first failed device link if other unlinked supplier
+ *		devices are present in the system.  If some suppliers are not
+ *		yet available, this function will be called again when other
+ *		devices are added to allow creating device links to any newly
+ *		available suppliers.
+ *
+ *		Return 0 if device links have been successfully created to all
+ *		the suppliers of this device or if the supplier information is
+ *		not known. Return an error if and only if the supplier
+ *		information is known but some of the suppliers are not yet
+ *		available to create device links to.
  */
 struct fwnode_operations {
 	struct fwnode_handle *(*get)(struct fwnode_handle *fwnode);
@@ -102,6 +117,8 @@ struct fwnode_operations {
 	(*graph_get_port_parent)(struct fwnode_handle *fwnode);
 	int (*graph_parse_endpoint)(const struct fwnode_handle *fwnode,
 				    struct fwnode_endpoint *endpoint);
+	int (*add_links)(const struct fwnode_handle *fwnode,
+			 struct device *dev);
 };
 
 #define fwnode_has_op(fwnode, op)				\
-- 
2.23.0.187.g17f5b7556c-goog

