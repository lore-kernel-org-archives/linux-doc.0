Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2AC0C4332F
	for <linux-doc@archiver.kernel.org>; Fri, 21 Oct 2022 08:27:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbiJUI1d (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Oct 2022 04:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbiJUI1Y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Oct 2022 04:27:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27D6F170DE4
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 01:27:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0F36A61DFB
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 08:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66C3C433D7;
        Fri, 21 Oct 2022 08:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1666340840;
        bh=7ZxoYK8HOALCQPoUSmoOdfoXqPofWoWwhh5tzgb9b0o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U61pf1Ot4LFYA+cDK/4uMCPCBBHBEJTkaU2P+3nrvxzox5krMLmha7yTJRlx/ZjOf
         qHXQDggo1ZuYibhGWMIuLOr8zd7y72bhyLr8Xbsqz1ux2xkoYPn8Zi2pUf2l8scQlo
         dKMKz9R4HNmIOPU/xYFTf2U5xOV1Dt/8VHxMh8EM=
Date:   Fri, 21 Oct 2022 10:27:17 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
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
        Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
        Tomasz Jankowski <tomasz1.jankowski@intel.com>,
        Jianxun Zhang <jianxun.zhang@linux.intel.com>
Subject: Re: [PATCH v5 01/10] gna: add PCI driver module
Message-ID: <Y1JX5WlGm218/TOk@kroah.com>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-2-maciej.kwapulinski@linux.intel.com>
 <Y1IeJplXNHM+VvCJ@kroah.com>
 <12aeed77-081c-ac40-4b6e-0415d551804e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12aeed77-081c-ac40-4b6e-0415d551804e@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 21, 2022 at 03:10:06PM +0700, Bagas Sanjaya wrote:
> On 10/21/22 11:20, Greg Kroah-Hartman wrote:
> > On Thu, Oct 20, 2022 at 07:53:25PM +0200, Maciej Kwapulinski wrote:
> >> Add a new PCI driver for Intel(R) Gaussian & Neural Accelerator
> > 
> > Please drop all of the (R) stuff in here, and in the Kconfig file and in
> > the .c files.  If your lawyers insist on it, please point them at me and
> > I will be glad to discuss it with them.
> > 
> >>  Documentation/gpu/drivers.rst    |  1 +
> >>  Documentation/gpu/gna.rst        | 64 ++++++++++++++++++++++++++++++++
> > 
> > Why not just put the tiny documentation file in the .c code itself?
> > That way it stays up to date and might actually be noticed?
> > 
> 
> I think the documentation should be on separate patch.

Not if it is in the .c file.
