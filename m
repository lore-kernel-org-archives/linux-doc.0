Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0861FC433F5
	for <linux-doc@archiver.kernel.org>; Fri, 17 Dec 2021 20:46:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237118AbhLQUqO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Dec 2021 15:46:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237142AbhLQUqO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Dec 2021 15:46:14 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1556C06173E
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 12:46:13 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id x15so12555672edv.1
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 12:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mvtI4+YSdquMi4008PNndF9RQGlniB2TT2AdOD25k8M=;
        b=TiDJROI9W5ycY3V9UTpl5dSHKHMEZnWf33NVmEsRwKuJFClSlc4drizCRjtvX0nU1J
         mcXdn9RlVnT274Z77xOxrX9ujv1qBIOdnmYLgr3mJtCslSOMD3PQUkkkx6ZV6OQDfbmN
         vDn6BLFj3k3shFoPGq1aawhK/RRcCUCSrsyjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mvtI4+YSdquMi4008PNndF9RQGlniB2TT2AdOD25k8M=;
        b=P7MoufaZWyfH7nBrgSJup9IDcnpsCXN8tpkr8AJDqgkRLKIx4oeCKFD4V5X4HYecyK
         eW7iZBoXNB7+UzcV7c8UC9Twj5wceCaJimbY9wKSMBItwQVrfsnC0cDJVhQar9ILmBd2
         VYwy+o6+5aa8QtquypeqfBu8B0rBwSugnbA0tG0KZjX+r0+LoOyQR2tZDLHCYIGBIG5t
         NWsenEM6jUAtmWN0EIJc8OEP2LIYkv0PMf6ILymmnjPLCgBmFfF3omlVa3YCJC/8b/Nk
         37drg4aaCrWmPYpDL4Hoy/HTlxrz7AXSW0DsTPgo7cHcpFH+o3IOz14P6IVCDTOwPZY9
         s4Fg==
X-Gm-Message-State: AOAM530JCDHqZF0I/EZVLuhLdjFqA5zlsCo+oCdKYdu9zTsCQlR33VA7
        eXFJtbBLhMYrTRX2rQjP8Q6gXeVRBI6B5Gb/E7I=
X-Google-Smtp-Source: ABdhPJyDuw9eSEC93ADS4HuBG5OmPRZLbuK6Wtx3tsbxWf6oW+2j3PmQkoJ0StKYKNMiYghrHn+9LQ==
X-Received: by 2002:a17:906:e85:: with SMTP id p5mr4011553ejf.159.1639773972433;
        Fri, 17 Dec 2021 12:46:12 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id u14sm3269162edv.92.2021.12.17.12.46.12
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 12:46:12 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id b186-20020a1c1bc3000000b00345734afe78so2294972wmb.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 12:46:12 -0800 (PST)
X-Received: by 2002:a05:600c:1d97:: with SMTP id p23mr4080563wms.144.1639773961365;
 Fri, 17 Dec 2021 12:46:01 -0800 (PST)
MIME-Version: 1.0
References: <20211217113049.23850-1-david@redhat.com> <20211217113049.23850-7-david@redhat.com>
 <CAHk-=wgL5u3XMgfUN6BOqVO0OvPx3-LEri1ju-1TW4dFhHQO4g@mail.gmail.com>
 <CAHk-=wgKft6E_EeLA1GnEXcQBA9vu8m2B-M-U7PuiNa0+9gpHA@mail.gmail.com>
 <54c492d7-ddcd-dcd0-7209-efb2847adf7c@redhat.com> <CAHk-=wgjOsHAXttQa=csLG10Cp2hh8Dk8CnNC3_WDpBpTzBESQ@mail.gmail.com>
 <17bfb2fd-da51-1264-513f-f9e928ec36c6@redhat.com>
In-Reply-To: <17bfb2fd-da51-1264-513f-f9e928ec36c6@redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 17 Dec 2021 12:45:45 -0800
X-Gmail-Original-Message-ID: <CAHk-=wir5fG_OGe_38nhJZegw0uL5+0oH3k48xWQLcAwc4W0Rg@mail.gmail.com>
Message-ID: <CAHk-=wir5fG_OGe_38nhJZegw0uL5+0oH3k48xWQLcAwc4W0Rg@mail.gmail.com>
Subject: Re: [PATCH v1 06/11] mm: support GUP-triggered unsharing via
 FAULT_FLAG_UNSHARE (!hugetlb)
To:     David Hildenbrand <david@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hugh Dickins <hughd@google.com>,
        David Rientjes <rientjes@google.com>,
        Shakeel Butt <shakeelb@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Yang Shi <shy828301@gmail.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Michal Hocko <mhocko@kernel.org>,
        Nadav Amit <namit@vmware.com>, Rik van Riel <riel@surriel.com>,
        Roman Gushchin <guro@fb.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Peter Xu <peterx@redhat.com>,
        Donald Dutile <ddutile@redhat.com>,
        Christoph Hellwig <hch@lst.de>,
        Oleg Nesterov <oleg@redhat.com>, Jan Kara <jack@suse.cz>,
        Linux-MM <linux-mm@kvack.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Dec 17, 2021 at 12:42 PM David Hildenbrand <david@redhat.com> wrote:
>
> > Then somebody else modified that page, and you got exactly what you
> > asked for - a COW event. The original R/O pin has the original page
> > that it asked for, and can read it just fine.
>
> Where in the code did I ask for a COW event? I asked for a R/O pin, not
> any kind of memory protection.

Why didn't you ask for a shared pin, if that is what you want?

We already support that.

If you don't like the read-only pins, don't use them. It's that simple.

              Linus
