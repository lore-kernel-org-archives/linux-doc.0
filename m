Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC927C4332F
	for <linux-doc@archiver.kernel.org>; Fri, 21 Oct 2022 08:10:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbiJUIK0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Oct 2022 04:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbiJUIKY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Oct 2022 04:10:24 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 530FC1213C1
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 01:10:16 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id pq16so1798514pjb.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 01:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lXzKjs0QuMJFHhHxqVj+9SnjfrHwM3NF7YIpt7TNTaI=;
        b=Mys3W+v6NhbOdm7NK0w/s1vYs/tSmZ9FEvVzZmbw6YJc//vUdLNLAE6ZH2f35RE+1F
         gPEDc9WjHtuOxTpj1+IrzWgUObf4K3kneIO9OE8z5a2ndn0U5sXu8UbVyxR70Pd7pIPo
         rAr4qbDHfPu/RSlFI5p3AyhkdVbFatymvOUxjquprgHcdi5UAvqc4Qx99rbZq0qyZTdY
         KwJO9pgLRPE/YA49BxLSXCPZcRnXKe1aCWmKmxLtoY6glHeVvY2BR4ubrAx40DDW574j
         OqMGYuaSqT2k0oK+Xvcclc96aSkwxK/nln9vF58um4Y7Z4MTvv4ERaS7rs+iLY4cMeiu
         kn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lXzKjs0QuMJFHhHxqVj+9SnjfrHwM3NF7YIpt7TNTaI=;
        b=Nl8jI8wAIUsLw+pIV1zNP+TNnD9gWpHmQmGozEoUiVcpO+x2RVZz7A7+QnnK08u8RW
         ajRIJH+DxNJkOch6PUOiC/MbzBQKgec3Yfx9MAoQPpUTLGA8MstyLEPWhFavK0b/OjK7
         aT3eFt4+QaCSaCGrkewIx7Uo7HaNzDvohJ7McbZJUSXWZXK7iloElOmVU0L1AlO8MnAx
         V5l3tFBZZ5tajY+k5jIC0Y4dLSgYqOpc63xYxsyl+46ogZHAEhVLl4/9ZfAkpM4VkvBD
         yPU2emf1kKhespVhCk8JmwzZLHZrCdZt3EJ4Qd9qXtyTa5H4KKQYi6AD+y55Dw2gFCLf
         sHjA==
X-Gm-Message-State: ACrzQf3ZMM1k2B9SG/urdyPo/vo/4p+FFhK2k4/bUkMF+Xregtzlt2lB
        XBjMGDF3Zyzm240LMRtQzbw=
X-Google-Smtp-Source: AMsMyM5sAFDn2m7eU1IO1HLR+Dj5DRv48PD66GqVJlKBjSno4da6VVojeRmW/AHTGunJwekUL3XgVA==
X-Received: by 2002:a17:90b:350d:b0:20d:5438:f594 with SMTP id ls13-20020a17090b350d00b0020d5438f594mr57585559pjb.216.1666339815632;
        Fri, 21 Oct 2022 01:10:15 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-84.three.co.id. [180.214.232.84])
        by smtp.gmail.com with ESMTPSA id 33-20020a17090a09a400b0020647f279fbsm1108879pjo.29.2022.10.21.01.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 01:10:15 -0700 (PDT)
Message-ID: <12aeed77-081c-ac40-4b6e-0415d551804e@gmail.com>
Date:   Fri, 21 Oct 2022 15:10:06 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v5 01/10] gna: add PCI driver module
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
        Tomasz Jankowski <tomasz1.jankowski@intel.com>,
        Jianxun Zhang <jianxun.zhang@linux.intel.com>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-2-maciej.kwapulinski@linux.intel.com>
 <Y1IeJplXNHM+VvCJ@kroah.com>
Content-Language: en-US
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <Y1IeJplXNHM+VvCJ@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/21/22 11:20, Greg Kroah-Hartman wrote:
> On Thu, Oct 20, 2022 at 07:53:25PM +0200, Maciej Kwapulinski wrote:
>> Add a new PCI driver for Intel(R) Gaussian & Neural Accelerator
> 
> Please drop all of the (R) stuff in here, and in the Kconfig file and in
> the .c files.  If your lawyers insist on it, please point them at me and
> I will be glad to discuss it with them.
> 
>>  Documentation/gpu/drivers.rst    |  1 +
>>  Documentation/gpu/gna.rst        | 64 ++++++++++++++++++++++++++++++++
> 
> Why not just put the tiny documentation file in the .c code itself?
> That way it stays up to date and might actually be noticed?
> 

I think the documentation should be on separate patch.

-- 
An old man doll... just what I always wanted! - Clara

