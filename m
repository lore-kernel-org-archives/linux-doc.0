Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 331ABC83F1D
	for <linux-doc@archiver.kernel.org>; Wed, 30 Aug 2023 18:46:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238283AbjH3Shb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Aug 2023 14:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244559AbjH3NUj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Aug 2023 09:20:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D64CDB;
        Wed, 30 Aug 2023 06:20:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E33EE6210A;
        Wed, 30 Aug 2023 13:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E87D7C433BB;
        Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693401635;
        bh=Rk0PKoJyEZ5+FRNg9NgHMqK2XLSnuE+lrVJYZ51wZv4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=MSVZRLD2fYUKb2eMAH/iloYGZzAMw1SeGca57apnBqdpGujyoYPtNdzUbInPAYrFz
         iGpIEXi4XMveXZN+tb3s3Gz2/9Tr5qpVAmf1TMYBWcBH0NaniNNDvel1j5a2BOc7Ey
         lOGMygkkHRJAnB1w1forSsGfM+5KEjV8/kSL9WMlodzLdaekNwjp2YSeNqnOM4TFrT
         TSJrs8JWa32KdcqouXL3K1f2kIzWg/HU7SjIuuGR/nHFkPwdRr/eLo34u3oqy4kS9S
         YQ07FSm7pXI0C8or5vdvUZlYzNcblvunjYksSy8G+WW0MUe7ZpNPNihRsYT7hTtWGJ
         IAGlghIUyML/g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CF870E29F3D;
        Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH -next v9 0/2] support allocating crashkernel above 4G
 explicitly on riscv
From:   patchwork-bot+linux-riscv@kernel.org
Message-Id: <169340163484.19859.603263749901327950.git-patchwork-notify@kernel.org>
Date:   Wed, 30 Aug 2023 13:20:34 +0000
References: <20230726175000.2536220-1-chenjiahao16@huawei.com>
In-Reply-To: <20230726175000.2536220-1-chenjiahao16@huawei.com>
To:     chenjiahao (C) <chenjiahao16@huawei.com>
Cc:     linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kexec@lists.infradead.org, linux-doc@vger.kernel.org,
        paul.walmsley@sifive.com, palmer@dabbelt.com,
        conor.dooley@microchip.com, guoren@kernel.org, heiko@sntech.de,
        bjorn@rivosinc.com, alex@ghiti.fr, akpm@linux-foundation.org,
        atishp@rivosinc.com, bhe@redhat.com, thunder.leizhen@huawei.com,
        horms@kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 26 Jul 2023 17:49:58 +0000 you wrote:
> On riscv, the current crash kernel allocation logic is trying to
> allocate within 32bit addressible memory region by default, if
> failed, try to allocate without 4G restriction.
> 
> In need of saving DMA zone memory while allocating a relatively large
> crash kernel region, allocating the reserved memory top down in
> high memory, without overlapping the DMA zone, is a mature solution.
> Hence this patchset introduces the parameter option crashkernel=X,[high,low].
> 
> [...]

Here is the summary with links:
  - [-next,v9,1/2] riscv: kdump: Implement crashkernel=X,[high,low]
    https://git.kernel.org/riscv/c/5882e5acf18d
  - [-next,v9,2/2] docs: kdump: Update the crashkernel description for riscv
    https://git.kernel.org/riscv/c/33f0dd973d4e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


