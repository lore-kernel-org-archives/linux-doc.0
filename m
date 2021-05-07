Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB76C433ED
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 08:52:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B07661430
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 08:52:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233079AbhEGIxV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 May 2021 04:53:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:49712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231906AbhEGIxU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 7 May 2021 04:53:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E02161443;
        Fri,  7 May 2021 08:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620377541;
        bh=B1EvHxNtZfx053N5lQwM9L6bg2iMxtlTLQnX75YvYmI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BqP89u2UoIUVtfm6NIuXDTdN8vv1+XpV0CHO6F1r/y/xICENczuaiz7cuNCMiffFm
         V02rgZTabIsGor5GTvrve4immQYtu4XC8FIoLgd+rj7ki6snTcGI/KHPGFwAk0fTVH
         YZY5AlVX5h7jr4w6BE7w46gTfCWtogP413sY/A6r138otARKuxKDhc+oZOvF2wiq2p
         WqJ3KmJYpgtvW136F1M5d7Z1VNz0rT408SD+P+W6c0AML1EuecQ1C7bUWuY3KzTyQj
         MMf3nEgzXRzB6Ibn0Xu6nJm3xn+9iMVSMU7ArkK9E87xZf8xPbm71Bj3/nj2RZiEFI
         mape0wN0EZcjQ==
Date:   Fri, 7 May 2021 10:52:15 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Cc:     Markus Heiser <markus.heiser@darmarit.de>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1'
 codec can't encode characters in position 18-20: ordinal not in range(256)
Message-ID: <20210507105215.0902461d@coco.lan>
In-Reply-To: <20210506180625.GI6564@kitsune.suse.cz>
References: <20210506103913.GE6564@kitsune.suse.cz>
        <30f2117f-aa38-6d60-f020-ff5cf8f004b5@darmarit.de>
        <20210506184641.6348a621@coco.lan>
        <0fd5bb54-a8fc-84b2-2bd6-31ab12f12303@darmarit.de>
        <20210506192756.2a2cc273@coco.lan>
        <b6059fb8-dd68-5564-a29f-8d8e828b2946@darmarit.de>
        <20210506180625.GI6564@kitsune.suse.cz>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Thu, 6 May 2021 20:06:25 +0200
Michal Such=C3=A1nek <msuchanek@suse.de> escreveu:

> On Thu, May 06, 2021 at 07:53:25PM +0200, Markus Heiser wrote:

> > Hi Mauro,
> >=20
> > it is not comfortable but is it mad? ..
> >=20
> > Most often languages (or applications) do not handle encoding
> > of strings they just piping a binary stream while python
> > decode / encodes strings.
> >=20
> > "The Zen of Python" [1] says
> >=20
> >    Explicit is better than implicit.

This was taken into an extreme with regards to charsets:

	 "better" should never be translated to "crash" ;-)

> > If a stream can't encode symbols and these symbols should be ignored
> > you have to set the encoding of the stream explicit to ignore
> > such symbols. =20
>=20
> The problem is this part never happened. Loggers are supposed to tell
> you about the error in your application, not crash it.

It is insane to crash the error log due to a charset issue ;-)

> But the problem with Sphinx may be that the output file is also assumed
> to be in the locale encoding, and the output encoding is never set. It's
> HTML so it could be encoded with entities, too.
>=20
> The idea about handlinng encoding precisely is not mad in itself but then
> everybody working with just ASCII and never testing their software works
> in the cases where explicit handling is needed is the mad part.=20

True. The machine's locale shouldn't affect *at all* the produced
documents. See, there's a hole set of non-latin family of charsets
supported on Linux:

	https://man7.org/linux/man-pages/man7/charsets.7.html

Nothing prevents that someone using a machine whose default encoding is
KOI8-R/BIG-5/GB 2312/JIS X 0208/... to use Sphinx to produce=20
UTF-8 [1] documents.

[1] or whatever other output encoding

Ok, the logger may not be able to correctly display certain
chars, but it it be perfectly fine and sane to use //TRANSLIT (or
something similar) in order to do a charset conversion.=20

Even to just print a <?> for all chars that aren't printable at
the logger's output using the charset set by LANG/LC_* is=20
better/saner than crashing.

Thanks,
Mauro
