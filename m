Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7426FC433E0
	for <linux-doc@archiver.kernel.org>; Tue,  9 Feb 2021 14:57:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BC0164DB2
	for <linux-doc@archiver.kernel.org>; Tue,  9 Feb 2021 14:57:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232361AbhBIO5W (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 Feb 2021 09:57:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47563 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232224AbhBIO5H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Feb 2021 09:57:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612882541;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WSsdPlcWLs4B7/MYVeVITkDmFpb6BsySsmx2wFDfjIg=;
        b=RNL/CcDL+IAKBwA0EISQhdXGo6HzhQ1YzsL7iIrDlgqlcUCzqV4aKvaskaqqThhdmCKZ5v
        xvBPcOLRJhWWnrYLAEjC6n1jSBrTG0jmYyd2izIB+KLCe2dBf0Jn5t2n37k8dZkalkpkas
        fP2vA7J6ykQ/3EFodGn8cmgOXMm4uy0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-eY0QEblRPFOUQGjguaToig-1; Tue, 09 Feb 2021 09:55:40 -0500
X-MC-Unique: eY0QEblRPFOUQGjguaToig-1
Received: by mail-wm1-f69.google.com with SMTP id y84so2741041wmg.5
        for <linux-doc@vger.kernel.org>; Tue, 09 Feb 2021 06:55:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WSsdPlcWLs4B7/MYVeVITkDmFpb6BsySsmx2wFDfjIg=;
        b=QiVcNoeKRUswW+AqmTy/cJHFkDLCyjzb+nuqRYRGsa9Ga2aqq1Yhv6Y3rcviYPePjZ
         jPAiC2FPgT7FMme6TmjPMEQePEgkT/i0AyxEfnRl+2hpR6T2IkesGUGCPAytILLeqiqb
         sNl1VQmEE6iPCT7Ia0LIKVY50x7VEqAdI4V53QX3eRhO2O8KxBkOUa80PdVd7VwR+sxL
         GG9A8oVpvT6xQDpcDlZzIldNGa7fuJgGSLXgKlRLCHmNx07sajTfx6YXAada9z7cmVij
         LbL29zlYNAkJ88gDb6rAGMp9A0WojDBFK714A/WFK3AMAqm0lXALBWIE4Bdl6udMG7Ry
         5aKg==
X-Gm-Message-State: AOAM531LJ1BQFr2P4HDpWYMCUpnz5VNaydS1MeE2hmrjuAtIZ8wWrejQ
        H91PkicP5YxIk6PSAWwqDXnihzki6ixqoU/oNXHgCAYktK9AZYrw8L92ebI7xtoM0n5Z/2PI7o0
        2YZbFHXO+jyVKVjmpVK8G
X-Received: by 2002:adf:eb82:: with SMTP id t2mr13792162wrn.231.1612882538073;
        Tue, 09 Feb 2021 06:55:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGiyD0i/pTC5CRicHdOTkBxICTMpZX9F+ZX+9eu4fC4Ozi+Yen5iR0i1cuW6uuuaqb68GylQ==
X-Received: by 2002:adf:eb82:: with SMTP id t2mr13792098wrn.231.1612882537862;
        Tue, 09 Feb 2021 06:55:37 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
        by smtp.gmail.com with ESMTPSA id x15sm19731236wro.66.2021.02.09.06.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 06:55:37 -0800 (PST)
Date:   Tue, 9 Feb 2021 09:55:32 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Adrian Catangiu <acatan@amazon.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        qemu-devel@nongnu.org, kvm@vger.kernel.org,
        linux-s390@vger.kernel.org, gregkh@linuxfoundation.org,
        graf@amazon.com, rdunlap@infradead.org, arnd@arndb.de,
        ebiederm@xmission.com, rppt@kernel.org, 0x7f454c46@gmail.com,
        borntraeger@de.ibm.com, Jason@zx2c4.com, jannh@google.com,
        w@1wt.eu, colmmacc@amazon.com, luto@kernel.org, tytso@mit.edu,
        ebiggers@kernel.org, dwmw@amazon.co.uk, bonzini@gnu.org,
        sblbir@amazon.com, raduweis@amazon.com, corbet@lwn.net,
        mhocko@kernel.org, rafael@kernel.org, pavel@ucw.cz,
        mpe@ellerman.id.au, areber@redhat.com, ovzxemul@gmail.com,
        avagin@gmail.com, ptikhomirov@virtuozzo.com, gil@azul.com,
        asmehra@redhat.com, dgunigun@redhat.com, vijaysun@ca.ibm.com,
        oridgar@gmail.com, ghammer@redhat.com
Subject: Re: [PATCH v5 2/2] drivers/virt: vmgenid: add vm generation id driver
Message-ID: <20210209095350-mutt-send-email-mst@kernel.org>
References: <1612200294-17561-1-git-send-email-acatan@amazon.com>
 <1612200294-17561-3-git-send-email-acatan@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612200294-17561-3-git-send-email-acatan@amazon.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> +The ``vmgenid`` driver uses ACPI events to be notified by hardware
> +changes to the 128-bit Vm Gen Id UUID.

That's ok, problem is ACPI event processing is asynchronous.
What we need is thus to flush out ACPI events whenever userspace
does a read, otherwise the value it gets will be stale.

-- 
MST

