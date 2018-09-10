Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 209017D57F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Sep 2018 08:53:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727727AbeIJNqw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Sep 2018 09:46:52 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35835 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbeIJNqw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Sep 2018 09:46:52 -0400
Received: by mail-wm0-f65.google.com with SMTP id o18-v6so20586364wmc.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Sep 2018 01:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CPxOIUGhEj9rJaqY/EHPHSI+pPP+5egIMA38qsMH3+8=;
        b=WgOMCvJP0aBXl467hnny/mzd+5NwXpYFzEUwjews5WEIKSY1/syyxXF25HIGgULPn+
         /QW0yuekbWeYXT2460xheMVnHnDszRmLEDk+ZwjLEKSxNbZhSABnwaydryiJ3ne44N8u
         kyxRpMMX2Sdqy5EdZk4NngNm1k26aRcFXPlQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CPxOIUGhEj9rJaqY/EHPHSI+pPP+5egIMA38qsMH3+8=;
        b=JRBc5XyVeDSoeA/6v1S5QmKZNTH3IjnuALERV5+iwbpjGLobjqApBBjseh8qiV1DqU
         tuIWVvhgwJEFH/Co7pFU16KgrDPn6SMpbw8qOMKrpg8cpTWhkpM3D9pgb4NaQdLtM+/v
         pwFOZegeot7qWEGNgVFr5yfEDYAm6UdJxDBoNG3yzhWMU9dUTaOAma+RJcutyxzGMQHu
         dsoAOp3hNuGk9rF1WdXIT12ZdwujT5rtFOHfWfo1PFxcv5DOdTgMWwDI2mZVznDvDX95
         CCtAv4ERv6daoSSJTbRMdbeT5DIALpmYgUkQvDlrIW9oNM8OBV6FA4CWl/iM/jPUnoQs
         J1dg==
X-Gm-Message-State: APzg51A3wRORzS4gHfkhPB/FkZA2olVsIscHIZq2kRHY7kmmdp6RJvcw
        +fzs45RjhTO4d2sphSELnAXMS+2OuXk=
X-Google-Smtp-Source: ANB0VdafNtS6bn8zpBGy4+22UbFlXFm9afg3lnfan+aWNnfrFDCy9OPItsc/ojIutsT3hL1045515w==
X-Received: by 2002:a1c:ed4:: with SMTP id 203-v6mr12447417wmo.96.1536569631643;
        Mon, 10 Sep 2018 01:53:51 -0700 (PDT)
Received: from [192.168.0.18] (cpc90716-aztw32-2-0-cust92.18-1.cable.virginm.net. [86.26.100.93])
        by smtp.googlemail.com with ESMTPSA id x15-v6sm13986746wrt.53.2018.09.10.01.53.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Sep 2018 01:53:50 -0700 (PDT)
Subject: Re: [PATCH v2 11/16] nvmem: add support for cell info
To:     Boris Brezillon <boris.brezillon@bootlin.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "David S . Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        David Lechner <david@lechnology.com>,
        Andrew Lunn <andrew@lunn.ch>, Alban Bedel <albeu@free.fr>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20180907100750.14564-1-brgl@bgdev.pl>
 <20180907100750.14564-12-brgl@bgdev.pl>
 <21ec4e6f-aa39-66cf-af32-d9e8e85f4961@linaro.org>
 <20180910093632.3a9337a9@bbrezillon>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <4c569813-aba0-8e9d-dfc8-653b6c2e365b@linaro.org>
Date:   Mon, 10 Sep 2018 09:53:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20180910093632.3a9337a9@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 10/09/18 08:36, Boris Brezillon wrote:
>>> --- /dev/null
>>> +++ b/include/linux/nvmem-machine.h
>> This should go in nvmem-consumer.h, I don't think we should add header
>> files for each usecase. These are nvmem consumers so lets put them in
>> correct header file.
> Actually no, it should go in nvmem-provider.h. Consumer should not be
> allowed to define cells, only reference existing ones.The usecase can be provider and consumer.
In arm machine use case it is a consumer and it other use cases this can 
be a provider.

I agree with you, It makes more sense to be in nvmem-provider.h

thanks,
srini
> 
> Regards,
> 
> Boris
