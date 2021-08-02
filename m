Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86419C432BE
	for <linux-doc@archiver.kernel.org>; Mon,  2 Aug 2021 14:20:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CDA760F36
	for <linux-doc@archiver.kernel.org>; Mon,  2 Aug 2021 14:20:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237110AbhHBOUX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 2 Aug 2021 10:20:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:36668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236681AbhHBOUQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 2 Aug 2021 10:20:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 86B8060F41;
        Mon,  2 Aug 2021 14:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627914006;
        bh=AZq2nWNyN2SgYaPwuPQ0AulvEJ/pAMNAicFNHmIkHzk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=KCsCQYigXZtOE60J6ATFD/9pXW47lmk/Xl4tw9CK8cB1K31quDtb7JlCAfN/0G7kC
         nm4tp3h7dZeixJY5L7Tb8cuosNdQ/j9w9XQD6juvYB6I5CBbZR0pgxev/7Ajb3R0z2
         wBIvgMAFbl55kEpnP9K3NPeX9Cdsd8em6siR5lhBHxu7q1qrO4LsHj95+fWEiHRUBh
         iKZzgYD6+hkfSgN5ObZgwgZ84eiEusN3431FZlJvAvCM0lriiwgSMa/8wzOy0Dpddv
         J+qZ954i4x8UNoLoRrEgDa+T0nvC53USRP/RKbXFjiMEQz3nHahf8SHu47L+kmFN5c
         6ZcN19akXhPcQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] docs: operstates: fix typo
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162791400651.18419.13501802474684889553.git-patchwork-notify@kernel.org>
Date:   Mon, 02 Aug 2021 14:20:06 +0000
References: <20210731144007.994515-1-kuba@kernel.org>
In-Reply-To: <20210731144007.994515-1-kuba@kernel.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Sat, 31 Jul 2021 07:40:07 -0700 you wrote:
> TVL -> TLV
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  Documentation/networking/operstates.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [net] docs: operstates: fix typo
    https://git.kernel.org/netdev/net/c/66e0da217283

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


