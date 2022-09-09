Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D620ECAAA1
	for <linux-doc@archiver.kernel.org>; Fri,  9 Sep 2022 21:38:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbiIIVix (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Sep 2022 17:38:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231164AbiIIViw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Sep 2022 17:38:52 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1353F296E
        for <linux-doc@vger.kernel.org>; Fri,  9 Sep 2022 14:38:50 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id d12-20020a05600c34cc00b003a83d20812fso2499673wmq.1
        for <linux-doc@vger.kernel.org>; Fri, 09 Sep 2022 14:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=2Y+NLNuQyKNaFU6mPTgzkQeYfosTVSCZJmxTb/6tykg=;
        b=S9fvTRoZDs1adI4sC3PL20INBwJC7nCemJe/AWoDTwEcfdlhgkbeQ39SsyPpbuMjDN
         rVj+mRn1WT6L0Ojlq1kZzN8OWl+nNhMwBrR7+vfwU/D3QXYA3+ZwnOzrQf6mYAFLjSKs
         J/P+mrf/AGE3uU4oRTx3+dWzPl+UQfnW/BHvCnvvziTLm5OaWP+0Ha+d2oFsW4chiekM
         ZxcMhqfKh2Osx3CpVUUXCMb0Px0hkDa/gRrE/MccqDaNC2X00pNm/+7B4E0wK+lzmC8M
         /5eZN3sut+pyn9MKpdI2ajTtNp9TZeFLfKo6oA0DTH6ccWmsOXF9fMqs4BS8nsUdg1/k
         ID3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=2Y+NLNuQyKNaFU6mPTgzkQeYfosTVSCZJmxTb/6tykg=;
        b=yyl1mu7kZZ7NWkvb2KD1XAbGJsTnr5zXIius/e2qZm8XpFvSRoIoguHHzTRxN2AnR7
         LhzDqXK8VJg0+wxl2cGwmacqWjkGcaxXWWTiOgQjSDPpH2eIwqRJ5gm5SVq1zMuGmU21
         CTKtx3SWU0N9M9vsLg9sxwPOukOOMhOjNb4CCHo0O9UEIPqZZTlwYc9hn8Xy1OqNanHy
         aGznd7BQ9rqjhliKHALKTOZnvQJ44AE9YYOiojjhwbnTp16sy8kz3xGzo1A++ycldVz1
         sPcT/R5JuUyKDsq8NgN3THRxC0Hf/VURvRoVAdYMax+CayCQ7KZCfxkO/55lq98IqCvZ
         672A==
X-Gm-Message-State: ACgBeo1ysjDv/EF3GUl2CJWW/14GKNxyE2ux/ag9Nt43m5yM149y8fBX
        OLKfmfQ9xkEXLLq5QgviXTDOtV7Nt8kpvL007PfJYA==
X-Google-Smtp-Source: AA6agR55Ji109n89/PIZXx7w8Zwy/UxdI6HoxoE5W3L937PCHDl99glgs5wvCTO9sZZ0mnsie1BGFRbQMfSmWlHgRwg=
X-Received: by 2002:a7b:c416:0:b0:3ab:73e4:c44a with SMTP id
 k22-20020a7bc416000000b003ab73e4c44amr6512861wmi.147.1662759529003; Fri, 09
 Sep 2022 14:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220909180617.374238-1-fmayer@google.com> <202209091432.5FEEE461F7@keescook>
In-Reply-To: <202209091432.5FEEE461F7@keescook>
From:   Florian Mayer <fmayer@google.com>
Date:   Fri, 9 Sep 2022 14:38:37 -0700
Message-ID: <CAJAyTCBuETy0oY-2tjvKxDDmQCsBdL2d4UU7Fv-ySKZw_S4DNA@mail.gmail.com>
Subject: Re: [PATCH RESEND] Add sicode to /proc/<PID>/stat.
To:     Kees Cook <keescook@chromium.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
        Christian Brauner <brauner@kernel.org>,
        Evgenii Stepanov <eugenis@google.com>,
        Peter Collingbourne <pcc@google.com>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 9 Sept 2022 at 14:34, Kees Cook <keescook@chromium.org> wrote:
>
> Normally no changes are made to "stat" any more. New additions are made
> to "status" instead. Could it live there instead?

Yes, that would also work.
I put it in stat for consistency because the exit_code is also there
(and not in status).
