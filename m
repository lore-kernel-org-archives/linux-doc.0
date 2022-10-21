Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62178C433FE
	for <linux-doc@archiver.kernel.org>; Fri, 21 Oct 2022 04:25:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbiJUEZP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Oct 2022 00:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiJUEZO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Oct 2022 00:25:14 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51E1AAD985
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 21:25:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 11377B8291B
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 04:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23BD3C433C1;
        Fri, 21 Oct 2022 04:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1666326310;
        bh=Wy2yXTuo4Kt3OsucQbZR+6JaTdyrJNPegvCKC+NPjT0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cVAFNFCWsCSCgWBWrmMhXpMMOS9zHJlsZIDHnPANytOGXYSYTa04H834oQMDNDSEq
         Rt4b/ycRVTd/Dyum50s8o0hTy+MZXoYLl6wUgxXDIaEfWRXmS+w8IZKvMt9IDc4LBn
         nQV8h/HREeqUvyM7/qaThCaoCloXcJq0ekVRQ7ws=
Date:   Fri, 21 Oct 2022 06:25:59 +0200
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
        Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
Subject: Re: [PATCH v5 02/10] gna: add GNA DRM device
Message-ID: <Y1IfV5zdh04yIqr7@kroah.com>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-3-maciej.kwapulinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020175334.1820519-3-maciej.kwapulinski@linux.intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 20, 2022 at 07:53:26PM +0200, Maciej Kwapulinski wrote:
> Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
> Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>

Obviously we can not take patches without any changelog text at all.

And neither would you want us to.

Again, would you want to review this patch?

thanks,

greg k-h
