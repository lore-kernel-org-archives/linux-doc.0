Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 457E47D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Nov 2018 11:26:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732485AbeKMVYF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Nov 2018 16:24:05 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45397 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732402AbeKMVYF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Nov 2018 16:24:05 -0500
Received: by mail-ot1-f67.google.com with SMTP id 32so10415027ota.12
        for <linux-doc@vger.kernel.org>; Tue, 13 Nov 2018 03:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synesis-ru.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0JxXJBJ9eXeHdGZaFc5eR7bYT9jH1RMTyWBV9Ay5KnI=;
        b=kWA3D28SaUG/oXBPA/sBa0KMukm5sqWBGrd+KW3QriPAysXmScUmgocap5nRUa701f
         8G+A1GHtBTXXbPe10Hx03g8aGk8j1G4o53VIFwiQCatYD1trSTPb5Bt26k/bXL42XSZg
         rUbwf+PRA6M9g+1xFSpeMY0ZVVm+nGsmhYX5HYvoGhS0qa0CEDlsDn4wc8t0xGoryAo1
         fIUIx0BsCEtBXSnhRgP98cbCQCeYLMgU1Lh/A+XBcY64DHbfab83r1OFturnYtxAtjG3
         h/RQjsc9P9V8mUW4lrHubSz+Nt/hlkyJeO0AgKvDfgGuq4kjRs4c9Huu6G87iqBqLANz
         tYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0JxXJBJ9eXeHdGZaFc5eR7bYT9jH1RMTyWBV9Ay5KnI=;
        b=g5oLJmnN6aTQF6I+lZOdB2+55Ytvo8xPi0qsFLYVL0SU6CDIejQqh8KBVN8rte/xtJ
         g3shTZThaVj/hyE+8D2fJ1Gn1+GHN2GXSIcYTYSQdhmy7QSR/aOoTpl7LYQHPn6Gsyho
         VjwpXlc7dOcP9uOvsvLdLYZTfi51c9WDxc6gM1aYHbs/2ZrDN+v9QD2wgNkzwFTYBoX7
         1x7h6TWe5r1F2U8AN4DXM/H/WlwhJz8nU23VvxQsalMDJ5pdHWU4qPD07V9qIsCnuYlg
         ERhg9VBVxED8dy789gPsHWtguWTPEx9jSpKyfi+ebQSaNqIZ9zO5/Ck1A1YNEB4Qlcba
         IlEQ==
X-Gm-Message-State: AGRZ1gKu5weqXXtbmlyhpWLEHA7wYKj8+LU0GRgHqBJFcJQF9yRd/N7P
        16A4aD4aSnvfzekrTP7cTLdnd1R66YlXazwA
X-Google-Smtp-Source: AJdET5fKfml5xKY2juUeqHbg6Yrlt5qtwx6kBDpk8ti4ijOxhY7GzbxXN8doTp+X5B2B84AuCSJhqA==
X-Received: by 2002:a9d:42e1:: with SMTP id c30mr2660564otj.38.1542108383502;
        Tue, 13 Nov 2018 03:26:23 -0800 (PST)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id r10-v6sm9871591oif.57.2018.11.13.03.26.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Nov 2018 03:26:22 -0800 (PST)
Received: by mail-ot1-f51.google.com with SMTP id a11so7307791otr.10;
        Tue, 13 Nov 2018 03:26:22 -0800 (PST)
X-Received: by 2002:a9d:3fcc:: with SMTP id i12mr3021824ote.82.1542108381598;
 Tue, 13 Nov 2018 03:26:21 -0800 (PST)
MIME-Version: 1.0
References: <20181112231344.7161-1-timofey.titovets@synesis.ru> <20181113014928.GH21824@bombadil.infradead.org>
In-Reply-To: <20181113014928.GH21824@bombadil.infradead.org>
From:   Timofey Titovets <timofey.titovets@synesis.ru>
Date:   Tue, 13 Nov 2018 14:25:45 +0300
X-Gmail-Original-Message-ID: <CAGqmi76_ftDGtyowNRz7CCxRoJ6U3L747M=dWbRjh357w3=ZKA@mail.gmail.com>
Message-ID: <CAGqmi76_ftDGtyowNRz7CCxRoJ6U3L747M=dWbRjh357w3=ZKA@mail.gmail.com>
Subject: Re: [PATCH V3] KSM: allow dedup all tasks memory
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Linux Kernel <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

=D0=B2=D1=82, 13 =D0=BD=D0=BE=D1=8F=D0=B1. 2018 =D0=B3. =D0=B2 04:49, Matth=
ew Wilcox <willy@infradead.org>:
>
> On Tue, Nov 13, 2018 at 02:13:44AM +0300, Timofey Titovets wrote:
> > Some numbers from different not madvised workloads.
> > Formulas:
> >   Percentage ratio =3D (pages_sharing - pages_shared)/pages_unshared
> >   Memory saved =3D (pages_sharing - pages_shared)*4/1024 MiB
> >   Memory used =3D free -h
> >
> >   * Name: My working laptop
> >     Description: Many different chrome/electron apps + KDE
> >     Ratio: 5%
> >     Saved: ~100  MiB
> >     Used:  ~2000 MiB
>
> Your _laptop_ saves 100MB of RAM?  That's extraordinary.  Essentially
> that's like getting an extra 100MB of page cache for free.  Is there
> any observable slowdown?  I could even see there being a speedup (due
> to your working set being allowed to be 5% larger)
>
> I am now a big fan of this patch and shall try to give it the review
> that it deserves.

I'm not sure if this is sarcasm,
anyway i try do my best to get that working.

On any x86 desktop with mixed load (browser, docs, games & etc)
You will always see something like 40-200 MiB of deduped pages,
based on type of load of course.

I'm just don't try use that numbers as reason to get general KSM
deduplication in kernel.
Because in current generation with several gigabytes of memory,
several saved MiB not looks serious for most of people.

Thanks!
