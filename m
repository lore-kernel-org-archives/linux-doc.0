Return-Path: <SRS0=ZlxX=AT=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 267D8C433E0
	for <linux-doc@archiver.kernel.org>; Wed,  8 Jul 2020 18:58:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F07F207C4
	for <linux-doc@archiver.kernel.org>; Wed,  8 Jul 2020 18:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594234684;
	bh=/HmNAv3VtI6tKUilo3NoJrZomug1fbzlcPoHAeFduEQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=QCKR8IYpMgObZ6JDanjUJVHrrOf0TLLkCpVFkUX+jVLr4pcuwU9ezk67rLCYHzNKZ
	 l29UWW/kdhS9dNM86rtzPZe2fDb6cO4HStma6zchxoGUad1UThCZCQzYTJPdmGBi1f
	 eJeKujfgAUJONZCvUY5n1gJeaeiqnfo83mWgvbvo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgGHS6A (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Jul 2020 14:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbgGHS57 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Jul 2020 14:57:59 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF1AC061A0B
        for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2020 11:57:59 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id s16so22032959lfp.12
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2020 11:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zWYjYIBe3hb4/4vbCyVaoP887WP+Gp1mlQlCb62YSBA=;
        b=Vq73d8l+3BMp4JujE6UfEHRqIJvLNGYq5e4nYrdL5IbPLmU/htT7PVHjoWIxLiJoZ5
         9NrEe5AQIr1t1eXW35yLRMm3OaOnksZ8seDUtp4XFiPXnCQV+/dIDHaZkmRJsOCJnp5w
         Ptw96Qv96pkFd9dG9w2cOCCXbJZNZvWnlr9ro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zWYjYIBe3hb4/4vbCyVaoP887WP+Gp1mlQlCb62YSBA=;
        b=ZB+l0AnS6BWFDM7PigjW5c5WXUIgK4J3RyaX93XbsJB+C7ssP8P7SK4G/bhlAjKdFE
         lmKTDG06woW3QuedjZ1awSqo9OMjlWsov0xsMONiNiVq5DVPHszeFYVBFFvMXqvWnqnl
         0mxJ1moys5JVe5paiApCbeYTNq3Af4O+7QueXe438OmUs7wMlZcRwxlURlBqVnc3OrXk
         fWmcQQDGsazXR5xDCaSzKF27x7mDinaIYL61sR4e1g6g0kXju6I3Ozltkccr+6KwFs4x
         ZxEQ/PkoG8JMnxYj6mMwmGzsLueuTCMjQ9/T/SGkOSW3OGr7d/wSWVtr+jTp2NEusgzl
         BA7A==
X-Gm-Message-State: AOAM530QCXBqzn1xqXNFzKemwQ8sNMN8EyhIw8PBz/cOSW58Dx+yQBK5
        LLcjN56IqGvNObw65BgAqdGN2FnVP4c=
X-Google-Smtp-Source: ABdhPJz4DMisvuYV/qciYTlMUtBif/JwKyO9NL9oHCf+xfW4UPR3VSvOD3IzrYRkR1T5aSciBVL7HA==
X-Received: by 2002:ac2:5e6c:: with SMTP id a12mr37879068lfr.35.1594234677670;
        Wed, 08 Jul 2020 11:57:57 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 203sm201642lfh.19.2020.07.08.11.57.56
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 11:57:56 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id k15so27473507lfc.4
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2020 11:57:56 -0700 (PDT)
X-Received: by 2002:a19:8a07:: with SMTP id m7mr37282593lfd.31.1594234676431;
 Wed, 08 Jul 2020 11:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <a98e9c26-5405-3894-6197-3f5e388a5698@infradead.org>
In-Reply-To: <a98e9c26-5405-3894-6197-3f5e388a5698@infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 8 Jul 2020 11:57:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=whkuOeHvA_ws=usQt=rYq_M2vh448mDxY7kYhUmp_Lomw@mail.gmail.com>
Message-ID: <CAHk-=whkuOeHvA_ws=usQt=rYq_M2vh448mDxY7kYhUmp_Lomw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: update for gcc 4.9 requirement
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 8, 2020 at 11:45 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> - - Make sure you have at least gcc 4.6 available.
> + - Make sure you have at least gcc 4.9 available.
> -GNU C                  4.8              gcc --version
> +GNU C                  4.9              gcc --version

Heh. The docs clearly weren't in sync before either.

Maybe we should add a

  Fixes: 5429ef62bcf3 ("compiler/gcc: Raise minimum GCC version for
kernel builds to 4.8")

to your patch too.

I only grepped for the obvious GCC_VERSION string. Which is presumably
what everybody else who has ever done this have also grepped for,
although in all fairness Will at least caught the one in
Documentation/process/changes.rst when he updated it last time.

                 Linus
