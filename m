Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 02DC77D90D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 11 Nov 2019 12:03:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfKKMDQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 11 Nov 2019 07:03:16 -0500
Received: from inva020.nxp.com ([92.121.34.13]:32774 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726810AbfKKMDQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 11 Nov 2019 07:03:16 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9D1E31A08D9;
        Mon, 11 Nov 2019 13:03:14 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9124A1A0626;
        Mon, 11 Nov 2019 13:03:14 +0100 (CET)
Received: from fsr-fed2164-101.ea.freescale.net (fsr-fed2164-101.ea.freescale.net [10.171.82.91])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 49FC9205FE;
        Mon, 11 Nov 2019 13:03:14 +0100 (CET)
From:   Madalin Bucur <madalin.bucur@nxp.com>
To:     davem@davemloft.net, netdev@vger.kernel.org
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net,
        Madalin Bucur <madalin.bucur@nxp.com>
Subject: [PATCH net-next 0/2] dpaa_eth documentation updates
Date:   Mon, 11 Nov 2019 14:03:10 +0200
Message-Id: <1573473792-17797-1-git-send-email-madalin.bucur@nxp.com>
X-Mailer: git-send-email 2.1.0
Content-Type: text/plain; charset="us-ascii"
Reply-to: madalin.bucur@nxp.com
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Documentation updates for the DPAA Ethernet driver

Madalin Bucur (2):
  Documentation: networking: dpaa_eth: adjust buffer pool info
  Documentation: networking: dpaa_eth: adjust sysfs paths

 Documentation/networking/device_drivers/freescale/dpaa.txt | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.1.0

