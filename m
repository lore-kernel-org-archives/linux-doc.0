Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF2EC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 16 Dec 2021 11:02:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231816AbhLPLCC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Dec 2021 06:02:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26972 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236429AbhLPLBz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Dec 2021 06:01:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639652515;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=l7GwdlGfQ5W/g4LmoX5XmlDa+4pC1YAv6UajHqQaEfs=;
        b=HQKbo+sE+fkwjVNjEdLfqBJ9/0C0xUpjQXlBGTYfs5Uaqbw2/73ZtzNFT659dQjfsuHIw6
        tPCuzBjeRFf4Nrr+uS6UEgDJg0oqKOSYO18dc6VeHkKVqnEOmsgLdWQgS0Ca7xXDSetTWf
        O04rsybzsW81IAwEOX8+/GiLXMAhFOw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-ZIvZn5ruPOqtMBHceYDPLA-1; Thu, 16 Dec 2021 06:01:53 -0500
X-MC-Unique: ZIvZn5ruPOqtMBHceYDPLA-1
Received: by mail-wr1-f69.google.com with SMTP id j26-20020adfb31a000000b001a2356afd4fso890075wrd.21
        for <linux-doc@vger.kernel.org>; Thu, 16 Dec 2021 03:01:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=l7GwdlGfQ5W/g4LmoX5XmlDa+4pC1YAv6UajHqQaEfs=;
        b=xovqMm+rFawUeT0d90p5czOZrBfos/pDPy6USFU7Ak9moLBMTqTAsLLD8UYsWQOKNf
         XiRl1qkeXKjTUfKKc/vqu1MoxQ3MG245D6awe/a4HHJ3P7RiPPfSHHH2rA45mkFLzSyt
         xEZ4yNqQ/++D46sUetsKtqKy4Th4qvqB4Rib1lzazOGakzdpHOzrLciZ0J1zV5NkSiIO
         pLaKAJbKwXPBArIcY7iyU2CjhTvTTqSWk21gP9q9MbpjHEDnOrJXi2Z8p1QSXlBwo585
         XPxd567ERTkZY8pRQ6olL3klKaZELOWUQmMAoYAnAaU/wfGDhNrQHs7mVTw2wF3/74ff
         vV6g==
X-Gm-Message-State: AOAM531sZSLuYHYKn7FqsgqSECqxhaahx9CLtMKPr3JLeecJUTO3g6FI
        CiNtjbd3o7kvuVIhRFcACjjoplNpdJ9ZPUR4p7j8dVCwUp/ogQLC3qnVKHhl5cDci93Hm6OmGTe
        D8eGCb4Z6/+TPdHy744i6
X-Received: by 2002:a05:600c:19d0:: with SMTP id u16mr4415937wmq.111.1639652512650;
        Thu, 16 Dec 2021 03:01:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyD/x70y7BF15+GIWDr8ovTZVuSOK1BOzDtEe1Mb1/AGPryPtAQp5I5z1oFB0htlfGkpun81w==
X-Received: by 2002:a05:600c:19d0:: with SMTP id u16mr4415919wmq.111.1639652512416;
        Thu, 16 Dec 2021 03:01:52 -0800 (PST)
Received: from [192.168.3.132] (p4ff23dcd.dip0.t-ipconnect.de. [79.242.61.205])
        by smtp.gmail.com with ESMTPSA id z5sm1326474wru.87.2021.12.16.03.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Dec 2021 03:01:52 -0800 (PST)
Message-ID: <f964967d-dd47-f509-33c3-abd6f8593710@redhat.com>
Date:   Thu, 16 Dec 2021 12:01:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] docs/vm: clarify overcommit amount sysctl behavior
Content-Language: en-US
To:     Matthew Wilcox <willy@infradead.org>,
        Anssi Hannula <anssi.hannula@iki.fi>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20211211194159.3137362-1-anssi.hannula@iki.fi>
 <YbUkdvFBayRwV6ax@casper.infradead.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YbUkdvFBayRwV6ax@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11.12.21 23:21, Matthew Wilcox wrote:
> On Sat, Dec 11, 2021 at 09:41:59PM +0200, Anssi Hannula wrote:
>> Documentation/vm/overcommit-accounting.rst says that the overcommit
>> amount can be set via vm.overcommit_ratio and vm.overcommit_kbytes.
>>
>> Add a clarification that those only take effect in overcommit handling
>> mode 2 ("Don't overcommit"), i.e. they do not act as an "additional"
>> limit that is always enforced.
>>
>> Signed-off-by: Anssi Hannula <anssi.hannula@iki.fi>
>> ---
> 
> Simple and clear improvement, IMO.  Cc'ing linux-mm to get more eyes on
> it.

As I had the same idea to just make this clearer in the context of
advanced documentation for virtio-mem, so I approve :)

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

