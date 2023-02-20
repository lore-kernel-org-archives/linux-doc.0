Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963BAC05027
	for <linux-doc@archiver.kernel.org>; Mon, 20 Feb 2023 17:46:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232453AbjBTRqe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Feb 2023 12:46:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232449AbjBTRqd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Feb 2023 12:46:33 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 915831DB91
        for <linux-doc@vger.kernel.org>; Mon, 20 Feb 2023 09:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676915143;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=p0Izq1sT8yQqR3StJyRIa9aUpeGU1pXLanSYRIGX2E8=;
        b=i6Gquehn/na+E1+cR772Pwl8cY9jFWi4zwlqLIVRnaR8GgKzAsFHHCW7/H24liF1gIdOXm
        uXEokRS5FWvCmHMyoPC4YYq+7KRyGl7dEHT4dgYRbxhLFMHGoLLyC5NRm481bqYSu9ARXi
        GDIodAvYAgZ5O5y8M5xwmxYegVStVz0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-286-pf72fYjCM9mi08EBqNO0UA-1; Mon, 20 Feb 2023 12:45:41 -0500
X-MC-Unique: pf72fYjCM9mi08EBqNO0UA-1
Received: by mail-ed1-f69.google.com with SMTP id fi8-20020a056402550800b004a26cc7f6cbso2471818edb.4
        for <linux-doc@vger.kernel.org>; Mon, 20 Feb 2023 09:45:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p0Izq1sT8yQqR3StJyRIa9aUpeGU1pXLanSYRIGX2E8=;
        b=KOVXjHL7YCBN/vWgwXVmtnqZDEc9/uuh1Bll/izgsVUleF/kCZcRQsS7FruP/y9pHd
         gAubCrd3m69UVY/JJ2Vzs6yuONSeZYFo5O5acfOKprR1SXswk0AEWwpaVXrsqfibQkZ/
         4TU6Nmy8ALBN5Mf4ngk1M28e6SkIHjsKJKd1Gcy2WdQGkgc+Axm8M8yUl8lJWPzYt/Vc
         JtEuNlYjHjYEZnAYesZ1Z0MXaOfuq4Qd91TTfN+oLhSBAbjz6d4CgmeOeSTpXmddqcel
         cmcScMSigtW0aPnmWHrNdAYq/3wvTewxbg5T6MzUzyxtlihOn5uoX2V9wt6/F3MXBEES
         xIPA==
X-Gm-Message-State: AO0yUKVkUIR56GG0AO9kL9RiY1hE7By8+CpiRG4r9uEUkzL709iffDFP
        jyNmRCfG1kCtB24F+LIQ+gdGrHgNrTLWOe7hGxH2w6WBNCmZJJtKjPjlteDGtzEwnq5NY4sZhUr
        XndIMrd3amSGSWUp4jNyn
X-Received: by 2002:a17:907:94c5:b0:8b1:319c:c29c with SMTP id dn5-20020a17090794c500b008b1319cc29cmr13659852ejc.70.1676915140664;
        Mon, 20 Feb 2023 09:45:40 -0800 (PST)
X-Google-Smtp-Source: AK7set/Ga6rG3Eq1hZqRFlC9SxeuFv04ZCxlmBzWk9HFcUACYcpXem95hxGHCYiEqsp+Ho5tDk/t+w==
X-Received: by 2002:a17:907:94c5:b0:8b1:319c:c29c with SMTP id dn5-20020a17090794c500b008b1319cc29cmr13659833ejc.70.1676915140411;
        Mon, 20 Feb 2023 09:45:40 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c? ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id f21-20020a170906561500b008d09b900614sm1826220ejq.80.2023.02.20.09.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 09:45:39 -0800 (PST)
Message-ID: <e43f6acc-175d-1031-c4a2-67a6f1741866@redhat.com>
Date:   Mon, 20 Feb 2023 18:06:03 +0100
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
From:   Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <Y/ONYhyDCPEYH1ml@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/20/23 16:10, Matthew Wilcox wrote:
> On Mon, Feb 20, 2023 at 03:00:59PM +0100, Danilo Krummrich wrote:
>> On 2/17/23 20:38, Matthew Wilcox wrote:
>>> On Fri, Feb 17, 2023 at 02:44:10PM +0100, Danilo Krummrich wrote:
>>>> Generic components making use of the maple tree (such as the
>>>> DRM GPUVA Manager) delegate the responsibility of ensuring mutual
>>>> exclusion to their users.
>>>>
>>>> While such components could inherit the concept of an external lock,
>>>> some users might just serialize the access to the component and hence to
>>>> the internal maple tree.
>>>>
>>>> In order to allow such use cases, add a new flag MT_FLAGS_LOCK_NONE to
>>>> indicate not to do any internal lockdep checks.
>>>
>>> I'm really against this change.
>>>
>>> First, we really should check that users have their locking right.
>>> It's bitten us so many times when they get it wrong.
>>
>> In case of the DRM GPUVA manager, some users might serialize the access to
>> the GPUVA manager and hence to it's maple tree instances, e.g. through the
>> drm_gpu_scheduler. In such a case ensuring to hold a lock would be a bit
>> pointless and I wouldn't really know how to "sell" this to potential users
>> of the GPUVA manager.
> 
> This is why we like people to use the spinlock embedded in the tree.
> There's nothing for the user to care about.  If the access really is
> serialised, acquiring/releasing the uncontended spinlock is a minimal
> cost compared to all the other things that will happen while modifying
> the tree.

I think as for the users of the GPUVA manager we'd have two cases:

1) Accesses to the manager (and hence the tree) are serialized, no lock 
needed.

2) Multiple operations on the tree must be locked in order to make them 
appear atomic.

In either case the embedded spinlock wouldn't be useful, we'd either 
need an external lock or no lock at all.

If there are any internal reasons why specific tree operations must be 
mutually excluded (such as those you explain below), wouldn't it make 
more sense to always have the internal lock and, optionally, allow users 
to specify an external lock additionally?

> 
>>> Second, having a lock allows us to defragment the slab cache.  The
>>> patches to do that haven't gone anywhere recently, but if we drop the
>>> requirement now, we'll never be able to compact ranges of memory that
>>> have slabs allocated to them.
>>>
>>
>> Not sure if I get that, do you mind explaining a bit how this would affect
>> other users of the maple tree, such as my use case, the GPUVA manager?
> 
> When we want to free a slab in order to defragment memory, we need
> to relocate all the objects allocated within that slab.  To do that
> for the maple tree node cache, for each node in this particular slab,
> we'll need to walk up to the top of the tree and lock it.  We can then
> allocate a new node from a different slab, change the parent to point
> to the new node and drop the lock.  After an RCU delay, we can free the
> slab and create a larger contiguous block of memory.
> 
> As I said, this is somewhat hypothetical in that there's no current
> code in the tree to reclaim slabs when we're trying to defragment
> memory.  And that's because it's hard to do.  The XArray and maple
> tree were designed to make it possible for their slabs.
> 

