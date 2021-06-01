Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D739C4708F
	for <linux-doc@archiver.kernel.org>; Tue,  1 Jun 2021 08:46:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12B3261396
	for <linux-doc@archiver.kernel.org>; Tue,  1 Jun 2021 08:46:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233652AbhFAIrz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Jun 2021 04:47:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:44624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233792AbhFAIrl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 1 Jun 2021 04:47:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60BC061370;
        Tue,  1 Jun 2021 08:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622537158;
        bh=iRLwwh/jf6neXOQQgfnhI6BrCzqxxsNJFTOUKbWjbxU=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=sIrl/fVjSuZJc/8yYTG/dJgXF2S6Ulce6iDkG+5AKFvWM2npcdzHGjvr/bhghCsZF
         gpJE2khsRcmBOfZpvtpHnKPnhJQHPS2ueehX2SI7BCGwJn5gNg09TOyvmk6VwPasQl
         hGz0UQs7t1mG2u7JfCBEfI4j+86J1KWkdEbM9wydpaBKZ1jeprBZzT+74L3/Y/jb2O
         jQalFjmxg6vOnopGnjuRLf6MOjheSfjBdCke3btHg+vBqi+MHF4SVyhI5S8Ijoj8kx
         EcGYGkt1N+lSF8t2cp9YYGCDZOIMGva80GMffTImgfkezk7SLoDtdDjkDKonezD74D
         d9pZAvCCOVmCg==
Message-ID: <4552aaf531b0619a2d7a7cc4bcf2d049c44b4b74.camel@kernel.org>
Subject: Re: [PATCH v2 06/12] drm/vc4: hdmi: Set HD_CTL_WHOLSMP and
 HD_CTL_CHALIGN_SET
From:   nicolas saenz julienne <nsaenz@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>,
        Jaroslav Kysela <perex@perex.cz>,
        Mark Brown <broonie@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>
Cc:     devicetree@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>, linux-doc@vger.kernel.org,
        Eric Anholt <eric@anholt.net>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
        Maxime Ripard <mripard@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-rpi-kernel@lists.infradead.org,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Dom Cobley <popcornmix@gmail.com>
Date:   Tue, 01 Jun 2021 10:45:49 +0200
In-Reply-To: <20210525132354.297468-7-maxime@cerno.tech>
References: <20210525132354.297468-1-maxime@cerno.tech>
         <20210525132354.297468-7-maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 2021-05-25 at 15:23 +0200, Maxime Ripard wrote:
> From: Dom Cobley <popcornmix@gmail.com>
> 
> Symptom is random switching of speakers when using multichannel.
> 
> Repeatedly running speakertest -c8 occasionally starts with
> channels jumbled. This is fixed with HD_CTL_WHOLSMP.
> 
> The other bit looks beneficial and apears harmless in testing so
> I'd suggest adding it too.
> 
> Documentation says: HD_CTL_WHILSMP_SET
> Wait for whole sample. When this bit is set MAI transmit will start
> only when there is at least one whole sample available in the fifo.
> 
> Documentation says: HD_CTL_CHALIGN_SET
> Channel Align When Overflow. This bit is used to realign the audio
> channels in case of an overflow.
> If this bit is set, after the detection of an overflow, equal
> amount of dummy words to the missing words will be written to fifo,
> filling up the broken sample and maintaining alignment.
> 
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Regards,
Nicolas

