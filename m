Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C244C0015E
	for <linux-doc@archiver.kernel.org>; Wed,  9 Aug 2023 22:43:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233040AbjHIWnf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Aug 2023 18:43:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbjHIWnf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Aug 2023 18:43:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5BDCD2
        for <linux-doc@vger.kernel.org>; Wed,  9 Aug 2023 15:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691620966;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kqkWptdyICgKZLcTvquabOW8rAvUOuPeScuQD1YQUKA=;
        b=b5ZJKHgRwr+UQObCKfG5pgc0EjPDpe7zEF6nr3Bia6FQ0PT2Ia7z0iGg14DvZjs2HmRPQ8
        4b0xcx5xKn/EEd7iyADCRl6rRREr/4zHMun5MII6IQf45ut9CsfFD5nWs5oV8IATNIfWmx
        7wkWHrifIBurkdgm0cukot9oUUOdmb0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-NuVqkwMiNN20kWd7jeoBGA-1; Wed, 09 Aug 2023 18:40:56 -0400
X-MC-Unique: NuVqkwMiNN20kWd7jeoBGA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-99cc32f2ec5so22575766b.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Aug 2023 15:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691620855; x=1692225655;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqkWptdyICgKZLcTvquabOW8rAvUOuPeScuQD1YQUKA=;
        b=PA72HKaFM/xa2z8X55UfZpU/jQ1TWXLcxmAyOuVSvkSyvWyznYxEClibqWsyVjiHXT
         OoGjQtrmEUxHniEAM0xVW2EzdUxGWs7UvarKajnMZgsc25uIEI9SIjAUQ7U5AQ/UbT0s
         pRVuv4DSswU58mpuQFcrObRKhjkH7P4jiU4049uEPHBk8l3U+VDmMt4lESHqy+Z1rOfP
         Slo3KEeNnhVxG2HZazKR56A4HAMCN++vbBQVPygFeTdNKwx4pKFBGlZT8IE9EoRDh+HT
         UiEnBguqnWDuH072vRYAi6HNu0PLHnRCYgah56/4Hnkj4p1ewZ/oAhsYTzYZJXUoNzE1
         1zTw==
X-Gm-Message-State: AOJu0YyXn2KWDB9IrUKridFn9yzj/gUnlm+YBb57Tm+fAHjlEQwCPCRp
        yPVuR9LW7dzpsTBs+VpylXIuFCyn+UPcM+DHz/L6H9HUuahR2vZ8F+KsWorHRabz6rO9DrpEUvv
        wLmZb6Qt6E2l6D4Wfu0Eq
X-Received: by 2002:aa7:c687:0:b0:522:4cd7:efb0 with SMTP id n7-20020aa7c687000000b005224cd7efb0mr469653edq.17.1691620855562;
        Wed, 09 Aug 2023 15:40:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbc5d+5Pwrcb2mWJiUCFNf5HjHJlFOgUzg5E8ZB5Bw31sbH+4nAOdQBye19n8yg+HHqaYiFA==
X-Received: by 2002:aa7:c687:0:b0:522:4cd7:efb0 with SMTP id n7-20020aa7c687000000b005224cd7efb0mr469630edq.17.1691620855277;
        Wed, 09 Aug 2023 15:40:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c? ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id w26-20020a056402071a00b0052369656ed3sm48675edx.3.2023.08.09.15.40.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 15:40:54 -0700 (PDT)
Message-ID: <3f4beed9-6aca-b544-80a2-9ea5264da119@redhat.com>
Date:   Thu, 10 Aug 2023 00:40:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next v9 01/11] drm/gem: fix lockdep check for
 dma-resv lock
Content-Language: en-US
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
        bskeggs@redhat.com, Liam.Howlett@oracle.com,
        matthew.brost@intel.com, alexdeucher@gmail.com, ogabbay@kernel.org,
        bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
        donald.robson@imgtec.com, dri-devel@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230803165238.8798-1-dakr@redhat.com>
 <20230803165238.8798-2-dakr@redhat.com>
 <20230808092117.7f7fdef9@collabora.com>
From:   Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230808092117.7f7fdef9@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 8/8/23 09:21, Boris Brezillon wrote:
> On Thu,  3 Aug 2023 18:52:20 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
>> When no custom lock is set to protect a GEMs GPUVA list, lockdep checks
>> should fall back to the GEM objects dma-resv lock. With the current
>> implementation we're setting the lock_dep_map of the GEM objects 'resv'
>> pointer (in case no custom lock_dep_map is set yet) on
>> drm_gem_private_object_init().
>>
>> However, the GEM objects 'resv' pointer might still change after
>> drm_gem_private_object_init() is called, e.g. through
>> ttm_bo_init_reserved(). This can result in the wrong lock being tracked.
>>
>> To fix this, call dma_resv_held() directly from
>> drm_gem_gpuva_assert_lock_held() and fall back to the GEMs lock_dep_map
>> pointer only if an actual custom lock is set.
>>
>> Fixes: e6303f323b1a ("drm: manager to keep track of GPUs VA mappings")
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> but I'm wondering if it wouldn't be a good thing to add a
> drm_gem_set_resv() helper, so the core can control drm_gem_object::resv
> re-assignments (block them if it's happening after the GEM has been
> exposed to the outside world or update auxiliary data if it's happening
> before that).

I agree, this might be a good idea. There are quite a few places where 
drm_gem_object::resv is set from external code.

> 
>> ---
>>   include/drm/drm_gem.h | 15 +++++++++------
>>   1 file changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>> index c0b13c43b459..bc9f6aa2f3fe 100644
>> --- a/include/drm/drm_gem.h
>> +++ b/include/drm/drm_gem.h
>> @@ -551,15 +551,17 @@ int drm_gem_evict(struct drm_gem_object *obj);
>>    * @lock: the lock used to protect the gpuva list. The locking primitive
>>    * must contain a dep_map field.
>>    *
>> - * Call this if you're not proctecting access to the gpuva list
>> - * with the dma-resv lock, otherwise, drm_gem_gpuva_init() takes care
>> - * of initializing lock_dep_map for you.
>> + * Call this if you're not proctecting access to the gpuva list with the
>> + * dma-resv lock, but with a custom lock.
>>    */
>>   #define drm_gem_gpuva_set_lock(obj, lock) \
>> -	if (!(obj)->gpuva.lock_dep_map) \
>> +	if (!WARN((obj)->gpuva.lock_dep_map, \
>> +		  "GEM GPUVA lock should be set only once.")) \
>>   		(obj)->gpuva.lock_dep_map = &(lock)->dep_map
>>   #define drm_gem_gpuva_assert_lock_held(obj) \
>> -	lockdep_assert(lock_is_held((obj)->gpuva.lock_dep_map))
>> +	lockdep_assert((obj)->gpuva.lock_dep_map ? \
>> +		       lock_is_held((obj)->gpuva.lock_dep_map) : \
>> +		       dma_resv_held((obj)->resv))
>>   #else
>>   #define drm_gem_gpuva_set_lock(obj, lock) do {} while (0)
>>   #define drm_gem_gpuva_assert_lock_held(obj) do {} while (0)
>> @@ -573,11 +575,12 @@ int drm_gem_evict(struct drm_gem_object *obj);
>>    *
>>    * Calling this function is only necessary for drivers intending to support the
>>    * &drm_driver_feature DRIVER_GEM_GPUVA.
>> + *
>> + * See also drm_gem_gpuva_set_lock().
>>    */
>>   static inline void drm_gem_gpuva_init(struct drm_gem_object *obj)
>>   {
>>   	INIT_LIST_HEAD(&obj->gpuva.list);
>> -	drm_gem_gpuva_set_lock(obj, &obj->resv->lock.base);
>>   }
>>   
>>   /**
> 

