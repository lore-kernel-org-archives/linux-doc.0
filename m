Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB8ABC04A95
	for <linux-doc@archiver.kernel.org>; Tue, 25 Oct 2022 08:32:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbiJYIcO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Oct 2022 04:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232160AbiJYIcM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Oct 2022 04:32:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B71559B878
        for <linux-doc@vger.kernel.org>; Tue, 25 Oct 2022 01:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666686730;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vI19L+Wyz3SmxlOUmvxXkSqYI58k5J89otQKSgEB9hY=;
        b=EB34QMh0il4WLGE8iaiBX+k5YFiRgv95DTfJvd/E7sFEfNar3uzOvX6C6VgOlNVEnoZEs6
        dTjtMsKpt2T1XNk5VoCdyuAc9lzwRcRMmvjd379eiEoAKPWBJxmuPR0RStAFcURTi9zt6E
        L4LV3Ew4tTTc4dYu/78D+Pq5/QHTZ+U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-187-3gAFMD7_MTqt3PCV7aBjmQ-1; Tue, 25 Oct 2022 04:32:05 -0400
X-MC-Unique: 3gAFMD7_MTqt3PCV7aBjmQ-1
Received: by mail-wm1-f72.google.com with SMTP id o18-20020a05600c4fd200b003c6ceb1339bso345066wmq.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Oct 2022 01:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vI19L+Wyz3SmxlOUmvxXkSqYI58k5J89otQKSgEB9hY=;
        b=CUjw6xn4q3nxTQ5T3MxRXeJodhEQaHz0BEsD8AvO3T3mvLOtd0NKl+fy5LslZl0WPc
         DzkhdEEQeTbuVrlBGzcJztaK0AVNmNoPcXbMQ6GLa5juyULCXIzhw+Dp1DpalY0rIWe+
         fIN5VGuzXainQhjITIA929pdsLdO2sDRGSUiJQNqLWr3oCEqh3ILni3aCqGs1HzrpsIO
         sf/bDFQWNPescgw03Vq+tF21drqrTS96+8ksgkwGq94m+4FNsIl5rQGYU8CDdALew0tQ
         svGH0VVeVJFP3m5NQPestpcGzH6X1/4dfodQXJ9X7S8GrcpHrWv0TQOd1LfnCAMvWkRe
         hx3g==
X-Gm-Message-State: ACrzQf2JK7tKxBas6qQWqXi5ogOlcnJnBQUN/nZukYriBvLzYPmLVEf8
        cn1wl27NM6Vup8I6Q0R9N7Xlv+jI0mnyv6to78H9ikZ63hwMbcep5JGsK29GvdjwGwb6wkiGUMm
        ZEgqtplS6QAVCzY34oBxm
X-Received: by 2002:a05:6000:1b85:b0:230:3652:335 with SMTP id r5-20020a0560001b8500b0023036520335mr23926360wru.467.1666686724755;
        Tue, 25 Oct 2022 01:32:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6n/99R+3jgCVQqtk86ipmjKyrKefyZqABmfW2gR3xga7MiiY/0BITq9gZbQxBIar2Bc5hWMQ==
X-Received: by 2002:a05:6000:1b85:b0:230:3652:335 with SMTP id r5-20020a0560001b8500b0023036520335mr23926336wru.467.1666686724408;
        Tue, 25 Oct 2022 01:32:04 -0700 (PDT)
Received: from [192.168.0.4] ([78.19.70.238])
        by smtp.gmail.com with ESMTPSA id k7-20020a7bc407000000b003a83ca67f73sm1936596wmi.3.2022.10.25.01.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 01:32:03 -0700 (PDT)
Message-ID: <da45c2cb-72a0-066c-019e-c6f3f01c2093@redhat.com>
Date:   Tue, 25 Oct 2022 09:32:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH bpf-next v3 1/1] doc: DEVMAPs and XDP_REDIRECT
Content-Language: en-US
To:     Jesper Dangaard Brouer <jbrouer@redhat.com>, bpf@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     brouer@redhat.com
References: <20221017094753.1564273-1-mtahhan@redhat.com>
 <20221017094753.1564273-2-mtahhan@redhat.com>
 <afc6d835-3988-0b4a-afd6-496f392324dd@redhat.com>
From:   Maryam Tahhan <mtahhan@redhat.com>
In-Reply-To: <afc6d835-3988-0b4a-afd6-496f392324dd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 24/10/2022 13:12, Jesper Dangaard Brouer wrote:
> 
> First of all, I'm super happy that we are getting documentation added 
> for this.
> 
> Comments inlined below.
> 
> On 17/10/2022 11.47, mtahhan@redhat.com wrote:
>> diff --git a/Documentation/bpf/redirect.rst 
>> b/Documentation/bpf/redirect.rst
>> new file mode 100644
>> index 000000000000..5a0377a67ff0
>> --- /dev/null
>> +++ b/Documentation/bpf/redirect.rst
> 
> Naming the file 'redirect.rst' is that in anticipating that TC-BPF also 
> support invoking the bpf_redirect helper?
> 
> IMHO we should remember to *also* promote TC-BPF redirect, and it would 
> likely be good to have this in same file with XDP-redirect so end-users 
> see this.
> 

So I will leave the name as is...

> 
>> @@ -0,0 +1,46 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +.. Copyright (C) 2022 Red Hat, Inc.
>> +
>> +============
>> +XDP_REDIRECT
>> +============
>> +
>> +XDP_REDIRECT works by a three-step process, implemented as follows:
>> +
>> +1. The ``bpf_redirect()`` and ``bpf_redirect_map()`` helpers will 
>> lookup the
>> +   target of the redirect and store it (along with some other 
>> metadata) in a
>> +   per-CPU ``struct bpf_redirect_info``. This is where the maps above 
>> come into
>> +   play.
>> +
>> +2. When the program returns the ``XDP_REDIRECT`` return code, the 
>> driver will
>> +   call ``xdp_do_redirect()`` which will use the information in ``struct
>> +   bpf_redirect_info`` to actually enqueue the frame into a map 
>> type-specific
>> +   bulk queue structure.
>> +
>> +3. Before exiting its NAPI poll loop, the driver will call 
>> ``xdp_do_flush()``,
>> +   which will flush all the different bulk queues, thus completing the
>> +   redirect.
> 
> Is this text more or less copied from net/core/filter.c ?
> 
> I will suggest directly including this from the code via the DOC text
> trick.  (note I've added these DOC tags in other XDP + page_pool code,
> but not fully utilized these yet).
> 

Ok, I will update this. I had the v5 sent in before I saw your email.

> 
>> +Pointers to the map entries will be kept around for this whole 
>> sequence of
>> +steps, protected by RCU. However, there is no top-level 
>> ``rcu_read_lock()`` in
>> +the core code; instead, the RCU protection relies on everything 
>> happening
>> +inside a single NAPI poll sequence.
>> +
>> +.. note::
>> +    Not all drivers support transmitting frames after a redirect, and 
>> for
>> +    those that do, not all of them support non-linear frames. 
>> Non-linear xdp
>> +    bufs/frames are bufs/frames that contain more than one fragment.
>> +
> 
> I would like for us to extend this redirect.rst document with
> information on how to troubleshoot when XDP-redirect "silently" drops
> packets.
> 
> Above note it one issue (but not visible to readers).
> Plus we should describe how to catch these silent drops, via tracepoints
> and even point to xdpdump tool.
> 
> I recently helped someone on Slack debug a XDP redirect issue.
> During this session I wrote some bpftrace oneliners, that I added to 
> XDP-tutorial sub-README[1]
> 
> [1] 
> https://github.com/xdp-project/xdp-tutorial/blob/master/tracing02-xdp-monitor/README.org
> 
Ok, I will see what I can do.

> 
>> +XDP_REDIRECT works with the following map types:
>> +
>> +- BPF_MAP_TYPE_DEVMAP
>> +- BPF_MAP_TYPE_DEVMAP_HASH
>> +- BPF_MAP_TYPE_CPUMAP
>> +- BPF_MAP_TYPE_XSKMAP
>> +
>> +For more information on these maps, please see the specific map 
>> documentation.
>> +
>> +References
>> +===========
>> +
>> +-https://elixir.bootlin.com/linux/latest/source/net/core/filter.c#L4106
> 
> I don't think this reference with a line-number will be stable.

Yep, will move to the doc reference as you suggested earlier.

> 
> --Jesper
> 

