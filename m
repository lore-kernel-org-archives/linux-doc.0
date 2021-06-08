Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B1BC47082
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 23:09:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 915AA6135D
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 23:09:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233618AbhFHXLY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Jun 2021 19:11:24 -0400
Received: from mail-pg1-f181.google.com ([209.85.215.181]:37887 "EHLO
        mail-pg1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbhFHXLY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 19:11:24 -0400
Received: by mail-pg1-f181.google.com with SMTP id t9so17811718pgn.4
        for <linux-doc@vger.kernel.org>; Tue, 08 Jun 2021 16:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tsOcayd7p5kwqaMZLuvyzUWjmMCtq6s6XW4ouQcpv3A=;
        b=QMsOr2yQt+lG5XNDYgmPFgMNQJAvua9p+XthSAPE+eIp8BKveU8h4RyuEA7ciOfD5d
         WDAite/miimuOfLX+uyImyaV5lmmPxMzbY5I5fr0A/R4E1newY8zeP6EJEhA+BGgtgIH
         +fD5lp0/HCXcUHXxIiI7AHmIbSQaNKlQ2AnRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tsOcayd7p5kwqaMZLuvyzUWjmMCtq6s6XW4ouQcpv3A=;
        b=DiM5FNmeKWLosA/7Imlz5OqXcXD+CHmyMadE/ddkx8PdTHqhWqHPvcOYtFzLCvvSnc
         PO9XibnZeMtTp1ofxtbHyQ9jygv/iUEsZsb1zhzfyAoD7MsINJSkFeImgbmc1X1F1L05
         80PzdRZfIDDyRE/Ib7S+hufn4PLsyUQ/Ppmtn8h1wznGlJp+xMW33g7Q+1OsT68s1tSu
         LsGpKwzKynWNcuhMRAt7sQ9xxtp5L4he54/ii++XVmn4uvgHyS0pMsMW4YmXic/+qPDo
         3NX5y9cWh5YB/BJCPuJgUUBbiZSMNTucJPo9eqoyfLZOolg1XKwnPgIPnvKEOjEJJV1e
         +YaQ==
X-Gm-Message-State: AOAM533qycPTSoARBuZSxnVZKbc1e58QWE5QH8jbc0nx4S5NFabgRhlF
        fwtrZKRFddYc+S1MaZygcKme9Q==
X-Google-Smtp-Source: ABdhPJxdn40QcfCA8eMkWU77J6EILIfV1TmIfUiG/sD+ni3fAblwXt+tWs27PX2+QOvKae8ApCvJxA==
X-Received: by 2002:a63:1a4f:: with SMTP id a15mr641484pgm.136.1623193695104;
        Tue, 08 Jun 2021 16:08:15 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h20sm11596260pfq.83.2021.06.08.16.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 16:08:14 -0700 (PDT)
Date:   Tue, 8 Jun 2021 16:08:13 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Vlastimil Babka <vbabka@suse.cz>, Marco Elver <elver@google.com>,
        Christoph Lameter <cl@linux.com>,
        "Lin, Zhenpeng" <zplin@psu.edu>, Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Roman Gushchin <guro@fb.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 0/3] Actually fix freelist pointer vs redzoning
Message-ID: <202106081605.929AF37@keescook>
References: <20210608183955.280836-1-keescook@chromium.org>
 <20210608135327.be8a120ba3b1686bc62e6d7e@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608135327.be8a120ba3b1686bc62e6d7e@linux-foundation.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 08, 2021 at 01:53:27PM -0700, Andrew Morton wrote:
> On Tue,  8 Jun 2021 11:39:52 -0700 Kees Cook <keescook@chromium.org> wrote:
> 
> > This fixes redzoning vs the freelist pointer (both for middle-position
> > and very small caches). Both are "theoretical" fixes, in that I see no
> > evidence of such small-sized caches actually be used in the kernel, but
> > that's no reason to let the bugs continue to exist, especially since
> > people doing local development keep tripping over it. :)
> 
> So I don't think this is suitable -stable material?

Yeah, I think it's -stable material, but I'd like some bake time in
-next just in case. zplin saw that there was a 2 * sizeof(void *) case
that existed in the kernel that would trip over the issue.

> It's a bit odd that patches 2&3 were cc:stable but #1 was not.  Makes
> one afraid that 2&3 might have had a dependency anyway.

#1 is entirely cosmetic. It should also be fine to put into -stable, but
since it had no operational impact, I figured it didn't need to be.

> So I'm thinking that the whole series can just be for 5.14-rc1, in the
> sent order.

Unless I'm missing something big, yeah, that would be my preference too.
(And -stable can pick it up then.)

-- 
Kees Cook
