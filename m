Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F948C0018C
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 11:50:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0730823D56
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 11:50:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbgLJLuR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Dec 2020 06:50:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39828 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729051AbgLJLuI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Dec 2020 06:50:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607600922;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S1cqRGAPZ7tEyP9tZX4DdUYMRy3eYwTTW4lAfMAIl0U=;
        b=HkgG1kXL7olujNRkv1Fnw3D+YdKvUXLfQt+FL/ateCDod/Ge+DrJtnc7ajNlxA0ZA/Suhu
        QzjEAF6TcJFNi+hjOZ6DXaERy9+AHVMRrbEC3haElxOphszgzVF18fkBh8h8pQ6tqDGsZZ
        SSPNg+1Q4VIP5DUZ5urCxyJAYCm0j24=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-4XgQCQn3NBqF0K8cRRK7fw-1; Thu, 10 Dec 2020 06:48:40 -0500
X-MC-Unique: 4XgQCQn3NBqF0K8cRRK7fw-1
Received: by mail-ej1-f71.google.com with SMTP id u10so1526251ejy.18
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 03:48:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=S1cqRGAPZ7tEyP9tZX4DdUYMRy3eYwTTW4lAfMAIl0U=;
        b=RvOq9vRj2B7aVICrXZMCmGON5Cbh9g6EoE1ceHsMbB/bx1J+FtfQw9/xDWQnj1JnYU
         5QLsNCO0nb0jHErrWP8Tb1EeamoUpzQE1+5AK62KB5MBkvVllbQoCr8nd0aCiEadah7T
         f4PNrupgcCkan0XCF3a3nZeWNaUwXpRL1EX4FzWMgieAAPKeowV209sNhVEZslK1XwFN
         aU2556g1CPUsJkGBDVlfHaOJtP5NeMa2VrKXPfIfSSXUNBv7tV88XbWdJ/RQpGdHDSNo
         BcnJoxWciznXMBYrLnrwiIpASLkntwPxOvABajhbqcjUc2g/qSSKIvBe1QFlILoY7r86
         9fvA==
X-Gm-Message-State: AOAM531CBD0WMyI2Ff1+fCcKNoo9W1tMQnhM096Pcb5radMsGcNZtltW
        9QpJQSqwjFi6GXRnHrQLMcserAI37mD54zsp6yvJgrYbeUWszYP4IjLn3uD2lQiuW0KM6h14gUT
        Ff2NC5MXwGAVZC4+pmEfSDsnVbz0TBNsUUKaBdzmTIqmnHpAJNXal0yDMRQFOcl4pOAJduMe/
X-Received: by 2002:a17:906:1e0c:: with SMTP id g12mr6163992ejj.115.1607600918899;
        Thu, 10 Dec 2020 03:48:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyB1pH5eIBmIOmgLLK8HLkGQLR9KY10/es9c1MjQzaruXTof/K9wc6bX6AIrPVAFDaTCBimbA==
X-Received: by 2002:a17:906:1e0c:: with SMTP id g12mr6163955ejj.115.1607600918641;
        Thu, 10 Dec 2020 03:48:38 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.gmail.com with ESMTPSA id q26sm4127282ejt.73.2020.12.10.03.48.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Dec 2020 03:48:37 -0800 (PST)
From:   Paolo Bonzini <pbonzini@redhat.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>
Cc:     kvm@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jim Mattson <jmattson@google.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        open list <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Borislav Petkov <bp@alien8.de>,
        Shuah Khan <shuah@kernel.org>,
        Andrew Jones <drjones@redhat.com>,
        Oliver Upton <oupton@google.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <20201203171118.372391-1-mlevitsk@redhat.com>
 <20201203171118.372391-2-mlevitsk@redhat.com>
 <20201207232920.GD27492@fuller.cnet>
 <05aaabedd4aac7d3bce81d338988108885a19d29.camel@redhat.com>
 <87sg8g2sn4.fsf@nanos.tec.linutronix.de>
 <6f64558a029574444da417754786f711c2fec407.camel@redhat.com>
 <87blf42dvv.fsf@nanos.tec.linutronix.de>
Subject: Re: [PATCH v2 1/3] KVM: x86: implement KVM_{GET|SET}_TSC_STATE
Message-ID: <70f9a5b3-d912-2a46-3718-a9c7591cd1f4@redhat.com>
Date:   Thu, 10 Dec 2020 12:48:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87blf42dvv.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 08/12/20 22:20, Thomas Gleixner wrote:
> 
> So now life migration comes a long time after timekeeping had set the
> limits and just because it's virt it expects that everything works and it
> just can ignore these limits.
> 
> TBH. That's not any different than SMM or hard/firmware taking the
> machine out for lunch. It's exactly the same: It's broken.

I agree.  If *live* migration stops the VM for 200 seconds, it's broken.

Sure, there's the case of snapshotting the VM over the weekend.  My 
favorite solution would be to just put it in S3 before doing that.  *Do 
what bare metal does* and you can't go that wrong.

In general it's userspace policy whether to keep the TSC value the same 
across live migration.  There's pros and cons to both approaches, so KVM 
should provide the functionality to keep the TSC running (which the 
guest will see as a very long, but not extreme SMI), and this is what 
this series does.  Maxim will change it to operate per-VM.  Thanks 
Thomas, Oliver and everyone else for the input.

Paolo

