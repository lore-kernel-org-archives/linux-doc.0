Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBFE7C4332F
	for <linux-doc@archiver.kernel.org>; Thu, 15 Dec 2022 15:15:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbiLOPPn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Dec 2022 10:15:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbiLOPPH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Dec 2022 10:15:07 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5F0C30F7F
        for <linux-doc@vger.kernel.org>; Thu, 15 Dec 2022 07:14:39 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id q6so16109984lfm.10
        for <linux-doc@vger.kernel.org>; Thu, 15 Dec 2022 07:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WYCHNbhxDJQkxdxGH4YJ57kTfCz/mIOpNqqD9JEKQ8=;
        b=EDQ0lYTHjD9VjpNhaRSiWsqEUzKoTgbVZdKruE9Ud0e+c/g5ncLVR9zom2E4RAIhD8
         jUQJlomPcKRAZWsEeEhjEozW+zoEGQy4XjUfEEToqtWM6X1oO7BPr2KbL0RRUGyJgJ/0
         S3q5F1xa4LyF4f+WkVlLoOMJkZ5a3Y0dP5jYrew209ZBXRrNjB57n50hH/BtSQb4TL2s
         GZqgngewA9kuA+CA174qybI+KF36duGww0Q/zgAZthhvDA1PT2IGovLbqHn3b5vasl6L
         EUSFCk3XbAEWI9LM3uET2AhaSkIc95EBooi7PkAhNJ07qAiUv/23/Gnn0NxuN4z6lis9
         h0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WYCHNbhxDJQkxdxGH4YJ57kTfCz/mIOpNqqD9JEKQ8=;
        b=dbgzmUlvqZCink91TMfsNqpa5FMtnJOe0FxpfkyCI0oEhvEgDdG7AeU0uEUmgGtLuT
         q003f2apq6kKIXdYLGI8HL7OLwJKk0s5fXwZhYmCwf2JGjj9GApTNYSwFbPKWtxV0oNj
         13+FC5kBUXacTsLS6U/kJ5HdaWZ6D/O3MIQptSZuD6zfrTbHJCFrhPFpksDhH1HWFMEh
         DP276kPch2t4AjAELpZh19bjYi/Qud4ruT1TDo5Mg6fAQjHzj7KkuwBA2lkBAJ+A/xWX
         cA0w7IFT7LHnFViO+J47vZCz6HlYA5jZ7lARtqa0WyhYO3Xdjru5Zit5DZj1hXMPL3ii
         1SUg==
X-Gm-Message-State: ANoB5plxTlyYJRe9DYzOIPMz3++nvdl08rkpGwiCZeiZG2u2ssXnaMUJ
        k78TsnlZAqoXsc+5KPQOjht0vwkVaQt4oDvhVkQ=
X-Google-Smtp-Source: AA0mqf60nK4FHrTPahQyjhIw5k48JRafxGOE9ivPy99YlMAD2neVaBviCWk1nAmyafLw4y0VWxMvMg==
X-Received: by 2002:ac2:57c4:0:b0:4b5:b76b:46ff with SMTP id k4-20020ac257c4000000b004b5b76b46ffmr5453816lfo.48.1671117278029;
        Thu, 15 Dec 2022 07:14:38 -0800 (PST)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id f27-20020ac25cdb000000b004b549ad99adsm1174370lfq.304.2022.12.15.07.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 07:14:37 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-doc@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>
Cc:     Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Christian Brauner <brauner@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: Documentation/process: Add Linux Kernel Contribution Maturity Model
Date:   Thu, 15 Dec 2022 16:14:36 +0100
Message-Id: <20221215151436.236233-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221214185714.868374-1-tytso@mit.edu>
References: <20221214185714.868374-1-tytso@mit.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> The goal is to encourage, in a management-friendly way, companies to
> allow their engineers to contribute with the upstream Linux Kernel
> development community, so we can grow the "talent pipeline" for
> contributors to become respected leaders, and eventually kernel
> maintainers.

These are noble goals. Also the bullet list is short, formal, and
to the point. This is nice.

I kind of side with Michael Tsirkin's point that quantitative
measures of performance can be harmful or give a false impression
of control. Consider this example:

linux$ git log --oneline --author=Walleij |wc -l
4301
linux$ git log --oneline --author=McKenney |wc -l
3346

There is something about some code in the kernel being more
"core" than others that needs to be taken into account, albeit
it is maybe an elusive concept. There is a hierarchy from
contributing syntactic changes to coding style to contributing
and maintaining say RCU.

That can be judged by peers and is addressed in other points in
the document so what about just dropping this paragraph?

Then there is this:

> +* Software Engineers are encouraged to spend a portion of their work
> +  time focused on Upstream Work, which is defined as reviewing patches
> +  or papers,

Papers! If we are linking ourselves to the Scientific Community
(and I see that as a good thing) we should certainly drop a few
words about it. It's a place of (ideally) meritocracy and
formal review of contributions.

Here is a real nice paper:
https://kernel.dk/systor13-final18.pdf
as a community we should probably produce more like this.

Or maybe you meant to say "mails". I don't know.

On a side note I would say that this document creates a really
serious cognitive dissonance with the document
Documentation/process/management-style.rst
so just for the fun of it I think this document should reference
that latter document as a guideline for how Software Engineers
will be evaluated in the community when they take on . It is a
nice nod to the nature of conflicting interests and worldviews
we need to deal with.

Yours,
Linus Walleij
