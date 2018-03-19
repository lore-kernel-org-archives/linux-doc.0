Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7A1627DE77
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Mar 2018 16:34:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933296AbeCSQ0k (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Mar 2018 12:26:40 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:35389 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935331AbeCSQ0Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Mar 2018 12:26:16 -0400
Received: from 114-32-108-117.hinet-ip.hinet.net ([114.32.108.117] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1exxbv-0007t6-OH; Mon, 19 Mar 2018 16:26:12 +0000
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
To:     gregkh@linuxfoundation.org
Cc:     oneukum@suse.com, willy@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: [PATCH v7] usb: core: Add "quirks" parameter for usbcore
Date:   Tue, 20 Mar 2018 00:26:06 +0800
Message-Id: <20180319162606.13300-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.15.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Trying quirks in usbcore needs to rebuild the driver or the entire
kernel if it's builtin. It can save a lot of time if usbcore has similar
ability like "usbhid.quirks=" and "usb-storage.quirks=".

Rename the original quirk detection function to "static" as we introduce
this new "dynamic" function.

Now users can use "usbcore.quirks=" as short term workaround before the
next kernel release. Also, the quirk parameter can XOR the builtin
quirks for debugging purpose.

This is inspired by usbhid and usb-storage.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v7: Update documentation to specify the quirks parameter can XOR the
    built-in quirks.

v6: Add missed header file <linux/moduleparam.h>.

v5: Use module_param_cb() to get notified when parameter changes.
    Replace linked list with array.

v4: Use kmalloc() to reduce memory usage.
    Remove tolower() so we can use capital character in the future.

v3: Stop overridding static quirks.
    Use XOR for dynamic quirks.
    Save parsed quirk as a list to avoid parsing quirk table everytime.

v2: Use in-kernel tolower() function.

 Documentation/admin-guide/kernel-parameters.txt |  56 ++++++++
 drivers/usb/core/quirks.c                       | 178 +++++++++++++++++++++++-
 drivers/usb/core/usb.c                          |   1 +
 drivers/usb/core/usb.h                          |   1 +
 4 files changed, 231 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 1d1d53f85ddd..e00cdd313dc2 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4368,6 +4368,62 @@
 
 	usbcore.nousb	[USB] Disable the USB subsystem
 
+	usbcore.quirks=
+			[USB] A list of quirk entries to augment the built-in
+			usb core quirk list. List entries are separated by
+			commas. Each entry has the form
+			VendorID:ProductID:Flags. The IDs are 4-digit hex
+			numbers and Flags is a set of letters. Each letter
+			will change the built-in quirk; setting it if it is
+			clear and clearing it if it is set. The letters have
+			the following meanings:
+				a = USB_QUIRK_STRING_FETCH_255 (string
+					descriptors must not be fetched using
+					a 255-byte read);
+				b = USB_QUIRK_RESET_RESUME (device can't resume
+					correctly so reset it instead);
+				c = USB_QUIRK_NO_SET_INTF (device can't handle
+					Set-Interface requests);
+				d = USB_QUIRK_CONFIG_INTF_STRINGS (device can't
+					handle its Configuration or Interface
+					strings);
+				e = USB_QUIRK_RESET (device can't be reset
+					(e.g morph devices), don't use reset);
+				f = USB_QUIRK_HONOR_BNUMINTERFACES (device has
+					more interface descriptions than the
+					bNumInterfaces count, and can't handle
+					talking to these interfaces);
+				g = USB_QUIRK_DELAY_INIT (device needs a pause
+					during initialization, after we read
+					the device descriptor);
+				h = USB_QUIRK_LINEAR_UFRAME_INTR_BINTERVAL (For
+					high speed and super speed interrupt
+					endpoints, the USB 2.0 and USB 3.0 spec
+					require the interval in microframes (1
+					microframe = 125 microseconds) to be
+					calculated as interval = 2 ^
+					(bInterval-1).
+					Devices with this quirk report their
+					bInterval as the result of this
+					calculation instead of the exponent
+					variable used in the calculation);
+				i = USB_QUIRK_DEVICE_QUALIFIER (device can't
+					handle device_qualifier descriptor
+					requests);
+				j = USB_QUIRK_IGNORE_REMOTE_WAKEUP (device
+					generates spurious wakeup, ignore
+					remote wakeup capability);
+				k = USB_QUIRK_NO_LPM (device can't handle Link
+					Power Management);
+				l = USB_QUIRK_LINEAR_FRAME_INTR_BINTERVAL
+					(Device reports its bInterval as linear
+					frames instead of the USB 2.0
+					calculation);
+				m = USB_QUIRK_DISCONNECT_SUSPEND (Device needs
+					to be disconnected before suspend to
+					prevent spurious wakeup)
+			Example: quirks=0781:5580:bk,0a5c:5834:gij
+
 	usbhid.mousepoll=
 			[USBHID] The interval which mice are to be polled at.
 
diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 54b019e267c5..6fb8d5433268 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -6,11 +6,149 @@
  * Copyright (c) 2007 Greg Kroah-Hartman <gregkh@suse.de>
  */
 
+#include <linux/moduleparam.h>
 #include <linux/usb.h>
 #include <linux/usb/quirks.h>
 #include <linux/usb/hcd.h>
 #include "usb.h"
 
+struct quirk_entry {
+	u16 vid;
+	u16 pid;
+	u32 flags;
+};
+
+static DEFINE_MUTEX(quirk_mutex);
+
+static struct quirk_entry *quirk_list;
+static unsigned int quirk_count;
+
+static char quirks_param[128];
+
+static int quirks_param_set(const char *val, const struct kernel_param *kp)
+{
+	char *p, *field;
+	u16 vid, pid;
+	u32 flags;
+	size_t i;
+
+	mutex_lock(&quirk_mutex);
+
+	if (!val || !*val) {
+		quirk_count = 0;
+		kfree(quirk_list);
+		quirk_list = NULL;
+		goto unlock;
+	}
+
+	for (quirk_count = 1, i = 0; val[i]; i++)
+		if (val[i] == ',')
+			quirk_count++;
+
+	if (quirk_list) {
+		kfree(quirk_list);
+		quirk_list = NULL;
+	}
+
+	quirk_list = kcalloc(quirk_count, sizeof(struct quirk_entry),
+			     GFP_KERNEL);
+	if (!quirk_list) {
+		mutex_unlock(&quirk_mutex);
+		return -ENOMEM;
+	}
+
+	for (i = 0, p = (char *)val; p && *p;) {
+		/* Each entry consists of VID:PID:flags */
+		field = strsep(&p, ":");
+		if (!field)
+			break;
+
+		if (kstrtou16(field, 16, &vid))
+			break;
+
+		field = strsep(&p, ":");
+		if (!field)
+			break;
+
+		if (kstrtou16(field, 16, &pid))
+			break;
+
+		field = strsep(&p, ",");
+		if (!field || !*field)
+			break;
+
+		/* Collect the flags */
+		for (flags = 0; *field; field++) {
+			switch (*field) {
+			case 'a':
+				flags |= USB_QUIRK_STRING_FETCH_255;
+				break;
+			case 'b':
+				flags |= USB_QUIRK_RESET_RESUME;
+				break;
+			case 'c':
+				flags |= USB_QUIRK_NO_SET_INTF;
+				break;
+			case 'd':
+				flags |= USB_QUIRK_CONFIG_INTF_STRINGS;
+				break;
+			case 'e':
+				flags |= USB_QUIRK_RESET;
+				break;
+			case 'f':
+				flags |= USB_QUIRK_HONOR_BNUMINTERFACES;
+				break;
+			case 'g':
+				flags |= USB_QUIRK_DELAY_INIT;
+				break;
+			case 'h':
+				flags |= USB_QUIRK_LINEAR_UFRAME_INTR_BINTERVAL;
+				break;
+			case 'i':
+				flags |= USB_QUIRK_DEVICE_QUALIFIER;
+				break;
+			case 'j':
+				flags |= USB_QUIRK_IGNORE_REMOTE_WAKEUP;
+				break;
+			case 'k':
+				flags |= USB_QUIRK_NO_LPM;
+				break;
+			case 'l':
+				flags |= USB_QUIRK_LINEAR_FRAME_INTR_BINTERVAL;
+				break;
+			case 'm':
+				flags |= USB_QUIRK_DISCONNECT_SUSPEND;
+				break;
+			/* Ignore unrecognized flag characters */
+			}
+		}
+
+		quirk_list[i++] = (struct quirk_entry)
+			{ .vid = vid, .pid = pid, .flags = flags };
+	}
+
+	if (i < quirk_count)
+		quirk_count = i;
+
+unlock:
+	mutex_unlock(&quirk_mutex);
+
+	return param_set_copystring(val, kp);
+}
+
+static const struct kernel_param_ops quirks_param_ops = {
+	.set = quirks_param_set,
+	.get = param_get_string,
+};
+
+static struct kparam_string quirks_param_string = {
+	.maxlen = sizeof(quirks_param),
+	.string = quirks_param,
+};
+
+module_param_cb(quirks, &quirks_param_ops, &quirks_param_string, 0644);
+MODULE_PARM_DESC(quirks, "Add/modify USB quirks by specifying quirks=vendorID:productID:quirks");
+
 /* Lists of quirky USB devices, split in device quirks and interface quirks.
  * Device quirks are applied at the very beginning of the enumeration process,
  * right after reading the device descriptor. They can thus only match on device
@@ -321,8 +459,8 @@ static int usb_amd_resume_quirk(struct usb_device *udev)
 	return 0;
 }
 
-static u32 __usb_detect_quirks(struct usb_device *udev,
-			       const struct usb_device_id *id)
+static u32 usb_detect_static_quirks(struct usb_device *udev,
+				    const struct usb_device_id *id)
 {
 	u32 quirks = 0;
 
@@ -340,21 +478,43 @@ static u32 __usb_detect_quirks(struct usb_device *udev,
 	return quirks;
 }
 
+static u32 usb_detect_dynamic_quirks(struct usb_device *udev)
+{
+	u16 vid = le16_to_cpu(udev->descriptor.idVendor);
+	u16 pid = le16_to_cpu(udev->descriptor.idProduct);
+	int i, flags = 0;
+
+	mutex_lock(&quirk_mutex);
+
+	for (i = 0; i < quirk_count; i++) {
+		if (vid == quirk_list[i].vid && pid == quirk_list[i].pid) {
+			flags = quirk_list[i].flags;
+			break;
+		}
+	}
+
+	mutex_unlock(&quirk_mutex);
+
+	return flags;
+}
+
 /*
  * Detect any quirks the device has, and do any housekeeping for it if needed.
  */
 void usb_detect_quirks(struct usb_device *udev)
 {
-	udev->quirks = __usb_detect_quirks(udev, usb_quirk_list);
+	udev->quirks = usb_detect_static_quirks(udev, usb_quirk_list);
 
 	/*
 	 * Pixart-based mice would trigger remote wakeup issue on AMD
 	 * Yangtze chipset, so set them as RESET_RESUME flag.
 	 */
 	if (usb_amd_resume_quirk(udev))
-		udev->quirks |= __usb_detect_quirks(udev,
+		udev->quirks |= usb_detect_static_quirks(udev,
 				usb_amd_resume_quirk_list);
 
+	udev->quirks ^= usb_detect_dynamic_quirks(udev);
+
 	if (udev->quirks)
 		dev_dbg(&udev->dev, "USB quirks for this device: %x\n",
 			udev->quirks);
@@ -373,7 +533,7 @@ void usb_detect_interface_quirks(struct usb_device *udev)
 {
 	u32 quirks;
 
-	quirks = __usb_detect_quirks(udev, usb_interface_quirk_list);
+	quirks = usb_detect_static_quirks(udev, usb_interface_quirk_list);
 	if (quirks == 0)
 		return;
 
@@ -381,3 +541,11 @@ void usb_detect_interface_quirks(struct usb_device *udev)
 		quirks);
 	udev->quirks |= quirks;
 }
+
+void usb_release_quirk_list(void)
+{
+	mutex_lock(&quirk_mutex);
+	kfree(quirk_list);
+	quirk_list = NULL;
+	mutex_unlock(&quirk_mutex);
+}
diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index 2f5fbc56a9dd..0adb6345ff2e 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -1259,6 +1259,7 @@ static void __exit usb_exit(void)
 	if (usb_disabled())
 		return;
 
+	usb_release_quirk_list();
 	usb_deregister_device_driver(&usb_generic_driver);
 	usb_major_cleanup();
 	usb_deregister(&usbfs_driver);
diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
index 149cc7480971..546a2219454b 100644
--- a/drivers/usb/core/usb.h
+++ b/drivers/usb/core/usb.h
@@ -36,6 +36,7 @@ extern void usb_deauthorize_interface(struct usb_interface *);
 extern void usb_authorize_interface(struct usb_interface *);
 extern void usb_detect_quirks(struct usb_device *udev);
 extern void usb_detect_interface_quirks(struct usb_device *udev);
+extern void usb_release_quirk_list(void);
 extern int usb_remove_device(struct usb_device *udev);
 
 extern int usb_get_device_descriptor(struct usb_device *dev,
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
