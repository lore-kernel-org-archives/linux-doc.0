Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C3B907D048
	for <lwn-linux-doc@archive.lwn.net>; Sun, 17 Jun 2018 00:37:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756947AbeFQAgZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 16 Jun 2018 20:36:25 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:57836 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756937AbeFQAgY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 16 Jun 2018 20:36:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=W99e0eKU8kgaSiOPttqMPOONhS4kdEcTmxAqLpJw28A=; b=bi+b6CN8aX//9jSGmmC2YzubH
        SgVEOscNGQuwSuil4BfHYrNsHZTbGFW/VYsQTjEMHgENCDmn6K+BljyuDQtQQRejsMyDPnnT62KdC
        2l3eRptWDFsDAL9yZS9fWZkFrky+4PL+AP1ZYctF2cE/nMec10EbH+adhShKb+DgMPL5uKsKR4ZtC
        10rNODwGNO398sCZN/8HZoBHQswvnoxA3K6nLjs0mNaDz6DDsrwd4WZnNodfIvZRanqOXVospINb3
        0r9FUYxM24oYgp9SCI1mxaU7uj+gjSLA17WT69UQtOUw7RtAjBnYD/ATw/+U2mda22Ixsq9hqZAci
        CvVtuyLfg==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fULg6-0006XI-38; Sun, 17 Jun 2018 00:36:22 +0000
To:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        David Miller <davem@davemloft.net>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Aaron Brown <aaron.f.brown@intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] net: fix e100.rst Documentation build errors
Message-ID: <72f13386-c484-3eed-c363-a5b667aea2e6@infradead.org>
Date:   Sat, 16 Jun 2018 17:36:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix Documentation build errors in e100.rst.  Several section titles
and the corresponding underlines should not be indented.

Documentation/networking/e100.rst:90: (SEVERE/4) Unexpected section title.
Documentation/networking/e100.rst:109: (SEVERE/4) Unexpected section title.

Fixes: 85d63445f411 ("Documentation: e100: Update the Intel 10/100 driver doc")

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Cc: Aaron Brown <aaron.f.brown@intel.com>
---
Is there a Sphinx version problem here?  Tested-by: should indicate
that there was no error like I am seeing.

 Documentation/networking/e100.rst |   24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

--- lnx-418-rc1.orig/Documentation/networking/e100.rst
+++ lnx-418-rc1/Documentation/networking/e100.rst
@@ -86,8 +86,8 @@ Event Log Message Level:  The driver use
 Additional Configurations
 =========================
 
-  Configuring the Driver on Different Distributions
-  -------------------------------------------------
+Configuring the Driver on Different Distributions
+-------------------------------------------------
 
   Configuring a network driver to load properly when the system is started is
   distribution dependent. Typically, the configuration process involves adding
@@ -105,8 +105,8 @@ Additional Configurations
        alias eth0 e100
        alias eth1 e100
 
-  Viewing Link Messages
-  ---------------------
+Viewing Link Messages
+---------------------
   In order to see link messages and other Intel driver information on your
   console, you must set the dmesg level up to six. This can be done by
   entering the following on the command line before loading the e100 driver::
@@ -119,8 +119,8 @@ Additional Configurations
   NOTE: This setting is not saved across reboots.
 
 
-  ethtool
-  -------
+ethtool
+-------
 
   The driver utilizes the ethtool interface for driver configuration and
   diagnostics, as well as displaying statistical information.  The ethtool
@@ -129,8 +129,8 @@ Additional Configurations
   The latest release of ethtool can be found from
   https://www.kernel.org/pub/software/network/ethtool/
 
-  Enabling Wake on LAN* (WoL)
-  ---------------------------
+Enabling Wake on LAN* (WoL)
+---------------------------
   WoL is provided through the ethtool* utility.  For instructions on enabling
   WoL with ethtool, refer to the ethtool man page.
 
@@ -138,16 +138,16 @@ Additional Configurations
   this driver version, in order to enable WoL, the e100 driver must be
   loaded when shutting down or rebooting the system.
 
-  NAPI
-  ----
+NAPI
+----
 
   NAPI (Rx polling mode) is supported in the e100 driver.
 
   See https://wiki.linuxfoundation.org/networking/napi for more information
   on NAPI.
 
-  Multiple Interfaces on Same Ethernet Broadcast Network
-  ------------------------------------------------------
+Multiple Interfaces on Same Ethernet Broadcast Network
+------------------------------------------------------
 
   Due to the default ARP behavior on Linux, it is not possible to have
   one system on two IP networks in the same Ethernet broadcast domain


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
