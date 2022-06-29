Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B98B4C43334
	for <linux-doc@archiver.kernel.org>; Wed, 29 Jun 2022 13:06:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231549AbiF2NGJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 29 Jun 2022 09:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231687AbiF2NGI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Jun 2022 09:06:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7C2D2CCAC
        for <linux-doc@vger.kernel.org>; Wed, 29 Jun 2022 06:06:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4060C61DE8
        for <linux-doc@vger.kernel.org>; Wed, 29 Jun 2022 13:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9DEC341CB;
        Wed, 29 Jun 2022 13:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656507962;
        bh=N32uSPu3EtNEptJhBogV/ogjkAX7TnX7yvm7ck5YAWQ=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=gzHWbRkYwbx24y9LJruP9AkpJ1CUe6iBcRGu3s7pPuQzUxrTQsd2wpumX9sB+DVYR
         vh07XufcvGu0qGX1scyh3Lf2B0+PNwjdk2UeYEDy2oraxeWLjF+YTM5yVHx1q7GwuA
         4PSmfO/okQFYKTA/THthxGG2yOuIKX812dETW1bHurrK48T373vKmy+tN0IPd/gfaj
         BVCFdceIpD8Yg79tX4qm41i2DBomJ2NXGDQj8cPh3jnPrJA+WO1yxmaXtN/ui/eW1z
         e6d2McGrRAKfA9ILnpENOb/kNkWD9tNCwIcXhE5mSvbseP9JNN3V0ZUwwqrXFJQS+v
         983G4sCF/2Hrg==
From:   Mark Brown <broonie@kernel.org>
To:     alsa-devel@alsa-project.org, marex@denx.de
Cc:     tiwai@suse.de, perex@perex.cz, linux-doc@vger.kernel.org
In-Reply-To: <20220628165840.152235-1-marex@denx.de>
References: <20220628165840.152235-1-marex@denx.de>
Subject: Re: [PATCH] ASoC: doc: Capitalize RESET line name
Message-Id: <165650796136.1089020.10280239824537087786.b4-ty@kernel.org>
Date:   Wed, 29 Jun 2022 14:06:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 28 Jun 2022 18:58:40 +0200, Marek Vasut wrote:
> Make sure all AC97 interface lines are spelled in capitals,
> to avoid confusing readers about where the 5th line is.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: doc: Capitalize RESET line name
      commit: db7bc2741a2aca91b9a4df1bb03e4997a0e90807

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
