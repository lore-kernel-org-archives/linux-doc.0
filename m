Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C1DFA7D8AB
	for <lwn-linux-doc@archive.lwn.net>; Fri, 28 Jun 2019 19:09:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbfF1TJG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 28 Jun 2019 15:09:06 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35248 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbfF1TJG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 28 Jun 2019 15:09:06 -0400
Received: by mail-io1-f68.google.com with SMTP id m24so14814321ioo.2
        for <linux-doc@vger.kernel.org>; Fri, 28 Jun 2019 12:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=denpEz7Y25tPYld+8szHUZUn70KyumHMuU5ZgYCdiKI=;
        b=HWMrmaJnz5V8Ac64W9ltGnhij2/onexK3xCea2eFyAXK6JVJnwj62PwageLoaznljr
         lVtZWieElekXXI6Q4uto5rBOs5y5+Y+oEhsPTyrfK/jawOxPcID1zg2pkEYUErrhcwJB
         aszK3rXIb3zpoK6myJKG5S0dwok2xahK5qCTGgIkyiJIZXoRbIwMC/T+A04ynBDaa7BH
         hrEXqsOvUf285Gj4q/Vnqx2FcdDFpiK+Iaa3nU5B1d3yP/hh7wB2rHg3xnWWrSZTkWn+
         Q8Ff3Ayu/GN5pDCx+2ZM3PNc7q0wBMyQInqc2hToFVqvI2Nn3mimmdf2GreNGgeTmOwr
         KdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=denpEz7Y25tPYld+8szHUZUn70KyumHMuU5ZgYCdiKI=;
        b=aigW+xwbbfcFa399mfBiVA+OSZqQ6P8W4BIV5CN0cUo2sv7V6y66o56r9f4j1nWZpS
         7K0QRPTCnfD5Oh5Yg8DsDSlp/F1jOnc55EBCFRFOHUckdyV5Gg6mRsgvDW6g6kZPmqA0
         iGcVeFbCB9jUnQSGyQobh3MFIgwV04aHpiftoNHMxCTqpQq+Lktr0yTajdms34sHAbMZ
         Ssu/WqnjnzQbyO1Nv5C1Sk4AliAfrP7c3K0GneJKJeR6uGjqGtjPf7MGtJgRrRhdXCOx
         OaDryF4tx7CKUqXGMU1VdD2ctoAQbZzozPCiD5wSg/4Qr7TVbudqwqSepmGFgwv1S+rD
         86Kw==
X-Gm-Message-State: APjAAAWgwWh6itCWP/LB5hKskx0w4Z2C9j53sHYmO0iZS/lDBxgqUnPY
        vSHt8Yp606rY6eU+1mfEEQxhUQ==
X-Google-Smtp-Source: APXvYqyCiWd28x6ejKIVj1HQUvQbmY2IcCFzFG/uYivQu5hxZZBjfMnIAX99mg22opfTcrJJ/QIWog==
X-Received: by 2002:a05:6638:281:: with SMTP id c1mr13074518jaq.43.1561748945460;
        Fri, 28 Jun 2019 12:09:05 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
        by smtp.gmail.com with ESMTPSA id x13sm2623367ioj.18.2019.06.28.12.09.04
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 28 Jun 2019 12:09:05 -0700 (PDT)
Date:   Fri, 28 Jun 2019 12:09:04 -0700 (PDT)
From:   Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To:     Atish Patra <atish.patra@wdc.com>
cc:     linux-kernel@vger.kernel.org, Karsten Merker <merker@debian.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Anup Patel <Anup.Patel@wdc.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Nick Kossifidis <mick@ics.forth.gr>,
        Palmer Dabbelt <palmer@sifive.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will.deacon@arm.com" <will.deacon@arm.com>,
        "trini@konsulko.com" <trini@konsulko.com>
Subject: Re: [PATCH v4] RISC-V: Add an Image header that boot loader can
 parse.
In-Reply-To: <20190606230800.19932-1-atish.patra@wdc.com>
Message-ID: <alpine.DEB.2.21.9999.1906281207290.3867@viisi.sifive.com>
References: <20190606230800.19932-1-atish.patra@wdc.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 6 Jun 2019, Atish Patra wrote:

> Currently, the last stage boot loaders such as U-Boot can accept only
> uImage which is an unnecessary additional step in automating boot
> process.
> 
> Add an image header that boot loader understands and boot Linux from
> flat Image directly.

...


> +#if __riscv_xlen == 64
> +	/* Image load offset(2MB) from start of RAM */
> +	.dword 0x200000
> +#else
> +	/* Image load offset(4MB) from start of RAM */
> +	.dword 0x400000
> +#endif

Is there a rationale behind these load offset values?


- Paul
