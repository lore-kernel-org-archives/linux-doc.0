Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA03EE4996
	for <linux-doc@archiver.kernel.org>; Mon, 21 Aug 2023 12:29:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234904AbjHUM3v (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Aug 2023 08:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234898AbjHUM3v (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Aug 2023 08:29:51 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D9E1CF
        for <linux-doc@vger.kernel.org>; Mon, 21 Aug 2023 05:29:48 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99c1f6f3884so431355166b.0
        for <linux-doc@vger.kernel.org>; Mon, 21 Aug 2023 05:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692620987; x=1693225787;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AnJhMEuBXlJhnu7AWbqCOJoArmxP5ku2UiTWG22q0hI=;
        b=5WNaR+iZi97RIIhzPfCtCYmyRk+s/Wmbqcp6Al/7o/8lkfRphQg0D8gZtiFitE6gyx
         7Nnsfw7nVkQu2ThZn3Zp9OgM+uzeoo0slsR7z03i39PC7oiM8yzQknPCdGNU/NzSPKeT
         jWyi3O8vztgh1czvBpim4vnbpqn6IEpMb6lOnw0Q7S8umWp4oKIhVq29TYZXnQSBNKWn
         hO7HkT58PaS+KTW9mXwBotYRcyoyV18sW57rhhJaJjfPeswzPVVk+RhLG8cYNEkbiOIl
         nGhqNI/qSbrdz6pAEZdLs9F0p59MVT8avfwZwaNowZtNV82elwE8fHvZR+884iKBO0wF
         9QnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692620987; x=1693225787;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AnJhMEuBXlJhnu7AWbqCOJoArmxP5ku2UiTWG22q0hI=;
        b=fVdFkv2bnadpIte86WmKZEwb3W2+mJJsmMnR5/Im6fvAYTLXP6ZMjbsU1XTvKA3+vl
         MHfbld9NfGGCBUJeGX+MtvdYtA3xC7FQBZrCixnxTtxHcpVURMSEut4SZQ217Mv22H5E
         fjzuMjmGSmdDhILJyL+7WM6V3DBSoNGDxKptBjoPjEykmsgwkzMAEqMfspVNr8LWLr0k
         mPOpV5XbZGmva17t3oHZfOE5QQGLaDo5kNbED10BuVYqXBXdPOEUXQCrqLGuzybW91rd
         59oqOiYAR0LwA3Zetc7kFWvRjDem3heFWGqdve85w9uJ1cq7yY0JoLBUy+6lhUrlN2Oj
         7y9Q==
X-Gm-Message-State: AOJu0Yx9BdM1dTnZkKypUCli8+PfVvC8fizJhh1uT5mP5eEijVIPWNcL
        OxTZ8K0I7je1s8CH3J/X2FDIb2YENrmabyWzT0Xt5w==
X-Google-Smtp-Source: AGHT+IFIGYVGP7/7ZDw/ywiettAKjJLScN7pIyytefnZWrrxPbgn2mLJJAFttBNK42lqFRUIWNqGgu2FMIaEVW6smnk=
X-Received: by 2002:a17:906:31c1:b0:99d:a6b9:fd04 with SMTP id
 f1-20020a17090631c100b0099da6b9fd04mr4711211ejf.46.1692620986919; Mon, 21 Aug
 2023 05:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <x49wmxuub14.fsf@segfault.boston.devel.redhat.com>
In-Reply-To: <x49wmxuub14.fsf@segfault.boston.devel.redhat.com>
From:   Matteo Rizzo <matteorizzo@google.com>
Date:   Mon, 21 Aug 2023 14:29:35 +0200
Message-ID: <CAHKB1wKws+ha+rsO-kn-qW_XqshNV0g0hDLHjFRxg67FdHGEVg@mail.gmail.com>
Subject: Re: [PATCH v4] io_uring: add a sysctl to disable io_uring system-wide
To:     Jeff Moyer <jmoyer@redhat.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        io-uring@vger.kernel.org, axboe@kernel.dk, asml.silence@gmail.com,
        corbet@lwn.net, akpm@linux-foundation.org, keescook@chromium.org,
        ribalda@chromium.org, rostedt@goodmis.org, jannh@google.com,
        chenhuacai@kernel.org, gpiccoli@igalia.com, ldufour@linux.ibm.com,
        evn@google.com, poprdi@google.com, jordyzomer@google.com,
        krisman@suse.de, andres@anarazel.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 16 Aug 2023 at 19:50, Jeff Moyer <jmoyer@redhat.com> wrote:
>   Matteo, you didn't reply to Jens' message about pulling the patch, so
>   I figured you got busy, so I picked up the patch.  I hope you're okay
>   with the signoff.

Hi, yeah sorry I was on vacation until today so I didn't see the thread.
Thanks for picking this up! I would agree with Gabriel that option 1
should also allow processes which have CAP_SYS_ADMIN.

--
Matteo
