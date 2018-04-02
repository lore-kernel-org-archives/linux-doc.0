Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 543867DE78
	for <lwn-linux-doc@archive.lwn.net>; Mon,  2 Apr 2018 18:16:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753279AbeDBSQN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Apr 2018 14:16:13 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:46042 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753030AbeDBSQL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Apr 2018 14:16:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2014; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=jYfSrkpv8FOUzemlQoG3h7Mxq7My+IRLeJola3h8FBw=; b=rPxSnY+D9vvGlu/UDQsdl8jnw
        JOrjCRHpUYwY64HR+fnh746MzeTafNuPMyO2rrHgTkK5RhqxUDTRHsqOjoAaSWWKxCHOR5GmjN9Dk
        +1LxUByvXSxHe274xYB2r3nm6UlEI6InPsOrNBbQckEIBTLNSCv49x4WxPOEYahgEc4JQ=;
Received: from n2100.armlinux.org.uk ([fd8f:7570:feb6:1:214:fdff:fe10:4f86]:55661)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1f33za-0005lE-6j; Mon, 02 Apr 2018 19:15:42 +0100
Received: from linux by n2100.armlinux.org.uk with local (Exim 4.90_1)
        (envelope-from <linux@n2100.armlinux.org.uk>)
        id 1f33zW-0001RK-Q3; Mon, 02 Apr 2018 19:15:39 +0100
Date:   Mon, 2 Apr 2018 19:15:37 +0100
From:   Russell King - ARM Linux <linux@armlinux.org.uk>
To:     Nicolas Pitre <nicolas.pitre@linaro.org>
Cc:     Abbott Liu <liuwenliang@huawei.com>, kstewart@linuxfoundation.org,
        tixy@linaro.org, grygorii.strashko@linaro.org,
        julien.thierry@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
        linux@rasmusvillemoes.dk, dhowells@redhat.com, linux-mm@kvack.org,
        mark.rutland@arm.com, kvmarm@lists.cs.columbia.edu,
        f.fainelli@gmail.com, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, kasan-dev@googlegroups.com,
        geert@linux-m68k.org, linux-arm-kernel@lists.infradead.org,
        zhichao.huang@linaro.org, aryabinin@virtuozzo.com,
        labbott@redhat.com, vladimir.murzin@arm.com, keescook@chromium.org,
        Arnd Bergmann <arnd@arndb.de>, marc.zyngier@arm.com,
        philip@cog.systems, jinb.park7@gmail.com, opendmb@gmail.com,
        tglx@linutronix.de, dvyukov@google.com, ard.biesheuvel@linaro.org,
        gregkh@linuxfoundation.org, mawilcox@microsoft.com,
        linux-kernel@vger.kernel.org, alexander.levin@verizon.com,
        james.morse@arm.com, kirill.shutemov@linux.intel.com,
        pombredanne@nexb.com, Andrew Morton <akpm@linux-foundation.org>,
        thgarnie@google.com, christoffer.dall@linaro.org
Subject: Re: [PATCH v3 5/6] Initialize the mapping of KASan shadow memory
Message-ID: <20180402181536.GJ16141@n2100.armlinux.org.uk>
References: <20180402120440.31900-1-liuwenliang@huawei.com>
 <20180402120440.31900-6-liuwenliang@huawei.com>
 <nycvar.YSQ.7.76.1804021402521.28462@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YSQ.7.76.1804021402521.28462@knanqh.ubzr>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 02, 2018 at 02:08:13PM -0400, Nicolas Pitre wrote:
> On Mon, 2 Apr 2018, Abbott Liu wrote:
> 
> > index c79b829..20161e2 100644
> > --- a/arch/arm/kernel/head-common.S
> > +++ b/arch/arm/kernel/head-common.S
> > @@ -115,6 +115,9 @@ __mmap_switched:
> >  	str	r8, [r2]			@ Save atags pointer
> >  	cmp	r3, #0
> >  	strne	r10, [r3]			@ Save control register values
> > +#ifdef CONFIG_KASAN
> > +	bl	kasan_early_init
> > +#endif
> >  	mov	lr, #0
> >  	b	start_kernel
> >  ENDPROC(__mmap_switched)
> 
> Would be better if lr was cleared before calling kasan_early_init.

No.  The code is correct - please remember that "bl" writes to LR.

The point of clearing LR here is to ensure that start_kernel is called
with a zero link register, which it won't be if kasan_early_init is
moved after it.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
