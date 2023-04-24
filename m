Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3E7C7618E
	for <linux-doc@archiver.kernel.org>; Mon, 24 Apr 2023 17:17:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231972AbjDXRRU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 Apr 2023 13:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231827AbjDXRRS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Apr 2023 13:17:18 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6337A65A1
        for <linux-doc@vger.kernel.org>; Mon, 24 Apr 2023 10:17:16 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5068e99960fso8146379a12.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Apr 2023 10:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1682356635; x=1684948635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bzs6FO+61DdPWf12/xl4T+/amfUemTj+EeZsv8C3WD8=;
        b=E5InqhAtoXFnvQIX0NMlXMDFpYpLCfXGrcNDvDPrQN8g+T1/HnyUwJHoK2EX9PdD82
         JFVJM00/6RvpLgtDQJTjdOx7n5xIfJ6bLTuld6X1QF4KDMb1QAWxRyZTyqDeNQ/aw6gu
         vlTnSpmwTj9cNRnqYN10jevYK/DlVSRzNui9tMfIb+gYwkqLz7s4Fc6yc5tjRxRk1Qax
         T1g4swfEiyuRRkRF7VpGot0Uk01t3Se7NbAy8lwe3GUv0k2hYFSMF2J1t4JY9XnIwLFl
         0IchDJuqty+P56/A3yer3SdSXWdsxGJ4/JgIaxsb8SKGCXd8J6vkxSR5bpydBRtUhPOw
         aZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682356635; x=1684948635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bzs6FO+61DdPWf12/xl4T+/amfUemTj+EeZsv8C3WD8=;
        b=cfUs/R2r88w3LoWxJHnLVw4k35+/8p8AMPHGu8PPhu+Ek2CuY5WDDpxVqD0wQQPF0F
         HgT5wY0z0KOlDZX3L2QlNxwqPbXVngqaOQ6bnzOeZMlL5lvJNCmnSDAw8Gq0ZdvHbeJp
         pNw4pyv6XGqEF6nJC+hdCYNWUTThLoxsLjgZlyl9u2NFVw2QzewyNHPGuR3aXf/KaSuM
         FtiEUvVBgZWM5fXS8fjBz5aTaQjYKn8iC8YGNvoqntx2cauvMTza7/mQe5P0C/ZfMVnt
         RIyKSdYXALOOta+h/tbAQMvPvi2v+G2mU/NXFqVfAYAXCo5aAydWw8qjc+LFNuB/AacW
         wHUg==
X-Gm-Message-State: AAQBX9dp5ejfG8zEejR6OjdCM+CTHpmHRJnMW9s/1EGu6EBI+ow23B5f
        X2IZ6yY9U6st/5piSCOt64e9dHB4M6it5gp2KM4jFNv5KGPnPBw5
X-Google-Smtp-Source: AKy350Z9k1WElKK/0OpgV+S3KsNqmGmwHXM/f5pAh4OyM83smJJgNWacpwVFM98g0R73O/bQJEillt1T0NWEvtLUrQE=
X-Received: by 2002:aa7:d90d:0:b0:506:77e5:d157 with SMTP id
 a13-20020aa7d90d000000b0050677e5d157mr13370358edr.19.1682356634818; Mon, 24
 Apr 2023 10:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230422175256.3396430-1-joe@isovalent.com> <a1d39a73-9793-2e1f-550a-aa3495cd9414@infradead.org>
In-Reply-To: <a1d39a73-9793-2e1f-550a-aa3495cd9414@infradead.org>
From:   Joe Stringer <joe@isovalent.com>
Date:   Mon, 24 Apr 2023 10:17:03 -0700
Message-ID: <CADa=RywRFzMy_1_xfmmPyrUKGOJ6ziVAFzG2RLdTM7w0H1LfRQ@mail.gmail.com>
Subject: Re: [PATCH linux-doc v2] docs/doc-guide: Clarify how to write tables
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Apr 22, 2023 at 11:31=E2=80=AFAM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
> Hi,
>
> On 4/22/23 10:52, Joe Stringer wrote:
> > Prior to this commit, the kernel docs writing guide spent over a page
> > describing exactly how *not* to write tables into the kernel docs,
> > without providing a example about the desired format.
> > > This patch provides a positive example first in the guide so that it'=
s
> > harder to miss, then leaves the existing less desirable approach below
> > for contributors to follow if they have some stronger justification for
> > why to use that approach.
> >
> > Signed-off-by: Joe Stringer <joe@isovalent.com>
> > ---
> > v2: Simplify recommendation for either simple or grid table syntax
> >     Remove example, link to rST user reference
> > ---
> >  Documentation/doc-guide/sphinx.rst | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/doc-guide/sphinx.rst b/Documentation/doc-gui=
de/sphinx.rst
> > index 23edb427e76f..77ac7dc27715 100644
> > --- a/Documentation/doc-guide/sphinx.rst
> > +++ b/Documentation/doc-guide/sphinx.rst
> > @@ -313,9 +313,18 @@ the documentation build system will automatically =
turn a reference to
> >  function name exists.  If you see ``c:func:`` use in a kernel document=
,
> >  please feel free to remove it.
> >
> > +Tables
> > +------
> > +
> > +ReStructuredText provides several options for table syntax. Kernel sty=
le for
> > +tables is prefer *simple table* syntax or *grid table* syntax. See the
>
>    tables is to prefer
> or
>    tables prefers
>
> Otherwise LGTM. It's good to have positive examples, not just negative on=
es.

Thanks, I'll fix this up and send a fresh version.
