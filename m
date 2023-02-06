Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80AB4C636D3
	for <linux-doc@archiver.kernel.org>; Mon,  6 Feb 2023 20:31:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbjBFUbv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Feb 2023 15:31:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbjBFUbu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Feb 2023 15:31:50 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7F8E2A994
        for <linux-doc@vger.kernel.org>; Mon,  6 Feb 2023 12:31:49 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id g6so3635725wrv.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Feb 2023 12:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oZGz/N+EtXFXjo58DVRXfyilGfBoD8ZSIHd32aC9uAk=;
        b=qVt6X7nK5L2aTBX3NzPXLdYxXaSBBHgcjYvq/eApTtZpLMf0tbHtNtxsMtBhw4MDwB
         divgFaZ6p21uIshKb24RzsHyyEcddqk7v07w1X+O98zHJ0qlHMNyzT8X/y9qQEdTL2uS
         GCGB+sIAmVoK0OhrgRs5OnwHHiMesOtiDpGLHWihKB1TIqkih2A2mH3gxY0vPItVoYYx
         9UoDjMHsrdrKZxoyqD8GEnOVHac79oOhoeSBazUbXzL9EPaynRy8YPdSjVdoFxYp3XX5
         4pWalI8IsrdBwHvjCCP2upLsXOsRJUE4JEy1nKh6C4gFIv7S35BY1gf1LAxAUc8AqXOl
         XZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oZGz/N+EtXFXjo58DVRXfyilGfBoD8ZSIHd32aC9uAk=;
        b=7CIleq1nDkYzxxH0v0JWZL5SUIbTQPMdAnC9QJOK7fBj94zZU1DmZPS2FIHzuW94VD
         dKJbsmwK6KUQ++1RRx2Ejz1Uo3uCSvbCcRASzW3J5p0NSFy10sdnT6VZjQItLpHqu25z
         SgBtKb+Ex6kDaSes1BFaljAS+EJW5kEubjTBn/aZRogprsXv8+v4LhueVO8F6Ur4IzUk
         Hl+7U5Lrck6fJ3fFKN8l71AV1sOw9QjNiSM+OmEb5DRhwQXEqi89SWbsYE0pdT6sxRMd
         qKzCjS3pcrkupI/dwKYhpEy81mTX6RztBhKfo1vxzl8zGVZXKBIK98Jjw5CE6Zlz/QiI
         d2+Q==
X-Gm-Message-State: AO0yUKWmf+452XEBNXio5/3CJi8gyBh3VeQwVWl3YFZPPVl+FhhK4mpD
        CN/Xe2J1ntp+hh3aMIWgl050nQ==
X-Google-Smtp-Source: AK7set+FP1+I2Mhte/do++ECfuJE/LYx7mWnb91D5rDmAmd2fBjyJ11Jm+SPnGKVt2AkedbMQyBJPA==
X-Received: by 2002:adf:f288:0:b0:2bd:e87c:e831 with SMTP id k8-20020adff288000000b002bde87ce831mr200596wro.69.1675715508181;
        Mon, 06 Feb 2023 12:31:48 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id q12-20020adfdfcc000000b002c3ec35f360sm2356622wrn.56.2023.02.06.12.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 12:31:47 -0800 (PST)
Message-ID: <81a5c400-e671-fab3-732a-d615fa4242b3@linaro.org>
Date:   Mon, 6 Feb 2023 20:31:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 00/21] nvmem: core: introduce NVMEM layouts
Content-Language: en-US
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Michael Walle <michael@walle.cc>
Cc:     Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Dan Carpenter <error27@gmail.com>
References: <20221206200740.3567551-1-michael@walle.cc>
 <20230103163902.218cb5c7@xps-13>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230103163902.218cb5c7@xps-13>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Michael/Miquel,

I had to revert Layout patches due to comments from Greg about Making 
the layouts as built-in rather than modules, he is not ready to merge 
them as it is.

His original comment,

"Why are we going back to "custom-built" kernel configurations?  Why can
this not be a loadable module?  Distros are now forced to enable these
layout and all kernels will have this dead code in the tree without any
choice in the matter?

That's not ok, these need to be auto-loaded based on the hardware
representation like any other kernel module.  You can't force them to be
always present, sorry.
"

I have applied most of the patches except

nvmem: core: introduce NVMEM layouts
nvmem: core: add per-cell post processing
nvmem: core: allow to modify a cell before adding it
nvmem: imx-ocotp: replace global post processing with layouts
nvmem: cell: drop global cell_post_process
nvmem: core: provide own priv pointer in post process callback
nvmem: layouts: add sl28vpd layout
MAINTAINERS: add myself as sl28vpd nvmem layout driver
nvmem: layouts: Add ONIE tlv layout driver
MAINTAINERS: Add myself as ONIE tlv NVMEM layout maintainer
nvmem: core: return -ENOENT if nvmem cell is not found
nvmem: layouts: Fix spelling mistake "platforn" -> "platform"
dt-bindings: nvmem: Fix spelling mistake "platforn" -> "platform"
nvmem: core: fix nvmem_layout_get_match_data()

Please rebase your patches on top of nvmem-next once layouts are 
converted to loadable modules.

thanks,
srini



On 03/01/2023 15:39, Miquel Raynal wrote:
> Hi Srinivas,
> 
> michael@walle.cc wrote on Tue,  6 Dec 2022 21:07:19 +0100:
> 
>> This is now the third attempt to fetch the MAC addresses from the VPD
>> for the Kontron sl28 boards. Previous discussions can be found here:
>> https://lore.kernel.org/lkml/20211228142549.1275412-1-michael@walle.cc/
>>
>>
>> NVMEM cells are typically added by board code or by the devicetree. But
>> as the cells get more complex, there is (valid) push back from the
>> devicetree maintainers to not put that handling in the devicetree.
>>
>> Therefore, introduce NVMEM layouts. They operate on the NVMEM device and
>> can add cells during runtime. That way it is possible to add more complex
>> cells than it is possible right now with the offset/length/bits
>> description in the device tree. For example, you can have post processing
>> for individual cells (think of endian swapping, or ethernet offset
>> handling).
>>
>> The imx-ocotp driver is the only user of the global post processing hook,
>> convert it to nvmem layouts and drop the global post pocessing hook.
>>
>> For now, the layouts are selected by the device tree. But the idea is
>> that also board files or other drivers could set a layout. Although no
>> code for that exists yet.
>>
>> Thanks to Miquel, the device tree bindings are already approved and merged.
>>
>> NVMEM layouts as modules?
>> While possible in principle, it doesn't make any sense because the NVMEM
>> core can't be compiled as a module. The layouts needs to be available at
>> probe time. (That is also the reason why they get registered with
>> subsys_initcall().) So if the NVMEM core would be a module, the layouts
>> could be modules, too.
> 
> I believe this series still applies even though -rc1 (and -rc2) are out
> now, may we know if you consider merging it anytime soon or if there
> are still discrepancies in the implementation you would like to
> discuss? Otherwise I would really like to see this laying in -next a
> few weeks before being sent out to Linus, just in case.
> 
> Thanks,
> Miquèl
