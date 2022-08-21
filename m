Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07887C00140
	for <linux-doc@archiver.kernel.org>; Sun, 21 Aug 2022 17:12:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbiHURMH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 21 Aug 2022 13:12:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbiHURMH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 21 Aug 2022 13:12:07 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A725A21E07
        for <linux-doc@vger.kernel.org>; Sun, 21 Aug 2022 10:12:05 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id tb26so1657201ejc.2
        for <linux-doc@vger.kernel.org>; Sun, 21 Aug 2022 10:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=2IG7yxCXKhrrmlYS5yO7XY8+9kSj2TtQKMSIeXBcBeM=;
        b=KzixGCuDnswaMadZqR4ynhhwNXnoXEVyUxEjeuDGHd5tL+ljlGzsi+LE8LF7F5lwRn
         v9mjz4V1ufMkIAeKimYo9EAgIy0HyOy9AOd/PAq3eqylpiDSkisiUMxEQp1Y8V7AtTGo
         NbrWgFjyqJ/5NmxocTy3bgtBX7ufagCwkWDhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=2IG7yxCXKhrrmlYS5yO7XY8+9kSj2TtQKMSIeXBcBeM=;
        b=2KN7WmFB7geDYmgDVxz07lHolYSJc2rqfGX8WWs2lZMifBozo2Pc+K+wv8slIMuYFd
         Q4NVZ2nJjNoDdwo1jM1IODQe4GbCT16Er27eF32x0/SeDyzxszjb/45Vk+IZ5vI9sOe7
         d0pE3QC/VqQW/BC14WIH7HmItALMJlac3JggNkxz+gvA9CprlUjaNi7tv85wmWPqo6W9
         kVmeY6y39zGtqbhM4eQKBfnFVeKStH/jxqEkOmYSZ7fPu8KSDc/mPsbTjQxDIc1UpvBM
         prtJ5p7MV7m4rfAvZPnims/kcshja9/HozRqCg8TyKrq/8M4BiC+LGcLFSHgRbI+N9JH
         RsBg==
X-Gm-Message-State: ACgBeo12f5U1j9WOIsW7WrdVhJSxRPv+KriJZms8EscbwCO5IKit5YXm
        hNeB8FgsMTT1HJvCkGMbCTJokqy6QwBwC6jv
X-Google-Smtp-Source: AA6agR6fnp3nVQlfl3MHvgepGTiBnid8RZeJAoi4Qv5e+50bQCSJP5MXjDh+JO1tym6HT3QGS4eKAw==
X-Received: by 2002:a17:907:a218:b0:731:2b2b:f34 with SMTP id qp24-20020a170907a21800b007312b2b0f34mr10733756ejc.404.1661101923917;
        Sun, 21 Aug 2022 10:12:03 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id w8-20020a50fa88000000b0043a7134b381sm6716581edr.11.2022.08.21.10.12.03
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Aug 2022 10:12:03 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id v7-20020a1cac07000000b003a6062a4f81so6588014wme.1
        for <linux-doc@vger.kernel.org>; Sun, 21 Aug 2022 10:12:03 -0700 (PDT)
X-Received: by 2002:a7b:c399:0:b0:3a5:f3fb:85e0 with SMTP id
 s25-20020a7bc399000000b003a5f3fb85e0mr10127541wmj.38.1661101922857; Sun, 21
 Aug 2022 10:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAADnVQJFc9AnH_9CW+bSRotkKvOmkO9jq-RF6dmyPYOpq691Yg@mail.gmail.com>
 <20220819190640.2763586-1-ndesaulniers@google.com>
In-Reply-To: <20220819190640.2763586-1-ndesaulniers@google.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 21 Aug 2022 10:11:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=whLcuvDDS3rZfEgDrwbdJrTx8HCRNiZ5cDc80-_gzHCxw@mail.gmail.com>
Message-ID: <CAHk-=whLcuvDDS3rZfEgDrwbdJrTx8HCRNiZ5cDc80-_gzHCxw@mail.gmail.com>
Subject: Re: [PATCH v2] asm goto: eradicate CC_HAS_ASM_GOTO
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-um@lists.infradead.org,
        kvm@vger.kernel.org, llvm@lists.linux.dev,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Borislav Petkov <bp@suse.de>,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Applied directly, just because I love seeing old nasty stuff like this go away.

             Linus
