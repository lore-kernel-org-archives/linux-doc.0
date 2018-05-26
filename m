Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3860E7DF8B
	for <lwn-linux-doc@archive.lwn.net>; Sat, 26 May 2018 21:21:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1032467AbeEZVUB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 26 May 2018 17:20:01 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:52444 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032410AbeEZVT7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 26 May 2018 17:19:59 -0400
Received: by mail-wm0-f66.google.com with SMTP id 18-v6so17092795wml.2;
        Sat, 26 May 2018 14:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=eRQS6Metll0oKUiCd2kVy6mj9qKAlboJRoz6PbeFd3U=;
        b=bODdmHZ8Ssge8zIrAhFB24FFYc/nP5SBCVg+hgVbSvb7Ko8N4bbjefgcUOItah8AQC
         5Ae8Eh2dT0ZwrWLxpVjDU3cCC1xB6YxjGM6eVxIYLwJD9Nre8JBP5Nv87E+j2kcJMw4p
         vHu8NLB4HMSnwvk5m7zC/0xTYoN99eqgsHbIPiT57mfwHjSOPTG/e8kmWpNQXd3apnYG
         J5KNLupRjnurcqKMU3zHdzIHrt9XP9R3pQQxHNbkIqafx3LGLrz/cZBsemLlQm7ygrv1
         rF3vDY71w89w7AQ41Wk9QPMOgwxHM5hND3/bGMUi2FhGLY9qGMnmB3cUaDBZrthpVEa/
         RHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=eRQS6Metll0oKUiCd2kVy6mj9qKAlboJRoz6PbeFd3U=;
        b=sv6tohfzew5xGi1CqwO2ewQE/om7eWziOBrGBPgyPAipzLCM/hI3bX+KQl0+S01ePs
         s9QUGYO4vVL8fOogE/b8mDv1LghjIqEeqOlYFSfJCo68SOIdpxQ54qcXdaciNBA0SYn0
         QE5kf2JYrWPE1GXA0uMs8NO4Z9oWdaQG+uwvLo4we5r5eavhj7U2vLlj9JR2H1C3/tMF
         J5EsrUaP1ArrvAkNQyDqe0QGLIbbS2NpRdgbwVXnZK7Qw60gRiOLwkXymSSNwYWknfi0
         HTPQ9Lhu3JvaP5BqeTPeb8zh4hwnKvPKhQdam0OMSiCJrpw5JTqqvy6tvHX/obrefFXO
         JWoQ==
X-Gm-Message-State: ALKqPweoJ/QFTSXysO3SfX2bA4/Lm36Vf/A1xwS9i9kQD97C9BiMWId9
        w7Ol1XzFc+ZBBvA2h+SL4kQ=
X-Google-Smtp-Source: AB8JxZoX1ENzMu6OizEKQT6/kxuB79CRK0GzYmCN4riz9E95/nCk2nKwRY5cfiJl4/DjxYgSM1MCuQ==
X-Received: by 2002:a2e:781a:: with SMTP id t26-v6mr4815261ljc.74.1527369597254;
        Sat, 26 May 2018 14:19:57 -0700 (PDT)
Received: from localhost.localdomain (c-2ec2c701-74736162.cust.telenor.se. [46.194.199.1])
        by smtp.gmail.com with ESMTPSA id d8-v6sm2397243lfe.95.2018.05.26.14.19.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 26 May 2018 14:19:56 -0700 (PDT)
From:   Marcus Folkesson <marcus.folkesson@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Felipe Balbi <balbi@kernel.org>, davem@davemloft.net,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v2 2/3] Documentation: usb: add documentation for USB CCID Gadget Device
Date:   Sat, 26 May 2018 23:19:39 +0200
Message-Id: <20180526211940.25474-2-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180526211940.25474-1-marcus.folkesson@gmail.com>
References: <20180526211940.25474-1-marcus.folkesson@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add documentation to give a brief description on how to use the
CCID Gadget Device.
This includes a description for all attributes followed by an example on
how to setup the device with ConfigFS.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 Documentation/usb/gadget_ccid.rst | 267 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 267 insertions(+)
 create mode 100644 Documentation/usb/gadget_ccid.rst

diff --git a/Documentation/usb/gadget_ccid.rst b/Documentation/usb/gadget_ccid.rst
new file mode 100644
index 000000000000..5ac806b14604
--- /dev/null
+++ b/Documentation/usb/gadget_ccid.rst
@@ -0,0 +1,267 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============
+CCID Gadget
+============
+
+:Author: Marcus Folkesson <marcus.folkesson@gmail.com>
+
+Introduction
+============
+
+The CCID Gadget will present itself as a CCID device to the host system.
+The device supports two endpoints for now; BULK IN and BULK OUT.
+These endpoints is exposed to userspace via /dev/ccidg*.
+
+All CCID commands are sent on the BULK-OUT endpoint. Each command sent to the CCID
+has an associated ending response. Some commands can also have intermediate
+responses. The response is sent on the BULK-IN endpoint.
+See Figure 3-3 in the CCID Specification [1]_ for more details.
+
+The CCID commands must be handled in userspace since the driver is only working
+as a transport layer for the TPDUs.
+
+
+CCID Commands
+--------------
+
+All CCID commands begins with a 10 bytes header followed by an optional
+data field depending on message type.
+
++--------+--------------+-------+----------------------------------+
+| Offset | Field        | Size  | Description                      |
++========+==============+=======+==================================+
+| 0      | bMessageType | 1     | Type of message                  |
++--------+--------------+-------+----------------------------------+
+| 1      | dwLength     | 4     | Message specific data length     |
+|        |              |       |                                  |
++--------+--------------+-------+----------------------------------+
+| 5      | bSlot        | 1     | Identifies the slot number       |
+|        |              |       | for this command                 |
++--------+--------------+-------+----------------------------------+
+| 6      | bSeq         | 1     | Sequence number for command      |
++--------+--------------+-------+----------------------------------+
+| 7      | ...          | 3     | Fields depends on message type   |
++--------+--------------+-------+----------------------------------+
+| 10     | abData       | array | Message specific data (OPTIONAL) |
++--------+--------------+-------+----------------------------------+
+
+
+Multiple CCID gadgets
+----------------------
+
+It is possible to create multiple instances of the CCID gadget, however,
+a much more flexible way is to create one gadget and set the `nslots` attribute
+to the number of desired CCID devices.
+
+All CCID commands specifies which slot that is the receiver in the `bSlot` field
+of the CCID header.
+
+Usage
+=====
+
+Access from userspace
+----------------------
+All communication is by read(2) and write(2) to the corresponding /dev/ccidg* device.
+Only one filedescriptor is allowed to be open to the device at a time.
+
+The buffer size provided to read(2) **must be at least** 522 (10 bytes header + 512 bytes payload)
+bytes as we are working with whole commands.
+
+The buffer size provided to write(2) **may not exceed** 522 (10 bytes header + 512 bytes payload)
+bytes as we are working with whole commands.
+
+
+Configuration with configfs
+----------------------------
+
+ConfigFS is used to create and configure the CCID gadget.
+In order to get a device to work as intended, a few attributes must
+be considered.
+
+The attributes is described below followed by an example.
+
+features
+~~~~~~~~~
+
+The `feature` attribute writes to the dwFeatures field in the class descriptor.
+See Table 5.1-1 Smart Card Device Descriptors in the CCID Specification [1]_.
+
+The value indicates what intelligent features the CCID has.
+These values are available to user application as defines in ccid.h [2]_.
+The default value is 0x00000000.
+
+The value is a bitwise OR operation performed on the following values:
+
++------------+----------------------------------------------------------------+
+| Value      | Description                                                    |
++============+================================================================+
+| 0x00000000 | No special characteristics                                     |
++------------+----------------------------------------------------------------+
+| 0x00000002 | Automatic parameter configuration based on ATR data            |
++------------+----------------------------------------------------------------+
+| 0x00000004 | Automatic activation of ICC on inserting                       |
++------------+----------------------------------------------------------------+
+| 0x00000008 | Automatic ICC voltage selection                                |
++------------+----------------------------------------------------------------+
+| 0x00000010 | Automatic ICC clock frequency change according to active       |
+|            | parameters provided by the Host or self determined             |
++------------+----------------------------------------------------------------+
+| 0x00000020 | Automatic baud rate change according to active                 |
+|            | parameters provided by the Host or self determined             |
++------------+----------------------------------------------------------------+
+| 0x00000040 | Automatic parameters negotiation made by the CCID              |
++------------+----------------------------------------------------------------+
+| 0x00000080 | Automatic PPS made by the CCID according to the                |
+|            | active parameters                                              |
++------------+----------------------------------------------------------------+
+| 0x00000100 | CCID can set ICC in clock stop mode                            |
++------------+----------------------------------------------------------------+
+| 0x00000200 | NAD value other than 00 accepted (T=1 protocol in use)         |
++------------+----------------------------------------------------------------+
+| 0x00000400 | Automatic IFSD exchange as first exchange                      |
++------------+----------------------------------------------------------------+
+
+
+Only one of the following values may be present to select a level of exchange:
+
++------------+--------------------------------------------------+
+| Value      | Description                                      |
++============+==================================================+
+| 0x00010000 | TPDU level exchanges with CCID                   |
++------------+--------------------------------------------------+
+| 0x00020000 | Short APDU level exchange with CCID              |
++------------+--------------------------------------------------+
+| 0x00040000 | Short and Extended APDU level exchange with CCID |
++------------+--------------------------------------------------+
+
+If none of those values is indicated the level of exchange is
+character.
+
+
+protocols
+~~~~~~~~~~
+The `protocols` attribute writes to the dwProtocols field in the class descriptor.
+See Table 5.1-1 Smart Card Device Descriptors in the CCID Specification [1]_.
+
+The value is a bitwise OR operation performed on the following values:
+
++--------+--------------+
+| Value  | Description  |
++========+==============+
+| 0x0001 | Protocol T=0 |
++--------+--------------+
+| 0x0002 | Protocol T=1 |
++--------+--------------+
+
+If no protocol is selected both T=0 and T=1 will be supported (`protocols` = 0x0003).
+
+nslots
+~~~~~~
+
+The `nslots` attribute writes to the bMaxSlotIndex field in the class descriptor.
+See Table 5.1-1 Smart Card Device Descriptors in the CCID Specification [1]_.
+
+This is the index of the highest available slot on this device. All slots are consecutive starting at 00h.
+i.e. 0Fh = 16 slots on this device numbered 00h to 0Fh.
+
+The default value is 0, which means one slot.
+
+
+pinsupport
+~~~~~~~~~~~~
+
+This value indicates what PIN support features the CCID has.
+
+The `pinsupport` attribute writes to the dwPINSupport field in the class descriptor.
+See Table 5.1-1 Smart Card Device Descriptors in the CCID Specification [1]_.
+
+
+The value is a bitwise OR operation performed on the following values:
+
++--------+----------------------------+
+| Value  | Description                |
++========+============================+
+| 0x00   | No PIN support             |
++--------+----------------------------+
+| 0x01   | PIN Verification supported |
++--------+----------------------------+
+| 0x02   | PIN Modification supported |
++--------+----------------------------+
+
+The default value is set to 0x00.
+
+
+lcdlayout
+~~~~~~~~~~
+
+Number of lines and characters for the LCD display used to send messages for PIN entry.
+
+The `lcdLayout` attribute writes to the wLcdLayout field in the class descriptor.
+See Table 5.1-1 Smart Card Device Descriptors in the CCID Specification [1]_.
+
+
+The value is set as follows:
+
++--------+------------------------------------+
+| Value  | Description                        |
++========+====================================+
+| 0x0000 | No LCD                             |
++--------+------------------------------------+
+| 0xXXYY | XX: number of lines                |
+|        | YY: number of characters per line. |
++--------+------------------------------------+
+
+The default value is set to 0x0000.
+
+
+Example
+-------
+
+Here is an example on how to setup a CCID gadget with configfs ::
+
+    #!/bin/sh
+
+    CONFIGDIR=/sys/kernel/config
+    GADGET=$CONFIGDIR/usb_gadget/g0
+    FUNCTION=$GADGET/functions/ccid.sc0
+
+    VID=YOUR_VENDOR_ID_HERE
+    PID=YOUR_PRODUCT_ID_HERE
+    UDC=YOUR_UDC_HERE
+
+    #Mount filesystem
+    mount none -t configfs $CONFIGDIR
+
+    #Populate ID:s
+    echo $VID > $GADGET/idVendor
+    echo $PID > $GADGET/idProduct
+
+    #Create and configure the gadget
+    mkdir $FUNCTION
+    echo 0x000407B8 > $FUNCTION/features
+    echo 0x02 > $FUNCTION/protocols
+
+    #Create our english strings
+    mkdir  $GADGET/strings/0x409
+    echo 556677 > $GADGET/strings/0x409/serialnumber
+    echo "Hungry Penguins" > $GADGET/strings/0x409/manufacturer
+    echo "Harpoon With SmartCard"  > $GADGET/strings/0x409/product
+
+    #Create configuration
+    mkdir  $GADGET/configs/c.1
+    mkdir  $GADGET/configs/c.1/strings/0x409
+    echo Config1 > $GADGET/configs/c.1/strings/0x409/configuration
+
+    #Use `Config1` for our CCID gadget
+    ln -s $FUNCTION $GADGET/configs/c.1
+
+    #Execute
+    echo $UDC > $GADGET/UDC
+
+
+References
+==========
+
+.. [1] http://www.usb.org/developers/docs/devclass_docs/DWG_Smart-Card_CCID_Rev110.pdf
+.. [2] include/uapi/linux/usb/ccid.h
-- 
2.16.2

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
