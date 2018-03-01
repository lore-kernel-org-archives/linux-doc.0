Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0CFF77E22F
	for <lwn-linux-doc@archive.lwn.net>; Thu,  1 Mar 2018 22:08:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1162461AbeCAWIk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 1 Mar 2018 17:08:40 -0500
Received: from mail-oi0-f67.google.com ([209.85.218.67]:42349 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161969AbeCAWIj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Mar 2018 17:08:39 -0500
Received: by mail-oi0-f67.google.com with SMTP id c18so5681896oiy.9;
        Thu, 01 Mar 2018 14:08:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rrE3V/1s6uhEJA+mAK0pTPRONQTA91dzkQfFPjvMj6c=;
        b=sB41KvhEJhNgBIdJaUfQ5CJwSpHFqs72viQ559po8GAVlmwUQOdHo54ifGid//C7YS
         dbilw4j95p0xTV+574p1yVsLVX234233/FOi+NSG7gBUP2vb6lV/teTLiPxC0kvgtLKN
         ZhJb3rrmc/B/kAOuD/Z79THAsSVHx8iMUx8kIP2XXoh0eJvjcLUaRBTRXPdiTeB04uJr
         YvVS59QjsxPjB/KCL3LNJ2J2G6nQW1UNcOJj25vEj4vizXz+Hwxk2TXQtBfKuIexZ2HV
         U5Ufi8ORO4b4922kIvwUoFEnAHEIRKz+nG1dnmzosQ+38qbvevV9yrIpeJ9YkJLKa6oK
         NrbA==
X-Gm-Message-State: AElRT7GrvwIPjdzpyUCwBDSRtGK9Ed5oHU7P1H41LhZ63Y3c0sSjBYQg
        qc1uo16EeS7P/jFZBrHQyg==
X-Google-Smtp-Source: AG47ELsB4AzKRygEQ8hYsnqLs4aCfAYgJG7i9zeFS/kDtYvC7KSJiihmLo5PTNQnu7UbXQTvO/eZ+Q==
X-Received: by 10.202.28.15 with SMTP id c15mr2139295oic.243.1519942118062;
        Thu, 01 Mar 2018 14:08:38 -0800 (PST)
Received: from localhost (216-188-254-6.dyn.grandenetworks.net. [216.188.254.6])
        by smtp.gmail.com with ESMTPSA id y9sm2554035oia.54.2018.03.01.14.08.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Mar 2018 14:08:37 -0800 (PST)
Date:   Thu, 1 Mar 2018 16:08:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Mikko Perttunen <cyndis@kapsi.fi>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Rajkumar Rampelli <rrajk@nvidia.com>, mark.rutland@arm.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com, jdelvare@suse.com,
        corbet@lwn.net, catalin.marinas@arm.com, will.deacon@arm.com,
        kstewart@linuxfoundation.org, gregkh@linuxfoundation.org,
        pombredanne@nexb.com, mmaddireddy@nvidia.com,
        mperttunen@nvidia.com, arnd@arndb.de,
        gregory.clement@free-electrons.com, timur@codeaurora.org,
        andy.gross@linaro.org, xuwei5@hisilicon.com, elder@linaro.org,
        heiko@sntech.de, krzk@kernel.org, ard.biesheuvel@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, ldewangan@nvidia.com
Subject: Re: [PATCH 05/10] hwmon: generic-pwm-tachometer: Add generic PWM
 based tachometer
Message-ID: <20180301220836.a77o5i5g7g2k7lei@rob-hp-laptop>
References: <1519196339-9377-1-git-send-email-rrajk@nvidia.com>
 <1519196339-9377-6-git-send-email-rrajk@nvidia.com>
 <ee03e1e5-bbeb-1238-04ed-b992fe3a3ce6@kapsi.fi>
 <c1192f75-0e6e-c735-67e1-2901624831ae@roeck-us.net>
 <a5db25f7-6999-ff3a-21c2-161cfcf4db35@kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5db25f7-6999-ff3a-21c2-161cfcf4db35@kapsi.fi>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 21, 2018 at 05:20:29PM +0200, Mikko Perttunen wrote:
> On 21.02.2018 16:46, Guenter Roeck wrote:
> > On 02/20/2018 11:15 PM, Mikko Perttunen wrote:
> > > AIUI, the PWM framework already exposes a sysfs node with period
> > > information. We should just use that instead of adding a new driver
> > > for this.
> > > 
> > 
> > I am kind of lost. Please explain.
> > 
> > Are you saying that we should drop the pwm-fan driver as well (which goes
> > the opposite way), as well as any other drivers doing anything with pwm
> > signals,
> > because after all those signals are already exposed to userspace a sysfs
> > attributes,
> > and a kernel driver to abstract those values is thus not needed ?
> 
> The only thing this driver does is do a constant division in kernelspace.
> I'm not really seeing why that couldn't be done in userspace. But if you
> think it's appropriate to do the RPM conversion in kernelspace then I'm not
> greatly opposed to that.
> 
> > 
> > > In any case, we cannot add something like this to device tree since
> > > it's not a hardware device.
> > > 
> > 
> > So you are saying there is no means to express in devicetree that
> > a pwm input is connected to a fan ? How is that not hardware ?
> > 
> > If so, how do you express in devicetree that a pwm signal is connected
> > to anything ?
> 
> If we want to describe that the tachometer is connected to a fan, then we
> should have a fan node in the board's device tree. We don't have a chip that
> has a thing called "generic-pwm-tachometer" attached to it. (We have chips
> that have a "nvidia,tegra186-tachometer", so it's proper to have that.)

We already have some fan control bindings in the tree. Follow those. 
There's only so many ways to control fans, so lets have some alignment. 
And yes, we should have a fan node. 

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
