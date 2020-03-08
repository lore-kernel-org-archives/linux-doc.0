Return-Path: <SRS0=aoLA=42=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDBE1C10DCE
	for <linux-doc@archiver.kernel.org>; Mon,  9 Mar 2020 00:05:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 943BC20674
	for <linux-doc@archiver.kernel.org>; Mon,  9 Mar 2020 00:05:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgCIAFV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 8 Mar 2020 20:05:21 -0400
Received: from haggis.mythic-beasts.com ([46.235.224.141]:50751 "EHLO
        haggis.mythic-beasts.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbgCIAFV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 8 Mar 2020 20:05:21 -0400
X-Greylist: delayed 316 seconds by postgrey-1.27 at vger.kernel.org; Sun, 08 Mar 2020 20:05:20 EDT
Received: from [146.90.33.204] (port=52712 helo=slartibartfast.quignogs.org.uk)
        by haggis.mythic-beasts.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <peter@bikeshed.quignogs.org.uk>)
        id 1jB5pz-0005Me-BO; Mon, 09 Mar 2020 00:00:03 +0000
From:   peter@bikeshed.quignogs.org.uk
To:     linux-doc@vger.kernel.org
Cc:     Peter Lister <peter@bikeshed.quignogs.org.uk>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 0/1] Tiny patch to fix doc build warnings
Date:   Sun,  8 Mar 2020 23:59:56 +0000
Message-Id: <20200308235957.9187-1-peter@bikeshed.quignogs.org.uk>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BlackCat-Spam-Score: 50
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Peter Lister <peter@bikeshed.quignogs.org.uk>

Inspired by Jonathan's recent lwn.net article, here's a tiny patch to fix doc
build warnings due to extra double colons.

Peter Lister (1):
  Changed double colon to single colon at the ends of two paragraphs
    preceding ".. code-block:: c".

 Documentation/driver-api/gpio/driver.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.24.1

