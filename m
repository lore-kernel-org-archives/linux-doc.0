Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3A7F67E22E
	for <lwn-linux-doc@archive.lwn.net>; Thu, 12 Apr 2018 20:46:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753054AbeDLUql (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 12 Apr 2018 16:46:41 -0400
Received: from mail-pl0-f68.google.com ([209.85.160.68]:40790 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752952AbeDLUqi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Apr 2018 16:46:38 -0400
Received: by mail-pl0-f68.google.com with SMTP id x4-v6so4702840pln.7
        for <linux-doc@vger.kernel.org>; Thu, 12 Apr 2018 13:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=vxDBwAEgMU0b0Jp4jn8eGiRjfH3XtsL57Kzo9jHFf0k=;
        b=HGGonfQca49NQENPUtXZ1r4xyWfWPJ/7zdV6OjpmT0Lcg4eVw+6mdwTa/P8SYjAZDy
         VXdrT6K5Oa8VwwGxjR/93hpRp13oB3zMchU7nvuj9xFiIGxor44GMEo+URB62UCHaeSn
         NwyeqnQRM/4erH0soXhB37QjZ2QaTmFuabH/p99HXesfTFa2GGtM8YNKPAsQaQtxx670
         9eP5CI01b0MEK03pgie9cgO1yiX21Tj8h91DktZAJPKLFOGbS/gwmTP6rywo9IC+gAj/
         C+Uu8vDWheYlWHGCwYGkqCCAjNGHTyEcgt0dHkNDaXBi2/h5nx7BiMdRjNXm4LhZZ5ER
         DJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=vxDBwAEgMU0b0Jp4jn8eGiRjfH3XtsL57Kzo9jHFf0k=;
        b=nuyrc7BXyJ6GaaMh9h12vKvBfUWFYJe91617e9SrZdp2GHc7wof+vCr9+ACItbgmZO
         2G3DKMA2mm8uriMf0d8o4nGS5GU7xJ6yF+QQvKPbGf2PFvuzz1eSqR4jdS6sF3TpyG7o
         tW5oahnHSAdQdwjT7OFysPZU27SUmew+DlUrigT97AyVGuBI0SZdcImeyp3Oky6RRC7O
         gZS1H1wEJrE9akyAaTL1qeyoj+CTqXQpqNonR+OLsD/qEtllzDg+4FYHruZlaHicTbrg
         rxuyHYX5SKz3yz/lrxubShgtWkaXtFDcS2ThZUTRgajzI18euHhGbylrXtpo05XOeNqU
         1TIQ==
X-Gm-Message-State: ALQs6tC9noSDca6gM0lg6URyi0q9QDeL065uW+hhXcFh/OjTsTJ2t9tB
        sla/mb5N+miEMy6tuQspOgYF1w==
X-Google-Smtp-Source: AIpwx48udx3BCzzeOG79F+QGBfehzEZ88Q6phQ/7tsCCX5kpVtJNu05qK4yPNxn3D2Z25TwTtrRskA==
X-Received: by 2002:a17:902:481:: with SMTP id e1-v6mr2555038ple.377.1523565997709;
        Thu, 12 Apr 2018 13:46:37 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598] ([2620:15c:17:3:3a5:23a7:5e32:4598])
        by smtp.gmail.com with ESMTPSA id b64sm10433191pfl.148.2018.04.12.13.46.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Apr 2018 13:46:37 -0700 (PDT)
Date:   Thu, 12 Apr 2018 13:46:36 -0700 (PDT)
From:   David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To:     Laurent Dufour <ldufour@linux.vnet.ibm.com>
cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        mhocko@kernel.org, akpm@linux-foundation.org,
        linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        Jerome Glisse <jglisse@redhat.com>,
        aneesh.kumar@linux.vnet.ibm.com, benh@kernel.crashing.org,
        paulus@samba.org, Jonathan Corbet <corbet@lwn.net>,
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
        Robin Murphy <robin.murphy@arm.com>,
        Christophe LEROY <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v4] mm: remove odd HAVE_PTE_SPECIAL
In-Reply-To: <1523533733-25437-1-git-send-email-ldufour@linux.vnet.ibm.com>
Message-ID: <alpine.DEB.2.21.1804121346250.22780@chino.kir.corp.google.com>
References: <20180411110936.GG23400@dhcp22.suse.cz> <1523533733-25437-1-git-send-email-ldufour@linux.vnet.ibm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 12 Apr 2018, Laurent Dufour wrote:

> Remove the additional define HAVE_PTE_SPECIAL and rely directly on
> CONFIG_ARCH_HAS_PTE_SPECIAL.
> 
> There is no functional change introduced by this patch
> 
> Signed-off-by: Laurent Dufour <ldufour@linux.vnet.ibm.com>

Acked-by: David Rientjes <rientjes@google.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
