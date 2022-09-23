Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A01ABECAAD8
	for <linux-doc@archiver.kernel.org>; Fri, 23 Sep 2022 10:58:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbiIWK6r (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Sep 2022 06:58:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231837AbiIWK6d (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Sep 2022 06:58:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C39AADE9D
        for <linux-doc@vger.kernel.org>; Fri, 23 Sep 2022 03:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663930712;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pq+nqOhkpxfLUyiqEq4MNg6ulDavWi2pU/tSeIb7Oc0=;
        b=Gl2cDoLB6/AvIdcZ30SWvHLyp1GIr5KC5dwlIfWn7G+g9W8R1vRyGdKo5C8BW4d4hcFp+i
        gTGf/pnDjaAZYIhcC4xLdM+9RNrcuq1rcdT4UQmZ3h2tn+OXlOzFIPVzFjpPW2Er1g7Pir
        poaJbeOi3B9Hrm2smmnYnttw/Zx8KmU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-464-SDp1-tU3PaejjV0danTFvw-1; Fri, 23 Sep 2022 06:58:30 -0400
X-MC-Unique: SDp1-tU3PaejjV0danTFvw-1
Received: by mail-wm1-f72.google.com with SMTP id p9-20020a05600c23c900b003b48dc0cef1so1690506wmb.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Sep 2022 03:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=pq+nqOhkpxfLUyiqEq4MNg6ulDavWi2pU/tSeIb7Oc0=;
        b=Yqkpr1ZAPWBQ+181UKFyFAnxaQYz7PuiK2vSW74dpys0XkdsAR5bgxTrR3vf7/J0uU
         azzY48bW7ZmDHuHPmgbwEVjC8JWxXV0xBiDxKlYZZ1bDPDD+3HSVF9f8ArFmvLqeHAUC
         gJ7NSUjvglrdEnbeatAm3MAjdFySvAGCOTmzVVIhhDC0RVau6bDQFuTxOqTe0qSpL3hq
         tVRyRgoH5fV3PykauVG5USRwCp9Uv7T05VzvKn+td65Vx/fVhZ1ZGho2foy9YGO6EP8x
         Fz9CZwSy45LzViLvDTQJpeIj9vewbCJo8tGuf29vZ4jr5Sehfmil1DdlnTNu+dNKUyhA
         lawQ==
X-Gm-Message-State: ACrzQf3vPUtGFFNq/ayHmk+voEZqCxix1Zpnro/BzXzgrGsEk4Sl/pAo
        yGfnbm8mIpQTK8efTLOFm8qrPRjggSYJhluWDdx9WOYxAbWlX4GpA56hEwihg8KIQFkVtpx5EID
        5Beh9iu3NPkptRtmHehwM
X-Received: by 2002:a05:6000:794:b0:22b:311:afe9 with SMTP id bu20-20020a056000079400b0022b0311afe9mr4596516wrb.509.1663930709602;
        Fri, 23 Sep 2022 03:58:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM692HEan4sa48+pnUlqFXSHn8xzHJwtwuzQCIVFVG2mftuoGFZX1M6CyfbTNUt+KIc+bI3WYg==
X-Received: by 2002:a05:6000:794:b0:22b:311:afe9 with SMTP id bu20-20020a056000079400b0022b0311afe9mr4596495wrb.509.1663930709283;
        Fri, 23 Sep 2022 03:58:29 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:cc00:4585:a83b:64f2:ad21? (p200300cbc704cc004585a83b64f2ad21.dip0.t-ipconnect.de. [2003:cb:c704:cc00:4585:a83b:64f2:ad21])
        by smtp.gmail.com with ESMTPSA id i66-20020a1c3b45000000b003b2878b9e0dsm2158664wma.20.2022.09.23.03.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 03:58:28 -0700 (PDT)
Message-ID: <4f7ae306-7894-8baa-f920-441ce8c472a0@redhat.com>
Date:   Fri, 23 Sep 2022 12:58:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 3/3] checkpatch: warn on usage of VM_BUG_ON() and other
 BUG variants
Content-Language: en-US
To:     John Hubbard <jhubbard@nvidia.com>, Joe Perches <joe@perches.com>,
        linux-kernel@vger.kernel.org
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        David Laight <David.Laight@ACULAB.COM>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Whitcroft <apw@canonical.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
        Dave Young <dyoung@redhat.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20220920122302.99195-1-david@redhat.com>
 <20220920122302.99195-4-david@redhat.com>
 <d0c59eb8-baca-26fd-5f10-4a1f89bcf7b9@nvidia.com>
 <3179f4545d3f71358da3e6c6ee18085af601b2eb.camel@perches.com>
 <60fa5b16-021e-1e54-7e06-39bbb871eaef@nvidia.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <60fa5b16-021e-1e54-7e06-39bbb871eaef@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

>> And I think that "Do not crash" is a stronger statement than "Avoid crashing"
>> so I prefer the original suggestion but it's not a big deal either way.
> 
> Yes, stronger wording is better. So how about this:
> 
> "Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants\n" . $herecurr);

Okay, let's use that.

Thanks!

-- 
Thanks,

David / dhildenb

