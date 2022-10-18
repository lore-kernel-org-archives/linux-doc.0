Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2C4C4332F
	for <linux-doc@archiver.kernel.org>; Tue, 18 Oct 2022 00:05:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbiJRAFL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Oct 2022 20:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbiJRAFK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Oct 2022 20:05:10 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 194072F02E
        for <linux-doc@vger.kernel.org>; Mon, 17 Oct 2022 17:05:08 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 78so11845077pgb.13
        for <linux-doc@vger.kernel.org>; Mon, 17 Oct 2022 17:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UbvMCu0XnVUIatC5HjOpWZoBH39srdxVv2oZXv9o6kg=;
        b=ek41R8j3J6wTdRKFT2MnQ4muQsMMz+T6TNdhkVhnlu8cRmb/CnRGg/YXmcu6scqmCC
         r3scl4YLlMuMGrLZJPg1LTzFXQDPnQ8ttyHzXFJoXp7gpFIf6yUzrvpiFv3hYiCWIBuE
         j/1mDG0IoHcBgvUL2mLxt16p55Y+zODpquTYbZld3EmpDWerem0YkwJDan28B2f19SwN
         hWftzE2O15VP4vgQYWeNZUqWGp3o4yqshTd7bLap1TwroOvIm5FQ/ZqEnK28D88mq2t4
         43fsWX247vX5Bi6Od37oCunxlm4Qm0pS1aV778oxw8kjl0dYZ9amOQ6FwnMzyMNcK9S7
         cn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UbvMCu0XnVUIatC5HjOpWZoBH39srdxVv2oZXv9o6kg=;
        b=CPPEKY0ZtAC/OEsPjusPYtkr+qFicNpqpAtfWHGKIwyUmPeLrl2/D7ubNcn72Kaq4T
         mIZakln16zFIY4K+FdUWerPNmlJLjGsyrV561Nb1KsNVw05AahgrvmgCS5J0qBkQ3oD9
         k43O9R5xBgyeZBSK0OC186nbiAPFkFgQdlPKXLSsbHSd7g/JUT+DDNhujLIeWepY5hTc
         BEwGe8tGzl3QX96X+Z+q4ZsIqtQjdH7pBwrgxK0SUSR/Fkpl7VGVDL/U8a6VZmPDZy0D
         dNbLrfp5Xj7aUPLy77lYtOEAkxdzecaS6Ri1YkOMO7bSIehgv69E7C5QGqU3GrPzq0Qq
         cIkQ==
X-Gm-Message-State: ACrzQf3b0hgZVYZYq0A23CIwvygLvp71ahmiBwGlv560rFIVvC1s1WYY
        IN+S13DeQeehA50IdLcfOf7DREPXvDEH+ipx0QwLiiFBEps=
X-Google-Smtp-Source: AMsMyM6hVsd0XuPZrTHBzn4zdOlZacCWPRU8taK43Sx8zFOnaVmfTWG0mjGTGIJEKfua9jpsDaq/9is3dQ8xuF/d8wI=
X-Received: by 2002:a62:1a97:0:b0:562:5587:12d6 with SMTP id
 a145-20020a621a97000000b00562558712d6mr333112pfa.37.1666051507409; Mon, 17
 Oct 2022 17:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <Y0mSVQCQer7fEKgu@kroah.com> <20221014171040.849726-1-ndesaulniers@google.com>
 <70a859bc-a33b-79f5-6f44-5cccfb394749@gmail.com>
In-Reply-To: <70a859bc-a33b-79f5-6f44-5cccfb394749@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 17 Oct 2022 17:04:55 -0700
Message-ID: <CAKwvOd=L7i6iMZ6CRKWpY1yzg5QZj5FM7Rd1HtVFj-6J-qdPtQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: process: replace outdated LTS table w/ link
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>,
        Sasha Levin <sashal@kernel.org>, Tyler Hicks <code@tyhicks.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 14, 2022 at 7:06 PM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> On 10/15/22 00:10, Nick Desaulniers wrote:
> > The existing table was a bit outdated.
> >
> > 3.16 was EOL in 2020.
> > 4.4 was EOL in 2022.
> >
> > 5.10 is new in 2020.
> > 5.15 is new in 2021.
> >
> > We'll see if 6.1 becomes LTS in 2022.
> >
> > Rather than keep this table updated, it does duplicate information from
> > multiple kernel.org pages. Make one less duplication site that needs to
> > be updated and simply refer to the kernel.org page on releases.
> >
> > Suggested-by: Tyler Hicks <code@tyhicks.com>
> > Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> Should this patch be backported to all stable releases? I see Cc: stable
> on message header, but not in the patch trailer.

I don't think so; unless people read stable versions of the
documentation rather than HEAD?
Perhaps I didn't need to cc stable, but I think that's ok for
notifying people who are interested in stable, not necessarily
strictly for backports?
Either way, thanks again for the reviews+suggestions.

>
> >  Some kernels are designated "long term" kernels; they will receive support
> > -for a longer period.  As of this writing, the current long term kernels
> > -and their maintainers are:
> > -
> > -     ======  ================================        =======================
> > -     3.16    Ben Hutchings                           (very long-term kernel)
> > -     4.4     Greg Kroah-Hartman & Sasha Levin        (very long-term kernel)
> > -     4.9     Greg Kroah-Hartman & Sasha Levin
> > -     4.14    Greg Kroah-Hartman & Sasha Levin
> > -     4.19    Greg Kroah-Hartman & Sasha Levin
> > -     5.4     Greg Kroah-Hartman & Sasha Levin
> > -     ======  ================================        =======================
> > +for a longer period.  Please refer to the following link for the list of active
> > +long term kernel versions and their maintainers:
> > +
> > +     https://www.kernel.org/category/releases.html
> >
>
> LGTM, thanks.
>
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
>
> --
> An old man doll... just what I always wanted! - Clara
>


-- 
Thanks,
~Nick Desaulniers
