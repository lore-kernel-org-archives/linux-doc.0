Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5C3E57D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue,  9 Jul 2019 13:08:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbfGINIH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 9 Jul 2019 09:08:07 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:34601 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfGINIG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Jul 2019 09:08:06 -0400
Received: by mail-ed1-f65.google.com with SMTP id s49so17742502edb.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jul 2019 06:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZUz4WDQf+ePZiJBY+IeyizcaneS7fRJMcv4JWg/06b8=;
        b=Hm1OhBOVDMZQHda4zzcLuqGw7waEGq2WvK+G8jN8/SRdmwfeo/59Bi1wqs5ICvYh45
         GSjHRCeswdfMkPiDeZA4K7UuRQ+BVA61r4PJ6Dtal6ytrFHpU6gZjMj/6wjBhdP3VjxE
         gy2rOEL5UW0eDkKhXLHxmiw6wc3KjwZu15XvEPQ54pKulEfTZdYyjRjm5VPGzd5S84dg
         Ov9r7Pm2PMSdm3IS9926s6o8cfugx62BAxygvgcv5VnWSurbToFFkRfD9DFMr31Bg8rC
         QRb/uiLG96RBV5+2aXtAVpUJ7HGaNLcmpvDHc8a5cLRQO52fZuUjLf2QN5y+OcMPBFvw
         g6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZUz4WDQf+ePZiJBY+IeyizcaneS7fRJMcv4JWg/06b8=;
        b=NPy/ql2cqOaGOqa5YTFKZdA8UwsoG/VssDSBoKQnD0G9mOo9iL/vLrvtLdwqgzo2Hh
         /j5P4WPqvf3xq5gABRoNZ80krbam35R3ilV5KgDOqJEB+MU9x/q/QQ0gbvPs/EXmJ7ZB
         mIqs1vv2Bx6DrPzLdWjSvyy6XbAHhqAMCRmpWmnDk8YKtxJYtU2mizjMJB6PKC5d3dSK
         tJxYrN5cJSnArF8HaG8KWpqXOxfV59wvTtDgaR4M+eYH7znpgxVLEXgbuBgP10O97JT5
         fAME8Q4+SkDbLtCEbdgldBDPX1bQY0EGdNNDRsZefaHgV7NIvQqyYoYOCYI/VGavH1f1
         /5nQ==
X-Gm-Message-State: APjAAAUDRBU11cYO3yVhFIRoZCC2k9GxB7Lw9sualTGSSU1mtPJGQOg6
        8v8NPpaeq7ykbTfQAyM+PNcQWzxrinpHV/uxsW1TyA==
X-Google-Smtp-Source: APXvYqxiyJAFhEGRILc1BLQA9hva/JyooHVB+Ro4OjuwmAXAGlQqOwGA/cJXY+H0KZR6uBrhYIjHWmDcBko3Uo9wDmU=
X-Received: by 2002:a50:a4ef:: with SMTP id x44mr25897335edb.304.1562677684997;
 Tue, 09 Jul 2019 06:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190708211528.12392-1-pasha.tatashin@soleen.com>
 <CACi5LpNGWhTnXyM8gB0Tn=682+08s-ppfDpX2SawfxMvue1GTQ@mail.gmail.com>
 <CA+CK2bBrwBHhD-PFO_gVnDYoFi0Su6t456WNdtBWpOe4qM+oww@mail.gmail.com> <2d60f302-5161-638a-76cd-d7d79e5631fe@arm.com>
In-Reply-To: <2d60f302-5161-638a-76cd-d7d79e5631fe@arm.com>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Tue, 9 Jul 2019 09:07:54 -0400
Message-ID: <CA+CK2bA40wQvX=KieE5Qg2Ny5ZyiDAAjAb9W7Phu2Ou_9r6bOA@mail.gmail.com>
Subject: Re: [v1 0/5] allow to reserve memory for normal kexec kernel
To:     James Morse <james.morse@arm.com>
Cc:     Bhupesh Sharma <bhsharma@redhat.com>,
        James Morris <jmorris@namei.org>,
        Sasha Levin <sashal@kernel.org>,
        Eric Biederman <ebiederm@xmission.com>,
        kexec mailing list <kexec@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>, will@kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> > Enabling MMU and D-Cache for relocation  would essentially require the
> > same changes in kernel. Could you please share exactly why these were
> > not accepted upstream into kexec-tools?
>
> Because '--no-checks' is a much simpler alternative.
>
> More of the discussion:
> https://lore.kernel.org/linux-arm-kernel/5599813d-f83c-d154-287a-c131c48292ca@arm.com/
>
> While you can make purgatory a fully-fledged operating system, it doesn't really need to
> do anything on arm64. Errata-workarounds alone are a reason not do start down this path.

Thank you James. I will summaries the information gathered from the
yesterday's/today's discussion and add it to the cover letter together
with ARM64 tag. I think, the patch series makes sense for ARM64 only,
unless there are other platforms that disable caching/MMU during
relocation.

Thank you,
Pasha


>
>
> Thanks,
>
> James
