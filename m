Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 43A717D57F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 21 Aug 2018 13:37:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbeHUQ5w (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 21 Aug 2018 12:57:52 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36906 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbeHUQ5w (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Aug 2018 12:57:52 -0400
Received: by mail-wm0-f68.google.com with SMTP id n11-v6so2888662wmc.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Aug 2018 06:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c3FGXtXraDYavnNHQ6PfwMtvYlepArQRRSDaOYb2QoM=;
        b=TlSoGFQ9YfWHcfa3msWSwmkJFxCv9Ts9rQKHv+44b3T2U8qrtZZMRtwSan2cVIQT0K
         AMFG7Ez0NeLll7Bcfmbg+Ulu6alAgi+8jySgCHkXQ+UOGAGZMXg3/BLgHq7Wk7hAxA+E
         KNVDqrEXzwqSBeb39VvmSDo/RwrQFEY7++bbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c3FGXtXraDYavnNHQ6PfwMtvYlepArQRRSDaOYb2QoM=;
        b=N0N3o0hVucq4SQWp6/OrbljA3yYaebaL6LIaRq0FI2pY1pwqmjzMF7YHWox9OQ7uyY
         cj6lvYH+QQRnIX/l56rbDwNDXn5pu2adW68OdlbW2lo6GM52LBje4KSV879mE/QeNj8R
         BjFx6KTqzoleyx8VL87e/pP+2kQb0wu+zkxq0XEOx1Mc5AuXL1tel6ZEduoKfuigPEev
         i8pJ9INQHlcUvyOTjb42d7fVGtLOsto6mzke+CuCmk49pURUSKDYMmRXvNrsCuJlV/9z
         f02tQgp0NwaNFwGmls/d7JPZU0tIs49Ni4axj50dqItr91aQn4vapP60QBhp6KsYfB1G
         5Rfg==
X-Gm-Message-State: AOUpUlHV87qsavuXC4hks2GnKbLrVVOoh1mlgsIDYctoLE68oblcTF6n
        ps87gk0bh1WoEDpAc0/uZ/fA+Q==
X-Google-Smtp-Source: AA+uWPxVdr1hJh7JTbQImwM6JcMS3hSOB36KQhzjFfT9Cj/hPh1HoGhS4nCt7GpVEXr6xo3tG66niQ==
X-Received: by 2002:a1c:c019:: with SMTP id q25-v6mr28160061wmf.148.1534858659737;
        Tue, 21 Aug 2018 06:37:39 -0700 (PDT)
Received: from [192.168.0.18] (cpc90716-aztw32-2-0-cust92.18-1.cable.virginm.net. [86.26.100.93])
        by smtp.googlemail.com with ESMTPSA id t25-v6sm1985449wmh.15.2018.08.21.06.37.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Aug 2018 06:37:39 -0700 (PDT)
Subject: Re: [PATCH v2 06/29] mtd: Add support for reading MTD devices via the
 nvmem API
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     Boris Brezillon <boris.brezillon@bootlin.com>
Cc:     Alban <albeu@free.fr>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
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
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        David Lechner <david@lechnology.com>,
        Andrew Lunn <andrew@lunn.ch>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20180810080526.27207-1-brgl@bgdev.pl>
 <20180810080526.27207-7-brgl@bgdev.pl> <20180817182720.6a6e5e8e@bbrezillon>
 <20180819133106.0420df5f@tock> <20180819184609.6dcdbb9a@bbrezillon>
 <20180821005327.0d312a85@tock> <20180821074404.23aaeb6b@bbrezillon>
 <81407b4d-a02f-4085-f333-a96102bd96ce@linaro.org>
 <20180821133136.1fada1b6@bbrezillon>
 <6fb36da4-c985-6d6e-f9e1-572f5cd7609b@linaro.org>
Message-ID: <e4ea4614-4673-020c-641d-30c94e7b761a@linaro.org>
Date:   Tue, 21 Aug 2018 14:37:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <6fb36da4-c985-6d6e-f9e1-572f5cd7609b@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 21/08/18 14:34, Srinivas Kandagatla wrote:
> 
> 
> On 21/08/18 12:31, Boris Brezillon wrote:
>>>     * struct nvmem_config - NVMEM device configuration
>>> @@ -58,6 +62,7 @@ struct nvmem_config {
>>>           bool                    root_only;
>>>           nvmem_reg_read_t        reg_read;
>>>           nvmem_reg_write_t       reg_write;
>>> +       nvmem_match_t           match;
>>>           int     size;
>>>           int     word_size;
>>>           int     stride;
>>>
>> That might work if nvmem cells are defined directly under the mtdnode.
> Layout should not matter! which is the purpose of this callback.
> 
> The only purpose of this callback is to tell nvmem core that the 
> node(nvmem cell) belongs to that provider or not, if it is then we 
> successfully found the provider. Its up to the provider on which layout 
> it describes nvmem cells. Additionally the provider can add additional 
> sanity checks in this match function to ensure that cell is correctly 
> represented.
> 
> 
>> If we go for this approach, I'd recommend replacing this ->match() hook
>> by ->is_nvmem_cell() and pass it the cell node instead of the nvmem
>> node, because what we're really after here is knowing which subnode is
>> an nvmem cell and which subnode is not.
> 
> I agree on passing cell node instead of its parent. Regarding basic 
> validating if its nvmem cell or not, we can check compatible string in 
> nvmem core if we decide to use "nvmem-cell" compatible.
> 
> Also just in case if you missed this, nvmem would not iterate the
Sorry !! i hit send button too quickly I guess.

What I meant to say here, is that nvmem core would not iterate the 
provider node in any case.

Only time it looks at the cell node is when a consumer requests for the 
cell.

--srini
