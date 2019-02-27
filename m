Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 68A3F7D90F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 27 Feb 2019 19:59:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730379AbfB0T7b (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 27 Feb 2019 14:59:31 -0500
Received: from proxima.lasnet.de ([78.47.171.185]:42609 "EHLO
        proxima.lasnet.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730308AbfB0T7b (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Feb 2019 14:59:31 -0500
Received: from localhost.localdomain (p200300E9D725588FF6636196BCBB06B8.dip0.t-ipconnect.de [IPv6:2003:e9:d725:588f:f663:6196:bcbb:6b8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: stefan@sostec.de)
        by proxima.lasnet.de (Postfix) with ESMTPSA id 4FA8ECA6A3;
        Wed, 27 Feb 2019 20:59:28 +0100 (CET)
From:   Stefan Schmidt <stefan@datenfreihafen.org>
To:     davem@davemloft.net, corbet@lwn.net
Cc:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-wpan@vger.kernel.org,
        Stefan Schmidt <stefan@datenfreihafen.org>
Subject: [PATCH 0/2] doc: net: ieee802154: move from plain text to rst
Date:   Wed, 27 Feb 2019 20:59:12 +0100
Message-Id: <20190227195914.4594-1-stefan@datenfreihafen.org>
X-Mailer: git-send-email 2.17.2
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello.

The ieee802154 subsystem doc was still in plain text. With the networking book
taking shape I thought it was time to do the first step and move it over to rst.
This really is only the minimal conversion. I need to take some time to update
and extend the docs.

The patches are based on net-next, but they only touch the networking book so I
would not expect and trouble. From what I have seen they would go through
Jonathan's tree after being acked by Dave? If you want this patches against a
different tree let me know.

regards
Stefan Schmidt

Stefan Schmidt (2):
  doc: net: ieee802154: introduce IEEE 802.15.4 subsystem doc in rst
    style
  doc: net: ieee802154: remove old plain text docs after switching to
    rst

 .../{ieee802154.txt => ieee802154.rst}        | 193 +++++++++---------
 Documentation/networking/index.rst            |   1 +
 2 files changed, 99 insertions(+), 95 deletions(-)
 rename Documentation/networking/{ieee802154.txt => ieee802154.rst} (58%)

-- 
2.17.2

