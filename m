Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83486C48BE5
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 20:48:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48F38610EA
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 20:48:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbhFOUui (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Jun 2021 16:50:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49686 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229931AbhFOUui (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Jun 2021 16:50:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623790112;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KQ07UnerLYYg5xbQ2D5ZXpRlZkXdV15KKy3dzWwHbIQ=;
        b=attKP6X/C6O43WgAOZ246NJ0T+bY9nH4n1CNdnqRCLxDf8+YI9FUF/JveNLK4/cWXIrLc4
        Lfad0dT1Mha1Sd3S37FvuYND59adziY0DLkEGQ77abFcyzesjA+vMdSW7ELAiHCqPQUC7D
        mxM6p3JVkzhiy4uA7RmT6aqJE3RDqjY=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-NFa8URkWNG6JgbwGyOPOHw-1; Tue, 15 Jun 2021 16:48:31 -0400
X-MC-Unique: NFa8URkWNG6JgbwGyOPOHw-1
Received: by mail-oi1-f199.google.com with SMTP id 19-20020aca12130000b02901f43fbf2170so8378655ois.5
        for <linux-doc@vger.kernel.org>; Tue, 15 Jun 2021 13:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=KQ07UnerLYYg5xbQ2D5ZXpRlZkXdV15KKy3dzWwHbIQ=;
        b=H2S2iOFzieQOe+rqsMOQ7MGUwH4Is+fNUD/NWT/+O5JzV41p0N2bfkd8yGzoFxv+9a
         hpjUBs1kybyj//SX5oiGoctmkIMIBwv2PsRuoWuVO20BOEkriocKnJDdoEZjhaqNRNaI
         lDtsB7jFpDPuO3OC0FmOEUVQ+NeIWz16TNgM7HLlbwmXrFdI9P21Cyj+dpirnNbvzgn7
         Rj3gdBxjrCvumwvtusnwaWa0yJBAzWdQpYsoSzKLltUeqbUlkSoMGT4dwNR4yHawSifO
         +HH53ZUCb6e9ynLdnmKj3nxrgW6s3a7amk1t0CWjekBEYSWg23k/rUGrGvZHSJmFU7af
         5JXw==
X-Gm-Message-State: AOAM532VXMr0dE46OBuZpyG6ZknSsdJNHu0avnYOmYzm7kCKRwxa5BmH
        h1sM1eYW/sQZIG+npEqOfyquYvT9kfR3zKTPp+apxa8iErEk9UcihSUEfTI1OQmo24SV0Yr5zOJ
        0gaBZwrywpKdgC9spLcf8
X-Received: by 2002:a05:6830:1f05:: with SMTP id u5mr876279otg.322.1623790110352;
        Tue, 15 Jun 2021 13:48:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvrGdxE+mzotrdFHuMpTK34RUPz5I1mTgC8N7HwfPe918vRPs0JpOJGFEIPWIQK4ioxDj+rg==
X-Received: by 2002:a05:6830:1f05:: with SMTP id u5mr876264otg.322.1623790110110;
        Tue, 15 Jun 2021 13:48:30 -0700 (PDT)
Received: from localhost.localdomain (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id i26sm1364oig.13.2021.06.15.13.48.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 13:48:29 -0700 (PDT)
Subject: Re: [PATCH v4 1/4] fpga: dfl: reorganize to subdir layout
To:     "Wu, Hao" <hao.wu@intel.com>, "mdf@kernel.org" <mdf@kernel.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "krzysztof.kozlowski@canonical.com" 
        <krzysztof.kozlowski@canonical.com>,
        "nava.manne@xilinx.com" <nava.manne@xilinx.com>,
        "Xu, Yilun" <yilun.xu@intel.com>,
        "davidgow@google.com" <davidgow@google.com>,
        "fpacheco@redhat.com" <fpacheco@redhat.com>,
        "Gong, Richard" <richard.gong@intel.com>,
        "luca@lucaceresoli.net" <luca@lucaceresoli.net>
Cc:     "linux-fpga@vger.kernel.org" <linux-fpga@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <20210614201648.3358206-1-trix@redhat.com>
 <20210614201648.3358206-3-trix@redhat.com>
 <DM6PR11MB381964374223D0D2958AFA6985309@DM6PR11MB3819.namprd11.prod.outlook.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <d64b0fb8-5f83-2995-7ee9-b4ed2932ef60@redhat.com>
Date:   Tue, 15 Jun 2021 13:48:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <DM6PR11MB381964374223D0D2958AFA6985309@DM6PR11MB3819.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 6/15/21 1:08 AM, Wu, Hao wrote:
>> Subject: [PATCH v4 1/4] fpga: dfl: reorganize to subdir layout
>>
>> From: Tom Rix <trix@redhat.com>
>>
>> Follow drivers/net/ethernet/ which has control configs
>> NET_VENDOR_BLA that map to drivers/net/ethernet/bla
>> Since fpgas do not have many vendors, drop the 'VENDOR' and use
>> FPGA_BLA.
> Hi Tom,
>
> Thanks for this patch. : )
>
> DFL is not a vendor, but something can be shared/reused. It's possible that
> other vendors reuse the same concepts and the drivers of DFL. If vendor
> drivers need to be moved inside sub folders, then maybe it's better to
> leave DFL in the parent folder?

xrt is also not a vendor, more a subdevice framework like dfl.

I am not sure what you mean by other dfl vendors can you give an example ?

>> There are several new subdirs
>> altera/
>> dfl/
>> lattice/
>> xilinx/
>>
>> Each subdir has a Kconfig that has a new/reused
>>
>> if FPGA_BLA
>>    ... existing configs ...
>> endif FPGA_BLA
>>
>> Which is sourced into the main fpga/Kconfig
>>
>> Each subdir has a Makefile whose transversal is controlled in the
>> fpga/Makefile by
>>
>> obj-$(CONFIG_FPGA_BLA) += bla/
>>
>> This is the dfl/ subdir part.
>>
>> Create a dfl/ subdir
>> Move dfl-* files to it.
>> Add a Kconfig and Makefile
>>
>> Because FPGA_DFL is now used in dfl/Kconfig in a if/endif
>> block, all the other configs in dfl/Kconfig implicitly depend
>> on FPGA_DFL.  So the explicit dependence can be removed.  Also
>> since FPGA_DFL depends on HAS_IOMEM, it can be removed from the
>> other configs.
> Hm.. sounds like this change (remove HAS_IOMEM) is better to be split
> into another patch. How do you think?

I'll drop this from the patchset so this so patchset does the one thing 
of moving stuff around and do the HAS_IOMEM change after stuff settles.

Tom

>
> Thanks
> Hao
>

