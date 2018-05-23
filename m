Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AAE337DF8C
	for <lwn-linux-doc@archive.lwn.net>; Wed, 23 May 2018 18:13:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754781AbeEWSM0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 23 May 2018 14:12:26 -0400
Received: from bh-25.webhostbox.net ([208.91.199.152]:38722 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754681AbeEWSMZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 May 2018 14:12:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=B3VvBZENytI79tGgGakflNTIWnH1CUZ0TUgUfucRkT8=; b=lHn6fuNE0adamor5PGvVZulRIe
        xsMoQ9506aJ4hzvHcLEg2z1p10dkh0u7Jwd0BpMGyqERn7hhqac/cjmNGJZqxPJ4gRsL/SbPtDr58
        QF9/C6kG7nfZdrK9diMHVFZxew8c1g1BWKZC6dgkQTeCl3j3bGo8oEQXlh8+Hug5qPBzGJiZv23G3
        PHGMDdAVZqfmDrrcBjRXu84YksBz39pPQyhulXcxkyvN8mYfpF8lNnz+IDtx1XRtHflCQOHimkv6j
        IB4D34RAa9bZ/y6sG0yr5cs/Gazrq+UpbdQlurotyKvDPbG0+jqedDA7++tnVYG3HXpae+u2pdYC+
        t7iJPZxw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:50020 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.89)
        (envelope-from <linux@roeck-us.net>)
        id 1fLYFK-002p3S-1E; Wed, 23 May 2018 18:12:22 +0000
Date:   Wed, 23 May 2018 11:12:21 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Rob Herring <robh+dt@kernel.org>,
        Eric Anholt <eric@anholt.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Scott Branden <sbranden@broadcom.com>,
        linux-doc@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
        Phil Elwell <phil@raspberrypi.org>,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC V2 2/6] hwmon: Add support for RPi voltage sensor
Message-ID: <20180523181221.GD27570@roeck-us.net>
References: <1526988112-4021-1-git-send-email-stefan.wahren@i2se.com>
 <1526988112-4021-3-git-send-email-stefan.wahren@i2se.com>
 <90a768aa-ee8c-1050-cf15-60637069dbdb@roeck-us.net>
 <659923372.11518.1526997096662@email.1und1.de>
 <bea3d6c7-a713-c4aa-8ae8-7fec80c5da5d@roeck-us.net>
 <723014352.17580.1527017480381@email.1und1.de>
 <cbbdab47-cde3-7a7c-c797-c00d546e00d5@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbbdab47-cde3-7a7c-c797-c00d546e00d5@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Authenticated_sender: guenter@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id: guenter@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: guenter@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 23, 2018 at 01:12:10PM +0100, Robin Murphy wrote:
> On 22/05/18 20:31, Stefan Wahren wrote:
> [...]
> >>>>>+static int rpi_hwmon_probe(struct platform_device *pdev)
> >>>>>+{
> >>>>>+	struct device *dev = &pdev->dev;
> >>>>>+	struct rpi_hwmon_data *data;
> >>>>>+	int ret;
> >>>>>+
> >>>>>+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> >>>>>+	if (!data)
> >>>>>+		return -ENOMEM;
> >>>>>+
> >>>>>+	data->fw = platform_get_drvdata(to_platform_device(dev->parent));
> >>>>>+	if (!data->fw)
> >>>>>+		return -EPROBE_DEFER;
> >>>>>+
> >>>>
> >>>>I am a bit at loss here (and sorry I didn't bring this up before).
> >>>>How would this ever be possible, given that the driver is registered
> >>>>from the firmware driver ?
> >>>
> >>>Do you refer to the (wrong) return code, the assumption that the parent must be a platform driver or a possible race?
> >>>
> >>
> >>The return code is one thing. My question was how the driver would ever be instantiated
> >>with platform_get_drvdata(to_platform_device(dev->parent)) == NULL (but dev->parent != NULL),
> >>so I referred to the race. But, sure, a second question would be how that would indicate
> >>that the parent is not instantiated yet (which by itself seems like an odd question).
> >
> >This shouldn't happen and worth a log error. In patch #3 the registration is called after the complete private data of the firmware driver is initialized. Did i missed something?
> >
> >But i must confess that i didn't test all builtin/module combinations.
> 
> The point is that, by construction, a "raspberrypi-hwmon" device will only
> ever be created for this driver to bind to if the firmware device is both
> fully initialised and known to support the GET_THROTTLED call already. Thus
> trying to check those again from the hwmon driver is at best pointless, and
> at worst misleading. If somebody *does* manage to bind this driver to some
> random inappropriate device, you've still got no guarantee that dev->parent
> is valid or that dev_get_drvdata(dev->parent)) won't return something
> non-NULL that isn't a struct rpi_firmware pointer, at which point you're
> liable to pass the paranoid check yet still crash anyway.
> 
> IOW, you can't reasonably defend against incorrect operation, and under
> correct operation there's nothing to defend against, so either way it's
> pretty futile to waste effort trying.
> 

Well said.

Guenter
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
