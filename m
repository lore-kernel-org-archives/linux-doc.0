Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9BB6C7E88A
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Apr 2018 17:58:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752351AbeDIR6E (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Apr 2018 13:58:04 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:53888 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751549AbeDIR6C (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Apr 2018 13:58:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=r8GXw0cIBSyo7BZwF5ybNn7hxjRyHphScSOG9ajDcdg=; b=MdzITv3K7Y+X24b4O5iT88N1F
        sP6hNOjL1/hOsoCu5V7TQX2iJbjo8z96NVVd3Vpysc/UPLzsmP3fJkuPnZpLEjUZY+Ip7PzlVCuZO
        2CZa+oqm4wsdIzDRPWlBeq5I/16o3jboqAXW3bpH8esP9DCauTdzGE2Hm3A+Z6nQT73blYJOEzgZ8
        Bdaagfp3snfKWCAcxjBQetY5ACSB6ue+5LF5CZuwtsaYFzSRyCP+FITp67MWsTfE80ObUn1JEPx0g
        4sPd6C32HtIVmb9AGlts2HQr57trhBJhzpjSkY0AzMkqIo15lzoSWbqzCyaExjCUnl/Z9Xx1WQp4g
        D7e0OY6hw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1f5b3F-0005yi-Q3; Mon, 09 Apr 2018 17:57:57 +0000
Date:   Mon, 9 Apr 2018 10:57:57 -0700
From:   Christoph Hellwig <hch@infradead.org>
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
        Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: [PATCH 2/3] mm: replace __HAVE_ARCH_PTE_SPECIAL
Message-ID: <20180409175757.GA12938@infradead.org>
References: <1523282229-20731-1-git-send-email-ldufour@linux.vnet.ibm.com>
 <1523282229-20731-3-git-send-email-ldufour@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1523282229-20731-3-git-send-email-ldufour@linux.vnet.ibm.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> -#ifdef __HAVE_ARCH_PTE_SPECIAL
> +#ifdef CONFIG_ARCH_HAS_PTE_SPECIAL
>  # define HAVE_PTE_SPECIAL 1
>  #else
>  # define HAVE_PTE_SPECIAL 0

I'd say kill this odd indirection and just use the
CONFIG_ARCH_HAS_PTE_SPECIAL symbol directly.

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
