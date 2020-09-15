Return-Path: <SRS0=ug/q=CY=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32356C433E2
	for <linux-doc@archiver.kernel.org>; Tue, 15 Sep 2020 01:31:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC07620829
	for <linux-doc@archiver.kernel.org>; Tue, 15 Sep 2020 01:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600133465;
	bh=VU0OK2LWGruSNZasL11qA0AQkWN8qmHCbUlaczNzHWY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-ID:From;
	b=GvecaiEK+MubkPY6oh8u3Vc/Xu8xU4AWiEJXRKEz7jenWpKwSTMn0TL4Zr282uWmS
	 dpxJPf034yu+bfy2llKjP9+5+/1bdoAd2ddlVQ29rHbBXvULKn7HT/hTnLXq+RmhRB
	 4/Lze5rUNQIYEuPx0YA4D5bnpwWfIB8WPrP0gwEg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgIOBbC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Sep 2020 21:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgIOBav (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Sep 2020 21:30:51 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F972C061788
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2020 18:30:51 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id u8so1357255lff.1
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2020 18:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=m3o6b/k3yrLqkCmTP0xXwX/jdoe71VYTinCKqcJ05H4=;
        b=AkADhMHXxgOTVfD0/TUy1c3LAkpeOQnfCV2MItm1Z6Iw+jFEC4vf500mHsod8UW7i6
         FGk3rgliqSsPwPXJ6T5RzwgnApeTfQXWOtqjEKJfY4jAEv6WFPx01kBikJXCfMTYj0xM
         ZMfG93srm+NVJ1gpKRjz8FvCpP51YHU4OLUbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=m3o6b/k3yrLqkCmTP0xXwX/jdoe71VYTinCKqcJ05H4=;
        b=p/9+zfL2CivHYeupkGogWc+DFTja1cDCuY3Mn1aF+ZVIv2h3t6L5CJPbE0dGaEMHY9
         CBpSabTGoIIDUMM6znleASr4XQ0b147J4Y4QmAYPvnCyFXp09z7rCjvRYYLL8WmEq2J7
         fRrB9/f0hT53j4bMK2ZmqS9D+tQavKTCqpr0a6cEswF4G9u6ReuuMGEXY297E49PeJ9K
         lcpERzobJOKvFgw3834T6O1TwfkeoPwOPqQRMCvqzQUpW5gi1lOoBLjIZwpO7neOnmsV
         aYmLAl5ocyHyGELSB8LNjiFxj6iRnuAYwmccAggLxF3SNHd/3IeysMRLnONfebdedRN6
         srfA==
X-Gm-Message-State: AOAM533wGQ4ZlkK2uouR0yaOYUhlDGHc9omhZ4UFWhC0AQ01Q0OGm9sS
        uf64jKrwW6CLeDDzaPWQ7YMLj+P1WzRcTg==
X-Google-Smtp-Source: ABdhPJzvJQyGZgN7BPmaqHVWlvmTFhJliYdcBJN4Gj31kBiAnHFVj0FZ3cW/QpLFCpcHJEhbnfXadQ==
X-Received: by 2002:a19:905:: with SMTP id 5mr4539045lfj.497.1600133449337;
        Mon, 14 Sep 2020 18:30:49 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id f207sm4047425lfd.47.2020.09.14.18.30.47
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 18:30:48 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id s205so1314501lja.7
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2020 18:30:47 -0700 (PDT)
X-Received: by 2002:a2e:84d6:: with SMTP id q22mr5453216ljh.70.1600133447386;
 Mon, 14 Sep 2020 18:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <git-mailbomb-linux-master-50145474f6ef4a9c19205b173da6264a644c7489@kernel.org>
 <c9cd22ec-60dc-d761-b488-d3a1392708c0@infradead.org> <20200915012800.GA17809@Gentoo>
In-Reply-To: <20200915012800.GA17809@Gentoo>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 14 Sep 2020 18:30:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjRDiiqq558v-uqyzSbU2GCL0noxu8gjCW8J3NWXEJBLA@mail.gmail.com>
Message-ID: <CAHk-=wjRDiiqq558v-uqyzSbU2GCL0noxu8gjCW8J3NWXEJBLA@mail.gmail.com>
Subject: Re: fbcon: remove soft scrollback code (missing Doc. patch)
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Yuan Ming <yuanmingbuaa@gmail.com>, Willy Tarreau <w@1wt.eu>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        NopNop Nop <nopitydays@gmail.com>,
        =?UTF-8?B?5byg5LqR5rW3?= <zhangyunhai@nsfocus.com>,
        Andy Lutomirski <luto@amacapital.net>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 14, 2020 at 6:28 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
> Documentation/admin-guide/kernel-parameters.txt:        no-scroll       [VGA] Disables scrollback.

So this one at least should be still valid.

But these:

> Documentation/fb/fbcon.rst:2. fbcon=scrollback:<value>[k]
> Documentation/fb/fbcon.rst:     The scrollback buffer is memory that is used to preserve display
> Documentation/fb/matroxfb.rst:   with 'video=scrollback:0'.
> Documentation/fb/sstfb.rst:  disable software scrollback, as it can oops badly ...
> Documentation/fb/vesafb.rst:            * You'll get scrollback (the Shift-PgUp thing),
> Documentation/fb/vesafb.rst:              the video memory can be used as scrollback buffer

now look stale.

            Linus
