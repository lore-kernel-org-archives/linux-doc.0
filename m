Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94973C4332F
	for <linux-doc@archiver.kernel.org>; Mon, 19 Dec 2022 08:38:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231567AbiLSIiS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Dec 2022 03:38:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbiLSIiR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Dec 2022 03:38:17 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D548EA19A
        for <linux-doc@vger.kernel.org>; Mon, 19 Dec 2022 00:38:16 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id c13so5708376pfp.5
        for <linux-doc@vger.kernel.org>; Mon, 19 Dec 2022 00:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6o6oIYrQIrASNDWz2AwRUVYtKq5ZMLSdNn2LRDEa73I=;
        b=TqRlAyOAnqF9SJ8OBE8IWoqAO9l8A1lJkxThXBcp5UC9mGrIrRLzCyGbQROeNagdIp
         jOMvQFGocH36zaiNPAEKsVAXr+YCbDpXB0lA59YRbfsS/Dk2tovweUNPWDj/dZWEZii1
         d6CGOu4u9jb5yXPCn9Vv0ejpSpR45+tTvOUemjItUmXu0aYtX2H2s4HdbevMY9kZCIHJ
         Vdm76kC6evmUTjiXjIrQD0EHMo6AFzKhBpT4MxWxH6gxQ/Hediyzmhpkpik76EhFIViF
         o2UIH1rR+Fsg5bEa60X5AEO+Do0xHlxpCTYa5/2glp09XGzYRXM6iQta6vFQoMz+wZIK
         OtuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6o6oIYrQIrASNDWz2AwRUVYtKq5ZMLSdNn2LRDEa73I=;
        b=fPtwVBPB0RpbqwESNGlCyPSkFQEc9WjR1Zky3wmSEpe8DW5NIoTWJsFvNe5VoN/fGC
         hukbiF8MmCTrfyYbxMX5L+f2x4NRlGKTxbKFau4exsFqMR2yHJBL3H/S2Brg+9r68W0R
         r/VboUPbDgVR/RwsnYAnLnUDaBm0lExfR2ipGxaZvi1GxGS1W2ks1pirVA13MXptGWs8
         r7Um5xZhmdolIxu8CB9lm7TxnP5ptAVtiRwX4/E5VlBXV9CXFvQFRn7TBf4OnIjokqf+
         PwOUP9mO2G2pXT+/j7aixGWdUcK+czQUMouqCe985LbSylY2m8Dl4Q+6l+YMfU07IAwO
         9XQA==
X-Gm-Message-State: ANoB5plL9rwW0xZBWA8OsUmsq5/3ieqQ88I3nPD/bUfKLk4xiwRKPFox
        tzZJOed2Ej5xYl4ZOhWI4zg=
X-Google-Smtp-Source: AA0mqf66ikEtKJ+eJ3ZPG0EGE2G3zp0rO87CS9c/edpxwwjrFpPUpvQEjAOY2FrfrJeCq3qF3YWGWw==
X-Received: by 2002:a05:6a00:a17:b0:577:9807:2db8 with SMTP id p23-20020a056a000a1700b0057798072db8mr57795439pfh.3.1671439096370;
        Mon, 19 Dec 2022 00:38:16 -0800 (PST)
Received: from [192.168.43.80] (subs02-180-214-232-26.three.co.id. [180.214.232.26])
        by smtp.gmail.com with ESMTPSA id y5-20020a623205000000b00575448ab0e9sm5918719pfy.123.2022.12.19.00.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 00:38:15 -0800 (PST)
Message-ID: <2c6e9afa-d162-3835-0b8f-633ae924af7e@gmail.com>
Date:   Mon, 19 Dec 2022 15:38:11 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND PATCH v5 1/1] docs: driver-api: virtio: virtio on Linux
To:     "Michael S. Tsirkin" <mst@redhat.com>,
        =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net, cohuck@redhat.com,
        virtualization@lists.linux-foundation.org, jasowang@redhat.com,
        kernel@collabora.com
References: <20221010064359.1324353-1-ricardo.canuelo@collabora.com>
 <20221010064359.1324353-2-ricardo.canuelo@collabora.com>
 <Y0QYTq7KW9C731s0@debian.me>
 <87v8oqsq6k.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
 <20221219011647-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20221219011647-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 12/19/22 13:20, Michael S. Tsirkin wrote:
> I think I agree with this comment.  This seems minor enough so I applied
> the patch for now. Bagas would you like to post your suggestion as a patch on
> top? Would be appreciated. Thanks!
> 

I don't see the patch applied on your tree [1], or applied to where? Or
even forget to push?

Thanks.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git/

-- 
An old man doll... just what I always wanted! - Clara

