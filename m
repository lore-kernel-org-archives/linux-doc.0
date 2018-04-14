Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 178357DE78
	for <lwn-linux-doc@archive.lwn.net>; Sat, 14 Apr 2018 01:27:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751109AbeDNB1p (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Apr 2018 21:27:45 -0400
Received: from mail-it0-f68.google.com ([209.85.214.68]:36377 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750904AbeDNB1p (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Apr 2018 21:27:45 -0400
Received: by mail-it0-f68.google.com with SMTP id 15-v6so5383122itl.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Apr 2018 18:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/2kUiESa+C6cZ3AgA+WQZ7/A7Bw5yhFNxRUC2BPfbgE=;
        b=nHEo3HbocPY2ha7TpTvSEP+qRquLyaz1hThAgp22qVeiGEXhf8fhA2YaXJCoH7D6XN
         v9jAvbwlUwa4f/uXV94Rb97abYOgZbcGD9cTyIE8SNvOBE6dXwWrSUPqVC5JdtxGuVvA
         TUgU4BQPRx5yvreqoXQ30p6LAipt5Kkte4frlu90R+aLjZlPYk2bJ6EapCUEomoXmmfc
         ID8UXiCQH4hGmFRbO4tkJ2g81L8Ah4cPWcKfL5DU5E/wCqhLYTLaBAanxxg3p3Lh16QB
         v2fMKcLUAb1ghmmN3VlqoVg7G6P/QweQDIxV5CqWfMV2nh1w895FLURZN0ivEZrPP4mb
         JvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/2kUiESa+C6cZ3AgA+WQZ7/A7Bw5yhFNxRUC2BPfbgE=;
        b=f4QEf2pKxvoT3NRWqxJOzjKYTzCdieUpFuwHpBl6d2O0fZP71ZUjGUeOtKkEabQd1h
         ZhcvWN3HEA3Tl5YbADEU6GRvV93qqimWIOYPycJ1PvAdAHK4g8x10zFtmiq4FvqW96ZK
         rsYLQi/EsdNnKS4zs1FCMfUg0G3J4oR15R2f8D588JDIe1IjuMT8KWouPmoVY6Ppc0Qd
         VXG1k7zt9/pFC7rz2u3uW9d2MYvPgJRNKvy/RFa3LkeqYhiK2kOZ/hsQejTwwfDUuAox
         rxfChFHpPSqQZzE6/a7jKuevl+WitYmK1ec+7njYWn/d9sOLHU9+NWGEwFD7mLxFIsmH
         o0Kg==
X-Gm-Message-State: ALQs6tAMuXX7runWmhqfmCbvxuvvYX6f6cECadR2zOMHP56vgAC8WYbX
        V0kJestmGS0KCcw5cAdrwr4=
X-Google-Smtp-Source: AIpwx48lSoGud0XmW840Xv163m8sOeounBQlOy1DV8cRKxts87JPgTD2dpBeHgS1m6iN+Df8205fBg==
X-Received: by 2002:a24:8b43:: with SMTP id g64-v6mr8260187ite.69.1523669264487;
        Fri, 13 Apr 2018 18:27:44 -0700 (PDT)
Received: from midway.home (static-50-53-52-16.bvtn.or.frontiernet.net. [50.53.52.16])
        by smtp.gmail.com with ESMTPSA id g16-v6sm271257ita.0.2018.04.13.18.27.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 18:27:43 -0700 (PDT)
From:   Randy Dunlap <rd.dunlab@gmail.com>
To:     linux1394-devel@lists.sourceforge.net
Cc:     Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3 1/5] FireWire: clean up firewire-cdev.h kernel-doc
Date:   Fri, 13 Apr 2018 18:27:18 -0700
Message-Id: <20180414012722.17420-2-rd.dunlab@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180414012722.17420-1-rd.dunlab@gmail.com>
References: <20180414012722.17420-1-rd.dunlab@gmail.com>
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
Cc: linux1394-devel@lists.sourceforge.net
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
---
@linux-doc: The patch that adds Documentation/driver-api/firewire.rst
causes a warning in this header file, but I don't see where it is
coming from (this header file patch does not touch that area of the
file):

../include/uapi/linux/firewire-cdev.h:312: WARNING: Inline literal start-string without end-string.

 include/uapi/linux/firewire-cdev.h |   22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

--- linux-next-20180413.orig/include/uapi/linux/firewire-cdev.h
+++ linux-next-20180413/include/uapi/linux/firewire-cdev.h
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
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
