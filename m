Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0573C433B4
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 00:00:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84802613CC
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 00:00:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344871AbhDGAAS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 20:00:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:40660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235884AbhDGAAR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Apr 2021 20:00:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id EC4A4613C0;
        Wed,  7 Apr 2021 00:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617753609;
        bh=FxdG5P1hn4py/Sr6fEL0/E/+WNIb9JmJTUvJF6IyG7E=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=uHeNY8yRGEi/x3DZzSeuExfRrLtEp4N8HhIJIdqTdHr9nTpdsVF0QpWfLNUXb52VG
         jPfWkQvOLNjqLN2tx8quc1DeVDIGglVF5jLhvhWFM2unIpdBkRE1JXBPw1rQs2Re4m
         IPtJZdyrGdttf4r2R5S8qCYed1V7rKLfIr80y8wIXjmChwqWiieXQgjqxvBmGUEol6
         LBRFdDc9Am0RdqeHs7bH31+rtYdA0sQnBHGAyzY+kdpgrfoBRp+y3rVxuijkegZtjd
         ZewXC33ecWJI2yfOPBr3K97nRtl7Q143C8QmzLCOxaNLKWKiu4zbrgtbsEyN5j1EL9
         r+zBd60nhR3+g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] docs: ethtool: fix some copy-paste errors
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161775360889.28852.9639455157119665991.git-patchwork-notify@kernel.org>
Date:   Wed, 07 Apr 2021 00:00:08 +0000
References: <20210406225815.1846660-1-kuba@kernel.org>
In-Reply-To: <20210406225815.1846660-1-kuba@kernel.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, mkubecek@suse.cz
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Tue,  6 Apr 2021 15:58:15 -0700 you wrote:
> Fix incorrect documentation. Mostly referring to other objects,
> likely because the text was copied and not adjusted.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  Documentation/networking/ethtool-netlink.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Here is the summary with links:
  - [net] docs: ethtool: fix some copy-paste errors
    https://git.kernel.org/netdev/net/c/5219d6012d46

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


