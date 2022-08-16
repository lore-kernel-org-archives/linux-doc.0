Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CDBC3F6B0
	for <linux-doc@archiver.kernel.org>; Tue, 16 Aug 2022 18:03:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbiHPSDG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Aug 2022 14:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235656AbiHPSCd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Aug 2022 14:02:33 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D65B83BFF
        for <linux-doc@vger.kernel.org>; Tue, 16 Aug 2022 11:02:32 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id dc19so20335769ejb.12
        for <linux-doc@vger.kernel.org>; Tue, 16 Aug 2022 11:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=uXGdesIi7LyqHlMu2dT0RxDIuJI5AzNBe4VjC5+ytdY=;
        b=BGaXGJuiB7eGotBqcqWfwy8VgrYrFL9S/Bz2cQMnHb8DGajRYxwJbBwi51UswnEen4
         qeGfJgSl2eiS9ekAhwJadkZI/p8h6CBxAi08OQH7SCDmC5kp547O/7op0YNbaXEekIdO
         A36MXq6QBuMAzvlOfavBoL7t/c3fRWsSF+dBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=uXGdesIi7LyqHlMu2dT0RxDIuJI5AzNBe4VjC5+ytdY=;
        b=0B1pKX2zvkjQT9r5irdqEAa4rWU9Ge+GPHh9iFl3xS1M12mzT28W80gBM+52jiAGds
         ltPSbplw4ut7OL7N6E3c0rYIEy3H0zFwldZ/U8vvAwPkpFj+GMvgNgO5849Ga0KtMIvu
         vnPyIPGptAswNVnUKe2ngb0fura+wGCxE3kEG2qEgtFxbLTrsV6Npe3mVEoinrVLEyMJ
         UNnfORXfAcZd1PD+Ib9AZf4EUuIZei5W+OJp6cO6EXmSKJ7p0qtXoqBzV18srV6CwayE
         wN1+JYks72CVViEuJFyIqBpaMkJPbIKdnMP7M1ZGzBDEEtvu+AKErYhJlIN/SiV+w9yz
         oeIQ==
X-Gm-Message-State: ACgBeo0UOetkZGZCbeGe7EICvqR0II6jXxxsR70gSiyHzt0on5AXI+8H
        BFx4DLt8vbONvQ8OsnHHtxi7Ik3fcKzJxAp2yAA=
X-Google-Smtp-Source: AA6agR5unsYjaGKRJbhCbjr0K2glaxisHbb3CUL9h7RyDlIV+4y8MPM2GZ61LRRNGvCtB4YcEoFpPg==
X-Received: by 2002:a17:907:1c1f:b0:739:17e2:209a with SMTP id nc31-20020a1709071c1f00b0073917e2209amr2102589ejc.320.1660672950766;
        Tue, 16 Aug 2022 11:02:30 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id p3-20020a170906a00300b00732e3d94f4fsm5470398ejy.124.2022.08.16.11.02.29
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 11:02:30 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id qn6so20321192ejc.11
        for <linux-doc@vger.kernel.org>; Tue, 16 Aug 2022 11:02:29 -0700 (PDT)
X-Received: by 2002:a05:6000:2a4:b0:225:162f:4cc7 with SMTP id
 l4-20020a05600002a400b00225162f4cc7mr2836760wry.274.1660672938800; Tue, 16
 Aug 2022 11:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220816070311.89186-1-marcan@marcan.st> <20220816140423.GC11202@willie-the-truck>
 <c545705f-ee7e-4442-ebfc-64a3baca2836@marcan.st> <20220816173654.GA11766@willie-the-truck>
 <CABdtJHt_3TKJVLhLiYMcBtvyA_DwaNapv1xHVeDdQH7cAC6YWw@mail.gmail.com>
In-Reply-To: <CABdtJHt_3TKJVLhLiYMcBtvyA_DwaNapv1xHVeDdQH7cAC6YWw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 16 Aug 2022 11:02:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh3dCn5a4fZuJ7cewJoG9Vrm9xSOShiwgC6MA9=yJvXPg@mail.gmail.com>
Message-ID: <CAHk-=wh3dCn5a4fZuJ7cewJoG9Vrm9xSOShiwgC6MA9=yJvXPg@mail.gmail.com>
Subject: Re: [PATCH] locking/atomic: Make test_and_*_bit() ordered on failure
To:     Jon Nettleton <jon@solid-run.com>
Cc:     Will Deacon <will@kernel.org>, Hector Martin <marcan@marcan.st>,
        Peter Zijlstra <peterz@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrea Parri <parri.andrea@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Akira Yokosawa <akiyks@gmail.com>,
        Daniel Lustig <dlustig@nvidia.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Tejun Heo <tj@kernel.org>,
        jirislaby@kernel.org, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Oliver Neukum <oneukum@suse.com>, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Asahi Linux <asahi@lists.linux.dev>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 16, 2022 at 10:49 AM Jon Nettleton <jon@solid-run.com> wrote:
>
> It is moot if Linus has already taken the patch, but with a stock
> kernel config I am
> still seeing a slight performance dip but only ~1-2% in the specific
> tests I was running.

It would be interesting to hear if you can pinpoint in the profiles
where the time is spent.

It might be some random place that really doesn't care about ordering
at all, and then we could easily rewrite _that_ particular case to do
the unordered test explicitly, ie something like

-        if (test_and_set_bit()) ...
+       if (test_bit() || test_and_set_bit()) ...

or even introduce an explicitly unordered "test_and_set_bit_relaxed()" thing.

                 Linus
