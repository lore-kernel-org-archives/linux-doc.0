Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5AF6C7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 29 May 2019 02:38:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbfE2Ci5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 28 May 2019 22:38:57 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39241 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbfE2Ci4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 May 2019 22:38:56 -0400
Received: by mail-wm1-f65.google.com with SMTP id z23so424990wma.4
        for <linux-doc@vger.kernel.org>; Tue, 28 May 2019 19:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pP3fYcLgKNcn4ZGi02aByM6WGyk5AzcIbGUQ+cLa/MU=;
        b=EqKZ05bfdkgYFfL6ZrLQvitygoCYKgurpVgM+DDrOYEyGCW+U8v4n0jSdHoeal95H+
         MDTjublVe0vqZv8fJpqj9Nw57nOzj1bqFa9JFZ3UBrpC2/xMExhx6yx23cNFuZcUwj4N
         V1jD/mowTFQ5fiRckZzvLmBl7IaWnrfEp7/YLmhY6Hj750+VJLJusiyB1R5t5dVocjbz
         HOBW3YgqmBkeckhIffy5W9ZbnZwJBTASd5uLPu7IXsVSCV1gLdBDqJJbHsleoYyy2leD
         4B0zrSh9/iZ6RXMCt5GgJ2651dy9+qVit1Cv5lY1/VYFxyamhgMOYBWns5Q4GJ6XnoIg
         Eu7g==
X-Gm-Message-State: APjAAAUz/LZPFzcpS2NQx4DJKRoiJltOFhhPMEYVoIlIb8HlX0W9t6Qq
        1IikkeKkLxU58EEZ8hmfSor6KA==
X-Google-Smtp-Source: APXvYqwWFZgfUA/y6b7pztK6v2VYoXi6rFrIYAUoQFJJ01BZd4wPg7v9e3QmiJigMbe2sIgRafm9ew==
X-Received: by 2002:a05:600c:214d:: with SMTP id v13mr4998628wml.12.1559097534873;
        Tue, 28 May 2019 19:38:54 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c43e:46a8:e962:cee8? ([2001:b07:6468:f312:c43e:46a8:e962:cee8])
        by smtp.gmail.com with ESMTPSA id q9sm3063089wmq.9.2019.05.28.19.38.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 19:38:54 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] KVM: x86: add support for user wait instructions
To:     Tao Xu <tao3.xu@intel.com>
Cc:     rkrcmar@redhat.com, corbet@lwn.net, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        sean.j.christopherson@intel.com, x86@kernel.org,
        kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, jingqi.liu@intel.com
References: <20190524075637.29496-1-tao3.xu@intel.com>
 <20190524075637.29496-2-tao3.xu@intel.com>
 <419f62f3-69a8-7ec0-5eeb-20bed69925f2@redhat.com>
 <c1b27714-2eb8-055e-f26c-e17787d83bb6@intel.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b5daf72d-d764-baa4-8e7f-b09dff417786@redhat.com>
Date:   Wed, 29 May 2019 04:38:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c1b27714-2eb8-055e-f26c-e17787d83bb6@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 29/05/19 04:05, Tao Xu wrote:
>>
> 
> Thank you Paolo, but I have another question. I was wondering if it is
> appropriate to enable X86_FEATURE_WAITPKG when QEMU uses "-overcommit
> cpu-pm=on"?

"-overcommit" only establishes the behavior of KVM, it doesn't change
the cpuid bits.  So you'd need "-cpu" as well.

Paolo

> Or just enable X86_FEATURE_WAITPKG when QEMU add the feature
> "-cpu host,+waitpkg"? User wait instructions is the wait or pause
> instructions may be executed at any privilege level, but can use
> IA32_UMWAIT_CONTROL to set the maximum time.

