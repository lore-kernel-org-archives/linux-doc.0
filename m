Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 93D747D57F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 21 Aug 2018 10:12:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbeHUNbf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 21 Aug 2018 09:31:35 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:54347 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726730AbeHUNbf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Aug 2018 09:31:35 -0400
Received: by mail-wm0-f65.google.com with SMTP id c14-v6so2354234wmb.4
        for <linux-doc@vger.kernel.org>; Tue, 21 Aug 2018 03:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LgpZyez+aKYTo4qoN7tRYrRGi3hD+0hjA8QiMiXDphg=;
        b=ZeXXXPZL/k+L4+cgrHkZnqwu+0QWoD/v7XoUdY2Ne/5EBHK7dJVDDcoXA0ryMnOtOR
         3uNfhLpDn53a/caOcR1zbp9lRdUAHnoGAEGmB/ZofKW5K/b4hkxShdC91fA+na3KOVki
         0cej9Ds3GJOLzsdidXLa0XeElriJqVZapWgHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LgpZyez+aKYTo4qoN7tRYrRGi3hD+0hjA8QiMiXDphg=;
        b=V2/ewzXxZM6Rb0emMCJffL67jpF4EH9K85U01fW1V026oeAU+JEFEyPctMM3issbxq
         YFvrz2bhfkRIHcEZOozdJ6QnDgtJw6EV8Y4JanWoOJYTkoAdGVLkD2ZE8oTmDlvhpJ9Y
         5nFsYQdXW1silR1AaIF9Nx3aBE8HeAJgQc5PMQKzNJJ41gK5zphqMPT/OxGJt2Gau97S
         QnZOuj1WBGRBmimEwVuxoVtg6GLDOtMW1H9LulBwVznxNmb4PFf7ui/m3se07R5j0IoR
         f0otE5Ls9kbJyhr0HB+kP7qhWw8RSah3MZGn3Rlh3fyiU08dgom2DgtLwb5JsyYixF3p
         PTIQ==
X-Gm-Message-State: AOUpUlEYCm23coq651oVeXcxpNHgj1/qR4cVFEj0pVYcAwcqs0r3+VRC
        O2zTpd0/zPEM+yGDU9XQz7knEA==
X-Google-Smtp-Source: AA+uWPyE6SuO24FZ/ZxNL3deEDcglhIuccoRWp+Py0wLAbku6AFik9NSnEE+5XsNcb+rqG3vjWf8Ww==
X-Received: by 2002:a1c:9550:: with SMTP id x77-v6mr26558993wmd.135.1534846320234;
        Tue, 21 Aug 2018 03:12:00 -0700 (PDT)
Received: from [192.168.0.18] (cpc90716-aztw32-2-0-cust92.18-1.cable.virginm.net. [86.26.100.93])
        by smtp.googlemail.com with ESMTPSA id w10-v6sm15307476wrp.31.2018.08.21.03.11.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Aug 2018 03:11:59 -0700 (PDT)
Subject: Re: [PATCH v2 06/29] mtd: Add support for reading MTD devices via the
 nvmem API
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
 <5b8c30b8-41e1-d59e-542b-fef6c6469ff0@linaro.org>
 <20180820202038.5d3dc195@bbrezillon>
 <e0ec3194-fd3a-9b3d-fba8-f88447eb56e9@linaro.org>
 <20180821115639.4894c1c9@bbrezillon>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <bd4dd892-3b6c-a77e-b2f3-386600c8c9bd@linaro.org>
Date:   Tue, 21 Aug 2018 11:11:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20180821115639.4894c1c9@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 21/08/18 10:56, Boris Brezillon wrote:
> On Tue, 21 Aug 2018 10:50:07 +0100
> Srinivas Kandagatla<srinivas.kandagatla@linaro.org>  wrote:
> 
>> On 20/08/18 19:20, Boris Brezillon wrote:
>>> On Mon, 20 Aug 2018 11:43:34 +0100
>>> Srinivas Kandagatla<srinivas.kandagatla@linaro.org>  wrote:
>>>    
>>>> Overall am still not able to clear visualize on how MTD bindings with
>>>> nvmem cells would look in both partition and un-partition usecases?
>>>> An example DT would be nice here!!
>>> Something along those lines:
>>>    
>> This looks good to me.
>>> 	mtdnode {
>>> 		nvmem-cells {
>>> 			#address-cells = <1>;
>>> 			#size-cells = <1>;
>>>
>>> 			cell@0 {
>>> 				reg = <0x0 0x14>;
>>> 			};
>>> 		};
>>>
>>> 		partitions {
>>> 			compatible = "fixed-partitions";
>>> 			#address-cells = <1>;
>>> 			#size-cells = <1>;
>>>
>>> 			partition@0 {
>>> 				reg = <0x0 0x20000>;
>>>
>>> 				nvmem-cells {
>>> 					#address-cells = <1>;
>>> 					#size-cells = <1>;
>>>
>>> 					cell@0 {
>>> 						reg = <0x0 0x10>;
>>> 					};
>>> 				};
>>> 			};
>>> 		};
>>> 	}; >
>> Just curious...Is there a reason why we can't do it like this?:
>> Is this because of issue of #address-cells and #size-cells Or mtd
>> bindings always prefer subnodes?
>>
>> 	mtdnode {
>> 		reg = <0x0123000 0x40000>;
>> 		#address-cells = <1>;
>> 		#size-cells = <1>;
>> 		cell@0 {
>> 			compatible = "nvmem-cell";
>> 			reg = <0x0 0x14>;
>> 		};
>>
>> 		partitions {
>> 			compatible = "fixed-partitions";
>> 			#address-cells = <1>;
>> 			#size-cells = <1>;
>>
>> 			partition@0 {
>> 				reg = <0x0 0x20000>;
>> 				cell@0 {
>> 					compatible = "nvmem-cell";
>> 					reg = <0x0 0x10>;
>> 				};
>> 			};
>> 		};
>> 	};
> It's because partitions were initially directly defined under the mtd
> node, so, if you have an old DT you might have something like:
> 
> 	mtdnode {
> 		reg = <0x0123000 0x40000>;
> 		#address-cells = <1>;
> 		#size-cells = <1>;
> 
> 		partition@0 {
> 			reg = <0x0 0x20000>;
> 			...
> 		};
> 		...
> 	};
> 
> If we use such a DT with this patch applied, the NVMEM framework will
> consider MTD partitions as nvmem cells, which is not what we want.
Yep, I agree.
TBH, I wanted to add compatible string to nvmem-cell at some point in 
time and it seems more natural update too. One of the reason we 
discussed this in the past was parsers. Looks like mtd can make use of this.

We should be able to add this as an optional flag in nvmem_config to 
enforce this check in case providers wanted to.

Do you think that would help mtd nvmem case?
Also I felt like nvmem-cells subnode seems to be a bit heavy!

thanks,
srini
