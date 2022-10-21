Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD907C433FE
	for <linux-doc@archiver.kernel.org>; Fri, 21 Oct 2022 04:22:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbiJUEWj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Oct 2022 00:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbiJUEW2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Oct 2022 00:22:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B8C7158D77
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 21:22:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 38F74616E3
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 04:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1242BC433B5;
        Fri, 21 Oct 2022 04:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1666326145;
        bh=Rc0FDT08kqRBrPP61jL1a3xUfIN4gbtHx9C97hMo4AY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OpNthgSaMm5hL3G3syAVMYAhG4PqY7YF1b3AAqvch8gEgpfOL8g8ZZgcTqKnRE9AY
         yFH94/gaGwqJqlO3O05qahh8hX8Zdq83McAXRnPS3DTJ3Hu5g8uBaQYnO/L0QGNsvt
         Nv8ItXJ3pCfyEV0RK39M1yR+6oSo2XYfoEn6P4z0=
Date:   Fri, 21 Oct 2022 06:23:14 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Tomasz Jankowski <tomasz1.jankowski@intel.com>,
        Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
        Jianxun Zhang <jianxun.zhang@linux.intel.com>
Subject: Re: [PATCH v5 05/10] gna: add GNA_GET_PARAMETER ioctl
Message-ID: <Y1Iesvp3H3Ow4ZaE@kroah.com>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-6-maciej.kwapulinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020175334.1820519-6-maciej.kwapulinski@linux.intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 20, 2022 at 07:53:29PM +0200, Maciej Kwapulinski wrote:
> From: Tomasz Jankowski <tomasz1.jankowski@intel.com>
> 
> As this is first ioctl in the series, the patch also adds common bits for
> remaining ioctls

Again, please read the documentation for what to do here, this is not
helpful at all.

> +int gna_getparam_ioctl(struct drm_device *dev, void *data,
> +		struct drm_file *file)
> +{
> +	struct gna_device *gna_priv = to_gna_device(dev);
> +	union gna_parameter *param = data;
> +
> +	return gna_getparam(gna_priv, param);

Wrong error value returned if you have an invalid ioctl :(

greg k-h
