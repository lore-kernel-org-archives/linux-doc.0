Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF20FA373F
	for <linux-doc@archiver.kernel.org>; Tue, 25 Oct 2022 09:16:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbiJYJQD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Oct 2022 05:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231441AbiJYJPd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Oct 2022 05:15:33 -0400
X-Greylist: delayed 131 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 25 Oct 2022 02:08:22 PDT
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [20.232.28.96])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 4C05917E232
        for <linux-doc@vger.kernel.org>; Tue, 25 Oct 2022 02:08:21 -0700 (PDT)
Received: from jleng.ambarella.net (unknown [180.169.129.130])
        by mail-app2 (Coremail) with SMTP id by_KCgBHTfXCpldjjGc1Bw--.34516S2;
        Tue, 25 Oct 2022 17:05:12 +0800 (CST)
From:   3090101217@zju.edu.cn
Cc:     balbi@kernel.org, bilbao@vt.edu, corbet@lwn.net,
        gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab+huawei@kernel.org,
        rdunlap@infradead.org, Jing Leng <jleng@ambarella.com>
Subject: [PATCH v4] usb: gadget: uvc: add bulk transfer support
Date:   Tue, 25 Oct 2022 17:05:01 +0800
Message-Id: <20221025090501.3290-1-3090101217@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220513004201.25563-1-3090101217@zju.edu.cn>
References: <20220513004201.25563-1-3090101217@zju.edu.cn>
X-CM-TRANSID: by_KCgBHTfXCpldjjGc1Bw--.34516S2
X-Coremail-Antispam: 1UD129KBjvAXoWfCFyrur1DtF1Utw4ktry7ZFb_yoW8KFWkuo
        WjqFs8u3WUZr1rXwn3Jr1vg34UZr4xCrn8tw45Gr45WF10v34aq343Ja1rWw4fuF43tFyD
        Cw1Iqrs8Xa4rJa45n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUOx7k0a2IF6w4kM7kC6x804xWl14x267AKxVW8JVW5JwAFc2x0
        x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj4
        1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0
        I7IYx2IY6xkF7I0E14v26rxl6s0DM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2vYz4IE04k24VAvwVAKI4IrM2vYz4IE4I80cI0F6IAv
        xc0EwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ew
        Av7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY
        6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7M4kE6xkIj40Ew7
        xC0wCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
        x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
        v26r1q6r43MI8E62xC7I0kMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4l
        IxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
        CI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnI
        WIevJa73UjIFyTuYvjxUBhIDDUUUU
X-CM-SenderInfo: qtqziiyqrsilo62m3hxhgxhubq/1tbiAwQRBVNG3IY6XAAFs-
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Jing Leng <jleng@ambarella.com>

The video data endpoint of uvc can be implemented as either an
isochronous or a bulk endpoint.

The transmission speed of bulk mode is faster than isochronous mode.
I tested the speed with cdns3 (USB 3.2 Gen1), it's difficult to reach
2 Gbps in the isochronous mode, and it can exceed 4 Gbps in the bulk
mode.

A VideoStreaming interface with isochronous endpoints must have alternate
settings that can be used to change certain characteristics of the
interface and underlying endpoint(s). A typical use of alternate settings
is to provide a way to change the bandwidth requirements an active
isochronous pipe imposes on the USB.

A VideoStreaming interface containing a bulk endpoint for streaming shall
support only alternate setting zero. Additional alternate settings
containing bulk endpoints are not permitted in a device that is compliant
with the Video Class specification.

Here shows an example of the configfs differences:
  if [ $BULK -eq 1 ]; then
      echo "bulk" > functions/$FUNC/streaming_transfer
      echo $(( 1024 * N )) > functions/$FUNC/streaming_maxpacket
  else
      echo "isoc" > functions/$FUNC/streaming_transfer
      echo 1024 > functions/$FUNC/streaming_maxpacket
  fi

Signed-off-by: Jing Leng <jleng@ambarella.com>
---
ChangeLog v3->v4:
- echo "bulk" > functions/$FUNC/streaming_transfer to set bulk mode
ChangeLog v2->v3:
- Mistakenly deleted the definition of i and USBDHDR when porting from my workdir.
- Reported-by: kernel test robot <lkp@intel.com>
ChangeLog v1->v2:
- Handle imagesize in uvc_v4l2_set_format. If it's not handled,
- switching from low resolution to high resolution will fail to play.
---
 .../ABI/testing/configfs-usb-gadget-uvc       |   8 +-
 Documentation/usb/gadget-testing.rst          |   1 +
 drivers/usb/gadget/function/f_uvc.c           | 228 +++++++++++++-----
 drivers/usb/gadget/function/u_uvc.h           |   1 +
 drivers/usb/gadget/function/uvc.h             |   2 +
 drivers/usb/gadget/function/uvc_configfs.c    |  64 ++++-
 drivers/usb/gadget/function/uvc_queue.c       |  14 +-
 drivers/usb/gadget/function/uvc_video.c       |  16 +-
 8 files changed, 261 insertions(+), 73 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Documentation/ABI/testing/configfs-usb-gadget-uvc
index 611b23e6488d..ffa2fd8c7fcd 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
@@ -3,12 +3,14 @@ Date:		Dec 2014
 KernelVersion:	4.0
 Description:	UVC function directory
 
-		===================	=============================
+		===================	===================================
 		streaming_maxburst	0..15 (ss only)
-		streaming_maxpacket	1..1023 (fs), 1..3072 (hs/ss)
+		streaming_maxpacket	isoc: 1..1023 (fs), 1..3072 (hs/ss)
+					bulk: 1024..0x40000000
 		streaming_interval	1..16
+		streaming_transfer	isoc/bulk
 		function_name		string [32]
-		===================	=============================
+		===================	===================================
 
 What:		/config/usb-gadget/gadget/functions/uvc.name/control
 Date:		Dec 2014
diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
index 2278c9ffb74a..880af56abe8b 100644
--- a/Documentation/usb/gadget-testing.rst
+++ b/Documentation/usb/gadget-testing.rst
@@ -793,6 +793,7 @@ The uvc function provides these attributes in its function directory:
 	streaming_maxpacket maximum packet size this endpoint is capable of
 			    sending or receiving when this configuration is
 			    selected
+	streaming_transfer  specify data transmission mode (isoc/bulk)
 	function_name       name of the interface
 	=================== ================================================
 
diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 6e196e06181e..8a4df750e00d 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -29,6 +29,8 @@
 #include "uvc_v4l2.h"
 #include "uvc_video.h"
 
+#define USBDHDR(p) ((struct usb_descriptor_header *)(p))
+
 unsigned int uvc_gadget_trace_param;
 module_param_named(trace, uvc_gadget_trace_param, uint, 0644);
 MODULE_PARM_DESC(trace, "Trace level bitmask");
@@ -181,19 +183,19 @@ static struct usb_ss_ep_comp_descriptor uvc_ss_streaming_comp = {
 	 */
 };
 
-static const struct usb_descriptor_header * const uvc_fs_streaming[] = {
+static const struct usb_descriptor_header *uvc_fs_streaming[] = {
 	(struct usb_descriptor_header *) &uvc_streaming_intf_alt1,
 	(struct usb_descriptor_header *) &uvc_fs_streaming_ep,
 	NULL,
 };
 
-static const struct usb_descriptor_header * const uvc_hs_streaming[] = {
+static const struct usb_descriptor_header *uvc_hs_streaming[] = {
 	(struct usb_descriptor_header *) &uvc_streaming_intf_alt1,
 	(struct usb_descriptor_header *) &uvc_hs_streaming_ep,
 	NULL,
 };
 
-static const struct usb_descriptor_header * const uvc_ss_streaming[] = {
+static const struct usb_descriptor_header *uvc_ss_streaming[] = {
 	(struct usb_descriptor_header *) &uvc_streaming_intf_alt1,
 	(struct usb_descriptor_header *) &uvc_ss_streaming_ep,
 	(struct usb_descriptor_header *) &uvc_ss_streaming_comp,
@@ -204,6 +206,10 @@ static const struct usb_descriptor_header * const uvc_ss_streaming[] = {
  * Control requests
  */
 
+
+static int uvc_function_set_alt(struct usb_function *f,
+		unsigned int interface, unsigned int alt);
+
 static void
 uvc_function_ep0_complete(struct usb_ep *ep, struct usb_request *req)
 {
@@ -219,6 +225,13 @@ uvc_function_ep0_complete(struct usb_ep *ep, struct usb_request *req)
 		uvc_event->data.length = req->actual;
 		memcpy(&uvc_event->data.data, req->buf, req->actual);
 		v4l2_event_queue(&uvc->vdev, &v4l2_event);
+
+		/*
+		 * Bulk mode only has one alt, so we should set STREAM ON after
+		 * responding the SET UVC_VS_COMMIT_CONTROL request.
+		 */
+		if (uvc->state == UVC_STATE_BULK_SETTING)
+			uvc_function_set_alt(&uvc->func, uvc->streaming_intf, 1);
 	}
 }
 
@@ -228,6 +241,9 @@ uvc_function_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
 	struct uvc_device *uvc = to_uvc(f);
 	struct v4l2_event v4l2_event;
 	struct uvc_event *uvc_event = (void *)&v4l2_event.u.data;
+	struct f_uvc_opts *opts = fi_to_f_uvc_opts(f->fi);
+	unsigned int interface = le16_to_cpu(ctrl->wIndex) & 0xff;
+	unsigned int cs = le16_to_cpu(ctrl->wValue) >> 8 & 0xff;
 
 	if ((ctrl->bRequestType & USB_TYPE_MASK) != USB_TYPE_CLASS) {
 		uvcg_info(f, "invalid request type\n");
@@ -245,6 +261,21 @@ uvc_function_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
 	uvc->event_setup_out = !(ctrl->bRequestType & USB_DIR_IN);
 	uvc->event_length = le16_to_cpu(ctrl->wLength);
 
+	/*
+	 * Bulk mode only has one alt, when the SET UVC_VS_COMMIT_CONTROL request
+	 * is received, if the streaming is in transit, we need to set STREAM OFF,
+	 * if the uvc state is UVC_STATE_BULK_WAITING, we only need to change it.
+	 */
+	if (opts->streaming_transfer == USB_ENDPOINT_XFER_BULK &&
+		uvc->event_setup_out &&
+		uvc->streaming_intf == interface &&
+		cs == UVC_VS_COMMIT_CONTROL) {
+		if (uvc->state == UVC_STATE_STREAMING)
+			uvc_function_set_alt(&uvc->func, uvc->streaming_intf, 0);
+		else if (uvc->state == UVC_STATE_BULK_WAITING)
+			uvc->state = UVC_STATE_BULK_SETTING;
+	}
+
 	memset(&v4l2_event, 0, sizeof(v4l2_event));
 	v4l2_event.type = UVC_EVENT_SETUP;
 	memcpy(&uvc_event->req, ctrl, sizeof(uvc_event->req));
@@ -255,9 +286,12 @@ uvc_function_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
 
 void uvc_function_setup_continue(struct uvc_device *uvc)
 {
+	struct f_uvc_opts *opts = fi_to_f_uvc_opts(uvc->func.fi);
 	struct usb_composite_dev *cdev = uvc->func.config->cdev;
 
-	usb_composite_setup_continue(cdev);
+	/* delayed_status in bulk mode is 0, so it doesn't need to continue. */
+	if (opts->streaming_transfer != USB_ENDPOINT_XFER_BULK)
+		usb_composite_setup_continue(cdev);
 }
 
 static int
@@ -282,6 +316,7 @@ uvc_function_set_alt(struct usb_function *f, unsigned interface, unsigned alt)
 	struct usb_composite_dev *cdev = f->config->cdev;
 	struct v4l2_event v4l2_event;
 	struct uvc_event *uvc_event = (void *)&v4l2_event.u.data;
+	struct f_uvc_opts *opts = fi_to_f_uvc_opts(f->fi);
 	int ret;
 
 	uvcg_info(f, "%s(%u, %u)\n", __func__, interface, alt);
@@ -314,15 +349,19 @@ uvc_function_set_alt(struct usb_function *f, unsigned interface, unsigned alt)
 	if (interface != uvc->streaming_intf)
 		return -EINVAL;
 
-	/* TODO
-	if (usb_endpoint_xfer_bulk(&uvc->desc.vs_ep))
-		return alt ? -EINVAL : 0;
-	*/
-
 	switch (alt) {
 	case 0:
-		if (uvc->state != UVC_STATE_STREAMING)
-			return 0;
+		if (opts->streaming_transfer == USB_ENDPOINT_XFER_BULK) {
+			if (uvc->state == UVC_STATE_CONNECTED)
+				uvc->state = UVC_STATE_BULK_WAITING;
+			else if (uvc->state == UVC_STATE_STREAMING)
+				uvc->state = UVC_STATE_BULK_SETTING;
+			else
+				return 0;
+		} else {
+			if (uvc->state != UVC_STATE_STREAMING)
+				return 0;
+		}
 
 		if (uvc->video.ep)
 			usb_ep_disable(uvc->video.ep);
@@ -331,12 +370,19 @@ uvc_function_set_alt(struct usb_function *f, unsigned interface, unsigned alt)
 		v4l2_event.type = UVC_EVENT_STREAMOFF;
 		v4l2_event_queue(&uvc->vdev, &v4l2_event);
 
-		uvc->state = UVC_STATE_CONNECTED;
+		if (opts->streaming_transfer != USB_ENDPOINT_XFER_BULK)
+			uvc->state = UVC_STATE_CONNECTED;
+
 		return 0;
 
 	case 1:
-		if (uvc->state != UVC_STATE_CONNECTED)
-			return 0;
+		if (opts->streaming_transfer == USB_ENDPOINT_XFER_BULK) {
+			if (uvc->state != UVC_STATE_BULK_SETTING)
+				return 0;
+		} else {
+			if (uvc->state != UVC_STATE_CONNECTED)
+				return 0;
+		}
 
 		if (!uvc->video.ep)
 			return -EINVAL;
@@ -598,62 +644,101 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 	unsigned int max_packet_size;
 	struct usb_ep *ep;
 	struct f_uvc_opts *opts;
+	int i = 0;
 	int ret = -EINVAL;
 
 	uvcg_info(f, "%s()\n", __func__);
 
 	opts = fi_to_f_uvc_opts(f->fi);
-	/* Sanity check the streaming endpoint module parameters. */
-	opts->streaming_interval = clamp(opts->streaming_interval, 1U, 16U);
-	opts->streaming_maxpacket = clamp(opts->streaming_maxpacket, 1U, 3072U);
-	opts->streaming_maxburst = min(opts->streaming_maxburst, 15U);
-
-	/* For SS, wMaxPacketSize has to be 1024 if bMaxBurst is not 0 */
-	if (opts->streaming_maxburst &&
-	    (opts->streaming_maxpacket % 1024) != 0) {
-		opts->streaming_maxpacket = roundup(opts->streaming_maxpacket, 1024);
-		uvcg_info(f, "overriding streaming_maxpacket to %d\n",
-			  opts->streaming_maxpacket);
-	}
 
-	/*
-	 * Fill in the FS/HS/SS Video Streaming specific descriptors from the
-	 * module parameters.
-	 *
-	 * NOTE: We assume that the user knows what they are doing and won't
-	 * give parameters that their UDC doesn't support.
-	 */
-	if (opts->streaming_maxpacket <= 1024) {
-		max_packet_mult = 1;
-		max_packet_size = opts->streaming_maxpacket;
-	} else if (opts->streaming_maxpacket <= 2048) {
-		max_packet_mult = 2;
-		max_packet_size = opts->streaming_maxpacket / 2;
+	/* Handle different transfer mode for stream endpoints */
+	if (opts->streaming_transfer == USB_ENDPOINT_XFER_BULK) {
+		uvc_fs_streaming_ep.bmAttributes = opts->streaming_transfer;
+		uvc_hs_streaming_ep.bmAttributes = uvc_fs_streaming_ep.bmAttributes;
+		uvc_ss_streaming_ep.bmAttributes = uvc_fs_streaming_ep.bmAttributes;
+
+		opts->streaming_maxburst = min(opts->streaming_maxburst, 15U);
+
+		if (opts->streaming_maxpacket % 1024 != 0) {
+			opts->streaming_maxpacket = roundup(opts->streaming_maxpacket, 1024);
+			uvcg_info(f, "overriding streaming_maxpacket to %d\n",
+				opts->streaming_maxpacket);
+		}
+
+		uvc_fs_streaming_ep.wMaxPacketSize = cpu_to_le16(64);
+		uvc_fs_streaming_ep.bInterval = 0;
+
+		uvc_hs_streaming_ep.wMaxPacketSize = cpu_to_le16(512);
+		uvc_hs_streaming_ep.bInterval = 0;
+
+		uvc_ss_streaming_ep.wMaxPacketSize = cpu_to_le16(1024);
+		uvc_ss_streaming_ep.bInterval = 0;
+
+		uvc_ss_streaming_comp.bmAttributes = 0;
+		uvc_ss_streaming_comp.bMaxBurst = opts->streaming_maxburst;
+		uvc_ss_streaming_comp.wBytesPerInterval = 0;
+
+		uvc->video.max_payload_size = opts->streaming_maxpacket;
 	} else {
-		max_packet_mult = 3;
-		max_packet_size = opts->streaming_maxpacket / 3;
-	}
+		uvc_fs_streaming_ep.bmAttributes = opts->streaming_transfer;
+		uvc_hs_streaming_ep.bmAttributes = uvc_fs_streaming_ep.bmAttributes;
+		uvc_ss_streaming_ep.bmAttributes = uvc_fs_streaming_ep.bmAttributes;
+
+		/* Sanity check the streaming endpoint module parameters. */
+		opts->streaming_interval = clamp(opts->streaming_interval, 1U, 16U);
+		opts->streaming_maxpacket = clamp(opts->streaming_maxpacket, 1U, 3072U);
+		opts->streaming_maxburst = min(opts->streaming_maxburst, 15U);
+
+		/* For SS, wMaxPacketSize has to be 1024 if bMaxBurst is not 0 */
+		if (opts->streaming_maxburst &&
+			(opts->streaming_maxpacket % 1024) != 0) {
+			opts->streaming_maxpacket = roundup(opts->streaming_maxpacket, 1024);
+			uvcg_info(f, "overriding streaming_maxpacket to %d\n",
+				opts->streaming_maxpacket);
+		}
 
-	uvc_fs_streaming_ep.wMaxPacketSize =
-		cpu_to_le16(min(opts->streaming_maxpacket, 1023U));
-	uvc_fs_streaming_ep.bInterval = opts->streaming_interval;
+		/*
+		 * Fill in the FS/HS/SS Video Streaming specific descriptors from the
+		 * module parameters.
+		 *
+		 * NOTE: We assume that the user knows what they are doing and won't
+		 * give parameters that their UDC doesn't support.
+		 */
+		if (opts->streaming_maxpacket <= 1024) {
+			max_packet_mult = 0;
+			max_packet_size = opts->streaming_maxpacket;
+		} else if (opts->streaming_maxpacket <= 2048) {
+			max_packet_mult = 1;
+			max_packet_size = opts->streaming_maxpacket / 2;
+		} else {
+			max_packet_mult = 2;
+			max_packet_size = opts->streaming_maxpacket / 3;
+		}
 
-	uvc_hs_streaming_ep.wMaxPacketSize =
-		cpu_to_le16(max_packet_size | ((max_packet_mult - 1) << 11));
+		uvc_fs_streaming_ep.wMaxPacketSize =
+			cpu_to_le16(min(opts->streaming_maxpacket, 1023U));
+		uvc_fs_streaming_ep.bInterval = opts->streaming_interval;
 
-	/* A high-bandwidth endpoint must specify a bInterval value of 1 */
-	if (max_packet_mult > 1)
-		uvc_hs_streaming_ep.bInterval = 1;
-	else
-		uvc_hs_streaming_ep.bInterval = opts->streaming_interval;
+		uvc_hs_streaming_ep.wMaxPacketSize =
+			cpu_to_le16(max_packet_size | (max_packet_mult << 11));
+
+		/* A high-bandwidth endpoint must specify a bInterval value of 1 */
+		if (max_packet_mult > 0)
+			uvc_hs_streaming_ep.bInterval = 1;
+		else
+			uvc_hs_streaming_ep.bInterval = opts->streaming_interval;
+
+		uvc_ss_streaming_ep.wMaxPacketSize = cpu_to_le16(max_packet_size);
+		uvc_ss_streaming_ep.bInterval = opts->streaming_interval;
+
+		uvc_ss_streaming_comp.bmAttributes = max_packet_mult;
+		uvc_ss_streaming_comp.bMaxBurst = opts->streaming_maxburst;
+		uvc_ss_streaming_comp.wBytesPerInterval =
+			cpu_to_le16(max_packet_size * (max_packet_mult + 1) *
+				(opts->streaming_maxburst + 1));
 
-	uvc_ss_streaming_ep.wMaxPacketSize = cpu_to_le16(max_packet_size);
-	uvc_ss_streaming_ep.bInterval = opts->streaming_interval;
-	uvc_ss_streaming_comp.bmAttributes = max_packet_mult - 1;
-	uvc_ss_streaming_comp.bMaxBurst = opts->streaming_maxburst;
-	uvc_ss_streaming_comp.wBytesPerInterval =
-		cpu_to_le16(max_packet_size * max_packet_mult *
-			    (opts->streaming_maxburst + 1));
+		uvc->video.max_payload_size = 0;
+	}
 
 	/* Allocate endpoints. */
 	ep = usb_ep_autoconfig(cdev->gadget, &uvc_control_ep);
@@ -667,7 +752,7 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 		ep = usb_ep_autoconfig_ss(cdev->gadget, &uvc_ss_streaming_ep,
 					  &uvc_ss_streaming_comp);
 	else if (gadget_is_dualspeed(cdev->gadget))
-		ep = usb_ep_autoconfig(cdev->gadget, &uvc_hs_streaming_ep);
+		ep = usb_ep_autoconfig_ss(cdev->gadget, &uvc_hs_streaming_ep, NULL);
 	else
 		ep = usb_ep_autoconfig(cdev->gadget, &uvc_fs_streaming_ep);
 
@@ -709,6 +794,28 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 	uvc->streaming_intf = ret;
 	opts->streaming_interface = ret;
 
+	/* Handle different transfer mode for descriptors */
+	i = 0;
+	if (opts->streaming_transfer == USB_ENDPOINT_XFER_BULK) {
+		uvc_streaming_intf_alt0.bNumEndpoints = 1;
+	} else {
+		uvc_streaming_intf_alt0.bNumEndpoints = 0;
+
+		uvc_fs_streaming[i] = USBDHDR(&uvc_streaming_intf_alt1);
+		uvc_hs_streaming[i] = USBDHDR(&uvc_streaming_intf_alt1);
+		uvc_ss_streaming[i] = USBDHDR(&uvc_streaming_intf_alt1);
+		++i;
+	}
+	uvc_fs_streaming[i] = USBDHDR(&uvc_fs_streaming_ep);
+	uvc_hs_streaming[i] = USBDHDR(&uvc_hs_streaming_ep);
+	uvc_ss_streaming[i] = USBDHDR(&uvc_ss_streaming_ep);
+	++i;
+	uvc_fs_streaming[i] = NULL;
+	uvc_hs_streaming[i] = NULL;
+	uvc_ss_streaming[i] = USBDHDR(&uvc_ss_streaming_comp);
+	++i;
+	uvc_ss_streaming[i] = NULL;
+
 	/* Copy descriptors */
 	f->fs_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_FULL);
 	if (IS_ERR(f->fs_descriptors)) {
@@ -872,6 +979,7 @@ static struct usb_function_instance *uvc_alloc_inst(void)
 
 	opts->streaming_interval = 1;
 	opts->streaming_maxpacket = 1024;
+	opts->streaming_transfer = USB_ENDPOINT_SYNC_ASYNC | USB_ENDPOINT_XFER_ISOC;
 	snprintf(opts->function_name, sizeof(opts->function_name), "UVC Camera");
 
 	ret = uvcg_attach_configfs(opts);
diff --git a/drivers/usb/gadget/function/u_uvc.h b/drivers/usb/gadget/function/u_uvc.h
index 24b8681b0d6f..88cd235e0ea8 100644
--- a/drivers/usb/gadget/function/u_uvc.h
+++ b/drivers/usb/gadget/function/u_uvc.h
@@ -24,6 +24,7 @@ struct f_uvc_opts {
 	unsigned int					streaming_interval;
 	unsigned int					streaming_maxpacket;
 	unsigned int					streaming_maxburst;
+	unsigned int					streaming_transfer;
 
 	unsigned int					control_interface;
 	unsigned int					streaming_interface;
diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 40226b1f7e14..b00cba322643 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -123,6 +123,8 @@ enum uvc_state {
 	UVC_STATE_DISCONNECTED,
 	UVC_STATE_CONNECTED,
 	UVC_STATE_STREAMING,
+	UVC_STATE_BULK_WAITING,
+	UVC_STATE_BULK_SETTING,
 };
 
 struct uvc_device {
diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 4303a3283ba0..ef7c4f6630d4 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -2348,11 +2348,72 @@ end:									\
 UVC_ATTR(f_uvc_opts_, cname, cname)
 
 UVCG_OPTS_ATTR(streaming_interval, streaming_interval, 16);
-UVCG_OPTS_ATTR(streaming_maxpacket, streaming_maxpacket, 3072);
+UVCG_OPTS_ATTR(streaming_maxpacket, streaming_maxpacket, 0x40000000U);
 UVCG_OPTS_ATTR(streaming_maxburst, streaming_maxburst, 15);
 
 #undef UVCG_OPTS_ATTR
 
+#define UVCG_OPTS_ATTR_TRANSFER(cname, aname)				\
+static ssize_t f_uvc_opts_##cname##_show(				\
+	struct config_item *item, char *page)				\
+{									\
+	struct f_uvc_opts *opts = to_f_uvc_opts(item);			\
+	int result;							\
+	char *str;							\
+									\
+	mutex_lock(&opts->lock);					\
+	switch (opts->cname) {						\
+	case USB_ENDPOINT_XFER_BULK:					\
+		str = "bulk";						\
+		break;							\
+	case USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC:		\
+		str = "isoc";						\
+		break;							\
+	default:							\
+		str = "unknown";					\
+		break;							\
+	}								\
+	result = sprintf(page, "%s\n", str);				\
+	mutex_unlock(&opts->lock);					\
+									\
+	return result;							\
+}									\
+									\
+static ssize_t								\
+f_uvc_opts_##cname##_store(struct config_item *item,			\
+			   const char *page, size_t len)		\
+{									\
+	struct f_uvc_opts *opts = to_f_uvc_opts(item);			\
+	int ret = 0;							\
+									\
+	mutex_lock(&opts->lock);					\
+	if (opts->refcnt) {						\
+		ret = -EBUSY;						\
+		goto end;						\
+	}								\
+									\
+	if (!strncmp(page, "bulk", 4))					\
+		opts->cname = USB_ENDPOINT_XFER_BULK;			\
+	else if (!strncmp(page, "isoc", 4))				\
+		opts->cname = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC; \
+	else {								\
+		ret = -EINVAL;						\
+		goto end;						\
+	}								\
+									\
+	ret = len;							\
+									\
+end:									\
+	mutex_unlock(&opts->lock);					\
+	return ret;							\
+}									\
+									\
+UVC_ATTR(f_uvc_opts_, cname, cname)
+
+UVCG_OPTS_ATTR_TRANSFER(streaming_transfer, streaming_transfer);
+
+#undef UVCG_OPTS_ATTR_TRANSFER
+
 #define UVCG_OPTS_STRING_ATTR(cname, aname)				\
 static ssize_t f_uvc_opts_string_##cname##_show(struct config_item *item,\
 					 char *page)			\
@@ -2399,6 +2460,7 @@ static struct configfs_attribute *uvc_attrs[] = {
 	&f_uvc_opts_attr_streaming_interval,
 	&f_uvc_opts_attr_streaming_maxpacket,
 	&f_uvc_opts_attr_streaming_maxburst,
+	&f_uvc_opts_attr_streaming_transfer,
 	&f_uvc_opts_string_attr_function_name,
 	NULL,
 };
diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
index ec500ee499ee..33213e3f6635 100644
--- a/drivers/usb/gadget/function/uvc_queue.c
+++ b/drivers/usb/gadget/function/uvc_queue.c
@@ -54,9 +54,13 @@ static int uvc_queue_setup(struct vb2_queue *vq,
 
 	sizes[0] = video->imagesize;
 
-	req_size = video->ep->maxpacket
-		 * max_t(unsigned int, video->ep->maxburst, 1)
-		 * (video->ep->mult);
+	/* Bulk mode uses max_payload_size as req_size */
+	if (video->max_payload_size)
+		req_size = video->max_payload_size;
+	else
+		req_size = video->ep->maxpacket
+			 * max_t(unsigned int, video->ep->maxburst, 1)
+			 * (video->ep->mult);
 
 	/* We divide by two, to increase the chance to run
 	 * into fewer requests for smaller framesizes.
@@ -143,7 +147,9 @@ int uvcg_queue_init(struct uvc_video_queue *queue, struct device *dev, enum v4l2
 	queue->queue.buf_struct_size = sizeof(struct uvc_buffer);
 	queue->queue.ops = &uvc_queue_qops;
 	queue->queue.lock = lock;
-	if (cdev->gadget->sg_supported) {
+
+	/* UDC supports scatter gather and transfer mode isn't bulk. */
+	if (cdev->gadget->sg_supported && !video->max_payload_size) {
 		queue->queue.mem_ops = &vb2_dma_sg_memops;
 		queue->use_sg = 1;
 	} else {
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index bb037fcc90e6..76806ff32d61 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -261,8 +261,10 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
 		break;
 
 	default:
-		uvcg_warn(&video->uvc->func,
-			  "VS request completed with status %d.\n",
+		if (uvc->state == UVC_STATE_BULK_WAITING ||
+			uvc->state == UVC_STATE_BULK_SETTING)
+			break;
+		uvcg_warn(&uvc->func, "VS request completed with status %d.\n",
 			  req->status);
 		uvcg_queue_cancel(queue, 0);
 	}
@@ -318,9 +320,13 @@ uvc_video_alloc_requests(struct uvc_video *video)
 
 	BUG_ON(video->req_size);
 
-	req_size = video->ep->maxpacket
-		 * max_t(unsigned int, video->ep->maxburst, 1)
-		 * (video->ep->mult);
+	/* Bulk mode uses max_payload_size as req_size */
+	if (video->max_payload_size)
+		req_size = video->max_payload_size;
+	else
+		req_size = video->ep->maxpacket
+			 * max_t(unsigned int, video->ep->maxburst, 1)
+			 * (video->ep->mult);
 
 	video->ureq = kcalloc(video->uvc_num_requests, sizeof(struct uvc_request), GFP_KERNEL);
 	if (video->ureq == NULL)
-- 
2.17.1

