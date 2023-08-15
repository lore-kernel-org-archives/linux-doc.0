Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E3B3C04A6A
	for <linux-doc@archiver.kernel.org>; Tue, 15 Aug 2023 12:59:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237302AbjHOM7N (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Aug 2023 08:59:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237308AbjHOM6r (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Aug 2023 08:58:47 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF39E7C
        for <linux-doc@vger.kernel.org>; Tue, 15 Aug 2023 05:58:46 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d64f0c2bc95so4512099276.1
        for <linux-doc@vger.kernel.org>; Tue, 15 Aug 2023 05:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692104325; x=1692709125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJSfsYnM138pKu53K9h3vIlSr2ZBnDVD+P1hLZ7pV7Y=;
        b=ib0C7xGJh9v/1KNd+sc0caERL7aaD0QAa7OHGef9x0JrRkY/nyKAEwMNvdN1TqYg5j
         UI60ecWBtrbpvyQF/dMQVH+fdpy36CRkXdPRWbtyyuDgcmFzTtOHfEEM+dQhkww6GsVv
         nEKlxXFu3Cvk0s99Lai8x/2lSRfjLnsfKs9+mMLZ+IzoGh7YCoIV8S5C/vof6GVYbwPQ
         IK9WcE+I6yQ4WO+lW+ZgU01NxT/r29lBDoVpNcoEPvcvd+e2ADcmPQrrCuJZtiTpx3QJ
         UDjmE/gYFsMxb2hLEDo3EOToVH6jMo5U1R15qYnAkIAjqNhXFwO6CEz53B0aTpbq+qsI
         T1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692104325; x=1692709125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJSfsYnM138pKu53K9h3vIlSr2ZBnDVD+P1hLZ7pV7Y=;
        b=TyubZKdy5dwTLvvJjplugS90FDo4PhsEpAzs4tXeJI1O03Ypdq4u8wOnkSH5vOLm/t
         p/4fIMxleIu0Z8nrM5EwsG0Ek9IOWfpsTDUgu3CfbOhj0KyHUszm91DGEZZl/PTG7xAS
         xIIyq1TQtD4tgerQlVvDY4vi3d0XRkH9550rehCcKxJEQKCRZU6dCxWYEipjJh9DfFHF
         NsYHcvwEkISALtSZBsQ6j6vvwCP5TnL7doGDiF1q30YNkpo8jj3exRWHaiB1RS1HqRp4
         NW7Q22DAdmmxrlRD7Ij99AnwasYfPLF7IoHChDBf7QVsEStOZX94DYvh50QUSdvXcJuv
         BzbQ==
X-Gm-Message-State: AOJu0Yw2rO+zzKpTWWKy6Huy4oE9e8PI+FqHfabh7frQot2LzOr8kizo
        VtlU3uRVx3CfaWsJmafliJegEG9tZFbPI3HFAzx5Jw==
X-Google-Smtp-Source: AGHT+IE78hQXbbJl4eyc+svkBIt+hrE1wZN8h+2gI+VT4VqX/jyOv9Ezkr3iKgLg5H+I7L0hjbwU177OuDvE9Pwa5tM=
X-Received: by 2002:a25:d405:0:b0:d35:f59a:6e46 with SMTP id
 m5-20020a25d405000000b00d35f59a6e46mr14376363ybf.49.1692104325619; Tue, 15
 Aug 2023 05:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230813182552.31792-1-fmdefrancesco@gmail.com>
 <CACRpkdbq8UCtvtRH7FZUEqvTxPQcoGbrKvf_mT5QHMAfVoYNNQ@mail.gmail.com> <3179607.5fSG56mABF@suse>
In-Reply-To: <3179607.5fSG56mABF@suse>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Aug 2023 14:58:33 +0200
Message-ID: <CACRpkdbZkp5Tx3SXkdmErcbJ1aMB5t5s=MUO1cDnMs=sGu92nQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation/page_tables: Add info about MMU/TLB and
 Page Faults
To:     "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mike Rapoport <rppt@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Ira Weiny <ira.weiny@intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Fabio!

trying to answer these things as best I can!

Notice I'm not natively anglo-saxon either.

It's refreshing to have a discussion about formulations in text
in addition to our everyday technical churn!

On Tue, Aug 15, 2023 at 2:27=E2=80=AFPM Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:
> On marted=C3=AC 15 agosto 2023 10:51:24 CEST Linus Walleij wrote:
> > > +Instead, there are also common and expected other causes of page fau=
lts.
> > > These
> > The word you are looking for is "Additionally" right?
> >
> > "Additionally, there are..."
>
> I was only able to use "Instead" to express that, contrary to the former
> conditions that is unexpected and uncommon, there are other expected and
> common causes of page faults. I thought that "Instead" stresses that the
> latter causes carry with them opposite and wanted consequences.
>
> I think of "additionally" as a means to introduce less important and less
> frequently occurring conditions.
>
> Nevertheless, I'll change it to "Additionally" as you are asking for.

I think the following is the best:

"There are also other, common and expected causes of page faults".

No bridge words. I can't really explain it, it's just language intuition. :=
/

An option is to also move the section about the common case section
before the exceptions, which may be more natural to the flow of the text.

> > > +Swapping can't work for memory mapped by kernel logical addresses. T=
hese
> > > are a
> > "kernel logical addresses" -> "kernel-internal logical addresses"
>
> My only question is about why you prefer "kernel-internal" to a straight
> "kernel". Can you please say more about this?

It's because the kernel handles many address spaces and is aware about
also the userspace address space and the physical address space.
So just so emphasize which one it is.

Yours,
Linus Walleij
