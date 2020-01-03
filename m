Return-Path: <SRS0=LeVL=2Y=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD7FC2D0C2
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jan 2020 20:29:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A42C8222C3
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jan 2020 20:29:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728460AbgACU3m (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Jan 2020 15:29:42 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:46898 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727221AbgACU3l (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jan 2020 15:29:41 -0500
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 152AA159769E9;
        Fri,  3 Jan 2020 12:29:41 -0800 (PST)
Date:   Fri, 03 Jan 2020 12:29:40 -0800 (PST)
Message-Id: <20200103.122940.871856212421218760.davem@davemloft.net>
To:     linux@armlinux.org.uk
Cc:     andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com,
        corbet@lwn.net, kishon@ti.com, linux-doc@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH net-next 0/2] Fix 10G PHY interface types
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200103115125.GC25745@shell.armlinux.org.uk>
References: <20200103115125.GC25745@shell.armlinux.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Fri, 03 Jan 2020 12:29:41 -0800 (PST)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Date: Fri, 3 Jan 2020 11:51:25 +0000

> Recent discussion has revealed that our current usage of the 10GKR
> phy_interface_t is not correct. This is based on a misunderstanding
> caused in part by the various specifications being difficult to
> obtain. Now that a better understanding has been reached, we ought
> to correct this.
> 
> This series introduce PHY_INTERFACE_MODE_10GBASER to replace the
> existing usage of 10GKR mode, and document their differences in the
> phylib documentation. Then switch PHY, SFP/phylink, the Marvell
> PP2 network driver, and its associated comphy driver over to use
> the correct interface mode. None of the existing platform usage
> was actually using 10GBASE-KR.
 ...

Please address Andrew's feedback on patch #2 and I'll apply this.

Thanks.
