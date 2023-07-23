Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0C7C00528
	for <linux-doc@archiver.kernel.org>; Sun, 23 Jul 2023 03:36:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjGWDgA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 22 Jul 2023 23:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjGWDf7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 Jul 2023 23:35:59 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AAC510CA
        for <linux-doc@vger.kernel.org>; Sat, 22 Jul 2023 20:35:57 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-403ea0a50f7so26222321cf.1
        for <linux-doc@vger.kernel.org>; Sat, 22 Jul 2023 20:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1690083356; x=1690688156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqrWX5naUrpfjmyC7vPsbkvoJDvujVsbPJZZSeMA7Yo=;
        b=MRkCx690cmQc0TbpkCAfv/4KvjMa+I3JasXebzo2j+2XXQ8yfvN7BG8a5G7Kavfy3E
         +FeJF/wPBhPPjMQgAjhX601OU6N/QUoekGPrXoc1VplORYEjxcGfzlYefj16AicIC5fI
         DNEDfu+aNj0DfoauO2hE3BvRWrqjCDuyt+WBbmqMq/hdIfOTn5E/e22GCjspwj2+9iyc
         gfqLWKgP3tKrBoQcW1L071lehdqR9w2jiyAI3UegalXxhw8LS+rog0Js5RUD8FT7IdEO
         +kj/YvPRP6kDXs+WCIyjNeB4lV+0iuCK+upAF/rpTIGNc28aQbFh2hXXb1mccUWiNp90
         d4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690083356; x=1690688156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqrWX5naUrpfjmyC7vPsbkvoJDvujVsbPJZZSeMA7Yo=;
        b=ElOOOO3rDpGxZ57HWdQ7ZMjZX7lzbHhlc5y1woT5viX9SdagIAVaNTcZ8OttntiWzD
         dfzoP8Br+0GF80mcL+v8PJnnv5cs9CtAmtORZPvymvDQUz6dX/AqtC4lIERpzC88+arW
         cXTgp004YxXfqxb/azhFQLEP+EVQKjg7cq0TkFKFkPA3rtzcpGMOmOqB7uaPsbCnzd6S
         d4tRxMy6O2ZqanaytKRNNwty0Xr0lliE9UWGt19/sI4I0v1Yj0bZSjzUoafQENFwvakb
         FprxJsKviFgBvaSnbXv4WlKb/gOAy4YCoWp1fF3fUaTkKsa6w7vqBAs27rgqkPP6/U1u
         ewYQ==
X-Gm-Message-State: ABy/qLY5v1MsY3rKZybEHlaIbngJMhDrdskFneOl+94bnQogrySVMJXG
        PjTk7seWukukPXLJFjAlE2zJIY+PGjYg2r1toYhmpg==
X-Google-Smtp-Source: APBJJlHzr+F6PMT6Ts2F/CY0K9h+9VNrVzwdXCRvTbHX/mSX28ukiPlNTb+P0/cqnrZnRdahyQSoWAUKvB/O2QZRb9s=
X-Received: by 2002:ac8:5750:0:b0:403:a9aa:584e with SMTP id
 16-20020ac85750000000b00403a9aa584emr6258959qtx.68.1690083356624; Sat, 22 Jul
 2023 20:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230722231508.1030269-1-pasha.tatashin@soleen.com>
 <20230722231508.1030269-2-pasha.tatashin@soleen.com> <ZLyI48BYnecaROmZ@casper.infradead.org>
In-Reply-To: <ZLyI48BYnecaROmZ@casper.infradead.org>
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
Date:   Sat, 22 Jul 2023 23:35:12 -0400
Message-ID: <CA+CK2bANEkfEe_qMTivTyAhFd8+bi_YmQknJOtep2Q51xpdkLg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] mm/page_table_check: Do WARN_ON instead of BUG_ON
To:     Matthew Wilcox <willy@infradead.org>
Cc:     akpm@linux-foundation.org, corbet@lwn.net, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        rick.p.edgecombe@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jul 22, 2023 at 9:56=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Sat, Jul 22, 2023 at 11:15:06PM +0000, Pasha Tatashin wrote:
> >  static struct page_table_check *get_page_table_check(struct page_ext *=
page_ext)
> >  {
> > -     BUG_ON(!page_ext);
> > +     PAGE_TABLE_CHECK_WARN(!page_ext);
> > +
> >       return (void *)(page_ext) + page_table_check_ops.offset;
> >  }
>
> [...]
>
> > @@ -137,15 +144,15 @@ void __page_table_check_zero(struct page *page, u=
nsigned int order)
> >       struct page_ext *page_ext;
> >       unsigned long i;
> >
> > -     BUG_ON(PageSlab(page));
> > +     PAGE_TABLE_CHECK_WARN(PageSlab(page));
> >
> >       page_ext =3D page_ext_get(page);
> > -     BUG_ON(!page_ext);
> > +     PAGE_TABLE_CHECK_WARN(!page_ext);
> >       for (i =3D 0; i < (1ul << order); i++) {
> >               struct page_table_check *ptc =3D get_page_table_check(pag=
e_ext);
>
> Seems like we're going to warn about !page_ext twice?  Or more than
> twice -- once per tail page?
>
> But then we'll crash because page_ext was NULL and offset was small?

Good catch, page_ext should not be NULL, yet I do not want to add
BUG_ON, let me fix this by warning and gracefully returning if
page_ext is NULL

Pasha
