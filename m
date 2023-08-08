Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88AC1C001DB
	for <linux-doc@archiver.kernel.org>; Tue,  8 Aug 2023 21:59:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbjHHV7l (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Aug 2023 17:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbjHHV7k (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Aug 2023 17:59:40 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFCFAE72
        for <linux-doc@vger.kernel.org>; Tue,  8 Aug 2023 14:59:39 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99cce6f7de2so445904266b.3
        for <linux-doc@vger.kernel.org>; Tue, 08 Aug 2023 14:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1691531978; x=1692136778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9vjVFfWFImhbbV+PvD1bDCoF45rIONe5KGNnouWDJ7A=;
        b=VPeoi0aK0FbUNYIS4YhPmyNq1Ylc3RUKJ/XvDTbL16kpHv2dYA5Xba3ITMXv+tObCt
         29+LnjVzEKb+A7Ldz1LI0DHOuDV89LEQIZETqkPtqTA1RMhcyTT1F/ZfHtSd2XCPmV3s
         pqJ4txZx3XcR9e6yuaw16KEpNXJcz1kZFvipo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691531978; x=1692136778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9vjVFfWFImhbbV+PvD1bDCoF45rIONe5KGNnouWDJ7A=;
        b=ON4SLXxCSmoHhHDuvJMd+aTWOL+SG61d6j5brQxZC1O9DX0et/7oZzf39eXZnBKqhe
         oUhKJwnELdQrwY3ZUumxwiPo4SxvWfqzVrpISdg76pw9x3j6QfwbJV3IjQcCj4fyiTFk
         hOzae236w8QdzdxJQKJZ3tOPQeC0qI5OJAysrkl0BtSyfJcJoSI7O+6RwUO6rL7J24IB
         CVPB7V/SG12nhwklZFfnat5dO4ALbQWVk+OrO8X/x5nupMZ2GcRX/vVwuYEX4LXR65eO
         wJRyGLnWJXy10hiR8gVKMwde1eVPDakExzw2cFiNYdT3kj+XuUlsgx11vg1sJJSE4Ad1
         Do8A==
X-Gm-Message-State: AOJu0Yx/t/a5tswyQfnIfJUtxVbp6Z3TNTgsOeSdyppyG4LIwO/nSvVu
        Rpu6RWcZyO9Lf5TqPqNrJs85HIzzkTvU2cQc+nDgvmoK
X-Google-Smtp-Source: AGHT+IGlAiJnf9CS98iTCrGq4zlkVJ3I9XGrP6gwaBW7YCksCFW1rZrKMhRl+5b3OQZlRtMyVEiMHw==
X-Received: by 2002:a17:906:3091:b0:99c:56d1:1266 with SMTP id 17-20020a170906309100b0099c56d11266mr741270ejv.72.1691531978327;
        Tue, 08 Aug 2023 14:59:38 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id kd5-20020a17090798c500b0099d0a8ccb5fsm144159ejc.152.2023.08.08.14.59.37
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 14:59:37 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-99c47ef365cso910563466b.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Aug 2023 14:59:37 -0700 (PDT)
X-Received: by 2002:a17:907:7629:b0:99c:75f7:19c1 with SMTP id
 jy9-20020a170907762900b0099c75f719c1mr684831ejc.39.1691531976818; Tue, 08 Aug
 2023 14:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <874jl945bv.fsf@meer.lwn.net>
In-Reply-To: <874jl945bv.fsf@meer.lwn.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 8 Aug 2023 14:59:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wipcJKtWRtBHDDjRx7UXyZAD2eswjCiD19tuz+XwjUxhQ@mail.gmail.com>
Message-ID: <CAHk-=wipcJKtWRtBHDDjRx7UXyZAD2eswjCiD19tuz+XwjUxhQ@mail.gmail.com>
Subject: Re: [PATCH] docs: vfs: clean up after the iterate() removal
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Christian Brauner <brauner@kernel.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 8 Aug 2023 at 14:00, Jonathan Corbet <corbet@lwn.net> wrote:
>
> If nobody objects (or beats me to it) I'll drop this into docs-next
> shortly.

LGTM.

I did grep for old uses of iterate - including in docs - but I clearly
only grepped for the "->iterate()" and ".iterate =" forms.

            Linus
