Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9263E7DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 16:10:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751942AbeDJQJj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 12:09:39 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:42542 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751546AbeDJQJh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Apr 2018 12:09:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=gi0iTIur+fMVIACY0Vj4O0+oFYiHIKknhi33G6AaWzo=; b=sHxzPirWKHrU3+rqLYH5pYnuB
        sWZCeIFA9Z/7nteX/rB2gsuHcdtgeattAuv9/iyQDyfsVkg+5WyUBYDkf52qE9c6AvfJVuT9bgTdf
        FThC5Ocl94CEOI6HObjGPJGvaC0qCA/x6sDjHk37Pi4CMDHKpLgR0xeZafAqXhnTSdSkmHAGggfM/
        3G3a1XNVDAcGo82IICPiRQ0bc+ZGNoh/UsUkjiqzz6gUM3kA7svr1yjnb+PLL6TEZudngB5aLZJiG
        o3mxsjc/edSq4LyJuPLvQtxpZIKG0Y2DJXoPzdX/ryH8eAYR1BgXZ5KFVXxozrFgR3KT8+/i7UQTG
        zXR0ofO9w==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1f5vps-0008Sf-O1; Tue, 10 Apr 2018 16:09:32 +0000
Date:   Tue, 10 Apr 2018 09:09:32 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Laurent Dufour <ldufour@linux.vnet.ibm.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        Jerome Glisse <jglisse@redhat.com>, mhocko@kernel.org,
        aneesh.kumar@linux.vnet.ibm.com, akpm@linux-foundation.org,
        mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S . Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Palmer Dabbelt <palmer@sifive.com>,
        Albert Ou <albert@sifive.com>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        David Rientjes <rientjes@google.com>
Subject: Re: [PATCH v2 1/2] mm: introduce ARCH_HAS_PTE_SPECIAL
Message-ID: <20180410160932.GB3614@bombadil.infradead.org>
References: <1523373951-10981-1-git-send-email-ldufour@linux.vnet.ibm.com>
 <1523373951-10981-2-git-send-email-ldufour@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1523373951-10981-2-git-send-email-ldufour@linux.vnet.ibm.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 10, 2018 at 05:25:50PM +0200, Laurent Dufour wrote:
>  arch/powerpc/include/asm/pte-common.h                  | 3 ---
>  arch/riscv/Kconfig                                     | 1 +
>  arch/s390/Kconfig                                      | 1 +

You forgot to delete __HAVE_ARCH_PTE_SPECIAL from
arch/riscv/include/asm/pgtable-bits.h
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
