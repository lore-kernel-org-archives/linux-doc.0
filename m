Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1D7677DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 20:51:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752081AbeDJUvL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 16:51:11 -0400
Received: from mail-pl0-f67.google.com ([209.85.160.67]:43124 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752182AbeDJUvI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Apr 2018 16:51:08 -0400
Received: by mail-pl0-f67.google.com with SMTP id a39-v6so8273676pla.10
        for <linux-doc@vger.kernel.org>; Tue, 10 Apr 2018 13:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=Sed7um0rmHquEAV53xWqBhkctB/Wrt0fD/Jq1OEq74o=;
        b=Zp2qNpnnRTrnTxBo008KrlIx5aAknT95FGfC/VlG1KEvuBfau6Pbxu7LUgUvZJkSeU
         CYkG2YYPB9HXRyNhcShyTuvE2ReDiNFbCs5+nD9gInrC89R+KUNZR4O1eoSmlv2M+DvU
         DDsSv9FvlKZ/k813I0Y/lFY8osZbS28XhVTnjZ2JC41/XHa12TsJaUuMhH+IxhsfqDMj
         5LhvgLmsZZKpANnXT8tNIeush9yIrsTWPCTb9zRdD6zsTXj7rxH6y7Gy+fcXrp4SzfdM
         YyvsHPzlvIfqOhPnC8dli5THIaP+MODtc0lyfpMSlqpug882mi8cJ47RhSzMU7SlfokY
         06ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=Sed7um0rmHquEAV53xWqBhkctB/Wrt0fD/Jq1OEq74o=;
        b=YUrOd/jtTBi3A5JV6wrKmhPrydcCkgFH7pq6T/90FHyRAGVszqeZIrvff/9h8PtPxs
         io4t9fJV3DIpQAgZdDkw0M7ZFKZXBkw8a9Iv3THQjdFw4SCSVNs+o2q+yeKA/fcG+Bp7
         +3fKbgJ0LRLSRhZOCNboOTm76I/PH4BsUw/4ZjIFmhZNjTPX7iR0xVauEY8Bd8i2dDOQ
         onvv+p1ROE+KWXFYPgT4ooapYe6Gt+c/+40c65FWS0b2z44ZxAI0RYs1vE94Efv5seco
         IUX6mxqTDd8nHoBd3skoAYf1D9rj9Ad0tx0QMNUyVaItVpJ5hFsLXQeNMJYv1ROHDckw
         n1Xg==
X-Gm-Message-State: ALQs6tCErZ2EW497kXKYrvIGG7+RkJiDte8BsIG4bR50hu2E2DABLv6Y
        cNj3jNEAvvtwx1rslFDqJdXZPA==
X-Google-Smtp-Source: AIpwx4/iwgnn4u82HROdSeAtl8BSMvi/+VfjvgX++ohpYmSZ4dI6Aw476wpnHl+aSccguSeidCcbVQ==
X-Received: by 2002:a17:902:8490:: with SMTP id c16-v6mr2018901plo.132.1523393468374;
        Tue, 10 Apr 2018 13:51:08 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598] ([2620:15c:17:3:3a5:23a7:5e32:4598])
        by smtp.gmail.com with ESMTPSA id 67sm9075155pfp.122.2018.04.10.13.51.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Apr 2018 13:51:07 -0700 (PDT)
Date:   Tue, 10 Apr 2018 13:51:06 -0700 (PDT)
From:   David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To:     Laurent Dufour <ldufour@linux.vnet.ibm.com>
cc:     Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
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
Subject: Re: [PATCH v2 1/2] mm: introduce ARCH_HAS_PTE_SPECIAL
In-Reply-To: <a732ef2b-445f-9ad8-014b-247c8c5d500b@linux.vnet.ibm.com>
Message-ID: <alpine.DEB.2.21.1804101350250.79494@chino.kir.corp.google.com>
References: <1523373951-10981-1-git-send-email-ldufour@linux.vnet.ibm.com> <1523373951-10981-2-git-send-email-ldufour@linux.vnet.ibm.com> <20180410160932.GB3614@bombadil.infradead.org> <a732ef2b-445f-9ad8-014b-247c8c5d500b@linux.vnet.ibm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 10 Apr 2018, Laurent Dufour wrote:

> > On Tue, Apr 10, 2018 at 05:25:50PM +0200, Laurent Dufour wrote:
> >>  arch/powerpc/include/asm/pte-common.h                  | 3 ---
> >>  arch/riscv/Kconfig                                     | 1 +
> >>  arch/s390/Kconfig                                      | 1 +
> > 
> > You forgot to delete __HAVE_ARCH_PTE_SPECIAL from
> > arch/riscv/include/asm/pgtable-bits.h
> 
> Damned !
> Thanks for catching it.
> 

Squashing the two patches together at least allowed it to be caught 
easily.  After it's fixed, feel free to add

	Acked-by: David Rientjes <rientjes@google.com>

Thanks for doing this!
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
