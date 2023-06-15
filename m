Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55323EB64DA
	for <linux-doc@archiver.kernel.org>; Thu, 15 Jun 2023 17:20:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238484AbjFORUX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Jun 2023 13:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbjFORUX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Jun 2023 13:20:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40630270C
        for <linux-doc@vger.kernel.org>; Thu, 15 Jun 2023 10:20:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CF61B614F0
        for <linux-doc@vger.kernel.org>; Thu, 15 Jun 2023 17:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3262DC433C9;
        Thu, 15 Jun 2023 17:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686849621;
        bh=8HcCCoHWF4ekjLwxHQjTpZFheFFCm2IRjeJ5OsPAf20=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=oTTMq5PuQcV+kvtLwmIsT/6bcAbf+zhNBaRXzaI4e29nsJhPg99ZLFd+KZnhtxsco
         kItEQwAJK6xS8qGKB0fICCEkXPGo7tkY3m2KEIEHwomdN7DAWkvBXC8tbbMMFUcoKA
         CWG0+6oc/Z7IkW0STkjo0S0IPK4mMRyNilO2FZhs6b7jwAIdUqs65T3u8vyaz3wGSM
         gnZxGo2FWNNNVz0/eMP4HcsK0CAEBEfbNvCh0uFOhz4v3nXvlcV5wPnmBUsACB2api
         ZPa8pmAxDEZbYv5uAT9h5Cu9g1gpid0QP5cvl4h+Dpha2jPbLj0jBW3X722mthN9tO
         +e2SlJSfHlSGQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0F6B7C64458;
        Thu, 15 Jun 2023 17:20:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] Documentation: RISC-V: patch-acceptance: mention
 patchwork's role
From:   patchwork-bot+linux-riscv@kernel.org
Message-Id: <168684962105.16910.15134304668253401668.git-patchwork-notify@kernel.org>
Date:   Thu, 15 Jun 2023 17:20:21 +0000
References: <20230606-rehab-monsoon-12c17bbe08e3@wendy>
In-Reply-To: <20230606-rehab-monsoon-12c17bbe08e3@wendy>
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     linux-riscv@lists.infradead.org, palmer@dabbelt.com,
        conor@kernel.org, bjorn@kernel.org, paul.walmsley@sifive.com,
        corbet@lwn.net, linux-doc@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 6 Jun 2023 07:59:19 +0100 you wrote:
> Palmer suggested at some point, not sure if it was in one of the
> weekly linux-riscv syncs, or a conversation at FOSDEM, that we
> should document the role of the automation running on our patchwork
> instance plays in patch acceptance.
> 
> Add a short note to the patch-acceptance document to that end.
> 
> [...]

Here is the summary with links:
  - [v2] Documentation: RISC-V: patch-acceptance: mention patchwork's role
    https://git.kernel.org/riscv/c/b104dbedbe61

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


