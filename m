Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B15CF7DD31
	for <lwn-linux-doc@archive.lwn.net>; Tue, 27 Mar 2018 15:00:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751973AbeC0PAt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 27 Mar 2018 11:00:49 -0400
Received: from mail-oi0-f68.google.com ([209.85.218.68]:36909 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751068AbeC0PAs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Mar 2018 11:00:48 -0400
Received: by mail-oi0-f68.google.com with SMTP id e8-v6so5722727oii.4;
        Tue, 27 Mar 2018 08:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DJ8QavL55KaNP+wVmTcW1Vh2KdxhSz6CCA5yodniuvY=;
        b=GouN/FFCphLeI3leNnjZJ1TyuDOT8RvsV/RNggRg+YBLmSmdZD0OqEc5+XHX4BDB91
         ppKK1FRe6bZkcgIZYIcReOMP1CmgS9WwOGh5ark9LkDtsbjI/Uu1eTtBMwmLyQObBtKG
         Y/5YxnB5YaM42lAAZfeX5C8qAlzqEFeP1engCd1GYEPeJYGy8DwmPX2WJXHpr8pjQuzT
         n9W6Usaorm2lidPaQhgHGRgtAhvlwJGS0zGW0spREODIl3LDnU++qisf0oOBGyiANpQ1
         Hqi1tDp+G2bQc8zqAB3pOAbKNGQplcyaiSEQlsSIzCaG+E55RVo3Gqz1piJpMCe/rQ8Z
         iTtA==
X-Gm-Message-State: AElRT7HFuZi92YuksoC2ofH9APjPjg+04t1EU7y9xGdqcKj8MEek1WAP
        QOvIykycTuly/0DFr1Bi7A==
X-Google-Smtp-Source: AG47ELvesISTajann9Bmsu2+7VcHsMwc2rUm4fJf10O/gKUX22PDTTJpxdvifqqmYfFpukLmIlmfag==
X-Received: by 10.202.9.19 with SMTP id 19mr18026890oij.358.1522162846956;
        Tue, 27 Mar 2018 08:00:46 -0700 (PDT)
Received: from localhost (216-188-254-6.dyn.grandenetworks.net. [216.188.254.6])
        by smtp.gmail.com with ESMTPSA id m130-v6sm730048oif.11.2018.03.27.08.00.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Mar 2018 08:00:46 -0700 (PDT)
Date:   Tue, 27 Mar 2018 10:00:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rajkumar Rampelli <rrajk@nvidia.com>
Cc:     mark.rutland@arm.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, jdelvare@suse.com, linux@roeck-us.net,
        corbet@lwn.net, catalin.marinas@arm.com, will.deacon@arm.com,
        kstewart@linuxfoundation.org, gregkh@linuxfoundation.org,
        pombredanne@nexb.com, mmaddireddy@nvidia.com,
        mperttunen@nvidia.com, arnd@arndb.de, timur@codeaurora.org,
        andy.gross@linaro.org, xuwei5@hisilicon.com, elder@linaro.org,
        heiko@sntech.de, krzk@kernel.org, ard.biesheuvel@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, ldewangan@nvidia.com
Subject: Re: [PATCH V2 3/9] dt-bindings: Tegra186 tachometer device tree
 bindings
Message-ID: <20180327150045.biqr5ue5djru2dn7@rob-hp-laptop>
References: <1521607244-29734-1-git-send-email-rrajk@nvidia.com>
 <1521607244-29734-4-git-send-email-rrajk@nvidia.com>
 <20180327145249.xjoo42qow34ksdle@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180327145249.xjoo42qow34ksdle@rob-hp-laptop>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 27, 2018 at 09:52:49AM -0500, Rob Herring wrote:
> On Wed, Mar 21, 2018 at 10:10:38AM +0530, Rajkumar Rampelli wrote:
> > Supply Device tree binding documentation for the NVIDIA
> > Tegra186 SoC's Tachometer Controller
> > 
> > Signed-off-by: Rajkumar Rampelli <rrajk@nvidia.com>
> > ---
> > 
> > V2: Renamed compatible string to "nvidia,tegra186-pwm-tachometer"
> >     Renamed dt property values of clock-names and reset-names to "tachometer"
> >     from "tach"
> 
> Read my prior comments on v1.

Also, I'm trying to make sense of who you Cc'ed on this. There's a ton 
of folks I know that I'm pretty sure don't care about this series. Start 
with get_maintainers.pl and add people you know need to see this series.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
