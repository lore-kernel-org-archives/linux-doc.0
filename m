Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92666C433FE
	for <linux-doc@archiver.kernel.org>; Fri, 21 Oct 2022 04:17:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbiJUERb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Oct 2022 00:17:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbiJUERH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Oct 2022 00:17:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C918D1581B9
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 21:16:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9C9BEB8298C
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 04:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBBD2C433D7;
        Fri, 21 Oct 2022 04:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1666325800;
        bh=V44Fb37Gk/IRATv2q8lccI9uCOsN0rpz6zMLSHqgP/E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BywAWAlmCCAghEX2A8uiz0CFjf0AcST7LkHu7DnOAWh438XupNzsXdPLvJc638VjU
         ubvbKsYsOwp5Fv9zq5XQLLtnOyanxhRmL7Ng6n2NS5P7AGldxvq2ImiHGLDXF9jfPG
         SJZyNNYLTtXRIeaADz7AGKxYi+rI2mMm+w3+KobY=
Date:   Fri, 21 Oct 2022 06:17:29 +0200
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
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 00/10] Driver of Intel(R) Gaussian & Neural Accelerator
Message-ID: <Y1IdWVSgWhHZJ78X@kroah.com>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 20, 2022 at 07:53:24PM +0200, Maciej Kwapulinski wrote:
> Dear kernel maintainers,

<snip>

This really is v6, not v5, right?  Why send 2 v5 out?

greg k-h
