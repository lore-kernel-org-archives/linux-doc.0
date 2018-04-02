Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4A8897DE78
	for <lwn-linux-doc@archive.lwn.net>; Mon,  2 Apr 2018 18:20:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753231AbeDBSUT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Apr 2018 14:20:19 -0400
Received: from mail-qt0-f195.google.com ([209.85.216.195]:36164 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753080AbeDBSUS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Apr 2018 14:20:18 -0400
Received: by mail-qt0-f195.google.com with SMTP id w23so8349871qtn.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Apr 2018 11:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=PXnl9t3unwaczbJ7SBchb7sQfQIY9LA3+ZKbrnDz1iU=;
        b=EHVdI8LgVA3PeKq1mC7iWMzQvEBQTpPDRKgWewBCcSBA/+CGtyuOZyb6AXgInlrGdI
         c2ACqv5P7MnCW0TukkDUalrrfcB9V4W2a6wS4HeMqhFe+V3g727QOtAfWJjk31wPPU+t
         IC7/7FxEqEZY9KBlRR9g5Q0rIbOeO0btLWHfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=PXnl9t3unwaczbJ7SBchb7sQfQIY9LA3+ZKbrnDz1iU=;
        b=Ztg3rJerTet8nf1lTgtHxTMdB2ChdlUSLCSA2M2DjTCKgBi3EM6hj2B/LBRcLD9D0Q
         9u7l6wcCHJ7lauUWWOPcL2llm74QTj/uTPgtl5saCjfr46NeLWS9f40dW5h2+52NKoD5
         u3uyfst5jwpaYLNAccih8P11779GnkVsn9pS+aPCXqX4SAcK+/xJT5fjm/ekwnxIPDuW
         7PFfJA0DKM9UqSBHROw6ts69lqy+LUpb10BU+yeXtpH9JeV2s0WaUWhmKdzmriQjaBiH
         GY7G3b0mRE25HneefYnLiAEPk7hMF/+LuSfbOfUBxJCz7qaNt+Iz0kuWBrRXgGVI+jnV
         4TfA==
X-Gm-Message-State: ALQs6tC/sAQZVJp92kasgQjE4t8MAsrldnZz4Hb5zE/z86Eie8MywW7O
        Ie4+7BCSAVq8vKUx1pBoZiPziw==
X-Google-Smtp-Source: AIpwx49WEhHo6w8rYiPIiTDgAT18DqlCDp8wI//Zr+IJ5boxupxA8RQduvO3BG0T9BrmPU669QVC9g==
X-Received: by 10.200.112.203 with SMTP id g11mr15810687qtp.147.1522693217687;
        Mon, 02 Apr 2018 11:20:17 -0700 (PDT)
Received: from xanadu.home (modemcable228.104-82-70.mc.videotron.ca. [70.82.104.228])
        by smtp.gmail.com with ESMTPSA id j23sm697912qtn.65.2018.04.02.11.20.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Apr 2018 11:20:17 -0700 (PDT)
Date:   Mon, 2 Apr 2018 14:20:15 -0400 (EDT)
From:   Nicolas Pitre <nicolas.pitre@linaro.org>
To:     Russell King - ARM Linux <linux@armlinux.org.uk>
cc:     Abbott Liu <liuwenliang@huawei.com>, kstewart@linuxfoundation.org,
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
In-Reply-To: <20180402181536.GJ16141@n2100.armlinux.org.uk>
Message-ID: <nycvar.YSQ.7.76.1804021418220.28462@knanqh.ubzr>
References: <20180402120440.31900-1-liuwenliang@huawei.com> <20180402120440.31900-6-liuwenliang@huawei.com> <nycvar.YSQ.7.76.1804021402521.28462@knanqh.ubzr> <20180402181536.GJ16141@n2100.armlinux.org.uk>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 2 Apr 2018, Russell King - ARM Linux wrote:

> On Mon, Apr 02, 2018 at 02:08:13PM -0400, Nicolas Pitre wrote:
> > On Mon, 2 Apr 2018, Abbott Liu wrote:
> > 
> > > index c79b829..20161e2 100644
> > > --- a/arch/arm/kernel/head-common.S
> > > +++ b/arch/arm/kernel/head-common.S
> > > @@ -115,6 +115,9 @@ __mmap_switched:
> > >  	str	r8, [r2]			@ Save atags pointer
> > >  	cmp	r3, #0
> > >  	strne	r10, [r3]			@ Save control register values
> > > +#ifdef CONFIG_KASAN
> > > +	bl	kasan_early_init
> > > +#endif
> > >  	mov	lr, #0
> > >  	b	start_kernel
> > >  ENDPROC(__mmap_switched)
> > 
> > Would be better if lr was cleared before calling kasan_early_init.
> 
> No.  The code is correct - please remember that "bl" writes to LR.

You're right of course.

/me giving up on patch review and going back to bed


Nicolas
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
