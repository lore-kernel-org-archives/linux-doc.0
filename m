Return-Path: <SRS0=pZ1j=DC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E95ACC4727F
	for <linux-doc@archiver.kernel.org>; Fri, 25 Sep 2020 22:22:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1CFC20BED
	for <linux-doc@archiver.kernel.org>; Fri, 25 Sep 2020 22:22:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QpYghhve"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728662AbgIYWWY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Sep 2020 18:22:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31715 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728431AbgIYWWY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Sep 2020 18:22:24 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601072542;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WnXTkz+/ctmLQQwvaDR7Qd+4H4vqY3Yke9ZK1sUrI2Q=;
        b=QpYghhvepwrBSO9ltbSUbjv7d3BceBrAvM0UQfK5FakTW9tD1JqycBPyQ8WcFVmKD2L2ry
        BeBhjypSqHTeDhZpUiSGZLVV30lLsEffaCSQugDbd6lpaKpasmhuvqchU9MzDnlrIx+dvC
        0tEaR5MFBVlX4YVCj1+NvmfvpXJzAf8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-wZfVwdc6N_-3FFK8OgqGKQ-1; Fri, 25 Sep 2020 18:22:20 -0400
X-MC-Unique: wZfVwdc6N_-3FFK8OgqGKQ-1
Received: by mail-wr1-f71.google.com with SMTP id 33so1625989wrk.12
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2020 15:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WnXTkz+/ctmLQQwvaDR7Qd+4H4vqY3Yke9ZK1sUrI2Q=;
        b=V4ZFkq4aGBOiapWrLSf2CAgTimzE+9/+GTTIQAYEwfdK5NLniFZm/TZ+bD1riFz3e9
         mcsRk7GrwMHbXze8AOLypcNxYlD1DkmRDEI8OyGjlRJiXgvW/vrDLfTP0oX3GrlvJ6fa
         BaO/OQOir6/Q7HhgO6rRDv+ByHO/p6hqsHavZr9ezm2J8+LifOHV5x6SsD/3LAiOzYZv
         eYhGE2N5XJGC9soiWJKtVLPnDC6NkSSALIEvdziJiXoqKvK1667rq6VjTl09XqDGns6A
         iL9CBw3p9vI3Y4NoG0JI7zfUNB3kkSVrc1lTZ8NtYS+Gu29q9py7VxhiMx1+wYQvXAiB
         KFpw==
X-Gm-Message-State: AOAM530o2e+AMM1M4UKLCYXdx24rWBt60UAy2MCjJ+nxQdot8iNk4ABl
        4yYGuHDEZovgj7zIyF8TrLxQJto3FscA3gEv+AFYhMQ6MpJi3XdV+XvroDrLEfkxYEdeYQcwmHc
        BJI0mkHW/iOsusDee2bOT
X-Received: by 2002:a05:6000:88:: with SMTP id m8mr3263940wrx.280.1601072539143;
        Fri, 25 Sep 2020 15:22:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyvAHL41aNceFHbsD7XNzOAM/bk8mimliUOQBhi9Xd2hh2XUKWNFEB2f/J487a4htihv6V+w==
X-Received: by 2002:a05:6000:88:: with SMTP id m8mr3263922wrx.280.1601072538929;
        Fri, 25 Sep 2020 15:22:18 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:ec9b:111a:97e3:4baf? ([2001:b07:6468:f312:ec9b:111a:97e3:4baf])
        by smtp.gmail.com with ESMTPSA id c25sm405221wml.31.2020.09.25.15.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2020 15:22:18 -0700 (PDT)
Subject: Re: [PATCH v8 5/8] KVM: x86: SVM: Prevent MSR passthrough when MSR
 access is denied
To:     Alexander Graf <graf@amazon.com>, kvm list <kvm@vger.kernel.org>
Cc:     Aaron Lewis <aaronlewis@google.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        KarimAllah Raslan <karahmed@amazon.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200925143422.21718-1-graf@amazon.com>
 <20200925143422.21718-6-graf@amazon.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f471cac2-89fd-2d61-04fa-2edf6ec438e5@redhat.com>
Date:   Sat, 26 Sep 2020 00:22:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200925143422.21718-6-graf@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 25/09/20 16:34, Alexander Graf wrote:
> We will introduce the concept of MSRs that may not be handled in kernel
> space soon. Some MSRs are directly passed through to the guest, effectively
> making them handled by KVM from user space's point of view.
> 
> This patch introduces all logic required to ensure that MSRs that
> user space wants trapped are not marked as direct access for guests.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> 
> ---
> 
> v7 -> v8:
> 
>   - s/KVM_MSR_ALLOW/KVM_MSR_FILTER/g
> ---

Ok, just some cosmetic fixes on top:

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index bb9f438e9e62..692110f2ac6f 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -553,7 +553,7 @@ static int svm_cpu_init(int cpu)
 
 }
 
-static int direct_access_msr_idx(u32 msr)
+static int direct_access_msr_slot(u32 msr)
 {
 	u32 i;
 
@@ -561,33 +561,33 @@ static int direct_access_msr_idx(u32 msr)
 		if (direct_access_msrs[i].index == msr)
 			return i;
 
-	return -EINVAL;
+	return -ENOENT;
 }
 
 static void set_shadow_msr_intercept(struct kvm_vcpu *vcpu, u32 msr, int read,
 				     int write)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
-	int idx = direct_access_msr_idx(msr);
+	int slot = direct_access_msr_slot(msr);
 
-	if (idx == -EINVAL)
+	if (slot == -ENOENT)
 		return;
 
 	/* Set the shadow bitmaps to the desired intercept states */
 	if (read)
-		set_bit(idx, svm->shadow_msr_intercept.read);
+		set_bit(slot, svm->shadow_msr_intercept.read);
 	else
-		clear_bit(idx, svm->shadow_msr_intercept.read);
+		clear_bit(slot, svm->shadow_msr_intercept.read);
 
 	if (write)
-		set_bit(idx, svm->shadow_msr_intercept.write);
+		set_bit(slot, svm->shadow_msr_intercept.write);
 	else
-		clear_bit(idx, svm->shadow_msr_intercept.write);
+		clear_bit(slot, svm->shadow_msr_intercept.write);
 }
 
 static bool valid_msr_intercept(u32 index)
 {
-	return direct_access_msr_idx(index) != -EINVAL;
+	return direct_access_msr_slot(index) != -ENOENT;
 }
 
 static bool msr_write_intercepted(struct kvm_vcpu *vcpu, u32 msr)
@@ -609,7 +609,7 @@ static bool msr_write_intercepted(struct kvm_vcpu *vcpu, u32 msr)
 	return !!test_bit(bit_write,  &tmp);
 }
 
-static void set_msr_interception_nosync(struct kvm_vcpu *vcpu, u32 *msrpm,
+static void set_msr_interception_bitmap(struct kvm_vcpu *vcpu, u32 *msrpm,
 					u32 msr, int read, int write)
 {
 	u8 bit_read, bit_write;
@@ -646,7 +646,7 @@ static void set_msr_interception(struct kvm_vcpu *vcpu, u32 *msrpm, u32 msr,
 				 int read, int write)
 {
 	set_shadow_msr_intercept(vcpu, msr, read, write);
-	set_msr_interception_nosync(vcpu, msrpm, msr, read, write);
+	set_msr_interception_bitmap(vcpu, msrpm, msr, read, write);
 }
 
 static u32 *svm_vcpu_alloc_msrpm(void)
@@ -694,7 +694,7 @@ static void svm_msr_filter_changed(struct kvm_vcpu *vcpu)
 		u32 read = test_bit(i, svm->shadow_msr_intercept.read);
 		u32 write = test_bit(i, svm->shadow_msr_intercept.write);
 
-		set_msr_interception_nosync(vcpu, svm->msrpm, msr, read, write);
+		set_msr_interception_bitmap(vcpu, svm->msrpm, msr, read, write);
 	}
 }
 

