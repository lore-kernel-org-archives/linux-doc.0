Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF0FC43219
	for <linux-doc@archiver.kernel.org>; Tue, 11 Oct 2022 07:20:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbiJKHUn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Oct 2022 03:20:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbiJKHUl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Oct 2022 03:20:41 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA14F33E13
        for <linux-doc@vger.kernel.org>; Tue, 11 Oct 2022 00:20:40 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id b5so12134129pgb.6
        for <linux-doc@vger.kernel.org>; Tue, 11 Oct 2022 00:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HtbbNq74MZR/IINBAH/6T6MIuhnVmjm+CZ06hchXgS0=;
        b=RLPXITCUgFR1yNb2oBSdU/OynwxNPml6ZdejJaw8tnZx/V3od2mb7tlc9e+Z131D1Z
         Rw44jepY9OLik/WBAsuAfhhyhVGoQG2YgeyhR6KmgE4eKEt0iuYPprJapktW4pQ8Ko6Q
         zq8kUy1MAHNmN9ffqOcdIKCteSn4vLqAqtL9EAuTsVkhBxXE/cnLULLUPX3pw3ujrIsw
         uxBnGvt1zPeDUpcNZ/NluNu8FI+lsr9M8r4VhMHH6Ify9wGJW1nCBeeXoNn6fL9W/5D7
         Uh7GVn4onvrM/H/8ABQeF2u9Kbt+wBcr3bm4tY4AH2wrVpZVvk5mxywW4/nsduEBJBZX
         2+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HtbbNq74MZR/IINBAH/6T6MIuhnVmjm+CZ06hchXgS0=;
        b=06qx5aIhxoJOZKwV5e39tlOexcNqsWjSvhRz6plLfR2F7u0SiMLKnZ4deGk/MZrVda
         apgtFcZ3hTJKO3aFpllHh57f095kdeaZhrLjd69qOcYIMz3gs9NspWMp2HtqA8ohXLDe
         8cZi4TEdBDFhy6VBnIkgHeRxTQOvmrgR/szVIZy91YnDcXIDKfVTKyjGRTSlCbUb2TTn
         dywYA0QoYXBP52dagxwjA6ZjVzTetD4ocJMDDw8oIeDELRfLSy9Itl6YecNh3yN3v94x
         ozUAwhqrCQgeVOTf9JVmENjhiQZsvBwpWv/JEUKD5+TCvG4YqiExyDHBRJl+bIPYBhiz
         iNnA==
X-Gm-Message-State: ACrzQf3cSGtezlSLEhlzuSund5a5uHCoJIJjzqsTqy7CGgcBDgTRBzgJ
        mKTqWoppEkMWyUKdA0Qtsak=
X-Google-Smtp-Source: AMsMyM5lPQR2sAllgblLptZ5n+cgyDbiqutkrhm54TLI3dZcdk/wNLA/Wk8KfzyCAjd4CDZNjs37kA==
X-Received: by 2002:a63:24d:0:b0:452:87c1:9781 with SMTP id 74-20020a63024d000000b0045287c19781mr20035322pgc.512.1665472840340;
        Tue, 11 Oct 2022 00:20:40 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-84.three.co.id. [180.214.233.84])
        by smtp.gmail.com with ESMTPSA id a13-20020a170902eccd00b0017f9021ddc6sm7791841plh.289.2022.10.11.00.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 00:20:40 -0700 (PDT)
Message-ID: <9732990d-f362-fd38-4855-48f226da94a8@gmail.com>
Date:   Tue, 11 Oct 2022 14:20:33 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [RESEND PATCH v5 1/1] docs: driver-api: virtio: virtio on Linux
Content-Language: en-US
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
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <8735buetuu.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/11/22 13:51, Cornelia Huck wrote:
> On Mon, Oct 10 2022, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
>> On Mon, Oct 10, 2022 at 03:43:46PM +0200, Cornelia Huck wrote:
>>> On Mon, Oct 10 2022, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>>>
>>>> On Mon, Oct 10, 2022 at 08:43:59AM +0200, Ricardo Cañuelo wrote:
>>>>> +
>>>>> +References
>>>>> +==========
>>>>> +
>>>>> +_`[1]` Virtio Spec v1.2:
>>>>> +https://docs.oasis-open.org/virtio/virtio/v1.2/virtio-v1.2.html
>>>>> +
>>>>> +Check for later versions of the spec as well.
>>>>> +
>>>>
>>>> The version checking should be made comment (not visible on the output):
>>>>
>>>> ---- >8 ----
>>>> diff --git a/Documentation/driver-api/virtio/virtio.rst b/Documentation/driver-api/virtio/virtio.rst
>>>> index 70b3aa6bcf5518..4f3abbec4e8b2c 100644
>>>> --- a/Documentation/driver-api/virtio/virtio.rst
>>>> +++ b/Documentation/driver-api/virtio/virtio.rst
>>>> @@ -134,7 +134,7 @@ References
>>>>  _`[1]` Virtio Spec v1.2:
>>>>  https://docs.oasis-open.org/virtio/virtio/v1.2/virtio-v1.2.html
>>>>  
>>>> -Check for later versions of the spec as well.
>>>> +.. Check for later versions of the spec as well.
>>>>  
>>>>  _`[2]` Virtqueues and virtio ring: How the data travels
>>>>  https://www.redhat.com/en/blog/virtqueues-and-virtio-ring-how-data-travels
>>>>
>>>>> diff --git a/Documentation/driver-api/virtio/writing_virtio_drivers.rst b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
>>>>> new file mode 100644
>>>>> index 000000000000..e14c58796d25
>>>>> --- /dev/null
>>>>> +++ b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
>>>>> <snipped>...
>>>>> +References
>>>>> +==========
>>>>> +
>>>>> +_`[1]` Virtio Spec v1.2:
>>>>> +https://docs.oasis-open.org/virtio/virtio/v1.2/virtio-v1.2.html
>>>>> +
>>>>> +Check for later versions of the spec as well.
>>>>
>>>> Same reply.
>>>
>>> I don't think we should hide that in a comment -- unless you want to
>>> update this file every time a new version of the virtio spec gets
>>> released.
>>
>> What do you suggest? Just http://docs.oasis-open.org/virtio/virtio/ ?
> 
> That one is ugly, as it is just a directory listing... my preference is
> to link to the latest version at the time of writing, and mentioning
> that there may be later versions available, i.e. what the patch does
> right now.
> 

IMO, we can link to current spec version and update it as newer version
becomes public; without adding "check for later version" comment note.

-- 
An old man doll... just what I always wanted! - Clara

