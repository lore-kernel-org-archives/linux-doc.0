Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D046A7D089
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 Jan 2019 15:52:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728140AbfADPwr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 Jan 2019 10:52:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:40114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726232AbfADPwr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 4 Jan 2019 10:52:47 -0500
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 56E1C218CD
        for <linux-doc@vger.kernel.org>; Fri,  4 Jan 2019 15:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1546617166;
        bh=WFh4JNP6F3nqBbkQ9USaQY+dQ32FRKzyrKe7tbeefw4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lKOWr/1QLXRZKD5DZOUUkZzPe3uzPU767zp13XeOYFIZ6xxlTypqRz2Ir8747Tp9R
         gDhLi0rzZHM9xBgMbTK3ZIDSj+HzKnYI3SdCPiV4af/ucrr3jfnLZDm8h93Q2hPjuV
         T2rucEiQe9DxneK/uM86W9F98KIh1Cr1DdAyRUzI=
Received: by mail-qt1-f178.google.com with SMTP id r14so40879800qtp.1
        for <linux-doc@vger.kernel.org>; Fri, 04 Jan 2019 07:52:46 -0800 (PST)
X-Gm-Message-State: AJcUukenUGIKfVlBo4aWkQD+WrQhinc+z3k4F+h/DSWzty8JyAlk3MXs
        boBeVyLOVKTHwB5UYCz5GfLnEF1XN0oC20LF3Q==
X-Google-Smtp-Source: ALg8bN5SxOl0bqSeYTgrtLpZ6OZ6eJCtBxm2UWb7QQPjhJhB7Q5XJS/c7zBGWKFN/AcUkh/PZsjM8aYpklZbrmLOLz0=
X-Received: by 2002:a0c:f212:: with SMTP id h18mr51882065qvk.106.1546617165538;
 Fri, 04 Jan 2019 07:52:45 -0800 (PST)
MIME-Version: 1.0
References: <cover.1546457946.git.ottosabart@seberm.com> <e37cabca16342ce3889957b606274e6588254682.1546457947.git.ottosabart@seberm.com>
 <CAL_JsqJW=zxvsptwEh94KP7rEMMgj_HKZ7zTVtC2y_wno_jPHw@mail.gmail.com> <20190104092640.GA21106@personal>
In-Reply-To: <20190104092640.GA21106@personal>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 4 Jan 2019 09:52:33 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJE--1-_tMbiS8a0GStfc-H7kQTyy-sn4QLyCb7eVj+pw@mail.gmail.com>
Message-ID: <CAL_JsqJE--1-_tMbiS8a0GStfc-H7kQTyy-sn4QLyCb7eVj+pw@mail.gmail.com>
Subject: Re: [PATCH 3/8] doc: bindings: fix bad reference to ARM CPU bindings
To:     Otto Sabart <ottosabart@seberm.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Jiri Kosina <trivial@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 4, 2019 at 3:26 AM Otto Sabart <ottosabart@seberm.com> wrote:
>
> On 03. Jan (Thursday) v 14:53:38 -0600 2019, Rob Herring wrote:
> > On Thu, Jan 3, 2019 at 1:04 PM Otto Sabart <ottosabart@seberm.com> wrote:
> > >
> > > The primecell.txt and cpus.txt files were converted into YAML. This
> > > patch updates old references with new ones.
> > >
> > > Fixes: d3c207eeb905 ("dt-bindings: arm: Convert primecell binding to json-schema")
> > > Fixes: 672951cbd1b7 ("dt-bindings: arm: Convert cpu binding to json-schema")
> > > Signed-off-by: Otto Sabart <ottosabart@seberm.com>
> > > ---
> > >
> > > As suggested by Jon Corbet, I am *resending* this patch once again to
> > > correct maintainers. There are no changes in the code since my previous
> > > e-mail.
> >
> > Please use scripts/get_maintainers.pl so you get the right lists too.
> >
> > >
> > > Please review.
> >
> > Am I supposed to apply? I don't have a clue because I've only gotten patch 3.
> >
>
> Hello Rob,
> the thing is I messed up and I sent this series of patches to Jon and
> linux-doc list only.
>
> Unfortunately these patches touch multiple subsystems so I now have to
> get them to correct maintainers.
>
> What is the best thing I should do now? Should I resend (with "RESEND
> PATCH" prefix in subject) *whole* series of patches to right maintainers
> and lists returned by get_maintainer.pl?
>
> In my case this scripts returns ~60 names and lists. I suppose it is not
> the right thing to spam all of them... or is it?

That's probably because you're including commit signers which normally
you shouldn't (use --nogit-fallback). Typically, you would only add
commit signers if they are the author of what you are fixing (but that
is me in this case). If you get multiple maintainers of different
subsystems, then that's often a sign that a patch should be split up
(though there are exceptions).

Also, if there's not any inter-dependency between the patches, then
they don't need to be in a series. If a single maintainer should apply
the patches, then they can be in a series. To put it another way, send
a series per maintainer whenever possible.

Rob
