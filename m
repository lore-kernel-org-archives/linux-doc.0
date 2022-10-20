Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19723C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 20 Oct 2022 14:10:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbiJTOK0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Oct 2022 10:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbiJTOKW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 10:10:22 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1015A99D3
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 07:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=dMCp05btcuXI/Vfak0Ns1kY73Ihp5xchTPYYZ+OGg34=; b=XEZ8Biow+m57ff3XRSiN+XBAlM
        b7wiEvsr4zNVIIrCLWESrBFQsEArMsDSsApERTbqf97n+Jfs9Dwy4OGX7mKBWideZ/4ZHaviHkIo/
        4Jfh8Wa3Tm9T3zf4jEDa1dcO7izgfr3ZvdySRPVhPya+RpMyUqbR2uWtVh1oSRTPbB+elEQjyVqdH
        /rVbVzbUwvOfc5x3ULxrgdvrppDuTZ51XMEVOmwP8b+8HyEdg+xjui4osAOMFL4eXFKt3Nxd0E8LG
        yYd2ooyFJEtvQOk+/i8G5xtOOrDa/VRlYoLBJenPjocIVPf9nI7oTbfChVgTmwoQLC8O/IQtqyXaZ
        nDW4o4aw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1olWFC-00CQkT-DY; Thu, 20 Oct 2022 14:09:58 +0000
Date:   Thu, 20 Oct 2022 15:09:58 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     "Kwapulinski, Maciej" <maciej.kwapulinski@intel.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
        Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
        Tomasz Jankowski <tomasz1.jankowski@intel.com>,
        Jianxun Zhang <jianxun.zhang@linux.intel.com>
Subject: Re: [PATCH v4 01/10] gna: add PCI driver module
Message-ID: <Y1FWtqtX7QSafbGt@casper.infradead.org>
References: <20221020133525.1810728-1-maciej.kwapulinski@intel.com>
 <20221020133525.1810728-2-maciej.kwapulinski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020133525.1810728-2-maciej.kwapulinski@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 20, 2022 at 03:35:16PM +0200, Kwapulinski, Maciej wrote:
> +++ b/drivers/gpu/drm/gna/Kconfig
> @@ -0,0 +1,12 @@
> +#
> +# Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA)
> +#
> +
> +config DRM_GNA
> +	tristate "Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA)"
> +	depends on X86 && PCI
> +  help

This is mangled; 'help' should be indented by a tab, not two spaces.

