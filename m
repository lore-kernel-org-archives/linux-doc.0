Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C1AC433F5
	for <linux-doc@archiver.kernel.org>; Fri, 30 Sep 2022 08:56:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbiI3I4V (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Sep 2022 04:56:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231211AbiI3I4T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Sep 2022 04:56:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA0D010533C
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 01:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664528178;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=H1917BFrSGG49QIpV583BBnZoc9EFPAGT5mhF0PR/tU=;
        b=QSODmf8QB9oXYceitSpJu26FMwqgFw7bwU6e5uV2pNmWwfWYe63mBOm4Pt/GITV5QonsUZ
        6GSP7g9H3fZ2HlxHzoyGGpKA0IgWXV0BTD1hW8F+Aw6mzTyjKOtbRi9fH7/PSdGdnn/JD5
        6cOsOR+u2WunCfvhXql27MqovuS7JaY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-500-0TMCci2RNJWNC_PKX1iaxg-1; Fri, 30 Sep 2022 04:56:10 -0400
X-MC-Unique: 0TMCci2RNJWNC_PKX1iaxg-1
Received: by mail-wr1-f72.google.com with SMTP id u20-20020adfc654000000b0022cc05e9119so1321953wrg.16
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 01:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=H1917BFrSGG49QIpV583BBnZoc9EFPAGT5mhF0PR/tU=;
        b=nH10KMu31BuXr62MeqjdMjkxWCdE43SVr9Bls6CTyMDvQXM8yaF9/6WDVpr+rkZ8rM
         lpO9Qc1LuWUnkv5/XY/cyzSBpU3P0k5233gxIB7yZq5o1id9FEBh59kP48zgTvSlRKZ6
         3LgKtrwWNl11cHLpvY6zPBizE0K/xs7/+5a1s0j79uXUQkhdHZj/dkZuq7u4Ddzu67xc
         yMD5yj+U4Mo7QpfTY4aUpnMWWqqheOcTUch+thoxrSgGQh2x/U5INAeIRTO7UuRuvX02
         NtIh4HLibWuTeTH7bN1CpDTRtG8lTZ/mNbPLB7/1DKXc+SHwVUVZx8vSXvwR3nOPaQAA
         HxFQ==
X-Gm-Message-State: ACrzQf2f/Ote24A5QsCYWg5js2eJb+MerxFjHL2k+Fendyx4JBtMHKJG
        VUV9V9Xc+4TLcdIywGxfGs2H1jgEhC0shuGHJMeT1//Hnipo08NK3hOoaCGUQ+cfvOq9ADQeyNr
        xGuPK+b6Kft9RQRIo9hHW
X-Received: by 2002:adf:fb0e:0:b0:21a:34a2:5ca9 with SMTP id c14-20020adffb0e000000b0021a34a25ca9mr5117364wrr.472.1664528169081;
        Fri, 30 Sep 2022 01:56:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7bQ1YcgDeDZMxCbvzQfLrr5IFUFVFRr9mPvR/s+XRlHVHTlaxAi2okTKjOec5tY8fb3K/KtQ==
X-Received: by 2002:adf:fb0e:0:b0:21a:34a2:5ca9 with SMTP id c14-20020adffb0e000000b0021a34a25ca9mr5117355wrr.472.1664528168832;
        Fri, 30 Sep 2022 01:56:08 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70c:c00:48b:b68a:f9e0:ebce? (p200300cbc70c0c00048bb68af9e0ebce.dip0.t-ipconnect.de. [2003:cb:c70c:c00:48b:b68a:f9e0:ebce])
        by smtp.gmail.com with ESMTPSA id z6-20020adfec86000000b0022b1d74dc56sm1478618wrn.79.2022.09.30.01.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 01:56:08 -0700 (PDT)
Message-ID: <f34ee8be-f27d-3ea6-459a-534a52b71387@redhat.com>
Date:   Fri, 30 Sep 2022 10:56:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH -next v5 2/4] selftests/memory-hotplug: Restore memory
 before exit
Content-Language: en-US
To:     zhaogongyi <zhaogongyi@huawei.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Cc:     "akinobu.mita@gmail.com" <akinobu.mita@gmail.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "osalvador@suse.de" <osalvador@suse.de>,
        "shuah@kernel.org" <shuah@kernel.org>
References: <276cce524b1146119f8a0e9ec00a2ba9@huawei.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <276cce524b1146119f8a0e9ec00a2ba9@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 30.09.22 10:52, zhaogongyi wrote:
> Hi!
> 
>>
>> On 30.09.22 08:35, Zhao Gongyi wrote:
>>> Some momory will be left in offline state when calling
>>> offline_memory_expect_fail() failed. Restore it before exit.
>>>
>>> Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
>>> ---
>>>    .../memory-hotplug/mem-on-off-test.sh         | 21
>> ++++++++++++++-----
>>>    1 file changed, 16 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
>> b/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
>>> index 1d87611a7d52..91a7457616bb 100755
>>> --- a/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
>>> +++ b/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
>>> @@ -134,6 +134,16 @@ offline_memory_expect_fail()
>>>    	return 0
>>>    }
>>>
>>> +online_all_offline_memory()
>>> +{
>>> +	for memory in `hotpluggable_offline_memory`; do
>>> +		if ! online_memory_expect_success $memory; then
>>> +			echo "$FUNCNAME $memory: unexpected fail" >&2
>>
>> Do we need that output?
> 
> In my opinion, if online a memory node failed ,it should be a kernel bug catched, so, I think the output here is needed.

But online_memory_expect_success() already prints a warning, no?

-- 
Thanks,

David / dhildenb

