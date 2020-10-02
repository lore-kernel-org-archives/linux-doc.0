Return-Path: <SRS0=qRT1=DJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81304C4727E
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 01:11:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30E47207DE
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 01:11:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i0dSh7CD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387570AbgJBBLt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Oct 2020 21:11:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49896 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387430AbgJBBLr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Oct 2020 21:11:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601601105;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+fBTIK+DtEuLGceBYVu0Ja9YuYZ6ey8BaC6axIqLZaQ=;
        b=i0dSh7CDAysd+lfTxZw1e/qhjfYCBITEz272ZhrlOQFlFS5a1ricssgBayR83orNAIlee3
        HPldwkMY2YAAhjYel0dA4mKveSIfHjrD99aFQc7KLRQlKiKtrcefnU4Cew9KpBHJ0Bg9VM
        PDTJUy3GzNyd4rlz1cdKR7A+W8HGZ2c=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-LdFFeXdNNQSIWM-7ypzcSA-1; Thu, 01 Oct 2020 21:11:41 -0400
X-MC-Unique: LdFFeXdNNQSIWM-7ypzcSA-1
Received: by mail-qv1-f71.google.com with SMTP id a20so389585qvk.17
        for <linux-doc@vger.kernel.org>; Thu, 01 Oct 2020 18:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+fBTIK+DtEuLGceBYVu0Ja9YuYZ6ey8BaC6axIqLZaQ=;
        b=CXV6JCoQN52QiLYXyeT7LWylXwhsheLj25vBldciDJ3OK+L/4QxqPKv0X4v69tYYcd
         ULIpKPMoK6rK/P1V97Nr99X8HkFoN4WvRM8e0vW/yHQSjoByfjsFX9d3eW5rN80ANt4h
         rpVuFAA9g3FiXuO8/JjJY6iUWnKDHm08FqgO6CetL68scoGnASm1vclrQc1rV6bA9C9U
         Nv0cVgqzJ0/DLFQ22zapsTHYW9yerCkuphkKIG6O2rggoQPchVVtTXybqJDdYTz8TMmU
         +iUjjFAnkK3aWq38576IvedTuXZJ9P+NoUemzvi642VYugdzRES0/EX4gQdb570fc2nu
         3t4w==
X-Gm-Message-State: AOAM532yRY8Oa5qjsWqU1feC99uHQGKuYejA0I0+S0ajQkN3t8poJWwM
        Ji+c89n1BNYbE5SvOGynKG4HjIv3tahgkt7/wD6OVcyBK21hvr2xckJ1jz36wL0NuSwIiljMlC8
        lbyu/Trla4nn598XUMp/c
X-Received: by 2002:a0c:efd2:: with SMTP id a18mr10770491qvt.54.1601601101516;
        Thu, 01 Oct 2020 18:11:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHEAxmtXCBaCsYbMz7AQ6TzrqnNZn2V2MZfMf+fvEL2o95uluK/32VhnLH6xFRTh25U45PHw==
X-Received: by 2002:a0c:efd2:: with SMTP id a18mr10770468qvt.54.1601601101244;
        Thu, 01 Oct 2020 18:11:41 -0700 (PDT)
Received: from xz-x1 (toroon474qw-lp130-09-184-147-14-204.dsl.bell.ca. [184.147.14.204])
        by smtp.gmail.com with ESMTPSA id f24sm48984qka.5.2020.10.01.18.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 18:11:40 -0700 (PDT)
Date:   Thu, 1 Oct 2020 21:11:39 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Alexander Graf <graf@amazon.com>
Cc:     kvm list <kvm@vger.kernel.org>,
        Aaron Lewis <aaronlewis@google.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        KarimAllah Raslan <karahmed@amazon.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 6/8] KVM: x86: VMX: Prevent MSR passthrough when MSR
 access is denied
Message-ID: <20201002011139.GA5473@xz-x1>
References: <20200925143422.21718-1-graf@amazon.com>
 <20200925143422.21718-7-graf@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200925143422.21718-7-graf@amazon.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

I reported in the v13 cover letter of kvm dirty ring series that this patch
seems to have been broken.  Today I tried to reproduce with a simplest vm, and
after a closer look...

On Fri, Sep 25, 2020 at 04:34:20PM +0200, Alexander Graf wrote:
> @@ -3764,15 +3859,14 @@ static u8 vmx_msr_bitmap_mode(struct kvm_vcpu *vcpu)
>  	return mode;
>  }
>  
> -static void vmx_update_msr_bitmap_x2apic(struct kvm_vcpu *vcpu,
> -					 unsigned long *msr_bitmap, u8 mode)
> +static void vmx_update_msr_bitmap_x2apic(struct kvm_vcpu *vcpu, u8 mode)
>  {
>  	int msr;
>  
> -	for (msr = 0x800; msr <= 0x8ff; msr += BITS_PER_LONG) {
> -		unsigned word = msr / BITS_PER_LONG;
> -		msr_bitmap[word] = (mode & MSR_BITMAP_MODE_X2APIC_APICV) ? 0 : ~0;
> -		msr_bitmap[word + (0x800 / sizeof(long))] = ~0;
> +	for (msr = 0x800; msr <= 0x8ff; msr++) {
> +		bool intercepted = !!(mode & MSR_BITMAP_MODE_X2APIC_APICV);
> +
> +		vmx_set_intercept_for_msr(vcpu, msr, MSR_TYPE_RW, intercepted);
>  	}
>  
>  	if (mode & MSR_BITMAP_MODE_X2APIC) {

... I think we may want below change to be squashed:

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index d160aad59697..7d3f2815b04d 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -3781,9 +3781,10 @@ static void vmx_update_msr_bitmap_x2apic(struct kvm_vcpu *vcpu, u8 mode)
        int msr;
 
        for (msr = 0x800; msr <= 0x8ff; msr++) {
-               bool intercepted = !!(mode & MSR_BITMAP_MODE_X2APIC_APICV);
+               bool apicv = mode & MSR_BITMAP_MODE_X2APIC_APICV;
 
-               vmx_set_intercept_for_msr(vcpu, msr, MSR_TYPE_RW, intercepted);
+               vmx_set_intercept_for_msr(vcpu, msr, MSR_TYPE_R, !apicv);
+               vmx_set_intercept_for_msr(vcpu, msr, MSR_TYPE_W, true);
        }
 
        if (mode & MSR_BITMAP_MODE_X2APIC) {

This fixes my problem the same as having this patch reverted.

-- 
Peter Xu

