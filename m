Return-Path: <SRS0=ug/q=CY=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220D8C43461
	for <linux-doc@archiver.kernel.org>; Tue, 15 Sep 2020 01:29:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7333212CC
	for <linux-doc@archiver.kernel.org>; Tue, 15 Sep 2020 01:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600133381;
	bh=AajRAHhWQqZjkUMC6tZDm0wzbYJOy+YM2JhxAgBSi0I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=NpDwi8gqqsscmo9lpvbUuk8sS8RHyX7JYi9bMdeAlB4nLwEUtj+H18uxrfnjacTJL
	 HyUC9kh/k5F/UONdsxMltyQYTlTz/xHWgTQQNgRqc8aUkEM+DnIboacndCIXNmfHP4
	 VJIT9TNg4NYWrdwaaPk6ggJ0PrfK6N3O4qvZgh1I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbgIOB3C (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Sep 2020 21:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbgIOB2y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Sep 2020 21:28:54 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE3ACC06174A
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2020 18:28:53 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id u4so1290258ljd.10
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2020 18:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g8g7vNyQA2/Pw0tWaZWsWIsCkIJV7KkgdjAjjJ3LiIA=;
        b=dKnH8ELsfJPyh3Zg9ToOYk9CfNz9CdtSk8KF08KfKGI0a52tNfsMYHsE2FAFTsHtMv
         cc1oYGKBLR4xu/hoijEWb2pMF2xovh4BBeQOin5/ugJ/2hx6bbJpzgxhxqxbCDteZtU1
         QaaWohpdPi5YCef37W/yqDq49kBUdeBelWIZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g8g7vNyQA2/Pw0tWaZWsWIsCkIJV7KkgdjAjjJ3LiIA=;
        b=LYkQbQje0uH7VIKhQb6BFvRQAipyVeCZ/OLccH768mWeHc3wi9NHFYXODsaRP0YV++
         NYZgztPybTnzIfuBSPFyO9GVC5KPvL/fItfJ09E2pVS9CNLTu/+mmzNzgk4A+u5NNQ/S
         G45xC0HIofHX9qMm65OoW7ZLn+U3RJIE/qcxdGS8yzS6JkUgI69CgH8LBLSHVkQPdjWa
         fBXZAHmGcetRqzAWpXRIjIsYTvC4SPGslNgzsEE33Yq0pWMJf4mtGsw3PNcKj+jiDXua
         LJL7pLTJST5lPOR513Xcqib0agyFykVTJSmZkMF9r/lojOB5NnkNZOJgaI2mt13EEkws
         jy2Q==
X-Gm-Message-State: AOAM530xxt9CrtdAnKas5FKGsam7UY3cLFCwAKKgGFc3RRlxfomOcu81
        G2XiFbAiqAO3l+5pr87NZbBy84AYkFEBRg==
X-Google-Smtp-Source: ABdhPJwAQHgQLjb5171ke2ipUai+EJRgEJtGY2Tq2YjEAlDQTxp4exotIfknJHPi+e5M3qw6kuOKvw==
X-Received: by 2002:a05:651c:124c:: with SMTP id h12mr5721658ljh.208.1600133332020;
        Mon, 14 Sep 2020 18:28:52 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id q13sm3619995lfa.286.2020.09.14.18.28.51
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 18:28:51 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id u8so1353710lff.1
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2020 18:28:51 -0700 (PDT)
X-Received: by 2002:ac2:4ec7:: with SMTP id p7mr4631661lfr.352.1600133330815;
 Mon, 14 Sep 2020 18:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <git-mailbomb-linux-master-50145474f6ef4a9c19205b173da6264a644c7489@kernel.org>
 <c9cd22ec-60dc-d761-b488-d3a1392708c0@infradead.org>
In-Reply-To: <c9cd22ec-60dc-d761-b488-d3a1392708c0@infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 14 Sep 2020 18:28:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiNTWpqUF0HgzoyPGEaaAjxD-Bor+EE3DbJ52S30cfCWg@mail.gmail.com>
Message-ID: <CAHk-=wiNTWpqUF0HgzoyPGEaaAjxD-Bor+EE3DbJ52S30cfCWg@mail.gmail.com>
Subject: Re: fbcon: remove soft scrollback code (missing Doc. patch)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Yuan Ming <yuanmingbuaa@gmail.com>, Willy Tarreau <w@1wt.eu>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        NopNop Nop <nopitydays@gmail.com>,
        =?UTF-8?B?5byg5LqR5rW3?= <zhangyunhai@nsfocus.com>,
        Andy Lutomirski <luto@amacapital.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 14, 2020 at 6:19 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Now someone can remove the documentation for scrollback (and "no-scroll")...

Note that scrollback hasn't actually gone away entirely - the original
scrollback supported by _hardware_ still exists.

Of course, that's really just the old-fashioned text VGA console, but
that one actually scrolls not by moving any bytes around, but by
moving the screen start address. And the scrollback similarly isn't
about any software buffering, but about the ability of moving back
that screen start address.

Do people use that? Probably not. But it wasn't removed because it
didn't have any of the complexities and bitrot that all the software
buffering code had.

That said, I didn't check how much of the documentation is for the VGA
text console, and how much of it is for the actual software scrollback
for fbcon etc. So it is entirely possible that all the docs are about
the removed parts.

              Linus
