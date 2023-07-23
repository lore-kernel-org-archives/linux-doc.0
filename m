Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAFFFC001B0
	for <linux-doc@archiver.kernel.org>; Sun, 23 Jul 2023 03:37:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjGWDh5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 22 Jul 2023 23:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjGWDh4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 Jul 2023 23:37:56 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 700D51BE6
        for <linux-doc@vger.kernel.org>; Sat, 22 Jul 2023 20:37:55 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-570877f7838so39363467b3.0
        for <linux-doc@vger.kernel.org>; Sat, 22 Jul 2023 20:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1690083474; x=1690688274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gtVI/IEjpmaRtvShyZurI+Mn3IaZd/ZZL2NDUlIKnng=;
        b=H2+CbEPx1fthLXaGk4VzQCqF0jOJH+yGFI3Cte9F+/2q4jeZfA/wroxJwHBwc9P0gt
         2x7okFgxSx+UDJlOojkQalXVcL9L9JfxlTkHf/nl815Szxxm+AQmN8D28ur1Bt5JMb5z
         AkT9nOhWtlP7Y5Li58BJOenzNK/wT6nE0bfwSh4FYsZZ8mhpqsxtY490KwhPZlzItP+1
         MIPvcNf2qkJ6c53UQNmfvenIbJZGKtnXOw/3/61VEyZEsW4vwykmCZdj5NxBG/98Vxzr
         Laqp9C6DSvh9djEH7IPxiyScARwhTisTm0log7cKy3NUDemQrJhod5EuezyTGklX08dw
         76hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690083474; x=1690688274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtVI/IEjpmaRtvShyZurI+Mn3IaZd/ZZL2NDUlIKnng=;
        b=ICWAdEwaH2/dG9y+Fw1QfmwSi9ck5QWG4HpwZxGndOJO3U2g4Zlfjabkl5KnlUPAt/
         2jwNQcT3ZZO81txBy0NURIORtmbvCN4davY/EaodFoS6f4kHhcdat0SzttEbJGiergm5
         41QMru4BczHMLXzLwmsdaLPsCh1rXnHn2glQVrvdS9P5knM1dTRodBo5hstlrXR81o14
         yEyyH3bf6DTJv3Qy3e258Bewq8PaiYL4B+I5Y2PFNNYjCecPka+zSAJT2pohLa7033X9
         Pj6KQeXb0keETcXfiIvp+TOCnZa1s2VHCT81n03PJSCkMzIFWp90HhbyBChbe8ULpWxZ
         KWVQ==
X-Gm-Message-State: ABy/qLaw05Knkdm0+OorWVm7iSBZ9Fv6cjCb0Y3P0RKKcwEz4nnseHpb
        KwXvAUb7IsBN5GfHq2puz3I3jlBaBYqhoQKo8J8YgI0Bsv4Q0gKX
X-Google-Smtp-Source: APBJJlFG1OLz30Hlcsi7+14xlEwLIEqgPtj5SKYS41G+Nw4//VdBXJE5DhRbOh7Wa2hVMlPvZoqDU4Ez45ymIY3Nfhw=
X-Received: by 2002:a81:5dc2:0:b0:576:c543:2a5f with SMTP id
 r185-20020a815dc2000000b00576c5432a5fmr3663930ywb.4.1690083474682; Sat, 22
 Jul 2023 20:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230722231508.1030269-1-pasha.tatashin@soleen.com>
 <20230722231508.1030269-3-pasha.tatashin@soleen.com> <52c883a3-5951-b298-cae4-a46fa0619411@infradead.org>
In-Reply-To: <52c883a3-5951-b298-cae4-a46fa0619411@infradead.org>
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
Date:   Sat, 22 Jul 2023 23:37:10 -0400
Message-ID: <CA+CK2bCoxzp_e7oBTqUYaL36e6WGnc7AxG0M+2SC8SZrrAd3Tw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] doc/vm: add information about page_table_check
 warn_on behavior
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     akpm@linux-foundation.org, corbet@lwn.net, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        rick.p.edgecombe@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jul 22, 2023 at 7:59=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Hi--
>
> On 7/22/23 16:15, Pasha Tatashin wrote:
> > The default behavior of page table check was changed from panicking
> > kernel to printing a warning.
> >
> > Add a note how to still panic the kernel when error is detected.
> >
> > Signed-off-by: Pasha Tatashin<pasha.tatashin@soleen.com>
> > ---
> >   Documentation/mm/page_table_check.rst | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/mm/page_table_check.rst b/Documentation/mm/p=
age_table_check.rst
> > index c12838ce6b8d..f534c80ee9c9 100644
> > --- a/Documentation/mm/page_table_check.rst
> > +++ b/Documentation/mm/page_table_check.rst
> > @@ -14,13 +14,14 @@ Page table check performs extra verifications at th=
e time when new pages become
> >   accessible from the userspace by getting their page table entries (PT=
Es PMDs
> >   etc.) added into the table.
> >
> > -In case of detected corruption, the kernel is crashed. There is a smal=
l
> > +In case of detected corruption, a warning is printed. There is a small
> >   performance and memory overhead associated with the page table check.=
 Therefore,
> >   it is disabled by default, but can be optionally enabled on systems w=
here the
> >   extra hardening outweighs the performance costs. Also, because page t=
able check
> >   is synchronous, it can help with debugging double map memory corrupti=
on issues,
> >   by crashing kernel at the time wrong mapping occurs instead of later =
which is
> > -often the case with memory corruptions bugs.
> > +often the case with memory corruptions bugs. In order to crash kernel =
sysctl
> > +panic_on_warn should be set to 1.
>
> Better as:
>    In order to crash the kernel, the sysctl panic_on_warn should be set
> to 1.

Will update in the next version.

Thanks,
Pasha

>
