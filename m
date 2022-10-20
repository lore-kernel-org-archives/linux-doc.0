Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 388A9C4332F
	for <linux-doc@archiver.kernel.org>; Thu, 20 Oct 2022 18:03:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbiJTSDV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Oct 2022 14:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbiJTSDG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 14:03:06 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 016AE4D4DA
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 11:01:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 28785B82767
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 18:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB06BC433D6;
        Thu, 20 Oct 2022 18:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1666288836;
        bh=D5JDtraM5oIqlp1dCkevIC+UUF5W0hIt1BS/GoCJUhw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hBxVwrpRUwXLcGlGrs4pHE6jkQaNzQZgQLZEb91y8x+DqmP86tLnf26MnJrWgEPrc
         9P4kLjae8qwgiAmiDKbk+aRYQelbJRAGmn2jKEeTyuC7ub21Q+5SYzdexhaTCmg8sv
         XK+HYIokFikQ1+WQ1wTO1fGzlm8qVz77h+dz4A/w=
Date:   Thu, 20 Oct 2022 20:00:32 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
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
        Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
        Tomasz Jankowski <tomasz1.jankowski@intel.com>,
        Jianxun Zhang <jianxun.zhang@linux.intel.com>
Subject: Re: [PATCH v4 01/10] gna: add PCI driver module
Message-ID: <Y1GMwP1OUlhwAp03@kroah.com>
References: <20221020133525.1810728-1-maciej.kwapulinski@intel.com>
 <20221020133525.1810728-2-maciej.kwapulinski@intel.com>
 <Y1FcCDhWiQG2p3wW@kroah.com>
 <f3e777c5-c61c-4820-83dd-9bc33932e9c8@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3e777c5-c61c-4820-83dd-9bc33932e9c8@linux.intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 20, 2022 at 06:11:49PM +0200, Maciej Kwapulinski wrote:
> 
> On 10/20/2022 4:32 PM, Greg Kroah-Hartman wrote:
> > On Thu, Oct 20, 2022 at 03:35:16PM +0200, Kwapulinski, Maciej wrote:
> >> Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
> >> This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.
> > This ensures that we can not do anything with these patches.
> >
> > Now deleted.
> >
> > greg k-h
> 
> 
> indeed,
> 
> sorry about that. When I'm done with smtp server footer I'll send 'PATCH v5' unless you have other suggestion for best practice in this case.

I am not even allowed to look at any of this at the moment with that
footer.  Actually I wasn't even supposed to tell you this, I should have
been forced to just delete it and move on to contributions that don't
have legal entraptments in them :(

greg k-h
