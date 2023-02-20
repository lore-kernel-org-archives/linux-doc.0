Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 593D7C636CC
	for <linux-doc@archiver.kernel.org>; Mon, 20 Feb 2023 14:39:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232146AbjBTOjD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Feb 2023 09:39:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231782AbjBTOjD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Feb 2023 09:39:03 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D633183CC
        for <linux-doc@vger.kernel.org>; Mon, 20 Feb 2023 06:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676903899;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZooPx0J4FahhlqcFr0VVGzJP8CK2Lifinz64+tcHuxs=;
        b=FmJjSnvqrAMUAk5uUlffMYY+ktnL01a+8f4LUF1L5BIAVg7Bof9WsKyvE4xXY7U7oH+1tW
        PeQ8CeyKXZPhdWs2FZXqBBUg77gZaNulD4u3dTeZr1gAAb0Uwsz4mnz+DvZMdyysGZ6jP3
        /L+3MLXK8MUHg5fNcQPVUf/ZsWqmSlE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-86-7YhcfJ3YPrKjd2jhY4l1nQ-1; Mon, 20 Feb 2023 09:38:17 -0500
X-MC-Unique: 7YhcfJ3YPrKjd2jhY4l1nQ-1
Received: by mail-ed1-f70.google.com with SMTP id eg35-20020a05640228a300b004ad6e399b73so1133299edb.10
        for <linux-doc@vger.kernel.org>; Mon, 20 Feb 2023 06:38:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZooPx0J4FahhlqcFr0VVGzJP8CK2Lifinz64+tcHuxs=;
        b=PWwLe2L0PTYlc7RtalrqEeyUlZPQT+ReXBSb1KUvdzENVekclAlY85eKOuzVdW6Thu
         RfrelyFXwFXPRyMJhFfJ3NslTbZLIWDzbeeT3tWCWkYgqSbk90dkJ96mn4a3gCabTXGL
         +ERP51NgxwLeBXKgPR/PjchGbJ+eI23dZVlcv53FjSrNmmW7zBjtM920iL8wnSQTczR5
         kTnfbT1MuGN1+mjKJk+iQZYzbqR37nZ0RQKdl+6hbUOThY/w+2MD8PojLHjcF3FQHwvY
         NScnQQJP9uoYEmy9wgiks/jR9FQkFgyrT5I4zY5VUPMcLdTnoZ/vyBbsKJTRORN0RQo8
         FC4g==
X-Gm-Message-State: AO0yUKUaJknGstaEmbrXvWusWxn88vptyNaPiQc7VU+sCoxFZvtxEpSH
        mKdUharTrM9W2vjxFZJQmPeumOmsUejlmOkfeSWXCVWOTJt0OTYBgen2tTBzBykyD84IlJt0nBQ
        hUinY4YZlJ1NwdSnWvkz+
X-Received: by 2002:a17:907:c10:b0:87b:da74:d272 with SMTP id ga16-20020a1709070c1000b0087bda74d272mr11177671ejc.45.1676903896713;
        Mon, 20 Feb 2023 06:38:16 -0800 (PST)
X-Google-Smtp-Source: AK7set890fgad0EenmfhXcAtdl+hYlW2r/ANHXfflzV6RWOHKEQ6317uyFhrXsZ5SSZOJN3kSOCx5Q==
X-Received: by 2002:a17:907:c10:b0:87b:da74:d272 with SMTP id ga16-20020a1709070c1000b0087bda74d272mr11177652ejc.45.1676903896465;
        Mon, 20 Feb 2023 06:38:16 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c? ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id kj8-20020a170907764800b008c0b8dd4cbdsm3118420ejc.112.2023.02.20.06.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 06:38:15 -0800 (PST)
Message-ID: <e4244345-962d-1175-6ee3-a55083389437@redhat.com>
Date:   Mon, 20 Feb 2023 14:48:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH drm-next v2 03/16] maple_tree: split up MA_STATE() macro
Content-Language: en-US
To:     Matthew Wilcox <willy@infradead.org>
Cc:     airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
        bskeggs@redhat.com, Liam.Howlett@oracle.com,
        matthew.brost@intel.com, boris.brezillon@collabora.com,
        alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
        jason@jlekstrand.net, dri-devel@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-4-dakr@redhat.com>
 <Y+/ZW/8WXzrkQnUT@casper.infradead.org>
From:   Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <Y+/ZW/8WXzrkQnUT@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/17/23 20:45, Matthew Wilcox wrote:
> On Fri, Feb 17, 2023 at 02:44:09PM +0100, Danilo Krummrich wrote:
>> \#define SAMPLE_ITER(name, __mgr) \
>> 	struct sample_iter name = { \
>> 		.mas = __MA_STATE(&(__mgr)->mt, 0, 0),
> 
> This is usually called MA_STATE_INIT()

Yep, that's better.

> 
>> #define sample_iter_for_each_range(it__, start__, end__) \
>> 	for ((it__).mas.index = start__, (it__).entry = mas_find(&(it__).mas, end__ - 1); \
>> 	     (it__).entry; (it__).entry = mas_find(&(it__).mas, end__ - 1))
> 
> This is a bad iterator design.  It's usually best to do this:
> 
> 	struct sample *sample;
> 	SAMPLE_ITERATOR(si, min);
> 
> 	sample_iter_for_each(&si, sample, max) {
> 		frob(mgr, sample);
> 	}
> 


The reason why I don't set index (and max) within SAMPLE_ITER() is that 
the range to iterate might not yet be known at that time, so I thought 
it could just be set in sample_iter_for_each_range().

However, I see that this might prevail users to assume that it's safe to 
iterate a range based on the same iterator instance multiple times 
though. Instead users should maybe move the tree walk to another 
function once the range is known.

The reason for the payload structure to be part of the iterator is that 
I have two maple trees in the GPUVA manager and hence two different 
payload types. Within the iterator structure they're just within a union 
allowing me to implement the tree walk macro just once rather than twice.

Anyway, I feel like your approach looks cleaner, hence I'll change it.

> I don't mind splitting apart MA_STATE_INIT from MA_STATE, and if you
> do that, we can also use it in VMA_ITERATOR.
> 

