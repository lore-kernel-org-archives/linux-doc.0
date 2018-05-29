Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B8D027DF8A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 May 2018 18:51:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S966159AbeE2Sux (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 May 2018 14:50:53 -0400
Received: from mail-lf0-f65.google.com ([209.85.215.65]:45609 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964830AbeE2Suo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 May 2018 14:50:44 -0400
Received: by mail-lf0-f65.google.com with SMTP id n3-v6so346322lfe.12;
        Tue, 29 May 2018 11:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xJEvjHv3JPNJ2GxhrUzOWUc/WnXj0r8iLuGubJqzPOU=;
        b=YOz/sqQW0g0z3+8WplEnCFWcKyh1QBsX9vaZR6AHvBs2IZYSHnnRXjw+ymQKKUiodY
         +yqltk39ML+Qee1BJs+hNT4e1jlQue36ZfXfxY/BQtgFY20e1tydbWBYS9wuUv8atklN
         jweYfFnea9pjFRcO6NyloWZfnmZDy4fn8fKgX3DtP/hSAi8SrhgoOdh+fGxUrMFsZVUS
         7U0F3nrKLzTkjue/hfCUDp9RsvievkMQPgdfRHGBHt7Nd7ZzfrhNxp8439jnoV2IKhWN
         0f+BPpQZINJCoS9zQbnIqULEStzs5gYXUZbZbnrbYtBPyEJp6ONomD0w6jiw7KEvSSla
         kaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xJEvjHv3JPNJ2GxhrUzOWUc/WnXj0r8iLuGubJqzPOU=;
        b=d8jNJWpMIQdrSn57QAvzP6BlNZ8ce1iLYCNbj0wTvUvtzu3OfZzJMC07hUz1UTb+/m
         7n1QtR5gVmkr2bCbkFaPBsEH76g+bLiEhgd6akvG4gzl1xInFOJJCSJGhjzAwfmn98hx
         U0tbCqwweD274GTVvuJa+dsCX6gxbLT4WfuJEaO+Av2iccYa33ncrg1V56ooFy9NBgI/
         KHg1eZrQo/CUrh65XUONwu4uF2KW8+SEZrFjeuAsVtTxcKdB5t7C875O7/EUQZMpDUv6
         b1Kx4HkxExJKLxBDut/6L6klrjvBE/KoAfwLPOK/taoGt5xfrwPlpCpR8niOyMrGeXJh
         SNtQ==
X-Gm-Message-State: ALKqPwfila0uNohYi2MGJooQtabcoYyV/97CNUqfMzzEc4rSDawjIADg
        qrzYiqnkwoaEhMxU0RinexA=
X-Google-Smtp-Source: ADUXVKLVI3/azuFhekXWQUIPlavROaEEdmB3gtvzcWxlNSRgh+d73H3SeLS7NXfmJzOKs3iFL96x5Q==
X-Received: by 2002:a2e:7310:: with SMTP id o16-v6mr11931098ljc.29.1527619842706;
        Tue, 29 May 2018 11:50:42 -0700 (PDT)
Received: from localhost.localdomain (c-2ec2d783-74736162.cust.telenor.se. [46.194.215.131])
        by smtp.gmail.com with ESMTPSA id i29-v6sm7488306lfb.89.2018.05.29.11.50.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 May 2018 11:50:41 -0700 (PDT)
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
Subject: [PATCH v3 2/3] Documentation: usb: add documentation for USB CCID Gadget Device
Date:   Tue, 29 May 2018 20:50:20 +0200
Message-Id: <20180529185021.13738-2-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180529185021.13738-1-marcus.folkesson@gmail.com>
References: <20180529185021.13738-1-marcus.folkesson@gmail.com>
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

Notes:
    v3:
    	- correct the grammer (thanks Randy)
    v2:
    	- add the missing changelog text

 Documentation/usb/gadget_ccid.rst | 267 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 267 insertions(+)
 create mode 100644 Documentation/usb/gadget_ccid.rst

diff --git a/Documentation/usb/gadget_ccid.rst b/Documentation/usb/gadget_ccid.rst
new file mode 100644
index 000000000000..524fe9e6ac19
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
+These endpoints are exposed to userspace via /dev/ccidg*.
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
+All CCID commands begins with a 10-byte header followed by an optional
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
+All CCID commands specify which slot is the receiver in the `bSlot` field
+of the CCID header.
+
+Usage
+=====
+
+Access from userspace
+----------------------
+All communication is by read(2) and write(2) to the corresponding /dev/ccidg* device.
+Only one file descriptor is allowed to be open to the device at a time.
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
+The attributes are described below followed by an example.
+
+features
+~~~~~~~~~
+
+The `feature` attribute writes to the dwFeatures field in the class descriptor.
+See Table 5.1-1 Smart Card Device Descriptors in the CCID Specification [1]_.
+
+The value indicates what intelligent features the CCID has.
+These values are available to user application as defined in ccid.h [2]_.
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
