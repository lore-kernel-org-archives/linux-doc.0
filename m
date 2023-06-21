Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD21DEB64D7
	for <linux-doc@archiver.kernel.org>; Wed, 21 Jun 2023 01:10:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjFUBK0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Jun 2023 21:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjFUBKZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Jun 2023 21:10:25 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0410510D2
        for <linux-doc@vger.kernel.org>; Tue, 20 Jun 2023 18:10:24 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-311153ec442so4234739f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Jun 2023 18:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687309822; x=1689901822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4w/R+Mf53kbfZt8K24IHLZXz9+eDHTi3EyqbU5KkEk=;
        b=Va6iSr23ANWIx2aRfTzGmtPQ8NBwGOB2NftAygx4a3QkJ1bGBqoxcQ5raYI0Pxr+VE
         wXFmrGBFKZhyRIfnkA+P6kSw4pfbzdbyAC2JYfi9sm6gqslb4O6n/uexyZfFF1djufD9
         z3W6A2IJYPThi2faIAFdl1uWPhsPVCWhOfn6vjPb9pKBjufZC9o1rj140d2TenbYjDm+
         ALL+MXleOyeSpIKLHUmuhJ9LPq1L8gJhwdim6PgWK104Wn/ln8rGCCv2n0wEFNW1QvQm
         NcQG+U5SfpX3/GwG28vcmHq7kebQH8D6tVjuQNj4xLtvPOyWvE3jeB/V8tkBYfqs02Pl
         cKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687309822; x=1689901822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4w/R+Mf53kbfZt8K24IHLZXz9+eDHTi3EyqbU5KkEk=;
        b=SHI0utRUMaLeXKYVGJt61VfFMJhoxyNy/GMBNOs31I5JKMTwBqowvQPhset68jWMhv
         yw5MKZ0MybycUbLDGBA4Ghr9JXtz2FR9iAq/PDnJ9oPJrOkAyUeK+Fh0ngVTS0G499D1
         DzUYvu/yqny4lrjEB4yz+Y8jMsuaOoHW7DmetYYWvvYel8BiyPmaDjHt6lPh7sF0EtYg
         +KEZX87/gGPHFtMLLuRwarLc8S5B3ewbff5oB/6LBdtY94ghpb+ZuqBN8BxEo5qtUSGf
         YBHgSUN34gFXUtF5VorXsVpic3S0RqLeYUPFlL7QzcgZcCMf2rxXzKWdPmkAE5Inkfr1
         yhMQ==
X-Gm-Message-State: AC+VfDzaQMJEswgOV0cxUI8K1HgX7g8UWAjwIeDQ/FQJ4cDnY+OyI5UL
        4z1hubccPahKm+DbR/VgJ5ADcWBnDbA=
X-Google-Smtp-Source: ACHHUZ5Bb6YmcIZ3uo9oYnUspYS2F6sRftInQcODWsC/A6xOb6WuMM0GANh5rZ8oNT/jUL0acmjYnQ==
X-Received: by 2002:a5d:6dce:0:b0:30a:e63b:950 with SMTP id d14-20020a5d6dce000000b0030ae63b0950mr17284956wrz.31.1687309822119;
        Tue, 20 Jun 2023 18:10:22 -0700 (PDT)
Received: from suse.localnet (host-95-233-134-55.retail.telecomitalia.it. [95.233.134.55])
        by smtp.gmail.com with ESMTPSA id x5-20020adff645000000b0031276f8be22sm3092993wrp.97.2023.06.20.18.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 18:10:21 -0700 (PDT)
From:   "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org,
        Matthew Wilcox <willy@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Mike Rapoport <rppt@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v5] Documentation/mm: Initial page table documentation
Date:   Wed, 21 Jun 2023 03:10:19 +0200
Message-ID: <13291493.dW097sEU6C@suse>
In-Reply-To: <CACRpkdaDLuryeFwq0tKzDUoyWagRf_w7BfhOuC8K-o-mhk2g_g@mail.gmail.com>
References: <20230614072548.996940-1-linus.walleij@linaro.org> <3045029.CbtlEUcBR6@suse>
 <CACRpkdaDLuryeFwq0tKzDUoyWagRf_w7BfhOuC8K-o-mhk2g_g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On luned=C3=AC 19 giugno 2023 10:16:56 CEST Linus Walleij wrote:
> On Sun, Jun 18, 2023 at 3:16=E2=80=AFPM Fabio M. De Francesco
>=20
> <fmdefrancesco@gmail.com> wrote:
> > I am writing to express my dissent regarding the proposal to add basic
> > information about the role of hierarchical (multi-level) page tables in
> > mapping virtual memory to physical page frames.

[...]
=20
> Assuming that newcomers to the Linux kernel have formal academic
> background or specifically operating system education is a bit thick
> IMO, suffice to read pages 108-111 of Glyn Moody's book
> "Rebel Code" about the background of the network maintainer.
> There are a whole bunch of random people attracted to Linux
> development.

Linus,

I must admit that I have had a change of heart regarding the necessity of t=
his=20
documentation.

This change came about after reading Jon's reply, as well as your own.

However, it wasn't just because of the two of you. It was mainly due to my=
=20
conversations with some colleagues I work with, who hold M.Sc. degrees in=20
Computer Science.=20

Despite not having a formal background in CS or CE myself, I have taken the=
=20
time to self-teach the subject matter, which I expected them to be well-ver=
sed=20
in.

To my surprise, they only have a vague understanding of page tables and the=
=20
fact that processes use addresses that may not correspond to physical=20
locations. That's about it!

Hence, I now fully support your initiative and want to express my gratitude=
=20
for undertaking this task.

The only thing I would prefer not to see is the historical reference to the=
=20
first implementation of hierarchical page tables. After all, many concepts=
=20
implemented in Linux are derived or adapted from existing knowledge or=20
implementations in other kernels. However, I can also understand why you=20
prefer to have it as an introduction to the subject.

Once again thanks,

=46abio



