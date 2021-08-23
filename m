Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54595C4338F
	for <linux-doc@archiver.kernel.org>; Mon, 23 Aug 2021 19:17:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26DDA60F11
	for <linux-doc@archiver.kernel.org>; Mon, 23 Aug 2021 19:17:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbhHWTSH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 23 Aug 2021 15:18:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50000 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230332AbhHWTSG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Aug 2021 15:18:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629746243;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hfa5vNFo38/k45EAS0ocbtPh3eTQnzy51Lm4DUgg6zo=;
        b=HlL4pxQMbi67rgNJmLejbMFnK0Pvz2ZVsWrNA0+x3WyBAzZMKRBHgZrcwiRkupkNHgPbfz
        AVI+HVyRuh6mbdqE2oBtk9Vn4B92SrtVLIPydvloxyeb0wtIzku9v6QVBjpaODAIzKBJMd
        58i6/Xa6ANkpPszuifySne/Bx+pVDGw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-IqO8jCqdM2eKU84s-RSlOQ-1; Mon, 23 Aug 2021 15:17:22 -0400
X-MC-Unique: IqO8jCqdM2eKU84s-RSlOQ-1
Received: by mail-wm1-f72.google.com with SMTP id p2-20020a05600c358200b002e6dc6adcecso256538wmq.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Aug 2021 12:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=hfa5vNFo38/k45EAS0ocbtPh3eTQnzy51Lm4DUgg6zo=;
        b=QaENlEJ4UI3Gw/aqJEwh7BWFKRgVyzZS4ck7eqkgYEW+ew1ogyjF/Tb4kDsRg7eBFv
         qzkKTwLlmxukyuBrlDEm02H1v8VZmzoimOKsyth63I3hfZ500251P9ti4EaB5V848cJv
         jJS8Lah6zecNJmCHbLQdtXGQAcz/warCqMA1lsNfvCXVvIHcS3Z7ieVHFeVePAm3E399
         q11lQ6malFvk8JU5EATTCnj2hmZI3oDd00YGMCw/9+ALrj5Jk3CX8XfouDCx+ssV8lCb
         LZziqFZJR17Pbb1x11yX/Q8hTJINlpq3iS8e06gbgLF9VBJQVGWEsRVCweRhCXrqWpmZ
         oupA==
X-Gm-Message-State: AOAM531OsR8FRi73Av+rwT8x4D2f2GTCNLbvG12sd7rUdIU9URj0I1po
        Kf5sNpltpyoupGpjg1EB4axDX9CagA642sefXYRRdxJyYIeBLArKVBnL20Y2V+5n0MObRCy3Djn
        elsFMFn+JyxkWY7F4N0k2
X-Received: by 2002:a5d:4b01:: with SMTP id v1mr14808694wrq.377.1629746241194;
        Mon, 23 Aug 2021 12:17:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCCa98KM7/EeqgBJubHh9aDYEDS2dcPiXFmf/SLIfXyxzg0Qtn0czsk3yMiJSWGjR9BG9PAg==
X-Received: by 2002:a5d:4b01:: with SMTP id v1mr14808679wrq.377.1629746241045;
        Mon, 23 Aug 2021 12:17:21 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c60c6.dip0.t-ipconnect.de. [91.12.96.198])
        by smtp.gmail.com with ESMTPSA id q22sm58557wmj.32.2021.08.23.12.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 12:17:20 -0700 (PDT)
Subject: Re: [PATCH V1] hugetlbfs: Extend the definition of hugepages
 parameter to support node allocation
To:     yaozhenguo <yaozhenguo1@gmail.com>, mike.kravetz@oracle.com,
        corbet@lwn.net, akpm@linux-foundation.org
Cc:     yaozhenguo@jd.com, willy@infradead.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org
References: <20210823130154.75070-1-yaozhenguo1@gmail.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <be7017ea-0728-b342-0c78-f88256024dfb@redhat.com>
Date:   Mon, 23 Aug 2021 21:17:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823130154.75070-1-yaozhenguo1@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 23.08.21 15:01, yaozhenguo wrote:
> We can specify the number of hugepages to allocate at boot. But the
> hugepages is balanced in all nodes at present. In some scenarios,
> we only need hugepags in one node. For example: DPDK needs hugepages
> which is in the same node as NIC. if DPDK needs four hugepags of 1G
> size in node1 and system has 16 numa nodes. We must reserve 64 hugepags
> in kernel cmdline. But, only four hugepages is used. The others should
> be free after boot.If the system memory is low(for example: 64G), it will
> be an impossible task. So, extend hugepages kernel parameter to specify
> node number of hugepages to allocate at boot.
> For example add following parameter:
> 
> hugepagesz=1G hugepages=0:1,1:3
> 
> It will allocate 1 hugepags in node0 and 3 hugepages in node1.

I like this format.


-- 
Thanks,

David / dhildenb

