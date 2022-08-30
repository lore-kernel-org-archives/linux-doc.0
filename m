Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E7DC0502C
	for <linux-doc@archiver.kernel.org>; Tue, 30 Aug 2022 13:53:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231337AbiH3NxY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 Aug 2022 09:53:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231195AbiH3NxC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Aug 2022 09:53:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F407426E8
        for <linux-doc@vger.kernel.org>; Tue, 30 Aug 2022 06:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661867524;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UJVr43uWt8PVxH448vHnmIse/JFMIMR/CqYNuTX+I0E=;
        b=KXBKGY/YWJoofA0YTgA8Z2V33UyC7WvzKa8vxSPA8A4yIZkiHM4pNBKa/m+gUkkylwRH8J
        +bQs7lfFYoXhJAkQ4QOdOSTGWeQpDbYqMfHatFlIsUeOLjtwzmoeHWxrqSSO9d8L25QIhz
        3qD+E5nRfnYxiUdnk/EDeEey85zVP7g=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-248-Ag6gdqLQPeStfb6rXuIN8w-1; Tue, 30 Aug 2022 09:52:03 -0400
X-MC-Unique: Ag6gdqLQPeStfb6rXuIN8w-1
Received: by mail-pf1-f198.google.com with SMTP id e9-20020aa78249000000b00537a62a6175so4642113pfn.20
        for <linux-doc@vger.kernel.org>; Tue, 30 Aug 2022 06:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=UJVr43uWt8PVxH448vHnmIse/JFMIMR/CqYNuTX+I0E=;
        b=dPG89KHkXtCznC0+ps82sjisNOPAm9vQ5WBMmf9WrVyfsAq7pKeXXxB3PX5vulryMg
         nTAQshFX9zrw5dxz7SJ8YTOhcWhWm047L5VEazBcsY7FXEEHhDSYkw1JBJR8WhZnosFv
         +w2kuVckwNl+j1IaEbVNE8RL+rf7dlLi6g5iTMM1z1LCRWpOgcbM71qYsokqC1Ih/GH8
         8ygcJ8mANNj4KLJqWnavQjFUKqYtr2+mjN70//ZJ9T5uvVnyzXGd6mTInEyx4nbrf/WU
         D4cVYjhfXIYPaDR376+XFEjZ+bVyXy6ShiYqJtXDVFZyx2E4zEQDxjP32Om4iwouAEx8
         fCnw==
X-Gm-Message-State: ACgBeo1YDURnySVGlmX4OTgQXOZ7CMbUnDz4RN3JG7APzN13fsqCnrc0
        m4TThjLEy+xanV3M6mMHwwGl8ar9qV9QO0fuFCgtY2g6t18PSjONJCstGdSzDq5hYQbBuWdvqDb
        +WOIGlXXzQx7f1xB1MZX6IJZqwWe/8XnKLupO
X-Received: by 2002:a65:6255:0:b0:42c:87b1:485b with SMTP id q21-20020a656255000000b0042c87b1485bmr3977292pgv.491.1661867522197;
        Tue, 30 Aug 2022 06:52:02 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4uttRB0OgUCrHoIJFyDwUqMmth8JbBFJmcReY4G9C4XP9O/bnAzP100AWpX19LwnHtW0ssr0V6liTxxc7zEVI=
X-Received: by 2002:a65:6255:0:b0:42c:87b1:485b with SMTP id
 q21-20020a656255000000b0042c87b1485bmr3977270pgv.491.1661867521925; Tue, 30
 Aug 2022 06:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220824134055.1328882-1-benjamin.tissoires@redhat.com>
 <20220824134055.1328882-3-benjamin.tissoires@redhat.com> <CAP01T76tie9dpjacCLxCcAjtra12GxfmeO9f_mYnUU6pO4otzQ@mail.gmail.com>
In-Reply-To: <CAP01T76tie9dpjacCLxCcAjtra12GxfmeO9f_mYnUU6pO4otzQ@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 30 Aug 2022 15:51:50 +0200
Message-ID: <CAO-hwJL6cy8JbXFSmSVtkNQHZkuYoHsvb1=JxvLSnBeeRBMZ5A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v9 02/23] bpf/verifier: do not clear meta in check_mem_size
To:     Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Jiri Kosina <jikos@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>, Shuah Khan <shuah@kernel.org>,
        Dave Marchevsky <davemarchevsky@fb.com>,
        Joe Stringer <joe@cilium.io>, Jonathan Corbet <corbet@lwn.net>,
        Tero Kristo <tero.kristo@linux.intel.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Aug 26, 2022 at 3:55 AM Kumar Kartikeya Dwivedi
<memxor@gmail.com> wrote:
>
> On Wed, 24 Aug 2022 at 15:41, Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > The purpose of this clear is to prevent meta->raw_mode to be evaluated
> > at true, but this also prevents to forward any other data to the other
> > callees.
> >
> > Only switch back raw_mode to false so we don't entirely clear meta.
> >
> > Acked-by: Yonghong Song <yhs@fb.com>
> > Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> >
> > ---
> >
> > no changes in v9
> >
> > no changes in v8
> >
> > no changes in v7
> >
> > new in v6
> > ---
> >  kernel/bpf/verifier.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index d694f43ab911..13190487fb12 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -5287,7 +5287,7 @@ static int check_mem_size_reg(struct bpf_verifier_env *env,
> >                  * initialize all the memory that the helper could
> >                  * just partially fill up.
> >                  */
> > -               meta = NULL;
> > +               meta->raw_mode = false;
>
> But this is adding a side effect, the caller's meta->raw_mode becomes
> false, which the caller may not expect...

Turns out that I don't need that patch anymore because I am not
checking against is_kfunc in the previous patch. So dropping it from
the next revision.

Cheers,
Benjamin

>
> >
> >         if (reg->smin_value < 0) {
> >                 verbose(env, "R%d min value is negative, either use unsigned or 'var &= const'\n",
> > --
> > 2.36.1
> >
>

