Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D83C43462
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 12:30:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4C10611AB
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 12:30:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243404AbhDPMbK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Apr 2021 08:31:10 -0400
Received: from inva020.nxp.com ([92.121.34.13]:56852 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240918AbhDPMbJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 16 Apr 2021 08:31:09 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5E3EB1A3AAE;
        Fri, 16 Apr 2021 14:30:43 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3DACB1A01AA;
        Fri, 16 Apr 2021 14:30:37 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 14267402C1;
        Fri, 16 Apr 2021 14:30:28 +0200 (CEST)
From:   Yangbo Lu <yangbo.lu@nxp.com>
To:     netdev@vger.kernel.org
Cc:     Yangbo Lu <yangbo.lu@nxp.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kurt Kanzenbach <kurt@linutronix.de>,
        Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Claudiu Manoil <claudiu.manoil@nxp.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        UNGLinuxDriver@microchip.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [net-next 0/3] Support ocelot PTP Sync one-step timestamping
Date:   Fri, 16 Apr 2021 20:36:52 +0800
Message-Id: <20210416123655.42783-1-yangbo.lu@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch-set is to support ocelot PTP Sync one-step timestamping.
Actually before that, this patch-set cleans up and optimizes the
DSA slave tx timestamp request handling process.

Yangbo Lu (3):
  net: dsa: optimize tx timestamp request handling
  net: mscc: ocelot: convert to ocelot_port_txtstamp_request()
  net: mscc: ocelot: support PTP Sync one-step timestamping

 Documentation/networking/timestamping.rst     |  7 +-
 .../net/dsa/hirschmann/hellcreek_hwtstamp.c   | 20 +++--
 .../net/dsa/hirschmann/hellcreek_hwtstamp.h   |  2 +-
 drivers/net/dsa/mv88e6xxx/hwtstamp.c          | 21 +++--
 drivers/net/dsa/mv88e6xxx/hwtstamp.h          |  6 +-
 drivers/net/dsa/ocelot/felix.c                | 15 ++--
 drivers/net/dsa/sja1105/sja1105_ptp.c         |  6 +-
 drivers/net/dsa/sja1105/sja1105_ptp.h         |  2 +-
 drivers/net/ethernet/mscc/ocelot.c            | 81 ++++++++++++++++++-
 drivers/net/ethernet/mscc/ocelot_net.c        | 19 ++---
 include/net/dsa.h                             |  2 +-
 include/soc/mscc/ocelot.h                     |  6 +-
 net/dsa/slave.c                               | 20 ++---
 net/dsa/tag_ocelot.c                          | 25 +-----
 net/dsa/tag_ocelot_8021q.c                    | 39 +++------
 15 files changed, 158 insertions(+), 113 deletions(-)


base-commit: 392c36e5be1dee19ffce8c8ba8f07f90f5aa3f7c
-- 
2.25.1

