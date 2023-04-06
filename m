Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B1E5C7618D
	for <linux-doc@archiver.kernel.org>; Thu,  6 Apr 2023 03:18:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233867AbjDFDSH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 5 Apr 2023 23:18:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234103AbjDFDSG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Apr 2023 23:18:06 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 943A7273D
        for <linux-doc@vger.kernel.org>; Wed,  5 Apr 2023 20:18:04 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id n15-20020a170902f60f00b001a273a4a685so13627032plg.15
        for <linux-doc@vger.kernel.org>; Wed, 05 Apr 2023 20:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680751084;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IFz6bhca4X52vxR4H0gzEaozA12JNFxMy4GBixSJw5Y=;
        b=LSyyrFI55Cmo9ES+J7fKmJstGf62iWHV4ZB3z7GaTRBDJpXJty4F4APwu6nijG7V8q
         Q8zmxWi7tW1h7iK3ylfXF53yrgyNmv3vVJ3jf4wS1i1I4pT4N3UveDZuBRbzjOIwHnwc
         POTrHIVSagyFvHk3NqEBZdaH+Ma+o9nO9TmMdKHmHxnfgYXuDk1Ez3wkPmG6atVlM38U
         a+knMlbLa2xzSxFjIgIE0xbyFRhujt/pfiIjbmQL8SN6jYSW3L2wMddlflOzLZXD8y4m
         5zNu9wat98WhI+QNvaJaqlzIG2/ODQso2kbU0EREXWS51QVbzUB8L/FEbK2E9EMqcfWu
         ay/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680751084;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IFz6bhca4X52vxR4H0gzEaozA12JNFxMy4GBixSJw5Y=;
        b=AIN4fuJnNIdrLFwRhKrr91dBJU1mTvc0dXrDKu0Otl9wTUryxnYFtqW9EzZZoPsLGF
         zvx6CgvMK7njBHwUgh30zP6IbxkYaPiuUnhKBbjnWoe/+aWZjdWBb0fURP43oqNTVO2n
         fF2CoWO65SK8gap8BNG/tOugqzoaO8QFRt9b+onnOoWaeIxoXZoQ3fp1/zNcCoa9S/Uo
         BB+xFUrZHWeaSRdycPM2yxln0dipQsVd0ym+lTQ5dnFHRV4Oyvim/wfA5OxMx8WvfH82
         DUS1rQLEcdYJtl7tadQRUpcYRRJGgtIXsx8RgHunGho2UCDyVE9dMMZX9wsevy9KdoVP
         1u+A==
X-Gm-Message-State: AAQBX9cIqYhw65jhduTx6srhR8Fzwk1aDpjPY6mXoW/kWqGKVqwJ0CRE
        IzyK/cMo4B7W66zCMaBRpETemokjz5g=
X-Google-Smtp-Source: AKy350bG+R6GfeksBy+22jmNYbxlWNs7/ookGEHfF4PQnjPTMXNcLD6QXhV/GXsUJ2gG5XZMyBzn3DxZ4QY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:13a9:b0:62d:9bea:2a0c with SMTP id
 t41-20020a056a0013a900b0062d9bea2a0cmr4701093pfg.4.1680751084039; Wed, 05 Apr
 2023 20:18:04 -0700 (PDT)
Date:   Wed, 5 Apr 2023 20:18:02 -0700
In-Reply-To: <9227068821b275ac547eb2ede09ec65d2281fe07.1680179693.git.houwenlong.hwl@antgroup.com>
Mime-Version: 1.0
References: <9227068821b275ac547eb2ede09ec65d2281fe07.1680179693.git.houwenlong.hwl@antgroup.com>
Message-ID: <ZC456ooLZl4UCa2t@google.com>
Subject: Re: [PATCH 1/3] KVM: x86: Disallow enable KVM_CAP_X86_DISABLE_EXITS
 capability after vCPUs have been created
From:   Sean Christopherson <seanjc@google.com>
To:     Hou Wenlong <houwenlong.hwl@antgroup.com>
Cc:     kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 30, 2023, Hou Wenlong wrote:
> Disable PAUSE/MWAIT/HLT exits after vCPUs have been created is useless,
> because PAUSE/MWAIT/HLT intercepts configuration is not changed after
> vCPU created.  And two vCPUs may have inconsistent configuration if
> disable PAUSE/MWAIT/HLT exits between those two vCPUs creation. Since
> it's a per-VM capability, all vCPUs should keep same configuration, so
> disallow enable KVM_CAP_X86_DISABLE_EXITS capability after vCPUs have
> been created.
> 
> Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
> ---
>  Documentation/virt/kvm/api.rst | 3 ++-
>  arch/x86/kvm/x86.c             | 5 +++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index a69e91088d76..95a683a27cf2 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -7179,7 +7179,8 @@ branch to guests' 0x200 interrupt vector.
>  
>  :Architectures: x86
>  :Parameters: args[0] defines which exits are disabled
> -:Returns: 0 on success, -EINVAL when args[0] contains invalid exits
> +:Returns: 0 on success, -EINVAL when args[0] contains invalid exits or
> +	  any vCPUs have been created.
>  
>  Valid bits in args[0] are::
>  
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 2c0ff40e5345..7e97595465fc 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -6275,6 +6275,9 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>  		if (cap->args[0] & ~KVM_X86_DISABLE_VALID_EXITS)
>  			break;
>  
> +		mutex_lock(&kvm->lock);
> +		if (kvm->created_vcpus)
> +			goto disable_exits_unlock;
>  		if (cap->args[0] & KVM_X86_DISABLE_EXITS_PAUSE)
>  			kvm->arch.pause_in_guest = true;
>  
> @@ -6296,6 +6299,8 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>  		}
>  
>  		r = 0;
> +disable_exits_unlock:

Hah!  I thought this looked familiar[*] :-)  

[*] https://lkml.kernel.org/r/DM6PR12MB35000D46146BA68EE294953BCACB9%40DM6PR12MB3500.namprd12.prod.outlook.com
