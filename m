Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE64DC41513
	for <linux-doc@archiver.kernel.org>; Thu, 10 Aug 2023 17:16:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234846AbjHJRQY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Aug 2023 13:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234840AbjHJRQX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Aug 2023 13:16:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19F3A26BC
        for <linux-doc@vger.kernel.org>; Thu, 10 Aug 2023 10:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691687737;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uwwHD8VGaiWAT/OeGl9cbv1dKygcTMDJVAfWo13hyco=;
        b=ZEqxYz2v0rxvo3nbjhwcXLzkisjFtdfwSpX+asIx8BXCC8x5fnAJ5ut8Cz/Dl7SSZuY2uy
        e3YXUoQDzT8hh738KQ5slGBmiSNxtOGue7WJfG2raBXWOdbtF22XG7mx2Z2pv/rOlCtaoS
        JOx/a4NZcdEK0NZSgy3xsiQRV415pRA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-U6DIsWSNPfauWKmjT6xiEA-1; Thu, 10 Aug 2023 13:15:36 -0400
X-MC-Unique: U6DIsWSNPfauWKmjT6xiEA-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-40fd6d83c21so2821611cf.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Aug 2023 10:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691687736; x=1692292536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwwHD8VGaiWAT/OeGl9cbv1dKygcTMDJVAfWo13hyco=;
        b=T1fvnBXTbxrDEn0cy0patRIMI0/euFxaGcNV8e5ldiUuplX/4WCCqHmwqbHVUSowbm
         T/gTCsmFCW69I0Pzfqt27525XVKYAZUSoS+LFrhG0RnoKhB/cxkK2U0gEGrIfCDZ39xD
         lmA2bp+rFU0YWwnQTbpImb3R1VnbyV1ut26twhzoYuo9TJQPBvLGLNCfSbMrvmJpH7ev
         z3OnBoEG9DVXvA0ViBsafaY3qeaPj8bCVwDFHSaWexJLVtwKDkent9q2CwTgm/H1BCA2
         Fv5g3Ypo+qiUtHENlKV3urmWR5tff09AAuYZO4c8RPY4yxR4Czvls6TnYKQa58Imlu1d
         K5VQ==
X-Gm-Message-State: AOJu0YzWqMr70oOeoq9qvrCYabzhajbzLfBA7nRgZlUtCNyeeUTddm7U
        +5zHt5eOakem6oXoPEmSAvM6PdNOqoHpuf9KHRQUNe/YrgEwL6WpUi7y4k3C1YbyQJYN0yQHkWd
        NwXSK/OQGlmBMTZNhk+0frYEf7sgP
X-Received: by 2002:a05:622a:1988:b0:40f:da40:88a with SMTP id u8-20020a05622a198800b0040fda40088amr3472012qtc.4.1691687735818;
        Thu, 10 Aug 2023 10:15:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOvLflZLhzqs/o1dFdKrDK86gwB1luRyxfHHC4XYJOKYPj1zHGYvpz0bPlj5yUP7dvujle3w==
X-Received: by 2002:a05:622a:1988:b0:40f:da40:88a with SMTP id u8-20020a05622a198800b0040fda40088amr3471988qtc.4.1691687735565;
        Thu, 10 Aug 2023 10:15:35 -0700 (PDT)
Received: from x1n ([2605:8d80:6a3:cb2:d8d8:cd75:7bfe:b6d7])
        by smtp.gmail.com with ESMTPSA id d18-20020ac81192000000b00403ff38d855sm623720qtj.4.2023.08.10.10.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 10:15:35 -0700 (PDT)
Date:   Thu, 10 Aug 2023 13:15:32 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Ryan Roberts <ryan.roberts@arm.com>
Cc:     David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Hugh Dickins <hughd@google.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Yin Fengwei <fengwei.yin@intel.com>,
        Yang Shi <shy828301@gmail.com>, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH mm-unstable v1] mm: add a total mapcount for large folios
Message-ID: <ZNUbNDiciFefJngZ@x1n>
References: <20230809083256.699513-1-david@redhat.com>
 <ZNQD4pxo8svpGmvX@x1n>
 <e5e29217-11d3-a84b-9e29-44acc72222f3@redhat.com>
 <155bd03e-b75c-4d2d-a89d-a12271ada71b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <155bd03e-b75c-4d2d-a89d-a12271ada71b@arm.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 10, 2023 at 11:48:27AM +0100, Ryan Roberts wrote:
> > For PTE-mapped THP, it might be a bit bigger noise, although I doubt it is
> > really significant (judging from my experience on managing PageAnonExclusive
> > using set_bit/test_bit/clear_bit when (un)mapping anon pages).
> > 
> > As folio_add_file_rmap_range() indicates, for PTE-mapped THPs we should be
> > batching where possible (and Ryan is working on some more rmap batching). 
> 
> Yes, I've just posted [1] which batches the rmap removal. That would allow you
> to convert the per-page atomic_dec() into a (usually) single per-large-folio
> atomic_sub().
> 
> [1] https://lore.kernel.org/linux-mm/20230810103332.3062143-1-ryan.roberts@arm.com/

Right, that'll definitely make more sense, thanks for the link; I'd be very
happy to read more later (finally I got some free time recently..).  But
then does it mean David's patch can be attached at the end instead of
proposed separately and early?

I was asking mostly because I read it as a standalone patch first, and
honestly I don't know the effect.  It's based on not only the added atomic
ops itself, but also the field changes.

For example, this patch moves Hugh's _nr_pages_mapped into the 2nd tail
page, I think it means for any rmap change of any small page of a huge one
we'll need to start touching one more 64B cacheline on x86.  I really have
no idea what does it mean for especially a large SMP: see 292648ac5cf1 on
why I had an impression of that.  But I've no enough experience or clue to
prove it a problem either, maybe would be interesting to measure the time
needed for some pte-mapped loops?  E.g., something like faulting in a thp,
then measure the split (by e.g. mprotect() at offset 1M on a 4K?) time it
takes before/after this patch.

When looking at this, I actually found one thing that is slightly
confusing, not directly relevant to your patch, but regarding the reuse of
tail page 1 on offset 24 bytes.  Current it's Hugh's _nr_pages_mapped,
and you're proposing to replace it with the total mapcount:

        atomic_t   _nr_pages_mapped;     /*    88     4 */

Now my question is.. isn't byte 24 of tail page 1 used for keeping a
poisoned mapping?  See prep_compound_tail() where it has:

	p->mapping = TAIL_MAPPING;

While here mapping is, afaict, also using offset 24 of the tail page 1:

        struct address_space * mapping;  /*    24     8 */

I hope I did a wrong math somewhere, though.

-- 
Peter Xu

