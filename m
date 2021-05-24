Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43F6C47080
	for <linux-doc@archiver.kernel.org>; Mon, 24 May 2021 01:00:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B53FD611CB
	for <linux-doc@archiver.kernel.org>; Mon, 24 May 2021 01:00:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232060AbhEXBBi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 23 May 2021 21:01:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:42388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232050AbhEXBBg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 23 May 2021 21:01:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9792F611CC;
        Mon, 24 May 2021 01:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621818009;
        bh=IJCBZy0bLfcVnY1Igy7njpQmormYRMAMJFq6XLkGtdI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=a7wB2czDoCf5Obt5PsguKxQ04dRSQciM8em+pDQ0xXV7eiTUitgw2ER45oXHd8wqE
         HsLT0q5VsCUxi44UdHz+qbHfHgIM9x7noc78NqlFwGDGJliMA2bAFXcuR2oWyuhj/t
         TpQZp20ObSfXUdrk6qTRE6XfzNXCNCVLOFxsMT15SL1pzEdCepW/8vCdJ8HOflTzdk
         A0NuuWTjHQaGG6z5s/Vz6qdPcraqraUjTGmg8GqsMrSPAplVBlhYJfPem+hLelKUCY
         uPBDTdwtFEs3xjQ8ifEnp34ExfHzfekp+UX6k2lhhMoEQa5Zkp7Yplg/cpSrOY/lLN
         qvvwbxRzVEIUg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] NFC: nfcmrvl: fix kernel-doc syntax in file headers
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162181800956.10357.9521863900425218837.git-patchwork-notify@kernel.org>
Date:   Mon, 24 May 2021 01:00:09 +0000
References: <20210523210909.5359-1-yashsri421@gmail.com>
In-Reply-To: <20210523210909.5359-1-yashsri421@gmail.com>
To:     Aditya Srivastava <yashsri421@gmail.com>
Cc:     krzysztof.kozlowski@canonical.com, lukas.bulwahn@gmail.com,
        rdunlap@infradead.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-nfc@lists.01.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Mon, 24 May 2021 02:39:09 +0530 you wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> The header for drivers/nfc/nfcmrvl follows this syntax, but the content
> inside does not comply with kernel-doc.
> 
> This line was probably not meant for kernel-doc parsing, but is parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warnings from kernel-doc.
> For e.g., running scripts/kernel-doc -none on drivers/nfc/nfcmrvl/spi.c
> causes warning:
> warning: expecting prototype for Marvell NFC(). Prototype was for SPI_WAIT_HANDSHAKE() instead
> 
> [...]

Here is the summary with links:
  - NFC: nfcmrvl: fix kernel-doc syntax in file headers
    https://git.kernel.org/netdev/net/c/4dd649d130c6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


