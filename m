Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2D7C433F5
	for <linux-doc@archiver.kernel.org>; Sat, 27 Nov 2021 19:53:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbhK0T4e (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 27 Nov 2021 14:56:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244117AbhK0Tye (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 27 Nov 2021 14:54:34 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70014C0613DD
        for <linux-doc@vger.kernel.org>; Sat, 27 Nov 2021 11:48:37 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id y13so53372562edd.13
        for <linux-doc@vger.kernel.org>; Sat, 27 Nov 2021 11:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k+WD13DnrXMzqv5sT4ElYQPrredLdicNs7FcvpypMvw=;
        b=ggD12LSgQGpOuKA978T0sePFYeQGzUd++Kya77nHEr8H2Y5U3s7Zev6jYWlM8g15zO
         5Nx2G7t6c+rf7GGAFSCpQZHxkt5OsQEtBXocSqZLsTflKlP069Y6vTvdom+R8sqCaKUw
         raWaWu426UTiqy4O9nfelPn8PFHOxakZIgTU2W7kcNGQpO0/++2YRvyDr2I3SrXmDQDu
         1WXMLGMEZkRCaF0fcMj7B97yK/UvWka83ZyeYu2k+zh5GsHFtnmwVVhil+n7bNYTEFKF
         X7uNLZtrn4UGiqMgjSrR41qUhKmTbXBfSPwcJban6ogspnPTMJr2I3EqiFsJEdHq0nAW
         GO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k+WD13DnrXMzqv5sT4ElYQPrredLdicNs7FcvpypMvw=;
        b=T3mUQcBpYwjd7TXngX6pWXBKuszdLrpgkZgurWrgf0JPE4sKpJQR34drcdQeKlI5an
         1LgUu4CaQ0DELJe3uwpt1b0oDc+ees0N3L2n4V/nLlI27FuIlH5OBoCeZqgWSNgjjW41
         GFbeCVFUgp60vKZt+5zwOr49pZCXsD3WW/UF7LjuDQDGWOD4hlUnn9AEtI58L9pry6wI
         Wy2Ftc1Er9AbyDbsNKGZRlWuoU4POPRV4kLRxzWDzpLSYFjFXLkbsGbKaOgrXz0WRzdQ
         vsO7FE0nqEh7zFJ0yQtJnoxBjL+xmDgDdt19u1WjwomEeMM04nlqy5rxd84FrIh2+nZR
         gq2A==
X-Gm-Message-State: AOAM531ZqMvMelR7xVcMdwITKVkP9bpEpyfis/TgJt4jlcJuMOpt3inM
        eberkfeL/ivK8YTOA9V+M6pYMUC++hc47/upw4q84A==
X-Google-Smtp-Source: ABdhPJw0is2PzWlMWDR3TZyj9QAnUHxP4u+3yMhqpCEGNgRGps4GUpD1lk/8f8bPRqTYXYiiKhXliWlL2FAx25XiMY4=
X-Received: by 2002:a17:906:58ce:: with SMTP id e14mr46457043ejs.525.1638042515857;
 Sat, 27 Nov 2021 11:48:35 -0800 (PST)
MIME-Version: 1.0
References: <20211123214814.3756047-1-pasha.tatashin@soleen.com>
 <20211123214814.3756047-3-pasha.tatashin@soleen.com> <6d82e674-76dc-f3b0-2e53-a92eeb249eff@gmail.com>
In-Reply-To: <6d82e674-76dc-f3b0-2e53-a92eeb249eff@gmail.com>
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
Date:   Sat, 27 Nov 2021 14:48:00 -0500
Message-ID: <CA+CK2bAX2XmMrt9RBGiUV7LG_sbpB7ov6bxMVjr5FSBVirE1CA@mail.gmail.com>
Subject: Re: [PATCH 2/3] mm: page table check
To:     Fusion Future <qydwhotmail@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Rientjes <rientjes@google.com>,
        Paul Turner <pjt@google.com>, weixugc@google.com,
        Greg Thelen <gthelen@google.com>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>, masahiroy@kernel.org,
        Sami Tolvanen <samitolvanen@google.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        frederic@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Nov 27, 2021 at 3:41 AM Fusion Future <qydwhotmail@gmail.com> wrote:
>
> It seems after updating to linux-next-20211125, my system is crashing
> frequently due to "kernel BUG at mm/page_table_check.c:101".

Thank you for reporting this issue:

 99                 if (anon) {
100                         BUG_ON(atomic_read(&ptc->file_map_count));
101                         BUG_ON(atomic_dec_return(&ptc->anon_map_count) < 0);

This BUG_ON checks that during unmap anon map counter (cleared in
ptep_clear_flush()) does not become negative. If it becomes negative
it means that we missed accounting for this anon mapping during
set_pte(). Is there a config and environment that I could use to repro
this problem?

Thank you,
Pasha
