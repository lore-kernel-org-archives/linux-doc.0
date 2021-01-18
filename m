Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33EDC433E0
	for <linux-doc@archiver.kernel.org>; Mon, 18 Jan 2021 17:43:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC5EA22CAD
	for <linux-doc@archiver.kernel.org>; Mon, 18 Jan 2021 17:43:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436659AbhARRnh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 18 Jan 2021 12:43:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42804 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2407211AbhARRke (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Jan 2021 12:40:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610991546;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qZseZIi8yX5S303NGIXXx/ulrgZxg6NH+kedVFwQTEs=;
        b=cC6Ef+w2X3SQjcHheaWEdZRSfc4RVQb92MRrr4bgOWDNBjXFaYHOrOYyjDSsETzCWAOuN2
        Akcx8XMZQfDwRiZWRS88eGdcjPUUmnvaLGpHo1SEnnaaKB7Q/nmSkLxEWgRiCKI7qlSA9R
        ATUgR9wed/ZEdSb8a6lWGuAH2hnQVR4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-IDQiykNJOfq06MKkS6vIKw-1; Mon, 18 Jan 2021 12:39:01 -0500
X-MC-Unique: IDQiykNJOfq06MKkS6vIKw-1
Received: by mail-wr1-f72.google.com with SMTP id w5so8603888wrl.9
        for <linux-doc@vger.kernel.org>; Mon, 18 Jan 2021 09:39:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qZseZIi8yX5S303NGIXXx/ulrgZxg6NH+kedVFwQTEs=;
        b=VctIJ+vbMnbdaX8FI+LEargRWTqJ1H+rPSpGdJdUVJkXMWuq1IKECsVpcYYtmU8gM5
         IvQDjSBBjqVVnmTHbNHdGdnQ7I7e9lc4jzjcATdyPYFI2kGMoMeJMYvZazZfGy9xOEQ/
         FEv7PPquMCmv4N9hnqNTd7CYQGfyL8YDd32W20HlXImmOFbCHtxQEwEqT4UdNsSpocCp
         7pg5dAp5c5Olox1sz01QzN12kHu3qQod7t+isk/FkB/C9ZYwekcZ/QSzvDRlRIjICjS4
         g1i7Mb9tGTomVyeJkAFSedmTBVJkDNp0OXgHNlEbsMjd5rj+cn11HN6WW5VIAPZooJNN
         UQ7A==
X-Gm-Message-State: AOAM531cXomFMjgaei/TMz1OR7cwo/E3RBGL2Uir+h/7w+Xv7o0Uredr
        XkNauqcCcELK7BAp0t2RtHwfuzrplfB+ILBww2hdoMf4fTKcGDVENmP7jsZykTB8KzNwt+J3x32
        6weJLwSGfenINJhuUoe5h
X-Received: by 2002:a5d:51cc:: with SMTP id n12mr524717wrv.375.1610991540879;
        Mon, 18 Jan 2021 09:39:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzApCklNf3IsEiyOZJobGsxyao7L2kwG6STK5+IwNUs02K7KxFZ5oPtNL0EUhAYdjCSWDJH6A==
X-Received: by 2002:a5d:51cc:: with SMTP id n12mr524708wrv.375.1610991540752;
        Mon, 18 Jan 2021 09:39:00 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id b132sm29295wmh.21.2021.01.18.09.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 09:39:00 -0800 (PST)
Subject: Re: [PATCH] KVM: Documentation: Fix spec for KVM_CAP_ENABLE_CAP_VM
To:     Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "open list:KERNEL VIRTUAL MACHINE (KVM)" <kvm@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        android-kvm@google.com, kernel-team@android.com
References: <20210108165349.747359-1-qperret@google.com>
 <20210115165004.GA14556@willie-the-truck>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bb2cc30f-5a9d-ce7c-61e9-ff62ad90e035@redhat.com>
Date:   Mon, 18 Jan 2021 18:38:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115165004.GA14556@willie-the-truck>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 15/01/21 17:50, Will Deacon wrote:
> On Fri, Jan 08, 2021 at 04:53:49PM +0000, Quentin Perret wrote:
>> The documentation classifies KVM_ENABLE_CAP with KVM_CAP_ENABLE_CAP_VM
>> as a vcpu ioctl, which is incorrect. Fix it by specifying it as a VM
>> ioctl.
>>
>> Fixes: e5d83c74a580 ("kvm: make KVM_CAP_ENABLE_CAP_VM architecture agnostic")
>> Signed-off-by: Quentin Perret <qperret@google.com>
>> ---
>>   Documentation/virt/kvm/api.rst | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
>> index 70254eaa5229..68898b623d86 100644
>> --- a/Documentation/virt/kvm/api.rst
>> +++ b/Documentation/virt/kvm/api.rst
>> @@ -1328,7 +1328,7 @@ documentation when it pops into existence).
>>   
>>   :Capability: KVM_CAP_ENABLE_CAP_VM
>>   :Architectures: all
>> -:Type: vcpu ioctl
>> +:Type: vm ioctl
>>   :Parameters: struct kvm_enable_cap (in)
>>   :Returns: 0 on success; -1 on error
> 
> I tripped over this as well, so:
> 
> Acked-by: Will Deacon <will@kernel.org>
> 
> Will
> 

Queued, thanks.

Paolo

