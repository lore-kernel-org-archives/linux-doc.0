Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2A6667E22E
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Apr 2018 20:09:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754803AbeDIUIl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Apr 2018 16:08:41 -0400
Received: from mail-pf0-f169.google.com ([209.85.192.169]:44990 "EHLO
        mail-pf0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754785AbeDIUIe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Apr 2018 16:08:34 -0400
Received: by mail-pf0-f169.google.com with SMTP id p15so6324819pff.11
        for <linux-doc@vger.kernel.org>; Mon, 09 Apr 2018 13:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=16e+8vIE3whCUMkXSytiGxrnjPE0fW7K8oHkXevLIH8=;
        b=fYPFQbAJVj3UcSwt2LJXldmS+nkCWKocbCLO8E9QEwLTYiEnCqR7NzCDPh6yDlJQqQ
         nm5AcETPHVA2a8KAOTDEOkDWdW0csAUBt7sY1Xuq95lXkUTlZURfVxs+WViWiddRrdkr
         EN78v81lq0EZ4lJUiP4hH6ISjNYS4mFKIigjXRMXLmutaqYHmv/pX/JcZQjdQHNuShSy
         SDWiSgEB8nl14nBGM09gAZ1Tb0uMP/sUKyO2wG3fqz6YoAeRJLH0ZRjkUqYXY6oIKFm/
         VFGjKx55k8QPkpncBjCzAYoE6YX56x37n5IhDZIj2brtBO3OmkwEruRmGRe+cEj8Ey1F
         gwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=16e+8vIE3whCUMkXSytiGxrnjPE0fW7K8oHkXevLIH8=;
        b=q9cDeFDpvnb9nHgVJWsgAaiqBfF2Ggab9XtTPBCNTAGAbhSAou9M5rKVFMsbRZO+BP
         yTKfNTwIIPpECaQjZjvCJAjxXFqhOuNpzNxXcdh3icFRpqCEopzSOjE8cYusMsAAHw3t
         j1RgsO0aZBAat9J0fOJWHKIB+9JDjmrBcfxKOqlOL+IeRjta31K5l8RTrinrynnpYJCh
         X4UEy+nERXAJhVQbQyxZZp2ALn81lziP+7WanOfekjAhkreLftg21Isc3QDVgNiF7ysM
         4lHEnx5pwmHAY39+flt9RaJfMre+CpWSu8UBMwWhWdXkQC5iKoyR97ZEjWAR9Hj1Jl4c
         2A5g==
X-Gm-Message-State: AElRT7HoErdoxkOuJp4nYctxe3ZdBfwNLa2Rx7lhxANuqFdqpPZ6XfcA
        U/I1bqWx+y3L13+koS+uQujb+A==
X-Google-Smtp-Source: AIpwx4/Uwschzs0zc5ElY5OXA1n0SdXgRPAuuz4sakKjG6pG8MNb8WrQdU5q2wt0Jvx3LUuvFlegdQ==
X-Received: by 10.101.89.65 with SMTP id g1mr26117472pgu.185.1523304513384;
        Mon, 09 Apr 2018 13:08:33 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598] ([2620:15c:17:3:3a5:23a7:5e32:4598])
        by smtp.gmail.com with ESMTPSA id x137sm1931612pfd.162.2018.04.09.13.08.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Apr 2018 13:08:32 -0700 (PDT)
Date:   Mon, 9 Apr 2018 13:08:31 -0700 (PDT)
From:   David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To:     Christoph Hellwig <hch@infradead.org>
cc:     Laurent Dufour <ldufour@linux.vnet.ibm.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
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
In-Reply-To: <20180409175757.GA12938@infradead.org>
Message-ID: <alpine.DEB.2.21.1804091307480.56406@chino.kir.corp.google.com>
References: <1523282229-20731-1-git-send-email-ldufour@linux.vnet.ibm.com> <1523282229-20731-3-git-send-email-ldufour@linux.vnet.ibm.com> <20180409175757.GA12938@infradead.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 9 Apr 2018, Christoph Hellwig wrote:

> > -#ifdef __HAVE_ARCH_PTE_SPECIAL
> > +#ifdef CONFIG_ARCH_HAS_PTE_SPECIAL
> >  # define HAVE_PTE_SPECIAL 1
> >  #else
> >  # define HAVE_PTE_SPECIAL 0
> 
> I'd say kill this odd indirection and just use the
> CONFIG_ARCH_HAS_PTE_SPECIAL symbol directly.
> 
> 

Agree, and I think it would be easier to audit/review if patches 1 and 3 
were folded together to see the relationship between the newly added 
selects and what #define's it is replacing.  Otherwise, looks good!
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
