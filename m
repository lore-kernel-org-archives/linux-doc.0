Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDAF6C433F5
	for <linux-doc@archiver.kernel.org>; Wed,  6 Oct 2021 08:02:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C403961019
	for <linux-doc@archiver.kernel.org>; Wed,  6 Oct 2021 08:02:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237593AbhJFID4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Oct 2021 04:03:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33077 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237637AbhJFIDf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Oct 2021 04:03:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633507302;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c35aybOfo9pBjuNizm0LjauEBD0q9opIWAMl2tyAep0=;
        b=ew1kRMcaZlDAs3lOHkbXAsJmzOQJhQJ0m9jpJqbTuHAlc1VpXvwayozFr/uoTgE9K+0qSM
        pF7bn2a4Ofm17u5Y+60d39faDaGT7+DR0A6cpLVsq79Pei06MO9sTxfIE7++O4G6xCTs3K
        GsP/cEQqvwXCKP3Z3JPunqt73X9U2cg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-r0YpvjBgOz-9GB7YJhiNiA-1; Wed, 06 Oct 2021 04:01:41 -0400
X-MC-Unique: r0YpvjBgOz-9GB7YJhiNiA-1
Received: by mail-wr1-f69.google.com with SMTP id h11-20020adfa4cb000000b00160c791a550so1153994wrb.6
        for <linux-doc@vger.kernel.org>; Wed, 06 Oct 2021 01:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=c35aybOfo9pBjuNizm0LjauEBD0q9opIWAMl2tyAep0=;
        b=REXYborLWMoxtJ5BVEiS3rbxofnN6dAWu7Cq8Vg1+P6XBVc/L+blhA646zegi7Sjt+
         apRgQ4hXH5TdIaUHHk0N0gp0UxdIJQhE0UiH6VTi9ESYWZkYvIJ5qHwr71UGu7/2L2Kl
         AVb1HaRMn5+MBWVBpBaXzpJxmSFRzpMMS0ioGJPDI+i1Rkq7jRJ3tFm5D6GwgjU0BSRF
         N9pDev54IYMxQxqq+xy95l8rzOwpJZ4V/yxJw4hCD7V6/H05tzoYVbnpaVUpLcpKAeSQ
         HoeECn2NVGBwbBzm1ATTxEZwrORzpanzB+4VujhsLiSOt4vwjYfzFvJbXPJzMPvx/5WY
         yLeg==
X-Gm-Message-State: AOAM5312yXNFc2XkZNbPZYTCE1dATtxqy2I1ktTvSW8TS0txG0nZJq/i
        98OL0NDjVah49n3GafIyocMfPXwNsF2Lx+rnlLHyQAfo0uQtMcaWCmQg7hDFc5KDFsYL9qUWT0H
        jSEjh5SgGRc+gLVQylJgm
X-Received: by 2002:a05:600c:1992:: with SMTP id t18mr2699800wmq.48.1633507300590;
        Wed, 06 Oct 2021 01:01:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyJvYkKNT0PnZsl8y/R4yENzonm/o0NU+J2mMwAgmnH5NfAQA3pCU7qmNSg1WRzAjBTWX+Xg==
X-Received: by 2002:a05:600c:1992:: with SMTP id t18mr2699788wmq.48.1633507300300;
        Wed, 06 Oct 2021 01:01:40 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6529.dip0.t-ipconnect.de. [91.12.101.41])
        by smtp.gmail.com with ESMTPSA id a2sm6465397wru.82.2021.10.06.01.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 01:01:39 -0700 (PDT)
To:     Mike Rapoport <rppt@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.de>, linux-doc@vger.kernel.org,
        linux-mm@kvack.org
References: <20210930144117.23641-1-david@redhat.com>
 <20210930144117.23641-4-david@redhat.com> <YVzvYmf4xWC1DORO@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 3/3] memory-hotplug.rst: document the "auto-movable"
 online policy
Message-ID: <4bab9000-0b49-a852-d574-1c8b2fe10de1@redhat.com>
Date:   Wed, 6 Oct 2021 10:01:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YVzvYmf4xWC1DORO@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 06.10.21 02:35, Mike Rapoport wrote:
> On Thu, Sep 30, 2021 at 04:41:17PM +0200, David Hildenbrand wrote:
>> In commit e83a437faa62 ("mm/memory_hotplug: introduce "auto-movable" online
>> policy") we introduced a new memory online policy to automatically
>> select a zone for memory blocks to be onlined. We added a way to
>> set the active online policy and tunables for the auto-movable online
>> policy. In follow-up commits we tweaked the "auto-movable" policy to also
>> consider memory device details when selecting zones for memory blocks to
>> be onlined.
>>
>> Let's document the new toggles and how the two online policies we have
>> work.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   .../admin-guide/mm/memory-hotplug.rst         | 128 +++++++++++++++---
>>   1 file changed, 108 insertions(+), 20 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
>> index ee00b70dedde..c20a2c0031cf 100644
>> --- a/Documentation/admin-guide/mm/memory-hotplug.rst
>> +++ b/Documentation/admin-guide/mm/memory-hotplug.rst
>> @@ -165,9 +165,8 @@ Or alternatively::
>>   
>>   	% echo 1 > /sys/devices/system/memory/memoryXXX/online
>>   
>> -The kernel will select the target zone automatically, usually defaulting to
>> -``ZONE_NORMAL`` unless ``movable_node`` has been specified on the kernel
>> -command line or if the memory block would intersect the ZONE_MOVABLE already.
>> +The kernel will select the target zone automatically, depending on the
>> +configured ``online_policy``.
>>   
>>   One can explicitly request to associate an offline memory block with
>>   ZONE_MOVABLE by::
>> @@ -198,6 +197,9 @@ Auto-onlining can be enabled by writing ``online``, ``online_kernel`` or
>>   
>>   	% echo online > /sys/devices/system/memory/auto_online_blocks
>>   
>> +Similarly to manual onlining, with ``online`` the kernel will select the
>> +target zone automatically, depending on the configured ``online_policy``.
>> +
>>   Modifying the auto-online behavior will only affect all subsequently added
>>   memory blocks only.
>>   
>> @@ -393,9 +395,11 @@ command line parameters are relevant:
>>   ======================== =======================================================
>>   ``memhp_default_state``	 configure auto-onlining by essentially setting
>>                            ``/sys/devices/system/memory/auto_online_blocks``.
>> -``movable_node``	 configure automatic zone selection in the kernel. When
>> -			 set, the kernel will default to ZONE_MOVABLE, unless
>> -			 other zones can be kept contiguous.
>> +``movable_node``	 configure automatic zone selection in the kernel when
>> +			 using the ``contig-zones`` online policy. When
>> +			 set, the kernel will default to ZONE_MOVABLE when
>> +			 onlining a memory block, unless other zones can be kept
>> +			 contiguous.
> 
> The movable_node main purpose is to allow unplugging an entire node. Zone
> selection is a consequence of this. You may want to cite the description of
> movable_node in kernel-paramenters.txt here.

Right, I only document the effects of these parameters on memory 
hot(un)plug.

What about:

diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst 
b/Documentation/admin-guide/mm/memory-hotplug.rst
index c20a2c0031cf..f8976ded0863 100644
--- a/Documentation/admin-guide/mm/memory-hotplug.rst
+++ b/Documentation/admin-guide/mm/memory-hotplug.rst
@@ -402,6 +402,9 @@ command line parameters are relevant:
                          contiguous.
  ======================== 
=======================================================

+See Documentation/admin-guide/kernel-parameters.txt for a more generic
+description of these command line parameters.
+
  Module Parameters
  ------------------


> 
> And, pardon my ignorance, how movable_node will play with auto-movable
> policy?

It's essentially ignored with the auto-movable policy for memory 
hotplugged after boot (!MEMBLOCK_HOTPLUG). That's why only the 
description of "contig-zones" below describes how it interacts with the 
``movable_node``, and we make it clear here that it's restricted to the 
"contig-zones" policy as well.

<details>
Bare metal, where we care about reliably unplugging hotplugged memory 
usually configures auto-onlining to "online_movable": for example, 
that's the case on RHEL. auto-movable doesn't make too much sense for 
bare metal: the nature of "movable_node" is to essentially online 
anything that might get hotunplugged MOVABLE, especially after 
hotplugging memory and rebooting: that is highly dangerous especially in 
virtualized environments.

"auto-movable" is valuable in virtualized environments, where we add 
memory via:
* add_memory_driver_managed() like virtio-mem, whereby such memory is
   never part of the firmware provided memory-map, so the policy is
   always in control even after a reboot.
* Hotplugged virtual DIMMs, such as provided by x86-64/arm64, whereby we
   don't include these DIMMs in the firmware-provided memory map, but
   ACPI code adds them after early boot, making it behave similar to
   add_memory_driver_managed() -- the policy is always in control even
   after a reboot.
</details>


Thanks!

-- 
Thanks,

David / dhildenb

