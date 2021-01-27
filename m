Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66EF4C433E6
	for <linux-doc@archiver.kernel.org>; Wed, 27 Jan 2021 04:47:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FFE62070C
	for <linux-doc@archiver.kernel.org>; Wed, 27 Jan 2021 04:47:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239544AbhA0Ep6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Jan 2021 23:45:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S317767AbhA0BUZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jan 2021 20:20:25 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ED92C06174A;
        Tue, 26 Jan 2021 17:11:21 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id v24so403597lfr.7;
        Tue, 26 Jan 2021 17:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IBgIKGl96dO2G/QCdWBSmqnevDXwJD1JJIM1datO2yw=;
        b=pb459qXHiznpB214pj2TwZBt0H2OX2kDbyn4W8Q59DqvuFOb2mXcDI1LUS6FEEQzHE
         dIB3O5IYQu3CdeXI/x2zsXHIXefHQlpkV8sQvnroMCvQAPnk8ueyH9yXvq7uIR/TGJbb
         MMp/H+t4uTo55d8FlxT9MwpHGQVx0LZd53YqEPlSBn/AbT8F4YHCRHIxx1DHB5Ab/b0z
         5OWw2H8frz9Odc9+tstlkvmhGA+8IkhJswl/riyHzTxfxBfiFmFHI1T+81CxQyuDbDxf
         tIYolnExwPbMu9puo9V1pvWH6bTaD3hdUQcoLG/Ho+ecE3o9qMWXLj46nEpB3B5g/oUL
         s/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IBgIKGl96dO2G/QCdWBSmqnevDXwJD1JJIM1datO2yw=;
        b=M+PL/RuXVCVt+iN5Xrqlz8RB/lWQrBLDgSdhkopASioxsUmzlm89OunP0MwTN7zp18
         NXVAvckqmL4hMTWKEJM9CONGMYcgFV3z2p/giHQZEi4Q5a+WkCeNgXLpE1BJQLuOLYR5
         5ll7cJkWfEK16j6h+YYZf5zz7DoqifmjTVNtu9z6cQg40HbWIfuTl9czbSaeLfnqkzFB
         hoQ7aycFp4LON8jN0jhAeChvIuICsWZGF6GCkJCx/2lucCP3BLCNmR/i9syspog1pv1A
         qd7z8vAUg2oru2EMg86FzXiqjET2DRFlpBXk6ZhftMfa+l5IlrAtwyqFUvZcaJSaPsZT
         Z+bQ==
X-Gm-Message-State: AOAM532QL5+/uIgUx4ZlS0sSOi15NacxLbxVwcdkpBoiTFVxkA9g8WjM
        VxM1fQpHuhW2LORRKSf5roRvUULRiHnHXuNgW5U=
X-Google-Smtp-Source: ABdhPJxae6EGAICnqt5xdFS+QeGHBG/qt7C/rjwsAgqzphrZ6mKvMlvXhmgOeYPQtJ2/s1a6RC2DALFo+C1seQmLZUY=
X-Received: by 2002:ac2:5e2a:: with SMTP id o10mr3681331lfg.349.1611709879839;
 Tue, 26 Jan 2021 17:11:19 -0800 (PST)
MIME-Version: 1.0
References: <20210126072443.33066-1-foxhlchen@gmail.com> <20210126072443.33066-2-foxhlchen@gmail.com>
 <YBAhFryculK1PmIJ@kroah.com>
In-Reply-To: <YBAhFryculK1PmIJ@kroah.com>
From:   Fox Chen <foxhlchen@gmail.com>
Date:   Wed, 27 Jan 2021 09:11:08 +0800
Message-ID: <CAC2o3D+W3AnV7cMnCPhd=BXVt-i7pbt6xba7Oy4Yg-DDRMUi5w@mail.gmail.com>
Subject: Re: [PATCH 01/12] docs: path-lookup: update follow_managed() part
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     corbet@lwn.net, vegard.nossum@oracle.com,
        Al Viro <viro@zeniv.linux.org.uk>, rdunlap@infradead.org,
        grandmaster@al2klimov.de, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 26, 2021 at 10:03 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jan 26, 2021 at 03:24:32PM +0800, Fox Chen wrote:
> > No follow_managed() anymore, handle_mounts(),
> > traverse_mounts(), will do the job.
> > see commit: 9deed3ebca244663530782631834e706a86a8c8f
>
> When referencing commits in changelogs, please use the documented way,
> which for this one would be 9deed3ebca24 ("new helper:
> traverse_mounts()").  That enables us to read and understand them
> better.
>
> thanks,
>
> greg k-h

Got it, I will wait to see any other things that need to be changed,
then send in v2 together.


thanks,
fox
