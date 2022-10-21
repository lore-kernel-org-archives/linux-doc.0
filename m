Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D06C4332F
	for <linux-doc@archiver.kernel.org>; Fri, 21 Oct 2022 04:24:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbiJUEYq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Oct 2022 00:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiJUEYo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Oct 2022 00:24:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B3CB167EE
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 21:24:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EDC7E616E3
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 04:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C90CFC433C1;
        Fri, 21 Oct 2022 04:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1666326275;
        bh=UmX8ef2JDQIqTzvwh9bE+uP68tS+yRb7stDvk5PBVrM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2CvdGBilt0mBkjLTnjXi3sBHe2XnnlzEkL56JSnnVayhWp0aFfCF7+gDmDQpdutlJ
         9Nip1+EwL32EyjWyr6+zyK+MmIDSXy9gVD3UPPbVdLjB5VmRtDlh5kJAMMgVBX/S+I
         4z8QDr0fEYFVLPtJ1G0FmhPaUi3W5gXcFFkfP3pw=
Date:   Fri, 21 Oct 2022 06:25:24 +0200
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
        Anisha Dattatraya Kulkarni 
        <anisha.dattatraya.kulkarni@intel.com>,
        Jianxun Zhang <jianxun.zhang@linux.intel.com>
Subject: Re: [PATCH v5 08/10] gna: add GNA_WAIT ioctl
Message-ID: <Y1IfNAhnjhXw3eTv@kroah.com>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-9-maciej.kwapulinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020175334.1820519-9-maciej.kwapulinski@linux.intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 20, 2022 at 07:53:32PM +0200, Maciej Kwapulinski wrote:
> From: Tomasz Jankowski <tomasz1.jankowski@intel.com>
> 
> Although the patch adds GNA_WAIT ioctl, it's main purpose is to provide FIFO
> work-queue logic, which offloads each score operation in sequence to GNA
> accelerator. When it's done, process(es) WAITing for score to be finished are
> woken up.


I do not understand the "Although" here at all :(

> +static irqreturn_t gna_interrupt(int irq, void *priv)
> +{
> +	struct gna_device *gna_priv;
> +
> +	gna_priv = (struct gna_device *)priv;
> +	gna_priv->dev_busy = false;
> +	wake_up(&gna_priv->dev_busy_waitq);
> +	return IRQ_HANDLED;
> +}

irq handling, nice!  Why wan't that discussed in the changelog?

{sigh}

I'm stopping here, this needs lots of work to make it reviewable to
understand what is going on at all.

Please take the time and get proper internal-Intel review first, before
asking community members to take their time to tell you the things that
they should have already told you.

thanks,

greg k-h
