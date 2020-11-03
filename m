Return-Path: <SRS0=f+/j=EJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F296C2D0A3
	for <linux-doc@archiver.kernel.org>; Tue,  3 Nov 2020 21:18:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04186206DC
	for <linux-doc@archiver.kernel.org>; Tue,  3 Nov 2020 21:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604438336;
	bh=eLrfNY/hgAWkwHTJ0KShqp9eLhssyAC5BgVZTd69QAI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=iBoov9aZuMEjLsGggw3QwPDfj9FFuRYSbK51zq+8ZW1A6kF0Mlj9wjDc8PsqcrgEN
	 yJYIEQRj4BPllEaUoqYFNPpoUZ+4FXynfsftE8g/sEu33cU4IzDHpWI69iEDpbcGgn
	 kcpYxqKXBAJqtHjRqyqSEIaxpTrF7sSgDBWzsU3M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388993AbgKCVSz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Nov 2020 16:18:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388551AbgKCVSr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Nov 2020 16:18:47 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6424DC0617A6
        for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2020 13:18:47 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id y184so22238862lfa.12
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2020 13:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x1oznCzOsfgXOnjkPl5WF72YkAccBrOZyur/fVTJggM=;
        b=UsJWIiTtAjnFwwv9bApjy2GgCUu0iWbipJntRxQ6dEMLm/5hQFlYzx3Z6xGETmnheM
         B7JlGY+lLtiGBnD0phF7JVug3zOEtgz5GP0Kz+9uTq5kvb+twlgPsPfsuywtXAFYWuqi
         eeaItfZdMpLcVhi/fbUDjY3vh0yHHGCIJmC2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x1oznCzOsfgXOnjkPl5WF72YkAccBrOZyur/fVTJggM=;
        b=sHr8LZTYsxVotdOLvmmliKCosnbLCnLFdBOQ0xzSt29oj3ibKaw4tDAqbuqnTefA1j
         h3VQRRdQDGxNn3/cTmo0moxHEau+wICD47GIG2nnvz1Bxr7Mqf9MOcdJROXDK/E9GfnV
         kcAddJyuTBKVoNMSXwvWY893ppjzapAcRCjz+nkpeLTwf7kKxGC0fpj1UEoAXd7OfRGs
         sP2RQahBn0fzqqmyW21q8KGU4Z6idTU6z9IQ66PQLMF1uAHF3Fa235AAlT1W7QXyMwJl
         zFUWuUsUy36crLqz0pzEHyEAhJtTUzwGKWUgkz/ZAyQiTHu/TS4pHf510bMu9Z3Hp7WR
         dP8g==
X-Gm-Message-State: AOAM5335AkMm4D3vkfaJdy9TUvKISQIY8xqmGaeBhKc2wedftxpSVh+j
        MR2lSolmTTbdBVuEkqlny3JOjyBhCFOcjQ==
X-Google-Smtp-Source: ABdhPJycrXGIg1g9AV8WQYEr70RLi3XRehcM9HtAKZDc9A6lS3XuOfjnbdSH/lOFanpRaWcoCWbakQ==
X-Received: by 2002:ac2:4183:: with SMTP id z3mr9277246lfh.510.1604438325564;
        Tue, 03 Nov 2020 13:18:45 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id q8sm18128ljg.105.2020.11.03.13.18.44
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 13:18:44 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id p15so20675494ljj.8
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2020 13:18:44 -0800 (PST)
X-Received: by 2002:a2e:868b:: with SMTP id l11mr9088907lji.102.1604438323851;
 Tue, 03 Nov 2020 13:18:43 -0800 (PST)
MIME-Version: 1.0
References: <20201103124420.46bf5a37@lwn.net>
In-Reply-To: <20201103124420.46bf5a37@lwn.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 3 Nov 2020 13:18:27 -0800
X-Gmail-Original-Message-ID: <CAHk-=wghhw0SpqSKKUqt5eum=UfLD3Qa0suoRxLy_cJc4hChug@mail.gmail.com>
Message-ID: <CAHk-=wghhw0SpqSKKUqt5eum=UfLD3Qa0suoRxLy_cJc4hChug@mail.gmail.com>
Subject: Re: [GIT PULL] Docs-build warning fixes for 5.10-rc3
To:     Jonathan Corbet <corbet@lwn.net>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 3, 2020 at 11:44 AM Jonathan Corbet <corbet@lwn.net> wrote:
>
> This pull contains a series of warning fixes from Mauro; once applied, the
> number of warnings from the once-noisy docs build process is nearly zero.
> Getting to this point has required a lot of work; once there, hopefully we
> can keep things that way.

I wonder if it is quiet enough that we could make new doc build noise
trigger some kind of linux-next warning?

I know Stephen was at least looking at doc build warnings justding by
the thread a couple of weeks ago.

             Linus
