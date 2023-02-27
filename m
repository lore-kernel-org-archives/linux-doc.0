Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 613D9C64ED6
	for <linux-doc@archiver.kernel.org>; Mon, 27 Feb 2023 17:42:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjB0RmE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Feb 2023 12:42:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjB0RmD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Feb 2023 12:42:03 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C5323DAD
        for <linux-doc@vger.kernel.org>; Mon, 27 Feb 2023 09:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677519578;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3mkc3cHryKoQlVgV2zVl+0PzzwDJTUCgbCBX7Jw82OE=;
        b=f+vofc2AIveLo0QvR62EMkjo0DM3WEZ12h0y7QSYaPobKZaHkxdT2JdgSQBqJEwvBm1J89
        53aXVmuVkQ9yP5DdzkGZxLSFaHx1ucv6GfzTbygMIiiiFjEolHAJrU7hLlc5yF3Ld4nxmp
        uRf9GE4YQj+ZuHxY8G36SpCl3VYjl24=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-588-rIZF1cUxPY6hDcckL6dktA-1; Mon, 27 Feb 2023 12:39:37 -0500
X-MC-Unique: rIZF1cUxPY6hDcckL6dktA-1
Received: by mail-ed1-f72.google.com with SMTP id ee6-20020a056402290600b004ad51f8fc36so9760631edb.22
        for <linux-doc@vger.kernel.org>; Mon, 27 Feb 2023 09:39:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3mkc3cHryKoQlVgV2zVl+0PzzwDJTUCgbCBX7Jw82OE=;
        b=aUFGKK8junOTD+cNTrOjsQGTWSyzOoEFRRFMBiLU/5qkrH47zVOISQZH2XAkZ7/Qf2
         dCfcRn/z0tQfdLo3GX8Hvy+K5TuaxMoTtvjsw6f1CSslyJ3xQ9AefSbqd9jff3ENYpeA
         MicfTFQzn4LzXFJ8/C1q+x6P9uAOG+D3r6ixj+7Xw66gj1KrQQxBcaKWh3Ch55VZaCIb
         P0dtM+FewDpAB3DCUDQ6SEoj3+4rh/lzry6IfmHcIHu/RBDzA3TM7TqIqIeYXScRzEzC
         MiA9CU5gM4SIfZED+HURAoEWfEneAafXRJlMuSexoiBjUntDo8X98v0oLlD84hZjz63d
         vBJQ==
X-Gm-Message-State: AO0yUKXrsSeVUxL8EHesC1GfiYUDErfp7EMXbzInV1cXih91gqHVSHlW
        /+sF6M0V0ANi5HX3/3SN4J7HAWFiNUUcJJH6bAFTfOi7BbO4gQ7aU6HZ0eBPa4kYWeb2xt1LZm7
        1hLLIA/s+hm2mrFDfP5uK
X-Received: by 2002:a17:907:97c3:b0:8af:ef00:b853 with SMTP id js3-20020a17090797c300b008afef00b853mr44969553ejc.73.1677519576271;
        Mon, 27 Feb 2023 09:39:36 -0800 (PST)
X-Google-Smtp-Source: AK7set8dwfwqQmqPjam8UzWIoP7CWEacRLfEPhcixYlLH9/bKx4zKjhRg3obJwXpommPMEyYgK8mKw==
X-Received: by 2002:a17:907:97c3:b0:8af:ef00:b853 with SMTP id js3-20020a17090797c300b008afef00b853mr44969529ejc.73.1677519575989;
        Mon, 27 Feb 2023 09:39:35 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c? ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id e19-20020a1709061e9300b008d83ad86fe8sm3481538ejj.59.2023.02.27.09.39.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 09:39:35 -0800 (PST)
Message-ID: <67942a68-2ae7-8883-25d7-c6d595c3587e@redhat.com>
Date:   Mon, 27 Feb 2023 18:39:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH drm-next v2 04/16] maple_tree: add flag MT_FLAGS_LOCK_NONE
Content-Language: en-US
To:     Matthew Wilcox <willy@infradead.org>
Cc:     matthew.brost@intel.com, dri-devel@lists.freedesktop.org,
        corbet@lwn.net, nouveau@lists.freedesktop.org, ogabbay@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, boris.brezillon@collabora.com,
        bskeggs@redhat.com, tzimmermann@suse.de, Liam.Howlett@oracle.com,
        bagasdotme@gmail.com, christian.koenig@amd.com,
        jason@jlekstrand.net
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-5-dakr@redhat.com>
 <Y+/Xn11dfdn7SfBD@casper.infradead.org>
 <3bb02ec3-4d19-9135-cabc-26ed210f7396@redhat.com>
 <Y/ONYhyDCPEYH1ml@casper.infradead.org>
 <e43f6acc-175d-1031-c4a2-67a6f1741866@redhat.com>
 <Y/PZH/q2Xsr3od9m@casper.infradead.org> <Y/TXPasvkhtGiR+w@pollux>
 <Y/UN50hCaRe+8ZCg@casper.infradead.org>
From:   Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <Y/UN50hCaRe+8ZCg@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/21/23 19:31, Matthew Wilcox wrote:
> On Tue, Feb 21, 2023 at 03:37:49PM +0100, Danilo Krummrich wrote:
>> On Mon, Feb 20, 2023 at 08:33:35PM +0000, Matthew Wilcox wrote:
>>> On Mon, Feb 20, 2023 at 06:06:03PM +0100, Danilo Krummrich wrote:
>>>> On 2/20/23 16:10, Matthew Wilcox wrote:
>>>>> This is why we like people to use the spinlock embedded in the tree.
>>>>> There's nothing for the user to care about.  If the access really is
>>>>> serialised, acquiring/releasing the uncontended spinlock is a minimal
>>>>> cost compared to all the other things that will happen while modifying
>>>>> the tree.
>>>>
>>>> I think as for the users of the GPUVA manager we'd have two cases:
>>>>
>>>> 1) Accesses to the manager (and hence the tree) are serialized, no lock
>>>> needed.
>>>>
>>>> 2) Multiple operations on the tree must be locked in order to make them
>>>> appear atomic.
>>>
>>> Could you give an example here of what you'd like to do?  Ideally
>>> something complicated so I don't say "Oh, you can just do this" when
>>> there's a more complex example for which "this" won't work.  I'm sure
>>> that's embedded somewhere in the next 20-odd patches, but it's probably
>>> quicker for you to describe in terms of tree operations that have to
>>> appear atomic than for me to try to figure it out.
>>>
>>
>> Absolutely, not gonna ask you to read all of that. :-)
>>
>> One thing the GPUVA manager does is to provide drivers the (sub-)operations
>> that need to be processed in order to fulfill a map or unmap request from
>> userspace. For instance, when userspace asks the driver to map some memory
>> the GPUVA manager calculates which existing mappings must be removed, split up
>> or can be merged with the newly requested mapping.
>>
>> A driver has two ways to fetch those operations from the GPUVA manager. It can
>> either obtain a list of operations or receive a callback for each operation
>> generated by the GPUVA manager.
>>
>> In both cases the GPUVA manager walks the maple tree, which keeps track of
>> existing mappings, for the given range in __drm_gpuva_sm_map() (only considering
>> the map case, since the unmap case is a subset basically). For each mapping
>> found in the given range the driver, as mentioned, either receives a callback or
>> a list entry is added to the list of operations.
>>
>> Typically, for each operation / callback one entry within the maple tree is
>> removed and, optionally at the beginning and end of a new mapping's range, a
>> new entry is inserted. An of course, as the last operation, there is the new
>> mapping itself to insert.
>>
>> The GPUVA manager delegates locking responsibility to the drivers. Typically,
>> a driver either serializes access to the VA space managed by the GPUVA manager
>> (no lock needed) or need to lock the processing of a full set of operations
>> generated by the GPUVA manager.
> 
> OK, that all makes sense.  It does make sense to have the driver use its
> own mutex and then take the spinlock inside the maple tree code.  It
> shouldn't ever be contended.
> 
>>>> In either case the embedded spinlock wouldn't be useful, we'd either need an
>>>> external lock or no lock at all.
>>>>
>>>> If there are any internal reasons why specific tree operations must be
>>>> mutually excluded (such as those you explain below), wouldn't it make more
>>>> sense to always have the internal lock and, optionally, allow users to
>>>> specify an external lock additionally?
>>>
>>> So the way this works for the XArray, which is a little older than the
>>> Maple tree, is that we always use the internal spinlock for
>>> modifications (possibly BH or IRQ safe), and if someone wants to
>>> use an external mutex to make some callers atomic with respect to each
>>> other, they're free to do so.  In that case, the XArray doesn't check
>>> the user's external locking at all, because it really can't know.
>>>
>>> I'd advise taking that approach; if there's really no way to use the
>>> internal spinlock to make your complicated updates appear atomic
>>> then just let the maple tree use its internal spinlock, and you can
>>> also use your external mutex however you like.
>>>
>>
>> That sounds like the right thing to do.
>>
>> However, I'm using the advanced API of the maple tree (and that's the reason
>> why the above example appears a little more detailed than needed) because I
>> think with the normal API I can't insert / remove tree entries while walking
>> the tree, right?
> 
> Right.  The normal API is for simple operations while the advanced API
> is for doing compound operations.
> 
>> As by the documentation the advanced API, however, doesn't take care of locking
>> itself, hence just letting the maple tree use its internal spinlock doesn't
>> really work - I need to take care of that myself, right?
> 
> Yes; once you're using the advanced API, you get to compose the entire
> operation yourself.
> 
>> It feels a bit weird that I, as a user of the API, would need to lock certain
>> (or all?) mas_*() functions with the internal spinlock in order to protect
>> (future) internal features of the tree, such as the slab cache defragmentation
>> you mentioned. Because from my perspective, as the generic component that tells
>> it's users (the drivers) to take care of locking VA space operations (and hence
>> tree operations) I don't have an own purpose of this internal spinlock, right?
> 
> You don't ... but we can't know that.
> 
>> Also I'm a little confused how I'd know where to take the spinlock? E.g. for
>> inserting entries in the tree I use mas_store_gfp() with GFP_KERNEL.
> 
> Lockdep will shout at you if you get it wrong ;-)  But you can safely
> take the spinlock before calling mas_store_gfp(GFP_KERNEL) because
> mas_nomem() knows to drop the lock before doing a sleeping allocation.
> Essentially you're open-coding mtree_store_range() but doing your own
> thing in addition to the store.
> 

As already mentioned, I went with your advice to just take the maple 
tree's internal spinlock within the GPUVA manager and leave all the 
other locking to the drivers as intended.

However, I run into the case that lockdep shouts at me for not taking 
the spinlock before calling mas_find() in the iterator macros.

Now, I definitely don't want to let the drivers take the maple tree's 
spinlock before they use the iterator macro. Of course, drivers 
shouldn't even know about the underlying maple tree of the GPUVA manager.

One way to make lockdep happy in this case seems to be taking the 
spinlock right before mas_find() and drop it right after for each iteration.

What do you advice to do in this case?

Thanks,
Danilo

