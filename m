Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 959E87D57F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 21 Aug 2018 14:33:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbeHURxu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 21 Aug 2018 13:53:50 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:37114 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727167AbeHURxt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Aug 2018 13:53:49 -0400
Received: by mail-wm0-f66.google.com with SMTP id n11-v6so3062282wmc.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Aug 2018 07:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Un0w2l7Yz8T6CyGn0WzV6GbAnHWwvbXDyMP7AeR90UY=;
        b=kDynzjNqnZqV0md5ttV4QDdm0w93XJr/VkOUMCR4dSVJ68VzLYtYjXLcRz/dqiRa/1
         CmW4UaesVjLNQuZICnuhBegUiaOgBKHKWXV8ZPWRbKUGwNwIVQH/RcB10dY/y3/BsAUN
         iZ0VrVemaUGebFdPpNIbn9avj56bv7+N226G0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Un0w2l7Yz8T6CyGn0WzV6GbAnHWwvbXDyMP7AeR90UY=;
        b=ZE0p+YR7ZHsO5/hLCGo83FMxg/PwBPsP5aCMP9F/RTbs8HNy4yGuZmGbjXA44Qu4Yy
         Nkv/bS/qf524b9d2FsMDoh3docYcTVEXr0whPBtCWZ09H4HyAMbqPsueUZiV6egVihfh
         hZUhrvdbBXpYusYZLawABC+d+ATxS57cc/lW4ECDQddHzImlv5j7+vLzYN6hSsAdrSJ1
         3uUoqsE9b3E+7C73o09Oa1HOXQnWUvLarCKqoI/43RJLKyUpxb+ruolZFpFyl3Bzzifx
         bjwsYRqv/tD4XdWeQDbC2mS/zojLUkzh3LrUZhHm0FFmtkmzxbFpmfmwVrbMLEuoIMl7
         fBLw==
X-Gm-Message-State: APzg51DjQB4rmVfa9jviF/tv5BbfzJm/8GNlt6mO5IluWWYPof8o4ryW
        jE1V+ZKSGV0AK/VWnFOF7yHj2g==
X-Google-Smtp-Source: ANB0VdZYxg5SrQ3btL4IdeDF1brUb50wZSwWIFF/N+DARcii3DYrm1omOy8+220M6LzUn1HUMf7mMg==
X-Received: by 2002:a1c:9744:: with SMTP id z65-v6mr1274632wmd.105.1534862005042;
        Tue, 21 Aug 2018 07:33:25 -0700 (PDT)
Received: from [192.168.0.18] (cpc90716-aztw32-2-0-cust92.18-1.cable.virginm.net. [86.26.100.93])
        by smtp.googlemail.com with ESMTPSA id g2-v6sm1880072wme.20.2018.08.21.07.33.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Aug 2018 07:33:24 -0700 (PDT)
Subject: Re: [PATCH v2 06/29] mtd: Add support for reading MTD devices via the
 nvmem API
To:     Boris Brezillon <boris.brezillon@bootlin.com>,
        Alban <albeu@free.fr>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
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
 <20180821142716.0adcdd56@eos> <20180821145725.3b385399@bbrezillon>
 <20180821155706.2adf3b4c@eos> <20180821162644.5a1d7799@bbrezillon>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <2d5761f4-2c27-5a23-a635-9205124c993a@linaro.org>
Date:   Tue, 21 Aug 2018 15:33:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20180821162644.5a1d7799@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 21/08/18 15:26, Boris Brezillon wrote:
>> This also has the side effect that nvmem cells defined in DT don't
>> appear in sysfs, unlike those defined from board code.
> Wow, that's not good. I guess we'll want to make that consistent at
> some point.
> 
support for sysfs entries per cell is not available in nvmem. However 
there is nvmem sysfs entry per provider which can be read by the user 
space if required.


--srini
