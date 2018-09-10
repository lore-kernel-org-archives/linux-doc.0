Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AB64E7D57F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Sep 2018 11:47:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727871AbeIJQlE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Sep 2018 12:41:04 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35846 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728015AbeIJQlE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Sep 2018 12:41:04 -0400
Received: by mail-wm0-f68.google.com with SMTP id j192-v6so21164783wmj.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Sep 2018 04:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ufAeW7MJCA82j6pshyChnwN4mX04NpJZKrfx1K2xeZs=;
        b=NgJbQSyPDwM+9BVK/GWkCtGd4GmiI7GOA6IpAM9LGkemHijGv2RdM8Pj3hMRvC3/bP
         vHLujbxv10bP5r+1r2APEHve71S4mjg5lauMKRuF9Pz5gL+0LnzMN03Rqr847IvzQzYT
         tO+1Fx/j21GoR5diT8R+icMZMyyMuFnIJhZVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ufAeW7MJCA82j6pshyChnwN4mX04NpJZKrfx1K2xeZs=;
        b=sehaVmQhC7F1718v9nivNjxGvZCfjTeD3QE5/PviRDaYAs/nCKuLJH8DFJfU82hrw8
         J2p3kQ17GfsUpfMyKpkVkGhI3CX4nkc2TmwzbHn+jlkPalntZvgNabygZBv0BK1Nih+B
         gYWIQwXQP13jf2GbRBxj7kYi3L8HQjEAahCuiBuX+g7tbvg3SADs6rhKvgCGZGZ2hCrO
         x6byCT398joWulZ3fObfv8RkESlKVu33JpHYsGc/zTNh/5SsXwSoEn/a4DykmT5Icw2M
         z/+N9kH+O68tVL3H93L5eUw/8gneTqTcluHRYj5omE9eMOeFLtGu4LPrWkvE+zSrzZvi
         h/zg==
X-Gm-Message-State: APzg51Aj0FlFliC46aeVyGhZ3YMY7XCWqsFCWIT/fFeNW3cPSTkycjHs
        /sQLC53hlec2QxwwrtL4ZG8Rsw==
X-Google-Smtp-Source: ANB0VdYZ9gV81M3Q6+G3dyNtbf/7ljgSPkpCsHyg0YrPUWFwf76dyPABy6Uod9vbJXzkE4j608HF7A==
X-Received: by 2002:a1c:2dc8:: with SMTP id t191-v6mr448744wmt.94.1536580041574;
        Mon, 10 Sep 2018 04:47:21 -0700 (PDT)
Received: from [192.168.0.18] (cpc90716-aztw32-2-0-cust92.18-1.cable.virginm.net. [86.26.100.93])
        by smtp.googlemail.com with ESMTPSA id 184-v6sm29031685wmv.6.2018.09.10.04.47.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Sep 2018 04:47:21 -0700 (PDT)
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
 <3dbd65e5-c948-a784-0362-930fc41b840e@linaro.org>
 <CAMRc=Mck=rAJ6jbm57ZecJWNvOYR5pjLy0JnyxFzA8kFvoK7Ew@mail.gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ec2ba4af-46cf-2025-1670-cbed366d0f15@linaro.org>
Date:   Mon, 10 Sep 2018 12:47:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMRc=Mck=rAJ6jbm57ZecJWNvOYR5pjLy0JnyxFzA8kFvoK7Ew@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 10/09/18 12:31, Bartosz Golaszewski wrote:
> About that: there are no users of nvmem_device_cell_read/write()
> currently and with the new API I'm not sure this is still needed. Are
> you alright with removing those two?

Why do you want to remove them? Other than reason of no users.

All it boils down to if we support device based apis using cell info or 
not?
IMO, I see no harm in leaving these apis as it is, unless there is a 
strong reason to do so.

thanks,
srini
