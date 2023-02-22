Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC072C636D6
	for <linux-doc@archiver.kernel.org>; Wed, 22 Feb 2023 15:08:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231820AbjBVPIo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Feb 2023 10:08:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbjBVPIo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Feb 2023 10:08:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C8F5125B8
        for <linux-doc@vger.kernel.org>; Wed, 22 Feb 2023 07:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677078480;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zRCEb4SvpDKPjZLK4vn9/q7q7Y3I8z1o20cZm/AYJwk=;
        b=J674CxC/A8mIk5DOt7XHpBdjO1Idf7raegOPYNJexLTDhcAA9i5YI34LMTIkCdwj+mNFyT
        2jaJwn4lWhPNnBcVSqKiDAYtP7eicUuEhzzpY2Y/T1rnpurwJLtmYyzr8F/VBM0y7WL0tw
        w4ubGX7wyhZ7wl6XzJRLeAXsLgEDP/w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-222-GeQN6x6COb61PA-IXEXkUg-1; Wed, 22 Feb 2023 10:07:57 -0500
X-MC-Unique: GeQN6x6COb61PA-IXEXkUg-1
Received: by mail-ed1-f70.google.com with SMTP id dm14-20020a05640222ce00b0046790cd9082so11614361edb.21
        for <linux-doc@vger.kernel.org>; Wed, 22 Feb 2023 07:07:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zRCEb4SvpDKPjZLK4vn9/q7q7Y3I8z1o20cZm/AYJwk=;
        b=2HRCoXPTLr66NgQXPxSkAepBLO02VjOOT8AZjTT/QuXsx0yqKAk1eiHyhXz05fRqN9
         ZdH4dBmvwvnkH2aQApgwJlOej6OG+mn50x2Ol+C37pPfBWTCaw3B8MrsLQ5bYqIV1adt
         wutplTwytJIpKgNYEldowANr+mh4hi2NZES6zJxvr3PyC48RXNt4oVyKmYa5qOI1XlZ9
         gBcte9gongmJE0SRWmaF/fYct4Gk0xIOHFdvRp2TwllQbGsTKJjy+DmhC61tPNHKL1kF
         VDWQifk/yR+29k2dehGWHNvhsxCsQuf47IjKFcteHJ3V+gOjuIz7rlXizSExLg7vCkIP
         9JfQ==
X-Gm-Message-State: AO0yUKWPkAHSdvR/A3xiXjONalMcXKkv6UioB19RJ017Iu8zAlu6JNQg
        vvpikzld8tsmQ+KWSa359Fcrhq8Oo7VwLLbV8ZH+wSh8oPJLl9CVI6tsIcioCWPrkw1ACxTNcRv
        kLyFoq/jsxTtjM0CNrxvq
X-Received: by 2002:a17:907:1623:b0:8b1:76dd:f5f6 with SMTP id hb35-20020a170907162300b008b176ddf5f6mr29151549ejc.50.1677078475595;
        Wed, 22 Feb 2023 07:07:55 -0800 (PST)
X-Google-Smtp-Source: AK7set8V2KGVMm3Rh6GnmJnl329zmNElexUMuVrYhLPpVZhOY6NIjF1ZDTeKB87CfdRbYWnWGPbc0Q==
X-Received: by 2002:a17:907:1623:b0:8b1:76dd:f5f6 with SMTP id hb35-20020a170907162300b008b176ddf5f6mr29151515ejc.50.1677078475224;
        Wed, 22 Feb 2023 07:07:55 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c? ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id q20-20020a170906771400b008e57b5e0ce9sm1160273ejm.108.2023.02.22.07.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 07:07:54 -0800 (PST)
Message-ID: <cc8eeaf4-31e7-98e4-a712-012fc604e985@redhat.com>
Date:   Wed, 22 Feb 2023 16:07:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH drm-next v2 05/16] drm: manager to keep track of GPUs VA
 mappings
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc:     airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, bskeggs@redhat.com,
        Liam.Howlett@oracle.com, matthew.brost@intel.com,
        boris.brezillon@collabora.com, alexdeucher@gmail.com,
        ogabbay@kernel.org, bagasdotme@gmail.com, willy@infradead.org,
        jason@jlekstrand.net, linux-doc@vger.kernel.org,
        nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
        Dave Airlie <airlied@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-6-dakr@redhat.com>
 <70ba382f-1559-289a-4922-ca9c371aaf59@amd.com>
From:   Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <70ba382f-1559-289a-4922-ca9c371aaf59@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/22/23 11:25, Christian König wrote:
> Am 17.02.23 um 14:44 schrieb Danilo Krummrich:

<snip>

>> +/**
>> + * DOC: Overview
>> + *
>> + * The DRM GPU VA Manager, represented by struct drm_gpuva_manager 
>> keeps track
>> + * of a GPU's virtual address (VA) space and manages the 
>> corresponding virtual
>> + * mappings represented by &drm_gpuva objects. It also keeps track of 
>> the
>> + * mapping's backing &drm_gem_object buffers.
>> + *
>> + * &drm_gem_object buffers maintain a list (and a corresponding list 
>> lock) of
>> + * &drm_gpuva objects representing all existent GPU VA mappings using 
>> this
>> + * &drm_gem_object as backing buffer.
>> + *
>> + * If the &DRM_GPUVA_MANAGER_REGIONS feature is enabled, a GPU VA 
>> mapping can
>> + * only be created within a previously allocated &drm_gpuva_region, 
>> which
>> + * represents a reserved portion of the GPU VA space. GPU VA mappings 
>> are not
>> + * allowed to span over a &drm_gpuva_region's boundary.
>> + *
>> + * GPU VA regions can also be flagged as sparse, which allows drivers 
>> to create
>> + * sparse mappings for a whole GPU VA region in order to support Vulkan
>> + * 'Sparse Resources'.
> 
> Well since we have now found that there is absolutely no technical 
> reason for having those regions could we please drop them?

I disagree this was the outcome of our previous discussion.

In nouveau I still need them to track the separate sparse page tables 
and, as you confirmed previously, Nvidia cards are not the only cards 
supporting this feature.

The second reason is that with regions we can avoid merging between 
buffers, which saves some effort. However, I agree that this argument by 
itself probably doesn't hold too much, since you've pointed out in a 
previous mail that:

<cite>
1) If we merge and decide to only do that inside certain boundaries then 
those boundaries needs to be provided and checked against. This burns 
quite some CPU cycles

2) If we just merge what we can we might have extra page table updates 
which cost time and could result in undesired side effects.

3) If we don't merge at all we have additional housekeeping for the 
mappings and maybe hw restrictions.
</cite>

However, if a driver uses regions to track its separate sparse page 
tables anyway it gets 1) for free, which is a nice synergy.

I totally agree that regions aren't for everyone though. Hence, I made 
them an optional feature and by default regions are disabled. In order 
to use them drm_gpuva_manager_init() must be called with the 
DRM_GPUVA_MANAGER_REGIONS feature flag.

I really would not want to open code regions or have two GPUVA manager 
instances in nouveau to track sparse page tables. That would be really 
messy, hence I hope we can agree on this to be an optional feature.

> 
> I don't really see a need for them any more.
> 
> Regards,
> Christian.
>  

