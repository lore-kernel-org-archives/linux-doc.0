Return-Path: <SRS0=fuR8=7O=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC3D1C433E0
	for <linux-doc@archiver.kernel.org>; Mon,  1 Jun 2020 22:52:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D22920870
	for <linux-doc@archiver.kernel.org>; Mon,  1 Jun 2020 22:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591051969;
	bh=L7pJH4radjiJjB/3uWqUplnKODxKG/Oi+cNaWRk7BpA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=J8wogGx+Ri1oEqb3eS+2ANsPQKzJa8E8O2h8nzJaOcsT/rKN6hYV8CJRafmMo4rM2
	 uaiocvJlc0xKSKabxwG+Cofh2ey0G9czhr0WEAkrBBdauAmrx1whpwH9aQJjw7aL3K
	 UHw/8yXiMy4EywWRNEkbp0+9iSKKzrLnaCVdgDnI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728959AbgFAWws (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Jun 2020 18:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728948AbgFAWws (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Jun 2020 18:52:48 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FE06C03E96B
        for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2020 15:52:47 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id c11so10251993ljn.2
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2020 15:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OYJP1jvhbQqjZ7HxRCF2xjLa+SLIL/UXCR0WcX2oCsU=;
        b=c2hTz1qFtXtSVlGaKWP+5+sQr31EQt3V0U6w6ST5lIG3zH1AYu01cZavADmHQYbi1g
         MRqjFBFVnQZ1yrYWIse/RwNRPx9ardLvER1f7ikdkgJy7tS6x2VfVhg1F/d51zssmvmj
         DBVJq9at7+4eVbC2zO1WqpQCa0+k+GHG4haHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OYJP1jvhbQqjZ7HxRCF2xjLa+SLIL/UXCR0WcX2oCsU=;
        b=c5nOVPVaI4MufYFRyKQ9Av8KYJz5gcU0aCcWAy4b71457hZE2kvnrTx/GwZPACgHMk
         qDt5Emc4rYYL669cMp0S6yWboxX6DHzESMwunNQSy98bCaZbKsTzG/grIQMYUA2Ps8Qr
         i8aDQhwD3rYsLepPZVFQXnA9iIjoawrTe6PQG+0ZPxQLXogbuVU1d2b3vZ75hXp9/s8b
         Ap6sfHKbm7fzFQHy366sPXMXNkYFHS4pPZQ5TcMH9VVX5BD/f4twAG8Y8gGbb91s0ZKr
         6ofkhnE5GaQVyppuRJkvnNKP91ZPmHIxrq65g1UTiu8SSV44unMmB4cgzknbQSU2kdyK
         P08g==
X-Gm-Message-State: AOAM530fxy7WlhFM9fPwazQBdLxz6D1Mu7Yj8YJz+BwBVGMpcW5TRop7
        JfeLM8sSGtoJKViAoRgoxy4c5EIWKPc=
X-Google-Smtp-Source: ABdhPJyQIXNlb5q7WdNNbsM5OToL9Hc8FBl4atZ9jOELRM8s9ugiU2pqiw1bF0UYqzijoSoKs+JWZQ==
X-Received: by 2002:a2e:3512:: with SMTP id z18mr2737113ljz.423.1591051964998;
        Mon, 01 Jun 2020 15:52:44 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id f12sm227260lfp.8.2020.06.01.15.52.43
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2020 15:52:44 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id c17so4480953lji.11
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2020 15:52:43 -0700 (PDT)
X-Received: by 2002:a2e:150f:: with SMTP id s15mr11260953ljd.102.1591051963161;
 Mon, 01 Jun 2020 15:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200601094600.19c6fe0b@lwn.net>
In-Reply-To: <20200601094600.19c6fe0b@lwn.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 1 Jun 2020 15:52:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiNQwW8LEb-ZDFuYphFxuJW0+tzE1jsYC64LQeGjB7aHg@mail.gmail.com>
Message-ID: <CAHk-=wiNQwW8LEb-ZDFuYphFxuJW0+tzE1jsYC64LQeGjB7aHg@mail.gmail.com>
Subject: Re: [GIT PULL] Documentation for 5.8
To:     Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 1, 2020 at 8:46 AM Jonathan Corbet <corbet@lwn.net> wrote:
>
> There will be, alas, more of the usual trivial merge conflicts.

Heh. And one of those conflicts was just due to the arm64 people
fixing some warnings differently from the doc people.

I took the doc version that kept the allegedly "unexpected
indentation", and fixed it by just adding the proper blank lines. That
seemed to be the more sphinx-aware fix.

Funnily enough, the commit from the arm64 tree that re-indented those
lines _also_ added the blank lines, so that's presumably what really
fixed the warning, and the re-indentation was just due to the warning
language implying it was needed.

             Linus
