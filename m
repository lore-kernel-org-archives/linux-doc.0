Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIMWL_WL_MED,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9E0CD7D57F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 23 Aug 2018 22:00:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727212AbeHXBcI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 23 Aug 2018 21:32:08 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43426 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727821AbeHXBcI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Aug 2018 21:32:08 -0400
Received: by mail-pf1-f193.google.com with SMTP id j26-v6so3497049pfi.10
        for <linux-doc@vger.kernel.org>; Thu, 23 Aug 2018 15:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b+h27LPcprQocjCXzwyehDLIiBbICE6D4+EJSkkbqYI=;
        b=A8FaLeGD7Ilpv0znAMTpGbu9k4120VJWcthSvn7G45K0T95Ae9JWS3LgQ+Ly2MSEaU
         h5kvr1c1WhwVDeDRoJe3IXLbTlusPkP7q9smcbL5Fq+97T6eJ/wpL0eHR3ab/gJpDKYB
         uZ/E4KLzY4NzAQzqracuCDI6R7NeJwniNYxT2emrW8GXwyUI5T3sRp8IZKQEHXfs/iWo
         /V67toxPBEQpJtZtUKsnNyfXGOOI8Una81JlQEyZYYrHb51gz+IDErR6pdAwKkR+11Sm
         IJU4vweq+UTxfOxd5gSBH6umjHZ151hkiaRDV/RZ9BrwtMLjP+09yrFLnl7zWMrXfyaK
         lTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b+h27LPcprQocjCXzwyehDLIiBbICE6D4+EJSkkbqYI=;
        b=ceV5h+c2Rnk1Fb70P9b8KO5a6ONQqZ/veRrHgceDqp8QkAPSefmd/6pkD+SiV+vNL2
         ExzjvIeIXevhmGZ6rDyR+Q7giTWg1eNtkoKIqUgqNGHTK88kWjHHpu/kvYT6k/vr2fsi
         7T8u8Hql5GuNDtUw2eLLO3/S26zee2EUyWrzPtjmT51w+c3pR+yuDX5/Tm1sW12J/QHp
         SKvlQNnm5S7hbZ0ZPNzaLv9l4FpbAKS6jQwbtGVvrEo7ajDrWIjIp4ev9GwdWxStU97H
         umF0R9aw0YtYa2AjFShwocHzOLZf4iECSQgsDyT0ODlGpN92KldOhVlH3VAC4j37zdlD
         qGQA==
X-Gm-Message-State: APzg51D++Q4FEZf14VejXg93Zy0Ky4BGEKvMn13KekzTAjVLWpFdVdy/
        gq3gTVlWA5DmlyMeHHTwDIobyj7XPxDTVsDIkIq7xA==
X-Google-Smtp-Source: ANB0VdbBBrcPU92m0/2YFJP9IZVM79GoT+En0U2vHWphYka12obobzno6e6iMmrxdIHoP85PeHbg3zQyo7GCVzwunQw=
X-Received: by 2002:a62:4b14:: with SMTP id y20-v6mr12042075pfa.93.1535061626767;
 Thu, 23 Aug 2018 15:00:26 -0700 (PDT)
MIME-Version: 1.0
References: <da5620dc7a2b9d33f2a0dd7f4dc3afdab5a66f26.1534795606.git.joe@perches.com>
 <CAMuHMdXPFgp5sLR5-UExEvxNbKSR5H--dk7KMit_XFSFN+1uHw@mail.gmail.com>
In-Reply-To: <CAMuHMdXPFgp5sLR5-UExEvxNbKSR5H--dk7KMit_XFSFN+1uHw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 23 Aug 2018 15:00:15 -0700
Message-ID: <CAKwvOdnNRfK+HiyjSv+OaK-wo5ExcFBc=nK-PMSEXiD0bu_11g@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum required gcc version to 4.6
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     joe@perches.com, Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        dave.hansen@intel.com, efault@gmx.de,
        Guenter Roeck <linux@roeck-us.net>,
        Rik van Riel <riel@surriel.com>,
        Kees Cook <keescook@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 23, 2018 at 2:52 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Thanks for your patch!
>
> I'm willing to upgrade. But there's one thing that's holding me back.
>
> Does gcc 8.x gives again the same warnings as my venerable old gcc 4.1.2,
> that no one else seems to see? Or will the real bugs I detect this way stay
> unfixed? Polyculture is a good thing, also in compilers.

Hi Geert,
Just for folks who may be missing context on this thread, like myself,
can you provide links to more information?  If I understand your
question correctly, it seems that warnings were removed from gcc since
4.1.2?  And that bugs have been caught by testing with gcc 4.1.2 (can
you provide commit sha's)?  I assume you've already discussed such an
issue with the gcc maintainers (can you provide links to those
discussions)?  Sorry, if this has already been discussed already on
LKML, but even a post that had all this information would be immensely
helpful in understanding your plight.

-- 
Thanks,
~Nick Desaulniers
