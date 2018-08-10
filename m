Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A709E7D00A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 10 Aug 2018 08:34:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727613AbeHJLCe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 10 Aug 2018 07:02:34 -0400
Received: from mail-wm0-f67.google.com ([74.125.82.67]:40344 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727457AbeHJLCd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Aug 2018 07:02:33 -0400
Received: by mail-wm0-f67.google.com with SMTP id y9-v6so1013871wma.5
        for <linux-doc@vger.kernel.org>; Fri, 10 Aug 2018 01:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CAw/f2FK0lcZDxQOxEKHov5c7KMK2uhUZqJcEueyLBo=;
        b=X4TEZb5iMqsHHBcD06hAqxarmsqV2GEdfsFigtkr99oKd+3xK79eWUoEDCWWwvXIMC
         IASvQXdk11HH9iz24852bPU5fYJWf5P1NY+Sw/P5XrF6AQOZnYksOA7SPmPGxJg2WUqX
         XwRQN6y2IRYNMUJXj4NO6wDRMgt5ihFUeKQVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CAw/f2FK0lcZDxQOxEKHov5c7KMK2uhUZqJcEueyLBo=;
        b=Ks6AQsLrsE+yFCO0alJPS1cADBScFRQwNM3ag8PaTLkg66329160jTv0krtotTyp7w
         RRXqRX89rMMpZAbXu9n+DXbzPayHFsao+U7nHnCGNSntj9PNlPFSI5CQg9eH19allkzK
         qy+cyGrjt/12qd72KFtz/Je2EdZzqwoktfUp6lMruDoXpHZvzHh7wicNToaIiNeaC06b
         Yfb3mNbtnkiBLLHJthzKlvt8Qo9wOIoZucQBVLBjiaR+I4ldJRpO48OEMEoykHCBoyKC
         GX+aT0svvnzMTd7+3yaUb3X03nsjyUJZhi4vGC+DVU4kizyibQit/QvQv/7r6/bjaoul
         I0yA==
X-Gm-Message-State: AOUpUlH0Dq8QdfFWe93OyKvhIoR5FZBZwnKPv+CbmtPkVc2LexGy0RX5
        7dnhddaXj8N3i6q/0TueNVXVAg==
X-Google-Smtp-Source: AA+uWPzG2Mn+A2oZ+RdO50DuDpbbJLwJVXnBvL807sjlKyy924eTxGZoRt69qd/PwM1pz4TDM/GHIg==
X-Received: by 2002:a1c:8f0e:: with SMTP id r14-v6mr912524wmd.79.1533890021185;
        Fri, 10 Aug 2018 01:33:41 -0700 (PDT)
Received: from [192.168.0.18] (cpc90716-aztw32-2-0-cust92.18-1.cable.virginm.net. [86.26.100.93])
        by smtp.googlemail.com with ESMTPSA id h5-v6sm10247848wrr.19.2018.08.10.01.33.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Aug 2018 01:33:40 -0700 (PDT)
Subject: Re: [PATCH v2 05/29] nvmem: remove the name field from struct
 nvmem_device
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
 <20180810080526.27207-6-brgl@bgdev.pl>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c54df79b-2491-61b0-6a91-12798a7ba3e0@linaro.org>
Date:   Fri, 10 Aug 2018 09:33:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20180810080526.27207-6-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 10/08/18 09:05, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This field is never set and is only used in a single error message.
> Remove the field and use nvmem_dev_name() instead.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
Looks good to me!

>   drivers/nvmem/core.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 31df2e6d6f72..ab3ced2d9a84 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -26,7 +26,6 @@
>   #include <linux/slab.h>
>   
>   struct nvmem_device {
> -	const char		*name;
>   	struct module		*owner;
>   	struct device		dev;
>   	int			stride;
> @@ -712,7 +711,7 @@ static struct nvmem_device *__nvmem_device_get(struct device_node *np,
>   	if (!try_module_get(nvmem->owner)) {
>   		dev_err(&nvmem->dev,
>   			"could not increase module refcount for cell %s\n",
> -			nvmem->name);
> +			nvmem_dev_name(nvmem));
>   
>   		mutex_lock(&nvmem_mutex);
>   		nvmem->users--;
> 
