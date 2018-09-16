Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7D8F17D57F
	for <lwn-linux-doc@archive.lwn.net>; Sun, 16 Sep 2018 14:08:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728499AbeIPTbz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 16 Sep 2018 15:31:55 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:37334 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728498AbeIPTbz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 16 Sep 2018 15:31:55 -0400
Received: by mail-io1-f65.google.com with SMTP id v14-v6so9490769iob.4
        for <linux-doc@vger.kernel.org>; Sun, 16 Sep 2018 07:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wFr0Cg2J3IgxpyZK3ZQa/R1nse2QZZ8G3FN6hiIkXC8=;
        b=JpevIQArxcFMe+JcgDnc6M7Anqt8DOp0L+TDqcnFShDxnTYJRfw3pI+zKH6DyDpK/c
         OfygbIc8/82xSA8N+l1NCDo9ZTz+lGuXPXahrkD2ko9IPsbV3PEFr3wTUVqgbuybVz8y
         ROsw4yGvEgE8Rhf65Tv8ReR7pW+ZCa54vATso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wFr0Cg2J3IgxpyZK3ZQa/R1nse2QZZ8G3FN6hiIkXC8=;
        b=Ixe0cmAmaks6wP0UoVbvXmZVxr1ecKTrbA+6s2lBstV5xKD6hlyQ+FN6STTTI+j/qc
         Zxm0NVyuGqPTzafhNlyueq3768T6LBgdDZAXip+nf6O6K/eC0frqxrQj/Ohkw6g65726
         WCPQ+OpX8pvDoM4X1XCSnye/PoiBP02wMM2RIvnZ+qdyRoeDd7UEyCJVRRyCO5MfxVZm
         RxE3GO6Hmtc7xqHKammlYb/7h2Y1HxjOn9p06pa+OzgQO8KRgPcx45ZC2+8g3le7tmXA
         ljkubXAC7gSZE5eQhZDENPzCTfinxtuyJdo7PE1EWB61/s1AiQfYSEiVBQXAaABoxp3I
         ulYw==
X-Gm-Message-State: APzg51De0BggYMtjqCxVQBPcbimhiA6mv4AjgYdnR5BJpJTOmfnxTumq
        a3D7R95aaXgTL2cqBF0l3y453g==
X-Google-Smtp-Source: ANB0VdZZ2SSKS7LRck9f3DKEDCAaxLHCMcb/ua3pc/dA0EDHm+6bG3dRlekeuYcD16Z9qwKxZLRJjA==
X-Received: by 2002:a6b:ce19:: with SMTP id p25-v6mr266324iob.243.1537106929220;
        Sun, 16 Sep 2018 07:08:49 -0700 (PDT)
Received: from [10.199.96.233] ([209.82.80.116])
        by smtp.googlemail.com with ESMTPSA id x68-v6sm2778580ita.2.2018.09.16.07.08.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Sep 2018 07:08:48 -0700 (PDT)
Subject: Re: [PATCH v4 00/22] nvmem: rework of the subsystem for non-DT users
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
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <2507f7cc-89ec-0cd2-9dec-68aee1350ac8@linaro.org>
Date:   Sun, 16 Sep 2018 15:08:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20180914144011.27614-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 14/09/18 15:39, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> NOTE: I decided to post v4 despite no new reviews from Srinivas as I'll
> be off next week. There were a couple issues reported by the kbuild bot
> and one bug I noticed after sending v3.
> 
> This series contains nvmem framework changes prerequisite for further
> development of my previous series[1] that aims at removal of the
> platform data struct from at24 EEPROM driver.
> 
> The patches are conceptually split into a couple groups.
> 
> First five patches fix issues with existing issues.
> 
> Patch 6 switches the nvmem providers to using kref which is necessary
> for removal of the return value from nvmem_unregister(). This is an
> approach similar to the one used in the clock framework where the
> provider is only removed after the last reference to it is dropped.
> 
> Patch 7 changes the errno returned from the driver after kzalloc()
> fails from -EINVAL to -ENOMEM which makes more sense.
> 
> Patches 8-10 convert last remaining users of nvmem_unregister() who
> still check its return value to using devm_nvmem_unregister() and
> patch 11 changes its return value from int to void.
> 
> Patches 12-15 introduce the most significant changes of this series:
> we remove the global cell list, add support for static cell definitions
> external to the provider structure, change the way DT lookup works and
> allow to associate resources and consumers using lookup tables. The way
> nvmem_cell_get() for non-DT users is changed but there are no current
> users and it's currently broken anyway (cell being removed after a call
> to nvmem_cell_put()).
> 
> Patch 16 updates the documentation.
> 
> Patch 17 adds support for notifiers to nvmem so that users can
> subscribe for events such as device or cell registration or removal.
> 
> Patches 18 & 19 add some minor improvements to the codebase.
> 
> Last three patches contain fixes to warnings emitted by checkpatch.
> It's a good moment to add them if we're already touching a big part
> of the subsystem's code.
> 
> Tested both DT and non-DT use cases.
> 
> [1] https://lkml.org/lkml/2018/8/10/149
> 
> v1 -> v2:
> - extended the lookup structure with a proper con_id independent from the
>    cell name defined in the cell definition table
> - added a patch that makes the naming convention for the cell name argument
>    in the nvmem_cell_get() family of functions consistent
> - there were two users of nvmem_unregister() that still checked the return
>    value, now switched to devm_nvmem_register()
> - fixed build failures reported by kbuild test robot
> 
> v2 -> v3:
> - dropped the patch removing unused APIs and introduced changes on top of
>    existing code instead
> - fixed nvmem provider reference decreasing in error paths
> - added checkpatch fixes
> - removed nvmem-machine.h and distributed new definitions among existing
>    consumer and provider headers
> - reordered patches thematically
> - added more patches fixing issues in existing codebase
> 
> v3 -> v4:
> - fixed the notifier chain call when removing nvmem devices: call the
>    notifier chain for NVMEM_REMOVE before releasing any resources
> - added patch 7/22 ("sunxi_sid: return -ENOMEM if kzalloc() fails")
> - fixed the return value in error path for patch 8/22 ("sunxi_sid: use
>    devm_nvmem_register())"
> - fixed the return value of devm_nvmem_unregister() in
>    patch 11/22 ("change the signature of nvmem_unregister()")
> 
> Bartosz Golaszewski (22):
>    nvmem: provide nvmem_dev_name()
>    nvmem: remove the name field from struct nvmem_device
>    nvmem: use list_for_each_entry_safe in nvmem_device_remove_all_cells()
>    nvmem: remove a stray newline
>    nvmem: check the return value of nvmem_add_cells()
>    nvmem: use kref
>    nvmem: sunxi_sid: return -ENOMEM if kzalloc() fails
>    nvmem: sunxi_sid: use devm_nvmem_register()
>    nvmem: lpc18xx_eeprom: use devm_nvmem_register()
>    nvmem: mxs-ocotp: use devm_nvmem_register()
>    nvmem: change the signature of nvmem_unregister()
>    nvmem: remove the global cell list
>    nvmem: add support for cell info
>    nvmem: resolve cells from DT at registration time
>    nvmem: add support for cell lookups from machine code
>    Documentation: nvmem: document cell tables and lookup entries
>    nvmem: add a notifier chain
>    nvmem: use SPDX license identifiers
>    nvmem: make the naming of arguments in nvmem_cell_get() consistent
>    nvmem: use EOPNOTSUPP instead of ENOSYS
>    nvmem: fix commenting style
>    nvmem: use octal permissions instead of constants

Thanks for working on this!
Nice work!

Overall the patchset looks good!

I will send these to Greg KH along with other nvmem patches sometime 
this week!



-srini
