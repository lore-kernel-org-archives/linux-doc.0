Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E828F7DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 23:38:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933113AbeD0Xia (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 19:38:30 -0400
Received: from mail-qk0-f196.google.com ([209.85.220.196]:39326 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932700AbeD0Xi2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Apr 2018 19:38:28 -0400
Received: by mail-qk0-f196.google.com with SMTP id z75so2752912qkb.6;
        Fri, 27 Apr 2018 16:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5eakc9mYSd8RRntzVz/RAAENdGyvpAee0tDadDhCxg4=;
        b=EHxmyXDsBz+ksiC1lOWFnM9nL6RaNm9s0SZ4KDydBHdP99pV0EQ42epSsKBLGGPKBn
         75PP/E6h2yRfrRg2DkAcJ3Gtla//Aj90HJ2I+hnFnraHm0qaksBon213b9AXYCYcHKK1
         rRUHkfp3ZWoRxHN7aFIOVluBahjB8yb7LpeNDftAqcT/G2cfXvH5GK7YjWI0WLsPxouq
         eQRC2PEg1Fx+/agdxK7HZf7NAWUukwbSKam6C4Si+cKO7WaP8Enkm8YIck+2z4VhSxcv
         LWFVeL3Bxrdbwq65Bf9HawOT7MjrtYkW2B7s2kCbzNeW3V1nEm5N/XfhWX+jom+lvgHe
         UlUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=5eakc9mYSd8RRntzVz/RAAENdGyvpAee0tDadDhCxg4=;
        b=GCVHk+duizss6FA3PLsY8YE99+jrbD3i/8Y5UU5trAEdoNkrQEGFVf0xzTE56Z8s+B
         /uXidw9I/GrtylzMYQ59R6OwIblN+5yGGl/46cm88gAUqD7Ji/F91riI7ZJEDjVpodCA
         +rlxyYMiZXFveEL+mzY611+dKE/ajxUin8xXdKEWO/Ti97ncx//SxAc9DCoiCf6UPR2K
         6NnCuMEjC/idBpGgRsdkid5RpwJ78ruVK+oxvXEnAgAicwXE0+tF4w8slqOY3Q/PlWxM
         RAdk9yDO7kMPbVFQXVyClMSgWeZJYCKCoOTWxiDamBN5JRbAScbujgK67v8I4wbgCREi
         Y23Q==
X-Gm-Message-State: ALQs6tAnaOXBwBNfuEtiakRi3PPpHfEX9t5i84ZeU3/uYpQM6E7JQsQt
        WJrJ6u2ZPQo/zbsGtTtbhRNLSd3l
X-Google-Smtp-Source: AB8JxZqLwiHkbMFp99Mpp1PX15lm/HCc5QeQbQq741R+rGkriHNZq46ahHHWfxCCLq5Rg0chVMAf5Q==
X-Received: by 10.55.148.194 with SMTP id w185mr3574588qkd.351.1524872306979;
        Fri, 27 Apr 2018 16:38:26 -0700 (PDT)
Received: from [10.69.41.93] ([192.19.223.250])
        by smtp.googlemail.com with ESMTPSA id c123sm1807706qkd.74.2018.04.27.16.38.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Apr 2018 16:38:26 -0700 (PDT)
Subject: Re: [PATCH 2/4] fpga: manager: change api, don't use drvdata
To:     Alan Tull <atull@kernel.org>
Cc:     Moritz Fischer <mdf@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-fpga@vger.kernel.org,
        linux-doc@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
References: <20180427012605.28981-1-mdf@kernel.org>
 <20180427012605.28981-3-mdf@kernel.org>
 <152cb232-ea4d-292b-8b60-8bdc1732dc23@gmail.com>
 <CANk1AXTZhCA78eX9j5dg1VeNyg8G4+hsiSgG_CYpZObjJw+wfw@mail.gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
Message-ID: <8938518c-6e12-51f5-4747-8caab916fc3a@gmail.com>
Date:   Fri, 27 Apr 2018 16:38:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CANk1AXTZhCA78eX9j5dg1VeNyg8G4+hsiSgG_CYpZObjJw+wfw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/27/2018 04:30 PM, Alan Tull wrote:
> On Fri, Apr 27, 2018 at 1:26 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:
>> On 04/26/2018 06:26 PM, Moritz Fischer wrote:
>>> From: Alan Tull <atull@kernel.org>
>>>
>>> Change fpga_mgr_register to not set or use drvdata.  This supports
>>> the case where a PCIe device has more than one manager.
>>>
>>> Add fpga_mgr_create/free functions.  Change fpga_mgr_register and
>>> fpga_mgr_unregister functions to take the mgr struct as their only
>>> parameter.
>>>
>>>   struct fpga_manager *fpga_mgr_create(struct device *dev,
>>>                 const char *name,
>>>                 const struct fpga_manager_ops *mops,
>>>                 void *priv);
>>>   void fpga_mgr_free(struct fpga_manager *mgr);
>>>   int fpga_mgr_register(struct fpga_manager *mgr);
>>>   void fpga_mgr_unregister(struct fpga_manager *mgr);
>>>
>>> Update the drivers that call fpga_mgr_register with the new API.
>>
>> Apologies for chiming in so late, this commit does not make it clear
>> that fpga_mgr_unregister() now also free the 'mgr' argument by calling
>> fpga_mgr_free(), this is kind of detail, but an API should make that
>> clear IMHO.
> 
> If people follow the usage information, in
> Documentation/fpga/fpga-mgr.txt, they'll do the right thing.  But I
> can add a patch that clarifies the description of fpga_mgr_unregister
> in fpga-mgr.c that it "unregisters and frees" the manager.

Just mentioning that because not all APIs do this, take the network
devices: there is an unregister_netdev() and a free_netdev(). Either way
is fine with me as long as it is documented as such, I had to look at
the API implementation to figure out that, no, all the drivers were not
leaking their fpga_manager instance in their .remove() function :)
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
