Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3323FC433FE
	for <linux-doc@archiver.kernel.org>; Fri, 21 Oct 2022 04:27:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbiJUE1O (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Oct 2022 00:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbiJUE1N (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Oct 2022 00:27:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C7A1CFC59
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 21:27:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A9AA0B81CFB
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 04:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFACBC433D6;
        Fri, 21 Oct 2022 04:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1666326424;
        bh=lEA8D41O4Dvbvtj+uP02YewUKeaPROpPUVlrhhDc//I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2dw05HYjg8semlwYNPTjYzWwqNd/+j8wBbpF2FIRcDcBihVMs8wDXJ15VBLFSpe8t
         vMFrKx8Fu7OrdmNPouie3gfMi0DAoRRxUBzMk+MEeyIr33Q5BB2f/0HKDx6mwXaGLo
         ySt5M25xvswTqlRUYZdB9SBldYgEyBo2UVNIUL/U=
Date:   Fri, 21 Oct 2022 06:27:53 +0200
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
Subject: Re: [PATCH v5 10/10] gna: add open and close operations on GNA device
Message-ID: <Y1IfySBTBiwog9Vy@kroah.com>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-11-maciej.kwapulinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020175334.1820519-11-maciej.kwapulinski@linux.intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 20, 2022 at 07:53:34PM +0200, Maciej Kwapulinski wrote:
> From: Tomasz Jankowski <tomasz1.jankowski@intel.com>
> 
> Signed-off-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
> Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
> Co-developed-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
> Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
> Co-developed-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
> Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>

That's a lot of people who missed that there is nothing described here
at all :(

Please please please work with the Intel internal kernel developers and
get this all reviewed properly first before sending anything out again.
I want to see their signed-off-by or reviewed-by on them before anything
is sent out again.

thanks,

greg k-h
