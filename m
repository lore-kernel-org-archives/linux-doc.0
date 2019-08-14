Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 428D57D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 14 Aug 2019 13:28:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727980AbfHNN2j (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 14 Aug 2019 09:28:39 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33730 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727875AbfHNN2j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Aug 2019 09:28:39 -0400
Received: by mail-wr1-f67.google.com with SMTP id u16so72187wrr.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Aug 2019 06:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wD3c7amc1JpVwiWI+kSkBB/AGknBzgV8r2jXRHJjakg=;
        b=NvESW1MztoGgpqvloVV6BMzap1wqVVx68vw5b8TsLkjIXsQTzYWsPG4755QQnOsVg4
         b+OOKPksh7FjfDtt7A38AkW6OdJqMvQnVjI7YA0/1bMoMTPvbG9njhWqypWnz0Q11zqx
         DjuH3mjQ+kZ0cwOBIvNUat6DFnwDl2OjZXKptegh78iy7IJAudGFtTbhKE320MAU1Fbl
         hY1HJ126TGs9i+lhJ0qhShgyOnz5jZwtQcJ2R60xudwCI+ViqHbfo6GzZ3xgGY78rMmi
         y3yD6E0loiRhbz7bUtbNqG0i/nAIOZEJmJpbrF9HBLyemxt6S9lz+F/wxKVvEqEcQl0P
         dzVg==
X-Gm-Message-State: APjAAAVLJu4pccyaiasmsnH6H4Xbu2LL+q1L+7wCYxjL50xYD/ppk+CB
        /n7TqT5i6+FANef4e+Zb9smRWA==
X-Google-Smtp-Source: APXvYqy9DxG4lwFJL74brqbhlEK+G/37yEbgI4xiE4CgP6MN9ewXFe/WViusZCdRxfeO2Wm09OBX3g==
X-Received: by 2002:adf:f088:: with SMTP id n8mr52802317wro.58.1565789317478;
        Wed, 14 Aug 2019 06:28:37 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:2cae:66cd:dd43:92d9? ([2001:b07:6468:f312:2cae:66cd:dd43:92d9])
        by smtp.gmail.com with ESMTPSA id x6sm120780566wrt.63.2019.08.14.06.28.36
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Aug 2019 06:28:36 -0700 (PDT)
Subject: Re: [PATCH V2 1/3] x86/Hyper-V: Fix definition of struct
 hv_vp_assist_page
From:   Paolo Bonzini <pbonzini@redhat.com>
To:     lantianyu1986@gmail.com, rkrcmar@redhat.com, corbet@lwn.net,
        kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
        sashal@kernel.org, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, hpa@zytor.com, x86@kernel.org,
        michael.h.kelley@microsoft.com
Cc:     Tianyu Lan <Tianyu.Lan@microsoft.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hyperv@vger.kernel.org, vkuznets@redhat.com
References: <20190814073447.96141-1-Tianyu.Lan@microsoft.com>
 <20190814073447.96141-2-Tianyu.Lan@microsoft.com>
 <a73173b2-da31-b5fc-394f-462c7e0bf1d4@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <a56f4aff-b4f1-949d-f04b-b35c5cc7ac44@redhat.com>
Date:   Wed, 14 Aug 2019 15:28:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a73173b2-da31-b5fc-394f-462c7e0bf1d4@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 14/08/19 15:26, Paolo Bonzini wrote:
> On 14/08/19 09:34, lantianyu1986@gmail.com wrote:
>> From: Tianyu Lan <Tianyu.Lan@microsoft.com>
>>
>> The struct hv_vp_assist_page was defined incorrectly.
>> The "vtl_control" should be u64[3], "nested_enlightenments
>> _control" should be a u64 and there is 7 reserved bytes
>> following "enlighten_vmentry". This patch is to fix it.
> 
> How did the assignment to vp_ap->current_nested_vmcs work then?  Does
> the guest simply not care?

... nevermind, I miscounted the length of vtl_control.

Paolo

> Paolo
> 
>> Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
>> --
>> Change since v1:
>>        Move definition of struct hv_nested_enlightenments_control
>>        into this patch to fix offset issue.
>> ---
>>  arch/x86/include/asm/hyperv-tlfs.h | 20 +++++++++++++++-----
>>  1 file changed, 15 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/x86/include/asm/hyperv-tlfs.h b/arch/x86/include/asm/hyperv-tlfs.h
>> index af78cd72b8f3..cf0b2a04271d 100644
>> --- a/arch/x86/include/asm/hyperv-tlfs.h
>> +++ b/arch/x86/include/asm/hyperv-tlfs.h
>> @@ -514,14 +514,24 @@ struct hv_timer_message_payload {
>>  	__u64 delivery_time;	/* When the message was delivered */
>>  } __packed;
>>  
>> +struct hv_nested_enlightenments_control {
>> +	struct {
>> +		__u32 directhypercall:1;
>> +		__u32 reserved:31;
>> +	} features;
>> +	struct {
>> +		__u32 reserved;
>> +	} hypercallControls;
>> +} __packed;
>> +
>>  /* Define virtual processor assist page structure. */
>>  struct hv_vp_assist_page {
>>  	__u32 apic_assist;
>> -	__u32 reserved;
>> -	__u64 vtl_control[2];
>> -	__u64 nested_enlightenments_control[2];
>> -	__u32 enlighten_vmentry;
>> -	__u32 padding;
>> +	__u32 reserved1;
>> +	__u64 vtl_control[3];
>> +	struct hv_nested_enlightenments_control nested_control;
>> +	__u8 enlighten_vmentry;
>> +	__u8 reserved2[7];
>>  	__u64 current_nested_vmcs;
>>  } __packed;
>>  
>>
> 

