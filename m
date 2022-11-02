Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DBE8C433FE
	for <linux-doc@archiver.kernel.org>; Wed,  2 Nov 2022 13:49:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbiKBNtk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Nov 2022 09:49:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbiKBNtj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Nov 2022 09:49:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90FA218E1C
        for <linux-doc@vger.kernel.org>; Wed,  2 Nov 2022 06:49:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2C3B761983
        for <linux-doc@vger.kernel.org>; Wed,  2 Nov 2022 13:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B864C433D6;
        Wed,  2 Nov 2022 13:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667396975;
        bh=Zvx4yfeQGZ9eCYPwW8fT45IdWc04urN5E5aJc6gkJfw=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=tSn0lxVmQy8ecckqIffOcmYwzvd/Af26sNNqK7SGGsbgN2TsALF1Xrzi1ago9kgYk
         yiv7FBv8+VgklCTgW12EolPm6bme8ONf6JGb1Kyp/UcEMcKfj9mmGQCTibjtu/zyin
         TYvbhI1aX1kQPFIFrrvH4vYpwAtLp8GfCX2yI3NklqWkSY7kNc8n/b6Vji7EUZUDnV
         oPRLGCOkVwudz4Y4T2peLVfmcbKdlC4P7/IPKPBAB/h5XNAJMN8Je/fbRo3hdAHO+p
         Qbc55Q39pEIBF2NY+rKSKCnCKON5hjQjPV20Ml3epJZG38M894X79FsFv2vos1OtW6
         p/ZPF+5cDjcbw==
From:   Mark Brown <broonie@kernel.org>
To:     linux-doc@vger.kernel.org,
        Yang Yingliang <yangyingliang@huawei.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>
In-Reply-To: <20221102020716.1397449-1-yangyingliang@huawei.com>
References: <20221102020716.1397449-1-yangyingliang@huawei.com>
Subject: Re: [PATCH] Documentation: devres: add missing REGULATOR helper
Message-Id: <166739697419.88879.16694100840908886479.b4-ty@kernel.org>
Date:   Wed, 02 Nov 2022 13:49:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 2 Nov 2022 10:07:16 +0800, Yang Yingliang wrote:
> Add missing devm_regulator_bulk_get_const() to devres.rst, it's introduced
> by commit 1de452a0edda ("regulator: core: Allow drivers to define their init
> data as const").
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] Documentation: devres: add missing REGULATOR helper
      commit: 692fab0820520f5a400446ab3016a237dca32109

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
