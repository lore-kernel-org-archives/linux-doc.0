Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51012C636CC
	for <linux-doc@archiver.kernel.org>; Wed, 15 Feb 2023 15:00:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbjBOPA2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Feb 2023 10:00:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbjBOPA0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Feb 2023 10:00:26 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D8555AF
        for <linux-doc@vger.kernel.org>; Wed, 15 Feb 2023 07:00:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 2A2B7CE25BD
        for <linux-doc@vger.kernel.org>; Wed, 15 Feb 2023 15:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4E0BC4339B;
        Wed, 15 Feb 2023 15:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676473220;
        bh=bFui1Nv/gPLHGVLgr6OZmJgykMB4++rCHmtubzlyLKg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=is71kKYLPs3i17aVGQPtOB9ltgLTwSX6Bw0xwAAoMxOZH7esJVYw9mAF/k53UTAao
         MulL4EMd9x+U2pP4C/Y+jBpSriRp8DoyBjoT8L0Ala6YeJdSGoWb+h9JFtfISFu2uY
         ATZ0pkyAO7/UYTd3KiZfuDqPnfSuT3KYblz9bNd0MzNyxOsAbvWOPnSeRHEIFFQRcc
         IGWIAz1YB3ncsz9c7GiEmz3adnK/BFB1fSMS38rm5JY8KPQBCzTVay0rR1wfK/2smG
         Z2Xlby9gXOCeO7Tk+nYJXTPxioI3xscf7WwRq9xnWPn6OSfH8/kzNbC+zyD/BWYPV0
         qMItikgPg+GqQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8854DE29F41;
        Wed, 15 Feb 2023 15:00:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Documentation: riscv: fix insufficient list item indent
From:   patchwork-bot+linux-riscv@kernel.org
Message-Id: <167647322055.11521.14296165976216354601.git-patchwork-notify@kernel.org>
Date:   Wed, 15 Feb 2023 15:00:20 +0000
References: <20230129235701.2393241-1-conor@kernel.org>
In-Reply-To: <20230129235701.2393241-1-conor@kernel.org>
To:     Conor Dooley <conor@kernel.org>
Cc:     linux-riscv@lists.infradead.org, palmer@dabbelt.com,
        conor.dooley@microchip.com, linux-doc@vger.kernel.org,
        corbet@lwn.net, lkp@intel.com
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sun, 29 Jan 2023 23:57:01 +0000 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> When adding the ISA string ordering rules, I didn't sufficiently indent
> one of the list items.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA string ordering in /proc/cpuinfo")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> [...]

Here is the summary with links:
  - Documentation: riscv: fix insufficient list item indent
    https://git.kernel.org/riscv/c/2a5303b499b1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


