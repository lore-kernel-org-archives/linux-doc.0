Return-Path: <SRS0=s6Rs=ZN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A085C432C0
	for <linux-doc@archiver.kernel.org>; Thu, 21 Nov 2019 23:06:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 15CDD206B6
	for <linux-doc@archiver.kernel.org>; Thu, 21 Nov 2019 23:06:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfKUXGI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Nov 2019 18:06:08 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:55092 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbfKUXGI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Nov 2019 18:06:08 -0500
Received: from localhost (c-73-35-209-67.hsd1.wa.comcast.net [73.35.209.67])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id F2B92150AD829;
        Thu, 21 Nov 2019 15:06:07 -0800 (PST)
Date:   Thu, 21 Nov 2019 15:06:07 -0800 (PST)
Message-Id: <20191121.150607.1310896813096710634.davem@davemloft.net>
To:     r.schwebel@pengutronix.de
Cc:     corbet@lwn.net, netdev@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 5/5] docs: networking: nfc: change to rst format
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20191121155503.52019-5-r.schwebel@pengutronix.de>
References: <20191121155503.52019-1-r.schwebel@pengutronix.de>
        <20191121155503.52019-5-r.schwebel@pengutronix.de>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Thu, 21 Nov 2019 15:06:08 -0800 (PST)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Robert Schwebel <r.schwebel@pengutronix.de>
Date: Thu, 21 Nov 2019 16:55:03 +0100

> Now that the sphinx syntax has been fixed, change the document from txt
> to rst and add it to the index.
> 
> Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>

As Jon mentioned, you aren't actually adding it to the index in this
patch yet the commit message says that you did.

Please fix that, repsin this series, and provide a proper "[PATCH 0/5]
..."  cover letter this time.

Thank you.
