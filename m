Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3710C43217
	for <linux-doc@archiver.kernel.org>; Mon, 11 Oct 2021 19:09:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C754C60E8B
	for <linux-doc@archiver.kernel.org>; Mon, 11 Oct 2021 19:09:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234542AbhJKTLV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 Oct 2021 15:11:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52455 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234550AbhJKTLU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Oct 2021 15:11:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633979360;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oZEQAOmKk6R+KRX2BzvVHC2H3CodKlCG/yzYUUC2zJA=;
        b=BS4bA3fCPL7ji4sk0sY++AgXBRA5903u4v5fTv5U+qeJOVInB+UsGXRdm/y/lsPVrS3VBE
        LdiOFVDZaPAUAcjXri+vHn2LuaratoyeuQB63xehStRiGYWhYQbWxE2542eW86FKAKGdSn
        9jCnAoRWYokRQikWIZzlLf5YZ0OzmjQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-wU-Nq89xPFmYcri4150arg-1; Mon, 11 Oct 2021 15:09:18 -0400
X-MC-Unique: wU-Nq89xPFmYcri4150arg-1
Received: by mail-ed1-f69.google.com with SMTP id g28-20020a50d0dc000000b003dae69dfe3aso16689433edf.7
        for <linux-doc@vger.kernel.org>; Mon, 11 Oct 2021 12:09:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oZEQAOmKk6R+KRX2BzvVHC2H3CodKlCG/yzYUUC2zJA=;
        b=jb1GEgYpMhr/cwBtU21jMHLQOtFcDAFQQS/tkkG7g2SKlDadtmn5Li8WnEETOC9xHd
         deQM3oZoJGF9tY/k+Pnx9V2xzDTK3hd1amBTVYB0NUPRqQknrLAmyXpJAFy2ICrfnCVm
         0COlrKAsRfUvKRUzsN86asP5IqrPYvK6iSXR+XNT/sOG04H3W2a/QZoEEFyxSoBQwJE8
         bfqakrtCTEYg8JmFOEPylw/5bkqNp7C9ENfiXwEMbbntVyerrVdhhEl8SShNExqEOd6S
         1OHCqGpzdpLTtgi0+mb38cJhPDC7wa1zElo0wwpcUZYsnqL32p2Le1mevGXsU2MxgsK5
         9KjA==
X-Gm-Message-State: AOAM533R2z3BVj5UdONjQdHFD4EBmtMQvidDwnb4AryF956yfCY+uAFu
        HdRIm9P7/ySM/6pkkpq6PKlL/B3L1jWAsgs73jyZFMXA1tinrtHc9HDSUUrf9U/2R8Hmgj6AHOS
        NJJv9ozPML9Wj7TNQQlT4
X-Received: by 2002:aa7:c38b:: with SMTP id k11mr4113136edq.79.1633979356727;
        Mon, 11 Oct 2021 12:09:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGboOz6J9azwkeciPdL9sKClCOiUS/XGJc/PjIe5OTL3dASYPSk/hflbIEKyA9zwBTklJK0A==
X-Received: by 2002:aa7:c38b:: with SMTP id k11mr4113103edq.79.1633979356541;
        Mon, 11 Oct 2021 12:09:16 -0700 (PDT)
Received: from redhat.com ([2.55.159.57])
        by smtp.gmail.com with ESMTPSA id z4sm5250327edd.46.2021.10.11.12.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 12:09:15 -0700 (PDT)
Date:   Mon, 11 Oct 2021 15:09:09 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Andi Kleen <ak@linux.intel.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Andy Lutomirski <luto@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Richard Henderson <rth@twiddle.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        James E J Bottomley <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        "David S . Miller" <davem@davemloft.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Paolo Bonzini <pbonzini@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter H Anvin <hpa@zytor.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Kirill Shutemov <kirill.shutemov@linux.intel.com>,
        Sean Christopherson <seanjc@google.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        x86@kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v5 12/16] PCI: Add pci_iomap_host_shared(),
 pci_iomap_host_shared_range()
Message-ID: <20211011142956-mutt-send-email-mst@kernel.org>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-13-sathyanarayanan.kuppuswamy@linux.intel.com>
 <YWPunfa+WK86Cgnv@infradead.org>
 <a070274e-6a3a-fb0a-68ff-d320d0729377@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a070274e-6a3a-fb0a-68ff-d320d0729377@linux.intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 11, 2021 at 10:23:00AM -0700, Andi Kleen wrote:
> 
> On 10/11/2021 12:58 AM, Christoph Hellwig wrote:
> > Just as last time:  This does not make any sense.  ioremap is shared
> > by definition.
> 
> It's not necessarily shared with the host for confidential computing: for
> example BIOS mappings definitely should not be shared, but they're using
> ioremap today.

That just needs to be fixed.

> But if you have a better term please propose something. I tried to clarify
> it with "shared_host", but I don't know a better term.
> 
> 
> -Andi
> 


The reason we have trouble is that it's not clear what does the API mean
outside the realm of TDX.
If we really, truly want an API that says "ioremap and it's a hardened
driver" then I guess ioremap_hardened_driver is what you want.

-- 
MST

