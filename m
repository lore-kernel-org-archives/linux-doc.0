Return-Path: <SRS0=mcri=ZO=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4968C43141
	for <linux-doc@archiver.kernel.org>; Fri, 22 Nov 2019 07:43:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B679220715
	for <linux-doc@archiver.kernel.org>; Fri, 22 Nov 2019 07:43:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbfKVHnx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 22 Nov 2019 02:43:53 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:57059 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfKVHnp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 Nov 2019 02:43:45 -0500
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=leda.hi.pengutronix.de)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <rsc@pengutronix.de>)
        id 1iY3bS-0002i6-0Q; Fri, 22 Nov 2019 08:43:42 +0100
Received: by leda.hi.pengutronix.de (Postfix, from userid 1006)
        id DB1B02C877E4; Fri, 22 Nov 2019 08:43:40 +0100 (CET)
From:   Robert Schwebel <r.schwebel@pengutronix.de>
To:     "David S. Miller" <davem@davemloft.net>
Cc:     Robert Schwebel <r.schwebel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v2 0/5] docs: networking: nfc: convert from txt to rst
Date:   Fri, 22 Nov 2019 08:43:01 +0100
Message-Id: <20191122074306.78179-1-r.schwebel@pengutronix.de>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: rsc@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

here is v2 of the series converting the NFC documentation from txt to
rst. Thanks to Jonathan and Dave for the input.

Changes since (implicit) v1:

* replace code-block by more compact :: syntax

* really add the rst file to the index

rsc
