Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C693AC4321E
	for <linux-doc@archiver.kernel.org>; Fri,  2 Dec 2022 11:20:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233096AbiLBLUZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Dec 2022 06:20:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233067AbiLBLUX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Dec 2022 06:20:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAC3B7F8A4;
        Fri,  2 Dec 2022 03:20:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 89FB4B82142;
        Fri,  2 Dec 2022 11:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BEC6C433D7;
        Fri,  2 Dec 2022 11:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669980017;
        bh=ZijqJ5Y0fEiCwwKbkuv4C73PUtqmtzIwS7+w0AJ7XFg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=lsGMj0R/aGek2z1UyvEyzjVn/8PAuj9lv4d97bptECd2JSPwoU26LbKfOUkjiOT0i
         7IIEnboOKUClUoo96xZ7ToiNaoIEuArziy2kna3Mm+SiHJBv7WPBXrtqJXF8C1ZPQO
         8S/ShEVjbt1kzhqkcUo/oFEgIDJLNjvvRwatiCV7ckS9Qc70Py8bdxkUPkWmjpM5JH
         GVdD8T9WfXhtwxpWWMorEVv827prU/ZHOtGDJ9R8MMeuSRdY6GDwKgelZ2cES3sFJP
         LqTPu/NRNFyDJn7+HXJVPVw5gzPgm26AWcjwx9VtFZre6LIjYROA8J8jKwnG0MfPcQ
         81UofL3lMHz+Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2B93BE450B4;
        Fri,  2 Dec 2022 11:20:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 1/2] Documentation: bonding: update miimon default to
 100
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <166998001717.12503.6133600119187941184.git-patchwork-notify@kernel.org>
Date:   Fri, 02 Dec 2022 11:20:17 +0000
References: <4c3f4f0b8f4a8cd3c104d58c106b97ce5f180bc1.1669839127.git.jtoppins@redhat.com>
In-Reply-To: <4c3f4f0b8f4a8cd3c104d58c106b97ce5f180bc1.1669839127.git.jtoppins@redhat.com>
To:     Jonathan Toppins <jtoppins@redhat.com>
Cc:     netdev@vger.kernel.org, j.vosburgh@gmail.com, vfalico@gmail.com,
        andy@greyhouse.net, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, corbet@lwn.net,
        maheshb@google.com, jarod@redhat.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Wed, 30 Nov 2022 15:12:06 -0500 you wrote:
> With commit c1f897ce186a ("bonding: set default miimon value for non-arp
> modes if not set") the miimon default was changed from zero to 100 if
> arp_interval is also zero. Document this fact in bonding.rst.
> 
> Fixes: c1f897ce186a ("bonding: set default miimon value for non-arp modes if not set")
> Signed-off-by: Jonathan Toppins <jtoppins@redhat.com>
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] Documentation: bonding: update miimon default to 100
    https://git.kernel.org/netdev/net-next/c/f036b97da67f
  - [net-next,2/2] Documentation: bonding: correct xmit hash steps
    https://git.kernel.org/netdev/net-next/c/95cce3fae4d9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


