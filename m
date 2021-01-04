Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8975C43381
	for <linux-doc@archiver.kernel.org>; Mon,  4 Jan 2021 21:31:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 958C622509
	for <linux-doc@archiver.kernel.org>; Mon,  4 Jan 2021 21:31:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbhADVat (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 4 Jan 2021 16:30:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:40454 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726246AbhADVat (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 4 Jan 2021 16:30:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 9CCA322273;
        Mon,  4 Jan 2021 21:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609795808;
        bh=HzvYBOK98PlTaEbm96qGzSSodUIIZDjE9+ZnZmW3E6E=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=QQY2lObHW005IFFecga2L7lZ4LxzE+7ML3UsldqcE7g+TUDkN1RbQwYamgl0vO67V
         7Dc/arqoW1LBO3M/m8javoYlohFqbs6xvN9GyS1RYdpWcWL5B9iGMDndRX7aHD6vqK
         kvmRI+o0aWROsJh+OTlZhcJ+nmQREpgKWSXNsMOLujZAFwHghkGAGZc3UaP8fhnTdp
         qINi/LjjEL3B4Eh1pKfj1M3jplYehrbOF7HZqrwhN6eNIz6z9XutFMgK5+xJliGDDE
         mvQ01DjX+u4Q4sq9K1jkXPHi9PmXrn0C0IjoAsHz4RUrpTg40l1N9jPFIh3kLINBMd
         1bqMT4IhVat6w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] docs: networking: packet_mmap: fix formatting for C
 macros
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <160979580858.407.15734291422142555141.git-patchwork-notify@kernel.org>
Date:   Mon, 04 Jan 2021 21:30:08 +0000
References: <5cb47005e7a59b64299e038827e295822193384c.1609232919.git.baruch@tkos.co.il>
In-Reply-To: <5cb47005e7a59b64299e038827e295822193384c.1609232919.git.baruch@tkos.co.il>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     davem@davemloft.net, kuba@kernel.org, corbet@lwn.net,
        netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        uaca@alumni.uv.es, willemdebruijn.kernel@gmail.com
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

This series was applied to netdev/net.git (refs/heads/master):

On Tue, 29 Dec 2020 11:08:38 +0200 you wrote:
> The citation of macro definitions should appear in a code block.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  Documentation/networking/packet_mmap.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [v2,1/2] docs: networking: packet_mmap: fix formatting for C macros
    https://git.kernel.org/netdev/net/c/17e94567c57d
  - [v2,2/2] docs: networking: packet_mmap: fix old config reference
    https://git.kernel.org/netdev/net/c/e4da63cda51f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


