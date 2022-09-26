Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 867A8C07E9D
	for <linux-doc@archiver.kernel.org>; Mon, 26 Sep 2022 08:29:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234360AbiIZI3F (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Sep 2022 04:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234507AbiIZI2k (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Sep 2022 04:28:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F3B3AB07
        for <linux-doc@vger.kernel.org>; Mon, 26 Sep 2022 01:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664180910;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HqsG+MVHFIIYUXh9jWxIMmssIKFxTC2Q+EMTX/72P4E=;
        b=JNYjtZ386ZGMLopPhcC2KQp3nOV1Ry/zIWYKH8W/bniXjVklSnnBAs/0kDnpEK0XXF6nfQ
        GP01I8Q6mVDSw1I3tlKE7zpYgW+rtpX3atcG/n49jdRgAIgp16TPCDaPAMwG/h8y7DpXZx
        TUv9htU3DNvYkhEw27VyBVyC7yDND2c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-629-8sIaOloPPlS059UFIohMWQ-1; Mon, 26 Sep 2022 04:28:29 -0400
X-MC-Unique: 8sIaOloPPlS059UFIohMWQ-1
Received: by mail-wr1-f70.google.com with SMTP id g19-20020adfa493000000b0022a2ee64216so926381wrb.14
        for <linux-doc@vger.kernel.org>; Mon, 26 Sep 2022 01:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=HqsG+MVHFIIYUXh9jWxIMmssIKFxTC2Q+EMTX/72P4E=;
        b=bqgPs/Qvi+gQyn/85w3ddgHoWqRxB3cvvQH31AKjvyS6OcHS0qQefNzidS9GS2Z6mP
         Eg3iyIzcsxCacj15E9j/zOTMsCcpKuXspGEJ/bH0ee3oF4ElZZiIiIyiNnWHEG1WXj3M
         J4BO50EzJFLgbLU+QZ7m76hn4MG1vhw4GegR0zKQpixNEpO3jFZLNtZg1MKRHqINSpvb
         H0Rj9mQXJ+6Y33kU8kgFUjKnLyKJ3I2qnePYrPxh+APaLch169MW8+pEheP5c20WmDhV
         8yobK3Qril132BkveiOLc3zuIdYQPY68zUvIO50fmIgE1vh67Kz5rskVjIlvjpouMj3b
         8SUQ==
X-Gm-Message-State: ACrzQf0R4B23MFCgr27v6IMqOeXjO4yzEt6UJFL5OltrjKR/aXgVIAmE
        kcWRa0gDrIGoacKseQEi5/IDyTAl92C3q+epy6v5Jl+qp7BXq86ZVzO1oOn2ezOPEbHyZ081hFq
        iSS/i1IIAYemAvg1HW95x
X-Received: by 2002:adf:ee89:0:b0:228:7bdf:47d with SMTP id b9-20020adfee89000000b002287bdf047dmr12331982wro.641.1664180908454;
        Mon, 26 Sep 2022 01:28:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Bl/WEHU2vEBAzJ2u0mYVj47cUqiOCermg8qPqGs7Ef8aijleyg7ahis7ThaGwb8JRoRHffQ==
X-Received: by 2002:adf:ee89:0:b0:228:7bdf:47d with SMTP id b9-20020adfee89000000b002287bdf047dmr12331970wro.641.1664180908227;
        Mon, 26 Sep 2022 01:28:28 -0700 (PDT)
Received: from ?IPV6:2003:cb:c703:4b00:e090:7fa6:b7d6:d4a7? (p200300cbc7034b00e0907fa6b7d6d4a7.dip0.t-ipconnect.de. [2003:cb:c703:4b00:e090:7fa6:b7d6:d4a7])
        by smtp.gmail.com with ESMTPSA id y5-20020a5d6145000000b00226dedf1ab7sm13413277wrt.76.2022.09.26.01.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 01:28:27 -0700 (PDT)
Message-ID: <f8ff6148-2775-4465-809b-36a4e5a4c403@redhat.com>
Date:   Mon, 26 Sep 2022 10:28:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/3] mm/page_table_check: Do WARN_ON instead of BUG_ON by
 default
Content-Language: en-US
To:     Matthew Wilcox <willy@infradead.org>,
        Pasha Tatashin <pasha.tatashin@soleen.com>
Cc:     akpm@linux-foundation.org, corbet@lwn.net, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        rick.p.edgecombe@intel.com
References: <20220911095923.3614387-1-pasha.tatashin@soleen.com>
 <20220911095923.3614387-3-pasha.tatashin@soleen.com>
 <Yx4IEvkmAlcTIP6v@casper.infradead.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Yx4IEvkmAlcTIP6v@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11.09.22 18:08, Matthew Wilcox wrote:
> On Sun, Sep 11, 2022 at 09:59:22AM +0000, Pasha Tatashin wrote:
>> Currently, page_table_check when detects errors panics kernel. Instead,
>> print a warning, and panic only when specifically requested via kernel
>> parameter:
>>
>> 	page_table_check=panic
> 
> Why are the page table checks so special that they deserve their own
> command line parameter?  Why shouldn't this be controlled by the usual
> panic_on_warn option?
> 

I agree.

https://lkml.kernel.org/r/20220923113426.52871-2-david@redhat.com

Use of WARN_ON_ONCE is the way to go nowadays.

-- 
Thanks,

David / dhildenb

