Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECEC1C433F5
	for <linux-doc@archiver.kernel.org>; Wed,  5 Jan 2022 13:07:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236843AbiAENHL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 5 Jan 2022 08:07:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41991 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236842AbiAENHI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Jan 2022 08:07:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641388028;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qPbUxj6ghyTrgwhNP+U3qhJU5iyb67zbb1namC5tcQQ=;
        b=Bm78CxRD6cWEkGMifynjkcFIfrLvWNdvdqEHT779fBcM3DnlvT21oS8+woXyviuu+aWRxf
        nvopAKNFSzyC+mlkDXjeD8CXDT/Tdbi9R34mzKQjfX4f00ngJkMTcAhK0MkWwYlvek2GL6
        KzLOJVgtNSqNvkSKZxqZJP6cwbeGQUk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-v5sUAQE3OZa9mxqBk2vMbw-1; Wed, 05 Jan 2022 08:06:51 -0500
X-MC-Unique: v5sUAQE3OZa9mxqBk2vMbw-1
Received: by mail-ed1-f71.google.com with SMTP id r8-20020a05640251c800b003f9a52daa3fso5095008edd.22
        for <linux-doc@vger.kernel.org>; Wed, 05 Jan 2022 05:06:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qPbUxj6ghyTrgwhNP+U3qhJU5iyb67zbb1namC5tcQQ=;
        b=x/RItCY1Y6oOBNGOoGKH8YJJW7DTw118ezXUcq0wmysitUmyYnU3oVJOoEgAUwSS/o
         QJVQsEVu5VlpuzgdYlrTdTDIYj81caidgRiQt/bMT+5BsZtMWXxIdQyTSz8+SkPM3gZF
         899hH2BJb6Z/7nrfBx/WOv09C+kMBIr5Qy8iGRgkJA8BzJsh2dzl8JHt22geaCFLa1ty
         hxJzR+0qa2B9NPngU7gHIeekOsjeYz/qhFFKTHwDCflFDHDHX4/nrN6ss2MxRiycqH0E
         xIvNcCAqkgr/+4Y1R3fhMTEHMUglJ7Dy+MaqWgPiyK1JfMuyeV4BTdg+YkH7CThrZzj+
         kIsw==
X-Gm-Message-State: AOAM533CTJMEy7/RXnW9W+rEgfzo16uOkfoR1BeMDXVFtkpM7WEOkAZn
        s65OvaM/5/TBWAFq4wsh906hYliizNcG1oayZ+pqak6qxa6oKdg01CFp+TQAKC4R3cRKHS+pc9n
        +Zv6Yi/hdFCrKeEoc0Ybs
X-Received: by 2002:a17:907:7f9e:: with SMTP id qk30mr40517150ejc.313.1641388010181;
        Wed, 05 Jan 2022 05:06:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2kvcaNQ8zr5/pOMq5wIiwszyeeQoUKvE+rInBlWiKyo00Mr1ysjR1/zCjvH1iUYUbX+TRaQ==
X-Received: by 2002:a17:907:7f9e:: with SMTP id qk30mr40517123ejc.313.1641388009929;
        Wed, 05 Jan 2022 05:06:49 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.googlemail.com with ESMTPSA id o12sm15956818edz.71.2022.01.05.05.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jan 2022 05:06:49 -0800 (PST)
Message-ID: <c99d0b82-a44f-db8e-3f81-93d2394f9a02@redhat.com>
Date:   Wed, 5 Jan 2022 14:06:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 07/21] x86/fpu: Provide fpu_enable_guest_xfd_features()
 for KVM
Content-Language: en-US
To:     Yang Zhong <yang.zhong@intel.com>, x86@kernel.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, corbet@lwn.net, shuah@kernel.org,
        seanjc@google.com
Cc:     jun.nakajima@intel.com, kevin.tian@intel.com,
        jing2.liu@linux.intel.com, jing2.liu@intel.com,
        guang.zeng@intel.com, wei.w.wang@intel.com
References: <20220105123532.12586-1-yang.zhong@intel.com>
 <20220105123532.12586-8-yang.zhong@intel.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220105123532.12586-8-yang.zhong@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 1/5/22 13:35, Yang Zhong wrote:
> +int fpu_enable_guest_xfd_features(struct fpu_guest *guest_fpu, u64 xfeatures)
> +{
> +	lockdep_assert_preemption_enabled();
> +

The old fpu_update_guest_perm_features(guest_fpu) is equivalent to

	fpu_enable_guest_xfd_features(guest_fpu, guest_fpu->perm);

Missing doc comment:

/*
  * fpu_enable_guest_xfd_features - Enable xfeatures according to guest perm
  * @guest_fpu:         Pointer to the guest FPU container
  * @xfeatures:         Features requested by guest CPUID
  *
  * Enable all dynamic xfeatures according to guest perm and requested CPUID.
  * Invoked if the caller wants to conservatively expand fpstate buffer instead
  * of waiting until XCR0 or XFD MSR is written.
  *
  * Return: 0 on success, error code otherwise
  */

Also, the check for 32-bit is slightly imprecise:

	/* Dynamic xfeatures are not supported with 32-bit kernels. */
	if (!IS_ENABLED(CONFIG_X86_64))
-		return 0;
+		return -EINVAL;

since we only get here with xfeatures != 0 (if it compiles, just removing
the IS_ENABLED check altogether would be even better).  With these changes,

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks,

Paolo

