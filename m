Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C03EC433E0
	for <linux-doc@archiver.kernel.org>; Sat, 30 Jan 2021 09:36:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28E7F64E04
	for <linux-doc@archiver.kernel.org>; Sat, 30 Jan 2021 09:36:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbhA3Jfd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 30 Jan 2021 04:35:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:34538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233370AbhA3DUz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 29 Jan 2021 22:20:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 79C9F60233;
        Sat, 30 Jan 2021 03:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611976806;
        bh=fI4XzswaN5Y5SbCYv/UnpFluVbxxpIZnHVd/jTqTlwI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=jhX3JzI2zKoCr5Jxu1KbSHrDqTMl6D2Z7AJNPODPmcq9tEZDHIruGTCsQsJ8Z+p7X
         BNz0cdF7v23eK5E5FW+l98/YLyviYuqaX5bMUh38qZ4V2cmkqB4W5ntQvDZkvMEW0V
         f00lJzUU3rtf+u+RhaPL9sKAwPBluZtTV5a3+ZywXwRXxybiYZ6CivX5Fy3ckHVWw1
         OuCa9OAmoJG44nHTsTfi46Hc6xWOBPmqGBmdFYievhZiup0u11c+mEIVkOQ1GlJAdc
         PonL8/vjrmH9WXBrTT0/7aKZ2SFDpq2fNdE3Xy3kpgkBCxS/tj8fylI8r5R13k8Rbc
         xHs5smM7DmQVA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] docs: networking: timestamping: fix section title markup
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161197680640.13531.13955253891905307453.git-patchwork-notify@kernel.org>
Date:   Sat, 30 Jan 2021 03:20:06 +0000
References: <20210128111930.29473-1-jlu@pengutronix.de>
In-Reply-To: <20210128111930.29473-1-jlu@pengutronix.de>
To:     Jan Luebbe <jlu@pengutronix.de>
Cc:     davem@davemloft.net, kuba@kernel.org, corbet@lwn.net,
        netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel@pengutronix.de
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Thu, 28 Jan 2021 12:19:30 +0100 you wrote:
> This section was missed during the conversion to ReST, so convert it in the
> same style as the surrounding section titles.
> 
> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> ---
>  Documentation/networking/timestamping.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Here is the summary with links:
  - docs: networking: timestamping: fix section title markup
    https://git.kernel.org/netdev/net-next/c/5daf83846cdb

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


