Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239B7C001B0
	for <linux-doc@archiver.kernel.org>; Thu, 10 Aug 2023 22:00:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231374AbjHJWAP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Aug 2023 18:00:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbjHJWAO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Aug 2023 18:00:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 826EF2123
        for <linux-doc@vger.kernel.org>; Thu, 10 Aug 2023 14:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691704769;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pn9VUoV/eSLZq5O7e4Fm41+26+kVKxbLF9wR68sh5IU=;
        b=XoAik9CZRNuMcun21cED4dqTZ6EGasC6un3lkcIND5juQLbKGWckqAgkiF2ji9u8+OZSUZ
        4HXr6whNGzMYNNgQc6C8IPRfm56Bp8/+EAXAzW2iWaAzmXHQQwFtXPvIB5XvH7v0k8SAH4
        TuDd5SFcw67l3VdO7nqoCx+uaCd/Vjk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-nsbyVJwiPea77m3D8QkcoA-1; Thu, 10 Aug 2023 17:59:28 -0400
X-MC-Unique: nsbyVJwiPea77m3D8QkcoA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3fbdf341934so9356525e9.3
        for <linux-doc@vger.kernel.org>; Thu, 10 Aug 2023 14:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691704767; x=1692309567;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pn9VUoV/eSLZq5O7e4Fm41+26+kVKxbLF9wR68sh5IU=;
        b=bVKWfkJxM8g9aA9Y79vjCGzphRP1FYl60Tng3ovJ/S3qDlROoq55XjPD2AX4oHPM/5
         9NH6Qb5Hf8Y8ZXLJymlBqlfm3efxlqEVldluoPZp+Y/mno3z95WLlk7ys8f/ecaHXgNZ
         mcLciGceBf+T7+3bexelga31BzTzMUG1wb4jVgO2uCWBngSlFCibvWTwxoT+chwphK/d
         Qs2ibpQfpQ0U0AQ+BIfz4hc/rbU/T71ffWXy5uKPguQUofK7nKjtTQWBCrcbHjmHKzQV
         0JEwE48AtvU98lgXu207QcJVZBbVsf1QpZwZ7952YO2sjxblIaPwASWXe5LXXa6SzVew
         et+w==
X-Gm-Message-State: AOJu0YzWos0WA2uwPnIslkzADNffJXLR+GY/25cwFzE+s3jkGSb9Sf6r
        MV+s80g+qNn5OQrWR+0ch9aoSIQww2lFuqgqyReOxofqpdYIItSLUrz56bA3orcxCr03kG9/eTV
        GC7PUEjkMSGYvcNXA8PCB
X-Received: by 2002:a1c:6a14:0:b0:3f5:fff8:d4f3 with SMTP id f20-20020a1c6a14000000b003f5fff8d4f3mr160082wmc.7.1691704766959;
        Thu, 10 Aug 2023 14:59:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG27+1qIuZbyhSQpmuu6o0syienlQHuMWVzKEFOqt5tcp+2Zd2bcZyuL+PUtwnEgRF0tqbTMg==
X-Received: by 2002:a1c:6a14:0:b0:3f5:fff8:d4f3 with SMTP id f20-20020a1c6a14000000b003f5fff8d4f3mr160071wmc.7.1691704766595;
        Thu, 10 Aug 2023 14:59:26 -0700 (PDT)
Received: from ?IPV6:2003:cb:c71a:8a00:8200:f041:4b87:a8be? (p200300cbc71a8a008200f0414b87a8be.dip0.t-ipconnect.de. [2003:cb:c71a:8a00:8200:f041:4b87:a8be])
        by smtp.gmail.com with ESMTPSA id s10-20020a05600c044a00b003fbc9d178a8sm6196818wmb.4.2023.08.10.14.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 14:59:26 -0700 (PDT)
Message-ID: <73d6d29f-9947-9b50-3b94-77f1ee547387@redhat.com>
Date:   Thu, 10 Aug 2023 23:59:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH mm-unstable v1] mm: add a total mapcount for large folios
Content-Language: en-US
To:     Matthew Wilcox <willy@infradead.org>, Peter Xu <peterx@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Hugh Dickins <hughd@google.com>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Yin Fengwei <fengwei.yin@intel.com>,
        Yang Shi <shy828301@gmail.com>, Zi Yan <ziy@nvidia.com>
References: <20230809083256.699513-1-david@redhat.com> <ZNQD4pxo8svpGmvX@x1n>
 <ZNRYx8GhYftE4Xeb@casper.infradead.org>
 <7e31254d-8889-7e79-50e1-2630bd493d59@redhat.com> <ZNVbIyHcqeKUDuSg@x1n>
 <ZNVcfdH8+N5Q83J/@casper.infradead.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <ZNVcfdH8+N5Q83J/@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10.08.23 23:54, Matthew Wilcox wrote:
> On Thu, Aug 10, 2023 at 05:48:19PM -0400, Peter Xu wrote:
>>> Yes, that comment from Hugh primarily discusses how we could possibly
>>> optimize the loop, and if relying on folio_nr_pages_mapped() to reduce the
>>> iterations would be racy. As far as I can see, there are cases where "it
>>> would be certainly a bad idea" :)
>>
>> Is the race described about mapcount being changed right after it's read?
>> Are you aware of anything specific that will be broken, and will be fixed
>> with this patch?
> 
> The problem is that people check the mapcount while holding no locks;
> not the PTL, not the page lock.  So it's an unfixable race.
> 
>> Having a total mapcount does sound helpful if partial folio is common
>> indeed.
>>
>> I'm curious whether that'll be so common after the large anon folio work -
>> isn't it be sad if partial folio will be a norm?  It sounds to me that's
>> the case when small page sizes should be used.. and it's prone to waste?
> 
> The problem is that entire_mapcount isn't really entire_mapcount.
> It's pmd_mapcount.  I have had thoughts about using it as entire_mapcount,
> but it gets gnarly when people do partial unmaps.  So the _usual_ case
> ends up touching every struct page.  Which sucks.  Also it's one of the
> things which stands in the way of shrinking struct page.

Right, so one current idea is to have a single total_mapcount and look 
into removing the subpage mapcounts (which will require first removing 
_nr_pages_mapped, because that's still one of the important users).

Until we get there, also rmap code has to do eventually "more tracking" 
and might, unfortunately, end up slower.

> 
> But it's kind of annoying to explain all of this to you individually.
> There have been hundreds of emails about it over the last months on
> this mailing list.  It would be nice if you could catch up instead of
> jumping in.

To be fair, a lot of the details are not readily available and in the 
heads of selected people :)

Peter, if you're interested, we can discuss the current plans, issues 
and ideas offline!

-- 
Cheers,

David / dhildenb

