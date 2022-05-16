Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B4DC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 16 May 2022 10:49:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242157AbiEPKt1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 May 2022 06:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240544AbiEPKt0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 May 2022 06:49:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 756C8275D3
        for <linux-doc@vger.kernel.org>; Mon, 16 May 2022 03:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652698164;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dF8ol8RqSgN1uVydLkEkOe/lSAk2b58yhc5X/QD6YNk=;
        b=P9xwGkfvZfJ5g6iCpZ+56XFi5++kra5Guei1/lr+wvriHPT575AugQbhijbV288aBgreGk
        hjEjuQgYBBqgBMO/Gajb39VRfRz+iy+l7CKp87tKDamsTdtFnwd2axN22ufEpSzbjPqf8G
        B0Fk3B5nWLd40n88Q0awNwAzK4/Y2vg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-Q2Jk5qFRPCiwzSg8PE6gog-1; Mon, 16 May 2022 06:49:23 -0400
X-MC-Unique: Q2Jk5qFRPCiwzSg8PE6gog-1
Received: by mail-wm1-f69.google.com with SMTP id v126-20020a1cac84000000b00396fe5959d2so2061953wme.8
        for <linux-doc@vger.kernel.org>; Mon, 16 May 2022 03:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dF8ol8RqSgN1uVydLkEkOe/lSAk2b58yhc5X/QD6YNk=;
        b=ibsm+paF5q0BzXGMSJ4lH5nRGH3N/2ilb0yMWg5WILExzUk1L/poSnPt880FJCwjAA
         d3PAqKX7vcvyDPy1FW08qH3+/LtW9VU4w917md0eBUq0J3zsw73kxtzV76uOl21fKjNL
         lmpyCPeEmvYmNoYNhXqGO4NBwrK+9wpvRc1eE4w15rZ4uKFPmiegsyCe5IQsFH5ft/As
         S+qgBnaxcK8NhW9g5unq81xkqAidMvwh+O6jfoWeNy/H+NyCoy9lJmb8tIJgnj1Pm8vb
         MFzoRh4wKekZlXYCq2Icw12JsYlyihgctrn/TQKDbRD8jdvl5vs1MSWbAz+AvvkWfFp5
         F0oQ==
X-Gm-Message-State: AOAM530mKHvis8UW3+h+gjmVjTDAxyoGZPYdkUujyKyIWycX9iepoqtN
        SrjKIQmuG3StyAi7m3yCN79yX3vh8jOCKaIfrToiXfA087hbg0GvnFWbKjwOl8ktZSctJX3H5tT
        wcXR9IDrQzPV1ORi9ejo5
X-Received: by 2002:a05:600c:354a:b0:394:8fa4:73bc with SMTP id i10-20020a05600c354a00b003948fa473bcmr26681014wmq.37.1652698162123;
        Mon, 16 May 2022 03:49:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKYhMbUOraZh9NG5nsuei6O6zPQnqkIRtO+I3S8ethr4MqOt5HH7CDzDs68WVWWGcgd3ZJ3A==
X-Received: by 2002:a05:600c:354a:b0:394:8fa4:73bc with SMTP id i10-20020a05600c354a00b003948fa473bcmr26680989wmq.37.1652698161931;
        Mon, 16 May 2022 03:49:21 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-178-142.web.vodafone.de. [109.43.178.142])
        by smtp.gmail.com with ESMTPSA id r7-20020adfab47000000b0020d0a57af5esm2122093wrc.79.2022.05.16.03.49.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 May 2022 03:49:21 -0700 (PDT)
Message-ID: <68a5e0c8-2dd9-a8a2-0333-fef95b2e2dfc@redhat.com>
Date:   Mon, 16 May 2022 12:49:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v7 14/22] KVM: s390: mechanism to enable guest zPCI
 Interpretation
Content-Language: en-US
To:     Matthew Rosato <mjrosato@linux.ibm.com>, linux-s390@vger.kernel.org
Cc:     alex.williamson@redhat.com, cohuck@redhat.com,
        schnelle@linux.ibm.com, farman@linux.ibm.com, pmorel@linux.ibm.com,
        borntraeger@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
        gerald.schaefer@linux.ibm.com, agordeev@linux.ibm.com,
        svens@linux.ibm.com, frankja@linux.ibm.com, david@redhat.com,
        imbrenda@linux.ibm.com, vneethv@linux.ibm.com,
        oberpar@linux.ibm.com, freude@linux.ibm.com, pasic@linux.ibm.com,
        pbonzini@redhat.com, corbet@lwn.net, jgg@nvidia.com,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20220513191509.272897-1-mjrosato@linux.ibm.com>
 <20220513191509.272897-15-mjrosato@linux.ibm.com>
From:   Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220513191509.272897-15-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 13/05/2022 21.15, Matthew Rosato wrote:
> The guest must have access to certain facilities in order to allow
> interpretive execution of zPCI instructions and adapter event
> notifications.  However, there are some cases where a guest might
> disable interpretation -- provide a mechanism via which we can defer
> enabling the associated zPCI interpretation facilities until the guest
> indicates it wishes to use them.
> 
> Reviewed-by: Christian Borntraeger <borntraeger@linux.ibm.com>
> Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   arch/s390/include/asm/kvm_host.h |  4 ++++
>   arch/s390/kvm/kvm-s390.c         | 38 ++++++++++++++++++++++++++++++++
>   arch/s390/kvm/kvm-s390.h         | 10 +++++++++
>   3 files changed, 52 insertions(+)
> 
> diff --git a/arch/s390/include/asm/kvm_host.h b/arch/s390/include/asm/kvm_host.h
> index c1518a505060..8e381603b6a7 100644
> --- a/arch/s390/include/asm/kvm_host.h
> +++ b/arch/s390/include/asm/kvm_host.h
> @@ -254,7 +254,10 @@ struct kvm_s390_sie_block {
>   #define ECB2_IEP	0x20
>   #define ECB2_PFMFI	0x08
>   #define ECB2_ESCA	0x04
> +#define ECB2_ZPCI_LSI	0x02
>   	__u8    ecb2;                   /* 0x0062 */
> +#define ECB3_AISI	0x20
> +#define ECB3_AISII	0x10
>   #define ECB3_DEA 0x08
>   #define ECB3_AES 0x04
>   #define ECB3_RI  0x01
> @@ -940,6 +943,7 @@ struct kvm_arch{
>   	int use_cmma;
>   	int use_pfmfi;
>   	int use_skf;
> +	int use_zpci_interp;
>   	int user_cpu_state_ctrl;
>   	int user_sigp;
>   	int user_stsi;
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 5a0fbfd19c4a..0797661732cc 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -1031,6 +1031,42 @@ static int kvm_s390_vm_set_crypto(struct kvm *kvm, struct kvm_device_attr *attr)
>   	return 0;
>   }
>   
> +static void kvm_s390_vcpu_pci_setup(struct kvm_vcpu *vcpu)
> +{
> +	/* Only set the ECB bits after guest requests zPCI interpretation */
> +	if (!vcpu->kvm->arch.use_zpci_interp)
> +		return;
> +
> +	vcpu->arch.sie_block->ecb2 |= ECB2_ZPCI_LSI;
> +	vcpu->arch.sie_block->ecb3 |= ECB3_AISII + ECB3_AISI;
> +}
> +
> +void kvm_s390_vcpu_pci_enable_interp(struct kvm *kvm)
> +{
> +	struct kvm_vcpu *vcpu;
> +	unsigned long i;
> +
> +	lockdep_assert_held(&kvm->lock);
> +
> +	/*
> +	 * If host is configured for PCI and the necessary facilities are
> +	 * available, turn on interpretation for the life of this guest
> +	 */

I'd suggest to move the comment after the if-statement - it seems to fit 
better there.

> +	if (!kvm_s390_pci_interp_allowed())
> +		return;
> +
> +	kvm->arch.use_zpci_interp = 1;
> +
> +	kvm_s390_vcpu_block_all(kvm);
> +
> +	kvm_for_each_vcpu(i, vcpu, kvm) {
> +		kvm_s390_vcpu_pci_setup(vcpu);
> +		kvm_s390_sync_request(KVM_REQ_VSIE_RESTART, vcpu);
> +	}
> +
> +	kvm_s390_vcpu_unblock_all(kvm);
> +}

  Thomas

