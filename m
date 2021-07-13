Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10EE5C07E95
	for <linux-doc@archiver.kernel.org>; Tue, 13 Jul 2021 21:04:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD13060FED
	for <linux-doc@archiver.kernel.org>; Tue, 13 Jul 2021 21:04:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235536AbhGMVGw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Jul 2021 17:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234765AbhGMVGw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Jul 2021 17:06:52 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85491C0613DD
        for <linux-doc@vger.kernel.org>; Tue, 13 Jul 2021 14:04:01 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id u14so160324ljh.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Jul 2021 14:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0/WzDWmZUq8jX07GulngkcAUpVh4+cRWNFXLGvNWEeI=;
        b=EcEjIIgQMnPfw3kb3KLbeGApDG4e53k159at93bSWI/G3rcs8agKmkFnyWlj64JjSs
         1V0oqyXuyLZqCVUwBRYlGq4mMsc0KeLco5nUrr8LWqo1p6SlsBut4z4ZATD6Gp+jGjMA
         tmpcDv5Xm/v7mNQuRGh5BCs8ywWxgw4va4ciRZ5NTmWr+YncMNtETWMIT1+gZt/fXaA0
         9/60S1/bCEZBTUdC8FyMSr04MaXWm7pFI215a7zwwIgS2wPCKlLvaLTWnuFSvlOZmK9c
         CIkJpOPP66lsxPTCMs47Uv/5SVWPro87N7+MC4nJIi0x3KBNHl8XRj/n0VBcJM4JsbIn
         fAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0/WzDWmZUq8jX07GulngkcAUpVh4+cRWNFXLGvNWEeI=;
        b=VEdA2lPu+/KkRAiwUM05TIsUQHPjCnqcNAyK9IXZaRtW36MF5Of/DACS/w6AYU2Rsu
         tSbV/eFcjioXcYfT/giZxpnNy93Losh2ju5Y2WW2r+BNBOz42Eo0JpsXrBIpjRc81Lqu
         DCmqwyrxn/rK3nfJwq7dyHay3/v3bNUBmlU2UP4OAntm6m5KL0XOlG56MBwfYxAK1gxI
         cMvvcJwP7nLhq+QA0nSx9C8KkjgWtfjebr7LId0102TwKtrX/gYmtGZf85WR7c4efUre
         kT0fzf+2rYD06OkXXGYe8eHXuKZBp+Ubxg2/nYCt4cy/9KLYMD+LiroFqV0UgKHjugOK
         Zz0Q==
X-Gm-Message-State: AOAM533VpypdXi2PqKAv/fgO+oXtBXvjoyLKXNR+dqaEusSh1vFHPXFb
        iByvI/mJ2VYZ6FyqTHq2l5Z0d0vTPyxK1YUT3x4a+g==
X-Google-Smtp-Source: ABdhPJxejiVBTFHqJSReqWobCTdyXBoqP09rUgnZRGuUJ0BDPBL7l/yP5EGzb2L9O7fWjR1kVxCSdLoVbVmALPmrNdk=
X-Received: by 2002:a2e:a22c:: with SMTP id i12mr5959649ljm.267.1626210239553;
 Tue, 13 Jul 2021 14:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210601183002.26176586@canb.auug.org.au> <CACK8Z6Fp-_oRkC-dQ4U5y6ZUrr7Q3U084PiP+Q9daYstpps+aA@mail.gmail.com>
 <YLosn8r6pg4AUC14@kroah.com>
In-Reply-To: <YLosn8r6pg4AUC14@kroah.com>
From:   Rajat Jain <rajatja@google.com>
Date:   Tue, 13 Jul 2021 14:03:23 -0700
Message-ID: <CACK8Z6GGXXv3G6po5Adfsw7=vHMij7Cpxu2mwjRmCDT70mkGhw@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the usb tree
To:     Greg KH <greg@kroah.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

+linux-doc@vger.kernel.org
+Jonathan Corbet

Hi Jonathan / kernel-docs people,

On Fri, Jun 4, 2021 at 6:37 AM Greg KH <greg@kroah.com> wrote:
>
> On Tue, Jun 01, 2021 at 10:39:42AM -0700, Rajat Jain wrote:
> > Hello,
> >
> >
> > On Tue, Jun 1, 2021 at 1:30 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Hi all,
> > >
> > > After merging the usb tree, today's linux-next build (htmldocs) produced
> > > this warning:
> > >
> > > Documentation/ABI/testing/sysfs-devices-removable:2: WARNING: Unexpected indentation.
> > > Documentation/ABI/testing/sysfs-devices-removable:2: WARNING: Block quote ends without a blank line; unexpected unindent.
> >
> > I'd be happy to send a patch to fix this, but I didn't really
> > understand what needs to be done.
> >
> > Here is the relevant documentation update in the patch:
> >
> > +What:          /sys/devices/.../removable
> > +Date:          May 2021
> > +Contact:       Rajat Jain <rajatxjain@gmail.com>
> > +Description:
> > +               Information about whether a given device can be removed from the
> > +               platform by the user. This is determined by its subsystem in a
> > +               bus / platform-specific way. This attribute is only present for
> > +               devices that can support determining such information:
> > +
> > +               "removable": device can be removed from the platform by the user
> > +               "fixed":     device is fixed to the platform / cannot be removed
> > +                            by the user.
> > +               "unknown":   The information is unavailable / cannot be deduced.
> > +
> > +               Currently this is only supported by USB (which infers the
> > +               information from a combination of hub descriptor bits and
> > +               platform-specific data such as ACPI).
> >
> > I'd be happy to send a patch if you can point me what needs to be done
> > (or let Stephen / Greg / some one else do it if it is easier to just
> > do it instead of guiding me).
>
> I do not know what the "right" thing to do here is, sorry.  Maybe one of
> the kerneldoc people know?

Can someone familiar with the documentation and html docs let me know
what is wrong with Documentation/ABI/testing/sysfs-devices-removable
that is resulting in this warning when doing "make htmldocs":

> > > Documentation/ABI/testing/sysfs-devices-removable:2: WARNING: Unexpected indentation.
> > > Documentation/ABI/testing/sysfs-devices-removable:2: WARNING: Block quote ends without a blank line; unexpected unindent.

I looked at the file line number 2 and it just seems inline with other
similar files in that documentation folder.

Thanks,

Rajat

> >
>
> greg k-h
