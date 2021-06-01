Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9990C47080
	for <linux-doc@archiver.kernel.org>; Tue,  1 Jun 2021 08:52:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1939613AB
	for <linux-doc@archiver.kernel.org>; Tue,  1 Jun 2021 08:52:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233336AbhFAIyV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Jun 2021 04:54:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:51552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231139AbhFAIyU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 1 Jun 2021 04:54:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1E6F610A0;
        Tue,  1 Jun 2021 08:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622537559;
        bh=8a14SexF0VfpNwXP+zIc3awUdTFy5l9yf6WZSfXTd4I=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=SeAPSMEr+/bCDKDRlUBdS2SixGDGFDoxzjMGL257ErWVAa6CU94zH6YlMgBwVP6fD
         SpbeV3ZC0hIEOxiUjQFDRqnrVF/VcgVSlZU6hHeTH9PVJRgo53rY6JoDbo42y+AP2D
         sUKDU2UUXeeJFvA5FQpGAjHdKxI8daTDoXP4uFFMVhK+AzBwmruEcgr+gd89tJ4nQu
         qpAVfGrH4z/qYfZ/Sn+kmTREboFJLQiJzCJw9/aAQrTyXBmbQ6afiEbsGm2y/0v79A
         38UkEHYcvRADeqz7r6fyPJQhC6jtzLKJQNIIuGlarAT6pw+iVTHSYnVpo+zC6mzJag
         myVcGfquSdlIw==
Message-ID: <813942f4864d87ef0b9c5dff98c23c919bdd88a9.camel@kernel.org>
Subject: Re: [PATCH v2 09/12] drm/vc4: hdmi: Remove firmware logic for MAI
 threshold setting
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
Date:   Tue, 01 Jun 2021 10:52:31 +0200
In-Reply-To: <20210525132354.297468-10-maxime@cerno.tech>
References: <20210525132354.297468-1-maxime@cerno.tech>
         <20210525132354.297468-10-maxime@cerno.tech>
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
> This was a workaround for bugs in hardware on earlier Pi models
> and wasn't totally successful.

What's to expect sound wise on older RPis?

Regards,
Nicolas

