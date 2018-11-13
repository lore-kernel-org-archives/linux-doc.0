Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5CEA57D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Nov 2018 19:17:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725748AbeKNFQ1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 14 Nov 2018 00:16:27 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:44461 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbeKNFQ0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Nov 2018 00:16:26 -0500
Received: by mail-qk1-f194.google.com with SMTP id n12so21477199qkh.11
        for <linux-doc@vger.kernel.org>; Tue, 13 Nov 2018 11:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=PVK+jZ+GLjxvR4NNHuuoI38z2FCHxRDwg9GVcSSw1PQ=;
        b=pO0pGtsUEbqq/UPO3kZnh/m33rW1dOOkkrB7Enst35byW7wxkao8q6ugpz0Ejx4AHF
         kOuu46aVdmcYzq+xPgRj2e1+mvvK5OZYNZexoqBvKIuXhYR2HXCZ+fZksWAc92nmyD5g
         rOwAzp+pOcwIH2KLDIZ7eNn507Kpxw+e1+0TLwBFxxu0PPy/PItY9V8duS/PSy0cSvU7
         wSofXStZRiwJFaZkTdy8+l+E/OqNTNCI35Z7XSHEfPpmfU6zGPZB7z3pJQG3ti69h8fM
         6hxjkT8IKpW+vFzzOhtRj1K/AwHAQelel/aoZPPJ+IhAHexHiD+0xWaNrBqM1KoQHBDW
         S0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=PVK+jZ+GLjxvR4NNHuuoI38z2FCHxRDwg9GVcSSw1PQ=;
        b=Mpb8MgnxheWr/850mkrSyjQqTJpKG4qV4rHIVbaBkbas/ClNxnZJ/k84D+Ld6XMjM/
         5unFTlv1jgIWQUvUvKJ3Di8nu4om2yFKG+Ej7vYV71UWe/zRdtgS7q08oY5RnGykEEtm
         QKuvun+BfQyUoGGZmWJVBxA2i9OOxP9CukqNjjAaIs4DTRpMVQSV4sJk534iC/EJJk1C
         VW/L7i2c0IFBmRQ07uGDoKnnfbnRa1agw+Hq4st3VT6B5yL2OPuJAuGVtAVOXECEwtSb
         2JtofNRvH1yBxVhhbWl5fyM1ZO32iEGcHtc6WqCPBlm3vWJj8oszXvS4OyRS1SV3yVP2
         teJA==
X-Gm-Message-State: AGRZ1gJ3mOQzw7/mP6a/n8Vu2TKRw5OEjELhPOI4M+KJxhGXMDRksTWd
        Xq6gZ2TBEmZSvFiHRpV6CIogKQ==
X-Google-Smtp-Source: AJdET5dGrpsA4NZc3kGa4iCImi43hZDQpwet+yHJpY+8Ksh7GHN52biTLUj1YZAdA7o7Bl/oKpavJg==
X-Received: by 2002:aed:33a3:: with SMTP id v32mr6192976qtd.267.1542136616851;
        Tue, 13 Nov 2018 11:16:56 -0800 (PST)
Received: from soleen.tm1wkky2jk1uhgkn0ivaxijq1c.bx.internal.cloudapp.net ([40.117.208.181])
        by smtp.gmail.com with ESMTPSA id 46-v6sm14986875qtv.73.2018.11.13.11.16.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Nov 2018 11:16:55 -0800 (PST)
Date:   Tue, 13 Nov 2018 19:16:53 +0000
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     Timofey Titovets <timofey.titovets@synesis.ru>
Cc:     Oleksandr Natalenko <oleksandr@natalenko.name>,
        Jann Horn <jannh@google.com>, linux-doc@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH V3] KSM: allow dedup all tasks memory
Message-ID: <20181113191653.btbzobquxtwt47z4@soleen.tm1wkky2jk1uhgkn0ivaxijq1c.bx.internal.cloudapp.net>
References: <CAG48ez0ZprqUYGZFxcrY6U3Dnwt77q1NJXzzpsn1XNkRuXVppw@mail.gmail.com>
 <d43da6ad1a3c164aa03e0f22f065591a@natalenko.name>
 <20181113175930.3g65rlhbaimstq7g@soleen.tm1wkky2jk1uhgkn0ivaxijq1c.bx.internal.cloudapp.net>
 <CAGqmi74gpvJv8=B-3pVSMrDssu-aYMxW9xM7mt1WNQjGLjMZqA@mail.gmail.com>
 <20181113183510.5y2hzruoi23e7o2t@soleen.tm1wkky2jk1uhgkn0ivaxijq1c.bx.internal.cloudapp.net>
 <CAGqmi763e4sZj1NHAk2fAjtPtb-kAZfcPq=KTH8B3sE-oDVvGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGqmi763e4sZj1NHAk2fAjtPtb-kAZfcPq=KTH8B3sE-oDVvGw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 18-11-13 21:54:13, Timofey Titovets wrote:
> вт, 13 нояб. 2018 г. в 21:35, Pavel Tatashin <pasha.tatashin@soleen.com>:
> >
> > On 18-11-13 21:17:42, Timofey Titovets wrote:
> > > вт, 13 нояб. 2018 г. в 20:59, Pavel Tatashin <pasha.tatashin@soleen.com>:
> > > >
> > > > On 18-11-13 15:23:50, Oleksandr Natalenko wrote:
> > > > > Hi.
> > > > >
> > > > > > Yep. However, so far, it requires an application to explicitly opt in
> > > > > > to this behavior, so it's not all that bad. Your patch would remove
> > > > > > the requirement for application opt-in, which, in my opinion, makes
> > > > > > this way worse and reduces the number of applications for which this
> > > > > > is acceptable.
> > > > >
> > > > > The default is to maintain the old behaviour, so unless the explicit
> > > > > decision is made by the administrator, no extra risk is imposed.
> > > >
> > > > The new interface would be more tolerable if it honored MADV_UNMERGEABLE:
> > > >
> > > > KSM default on: merge everything except when MADV_UNMERGEABLE is
> > > > excplicitly set.
> > > >
> > > > KSM default off: merge only when MADV_MERGEABLE is set.
> > > >
> > > > The proposed change won't honor MADV_UNMERGEABLE, meaning that
> > > > application programmers won't have a way to prevent sensitive data to be
> > > > every merged. So, I think, we should keep allow an explicit opt-out
> > > > option for applications.
> > > >
> > >
> > > We just did not have VM/Madvise flag for that currently.
> > > Same as THP.
> > > Because all logic written with assumption, what we have exactly 2 states.
> > > Allow/Disallow (More like not allow).
> > >
> > > And if we try to add, that must be something like:
> > > MADV_FORBID_* to disallow something completely.
> >
> > No need to add new user flag MADV_FORBID, we should keep MADV_MERGEABLE
> > and MADV_UNMERGEABLE, but make them work so when MADV_UNMERGEABLE is
> > set, memory is indeed becomes always unmergeable regardless of ksm mode
> > of operation.
> >
> > To do the above in ksm_madvise(), a new state should be added, for example
> > instead of:
> >
> > case MADV_UNMERGEABLE:
> >         *vm_flags &= ~VM_MERGEABLE;
> >
> > A new flag should be used:
> >         *vm_flags |= VM_UNMERGEABLE;
> >
> > I think, without honoring MADV_UNMERGEABLE correctly, this patch won't
> > be accepted.
> >
> > Pasha
> >
> 
> That must work, but we out of bit space in vm_flags [1].
> i.e. first 32 bits already defined, and other only accessible only on
> 64-bit machines.

So, grow vm_flags_t to 64-bit, or enable this feature on 64-bit only.

> 
> 1. https://elixir.bootlin.com/linux/latest/source/include/linux/mm.h#L219
