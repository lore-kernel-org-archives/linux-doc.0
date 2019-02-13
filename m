Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 04EF67D912
	for <lwn-linux-doc@archive.lwn.net>; Wed, 13 Feb 2019 18:23:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729458AbfBMSW0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 13 Feb 2019 13:22:26 -0500
Received: from mail-yw1-f45.google.com ([209.85.161.45]:44672 "EHLO
        mail-yw1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728875AbfBMSW0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Feb 2019 13:22:26 -0500
Received: by mail-yw1-f45.google.com with SMTP id x21so1260082ywx.11;
        Wed, 13 Feb 2019 10:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dg3RdrX+6wa29rJnwRD1inxjW4WOCRgTGsRiDy4Ng9c=;
        b=NuHsL9KcvErT3WBt4KXyotmjlW7RA+xy+sqeZMZ7mwc1KxMpeuTp3wUGmVwFzQR0uw
         Jzenl1iH69I2K957dlQ9fp48fb3W/l53KBnG56u1lD/Z1O2edcFRl6U2hIepzGfZAaPv
         6YyBDLWtYtUZR+X62BAI3NYjjmyUZ6v3ZK+N6hTKNynIpHnJ7UHiMkC40B6A4WD/4DPI
         w/PWGEOj0g90sWz3MLhyGUIUpGJLBdMtRaRGUD4E+UC4hRPAXqOs2AKJD1s/Fqk9AsTF
         lihignpO9p6v5LGpC54uMLreZqJDTbP5KFgoJQ6dLFEgNjoZ+cWF0oy0GyRVv2VkZt/o
         fnxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dg3RdrX+6wa29rJnwRD1inxjW4WOCRgTGsRiDy4Ng9c=;
        b=gKm41WeYB38MzYTX1DSbLODoUWe8x/njL3xbxGFvxN6ubcn0b+xpi3ElNEDoU6s9pc
         oc8/FXDJVADAxzeQasKsLsiJSCuaRB1WOOh+rDI2zMuz4KIpf3JVx/qj+sLu24fGt22S
         oXD4Q0g4zwMp/2FANHZF/au0/FzduV6xkCYBD9+aDDewFQ5wfLC4JzcurM5JpfhSI0PX
         +L5MdBmApSN0FuJxAzU8HCVInj45fKWErxcyepeytdgiGBpns+6zJwrYZkAfz5ID2n82
         9gBptYBE7PVdDpItLCWByAGOb3lod3NiHvJauuJIYV2HFJpp0I5sFRmE54f/IgApuLGv
         yeDQ==
X-Gm-Message-State: AHQUAuarLeBMV/04t+AI0/dRpW82XtzgAK7xC93nF4nOmL5MpbaP/Q94
        wp4jq2ENBje6foJagrozlMtXUc72eLFL+vJDFlE=
X-Google-Smtp-Source: AHgI3Iac7yYgZTCP0I9ogeVU0fH9DXbbmgQ8zOTY0qasRz1ct6iCERWIRwlinMtBc8jQ9muc5TLoFe4BEOWnjZ/yL6k=
X-Received: by 2002:a81:5509:: with SMTP id j9mr5937704ywb.409.1550082144799;
 Wed, 13 Feb 2019 10:22:24 -0800 (PST)
MIME-Version: 1.0
References: <CA+EzBbDyoPF8=mZyG8HQAoHTm4h4MSCe=5WX_SBqRwPej=4uFg@mail.gmail.com>
 <CAOQ4uxh7OayzbGFk0cxoZf_t9jGxesv9k6zPPOA=+5MDsqWOzA@mail.gmail.com> <CA+EzBbC5c-O0ZBuC+UaL7Ftp2Vh8K8d46_6HTBWetY2Otd=tiA@mail.gmail.com>
In-Reply-To: <CA+EzBbC5c-O0ZBuC+UaL7Ftp2Vh8K8d46_6HTBWetY2Otd=tiA@mail.gmail.com>
From:   Amir Goldstein <amir73il@gmail.com>
Date:   Wed, 13 Feb 2019 20:22:13 +0200
Message-ID: <CAOQ4uxi=riQHbaaBxK64SdWdQ1bbHPrPTyXaoOrinG1zggK5gQ@mail.gmail.com>
Subject: Re: Documenting the crash consistency guarantees of file systems
To:     Jayashree Mohan <jaya@cs.utexas.edu>
Cc:     fstests <fstests@vger.kernel.org>, "Theodore Ts'o" <tytso@mit.edu>,
        Filipe Manana <fdmanana@gmail.com>,
        Dave Chinner <david@fromorbit.com>, Chris Mason <clm@fb.com>,
        Vijaychidambaram Velayudhan Pillai <vijay@cs.utexas.edu>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 13, 2019 at 7:06 PM Jayashree Mohan <jaya@cs.utexas.edu> wrote:
>
> Hi Amir!
>
> Thanks for putting across your thoughts on this. Your suggestions
> definitely make sense, and we'll compile these information and submit
> a patch for review.
>
> When it comes to strictly ordered metadata consistency, to the best of
> our knowledge only xfs claims to provide it explicitly. In ext4,
> delayed allocation and fsync of a file not persisting all its hard
> links[1] are examples of violation to the strictly ordered metadata
> consistency right?

No, I don't think they are.
At least that is not how understand what Ted wrote.

> And for btrfs, they don't seem to explicit about
> providing such semantics. Look at this thread[2] for example, owing to
> the lack of specification, btrfs does not commit to providing such
> guarantees.

The discussion is not about ordered metadata, is it about what
fsync(file) should do. They are related if we decide that fsync(file)
should persist nlink, but I think all fs maintainers are in agreement
that it doesn't matter and btrfs choice is as valid as ext4/xfs choice.

That said, I don't know if btrfs does strictly ordered metadata or not.
Order metadata means if user does op A then op B, you should not be
able to see consequence of op B after crash without seeing the
consequence of op A.

Can you give a counter example for btrfs? for ext4?

The different fsync() guaranties in different filesystems confuse you
because if you expect fsync() to persist op B, then you expect op A
to persist as well, but it may be the former (fsync) expectation that is
failing and not the latter (ordered).

Thanks,
Amir.

>
> [1] https://www.spinics.net/lists/linux-btrfs/msg77340.html
> [2] https://www.spinics.net/lists/linux-btrfs/msg76957.html
