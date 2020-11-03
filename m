Return-Path: <SRS0=f+/j=EJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077CBC2D0A3
	for <linux-doc@archiver.kernel.org>; Tue,  3 Nov 2020 22:18:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96BA2223C6
	for <linux-doc@archiver.kernel.org>; Tue,  3 Nov 2020 22:18:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FeZn//b1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729342AbgKCWS6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Nov 2020 17:18:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730347AbgKCWSC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Nov 2020 17:18:02 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0201BC0613D1
        for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2020 14:18:01 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id y16so20815570ljk.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2020 14:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z0GfssSb9lxM+saQ7V+1ta/Gt8yaqMW9vqfv+WXLTwo=;
        b=FeZn//b1sOnMrO86t7PxeEcDowXD4Ju86jS3F2Ovkk/9uHRoKyViEL8FoAGe1M6Dsc
         24tIc4S+LsQx1PS2ucPg54frQ40elJZesPOG4kOonbBE0WF0P0m3JpGqm3g8z3hK1YjI
         qT/pfOxKrxqo9F2RMyW1BXUdBXaedR4oQLBXmSeAA8UtMPxdMoGaY8uOb2ar5h6kPNc1
         osM55zh33/mU4PHPqktEsnB0Tixgu/FqGh2MLGmhFh3pbpMLU4QhKYtapoUre6M+T3Ka
         7147e1t/Jwu0QVFanpXFlTNpj+ZCQNIC6wt7G7UdezZJAZEj4v31ZuoTvI9gA8os5HX6
         Wgxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z0GfssSb9lxM+saQ7V+1ta/Gt8yaqMW9vqfv+WXLTwo=;
        b=ICnXOwFOFkkdf6YGswZIkX0DqWrEH7c+pM8daPcjFNM1rB9ZpM3e1qvWWYAAKN2AfS
         xU7Q+36h4mLI+morAxPr9HAm13PT/vitqQhbDRXXx4CpO/6pSQigFGYWab9Mdi3NND7c
         uQudk/ZA8I05WLwpxFgtsu1PFuiLhnAkVc18l4Jp+TlU/N7wUjIfg8d/sW6sPeWKp7QM
         bMvse7bTyBcxt7zzS/c6CDQLiADCM6FhoEauAtKKB2+y4zMMrYWWjkuleETqs0bUO5/M
         BBWwGwTRn6MNxWyGOrNUBg6oghlqq6YoCnlrmSVH9L/E4QWrLnewpzYkLQLQwVQoq06B
         cmnQ==
X-Gm-Message-State: AOAM531TmOaVJitGR5iAL4ja31sky5u3Uv4kCSUXzgggNHpSfC8aP6Q3
        etYPRl4qzAgqv4m1v73SC6MDk3HKNi0yCVg0SbbHJQ==
X-Google-Smtp-Source: ABdhPJx1YLpbLOmJgqu3eQzQ+sA7YY36W5ObSZZ3HEKf4jnleqY9lVAuhTWuMxAk5yJC8NxBNIaDG96Wmw/e3PGz5t8=
X-Received: by 2002:a2e:9c84:: with SMTP id x4mr9140798lji.326.1604441879292;
 Tue, 03 Nov 2020 14:17:59 -0800 (PST)
MIME-Version: 1.0
References: <20201103175841.3495947-1-elver@google.com> <20201103175841.3495947-8-elver@google.com>
In-Reply-To: <20201103175841.3495947-8-elver@google.com>
From:   Jann Horn <jannh@google.com>
Date:   Tue, 3 Nov 2020 23:17:32 +0100
Message-ID: <CAG48ez0=_ZoUsZvh99UJo7GziiTqZUKYgqHzvd784a-Fs-kEcw@mail.gmail.com>
Subject: Re: [PATCH v7 7/9] kfence, Documentation: add KFENCE documentation
To:     Marco Elver <elver@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alexander Potapenko <glider@google.com>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Rientjes <rientjes@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Eric Dumazet <edumazet@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hillf Danton <hdanton@sina.com>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@purestorage.com>,
        Kees Cook <keescook@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pekka Enberg <penberg@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        SeongJae Park <sjpark@amazon.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 3, 2020 at 6:59 PM Marco Elver <elver@google.com> wrote:
> Add KFENCE documentation in dev-tools/kfence.rst, and add to index.
>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> Co-developed-by: Alexander Potapenko <glider@google.com>
> Signed-off-by: Alexander Potapenko <glider@google.com>
> Signed-off-by: Marco Elver <elver@google.com>

Reviewed-by: Jann Horn <jannh@google.com>
