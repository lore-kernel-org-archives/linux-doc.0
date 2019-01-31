Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B26827D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 Jan 2019 15:22:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728035AbfAaPW2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 Jan 2019 10:22:28 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:44270 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727189AbfAaPW2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 Jan 2019 10:22:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2014; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=zaBpfNpCVdbDPQFRwA5YLYdox6i8UN3HO+0zKBeusJw=; b=manm5sRdTUmqmYzLO4KE4wbfs
        UIWUUs6BSBGgCPQQ8T6A93Spc3DLq2D7FmddwkW9ooykd9ez0PMI8uoRFcd8yCcxGgGLrDo0wM7lH
        s1rdaodAo8alVMCnC5pMfHhuTN3igsx50mW9CcptFzEBM0svk9WroELEA8cDFWOalj3fs=;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36850)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1gpEAD-00081T-Fg; Thu, 31 Jan 2019 15:22:01 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1gpE9z-0000xP-LS; Thu, 31 Jan 2019 15:21:47 +0000
Date:   Thu, 31 Jan 2019 15:21:47 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, corbet@lwn.net, cw00.choi@samsung.com,
        krzk@kernel.org, b.zolnierkie@samsung.com, mturquette@baylibre.com,
        sboyd@kernel.org, pombredanne@nexb.com, sre@kernel.org,
        vkoul@kernel.org, linux@roeck-us.net, pavel@ucw.cz,
        sjhuang@iluvatar.ai, andrew.smirnov@gmail.com,
        djkurtz@chromium.org, akshu.agrawal@amd.com,
        rafael.j.wysocki@intel.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 0/3] clk: clkdev add managed lookup registrations
Message-ID: <20190131152147.tzxabhyhlyy2rwhy@e5254000004ec.dyn.armlinux.org.uk>
References: <cover.1544177090.git.matti.vaittinen@fi.rohmeurope.com>
 <20190131132452.GD23791@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190131132452.GD23791@localhost.localdomain>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 31, 2019 at 03:24:52PM +0200, Matti Vaittinen wrote:
> Hello All,
> 
> On Fri, Dec 07, 2018 at 01:09:00PM +0200, Matti Vaittinen wrote:
> > Series adds managed clkdev lookup interfaces and cleans few drivers
> > 
> > Few clk drivers appear to be leaking clkdev lookup registrations at
> > driver remove. The patch series adds devm versions of lookup
> > registrations and cleans up few drivers. Driver clean-up patches have
> > not been tested as I lack the HW. All testing and comments if
> > driver/device removal is even possible for changed drivers is highly
> > appreciated. If removal is not possible I will gladly drop the patches
> > from series - although leaking lookups may serve as bad example for new
> > developers =)
> > 
> > Changed drivers are:
> > clk-max77686 and clk-st
> > 
> > Please note that the patch #2 requires this change to work correctly:
> > https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?h=clk-next&id=05502bf9eb7a7297f5fa6f1d17b169b3d5b53570
> 
> I guess the dependency mentioned abowe is already in (most) of the
> trees. (I can't say for sure as I don't know what is the correct tree
> for clkdev - is it linux-arm.git as Russel is maintaining clkdev?

Yes, I'm supposed to be maintaining clkdev, but I'm busy with other
stuff (such as reorganising my network, helping people with SFP issues,
I'm supposed to be replying to Arend over a brcmfmac issue that has been
on-going since Christmas which I haven't yet been able to doing the next
test...)

> If yes, then the commit 05502bf9eb7a7297f5fa6f1d17b169b3d5b53570
> "clk: of-provider: look at parent if registered device has no
> provider info" seems to be sitting in maser branch).

It's there because it's part of the mainline kernel and has been
since v5.0-rc1.  So, if you depend on that commit, basing off
v5.0-rc1 is probably sane, unless there's something else that
conflicts.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
