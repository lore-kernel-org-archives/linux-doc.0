Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC8DC433FE
	for <linux-doc@archiver.kernel.org>; Sun, 28 Nov 2021 16:59:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbhK1RDE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 28 Nov 2021 12:03:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238665AbhK1RBD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 28 Nov 2021 12:01:03 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EB05C061748
        for <linux-doc@vger.kernel.org>; Sun, 28 Nov 2021 08:57:47 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id t5so61958918edd.0
        for <linux-doc@vger.kernel.org>; Sun, 28 Nov 2021 08:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hygTGueH+TpsmNvqO/xI0PfLf0AbmwXxiFK2b43VdDA=;
        b=UC3FsnutK3c+2D72zzm1AYYxj1fsYRNidiiWn1BPas2Z8CsWVcGovs77qZ9RDeb3Bo
         2pQU4sSsZuuinuAf+whfjK1op1tkF6DMX8/zuxLHxZNTsdQMMqe7+K1wUvZe5a4NacSr
         fpWT4KQcyi1PoXODnom+kdKZPxvyP3XIGcOIsQ29lhNNfjJ2FLNZBOwzkWtVAKzVQfAZ
         QMCJNaUHKmiN8Hh4X57gnsXaJaeqB5qfP2y+DwRYvxt2BsDgpcBBq+5oIiX02OMjK2HD
         h/6XigX4xY/Z/BvXhIdMnPfss2JewLXq1xd0Oke9X8byYPEogcLuibZzjXx2HRsJxyvp
         5byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hygTGueH+TpsmNvqO/xI0PfLf0AbmwXxiFK2b43VdDA=;
        b=XwBCBehwFDEdCNkqEt0akaUlGuxPKs15E+j3gNeRa5EUw1PRB5/JZX257hQb/f4Nxw
         I5KC/rhMV3zbBI7K6H0gg8YQOzz18+Psz3emRIRUfH11VE4J0vdNjp0cIevfQAlqJsDs
         vWxccDF3LTMGL8vKBNxqPOW+0Te/WKqguAJgmIwAnJJMkhFiCVxsIDxNq0kcx6SDVpet
         DrvN2hVdky2lxNW/gKSZyhev8quB/rfVpYKYvKwDuLf6jYtIex0ottp1MsWfI/Xe8yOT
         /vV8fwP9FnrvhnZKguUf+IbxdnyAFbFPy0eSwvKACgF3VOs1fxOUodzd2ubKNKFCy+TX
         gg9w==
X-Gm-Message-State: AOAM531guqmbnHlWlLztu0pM7mRu5TMSB00Iv+ALcOAm/S/a7EL5IjCN
        in+xTMt8AB1N0LIqTtP0IynIR/jFh3uDiFeQoQaNVA==
X-Google-Smtp-Source: ABdhPJy270/OctF0embo/utcMpyGS+idrT99w1PP6Ttlhkvr7f8h2YIfCLyWiPBA/vd/opxEtFmZQxdXlVTeBMWcfFs=
X-Received: by 2002:a17:907:94c7:: with SMTP id dn7mr9396435ejc.470.1638118666062;
 Sun, 28 Nov 2021 08:57:46 -0800 (PST)
MIME-Version: 1.0
References: <20211123214814.3756047-1-pasha.tatashin@soleen.com>
 <20211123214814.3756047-3-pasha.tatashin@soleen.com> <6d82e674-76dc-f3b0-2e53-a92eeb249eff@gmail.com>
 <CA+CK2bAX2XmMrt9RBGiUV7LG_sbpB7ov6bxMVjr5FSBVirE1CA@mail.gmail.com>
 <7d339956-27fb-4eb6-bd73-791807ddef56@gmail.com> <9e0014e8-e251-360c-ad82-334ad0f28303@gmail.com>
In-Reply-To: <9e0014e8-e251-360c-ad82-334ad0f28303@gmail.com>
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
Date:   Sun, 28 Nov 2021 11:57:10 -0500
Message-ID: <CA+CK2bDiWc2y=CW6d=6raaf9Haq2vuWQDTQZ-aAyLDdpq5aQPQ@mail.gmail.com>
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
        "maintainer:X86 ARCHITECTURE" <x86@kernel.org>,
        frederic@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Nov 28, 2021 at 11:54 AM Fusion Future <qydwhotmail@gmail.com> wrote:
>
> > So it could be when memory consumption is over a certain percent, the bug will be triggered.
>
> Bisected and at the commit "[04ce8955fbe4d84376b92b875c42942489fcf3c5]
> mm: page table check", the system still doesn't encounter any freezes.
> So it's not this commit that introduces the bug. Sorry for bothering.

This commit by itself would not cause the freeze or BUG_ON(), but the
next commit which enables it on x86 arch might.

Pasha
