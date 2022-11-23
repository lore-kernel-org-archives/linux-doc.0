Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93D4C43219
	for <linux-doc@archiver.kernel.org>; Wed, 23 Nov 2022 09:28:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237789AbiKWJ2n (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Nov 2022 04:28:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237704AbiKWJ17 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Nov 2022 04:27:59 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C97172DF4
        for <linux-doc@vger.kernel.org>; Wed, 23 Nov 2022 01:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669195561;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aWhU23UNuHjn5XhvzKRuF61gM+AgJzpn5aG6dSB9wLQ=;
        b=SE7MKaI/K1pvq+vuT+dJr8o5qTaU5p+Roqh7bDqgNuaiEIkj1YiyEejH8EcKZY62FOHRCE
        0MngLvJXHOMfbxjQsEl0IrY+lL3GswKdG9Zz78UFlyQK10jY8pmOY0DqX+dSQyZoStVIbv
        z0wVuPajomgKeVTvKq/sD6MM9iujIlY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-308-SW_4uFV3NymShL2fx3Di9g-1; Wed, 23 Nov 2022 04:26:00 -0500
X-MC-Unique: SW_4uFV3NymShL2fx3Di9g-1
Received: by mail-wm1-f71.google.com with SMTP id m17-20020a05600c3b1100b003cf9cc47da5so9357700wms.9
        for <linux-doc@vger.kernel.org>; Wed, 23 Nov 2022 01:25:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aWhU23UNuHjn5XhvzKRuF61gM+AgJzpn5aG6dSB9wLQ=;
        b=ogf9t5WbnPxuBRZCsi1FvWsVwSJ6OcaghUs5ZNzABWXVmX9qsWrtQiCF7fwJl0fIj2
         7rZKBSXA9pHckQCjpwYBLbEfxXu7JThE8HjdJi5heU2L4GsDEyBAaJsK6GeSNPHDQyXI
         8x+b8khn7uayidim0xrAHp/yJ8CdbAltX4+sJ/6dp3U8D5AuD/LPE6StRhVd53zbEhyA
         6VlQr/3Y6rTsFbOtBSeHwEJcHa1zxpTLIiU+Rt8eCt3PkcdTi5awfTeQCuHy//8VD3ay
         QLnJ7x1QebpKhs1IqDqTKTqY86hOuYeyqqvZvwDSK7HVB5nd9xr0o9I8TmWy7sIFukTE
         uBIg==
X-Gm-Message-State: ANoB5pmfppQs+mUy/Kt9xXwC6SQZAcVPmhkxDmOOPbZOPW6lqcN07UgI
        HklhTG2Iw2mpTQgs07iazb7NxYE1Um5ccrZoqcc+LvRfPVLQkCW9Z2Rr+i19sbRqUm/Qk1dyDt0
        BNmzaWaDqFtXsDhCCXIJJ
X-Received: by 2002:adf:f78e:0:b0:241:e8cc:f79b with SMTP id q14-20020adff78e000000b00241e8ccf79bmr2447182wrp.384.1669195558967;
        Wed, 23 Nov 2022 01:25:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf66Kk2UFRyhTXzicBsx8MDTzS2YL40MtWyR0jSc5K4O3DpR6tlO7oAubsG5Fo4JDhnbCu5/wQ==
X-Received: by 2002:adf:f78e:0:b0:241:e8cc:f79b with SMTP id q14-20020adff78e000000b00241e8ccf79bmr2447167wrp.384.1669195558767;
        Wed, 23 Nov 2022 01:25:58 -0800 (PST)
Received: from [192.168.0.4] ([78.19.107.254])
        by smtp.gmail.com with ESMTPSA id t23-20020adfa2d7000000b0023662d97130sm16402085wra.20.2022.11.23.01.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 01:25:58 -0800 (PST)
Message-ID: <20278f74-ea4a-021f-d184-cb1c4439e65f@redhat.com>
Date:   Wed, 23 Nov 2022 09:25:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH bpf-next v1 0/2] docs: fix sphinx warnings for cpu+dev
 maps
Content-Language: en-US
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     jbrouer@redhat.com, thoiland@redhat.com, donhunte@redhat.com,
        bpf@vger.kernel.org, linux-doc@vger.kernel.org
References: <20221122103738.65980-1-mtahhan@redhat.com>
 <bf664150-a544-76f8-b61f-98e6472dbebb@gmail.com>
From:   Maryam Tahhan <mtahhan@redhat.com>
In-Reply-To: <bf664150-a544-76f8-b61f-98e6472dbebb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 23/11/2022 03:13, Akira Yokosawa wrote:
> Hi,
> 
> On Tue, 22 Nov 2022 10:37:36 +0000, mtahhan@redhat.com wrote:
>> From: Maryam Tahhan <mtahhan@redhat.com>
>>
>> Sphinx version >=3.3 warns about duplicate function delcarations in the
> 
> As far as I see, Sphinx >=3.1 complains of these duplicates.

I will update

> 
>> CPUMAP and DEVMAP documentation. This is because the function name is the
>> same for Kernel and Userspace BPF progs but the parameters and return types
>> they take is what differs. This patch moves from using the ``c:function::``
>> directive to using the ``code-block:: c`` directive. The patches also fix
>> the indentation for the text associated with the "new" code block delcarations.
> I would mention that the missing support of c:namespace-push:: and
> c:namespace-pop:: directives by helper scripts for kernel documentation
> prevented you from using the c:function:: directive with proper namespacing.

I will add the note. Thank you.

> 
> Either way, for the series,
> 
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
> 
>>
>> Maryam Tahhan (2):
>>    docs: fix sphinx warnings for cpumap
>>    docs: fix sphinx warnings for devmap
>>
>>   Documentation/bpf/map_cpumap.rst | 41 +++++++++++++-----------
>>   Documentation/bpf/map_devmap.rst | 54 +++++++++++++++++---------------
>>   2 files changed, 52 insertions(+), 43 deletions(-)
>>
>> --
>> 2.34.1
>>
> 

