Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B320C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 20 Oct 2022 14:32:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbiJTOcw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Oct 2022 10:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiJTOcv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 10:32:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D471147061
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 07:32:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 941C861BB8
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 14:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72901C433C1;
        Thu, 20 Oct 2022 14:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1666276362;
        bh=l8mRlTyl0UO/IhFQDUDiO4/SvJneie6Cel0aRrpGM6s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dGI4ZnofU2dmARIN0zCaYY8XtQv9NQ6+q9NIVGIdRY8IJ6BUDR64kRjVxRsOQbqEZ
         E6GBImv39BbsEWc54f1r/94GgHVdWl94F3OxKIf61hTfmd5ln5A7vYGfROatRSpjTZ
         tXBp2Fqj/K+vzXbkYGDuWuksr1hm4aYrY2zEnYbI=
Date:   Thu, 20 Oct 2022 16:32:40 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     "Kwapulinski, Maciej" <maciej.kwapulinski@intel.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
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
        Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
        Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
        Tomasz Jankowski <tomasz1.jankowski@intel.com>,
        Jianxun Zhang <jianxun.zhang@linux.intel.com>
Subject: Re: [PATCH v4 01/10] gna: add PCI driver module
Message-ID: <Y1FcCDhWiQG2p3wW@kroah.com>
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
> Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
> This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.

This ensures that we can not do anything with these patches.

Now deleted.

greg k-h

