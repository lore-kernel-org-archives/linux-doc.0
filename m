Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 642FCC76196
	for <linux-doc@archiver.kernel.org>; Thu,  6 Apr 2023 14:10:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238701AbjDFOKI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Apr 2023 10:10:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238397AbjDFOJi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Apr 2023 10:09:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA10A277
        for <linux-doc@vger.kernel.org>; Thu,  6 Apr 2023 07:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680790096;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AT1MAIP9v4DHYB4m5xHxagncHIIMlg0uERfKC+FM+xk=;
        b=FJ4haGhA6rEW5O5nGatw51jhpSA6CADDsxcGFO44otSX2vIumBeoOFsNW+gMKM5+agKGsD
        2eD7XhBqEmsuSN9Iyw7ARphDdpQneeqakEl4PNSTBhBzja32rocLB4uMWticzZHfmLgyue
        jGkiT3vdq/e5U8lojVSF6lHt0mMvRdk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-1FGS7ITMPuujGRFJNxDx8A-1; Thu, 06 Apr 2023 10:08:15 -0400
X-MC-Unique: 1FGS7ITMPuujGRFJNxDx8A-1
Received: by mail-ej1-f70.google.com with SMTP id 18-20020a17090600d200b0093c44a07ad1so292509eji.2
        for <linux-doc@vger.kernel.org>; Thu, 06 Apr 2023 07:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680790093; x=1683382093;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AT1MAIP9v4DHYB4m5xHxagncHIIMlg0uERfKC+FM+xk=;
        b=8IUKvjzI6EH+N/8G5h8oHFAEiNwiOJ90OVzc/QDTetmzH9crGaGss/fsGxJ2rn68HB
         IBc6onkXZ1sKV2QwJyNdcpIf0UOq/1rkqJA4AmAVPJGDUHtAPIBpNj14gr8H3hBUCisF
         z6RPgvB1xkdyoOKQrZnzU/6jMfdfjEGys0PexjNDNjWC/XhgdkadXBChh+D2m8ZSZyeT
         8nh3Kjoa01l/ucdIKQbo6pb6+piFFjQMHsiSTSICLESWcXqlLaSoUSHBKsvuXaCwOWgw
         E6AARq0liwYxKKD0xO0BuWj2YtpGUs+rsXUp5nd3G0OdZ/wADZJkHRP63XfLKV2CR3GY
         +8Ug==
X-Gm-Message-State: AAQBX9eRHLXpNrCYqzPXFxFwEoaYxfaXBcZpFSBieS81y+G2GcqiLBWz
        gWALvMIdFhrw2jGFbzY8EvJh9MyX2ft17tXhN9tfhhCCl8+Blp7lkaV4A+fooZ77hHocP5Els07
        3urU7x96weixglv2l58I2SlY/BOu+
X-Received: by 2002:a17:907:a042:b0:93f:2114:9a1c with SMTP id gz2-20020a170907a04200b0093f21149a1cmr6362885ejc.45.1680790093369;
        Thu, 06 Apr 2023 07:08:13 -0700 (PDT)
X-Google-Smtp-Source: AKy350aYnPYE5+ik5n4GldzrrnSl94ImQLUG+CLdBCsnooZZBbVL3WumeFjJnRY5TgvfVBKjxVz+Iw==
X-Received: by 2002:a17:907:a042:b0:93f:2114:9a1c with SMTP id gz2-20020a170907a04200b0093f21149a1cmr6362870ejc.45.1680790093074;
        Thu, 06 Apr 2023 07:08:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s14-20020a170906bc4e00b0093338259b2bsm834536ejv.207.2023.04.06.07.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 07:08:12 -0700 (PDT)
Message-ID: <565e6575-91f7-9ca2-1505-17527b95a816@redhat.com>
Date:   Thu, 6 Apr 2023 16:08:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v7] Introduction-of-HP-BIOSCFG-driver-documentation
Content-Language: en-US, nl
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>
Cc:     Linux x86 Platform Drivers <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Documentation <linux-doc@vger.kernel.org>
References: <20230403211548.6253-1-jorge.lopez2@hp.com>
 <ZCuMkdb6jeL4S8hz@debian.me>
 <CAOOmCE-5NHkYcmBP1GGpr=sEoxF9jkjj1LevekEm8R0wbrM4xQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAOOmCE-5NHkYcmBP1GGpr=sEoxF9jkjj1LevekEm8R0wbrM4xQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi All,

FWIW I have been reading along with both the v6 and
this v7 posting.

Thomas, Mark, thank you for your review / feedback
on this series.

On 4/4/23 15:37, Jorge Lopez wrote:
> Hi Bagas,
> 
>>
>> Where is the rest of patches if this is a series? Had they been merged?
>>
> 
> There is only one change as requested by  Thomas Weißschuh
> 
>> Feel free to ONLY submit the patch with the documentation for the next
>> revision. Then we can nail down the interface and initial functionality
>> and you don't always have to adapt the code to the changing interface.
> 
> Perhaps, I misunderstood Thomas request.   I will address a few other
> comments and will submit all files again.

I think that Thomas' suggestion to first focus on getting
the userspace API right and then implement the agreed
upon API is a good idea.

So for the next version just post only the documentation
patch again please.

Note it is not the intention to merge just the documentation
patch without merging the code first.

The idea is to first nail the API down and then modify
the code once to implement the agreed upon API.

Then once the API has been agreed upon post newer
versions which also include the code again.

And then once people are also happy with the code
we can merge both the code + documentation in one go.

Regards,

Hans







> 
> Regards,
> 
> Jorge
> 

