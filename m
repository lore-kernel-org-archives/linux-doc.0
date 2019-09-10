Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DF1127D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Sep 2019 17:14:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730225AbfIJROO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Sep 2019 13:14:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37656 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731510AbfIJROL (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 10 Sep 2019 13:14:11 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 81454C053B34
        for <linux-doc@vger.kernel.org>; Tue, 10 Sep 2019 17:14:10 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id a125so130200wmh.6
        for <linux-doc@vger.kernel.org>; Tue, 10 Sep 2019 10:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BCqrYLSI1x2vXUSlIGEoq1ChjiQwc4Zws90ZJqi8ccI=;
        b=DRnsURlkwErKSZ4uzvLL+xRNTDi7SsYJZXq6Bc8fh/zGMqt5bqoYCGbQ+wVzgZFsKZ
         C7vbPjUfUrt+u1J0MtkR1gI7/naASiihqR9ZrXl459LLrcLR3ImQFpv5e99mJlcmf0SQ
         YE0eCfP2HawujPWg/ezIm24lXXEa21SkiruXL/ppWC2GVxPS0t5boB/QcHZ5pVdrQy8O
         rjGtobOelz3vtbbxScHOAgSV4k0VtK/unNsb2GFu4f5csc9blOtaHrR44zeXQzBrR1tV
         UIASTBluwWRXDDlCHbxP3rMzgZBtUuSjKMnXSWYjJwsMg0wZQA+YrEp1+livgcwxGcXU
         Mp3w==
X-Gm-Message-State: APjAAAWHBGl7veg5DxdYXrwYLy6UMP5FK+4UfBYNg3Gt5yiCc0/jgooG
        3Byc//qxF1ENg6SoE6EGaNEMHwT8bpV4o8wuMM9hXYPXWb5LieQYkFjQtUbwm7yJvAUmoXbuY0o
        PVpW42jQM6o6qITCDfaAS
X-Received: by 2002:adf:ec49:: with SMTP id w9mr21262644wrn.130.1568135649156;
        Tue, 10 Sep 2019 10:14:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwxuHBW8Sghnoq2IMRwlRuvA2mK/kxks8RiqabkQT0RFMAX/1ZPWVVqWjntSC5HdNc7inQLdg==
X-Received: by 2002:adf:ec49:: with SMTP id w9mr21262621wrn.130.1568135648872;
        Tue, 10 Sep 2019 10:14:08 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:1435:25df:c911:3338? ([2001:b07:6468:f312:1435:25df:c911:3338])
        by smtp.gmail.com with ESMTPSA id l1sm21635551wrb.1.2019.09.10.10.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2019 10:14:08 -0700 (PDT)
Subject: Re: [PATCH v3] doc: kvm: Fix return description of KVM_SET_MSRS
To:     Xiaoyao Li <xiaoyao.li@intel.com>,
        =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190905005737.131067-1-xiaoyao.li@intel.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <0f4d8b77-2c42-f5b5-1cba-9cc26c5fd935@redhat.com>
Date:   Tue, 10 Sep 2019 19:14:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905005737.131067-1-xiaoyao.li@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/09/19 02:57, Xiaoyao Li wrote:
> Userspace can use ioctl KVM_SET_MSRS to update a set of MSRs of guest.
> This ioctl set specified MSRs one by one. If it fails to set an MSR,
> e.g., due to setting reserved bits, the MSR is not supported/emulated by
> KVM, etc..., it stops processing the MSR list and returns the number of
> MSRs have been set successfully.
> 
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>

Queued, thanks.

Paolo

> ---
> v3:
>   refine the description based on Sean's comment.  
> 
> v2:
>   elaborate the changelog and description of ioctl KVM_SET_MSRS based on
>   Sean's comments.
> ---
>  Documentation/virt/kvm/api.txt | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/virt/kvm/api.txt b/Documentation/virt/kvm/api.txt
> index 2d067767b617..24541e52e96e 100644
> --- a/Documentation/virt/kvm/api.txt
> +++ b/Documentation/virt/kvm/api.txt
> @@ -586,7 +586,7 @@ Capability: basic
>  Architectures: x86
>  Type: vcpu ioctl
>  Parameters: struct kvm_msrs (in)
> -Returns: 0 on success, -1 on error
> +Returns: number of msrs successfully set (see below), -1 on error
>  
>  Writes model-specific registers to the vcpu.  See KVM_GET_MSRS for the
>  data structures.
> @@ -595,6 +595,11 @@ Application code should set the 'nmsrs' member (which indicates the
>  size of the entries array), and the 'index' and 'data' members of each
>  array entry.
>  
> +It tries to set the MSRs in array entries[] one by one. If setting an MSR
> +fails, e.g., due to setting reserved bits, the MSR isn't supported/emulated
> +by KVM, etc..., it stops processing the MSR list and returns the number of
> +MSRs that have been set successfully.
> +
>  
>  4.20 KVM_SET_CPUID
>  
> 

