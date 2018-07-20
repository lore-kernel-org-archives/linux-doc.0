Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1FFB47D072
	for <lwn-linux-doc@archive.lwn.net>; Fri, 20 Jul 2018 01:11:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730266AbeGTB5E (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Jul 2018 21:57:04 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:46232 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730213AbeGTB5E (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jul 2018 21:57:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=NBvq7SzBiZzStO4V5pSGJhw2z+H+qRnZP+ec1ZZsef0=; b=TtLZpNkHi2RptDfOf7pZzZX6e
        S8A2mn4pQRdMHTbgsxEuIjmSwjuCARpD5dK9BEBOQyooXswXKtPqbd+wBgd1Y0WygTRZKuCJaXuw0
        5SLx48wohZTMhqi9OhxlkskLDsJCEkWA4xLtrJBSoutnehGyi8+rSczfYufD5d9Lnor3lPHqud3VY
        NVCnR1X48OTc/54pr7CU2vcpICzBSJoWDiNaZM9JBa96L19TBlpRIpk4/6un8tmzq0JxC+0MePGvO
        H5AjfqE0+WivvkmZqh5FJB5enzx/hdJd3YLgejofeFQeaVsv6KrxqkgHQuwrZqH6mtbGuBraaKYKp
        UxLWWe4KA==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fgJwv-0006xf-1L; Fri, 20 Jul 2018 01:11:13 +0000
Subject: Re: [PATCH 1/3] [RFC V3] KVM: X86: Memory ROE documentation
To:     Ahmed Abd El Mawgood <ahmedsoliman0x666@gmail.com>,
        kvm@vger.kernel.org,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        virtualization@lists.linux-foundation.org,
        linux-doc@vger.kernel.org, x86@kernel.org
Cc:     Paolo Bonzini <pbonzini@redhat.com>, rkrcmar@redhat.com,
        nathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, hpa@zytor.com,
        Kees Cook <keescook@chromium.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        David Hildenbrand <david@redhat.com>,
        Boris Lukashev <blukashev@sempervictus.com>,
        David Vrabel <david.vrabel@nutanix.com>, nigel.edwards@hpe.com,
        Rik van Riel <riel@surriel.com>
References: <20180719213802.17161-1-ahmedsoliman0x666@gmail.com>
 <20180719213802.17161-2-ahmedsoliman0x666@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7c7f7ad7-d8ee-cf12-9ec6-1a1d20b2e653@infradead.org>
Date:   Thu, 19 Jul 2018 18:11:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180719213802.17161-2-ahmedsoliman0x666@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 07/19/2018 02:38 PM, Ahmed Abd El Mawgood wrote:

>  Documentation/virtual/kvm/hypercalls.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/virtual/kvm/hypercalls.txt b/Documentation/virtual/kvm/hypercalls.txt
> index a890529c63ed..a9db68adb7c9 100644
> --- a/Documentation/virtual/kvm/hypercalls.txt
> +++ b/Documentation/virtual/kvm/hypercalls.txt
> @@ -121,3 +121,17 @@ compute the CLOCK_REALTIME for its clock, at the same instant.
>  
>  Returns KVM_EOPNOTSUPP if the host does not use TSC clocksource,
>  or if clock type is different than KVM_CLOCK_PAIRING_WALLCLOCK.
> +
> +7. KVM_HC_HMROE
> +----------------
> +Architecture: x86
> +Status: active
> +Purpose: Hypercall used to apply Read-Only Enforcement to guest pages
> +Usage:
> +     a0: start address of page that should be protected.

Is this done one page per call?  No grouping, no multiple pages?

> +
> +This hypercall lets a guest kernel to have part of its read/write memory

                  lets a guest kernel have part of

> +converted into read-only.  This action is irreversible. KVM_HC_HMROE can
> +not be triggered from guest Ring 3 (user mode). The reason is that user
> +mode malicious software can make use of it enforce read only protection on

                               make use of it to enforce

> +an arbitrary memory page thus crashing the kernel.
> 


-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
