Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5095C77B73
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jun 2023 11:39:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbjFELje (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jun 2023 07:39:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232680AbjFELjd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jun 2023 07:39:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 611D219C
        for <linux-doc@vger.kernel.org>; Mon,  5 Jun 2023 04:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685965117;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nw6c3Frym7PEsE78EAla72qbR0TE8qr6R9Rp/jfKLzY=;
        b=c3KCDTA2x1/0uawrkpqtcSTPcNEpw8/R8gs9uTdC2Ia8khwdFXe1DsB+oOtNhuP48Ti78L
        mpA27sLC6hiSFaZ/p4oDwOh7YtQJtk6pO9FPPK5WZN6Bki08eO+PMxUwPDhwVr1oMIv8Sr
        CA7auRZ7su/duDubpbEnziB27EbXPvg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-z6q2SHmjPzy419GozaQ6xQ-1; Mon, 05 Jun 2023 07:38:36 -0400
X-MC-Unique: z6q2SHmjPzy419GozaQ6xQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3f7678c74beso6204175e9.3
        for <linux-doc@vger.kernel.org>; Mon, 05 Jun 2023 04:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685965115; x=1688557115;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nw6c3Frym7PEsE78EAla72qbR0TE8qr6R9Rp/jfKLzY=;
        b=DY1ch1spRoE1ajb1aSd5nif7/sDX6luduKRfTlGm4CFUz5fjk7qhZqjr06bXMAKqEQ
         45z8lNfFT5CedSHuq3kOucoMghpx9Ifb4g7+mHWaW8fWSXQPZ50rTh+LJS6bdyaCwVDR
         Wqf8f/3NlhHuhLRTOiopBmdIZbIv5VMFAk9Yq+sjNwEkpdEiuzcMEEpAdbTgOPeJCfqO
         5hogKvG8+xlpHqinJAD+UCLwQaIWFLo7Nr8hBNgpLmgO3M+AuT7XECZH7+GHwZRvamLA
         TVJplv2ZeISI+pVavbkGr122gyiJbR8/o+FgP2nhHLtgAVwOUR/jHUSq+QQ4vsyGWjUT
         tVpw==
X-Gm-Message-State: AC+VfDyqXg11Zk90r9CYpCSlJ4ys2z3iMZGTBVLr8SwM6eZMaKjuA3KP
        YKoja3gyYJtPFPf7Sb/aLrzPMY4A9mQ9zjtAkEbcPBRqbtT1sQk4UFJXpApKVadi54biXPBXDhd
        bKIRxkFQO+oM/fJ5laAVX
X-Received: by 2002:a05:600c:294b:b0:3f2:549b:3ef2 with SMTP id n11-20020a05600c294b00b003f2549b3ef2mr7114531wmd.17.1685965115489;
        Mon, 05 Jun 2023 04:38:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4kvL4JlLeuJgsapJ+Y6U3lmqfa/03WInR1fTsMNi3NgkfaVjGeDxgrx8WocL5SlrBLyA73Ng==
X-Received: by 2002:a05:600c:294b:b0:3f2:549b:3ef2 with SMTP id n11-20020a05600c294b00b003f2549b3ef2mr7114527wmd.17.1685965115287;
        Mon, 05 Jun 2023 04:38:35 -0700 (PDT)
Received: from ?IPV6:2003:cb:c737:8f00:ed9:16b8:4e22:5820? (p200300cbc7378f000ed916b84e225820.dip0.t-ipconnect.de. [2003:cb:c737:8f00:ed9:16b8:4e22:5820])
        by smtp.gmail.com with ESMTPSA id q13-20020a05600c46cd00b003f1978bbcd6sm24406738wmo.3.2023.06.05.04.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 04:38:34 -0700 (PDT)
Message-ID: <c9ff1306-9918-5ca5-6578-9a05a164de26@redhat.com>
Date:   Mon, 5 Jun 2023 13:38:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 11/11] Documentation: kselftest: "make headers" is a
 prerequisite
Content-Language: en-US
To:     John Hubbard <jhubbard@nvidia.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Peter Xu <peterx@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20230603021558.95299-1-jhubbard@nvidia.com>
 <20230603021558.95299-12-jhubbard@nvidia.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230603021558.95299-12-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03.06.23 04:15, John Hubbard wrote:
> As per a discussion with Muhammad Usama Anjum [1], the following is how
> one is supposed to build selftests:
> 
>      make headers && make -C tools/testing/selftests/mm
> 
> However, that's not yet documented anywhere. So add it to
> Documentation/dev-tools/kselftest.rst .
> 
> [1] https://lore.kernel.org/all/bf910fa5-0c96-3707-cce4-5bcc656b6274@collabora.com/
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>   Documentation/dev-tools/kselftest.rst | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
> index 12b575b76b20..6e35d042199c 100644
> --- a/Documentation/dev-tools/kselftest.rst
> +++ b/Documentation/dev-tools/kselftest.rst
> @@ -36,6 +36,7 @@ Running the selftests (hotplug tests are run in limited mode)
>   
>   To build the tests::
>   
> +  $ make headers
>     $ make -C tools/testing/selftests
>   
>   To run the tests::

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

