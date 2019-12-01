Return-Path: <SRS0=rOJF=ZX=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E25C432C3
	for <linux-doc@archiver.kernel.org>; Sun,  1 Dec 2019 14:28:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F405B2082E
	for <linux-doc@archiver.kernel.org>; Sun,  1 Dec 2019 14:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575210528;
	bh=23kRnY9l6hVzpnOefG+pIrRM6Q4rbbUBC993dsfYmbQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=txsgmASRSCtxEzYX3VBY7wsra8P/rB32wdtzl5eO5K1yNXwNY9J1F6yq/nU08r0Q3
	 qt9aJPgBavjLkRjD4XaA6INfrklv9HoaA7Oi5sBVlJKFKkV2DDEZlcC5zcjqvUYc9v
	 SSKI559ab828uS5+qKV7Dxvgawgg3IxU0xy9Y6eY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbfLAO22 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 1 Dec 2019 09:28:28 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40824 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbfLAO21 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 1 Dec 2019 09:28:27 -0500
Received: by mail-lj1-f196.google.com with SMTP id s22so17904027ljs.7
        for <linux-doc@vger.kernel.org>; Sun, 01 Dec 2019 06:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l+vQUnn8WZrN5mb0l4AFAbcnrvnGqD368BEzSK9vrjc=;
        b=baMDvJB6x8ri1qgpZoRR0QipjSxPz0EEG55lu0LWWNDGxqXr35SvhtHnTdr0mqJtTZ
         3XZYFpoAzcmAwtQ7IU63gh+QOVuRVOxxwtk+Bpp7Vxliv+9zRWXvpPLzbOFBknSXNohb
         RpAk8a5uQkYnRxanRCUziu0yMVd0+EBWtyUL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l+vQUnn8WZrN5mb0l4AFAbcnrvnGqD368BEzSK9vrjc=;
        b=TO4nQw+7NIgPhzQ2w7E/FEWgWVevB5Xovi+sUwuwiBKmsMhRme+dGCrwZb9TAxTLi5
         zfC+IWkn1wFQIIyNTD0jtdXmzOmeZ3akbz4BBiWZLGE4SB0vA9xkgRhqZEyWs33vKvGf
         LfJWRplMRpoXD8sbXZuPhJgCWOLLOt1TmkXVLhN4egvthCTAf2JvDdnSSDxi77+W2xLI
         MiBYArWhVSIR0rdyJnS6L3rnCQ8lwOhSpLUGbjtZbR+Y13XixwnufBmNwCSATSdLjjSd
         OZz48MNONGwOo/bGxTyzl1r/u6WKyWjdCFv+qytF62gLaLvjqhQHbcCdG3/hYdmi917O
         dZoA==
X-Gm-Message-State: APjAAAWR63lj1HeU7BYBVr1WKjmVVo+SqRNP+o3/oixcrkF86D5AdHRQ
        9CbeJqTxbFGt/YXXU7S7F5ivJbg4M+E=
X-Google-Smtp-Source: APXvYqwl2B8HNVHuXTFt6aHf12Y9HUCovYZ2qcj+3IL4hNamkpj38k9M+KQ8mjoPNk3hwUg2VaS9Cw==
X-Received: by 2002:a2e:7e07:: with SMTP id z7mr933008ljc.165.1575210504628;
        Sun, 01 Dec 2019 06:28:24 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id z26sm1527267lfq.69.2019.12.01.06.28.23
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Dec 2019 06:28:23 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id z17so131751ljk.13
        for <linux-doc@vger.kernel.org>; Sun, 01 Dec 2019 06:28:23 -0800 (PST)
X-Received: by 2002:a2e:63dd:: with SMTP id s90mr1932908lje.48.1575210502841;
 Sun, 01 Dec 2019 06:28:22 -0800 (PST)
MIME-Version: 1.0
References: <20191130180301.5c39d8a4@lwn.net> <CAHk-=wj8tNhu76yxShwOfwVKk=qWznSFkAKyQfu6adcV8JzJkQ@mail.gmail.com>
 <20191130184512.23c6faaa@lwn.net> <xmqqblss1rjp.fsf@gitster-ct.c.googlers.com>
In-Reply-To: <xmqqblss1rjp.fsf@gitster-ct.c.googlers.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 1 Dec 2019 06:28:06 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj9P8ukXOuTUnpkPNwc8B683Z0Za=-WxpLygMbjEtNxgA@mail.gmail.com>
Message-ID: <CAHk-=wj9P8ukXOuTUnpkPNwc8B683Z0Za=-WxpLygMbjEtNxgA@mail.gmail.com>
Subject: Re: [PATCH] Documentation: networking: device drivers: Remove stray asterisks
To:     Junio C Hamano <gitster@pobox.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Git List Mailing <git@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Nov 30, 2019 at 10:35 PM Junio C Hamano <gitster@pobox.com> wrote:
>
> OK, so it appears that the tool is working as documented.

Well, yes and no.

I think it's a mistake that --no-keep-cr (which is the default) only
acts on the outer envelope.

Now, *originally* the outer envelope was all that existed so it makes
sense in a historical context of "CR removal happens when splitting
emails in an mbox". And that's the behavior we have.

But then git learnt to do MIME decoding and extracting things from
base64 etc, and the CR removal wasn't updated to that change.

I guess "documented" is arguable in the sense that the git
documentation does talk about "git-mailsplit" as an implementation
detail, but still..

             Linus
