Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A2E9C7D2EF
	for <lwn-linux-doc@archive.lwn.net>; Wed, 29 May 2019 01:24:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725856AbfE2BYS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 28 May 2019 21:24:18 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37735 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbfE2BYS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 May 2019 21:24:18 -0400
Received: by mail-wm1-f65.google.com with SMTP id 7so371238wmo.2
        for <linux-doc@vger.kernel.org>; Tue, 28 May 2019 18:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UiPLvWA/ifZmBgOu5RY7iG79Uns1KHbXQ9v+2ITYDvE=;
        b=scGb8NwuCJfzTUA/oz736/CawgNAjaXHilKNn0pO3yOnZy3fRH+sjrPpEZt49vkkf0
         GsghmPHU5e8xBpTR1bMgSKJ5Kn8RC/UBzaH+I5lb9+o+xi0NJKK4NblnWH7Z8NOUIrIq
         LRgNDNlTHwunMYFmrgZLMf1lBE5BusO3mY5+b86XTHzjbe+WfUqi1/IrQ4Tu93wvn3RJ
         9Y2+GrRIuWHUWP/uqfBa7/ID8+P/iddQ5/M7RpuL7Gx+bd3HGlCHb3FBzJVvXTiJQMhp
         CCyxBAO2kwr0mLkabhnANzLIXdVSGA6Nx+3IqIyNTmpDA3Q9pcnVoKHG0eD938t2dSuy
         Iw1g==
X-Gm-Message-State: APjAAAVYc5J4pkMeIUQm9Mw8mu5JxkpO7zXap7Qkn24WEReZYsdlo2SY
        iItKLFQbUspRJMmM3qnPlyGUpA==
X-Google-Smtp-Source: APXvYqyXLAZxyqIf9pbTP7YEBWBAjL4jFU3SBYm8nLl1/MmAXqgwazyQevT5XTPPFzfWUQKFyN+3qw==
X-Received: by 2002:a1c:23c4:: with SMTP id j187mr4908475wmj.176.1559093055974;
        Tue, 28 May 2019 18:24:15 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
        by smtp.gmail.com with ESMTPSA id f2sm7111992wrq.48.2019.05.28.18.24.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 18:24:15 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] KVM: x86: add support for user wait instructions
To:     Tao Xu <tao3.xu@intel.com>, rkrcmar@redhat.com, corbet@lwn.net,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        sean.j.christopherson@intel.com
Cc:     x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, jingqi.liu@intel.com
References: <20190524075637.29496-1-tao3.xu@intel.com>
 <20190524075637.29496-2-tao3.xu@intel.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <419f62f3-69a8-7ec0-5eeb-20bed69925f2@redhat.com>
Date:   Wed, 29 May 2019 03:24:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190524075637.29496-2-tao3.xu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 24/05/19 09:56, Tao Xu wrote:
> +7.19 KVM_CAP_ENABLE_USR_WAIT_PAUSE
> +
> +Architectures: x86
> +Parameters: args[0] whether feature should be enabled or not
> +
> +With this capability enabled, a VM can use UMONITOR, UMWAIT and TPAUSE
> +instructions. If the instruction causes a delay, the amount of
> +time delayed is called here the physical delay. The physical delay is
> +first computed by determining the virtual delay (the time to delay
> +relative to the VM’s timestamp counter). Otherwise, UMONITOR, UMWAIT
> +and TPAUSE cause an invalid-opcode exception(#UD).
> +

There is no need to make it a capability.  You can just check the guest
CPUID and see if it includes X86_FEATURE_WAITPKG.

Paolo
