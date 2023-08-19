Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00BDEE49A3
	for <linux-doc@archiver.kernel.org>; Sun, 20 Aug 2023 00:29:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjHTA3N (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 19 Aug 2023 20:29:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbjHTA2r (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 19 Aug 2023 20:28:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E2F5337B5
        for <linux-doc@vger.kernel.org>; Sat, 19 Aug 2023 15:49:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 24D3560E93
        for <linux-doc@vger.kernel.org>; Sat, 19 Aug 2023 22:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88AB4C433CA
        for <linux-doc@vger.kernel.org>; Sat, 19 Aug 2023 22:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692485343;
        bh=kt6HRmoAxyQ+g+xRJ8gAjYUo+itgYgs6KUxXT9GPvKI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=C5hgnqVJIE453eMQ411nZcDPSXULZ5pvu2PQOe06kzpfNJ/QYNkm14hZnja1m1qaa
         OiXcVSRGqt5NWtr1MA+vqyhgaa2B2pOFAYaP66cde/3LEX4WP3HkXEF/yBGiMoTbBv
         nFKOdh/DkbwpptXaXB1waViAJEasx5Oo/s3Z4cHqNtb9rhbRkE/fHt7GY5OosgYGig
         2ngdW7xlkow3v4spdky2dytbk+e+apPfiG6DD8nZmccAgRbNHBbb+PCmKu9toPOeqD
         Q5Jbc5NIGEy8wI5/NcQtbY21cT8uokU5CkY5/sSc8Rjaz3Ox1Yt8S/lImz2FcKXEA9
         7VEDXsIYfaCSg==
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6bd0a0a6766so1634954a34.2
        for <linux-doc@vger.kernel.org>; Sat, 19 Aug 2023 15:49:03 -0700 (PDT)
X-Gm-Message-State: AOJu0YyGz/0zkOFqhwIW+qay2cv1QauiUBRDov2Nwb3ifxXTHxDY7Z10
        HwZkJMs4OwMxHzRZqTPsOZOLiXxsIPA98qTL9vM=
X-Google-Smtp-Source: AGHT+IGfDAMlX3Izyv4hEazXTl9htOBX0lXnNklHZPW8Dt4EMGa8oVIocnKdqwkF81IM99XOsX2C50vdBw0afJxrdVo=
X-Received: by 2002:a05:6870:2051:b0:1bb:5892:2f76 with SMTP id
 l17-20020a056870205100b001bb58922f76mr4337128oad.4.1692485342783; Sat, 19 Aug
 2023 15:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230817144142.903553-1-willy@infradead.org> <87cyzkmh26.fsf@meer.lwn.net>
 <ZN+m9Bb7P+uH/TN8@casper.infradead.org>
In-Reply-To: <ZN+m9Bb7P+uH/TN8@casper.infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 20 Aug 2023 07:48:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNARKv_HGsF3r076u+G1ia645stimnoYc93CQ-9_3wvBe5w@mail.gmail.com>
Message-ID: <CAK7LNARKv_HGsF3r076u+G1ia645stimnoYc93CQ-9_3wvBe5w@mail.gmail.com>
Subject: Re: [PATCH] doc: Always check kernel-doc
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Carlos Bilbao <carlos.bilbao@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Aug 19, 2023 at 2:14=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Fri, Aug 18, 2023 at 10:49:37AM -0600, Jonathan Corbet wrote:
> > "Matthew Wilcox (Oracle)" <willy@infradead.org> writes:
> > > kernel-doc checks were initially enabled only for builds which had ex=
tra
> > > warnings enabled.  We have now eliminated enough kernel-doc warnings =
that
> > > we can enable kernel-doc checking by default.  This comes at a slight
> > > cost; for an allmodconfig build, make -j8 fs/ timings on my laptop
> > > increase by less than 5%:


Adding CONFIG_KDOC_CHECK or something
will allow people to avoid 5% build-time cost.
You can set "default y" or "default COMPILE_TEST".



> >
> > So I'm not opposed to this and can carry it in docs-next (after the
> > merge window, though, for something like this).  But, it seems to me, w=
e
> > should copy Masahiro (added) on a build patch of this type.
>
> Thanks!  I've got a small collection of doc fixup patches redy to go;
> I'm going to spray them at maintainers and see what lands in this
> merge window.  I'm focusing on mm/ and fs/ since I know those areas
> better than others.  net/ is in good shape; only 25 lines of errors
> (21 of them in ceph).

Any single instance of warning may result in a rejection by Linus.
Anyway, we will see.




> I would suggest that we still have quite a lot of kernel-doc which is
> not incorporated into .rst files, which seems like a shame.  Does anyone
> have time to write a script that finds every file with kernel-doc in
> it, then finds which of those files do not have ".. kernel-doc::"
> lines in Documentation/ ?



--=20
Best Regards
Masahiro Yamada
