Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 323547D2EF
	for <lwn-linux-doc@archive.lwn.net>; Wed, 29 May 2019 01:25:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbfE2BZm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 28 May 2019 21:25:42 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34799 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbfE2BZm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 May 2019 21:25:42 -0400
Received: by mail-wr1-f68.google.com with SMTP id f8so475686wrt.1
        for <linux-doc@vger.kernel.org>; Tue, 28 May 2019 18:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rqj4DN+mKFOFN2ElIEBtWrUBDtgBpL5CxV4R4XTM10o=;
        b=nJrYDY/NEnyvv7sm8SqXPyv+RhyARg/NgpgqZteM1uejUtYod0n5Q5CWVpREkqOE7g
         Qi8t5XxEx4mVp7a7RO390+BnE5Zj9D5td6XSLyLyP1MNtht/7Ci+kQ0CBZJOui/VJq2k
         XPWwo4WUvTlC8InyPpGcd7YDV+dr5J6gFqp9GeOj7TO5z4SnU5w+827XQEASEwmB8nLh
         1BrA2+1xSlowZ2OtIfhD6tR+oc696Ia/1wOjeatTXvgmepbxVzgJNZNvYApMpoUrkXSV
         TkN9mmvrON2vg6xbghLRnswLe4nNGV/iGAkWqg9/ewUg6lt+tUoCWEGcNl3h1Y5V4Yhh
         OkxA==
X-Gm-Message-State: APjAAAWpcu/MpRf9rgm9es746i3OCXn/LYkJ1+0HqbD9OjhZEhCebRpw
        EFJ9bWj4XDmOV+qfz5zDgwT0sw==
X-Google-Smtp-Source: APXvYqwtWVxxE2Y3KBugsv4RW0JNUGuXKYKlfAWL8wp283sVlUi5mkh0LOf0h0ykT1V8TpWOn1NBog==
X-Received: by 2002:a5d:5189:: with SMTP id k9mr14487648wrv.329.1559093141154;
        Tue, 28 May 2019 18:25:41 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
        by smtp.gmail.com with ESMTPSA id s15sm10845265wrn.68.2019.05.28.18.25.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 18:25:40 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] KVM: x86: add support for user wait instructions
To:     Peter Zijlstra <peterz@infradead.org>, Tao Xu <tao3.xu@intel.com>
Cc:     rkrcmar@redhat.com, corbet@lwn.net, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        sean.j.christopherson@intel.com, x86@kernel.org,
        kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, jingqi.liu@intel.com
References: <20190524075637.29496-1-tao3.xu@intel.com>
 <20190524075637.29496-2-tao3.xu@intel.com>
 <20190527103003.GX2623@hirez.programming.kicks-ass.net>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bcf669c8-81f4-0024-5f66-c40c6d519c62@redhat.com>
Date:   Wed, 29 May 2019 03:25:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190527103003.GX2623@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 27/05/19 12:30, Peter Zijlstra wrote:
>> This patch adds support for UMONITOR, UMWAIT and TPAUSE instructions
>> in kvm, and by default dont't expose it to kvm and provide a capability
>> to enable it.
>
> I'm thinking this should be conditional on the guest being a 1:1 guest,
> and I also seem to remember we have bits for that already -- they were
> used to disable paravirt spinlocks for example.

This should be userspace's choice.  It would indeed be silly to enable
this while overcommitted, but KVM doesn't really care.

Paolo
