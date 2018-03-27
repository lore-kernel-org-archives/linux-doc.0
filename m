Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BB41F7DD31
	for <lwn-linux-doc@archive.lwn.net>; Tue, 27 Mar 2018 14:53:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752383AbeC0Owx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 27 Mar 2018 10:52:53 -0400
Received: from mail-ot0-f194.google.com ([74.125.82.194]:37664 "EHLO
        mail-ot0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750898AbeC0Owv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Mar 2018 10:52:51 -0400
Received: by mail-ot0-f194.google.com with SMTP id y46-v6so5099105otd.4;
        Tue, 27 Mar 2018 07:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MvCUdYMCUMLyxyx27J2u3nysWk/jkimERk+joPCCbgg=;
        b=VCp2KgTjehLDEZkHkWdiaT8KXVs8dXisu8Y79gKm83A6nGWRqE6JfHlavmF6lFm2g+
         2ZJMa8vBwPKzZo/5hfnronWlNRvHtBIc9G+ljFRTAWaGFI05cSCY+AAapaEC7huGZ+je
         L2qmY/a+O2wZ//m+k8AcyiXAiBbIwBgXRutSXkFMJYWK+R34zAgVMrmkXDWAnjO1sbgb
         GJJFJLMrWj2CDA2LFGMfxRQojye2u6voCvxex7qtFdinxc5DhcFnSUut7oq5OGlbM+t0
         5+4cgfoyBGUst4CzDe9V1x5zgxKFvon830NWURJYpC7dEI9qcncH0eKF/+2XtoBPaJmV
         QI9Q==
X-Gm-Message-State: ALQs6tBjCrnYPPosfg9kGBYU4uu8Z3A5V9c5fJZimp2elcAI5Lp58B7w
        A2VWAildxvmI9oeW6AahXg==
X-Google-Smtp-Source: AIpwx499caeifTRyRf+SC4enccMfVCA2Ur4F9wVApMDqhplWaE3k8OjFRFtXaBIPiIGPO8hWjGWKOQ==
X-Received: by 2002:a9d:3861:: with SMTP id r30-v6mr283642otd.287.1522162370721;
        Tue, 27 Mar 2018 07:52:50 -0700 (PDT)
Received: from localhost (216-188-254-6.dyn.grandenetworks.net. [216.188.254.6])
        by smtp.gmail.com with ESMTPSA id r185-v6sm739384oie.24.2018.03.27.07.52.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Mar 2018 07:52:50 -0700 (PDT)
Date:   Tue, 27 Mar 2018 09:52:49 -0500
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
Message-ID: <20180327145249.xjoo42qow34ksdle@rob-hp-laptop>
References: <1521607244-29734-1-git-send-email-rrajk@nvidia.com>
 <1521607244-29734-4-git-send-email-rrajk@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521607244-29734-4-git-send-email-rrajk@nvidia.com>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 21, 2018 at 10:10:38AM +0530, Rajkumar Rampelli wrote:
> Supply Device tree binding documentation for the NVIDIA
> Tegra186 SoC's Tachometer Controller
> 
> Signed-off-by: Rajkumar Rampelli <rrajk@nvidia.com>
> ---
> 
> V2: Renamed compatible string to "nvidia,tegra186-pwm-tachometer"
>     Renamed dt property values of clock-names and reset-names to "tachometer"
>     from "tach"

Read my prior comments on v1.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
