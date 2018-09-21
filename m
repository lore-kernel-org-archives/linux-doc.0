Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 54BF27D57F
	for <lwn-linux-doc@archive.lwn.net>; Fri, 21 Sep 2018 01:12:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725892AbeIUG6g (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 21 Sep 2018 02:58:36 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:37575 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbeIUG6g (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Sep 2018 02:58:36 -0400
Received: by mail-io1-f65.google.com with SMTP id v14-v6so10582844iob.4
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 18:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=igI8G2gByOR1QVu3jR/S0ca3gySr/uG/4VCZHJX5Y14=;
        b=R8ylbvqD69MSJTs4c9ZpdqsUcS7QRIU6mHETrd8ZV351pwh8f9ox8/JBTklLudIWAe
         Zh+WvsOdtbt6r+f8RVYvu1VQzCkRTjKG/NaAHIFiyveFN90FsAuTNtyHWvtiq8jH488i
         EkXYZMysp4A/OBJGV3D8E20w/bpXXkCiLuNhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=igI8G2gByOR1QVu3jR/S0ca3gySr/uG/4VCZHJX5Y14=;
        b=XkSUulZASBhX+CbQao6tEs14sjo6gLSFodYYowY/Dl/eZUcbw2W2E2BvFwHPQy+SBP
         Ic8PkTO9qaltv1YxYcjsxClVtC8gZoAtN7sLnFgQ4AMLJMxH4EXIzlhGO+STFcLA7U0j
         jaB677QolcpjUEszFV+c0QksyAQ0xokQDwjhNAHPIO6pbjvNcvHTBhomuEyljjDD75pE
         JjeChq+wAofrMWdOjB7yqXM+s/PZstxAfyobwaUKCavMelTSntWwZIqbkl3t2CgpSo/+
         GakIOcoC348cKP6hj7pybSWR/V7El+bZH97CdC8LSYjfKwW/I8T0oSKLUy6j8n48OJen
         H5VQ==
X-Gm-Message-State: APzg51AroMizlrctLfy/KNEHemSfv8c939JxXrIcxlogTlBgteKGd3/6
        qIgVjXC2rNJJz06WgnMDlBNpCg==
X-Google-Smtp-Source: ANB0VdZPOiXyC6lgWrm5kUcVWgXMFUGZ1LIztPSwnENI7PFxqajJ+IlEuaCCYEdH7+GXElF4Te6mWA==
X-Received: by 2002:a6b:bbc1:: with SMTP id l184-v6mr25400760iof.83.1537492338500;
        Thu, 20 Sep 2018 18:12:18 -0700 (PDT)
Received: from [10.199.96.233] ([209.82.80.116])
        by smtp.googlemail.com with ESMTPSA id f74-v6sm1574370itf.20.2018.09.20.18.12.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Sep 2018 18:12:17 -0700 (PDT)
Subject: Re: [PATCH v4 15/22] nvmem: add support for cell lookups from machine
 code
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "David S . Miller" <davem@davemloft.net>,
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
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20180914144011.27614-1-brgl@bgdev.pl>
 <20180914144011.27614-16-brgl@bgdev.pl>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <822f2631-43e3-b4e8-91f6-8c8e94be3dde@linaro.org>
Date:   Thu, 20 Sep 2018 18:12:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20180914144011.27614-16-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 14/09/18 07:40, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Add a way for machine code users to associate devices with nvmem cells.
> 
> This restores the support for non-DT systems but following a different
> approach. Cells must now be associated with devices using provided
> routines and data structures before they can be retrieved using
> nvmem_cell_get().
> 
> It's still possible to define cells statically in nvmem_config but
> cells created this way still need to be associated with consumers using
> lookup entries.
> 
> Note that nvmem_find() must be moves higher in the source file as we
> want to call it from __nvmem_device_get() for devices that don't have
> a device node.
> 
> The signature of __nvmem_device_get() is also changed as it's no longer
> used to retrieve cells.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>   drivers/nvmem/core.c           | 129 ++++++++++++++++++++++++++-------
>   include/linux/nvmem-consumer.h |  28 +++++++
>   2 files changed, 131 insertions(+), 26 deletions(-)

This patch and other follow on patches for core.c does not apply on top 
of 
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git/log/?h=char-misc-next

Please rebase and send!

thanks,
srini
