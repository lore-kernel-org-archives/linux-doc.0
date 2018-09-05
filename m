Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 488DA7D923
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Sep 2018 00:02:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbeIEEaE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Sep 2018 00:30:04 -0400
Received: from mail-io0-f195.google.com ([209.85.223.195]:43167 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbeIEEaE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Sep 2018 00:30:04 -0400
Received: by mail-io0-f195.google.com with SMTP id y10-v6so4518658ioa.10;
        Tue, 04 Sep 2018 17:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uyfRGm5TSdrAPRkmeF3bixAp9sxMGp3ZgCQDMDm4FmM=;
        b=D57BbSwC+zPM0hovG2dJw5QtiB/T4wdctSy/4pEXNWJao36qyiRaC4zgz097W+vw3F
         mJblTKaLf8zNyTb2jgZR3e5p5wcmnfnhgRKCxx1NM3QOnWWHJ0T8hajQ1uWqxCfUBcZd
         JpovkfwEjPjW3Utu8OUDzFauOA4fiAwI2ES6rlGR5DmseuuwzrjJusFyoEYv8e4FXG1A
         F2F/E39PGrlOi3oK8PtZQLuBJa5kFW3/jq708Vb5SMEFHvwCaOqwGFURmhXGLDBkeHoY
         +g5ebm5X05yQmCqdalBBxXUNjRBBM5CwDXKa2CE4ApT9copHaVA5LIsIZIBu+a2F2rdu
         EFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uyfRGm5TSdrAPRkmeF3bixAp9sxMGp3ZgCQDMDm4FmM=;
        b=TCJA0+8rbv/xAs/4+Ig9mzX3wVVK8SLY5Kkyvxa7wMNYZFHJkizPJZ60otEMWOtfoq
         lkPXl0yVkBcyWS+6UfRlvBwWpbP6/bPfkoBp0oNTQ9H34qqkXboVUptkPxE+doiOhvuC
         SYnOhPP5yl6NxdyfY58zWrnSfkDTvm2vSeDz4voZDMnvs9yFmDVkoqprf0qicdFp0h0X
         sjSr4/FHAcKNFf5oj+ZMa2C0jufhwGAEGmXdQohOie6KN3cpUpoRuqYzWwHooKHw0F4Z
         PXamuNR0wwbItnETPGb2C/NqycTBppGSANQJGHxQ22ea3uNm499I8PvStHDRMQrdOIig
         z6tA==
X-Gm-Message-State: APzg51BFhsb84izAy3h+IU3nztFrjJf64rgc35SJYclUajs6YGvWGtoy
        ghVpwZDftL/e5BK/onxg6Q0=
X-Google-Smtp-Source: ANB0VdbSLP0voCoKZ1xI+4U+kYQ3y84wfSb67j8K3TfQA36qGvg0iDhYR6ZGov+yxypiyQF9uYAEAA==
X-Received: by 2002:a6b:e51a:: with SMTP id y26-v6mr23199650ioc.42.1536105756038;
        Tue, 04 Sep 2018 17:02:36 -0700 (PDT)
Received: from midway.home (static-50-53-52-16.bvtn.or.frontiernet.net. [50.53.52.16])
        by smtp.gmail.com with ESMTPSA id m13-v6sm285687itm.40.2018.09.04.17.02.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 04 Sep 2018 17:02:35 -0700 (PDT)
From:   Randy Dunlap <rd.dunlab@gmail.com>
To:     linux1394-devel@lists.sourceforge.net
Cc:     Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        linux-doc@vger.kernel.org, linux-scsi@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v4 1/5] FireWire: clean up firewire-cdev.h kernel-doc
Date:   Tue,  4 Sep 2018 17:02:21 -0700
Message-Id: <20180905000225.10733-2-rd.dunlab@gmail.com>
X-Mailer: git-send-email 2.13.7
In-Reply-To: <20180905000225.10733-1-rd.dunlab@gmail.com>
References: <20180905000225.10733-1-rd.dunlab@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Clean up kernel-doc warnings in <linux/firewire-cdev.h> so that
it can be added to a Firewire/IEEE 1394 driver-api chapter
without adding lots of noisy warnings to the documentation build.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: linux-doc@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Jonathan Corbet <corbet@lwn.net>
---
 include/uapi/linux/firewire-cdev.h |   22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

--- linux-next-20180904.orig/include/uapi/linux/firewire-cdev.h
+++ linux-next-20180904/include/uapi/linux/firewire-cdev.h
@@ -47,11 +47,11 @@
 #define FW_CDEV_EVENT_ISO_INTERRUPT_MULTICHANNEL	0x09
 
 /**
- * struct fw_cdev_event_common - Common part of all fw_cdev_event_ types
+ * struct fw_cdev_event_common - Common part of all fw_cdev_event_* types
  * @closure:	For arbitrary use by userspace
- * @type:	Discriminates the fw_cdev_event_ types
+ * @type:	Discriminates the fw_cdev_event_* types
  *
- * This struct may be used to access generic members of all fw_cdev_event_
+ * This struct may be used to access generic members of all fw_cdev_event_*
  * types regardless of the specific type.
  *
  * Data passed in the @closure field for a request will be returned in the
@@ -123,7 +123,13 @@ struct fw_cdev_event_response {
 
 /**
  * struct fw_cdev_event_request - Old version of &fw_cdev_event_request2
+ * @closure:	See &fw_cdev_event_common; set by %FW_CDEV_IOC_ALLOCATE ioctl
  * @type:	See &fw_cdev_event_common; always %FW_CDEV_EVENT_REQUEST
+ * @tcode:	Transaction code of the incoming request
+ * @offset:	The offset into the 48-bit per-node address space
+ * @handle:	Reference to the kernel-side pending request
+ * @length:	Data length, i.e. the request's payload size in bytes
+ * @data:	Incoming data, if any
  *
  * This event is sent instead of &fw_cdev_event_request2 if the kernel or
  * the client implements ABI version <= 3.  &fw_cdev_event_request lacks
@@ -353,7 +359,7 @@ struct fw_cdev_event_phy_packet {
 };
 
 /**
- * union fw_cdev_event - Convenience union of fw_cdev_event_ types
+ * union fw_cdev_event - Convenience union of fw_cdev_event_* types
  * @common:		Valid for all types
  * @bus_reset:		Valid if @common.type == %FW_CDEV_EVENT_BUS_RESET
  * @response:		Valid if @common.type == %FW_CDEV_EVENT_RESPONSE
@@ -735,7 +741,7 @@ struct fw_cdev_set_iso_channels {
  * @header:	Header and payload in case of a transmit context.
  *
  * &struct fw_cdev_iso_packet is used to describe isochronous packet queues.
- * Use the FW_CDEV_ISO_ macros to fill in @control.
+ * Use the FW_CDEV_ISO_* macros to fill in @control.
  * The @header array is empty in case of receive contexts.
  *
  * Context type %FW_CDEV_ISO_CONTEXT_TRANSMIT:
@@ -842,7 +848,7 @@ struct fw_cdev_queue_iso {
  *		the %FW_CDEV_ISO_SYNC bit set
  * @tags:	Tag filter bit mask.  Only valid for isochronous reception.
  *		Determines the tag values for which packets will be accepted.
- *		Use FW_CDEV_ISO_CONTEXT_MATCH_ macros to set @tags.
+ *		Use FW_CDEV_ISO_CONTEXT_MATCH_* macros to set @tags.
  * @handle:	Isochronous context handle within which to transmit or receive
  */
 struct fw_cdev_start_iso {
@@ -1009,8 +1015,8 @@ struct fw_cdev_send_stream_packet {
  * on the same card as this device.  After transmission, an
  * %FW_CDEV_EVENT_PHY_PACKET_SENT event is generated.
  *
- * The payload @data[] shall be specified in host byte order.  Usually,
- * @data[1] needs to be the bitwise inverse of @data[0].  VersaPHY packets
+ * The payload @data\[\] shall be specified in host byte order.  Usually,
+ * @data\[1\] needs to be the bitwise inverse of @data\[0\].  VersaPHY packets
  * are an exception to this rule.
  *
  * The ioctl is only permitted on device files which represent a local node.
