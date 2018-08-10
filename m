Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A648B7D87A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 10 Aug 2018 08:41:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727542AbeHJLKr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 10 Aug 2018 07:10:47 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:52165 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727316AbeHJLKq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Aug 2018 07:10:46 -0400
Received: by mail-wm0-f66.google.com with SMTP id y2-v6so1043365wma.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Aug 2018 01:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EPth9GptfFUebQvbEelxragDP2eSq1lOsVSqbURirDY=;
        b=Ha0nZDo0son3vThBsdLg5J26fLu5pyhfpYlVfvMKvweVP4Od/1wb/sC9wpjVfvtWFe
         NrlcNiuT0YyerBizDN2NhpG2T8XCO9HXpVqouEiBU+flOk0sIAiC1lQ61VJpvA8PmZbq
         rpe2yT7sSZrjzRapx5L4nZ7iyGJ4dojzPeeOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EPth9GptfFUebQvbEelxragDP2eSq1lOsVSqbURirDY=;
        b=jB03UYADF31aXhdd0OYfQAxHlOFbYU8GLt0EykLfN1u0TLuwkPCyOWAf4kfceBDDXj
         tF2nqRHySyWQ2p9dVf9IyPLfBgEeSEAW4n516vKqQZczvcHQWKAOntKKUrFjkH303dM5
         YcntzvkNY5Wk9x2FDvlHPF1B1jSRbYlt47cg79aDk2fBi5aICF4xr1ui+b1PXxxJUkLK
         4W4UEbwIx1uL9lCOXDVKGYpxMrEmyQ0kSKXjBfSHT0+o1xPxxjbG9Pxdr8PBHi8l4gv7
         d/XZ14SA8v/fZyRhXjTtCC6psoGn/hmUlRJ8X/WnSi2iW1hmxxCaY+r7UwZht77xNs8G
         hqgQ==
X-Gm-Message-State: AOUpUlH1LiVo1cKfsebUonlqlIGgKtQCIjQhcaASUx5Uvubz5HlmTfRk
        BcXEa5xY/Fiv8ZKJwSCoy7wZCQ==
X-Google-Smtp-Source: AA+uWPxEuMLO7+RBZD+PxViAzcqs+O13xVqj3FmV7+uIyKcUie2lkAPxTmUKDSQ6q0hDDNM4K0ToPA==
X-Received: by 2002:a1c:357:: with SMTP id 84-v6mr849629wmd.8.1533890511435;
        Fri, 10 Aug 2018 01:41:51 -0700 (PDT)
Received: from [192.168.0.18] (cpc90716-aztw32-2-0-cust92.18-1.cable.virginm.net. [86.26.100.93])
        by smtp.googlemail.com with ESMTPSA id m35-v6sm12180272wrf.41.2018.08.10.01.41.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Aug 2018 01:41:50 -0700 (PDT)
Subject: Re: [PATCH v2 00/29] at24: remove at24_platform_data
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "David S . Miller" <davem@davemloft.net>,
        Naren <naren.kernel@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Lukas Wunner <lukas@wunner.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
        Sven Van Asbroeck <svendev@arcx.com>,
        Paolo Abeni <pabeni@redhat.com>, Alban Bedel <albeu@free.fr>,
        Rob Herring <robh@kernel.org>,
        David Lechner <david@lechnology.com>,
        Andrew Lunn <andrew@lunn.ch>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20180810080526.27207-1-brgl@bgdev.pl>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <e3e2e350-f520-8af5-b5d7-6844a58ca479@linaro.org>
Date:   Fri, 10 Aug 2018 09:41:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20180810080526.27207-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 10/08/18 09:04, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This is a follow-up to the previously rejected series[1] which partially
> removed the at24_platform_data structure. After further development and
> taking reviews into account, this series finally removes that struct
> completely but not without touching many different parts of the code
> base.
> 
> Since I took over maintainership of the at24 driver I've been working
> towards removing at24_platform_data in favor for device properties.
> 
> DaVinci is the only platform that's still using it - all other users
> have already been converted.
> 
> One of the obstacles in case of DaVinci is removing the setup() callback
> from the pdata struct, the only user of which are some davinci boards.
> 
> Most boards use the EEPROM to store the MAC address. This series adds
> support for cell lookups to the nvmem framework, registers relevant
> cells for all users, adds nvmem support to eth_platform_get_mac_address(),
> converts davinci_emac driver to using it and replaces at24_platform_data
> with device properties.
> 
> There's also one board (da850-evm) which uses MTD for reading the MAC
> address. I used the patch from Alban Bedel's previous submission[2] to
> add support for nvmem to the MTD framework. Since this user doesn't
> need device tree, I dropped Alban's patches modifying the DT bindings.
> We can add that later once an agreement is reached. For the time being
> MTD devices are registered as nvmem devices and we're registering the
> mac-address cell using the cell lookup mechanism.
> 
> This series adds a blocking notifier chain to the nvmem framework, so
> that we can keep the EEPROM reading code in the mityomapl138 board file
> with only slight modifications.
> 
> I also included some minor fixes to the modified code.
> 
> Tested on da850-evm & dm365-evm.
> 
> [1] https://lkml.org/lkml/2018/6/29/153
> [2] https://lkml.org/lkml/2018/3/24/312
> 
...

> Bartosz Golaszewski (28):
>    nvmem: add support for cell lookups
>    Documentation: nvmem: document lookup entries
>    nvmem: add a notifier chain
>    nvmem: provide nvmem_dev_name()
>    nvmem: remove the name field from struct nvmem_device
> 
>   Documentation/nvmem/nvmem.txt              |  28 +++++
..
>   drivers/nvmem/core.c                       | 106 ++++++++++++++++-

nvmem parts looks good to me other then few trivial kernel doc comments!
I can either Ack those patches or Send them after rc3-4 to Greg KH as 
4.20 material.

Thanks
srini

> 
