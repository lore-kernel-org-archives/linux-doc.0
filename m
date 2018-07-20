Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D8E777D072
	for <lwn-linux-doc@archive.lwn.net>; Fri, 20 Jul 2018 01:08:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730304AbeGTBx6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Jul 2018 21:53:58 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:46090 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727615AbeGTBx6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jul 2018 21:53:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ikjzEA/Awl4AWR7zIUQTwRxM50ZjQDBLCLojESLY5dE=; b=HrP7uP5M5SFxrYVxpZjzd/NDS
        t0mT3qUTzvAm6RAKC2ZdLbnW/uW9gbhOcJbapMdciK63b6P3tYXLdMJuS19UXyBftXHp4FkX14exs
        inWJiCA7Kmu38167ZBVQJHfBcQPZl0NEsTKpFyryRpG+Hg52CtuMlByKA77ZYsS3fw7hVcm5pBOmT
        qSH3tUxlEnPYbSWr0/TenLhnIIFbX5FG1dCd5eiS0uPgKBZfprss5AVNLB1Br00z/oKbEWoabQ15l
        F/hy/MkxF8eSycBKKnyFW5RrooeGzB/6RQqOKWo/cwZoqD3Q2GjlxrW8GRQbGPj8UZ5anDplEdzF3
        hlWV022rg==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fgJtp-0005YD-T2; Fri, 20 Jul 2018 01:08:01 +0000
Subject: Re: [PATCH 3/3] [RFC V3] KVM: X86: Adding skeleton for Memory ROE
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
 <20180719213802.17161-4-ahmedsoliman0x666@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <26f2e29b-c016-7140-4fea-853fbbd01459@infradead.org>
Date:   Thu, 19 Jul 2018 18:07:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180719213802.17161-4-ahmedsoliman0x666@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 07/19/2018 02:38 PM, Ahmed Abd El Mawgood wrote:
> This patch introduces a hypercall implemented for X86 that can assist
> against subset of kernel rootkits, it works by place readonly protection in
> shadow PTE. The end result protection is also kept in a bitmap for each
> kvm_memory_slot and is used as reference when updating SPTEs. The whole
> goal is to protect the guest kernel static data from modification if
> attacker is running from guest ring 0, for this reason there is no
> hypercall to revert effect of Memory ROE hypercall. This patch doesn't
> implement integrity check on guest TLB so obvious attack on the current
> implementation will involve guest virtual address -> guest physical
> address remapping, but there are plans to fix that.
> 
> Signed-off-by: Ahmed Abd El Mawgood <ahmedsoliman0x666@gmail.com>
> ---

> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index 92fd433c50b9..8ae822a8dc7a 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -96,6 +96,13 @@ config KVM_MMU_AUDIT
>  	 This option adds a R/W kVM module parameter 'mmu_audit', which allows
>  	 auditing of KVM MMU events at runtime.
>  
> +config KVM_MROE
> +	bool "Hypercall Memory Read-Only Enforcement"
> +	depends on KVM && X86
> +	help
> +	This option add KVM_HC_HMROE hypercall to kvm which as hardening

	            adds                       to kvm as a hardening   (???)


> +	mechanism to protect memory pages from being edited.
> +
>  # OK, it's a little counter-intuitive to do this, but it puts it neatly under
>  # the virtualization menu.
>  source drivers/vhost/Kconfig


-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
