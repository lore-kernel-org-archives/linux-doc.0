Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1D7C48BD1
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 13:11:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B65CD613BE
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 13:11:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231379AbhFINNs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Jun 2021 09:13:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31588 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233244AbhFINNr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Jun 2021 09:13:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623244312;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XgFc0zAfSH9zoyjC3GQjE2BQSADVujKZP1GLq4MokGU=;
        b=EnktJ4S8SKNHS8wZRvMNWfsxCyIfdhToWA6+GEbIC3aLuWmPHkFB0AAZ3mcdRGODHd6TYZ
        IheE4WLbQc4LsSQ58E2gC0slfXnlNKd1Nq2V2sT9pcb6uEWCwuq7yqcGwsZ1VxrTFU6tUF
        69lvvF162QnilGp0sUXuXr9mfK4ZYg4=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-TXQ0den3Pa2PkPEv1A1erg-1; Wed, 09 Jun 2021 09:11:51 -0400
X-MC-Unique: TXQ0den3Pa2PkPEv1A1erg-1
Received: by mail-ot1-f71.google.com with SMTP id 88-20020a9d06e10000b029030513a66c79so16326930otx.0
        for <linux-doc@vger.kernel.org>; Wed, 09 Jun 2021 06:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=XgFc0zAfSH9zoyjC3GQjE2BQSADVujKZP1GLq4MokGU=;
        b=dpiTlJJprLieUsoiPeHsUNn3Rdn1sFrLIFJgtsxWgtFTFLncKV9sOTJ9ttb0ibRhEz
         bRw8q/+qKu30OkF+BHRjO3RVh5HEQ75j4w1b+iwnwULOWYDfZKIyPm86CELdibndvsB7
         v9MMUquKDH6tJ02cWPXJcW9tQVFUVVnIMSPsmdSVgqOfKX8YuLzkJNjeQaOTn4B8uesG
         xb4Uo/zhE+3wjU4KSFgyXJ+ODG0Gn0qPHKhti68NSP5wVaTleAuJ1Gk+C2XaNBJ1tbti
         venym46flxrCvfBjKJjPKnxNErdaXTOLbzORPVI86bS3lgR3aYXhJqoOZXPJcoLyucS8
         LILg==
X-Gm-Message-State: AOAM530wQqNZjt/Lirzoqfg3mWQViltAIbLdDaOuYyRUiRuCnVmDR022
        EmYqw7s75vBKntYBMEO4LTFa2ENwZRJgg7fC/bJD3P8CbpAAx9OiPaYZgyneyKHpXtN2Iz/GeNk
        hv5roamBJ10Zm1cBGOwLv
X-Received: by 2002:aca:53ca:: with SMTP id h193mr6249691oib.69.1623244311124;
        Wed, 09 Jun 2021 06:11:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLzHDUiczC4stYreaSJhKbN33Csqcp7tNRJT12jaa/wjcuUx4sflehsByzCl8QS3RSlUYwZA==
X-Received: by 2002:aca:53ca:: with SMTP id h193mr6249678oib.69.1623244310984;
        Wed, 09 Jun 2021 06:11:50 -0700 (PDT)
Received: from localhost.localdomain (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id g38sm224499otg.28.2021.06.09.06.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 06:11:50 -0700 (PDT)
Subject: Re: [PATCH 0/7] fpga: reorganize to subdirs
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     hao.wu@intel.com, mdf@kernel.org, corbet@lwn.net,
        michal.simek@xilinx.com, dinguyen@kernel.org,
        krzysztof.kozlowski@canonical.com, nava.manne@xilinx.com,
        yilun.xu@intel.com, davidgow@google.com, fpacheco@redhat.com,
        richard.gong@intel.com, luca@lucaceresoli.net,
        linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210608162340.3010204-1-trix@redhat.com>
 <20210608162340.3010204-2-trix@redhat.com> <YMCRRm/lB2+gfpS9@kroah.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <a4e6f928-60c9-a8dc-9999-284c77dc152e@redhat.com>
Date:   Wed, 9 Jun 2021 06:11:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMCRRm/lB2+gfpS9@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 6/9/21 3:00 AM, Greg KH wrote:
> On Tue, Jun 08, 2021 at 09:23:33AM -0700, trix@redhat.com wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> The incoming xrt patchset has a toplevel subdir xrt/
>> The current fpga/ uses a single dir with filename prefixes to subdivide owners
>> For consistency, there should be only one way to organize the fpga/ dir.
>> Because the subdir model scales better, refactor to use it.
>> The discussion wrt xrt is here:
>> https://lore.kernel.org/linux-fpga/68e85a4f-4a10-1ff9-0443-aa565878c855@redhat.com/
>>
>> Follow drivers/net/ethernet/ which has control configs
>> NET_VENDOR_BLA that map to drivers/net/ethernet/bla
>> Since fpgas do not have many vendors, drop the 'VENDOR' and use
>> FPGA_BLA.
> Why did we get two 0/7 emails?

Errr.. no clue,

I'll resend the set.

Tom

> confused,
>
> greg k-h
>

