Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96D8C636CC
	for <linux-doc@archiver.kernel.org>; Mon, 20 Feb 2023 14:50:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232122AbjBTOu5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Feb 2023 09:50:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbjBTOu4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Feb 2023 09:50:56 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 033C21EFE5
        for <linux-doc@vger.kernel.org>; Mon, 20 Feb 2023 06:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676904607;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=14aOzXv8/LFbctYEfZwWWmrtrURJsidYi3oSxaFz0Xw=;
        b=fps2RL9aHJXpDc0HM//MI5bcPOIQv1V0SxEgNWsB5WBrjI/QPs6B4GeCwVLdxwELgykhID
        1oUitli2gIyvchuKO+oFLnDXZJGjp1kTw3AmxNzc4c1XlGyuOeHssJFgdUR9ylO+n6zRfV
        dO8DpUoPtla4YYxeZdQkVrC3BzrzLOM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-KOJKgUNmM4GOx_23Dr-ybw-1; Mon, 20 Feb 2023 09:49:58 -0500
X-MC-Unique: KOJKgUNmM4GOx_23Dr-ybw-1
Received: by mail-ed1-f71.google.com with SMTP id co14-20020a0564020c0e00b004aab4319cedso1528897edb.2
        for <linux-doc@vger.kernel.org>; Mon, 20 Feb 2023 06:49:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=14aOzXv8/LFbctYEfZwWWmrtrURJsidYi3oSxaFz0Xw=;
        b=Z5X8HOLb8D0+KbuoKS8tDc/ih7Pkz/O2xiNDLmwxL9pm0/9E2GRVd4/+7mVoCQvfmN
         G+8JPjH5DuxEBtyvXfgrSAFokKE680cO9vpyln63Yh+oScAAFs257pQQgducR5LD9eAf
         yqO0WF3Hqaw2lS1pT290rJ9ZNcFRbRCQbvnL7XMncrD7vRBq0IZIb+/Wd/EDnZSzw8XE
         ZjjPHdqCuA0OWCQmlB7dDgP4hb1MGiRu16fMlk7PA6VDIqSITu2gPSGDFbgYD/eEVvuv
         kJAsFSuAnmQRL0z6m5C4h48mN1EwM070TkM32N0KL9Xs9DxTrItpmqmF00R0ccRdyLWf
         Rpdw==
X-Gm-Message-State: AO0yUKXj3WqG1VwdS/hNX+uDzq6IUUBdSN3Af9V6qp2AaLTe6u97sjjq
        J+ZRHnHwYAjW7xpjFSwD0QT/1BwlfP9p00h3uNZzA6b/B1/q9K0MzlUw0GIsHCAxaWmpy9acwMf
        aHqIRe7Q9ChwdBo7tmTGh
X-Received: by 2002:a17:906:c451:b0:88b:4962:b72f with SMTP id ck17-20020a170906c45100b0088b4962b72fmr7384958ejb.20.1676904597385;
        Mon, 20 Feb 2023 06:49:57 -0800 (PST)
X-Google-Smtp-Source: AK7set+98u/y2Cal3np2ksbwfkOOCjcq6rtCsH8aYGEsMo5bVtK+OVJWU6UbYetsNggJNxfOhh/MAw==
X-Received: by 2002:a17:906:c451:b0:88b:4962:b72f with SMTP id ck17-20020a170906c45100b0088b4962b72fmr7384942ejb.20.1676904597149;
        Mon, 20 Feb 2023 06:49:57 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c? ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id jr14-20020a170906a98e00b008af574fbfc2sm5934451ejb.33.2023.02.20.06.49.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 06:49:56 -0800 (PST)
Message-ID: <3bb02ec3-4d19-9135-cabc-26ed210f7396@redhat.com>
Date:   Mon, 20 Feb 2023 15:00:59 +0100
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
From:   Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <Y+/Xn11dfdn7SfBD@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/17/23 20:38, Matthew Wilcox wrote:
> On Fri, Feb 17, 2023 at 02:44:10PM +0100, Danilo Krummrich wrote:
>> Generic components making use of the maple tree (such as the
>> DRM GPUVA Manager) delegate the responsibility of ensuring mutual
>> exclusion to their users.
>>
>> While such components could inherit the concept of an external lock,
>> some users might just serialize the access to the component and hence to
>> the internal maple tree.
>>
>> In order to allow such use cases, add a new flag MT_FLAGS_LOCK_NONE to
>> indicate not to do any internal lockdep checks.
> 
> I'm really against this change.
> 
> First, we really should check that users have their locking right.
> It's bitten us so many times when they get it wrong.

In case of the DRM GPUVA manager, some users might serialize the access 
to the GPUVA manager and hence to it's maple tree instances, e.g. 
through the drm_gpu_scheduler. In such a case ensuring to hold a lock 
would be a bit pointless and I wouldn't really know how to "sell" this 
to potential users of the GPUVA manager.

> 
> Second, having a lock allows us to defragment the slab cache.  The
> patches to do that haven't gone anywhere recently, but if we drop the
> requirement now, we'll never be able to compact ranges of memory that
> have slabs allocated to them.
> 

Not sure if I get that, do you mind explaining a bit how this would 
affect other users of the maple tree, such as my use case, the GPUVA 
manager?

