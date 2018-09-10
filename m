Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 481887D57F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Sep 2018 09:55:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727639AbeIJOsk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Sep 2018 10:48:40 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:34663 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727635AbeIJOsk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Sep 2018 10:48:40 -0400
Received: by mail-ed1-f68.google.com with SMTP id u1-v6so16041159eds.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Sep 2018 02:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=unYRDWjIMrkoqr4iNefiY8OtZceFXevztjbbjXtLjb0=;
        b=ShsfoSHhp77Rj7KZkQ+MXq0T5m2KzkVPbJEalMPeiFJ83UQ3uaYyz4jwvwcIbkL4WM
         Z9yqBwK2eo6kqjMLUMgbE/mj+qTCD94BL+UvFw3IMLTGLD9rSZsF2nbqeNkNDy59YCtX
         07+1IO03qtKEm9D0Yhx//PCBoJl1pc4ludXl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=unYRDWjIMrkoqr4iNefiY8OtZceFXevztjbbjXtLjb0=;
        b=VGsdmo8X+ffw5PXMSf5boM5bcl9RWWOrhXcN0o8csQjZt8LwPGHWiuKiBbsr7WlSXZ
         rbtKuKmjIxWcArgai6t+BlxjB648MDGYGCnqkXvv60SmlSwzkojSdDjxrrKo+KG+/Hav
         YgdQ25jX80iXaOqYCES731njByClfc9QmA/EU3yKSVRejEKAoeJzVhHRBDpByFozWEXm
         4p3xf9/y/m5CJmv22pwfY7tMWEmCMZF1/u6BuIhjBhAKYbTFhZBKgjHE1bB/UyzJxvch
         7AzDurryIkAffJqoxScBQ8PVFqaT3sbkXEZz3kEAyqG/VnLUFb0nNjbt6RPyQLGjwab0
         nNYQ==
X-Gm-Message-State: APzg51Durd++DX+MDKYieXIdXXcrWVebCOLRgHOcUhedXAw0vVEo+pG8
        c8EITaQ7x2UcNro6YwIMZ+qjHQ==
X-Google-Smtp-Source: ANB0VdbqhPcQg4Bb5X9z1rB7XnMRfq4Acg2AVQJyKZ9tiqpcXf9896pxANaaQwQWtsVGnw9kz/cYmg==
X-Received: by 2002:a50:8646:: with SMTP id 6-v6mr21777171edt.259.1536573324837;
        Mon, 10 Sep 2018 02:55:24 -0700 (PDT)
Received: from [192.168.0.18] (cpc90716-aztw32-2-0-cust92.18-1.cable.virginm.net. [86.26.100.93])
        by smtp.googlemail.com with ESMTPSA id d56-v6sm8217584edb.7.2018.09.10.02.55.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Sep 2018 02:55:24 -0700 (PDT)
Subject: Re: [PATCH v2 01/16] nvmem: remove unused APIs
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        David Lechner <david@lechnology.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>, Alban Bedel <albeu@free.fr>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20180907100750.14564-1-brgl@bgdev.pl>
 <20180907100750.14564-2-brgl@bgdev.pl>
 <c0b0c411-65f6-62f9-6d6d-2884e5a17250@linaro.org>
 <CAMRc=MfO01EQAfY4Uu3UwzzvhVOMF7_BpCOPVz2yVXqDgpb0AA@mail.gmail.com>
 <7e138142-8161-3646-4daf-619995baf395@linaro.org>
 <CAMRc=Mduu4CmLX5DFtJd8NSbzs5g65U9AmM=rbscit0JyQKVAQ@mail.gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <3dbd65e5-c948-a784-0362-930fc41b840e@linaro.org>
Date:   Mon, 10 Sep 2018 10:55:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMRc=Mduu4CmLX5DFtJd8NSbzs5g65U9AmM=rbscit0JyQKVAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 10/09/18 09:43, Bartosz Golaszewski wrote:
>>> this series. Later patches are MUCH cleaner thanks to this removal and
>>> I believe it makes them easier for review.
>> Am not sure about that, it definitely did not help me!
>>
> Why exactly? Aren't clean patches resulting from this removal easier
> to read then if they'd also have to take into account the burden of
> existing code that will be changes anyway later? I really don't see
> why you insist on removing this.

Here are few reasons:

1> TBH, This cleanup patch removes more than one feature from nvmem 
subsystem.
Ex: it remove ability to add static cell from nvmem config, secondly it 
removed ability to read/write cells directly using nvmem_cell_info.

2> If you do changes as part of each patch, it will be much traceable on 
what is changed exactly and will allow much better review, and 
understand the reasoning.

Having a clean start and writing code on top of it is alway nice, but we 
will definitely miss things in review in this particular instance.


thanks,
srini

> 
> Best regards,
> Bart
> 
