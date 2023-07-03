Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6EF2EB64DC
	for <linux-doc@archiver.kernel.org>; Mon,  3 Jul 2023 08:30:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbjGCIaX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Jul 2023 04:30:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjGCIaW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Jul 2023 04:30:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67420DD
        for <linux-doc@vger.kernel.org>; Mon,  3 Jul 2023 01:30:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F025B60E15
        for <linux-doc@vger.kernel.org>; Mon,  3 Jul 2023 08:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C6BAC433C8;
        Mon,  3 Jul 2023 08:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688373020;
        bh=en4IMgzUw/R5Cxp3guHimSlytEJd09sz1saQQhNLWEc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=mOZLIv2mpyvUhA9leIdespQO4uciNkfl7wH8RIxlqQK1xS/1Q/qNGbm8U4+TI0mld
         AeZgGsMxg2BBA/J52jJsLf4fvPRYooH44VPH1CXSxukGESPPzvJfzRIR+A4j8Gm1pB
         nktTkmI8CdnJkTmE9CF4EPGduUX0IFIJSpvrVDmYDQsdGYaEXwbfD1B55VSTIugOdj
         0n3Cyi69Kc5h4okG/UdXVvAJE/LFF+WQuvuPRmUxFq9yBsNDLkpPu2fIftyPZsbczO
         A7qnqee2w1FpLWLvx77dsBR26AYE7zSt+Qo+xMkYAh1E9BgiG9ctfJhiUqFt/qXsD9
         Eu1MU3TTH13YA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3523EC64458;
        Mon,  3 Jul 2023 08:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] Documentation: ABI: sysfs-class-net-qmi: pass_through
 contact update
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168837302021.15739.3452355484748361369.git-patchwork-notify@kernel.org>
Date:   Mon, 03 Jul 2023 08:30:20 +0000
References: <1688109620-23833-1-git-send-email-quic_subashab@quicinc.com>
In-Reply-To: <1688109620-23833-1-git-send-email-quic_subashab@quicinc.com>
To:     Subash Abhinov Kasiviswanathan <quic_subashab@quicinc.com>
Cc:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, corbet@lwn.net, quic_jhugo@quicinc.com,
        dnlplm@gmail.com
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Fri, 30 Jun 2023 01:20:20 -0600 you wrote:
> Switch to the quicinc.com id.
> 
> Fixes: bd1af6b5fffd ("Documentation: ABI: sysfs-class-net-qmi: document pass-through file")
> Signed-off-by: Subash Abhinov Kasiviswanathan <quic_subashab@quicinc.com>
> ---
>  Documentation/ABI/testing/sysfs-class-net-qmi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [net] Documentation: ABI: sysfs-class-net-qmi: pass_through contact update
    https://git.kernel.org/netdev/net/c/acd9755894c9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


