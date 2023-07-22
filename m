Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BCAC41513
	for <linux-doc@archiver.kernel.org>; Sat, 22 Jul 2023 02:23:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbjGVCXJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Jul 2023 22:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjGVCXA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Jul 2023 22:23:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3106235AC
        for <linux-doc@vger.kernel.org>; Fri, 21 Jul 2023 19:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689992530;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lGXyRvvOTWAiP2i+H+p8f2DO1VQ/VfdgvLVCErvmOcM=;
        b=a+Y59PuwwwjxKQ6lxZQR5e9zMmOyuxnv7pn3F4eywJD5FNxVbjRyG0o4MsYjBH5I1r4SF+
        A8JlSXXCnDAdmHnW4UdYL6o/6uFu0dpyTF2nXpqIBMBSFDLYJXw7kkiY1XwqfTjT5XnPWS
        xF/NkS7FCElQ9flPnH3YWNVaRrnlSjI=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-Y6Onzki3MmqUDezrBLiFbg-1; Fri, 21 Jul 2023 22:22:08 -0400
X-MC-Unique: Y6Onzki3MmqUDezrBLiFbg-1
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-1b88edb7f46so5399015fac.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Jul 2023 19:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689992527; x=1690597327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGXyRvvOTWAiP2i+H+p8f2DO1VQ/VfdgvLVCErvmOcM=;
        b=jFN1OOF3CCsXW78UQtJ8ahUlpD4NWOSU7DtRJzDj79uiOvLMKnTpUiDhvUVHVFzBs5
         tDhojv+lWBgbhRuB5BJJJtPDFuGf4KyjGi5B+vBrjbJCkoO8xewoAIJk2NgtyJbjUOR3
         k+PsERblq3I6/Wr5sfxyW9JwdyUAT36dfqXcfBc5jL7XnMeJaNFrEbR0pdB8+OK7AfY/
         RIo2BmMmUqr9eHwfQaSlW6W4xi12rHMZnF3HDkXKAC48Sie8GQ/zdzuYidxJ5PHiFLfm
         S8ZU2dMuMncZQFfe1CPYn9Rr1VrJYN2bxATsDjn/WUcj8r2Om5ZY9LFnKDgMIrUJ6jWA
         tbPQ==
X-Gm-Message-State: ABy/qLY43z1J2HTImwt7AC9qO5TGq377fGcK6JR82PoOBHYLgEOdeHGa
        TBU84QzdRpTkJx4w4nl9dxXcU8pdOZTrayOrs4SGWTKMQwUuKfi8hiTAlnQBCNM5KZGppZdVbjj
        B2BVUuJdJ4vH97S5QvcewwvB1dRfY0t8G9q1YVx5WvA8VswQ=
X-Received: by 2002:a05:6871:29b:b0:1bb:3b94:c651 with SMTP id i27-20020a056871029b00b001bb3b94c651mr325401oae.41.1689992527230;
        Fri, 21 Jul 2023 19:22:07 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGZJQFIRWMQ5HZX9/fDBkAcweuMzUKYQ8OBaCQ06GX1oJcws787tWIidhAtwWsMjIszKYmb89X9Shbimo3fgJA=
X-Received: by 2002:a05:6871:29b:b0:1bb:3b94:c651 with SMTP id
 i27-20020a056871029b00b001bb3b94c651mr325396oae.41.1689992526974; Fri, 21 Jul
 2023 19:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230718185156.1015753-1-costa.shul@redhat.com> <87y1j9ca42.fsf@meer.lwn.net>
In-Reply-To: <87y1j9ca42.fsf@meer.lwn.net>
From:   Costa Shulyupin <costa.shul@redhat.com>
Date:   Sat, 22 Jul 2023 05:21:56 +0300
Message-ID: <CADDUTFxu4owj_aXo2OBug3qBLbmS8boNXzcra8qLsqDYwN5Kpg@mail.gmail.com>
Subject: Re: [PATCH] docs: remove tree links from the main index
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The left column "Contents" is overloaded and hard to use. The value of
this patch is to make it more usable.

Sections of the main page are not displayed after patch "docs: Add
more information to the HTML sidebar". So sections don't work now and
should be fixed too.

I have in mind to reorganize the main page so the left column
"Contents" becomes usable.

Thanks
Costa

On Fri, 21 Jul 2023 at 22:56, Jonathan Corbet <corbet@lwn.net> wrote:
>
> Costa Shulyupin <costa.shul@redhat.com> writes:
>
> > and leave only their neighbor subsystem-apis
> >
> > because these links are already listed under
> > section "Core subsystems" of Documentation/subsystem-apis.rst:
> >
> >     Core subsystems
> >     ---------------
> >
> >     .. toctree::
> >        :maxdepth: 1
> >
> >        core-api/index
> >        driver-api/index
> >        mm/index
> >        power/index
> >        scheduler/index
> >        timers/index
> >        locking/index
> >
> > Reference:
> > - https://www.kernel.org/doc/html/next/subsystem-apis.html#core-subsystems
> >
> > Motivation:
> > - make the documentation more organized
> > - increase consistency, observability and maintainability
> > - improve balance of ToC tree by reducing overly populated lists
> > - avoid duplicate parallel links
> > - escape tangling of links
> > - intention to fit the main index into one page
> >
> > Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> > ---
> >  Documentation/index.rst | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/Documentation/index.rst b/Documentation/index.rst
> > index 9dfdc826618c..8d8b7eab1131 100644
> > --- a/Documentation/index.rst
> > +++ b/Documentation/index.rst
> > @@ -38,10 +38,7 @@ kernel.
> >  .. toctree::
> >     :maxdepth: 1
> >
> > -   core-api/index
> > -   driver-api/index
> >     subsystem-apis
> > -   Locking in the kernel <locking/index>
>
> So I don't really see the value of this.  It takes away some of the most
> important links from the documentation front page, leaving the "Internal
> API manuals" section nearly empty.  Why would we want to do this?
>
> Thanks,
>
> jon
>

