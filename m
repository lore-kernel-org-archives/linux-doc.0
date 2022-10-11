Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A4DC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 11 Oct 2022 08:31:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbiJKIbG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Oct 2022 04:31:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiJKIbE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Oct 2022 04:31:04 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D73583208
        for <linux-doc@vger.kernel.org>; Tue, 11 Oct 2022 01:31:03 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id y1so5740683pfr.3
        for <linux-doc@vger.kernel.org>; Tue, 11 Oct 2022 01:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GaiSvknCdEAvKQe10hQBBoRlm/BNNMqTFVxB8WvhNGg=;
        b=ICD/a8CmvouQgm/gCbxCPrSVQwxsHIWR6w+i0KOoDZmGNFGtP+7FbAfxWdQbhcgWdq
         ZGpLA+cM2BkNSTb1Mv9Nt4+ZUj1swoKsCfR4yMYanTxdgNkBPO2Pytgz3wAJzUlQw7RK
         JsgSnQ+z3OXfx7bEkpHpqNFWBcw7oTO9LybEObGbAVkq4y4Hz8rtDZlYsgrlBZB2Wd2Z
         u+PsZ6mC82iJnEYNWurlm8wjQovahyL4OwW86wEPy4c3+RQW33kjbvoz6hTJ1H8ebyUg
         42ge+QzcoaRVjHvX4VDDwc2YCGoC9FbY6DZEA2N9mB/u3qbdH7zZ4jc86cbPIAJpPQdr
         vV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GaiSvknCdEAvKQe10hQBBoRlm/BNNMqTFVxB8WvhNGg=;
        b=YVGXhMYQ0ZvkgVsD5EXZ4UcZTNVpzVScJ8eoiWnbQl8h0xxcBrqprGO5UXvXowjD7B
         6UZhCyTr1UaR181b2E3SszMEj0ZqkQoKraeBZVpV0dRZHSGlUVL6kZ5o2H6L8MxXskZp
         LJ/qknytO+8LLdekfTprAWGIjVdj2nV2sAhPNJmTiD6W4bsOjawXM/I2VT//riIW0Dsi
         hWgQPjdSUcnFaVsFLxiW2DeTy5TgnsZzYZxaoAdC/WrB+5+doPuEdu0nX/FMKzZDadvM
         7zyukEG9/O/S6l0u+Emgyt/FnoNG7flXvy02B79onEfbvMPhYGSQvWqSg0iVle8Nu/qN
         MH6A==
X-Gm-Message-State: ACrzQf3Mcgoj5hQGDQ/qdj6Ucu+MBuFgs5KxiDw5mrVz9Bx6fCqcJsuE
        kMVII386Eit6Dc5RRCVP0OwiADKsFcA=
X-Google-Smtp-Source: AMsMyM63vo7XNRrdeYeiiNo+D1avBefj0cjZbN+cNKrlz+UVWCAreS4WMcPqBtPSvDqNr20Yvi2c+w==
X-Received: by 2002:a63:4850:0:b0:45d:6ee6:1c18 with SMTP id x16-20020a634850000000b0045d6ee61c18mr20665209pgk.255.1665477062574;
        Tue, 11 Oct 2022 01:31:02 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-84.three.co.id. [180.214.233.84])
        by smtp.gmail.com with ESMTPSA id v3-20020a17090ad58300b00209a12b3879sm7137326pju.37.2022.10.11.01.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 01:31:02 -0700 (PDT)
Message-ID: <11fe18cb-61a8-2682-6e2f-116c8bdd4f0a@gmail.com>
Date:   Tue, 11 Oct 2022 15:30:57 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [RESEND PATCH v5 1/1] docs: driver-api: virtio: virtio on Linux
To:     Cornelia Huck <cohuck@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>
Cc:     =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>,
        linux-doc@vger.kernel.org, corbet@lwn.net,
        virtualization@lists.linux-foundation.org, jasowang@redhat.com,
        kernel@collabora.com
References: <20221010064359.1324353-1-ricardo.canuelo@collabora.com>
 <20221010064359.1324353-2-ricardo.canuelo@collabora.com>
 <Y0QYTq7KW9C731s0@debian.me> <877d17n699.fsf@redhat.com>
 <20221010130951-mutt-send-email-mst@kernel.org> <8735buetuu.fsf@redhat.com>
 <9732990d-f362-fd38-4855-48f226da94a8@gmail.com> <87zge2dc6y.fsf@redhat.com>
Content-Language: en-US
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <87zge2dc6y.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/11/22 14:57, Cornelia Huck wrote:
>> IMO, we can link to current spec version and update it as newer version
>> becomes public; without adding "check for later version" comment note.
> 
> Is it really that important to update? Unless the virtio innards change
> radically, looking at an older version is likely to be sufficient.
> 
> ["We should update it" is likely to become "Oh, we should have updated
> it some time ago" IME :)]
> 

Oh, I mean it's OK to use older spec version as long as the kernel
implements that version. If we someday decides to bump implementation
version, the documentation should reflect that.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

