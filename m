Return-Path: <SRS0=nUK8=5W=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C0DC2BA17
	for <linux-doc@archiver.kernel.org>; Mon,  6 Apr 2020 18:33:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3BE62072F
	for <linux-doc@archiver.kernel.org>; Mon,  6 Apr 2020 18:33:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbgDFSdW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Apr 2020 14:33:22 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43935 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgDFSdW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Apr 2020 14:33:22 -0400
Received: from mail-lj1-f197.google.com ([209.85.208.197])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <guilherme.piccoli@canonical.com>)
        id 1jLWYh-0005jM-Os
        for linux-doc@vger.kernel.org; Mon, 06 Apr 2020 18:33:20 +0000
Received: by mail-lj1-f197.google.com with SMTP id k13so2133775ljg.12
        for <linux-doc@vger.kernel.org>; Mon, 06 Apr 2020 11:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=90HV19v61/oJlZKRSYQx/Q+sNGoHReecpevkIbBQOKA=;
        b=V/HVEHDhxm1ZcE4M7m+rON05oMGChMyVMph2JtgS3flhwv5MyESCjiiIoo2ivIMY4f
         OqiWiMFeNx3UeQoSeJaPsmNVHiRB8yV78GrJ/AIKpjQL0VupUqj0ysyXAz45lQpJU/nP
         nWjz7UsMaAV5c7n22Kilm4iPO7PPk2QikO69752y4AgzMLsjclK02HU0hR3afhG9lbkS
         gMwg9aHB1PQGgw1Nbe4bnaJqCAPrjbhCL+3MIi+EFvn5q6bvAfId7WVwwH22P3Mvpi0I
         6jjkIi2hJg+R1M+ErbvkdZ24biU4fiQKl6+bO9ObQ5a0N6iFFhql5323kszznWlsWHjA
         FB9g==
X-Gm-Message-State: AGi0PuZY9dy3CLYppolxbkWR8/bq+4XP8B/9RCCYQvNTIUsTSlU/nuOv
        8dvjl/1VprQbl3aFVK8nPygZGHexh1kn5ZJREMYVX9pQKNdoznfi+qq2S9gDz+tGnyoCNKREozX
        N+6kocWtFAt7uMXLrSxqNXvoFV52aKCXd7AAd9GBHAeWmlZfTT3hw6w==
X-Received: by 2002:ac2:57cc:: with SMTP id k12mr12759348lfo.69.1586197999054;
        Mon, 06 Apr 2020 11:33:19 -0700 (PDT)
X-Google-Smtp-Source: APiQypITp3xnqIy0LanaMOSTQptCQgmvJbvvW4mayLi3SKGRQ/k7zk5c43j4cUifOZGvLhKkDHOjqHFB4PoDD+QQXoU=
X-Received: by 2002:ac2:57cc:: with SMTP id k12mr12759324lfo.69.1586197998800;
 Mon, 06 Apr 2020 11:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200327223646.20779-1-gpiccoli@canonical.com>
 <d4888de4-5748-a1d0-4a45-d1ecebe6f2a9@canonical.com> <202004060854.22F15BDBF1@keescook>
In-Reply-To: <202004060854.22F15BDBF1@keescook>
From:   Guilherme Piccoli <gpiccoli@canonical.com>
Date:   Mon, 6 Apr 2020 15:32:42 -0300
Message-ID: <CAHD1Q_xwR4OqsF8n3VJXknZ5QgpLWPQ3YTuztTgn0GTMR0vgKA@mail.gmail.com>
Subject: Re: [PATCH V3] kernel/hung_task.c: Introduce sysctl to print all
 traces when a hung task is detected
To:     Kees Cook <keescook@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org,
        Linux-Fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
        mcgrof@kernel.org, Iurii Zaikin <yzaikin@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Vlastimil Babka <vbabka@suse.cz>,
        Randy Dunlap <rdunlap@infradead.org>,
        Matthew Wilcox <willy@infradead.org>,
        "Guilherme G. Piccoli" <kernel@gpiccoli.net>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks Kees! I was expecting this could be merged in the current
window, but there's really no problem in waiting for the next!

Cheers,


Guilherme
