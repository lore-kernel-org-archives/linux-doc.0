Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 798B6CA1008
	for <linux-doc@archiver.kernel.org>; Tue,  5 Sep 2023 20:52:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243926AbjIEUw2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Sep 2023 16:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbjIEUw1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Sep 2023 16:52:27 -0400
X-Greylist: delayed 551 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 05 Sep 2023 13:52:24 PDT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 770C9132;
        Tue,  5 Sep 2023 13:52:24 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0EEBC433CA;
        Tue,  5 Sep 2023 20:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693946593;
        bh=596bIH4ANHD6bp46x19FKqJe+KCWuiHOsg2nWgtC1kA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=XbIL6+SJAgO5/BwU2AHrksaqe8jYFJ/l7c2VCgfKHFwx9OzVhnHh1nE91m+nbGtPd
         3J7Ix+si4xxkY+Yr5QSVkXjBNvxEwIdMmQ3VoXp7chNwPy0UAxMxpe+pOWx0Eo82+P
         ASwvjw/MjGCkFyHbKdlXxmzOUQkFAxud+Djf+Jm9NUIPkXUpg6uSGC0NjakRYeA9yz
         +67VsB1P8QexDJZKQ7Egh6JL9BFNNYue322bBDxHANrRMO1PRLiFR4XpPSzfP/85rB
         KOVZRmAimLeWlRknbRmlzQ8PrFgvw0CuzMVkXRPETEvLQgzmQNvgKoyhFWnmlh0Whd
         deaUv1iNLe5xw==
Date:   Tue, 5 Sep 2023 13:43:11 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Jinjian Song <songjinjian@hotmail.com>
Cc:     davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
        corbet@lwn.net, loic.poulain@linaro.org, ryazanov.s.a@gmail.com,
        jiri@resnulli.us, johannes@sipsolutions.net,
        chandrashekar.devegowda@intel.com, linuxwwan@intel.com,
        chiranjeevi.rapolu@linux.intel.com, haijun.liu@mediatek.com,
        m.chetan.kumar@linux.intel.com, ricardo.martinez@linux.intel.com,
        netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, nmarupaka@google.com,
        vsankar@lenovo.com, danielwinkler@google.com
Subject: Re: [net-next v3 0/5] net: wwan: t7xx: fw flashing & coredump
 support
Message-ID: <20230905134311.6534e0eb@kernel.org>
In-Reply-To: <MEYP282MB2697DB3C2C854F72A78BE7F4BBE8A@MEYP282MB2697.AUSP282.PROD.OUTLOOK.COM>
References: <MEYP282MB2697DB3C2C854F72A78BE7F4BBE8A@MEYP282MB2697.AUSP282.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue,  5 Sep 2023 19:26:32 +0800 Jinjian Song wrote:
> Adds support for t7xx wwan device firmware flashing & coredump collection
> using devlink.
> 
> On early detection of wwan device in fastboot mode driver sets up CLDMA0 HW
> tx/rx queues for raw data transfer and then registers to devlink framework.
> On user space application issuing command for firmware update the driver
> sends fastboot flash command & firmware to program NAND.

## Form letter - net-next-closed

The merge window for v6.6 has begun and therefore net-next is closed
for new drivers, features, code refactoring and optimizations.
We are currently accepting bug fixes only.

Please repost when net-next reopens after Sept 11th.

RFC patches sent for review only are obviously welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer

