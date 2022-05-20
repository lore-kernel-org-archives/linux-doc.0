Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF061C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 20 May 2022 01:50:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344606AbiETBuT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 May 2022 21:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344616AbiETBuR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 May 2022 21:50:17 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F7E9E64FC;
        Thu, 19 May 2022 18:50:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AB527B82975;
        Fri, 20 May 2022 01:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B0FCC34118;
        Fri, 20 May 2022 01:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653011413;
        bh=E7GBdROqZCjUR1kXWz8yrJhSyZpblJjxjJD7JLC3ErY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=aF/KeaYTVVkN8nxWfBZIGq5NzT1sxRb1miWyePEMl7Ne/DptwiKRrW0F6TfkiRGRv
         iU5q4UOu3MvVmgxUl+CDne5G7PZAe5w0LjNkdHmEHT4nczyjiyXuPRLN8C+oNaLgbJ
         GxMmTnTuHtNH66N3/gc1DTm1nmFgdB7IN4K08vP8kpokT/mZU+QhVhLa8LjPqooogv
         jfmrShcnbagwwG5FVfXg5rplmuyMrfA0eNDPDNMFNP7oWpZk7qby7uSsQ/RbcoKYKC
         sFKlpp9tJFR5pNkZesVSU0mYDgSDCyi4jllJFawEwHpfIBFEewQ0Q34PRVaMk/22kg
         2JOoK2TRqr8ZQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4C1A6F0393C;
        Fri, 20 May 2022 01:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] docs: change the title of networking docs
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <165301141330.6731.10364509102017328968.git-patchwork-notify@kernel.org>
Date:   Fri, 20 May 2022 01:50:13 +0000
References: <20220518234346.2088436-1-kuba@kernel.org>
In-Reply-To: <20220518234346.2088436-1-kuba@kernel.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, corbet@lwn.net, linux-doc@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 18 May 2022 16:43:46 -0700 you wrote:
> The current title of our section of the documentation is
> Linux Networking Documentation. Since we're describing
> a section of Linux Documentation repeating those two
> words seems redundant.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net-next] docs: change the title of networking docs
    https://git.kernel.org/netdev/net-next/c/7ebe52f555de

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


