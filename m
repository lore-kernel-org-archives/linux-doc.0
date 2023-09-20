Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC94AC04ABF
	for <linux-doc@archiver.kernel.org>; Wed, 20 Sep 2023 17:55:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbjITRzt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Sep 2023 13:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjITRzs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Sep 2023 13:55:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FAC3E0
        for <linux-doc@vger.kernel.org>; Wed, 20 Sep 2023 10:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695232501;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=h5xYFinNZipHsHGmHUqZFR1epFlz8wPv/8ryGu1Ybe8=;
        b=TYJLDv6jg6GgH4kdWHKS5hnj7UionZwEPANf9q6gEpOyvV4MWnk8atFM2x7Btwm8LnzQkW
        qrcBPhmz9eg3nn8WwLZuacSghfD+n6FBLATsF1a6Yz5sPe290azQ+VpMy5eWixuh8qNZky
        SvEOj+98ZgWvvf2jG3onHX1MwpNiEZA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-2AoT5a6bNGyuHUYBsyTaFw-1; Wed, 20 Sep 2023 13:55:00 -0400
X-MC-Unique: 2AoT5a6bNGyuHUYBsyTaFw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4011fa32e99so741415e9.0
        for <linux-doc@vger.kernel.org>; Wed, 20 Sep 2023 10:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695232498; x=1695837298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h5xYFinNZipHsHGmHUqZFR1epFlz8wPv/8ryGu1Ybe8=;
        b=WlIjieBpH2kBfpi4MpnvvAKzFCL3+mV7F2z658sQ0QtH9L04Lmjgcf7suXMGblbN6F
         g4gwmdPiNuM62oAgsNGviO2fopajMsCMbWFi/lmDTO00osAM1zd3AGXhzjriAFpL6usH
         iLr/MXRpDyY/vyRC/mFV/Qbl3/YCvxKeZGTYxQIrGkGvVA1PpvVqQ4hdF+L7fLHMHTPl
         9LpDBlgi30IdL7VM72TU96PTAWdADVVaD+mU380zFUy2XlWc5SPtaooeVSZzM3PZfycm
         Fea+fXbWCRm698IOWZNpMfOR5E1nBaazJHEJj2k1iQyPiACMbj5JH16OYk+FLmPHkSDH
         48uw==
X-Gm-Message-State: AOJu0YwKLSFdjHm+Xn97JfjMkzy4f/eUb0ZnInDZ+SBLJkw9JKB+ckET
        gVK8SJKGG5HViCWYWZprtuhcfik1BH38aLWSS5DJR1LvuJSGfiTW4qYkR3Ir03lxtx5EzQMlUM2
        LTtNMX09UhHP2i6Duk4yr
X-Received: by 2002:a7b:ce88:0:b0:400:57d1:4910 with SMTP id q8-20020a7bce88000000b0040057d14910mr3302447wmj.17.1695232497861;
        Wed, 20 Sep 2023 10:54:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnadv5Rrllbv+1DebvWmStjUdr36msQ4bItIjpfqmG73HPxauN1Zj4NCrq5iVMGFuoky2thA==
X-Received: by 2002:a7b:ce88:0:b0:400:57d1:4910 with SMTP id q8-20020a7bce88000000b0040057d14910mr3302418wmj.17.1695232497523;
        Wed, 20 Sep 2023 10:54:57 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id g7-20020a05600c310700b003fe15ac0934sm1501378wmo.1.2023.09.20.10.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 10:54:54 -0700 (PDT)
Message-ID: <facdf62c-d0b4-597d-a85d-5772ecaa2b86@redhat.com>
Date:   Wed, 20 Sep 2023 19:54:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v10 33/38] x86/entry: Add fred_entry_from_kvm() for VMX to
 handle IRQ/NMI
To:     Xin Li <xin3.li@intel.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
        xen-devel@lists.xenproject.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        luto@kernel.org, seanjc@google.com, peterz@infradead.org,
        jgross@suse.com, ravi.v.shankar@intel.com, mhiramat@kernel.org,
        andrew.cooper3@citrix.com, jiangshanlai@gmail.com
References: <20230914044805.301390-1-xin3.li@intel.com>
 <20230914044805.301390-34-xin3.li@intel.com>
Content-Language: en-US
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230914044805.301390-34-xin3.li@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/14/23 06:48, Xin Li wrote:
> +	/*
> +	 * Don't check the FRED stack level, the call stack leading to this
> +	 * helper is effectively constant and shallow (relatively speaking).

It's more that we don't need to protect from reentrancy.  The external 
interrupt uses stack level 0 so no adjustment would be needed anyway, 
and NMI does not use an IST even in the non-FRED case.

> +	 * Emulate the FRED-defined redzone and stack alignment.
> +	 */
> +	sub $(FRED_CONFIG_REDZONE_AMOUNT << 6), %rsp
> +	and $FRED_STACK_FRAME_RSP_MASK, %rsp

