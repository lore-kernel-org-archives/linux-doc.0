Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C56AC433EF
	for <linux-doc@archiver.kernel.org>; Tue,  7 Dec 2021 15:10:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238680AbhLGPNd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Dec 2021 10:13:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238580AbhLGPNX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Dec 2021 10:13:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9949AC0617A2
        for <linux-doc@vger.kernel.org>; Tue,  7 Dec 2021 07:09:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 65F84B8181B
        for <linux-doc@vger.kernel.org>; Tue,  7 Dec 2021 15:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0260CC341C5;
        Tue,  7 Dec 2021 15:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638889789;
        bh=0A4Rcpz0Y2MbWmrhe/yNHdm2sRqtZ9tjazyQe2Aryds=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=GVuZbfFJAWLR1gD5RejQkqo246YVhe5kpsvmrJ1y+Ex2H/Fg/JSdQlZoiiQdEK99I
         BMjsW4DyjA4aSURfMEM+GWhmah29X+C6ulUKlDBqiIB3BWgE9tyQPHCyCrqM2bKCVX
         87JSwI6RO4UjVfYCBl4TENtjy4JluqQTtLmuLprBH8nGtcd/BT9xWnrBuYENwulusm
         De72OdgebRMuHE9NFHy1TdE9h2088HFAPW26XxCFCTi0ETJ/MZNyIg/RvNhDbU9+IV
         4bgI6AIZvs2bujFmg/93CXd7aED1O0AWjN+aSriZF/9B642MUHvOhChVnJANXUN1Va
         94YGh9aBCcerQ==
From:   Mark Brown <broonie@kernel.org>
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     lgirdwood@gmail.com, chenhuacai@kernel.org,
        Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        linux-doc@vger.kernel.org
In-Reply-To: <20211207123230.2262047-1-siyanteng@loongson.cn>
References: <20211207123230.2262047-1-siyanteng@loongson.cn>
Subject: Re: [PATCH v2] regulato: fix bullet lists of regulator_ops comment
Message-Id: <163888978772.1135191.18013300450809247521.b4-ty@kernel.org>
Date:   Tue, 07 Dec 2021 15:09:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 7 Dec 2021 20:32:30 +0800, Yanteng Si wrote:
> Since 89a6a5e56c82("regulator: add property parsing and callbacks to set protection limits")
> which introduced a warning:
> 
> Documentation/driver-api/regulator:166: ./include/linux/regulator/driver.h:96: WARNING: Unexpected indentation.
> Documentation/driver-api/regulator:166: ./include/linux/regulator/driver.h:98: WARNING: Block quote ends without a blank line; unexpected unindent.
> 
> Let's fix them.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulato: fix bullet lists of regulator_ops comment
      commit: 8d9f738f16a3ee9f2341578873c542ddd9802fe4

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
