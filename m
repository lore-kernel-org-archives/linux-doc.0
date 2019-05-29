Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 53F557D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 29 May 2019 02:39:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbfE2CjU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 28 May 2019 22:39:20 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46533 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbfE2CjU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 May 2019 22:39:20 -0400
Received: by mail-wr1-f66.google.com with SMTP id r7so476386wrr.13
        for <linux-doc@vger.kernel.org>; Tue, 28 May 2019 19:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J4A3gO+D/kJ9f9+OkLDAhUkGDHlG2SK2HVzo3LKjuY8=;
        b=YNQrvIECPySQjRNKJ8YoJ3+lfIB8bzw23lw3UZIlq2tJyKlxCRU25FHWznXREiovYh
         fvpSs5XqM1leaGhgBk5Rtj0eeiqXHy03s0cqXrhx2QmxQFahmY1dewF5hCdDAmMUETE3
         ln38HQ1P04m03LYdbi0VasN+l2AcrsKc/UXrfB1KDn8Wpcg+wreEWefNeycB3yGrmF+2
         K18C/VC3FevGUOeOrVS4bzF9Y03ji1iJfNr49DDfurv8cod4u6Sjv12Tdv6QZeHdelKC
         N8gy/TWJbN/qBts7N75eVlH9+sMzcR9t5RR2+oj9NnLyFu1zrHbA7hy0XkR8ljEdgpVq
         ublw==
X-Gm-Message-State: APjAAAUcAD3y8SNLqhWo6sm5GZ6VNwMtoM+0238DVcf/HTsHlqRbYWUD
        tsJl8ljgDkNkrCQe5vfDeQN5ng==
X-Google-Smtp-Source: APXvYqzcaWw1y2lzWAprl6ksFktYxqsCbC7tmClfC61V9z0F8n3ONRJt9HwggzpIk7fsVSYydplyhQ==
X-Received: by 2002:a5d:474c:: with SMTP id o12mr1623117wrs.23.1559097557977;
        Tue, 28 May 2019 19:39:17 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c43e:46a8:e962:cee8? ([2001:b07:6468:f312:c43e:46a8:e962:cee8])
        by smtp.gmail.com with ESMTPSA id l190sm6075879wml.25.2019.05.28.19.39.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 19:39:17 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] KVM: vmx: handle vm-exit for UMWAIT and TPAUSE
To:     Tao Xu <tao3.xu@intel.com>
Cc:     rkrcmar@redhat.com, corbet@lwn.net, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        sean.j.christopherson@intel.com, x86@kernel.org,
        kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, jingqi.liu@intel.com
References: <20190524075637.29496-1-tao3.xu@intel.com>
 <20190524075637.29496-4-tao3.xu@intel.com>
 <b0958339-b23c-dd9d-8673-aae098769738@redhat.com>
 <a2b463ee-c032-555e-b012-184e4f4753f1@intel.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f74f9223-cc6d-1f14-33a8-668aac415063@redhat.com>
Date:   Wed, 29 May 2019 04:39:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a2b463ee-c032-555e-b012-184e4f4753f1@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 29/05/19 04:25, Tao Xu wrote:
>>
> OK, but should we just drop this patch?
> Or add the VMX_EXIT_REASONS bits of UMWAIT and TPAUSE and handle like
> XSAVES/XRSTORS:
> "kvm_skip_emulated_instruction(vcpu);"
> "WARN(1, "this should never happen\n");"

Yes, this sounds good to me.

Paolo
