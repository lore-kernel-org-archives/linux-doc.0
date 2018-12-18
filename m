Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 53BC27D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 18 Dec 2018 10:53:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbeLRKxQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 18 Dec 2018 05:53:16 -0500
Received: from mga03.intel.com ([134.134.136.65]:57320 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726505AbeLRKxP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 18 Dec 2018 05:53:15 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Dec 2018 02:53:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,367,1539673200"; 
   d="scan'208";a="130907682"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 18 Dec 2018 02:53:09 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: Improve Alt Mode documentation
Date:   Tue, 18 Dec 2018 13:53:08 +0300
Message-Id: <20181218105308.54824-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adding the document to the usb index file and fixing a few
references. Also, exposing the code examples as "literal
blocks" so they are more easy to read.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 Documentation/driver-api/usb/index.rst     |  1 +
 Documentation/driver-api/usb/typec.rst     |  1 +
 Documentation/driver-api/usb/typec_bus.rst | 24 +++++++++++-----------
 3 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/Documentation/driver-api/usb/index.rst b/Documentation/driver-api/usb/index.rst
index 8fe995a1ec94..cfa8797ea614 100644
--- a/Documentation/driver-api/usb/index.rst
+++ b/Documentation/driver-api/usb/index.rst
@@ -19,6 +19,7 @@ Linux USB API
    dwc3
    writing_musb_glue_layer
    typec
+   typec_bus
    usb3-debug-port
 
 .. only::  subproject and html
diff --git a/Documentation/driver-api/usb/typec.rst b/Documentation/driver-api/usb/typec.rst
index 48ff58095f11..201163d8c13e 100644
--- a/Documentation/driver-api/usb/typec.rst
+++ b/Documentation/driver-api/usb/typec.rst
@@ -1,3 +1,4 @@
+.. _typec:
 
 USB Type-C connector class
 ==========================
diff --git a/Documentation/driver-api/usb/typec_bus.rst b/Documentation/driver-api/usb/typec_bus.rst
index d5eec1715b5b..f47a69bff498 100644
--- a/Documentation/driver-api/usb/typec_bus.rst
+++ b/Documentation/driver-api/usb/typec_bus.rst
@@ -13,10 +13,10 @@ every alternate mode, so every alternate mode will need a custom driver.
 USB Type-C bus allows binding a driver to the discovered partner alternate
 modes by using the SVID and the mode number.
 
-USB Type-C Connector Class provides a device for every alternate mode a port
-supports, and separate device for every alternate mode the partner supports.
-The drivers for the alternate modes are bound to the partner alternate mode
-devices, and the port alternate mode devices must be handled by the port
+:ref:`USB Type-C Connector Class <typec>` provides a device for every alternate
+mode a port supports, and separate device for every alternate mode the partner
+supports. The drivers for the alternate modes are bound to the partner alternate
+mode devices, and the port alternate mode devices must be handled by the port
 drivers.
 
 When a new partner alternate mode device is registered, it is linked to the
@@ -46,7 +46,7 @@ enter any modes on their own.
 ``->vdm`` is the most important callback in the operation callbacks vector. It
 will be used to deliver all the SVID specific commands from the partner to the
 alternate mode driver, and vice versa in case of port drivers. The drivers send
-the SVID specific commands to each other using :c:func:`typec_altmode_vmd()`.
+the SVID specific commands to each other using :c:func:`typec_altmode_vdm()`.
 
 If the communication with the partner using the SVID specific commands results
 in need to reconfigure the pins on the connector, the alternate mode driver
@@ -67,15 +67,15 @@ Type-C Specification, and also put the connector back to ``TYPEC_STATE_USB``
 after the mode has been exited.
 
 An example of working definitions for SVID specific pin configurations would
-look like this:
+look like this::
 
-enum {
-	ALTMODEX_CONF_A = TYPEC_STATE_MODAL,
-	ALTMODEX_CONF_B,
-	...
-};
+    enum {
+        ALTMODEX_CONF_A = TYPEC_STATE_MODAL,
+        ALTMODEX_CONF_B,
+        ...
+    };
 
-Helper macro ``TYPEC_MODAL_STATE()`` can also be used:
+Helper macro ``TYPEC_MODAL_STATE()`` can also be used::
 
 #define ALTMODEX_CONF_A = TYPEC_MODAL_STATE(0);
 #define ALTMODEX_CONF_B = TYPEC_MODAL_STATE(1);
-- 
2.19.2

