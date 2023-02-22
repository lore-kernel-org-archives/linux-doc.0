Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE90C64EC4
	for <linux-doc@archiver.kernel.org>; Wed, 22 Feb 2023 16:12:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbjBVQMg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Feb 2023 11:12:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232046AbjBVQMc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Feb 2023 11:12:32 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0D1538EA3
        for <linux-doc@vger.kernel.org>; Wed, 22 Feb 2023 08:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677082303;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=neiYWm2KbKr5dWFV5xeD5ApqAkur8gwJzODT2/WCgzQ=;
        b=EyWUMc9c91WYAQGELusvmCDuRyX06SFTHF8vOo2i/JFYgp8FNR/d4td7bnJXBgiuPmKY5i
        HZSwJIgfVOrCYlbLtH79Jxi3/39YTXGjeFV4Rglu3GvbcbKk7y4sWY6gk327yfdreH0Vtw
        EwFm59/mQBIm3bR+91QLbRrIV3TIKl4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-487-zgY2l1rvMmqB2-_Fd8zJXg-1; Wed, 22 Feb 2023 11:11:39 -0500
X-MC-Unique: zgY2l1rvMmqB2-_Fd8zJXg-1
Received: by mail-ed1-f72.google.com with SMTP id k12-20020a50c8cc000000b004accf30f6d3so11526034edh.14
        for <linux-doc@vger.kernel.org>; Wed, 22 Feb 2023 08:11:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=neiYWm2KbKr5dWFV5xeD5ApqAkur8gwJzODT2/WCgzQ=;
        b=0q5UEq7wv9zRGIbfJhoLJpitA+4NqEXqz/F3fnhC/eKMMhI78XdMFMgqUPdZzyJqmg
         k6blO0SzX55j2PYUb/pcqxDPncHnsB/5t+h4H6mMF9WkIzMVRdcq6mQNOuf+TKMDR4Rc
         RME21A3O5FRU/PBf7nzA60dq74/sRZigy1Q9+gCil+vgVn6OztkA6o56O6SXOIt28lut
         CkKaenM6xPZYPZzM5T9gRa0Ch9SoaBkYFW+iPej4WmXORVHQDGwk269UsRPYW+ToRzsw
         d5NLGdIrrSe6JxEHezMSjkIqpi7Edho6U69PbljtlX7IfVYsMCYwNx/MMdWE6fLixxf9
         0JwQ==
X-Gm-Message-State: AO0yUKXToX6hrBj2Sstby87vQuF/xoB1dyiWwCmljxNnILU90tsZBEKi
        CxFrk3FRi0D6zM4B61hPaa1DO5wGjPEpjWxipziw8C6ikAV0tUQavuq2rZxuMs2aOZOosfe+Hqz
        qHVoiO1qaswFYRmntOoz+
X-Received: by 2002:a05:6402:1655:b0:4ac:b4b1:53fe with SMTP id s21-20020a056402165500b004acb4b153femr9384022edx.20.1677082298231;
        Wed, 22 Feb 2023 08:11:38 -0800 (PST)
X-Google-Smtp-Source: AK7set+4YjeyYaom2DoSpii6LTOZ2xL+Xxy+F7uowt5r+Q52MN1xE+Xc3Jamf5spWTJd79U9gwGfhA==
X-Received: by 2002:a05:6402:1655:b0:4ac:b4b1:53fe with SMTP id s21-20020a056402165500b004acb4b153femr9383994edx.20.1677082297854;
        Wed, 22 Feb 2023 08:11:37 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c? ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id g16-20020a50d0d0000000b004ad1d3cf195sm3504753edf.95.2023.02.22.08.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 08:11:37 -0800 (PST)
Message-ID: <91d34e47-10f6-8278-ef4c-72cdfa24e038@redhat.com>
Date:   Wed, 22 Feb 2023 17:11:34 +0100
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

Thanks for the clarification. I think I should now know what to for the 
GPUVA manager in terms of locking the maple tree in general.

Though I still have very limited insights on the maple tree I want to 
share some further thoughts.

 From what I got so far it really seems to me that it would be better to 
just take the internal spinlock for both APIs (normal and advanced) 
whenever you need to internally.

This way users would not need to take care of locking maple tree 
internals, which I still think is a little odd.

Another plus would probably be maintainability. Once you got quite a few 
maple tree users using external locks (either in the sense of calling 
mt_set_external_lock() or in the way I'll potentially do it by using the 
internal lock with the advanced API and an additional external lock) it 
might be hard to apply any changes to the locking requirements, because 
you would either need to check every users implementation by hand or be 
able to run it in order to check it with lockdep.

If I got this correctly (please tell me if I don't) the only reason the 
internal lock is not managed by the advanced API internally is to let 
users do more complex transactions, without the need of having a 
separate external lock, as long as they fulfill the locking requirements 
of the maple tree, which are enforced by lockdep.

However, you already mentioned that "acquiring/releasing the uncontended 
spinlock is a minimal cost compared to all the other things that will 
happen while modifying the tree".

Do I miss something?

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
Just asking lockdep was my plan already, however I thought I still 
better ask. :D

If you will keep the current approach of handling the internal lock I 
think its necessary to somewhere document where users need to take the 
lock and, even more important, where the maple tree implementation will 
drop the lock.

For instance, if I would rely on using the internal spinlock for locking 
sets of transactions to the maple tree this would cause nasty bugs if I 
use functions like mas_store_gfp() dropping the lock. Even though I must 
admit that this is not a great example, since it should raise some red 
flags if a user would expect a spinlock is held for a sleeping 
allocation without questioning it. However, you get the point I guess.

