Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E3BFD7E22E
	for <lwn-linux-doc@archive.lwn.net>; Tue,  3 Apr 2018 11:30:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932069AbeDCLa5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 3 Apr 2018 07:30:57 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:59690 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932066AbeDCLa4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 3 Apr 2018 07:30:56 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DC3C1435;
        Tue,  3 Apr 2018 04:30:56 -0700 (PDT)
Received: from [10.1.206.75] (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C59C63F587;
        Tue,  3 Apr 2018 04:30:44 -0700 (PDT)
Subject: Re: [PATCH v3 2/6] Disable instrumentation for some code
To:     Abbott Liu <liuwenliang@huawei.com>, aryabinin@virtuozzo.com,
        dvyukov@google.com, corbet@lwn.net, linux@armlinux.org.uk,
        christoffer.dall@linaro.org, kstewart@linuxfoundation.org,
        gregkh@linuxfoundation.org, f.fainelli@gmail.com,
        akpm@linux-foundation.org, linux@rasmusvillemoes.dk,
        mawilcox@microsoft.com, pombredanne@nexb.com,
        ard.biesheuvel@linaro.org, vladimir.murzin@arm.com,
        alexander.levin@verizon.com, nicolas.pitre@linaro.org,
        tglx@linutronix.de, thgarnie@google.com, dhowells@redhat.com,
        keescook@chromium.org, arnd@arndb.de, geert@linux-m68k.org,
        tixy@linaro.org, julien.thierry@arm.com, mark.rutland@arm.com,
        james.morse@arm.com, zhichao.huang@linaro.org,
        jinb.park7@gmail.com, labbott@redhat.com, philip@cog.systems,
        grygorii.strashko@linaro.org, catalin.marinas@arm.com,
        opendmb@gmail.com, kirill.shutemov@linux.intel.com,
        kasan-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, linux-mm@kvack.org
References: <20180402120440.31900-1-liuwenliang@huawei.com>
 <20180402120440.31900-3-liuwenliang@huawei.com>
From:   Marc Zyngier <marc.zyngier@arm.com>
Organization: ARM Ltd
Message-ID: <7837103a-bcf0-6b00-14d6-bd6b80649886@arm.com>
Date:   Tue, 3 Apr 2018 12:30:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180402120440.31900-3-liuwenliang@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 02/04/18 13:04, Abbott Liu wrote:
> From: Andrey Ryabinin <a.ryabinin@samsung.com>
> 
> Disable instrumentation for arch/arm/boot/compressed/*
> ,arch/arm/kvm/hyp/* and arch/arm/vdso/* because those
> code won't linkd with kernel image.
> 
> Disable kasan check in the function unwind_pop_register
> because it doesn't matter that kasan checks failed when
> unwind_pop_register read stack memory of task.
> 
> Reviewed-by: Russell King - ARM Linux <linux@armlinux.org.uk>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> Reviewed-by: Marc Zyngier <marc.zyngier@arm.com>

Just because I replied to this patch doesn't mean you can stick my
Reviewed-by tag on it. Please drop this tag until I explicitly say that
you can add it (see Documentation/process/submitting-patches.rst,
section 11).

Same goes for patch 1.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
