Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612D5C46467
	for <linux-doc@archiver.kernel.org>; Tue,  1 Mar 2022 20:24:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238195AbiCAUZA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Mar 2022 15:25:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238542AbiCAUXV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Mar 2022 15:23:21 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0683AA0BF6
        for <linux-doc@vger.kernel.org>; Tue,  1 Mar 2022 12:20:38 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id m14so28825365lfu.4
        for <linux-doc@vger.kernel.org>; Tue, 01 Mar 2022 12:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PdjKf/a3poLbp/gbxt+Rqw8zr6wpWCPEMBt3Gdf0vVY=;
        b=K7n4eVxkkqxw4LVOCYp6qjz4Lrn8nUG8scqpDLjNdEqFXZMud6qwqiSVAz5st7Yg7d
         vC2q3Dqvtvzi4XIPeFoMoc2+dMBhZ16QOgzUWOKknYeZr7LRcjqzvrH7Gver9/sEKKQs
         f6/zgOwraRIJv6M9/T7aFKvmQFpJdJkC/c588=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PdjKf/a3poLbp/gbxt+Rqw8zr6wpWCPEMBt3Gdf0vVY=;
        b=cDihLAwO++jpIM8L47pqAXeBANSBD0Vd7rKod+2PALdXkZSBpD5upLGYIy27sxVNbZ
         gHOSgX4dECZY96wi0eDj1kIckpueU/F7FZ7bEyrzNGOJKRsOlhpsRjwJXvA5MGSKvkMV
         7wUQQc9XG1ehm/MYVu194HIgmb3Hm+AuqMT8Pi2//qHlnhmFeAnvwoRBL13e+/0KTRho
         iKbHvtginXoajiJ5q9z+cTJxH7WfwHI25x/Y4rvhn4hWw9g/Lr2EKllet/sCf8p4ENFQ
         jBebJK0KlC1H8EJsHbBU4JDzlvHoeELGo+IdnqQqDrqWscpNaFaJNaoTXWCbXeWFZsJq
         jgug==
X-Gm-Message-State: AOAM530xbT01eHhds2X5FlloZPl2iZMCm+vbz2x/udRTuf17XzmhMziX
        sFrqYd/fhZfmqQkwuFLJGg/b2Omiat2IvG+zzAE=
X-Google-Smtp-Source: ABdhPJynUMyTsVuR8UUlwlsPTIq8rBzNFjzfnBnV8udLpsXLtWql2lgzW6NxG8o2IKNXHVnlzmxtZA==
X-Received: by 2002:a05:6512:1105:b0:443:8b92:29ff with SMTP id l5-20020a056512110500b004438b9229ffmr16958999lfg.413.1646166028722;
        Tue, 01 Mar 2022 12:20:28 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id u16-20020ac25190000000b004433b80c1d3sm1651711lfi.182.2022.03.01.12.20.26
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 12:20:27 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id 29so23371000ljv.10
        for <linux-doc@vger.kernel.org>; Tue, 01 Mar 2022 12:20:26 -0800 (PST)
X-Received: by 2002:a2e:aa1f:0:b0:244:c2ea:7f20 with SMTP id
 bf31-20020a2eaa1f000000b00244c2ea7f20mr18277669ljb.164.1646166026459; Tue, 01
 Mar 2022 12:20:26 -0800 (PST)
MIME-Version: 1.0
References: <20220301145233.3689119-1-arnd@kernel.org> <20220301145233.3689119-2-arnd@kernel.org>
 <CAKwvOdnkfuT_w_0RNCb+WTKJ+282zLKmhB9UNG=D-UFz9VkUng@mail.gmail.com> <CAKwvOdn-PrCUPe2WzLv18AH3=9DjtFES+r=M1DhoQivy8sHm-g@mail.gmail.com>
In-Reply-To: <CAKwvOdn-PrCUPe2WzLv18AH3=9DjtFES+r=M1DhoQivy8sHm-g@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 1 Mar 2022 12:20:10 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh4OdQANe7TLYGdPWUub0MEdbGDr72wpATHxypaSEGAyg@mail.gmail.com>
Message-ID: <CAHk-=wh4OdQANe7TLYGdPWUub0MEdbGDr72wpATHxypaSEGAyg@mail.gmail.com>
Subject: Re: [PATCH 2/3] treewide: use -Wdeclaration-after-statement
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Marco Elver <elver@google.com>,
        Jani Nikula <jani.nikula@intel.com>,
        David Sterba <dsterba@suse.com>, Alex Shi <alexs@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        llvm@lists.linux.dev,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 1, 2022 at 12:06 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> That said, there's a few additional places that reset KBUILD_CFLAGS.

Yeah, the boot code and vdso code often sets its own private flags,
because it's _so_ different.

The generic kernel CFLAGS often don't work at all, because that code
may be doing some truly horrendous things.

So I agree that this may not catch all the kernel code, but I don't
think it's much of a problem.

             Linus
