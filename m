Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81927C433B4
	for <linux-doc@archiver.kernel.org>; Thu,  8 Apr 2021 19:57:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C8FF610E6
	for <linux-doc@archiver.kernel.org>; Thu,  8 Apr 2021 19:57:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232438AbhDHT5Z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Apr 2021 15:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232490AbhDHT5W (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Apr 2021 15:57:22 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3552C061764
        for <linux-doc@vger.kernel.org>; Thu,  8 Apr 2021 12:57:10 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id mj7-20020a17090b3687b029014d162a65b6so3803845pjb.2
        for <linux-doc@vger.kernel.org>; Thu, 08 Apr 2021 12:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=SFjnCjujGEgtSC+ABQLNrqugqZ/9XaANTg42WzyEM+c=;
        b=Wgh/cbKnfaPzqZefmKDOLkn79wXmeeaUQXbhkscPI2a05rTC9L4oeuVVAGS8tXOPS4
         Rcl9YephQY6h/zRkFgEtL+sdoR35e/eQA0oabkjl/jrOSeLMjUra4EVzqL9fReZUB9mN
         9MkSfuFoUKIjiC9NPna5S6xg85iI+u9tNn3o0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=SFjnCjujGEgtSC+ABQLNrqugqZ/9XaANTg42WzyEM+c=;
        b=rjEJeR4w7xob1lruM0rIMV0+bXE3hlywG/M40Tx+qlfiGqjtl9etoChu1X8ip9462d
         HtbSZUdRnotWy9bR2sr93qpG9RNpQULFiAPxbwS4awOaTCruvT7scl9O53sLs5aYkCvC
         0f5a9JyqNWLemLxiVJuakqcqqNZj5a760Jj0KCpk0XzzhD6/tYT0sykfsY4OD9H0HKkM
         cgqemssG2HO+QRt8XsNiYFcaAw5pnmJG4i8sMxrjJbfC/cS7RltZzT9I2cV6Tg/izot2
         hpnMpuY1Q+Wuykvi+u7lHjz92g86PWMyS2CbaNmi/Ay6MwceNgyCj7nHT6lEE4pCnAfo
         ltpg==
X-Gm-Message-State: AOAM531e669GZUa59wXBpgiF4TRs3NtOzGRyexyXfNnnK9nZ6N0+cCvJ
        iXuxBlyTq2yGP488fULuFB9WEQ==
X-Google-Smtp-Source: ABdhPJza2HPcGn1bIxKNzHBGVf3omGhgZFg1zXshKLaBZaSsZcgPE8LCZTfrGp300dJ+o9tqAAc2kg==
X-Received: by 2002:a17:902:d78a:b029:e6:e1f:f695 with SMTP id z10-20020a170902d78ab02900e60e1ff695mr9289653ply.82.1617911830394;
        Thu, 08 Apr 2021 12:57:10 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:44c3:3248:e7f5:1bbd])
        by smtp.gmail.com with ESMTPSA id c2sm246727pfb.121.2021.04.08.12.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 12:57:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YG8NwgD3y/ydzVXI@smile.fi.intel.com>
References: <20210331030520.3816265-1-swboyd@chromium.org> <20210331030520.3816265-5-swboyd@chromium.org> <YG8I2dQWkOIkypqO@gunter> <YG8NwgD3y/ydzVXI@smile.fi.intel.com>
Subject: Re: [PATCH v3 04/12] module: Add printk format to add module build ID to stacktraces
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-doc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jessica Yu <jeyu@kernel.org>
Date:   Thu, 08 Apr 2021 12:57:08 -0700
Message-ID: <161791182832.3790633.9176764008911708133@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Andy Shevchenko (2021-04-08 07:05:54)
> On Thu, Apr 08, 2021 at 03:44:57PM +0200, Jessica Yu wrote:
> > +++ Stephen Boyd [30/03/21 20:05 -0700]:
>=20
> ...
>=20
> > > +static void init_build_id(struct module *mod, const struct load_info=
 *info)
> > > +{
> > > +   const Elf_Shdr *sechdr;
> > > +   unsigned int i;
> > > +
> > > +   for (i =3D 0; i < info->hdr->e_shnum; i++) {
> > > +           sechdr =3D &info->sechdrs[i];
> > > +           if (!sect_empty(sechdr) && sechdr->sh_type =3D=3D SHT_NOT=
E &&
> > > +               !build_id_parse_buf((void *)sechdr->sh_addr, mod->bui=
ld_id,
> > > +                                   sechdr->sh_size))
> > > +                   break;
> > > +   }
> > > +}
> >=20
> > Why not just look for the .note.gnu.build-id section instead of trying
> > to parse each note section? Doesn't it always contain the build id? At
> > least the ld man page seems to suggest this section name should be
> > consistent.

That's basically what this code is doing. We're looking through all the
section headers and finding the ones that are notes and then
build_id_parse_buf() is checking to see if that note is a GNU type note
(name =3D=3D "GNU") and is of the type NT_GNU_BUILD_ID (type =3D=3D 3). We =
don't
need to check for a section name of ".note.gnu.build-id", we can use the
existing code in build_id_parse_buf() that looks for the name and type.

>=20
> Interesting idea (in positive way!), I'm wondering what Clang does in such
> case.
>=20

Clang also inserts a GNU build ID and it works with these patches.
