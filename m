Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18315E71094
	for <linux-doc@archiver.kernel.org>; Thu, 21 Sep 2023 16:59:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbjIUQ7f (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Sep 2023 12:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjIUQ72 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Sep 2023 12:59:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA1C10D8
        for <linux-doc@vger.kernel.org>; Thu, 21 Sep 2023 09:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695315441;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jkSn+PxPk9HUDFePBeJ+qJj/mQ3EC7rJPAPt5aKMVQM=;
        b=F/DriBNlnakBpwiZkokr3z+a5AgR3B9wCCeWop/EVSzLMj7wS5E6zW5rJdGUvhRzSNG/+w
        yCu2oTiHR78RFy5XWGRKTiGFLETjlkF3d2nrYF4hBvpyIVMVvJzbd9OThFQaTbCaLfxi7T
        doxlcyShmKX3finXVctwZIOxHUYLWOg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-nyhvP-chMsKUmn90Kypqvg-1; Thu, 21 Sep 2023 08:38:52 -0400
X-MC-Unique: nyhvP-chMsKUmn90Kypqvg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f5df65fa35so6819645e9.3
        for <linux-doc@vger.kernel.org>; Thu, 21 Sep 2023 05:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695299931; x=1695904731;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jkSn+PxPk9HUDFePBeJ+qJj/mQ3EC7rJPAPt5aKMVQM=;
        b=HOXOMV1enwxIn49qS2jtSIh9HfOjbdxxDjgZaktxMNelHL43/Ovn9tbwd3FLBUzlhr
         /lzuHKKov9EY8pKDM0b6Ziw7UuQyHKYAvO8bsH1jLEN1rWCmNTawZLZTw5DBEu6GEPT/
         EAaFK3sARbSOGggSd7UMwDzH5uvXB2cUYoE5egw3IrPS5UPALpwDUz1O9w6AwpGdtBg7
         s3ntV9Re9k9SHZ9yaT03Uml3jX7n35dyRLgq2JGuNo1dr9LhCCiDihLzH0qB4RiwUnuS
         KSb0idK+ektEN+6J/a1KvBkEOXe4kbr2uh/mJA0e3wDOUdL9qrmRRFtwBxPq/P1h1P/t
         1oxw==
X-Gm-Message-State: AOJu0YwUnSwvGr4vozREBje3qdRTvgSL1kajEdkkiV7dAI6bgFD0LZfs
        GG6LxS3d2gh+cu8ywlreykp7OPeAI+6WN1xyiuN82aBvevXjIaoN8sCcTd0/c763as5qhriGIT3
        EBCv9XekBevAUynvb46t2
X-Received: by 2002:a05:600c:2218:b0:3fe:d7c8:e0d with SMTP id z24-20020a05600c221800b003fed7c80e0dmr5342823wml.34.1695299931203;
        Thu, 21 Sep 2023 05:38:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiI3gcW3I+u5Eo8SPNcaANg2683MWXN2khdedOCHDWhlltohFDz1lgyBkB4z+3k5LCX1UlHw==
X-Received: by 2002:a05:600c:2218:b0:3fe:d7c8:e0d with SMTP id z24-20020a05600c221800b003fed7c80e0dmr5342805wml.34.1695299930876;
        Thu, 21 Sep 2023 05:38:50 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id c12-20020adfed8c000000b0032179c4a46dsm1650846wro.100.2023.09.21.05.38.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 05:38:50 -0700 (PDT)
Message-ID: <9d2cccad-16ee-abcf-5a34-7e513a050229@redhat.com>
Date:   Thu, 21 Sep 2023 14:38:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v10 33/38] x86/entry: Add fred_entry_from_kvm() for VMX to
 handle IRQ/NMI
Content-Language: en-US
To:     Nikolay Borisov <nik.borisov@suse.com>, Xin Li <xin3.li@intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
        kvm@vger.kernel.org, xen-devel@lists.xenproject.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        luto@kernel.org, seanjc@google.com, peterz@infradead.org,
        jgross@suse.com, ravi.v.shankar@intel.com, mhiramat@kernel.org,
        andrew.cooper3@citrix.com, jiangshanlai@gmail.com
References: <20230914044805.301390-1-xin3.li@intel.com>
 <20230914044805.301390-34-xin3.li@intel.com>
 <8163cf98-8968-72a4-4193-1ca9f019d9ff@suse.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <8163cf98-8968-72a4-4193-1ca9f019d9ff@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/21/23 14:11, Nikolay Borisov wrote:
>>
>> +SYM_FUNC_START(asm_fred_entry_from_kvm)
>> +    push %rbp
>> +    mov %rsp, %rbp
> 
> use FRAME_BEGIN/FRAME_END macros to ommit this code if 
> CONFIG_FRAME_POINTER is disabled.

No, the previous stack pointer is used below, so the code might as well 
use %rbp for that; but it must do so unconditionally.

Paolo

>> +
>> +    UNWIND_HINT_SAVE
>> +
>> +    /*
>> +     * Don't check the FRED stack level, the call stack leading to this
>> +     * helper is effectively constant and shallow (relatively speaking).
>> +     *
>> +     * Emulate the FRED-defined redzone and stack alignment.
>> +     */
>> +    sub $(FRED_CONFIG_REDZONE_AMOUNT << 6), %rsp
>> +    and $FRED_STACK_FRAME_RSP_MASK, %rsp
>> +
>> +    /*
>> +     * Start to push a FRED stack frame, which is always 64 bytes:
>> +     *
>> +     * +--------+-----------------+
>> +     * | Bytes  | Usage           |
>> +     * +--------+-----------------+
>> +     * | 63:56  | Reserved        |
>> +     * | 55:48  | Event Data      |
>> +     * | 47:40  | SS + Event Info |
>> +     * | 39:32  | RSP             |
>> +     * | 31:24  | RFLAGS          |
>> +     * | 23:16  | CS + Aux Info   |
>> +     * |  15:8  | RIP             |
>> +     * |   7:0  | Error Code      |
>> +     * +--------+-----------------+
>> +     */
>> +    push $0                /* Reserved, must be 0 */
>> +    push $0                /* Event data, 0 for IRQ/NMI */
>> +    push %rdi            /* fred_ss handed in by the caller */
>> +    push %rbp

^^ here

Paolo

>> +    pushf
>> +    mov $__KERNEL_CS, %rax
>> +    push %rax 

