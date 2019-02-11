Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 222C07D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 11 Feb 2019 06:32:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbfBKGcs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 11 Feb 2019 01:32:48 -0500
Received: from merlin.infradead.org ([205.233.59.134]:37364 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725931AbfBKGcs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Feb 2019 01:32:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=A9yfSa/GlOfbhq+KKfxh/v4/59o0owbl0pBknXEThec=; b=3Rw4UQjxcIIeapnFvbxFUmHPQL
        OlHIR5ulF+E7xBwwllnPKw5P4giUBig+ro/V/2pLsrjSN8wiwOxJ2XDMO4z3zfhOV79kkoV6ha9SQ
        igoj+JC4wbMDf8AcLZQQI6FLD6++MCo921Zmkp2mR4DeG39I0kg/tLS3RpyWltdw3lO5JLTykffyY
        y16gKjVRw1d88mfJeL6hKTyedXoXgvBd8i5TkqbaPWzGL1+tC9gco4I0tQ5LhY5em7qhC60zlccY9
        WRwbpM6W0dcQb3czZfRA84mw6dRR5GJxjZhl5AdtwMgIbtoQ6llzmohNUWcHYBKAXsyhxIyBFN29p
        8ZsMS26w==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=dragon.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gt593-0004B1-Iq; Mon, 11 Feb 2019 06:32:45 +0000
To:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc:     Stuart Yoder <stuyoder@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        Ioana Radulescu <ruxandra.radulescu@nxp.com>,
        Madalin Bucur <madalin.bucur@nxp.com>,
        David Miller <davem@davemloft.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] Documentation: fix some freescale dpio-driver.rst warnings
Message-ID: <99c9792a-7218-76d9-9b53-8477afa69f79@infradead.org>
Date:   Sun, 10 Feb 2019 22:32:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix markup warnings for one list by using correct list syntax.
Fix markup warnings for another list by using blank lines before the
list.

Documentation/networking/device_drivers/freescale/dpaa2/dpio-driver.rst:30: WARNING: Unexpected indentation.
Documentation/networking/device_drivers/freescale/dpaa2/dpio-driver.rst:143: WARNING: Unexpected indentation.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Stuart Yoder <stuyoder@gmail.com>
Cc: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc: Ioana Radulescu <ruxandra.radulescu@nxp.com>
Cc: netdev@vger.kernel.org
Cc: Madalin Bucur <madalin.bucur@nxp.com>
---
This still leaves 2 other warnings that I don't yet see how to fix.

 Documentation/networking/device_drivers/freescale/dpaa2/dpio-driver.rst |   14 +++++-----
 1 file changed, 7 insertions(+), 7 deletions(-)

--- lnx-50-rc6.orig/Documentation/networking/device_drivers/freescale/dpaa2/dpio-driver.rst
+++ lnx-50-rc6/Documentation/networking/device_drivers/freescale/dpaa2/dpio-driver.rst
@@ -27,11 +27,12 @@ Driver Overview
 
 The DPIO driver is bound to DPIO objects discovered on the fsl-mc bus and
 provides services that:
-  A) allow other drivers, such as the Ethernet driver, to enqueue and dequeue
+
+  A. allow other drivers, such as the Ethernet driver, to enqueue and dequeue
      frames for their respective objects
-  B) allow drivers to register callbacks for data availability notifications
+  B. allow drivers to register callbacks for data availability notifications
      when data becomes available on a queue or channel
-  C) allow drivers to manage hardware buffer pools
+  C. allow drivers to manage hardware buffer pools
 
 The Linux DPIO driver consists of 3 primary components--
    DPIO object driver-- fsl-mc driver that manages the DPIO object
@@ -140,11 +141,10 @@ QBman portal interface (qbman-portal.c)
 
    The qbman-portal component provides APIs to do the low level hardware
    bit twiddling for operations such as:
-      -initializing Qman software portals
-
-      -building and sending portal commands
 
-      -portal interrupt configuration and processing
+      - initializing Qman software portals
+      - building and sending portal commands
+      - portal interrupt configuration and processing
 
    The qbman-portal APIs are not public to other drivers, and are
    only used by dpio-service.


