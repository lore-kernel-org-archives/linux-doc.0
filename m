Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 305B2EB64D7
	for <linux-doc@archiver.kernel.org>; Wed, 21 Jun 2023 05:23:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjFUFX1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Jun 2023 01:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjFUFXZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Jun 2023 01:23:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7519810E6;
        Tue, 20 Jun 2023 22:23:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0DAF161418;
        Wed, 21 Jun 2023 05:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997B5C433C0;
        Wed, 21 Jun 2023 05:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687325003;
        bh=D+a2fIP+FvcRNUy0gwO96/Y9cbIf48GeaSC+CFwrUpM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HisZojYCZBzljKy0VjOa+EoQ1/I7zC99q8ha39jZkpNiVLIZ/Gnu5bX2g7g+mnxzL
         lsya92qHek4tX0OagUd/qAOAFVEWfQK0/QZEWE7UzUHSnyMkrutYysrsu4LNrqw+CW
         IepQp421GjTNwMMbq7eNgM6XZbXC4P/k5kGrubUvvtvrUaN9QFTjBomATLpxwwJR6A
         JMN+UQ3dSlYBtmHIZQ7BogzhP0MpHXwE7dLPWXx9u0pN+OY28+Tq1KozNljJCn1MHT
         SH3OeXTYe+1zf83ICvzJT7Vs8dPCHeSdDS1DFIYwS43+F2vsbV/3O2gG7Q+58bCKYU
         WaDBsHlWj94VA==
Date:   Wed, 21 Jun 2023 10:53:18 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     broonie@kernel.org, tiwai@suse.com, corbet@lwn.net,
        alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_plai@quicinc.com,
        quic_mohs@quicinc.com
Subject: Re: [PATCH v3] ALSA: compress: allow setting codec params after next
 track
Message-ID: <ZJKJRnMuYvy7GrsD@matsya>
References: <20230619092805.21649-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230619092805.21649-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 19-06-23, 10:28, Srinivas Kandagatla wrote:
> For gapless playback it is possible that each track can have different
> codec profile with same decoder, for example we have WMA album,
> we may have different tracks as WMA v9, WMA v10 and so on
> 
> Or if DSP's like QDSP have abililty to switch decoders on single stream
> for each track, then this call could be used to set new codec parameters.
> 
> Existing code does not allow to change this profile while doing gapless
> playback.
> 
> Reuse existing SNDRV_COMPRESS_SET_PARAMS to set this new track params along
> some additional checks to enforce proper state machine.
> 
> With this new changes now the user can call SNDRV_COMPRESS_SET_PARAMS
> anytime after setting next track and additional check in write should
> also ensure that params are set before writing new data.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
