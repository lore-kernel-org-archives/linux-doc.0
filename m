Return-Path: <SRS0=MEEV=7Y=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F210EC433E0
	for <linux-doc@archiver.kernel.org>; Thu, 11 Jun 2020 00:08:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D001820691
	for <linux-doc@archiver.kernel.org>; Thu, 11 Jun 2020 00:08:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbgFKAI2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Jun 2020 20:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbgFKAI2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Jun 2020 20:08:28 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3812BC08C5C1;
        Wed, 10 Jun 2020 17:08:28 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 4EB2C11F5F667;
        Wed, 10 Jun 2020 17:08:27 -0700 (PDT)
Date:   Wed, 10 Jun 2020 17:08:26 -0700 (PDT)
Message-Id: <20200610.170826.949931991037316223.davem@davemloft.net>
To:     kuba@kernel.org
Cc:     netdev@vger.kernel.org, vladimir.oltean@nxp.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH net] docs: networkng: convert sja1105's devlink info to
 RTS
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200610235911.426444-1-kuba@kernel.org>
References: <20200610235911.426444-1-kuba@kernel.org>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 10 Jun 2020 17:08:27 -0700 (PDT)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Jakub Kicinski <kuba@kernel.org>
Date: Wed, 10 Jun 2020 16:59:11 -0700

> A new file snuck into the tree after all existing documentation
> was converted to RST. Convert sja1105's devlink info and move
> it where the rest of the drivers are documented.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Applied with Vlad's ack/test tags.

Please integrate those and add a v2 next time in this situation.

Thank you.
