Return-Path: <SRS0=e/bK=4N=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2183BC35DF5
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 10:38:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA43721927
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 10:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582627136;
	bh=znm2D4PmMgm9JZjRjbgLKQfutNaFm7L/OldhxXmYlCA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=Ii8FrEZLTFj+QMCuOVOCXwTXx0biAd2O0gRgWo5ycYLI60bQf8McZJJc4Z2SGzYya
	 5CPPzE5nFOdcBW61gtpfLOL1dbVEck+YOLTzCEkP6qiqxqapM1lxuWJywOTCgJgxGC
	 eo90449P42pzgs7x3eKRDPDe/TFVhCzMs9kY7pl8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730340AbgBYKiz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Feb 2020 05:38:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:40724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730339AbgBYKiz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 25 Feb 2020 05:38:55 -0500
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BCB8D222C2
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2020 10:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582627135;
        bh=znm2D4PmMgm9JZjRjbgLKQfutNaFm7L/OldhxXmYlCA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=06+lvJcVXmBpXn1avAjOL0BePxRGWsbXl5DcvzpXiOj+JcEGf+jHQQq4EBRIq2I/A
         XlQIMaN4OAWtSgppWKTl4p9Rbwukrwgay0+WZMfyIcf8LvTcfRX+/7FPKleCFHr8Tm
         Gmj+hgjGSDOoyUyN/P/jb7m+vi6LFMIKK2s8jWb4=
Received: by mail-wr1-f54.google.com with SMTP id p18so10449646wre.9
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2020 02:38:54 -0800 (PST)
X-Gm-Message-State: APjAAAWS/SPrePa/ud9PwauUE23i7ZPPePubVB9w63HvVuic/e8O3sTR
        zayKRGSloNbziO8C+PnnEJbfOWGVcr656CvAf3zL8Q==
X-Google-Smtp-Source: APXvYqzOiI4/W8Rvpu0osBmhpfrbgs5jUmWtiMeqyyTk+24SZyBFmY8xIxOk3+1Z+RBlQHjL60qhUbVnt4vfJXMTyhE=
X-Received: by 2002:a5d:5188:: with SMTP id k8mr72425217wrv.151.1582627127547;
 Tue, 25 Feb 2020 02:38:47 -0800 (PST)
MIME-Version: 1.0
References: <20200221035832.144960-1-xypron.glpk@gmx.de> <20200225032500.5b6be465@lwn.net>
 <CAKv+Gu9sjOS7S+T42UcdnA2JCwgKawRJAdKHcwXWQXQaHSPZDQ@mail.gmail.com> <20200225033802.4e7c09d7@lwn.net>
In-Reply-To: <20200225033802.4e7c09d7@lwn.net>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Tue, 25 Feb 2020 11:38:36 +0100
X-Gmail-Original-Message-ID: <CAKv+Gu9bn_0aEZwTO7FRteYF9MO+7AOU4OJzNVsi359R2MkWSA@mail.gmail.com>
Message-ID: <CAKv+Gu9bn_0aEZwTO7FRteYF9MO+7AOU4OJzNVsi359R2MkWSA@mail.gmail.com>
Subject: Re: [PATCH 1/1] efi/libstub: add libstub/mem.c to documentation tree
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Heinrich Schuchardt <xypron.glpk@gmx.de>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 25 Feb 2020 at 11:38, Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Tue, 25 Feb 2020 11:26:01 +0100
> Ard Biesheuvel <ardb@kernel.org> wrote:
>
> > > Given that this patch depends on work in the efi tree, I'm assuming that
> > > the docs changes will go in via that path as well.
> > >
> >
> > Can I take that as an acked-by?
> >
> Yes, of course:
>
>   Acked-by: Jonathan Corbet <corbet@lwn.net>
>

Thanks Jon
