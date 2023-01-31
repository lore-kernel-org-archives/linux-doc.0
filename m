Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F240C636CC
	for <linux-doc@archiver.kernel.org>; Tue, 31 Jan 2023 21:13:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbjAaVNH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 31 Jan 2023 16:13:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbjAaVNF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Jan 2023 16:13:05 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 136DB15C97
        for <linux-doc@vger.kernel.org>; Tue, 31 Jan 2023 13:13:03 -0800 (PST)
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com [209.85.219.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7E93B442FD
        for <linux-doc@vger.kernel.org>; Tue, 31 Jan 2023 21:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1675199582;
        bh=E3dApmotheLeT/eOa2wjKZ6tzLWOqP1QPvaTUoN7Zrw=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=LPsaeFq7SPxznWuc9w/BZDUrC8c51KD5hbn6WusKNBjFGYcjQFObPM32d9jGWsUVc
         5r0sKXPPYLD5v2Rw7HsXq7+cigHESTrqqXNKXK8XbNbEdc6nuWD2ej/UPMOn9HfUj0
         cIjA3tCWFCcR6clWZfWsjk0Oqnhsshz8lbXJtHYsycSg07oqpNb0HfXRZTY+KFzccS
         JPPr8nLSw01Tq5CyUV1F9nUA6QW1F0ej0A9oKQIP4XuPDSH5GYGOONoAxTGs+ZFxEA
         ZWO2Dreef8d+Djv/znkjmXyv2XVeuypBX4okm87Qhxl3akao2AVsNMEwP2RwC7JEp9
         YJXeenaLU660g==
Received: by mail-yb1-f199.google.com with SMTP id n194-20020a2540cb000000b008038647d9ebso17549694yba.5
        for <linux-doc@vger.kernel.org>; Tue, 31 Jan 2023 13:13:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3dApmotheLeT/eOa2wjKZ6tzLWOqP1QPvaTUoN7Zrw=;
        b=GPRjqyBPjlTkwtCgVpx3d61W5Ij+9up2ABUl5dn754yC2VdnV2FlL8DZyQ0rPIPc2U
         N/i9P9jJR85ss6/YUW7HULMsNdSBKMQACWzxUZMJcZs3FUhBbCLL39b6cXBLWIIYDDiy
         zLIM8E6J+/XqJzZQ2tPd7NQ0ggZrG7p7nE2RtjybedzTEtXYttx7V0mjjIAcV3PTSz49
         Y9WFt4hPucWaOf4KvjV2uL/dffOhF9TihhMJMxjikCL4Wj+I+kCngOqtXw8Cy64NZqAY
         L4sWTTkRD63+gH1J1jUeVaSzP0p+n+8+EHw5PAKj8y0BJnbm30CdWrSh+KywkjLLsBVn
         zCiw==
X-Gm-Message-State: AFqh2kp837vF20HCcymKEjV6Crf17I+kxIc1TaQZ7vUInmk+mb7HXdLK
        nOqbTxjpNagmLQLyPYljgt2jPiGPZkw6bnBg+1/sitWFNPERFkwH21mhpwJ9Rsjo4HPnQ05tCqs
        gfW0hDl69+3EDXoqwXxHibAHkfpAn6cif8vfYrQQP6AgTcFGrwv43zQ==
X-Received: by 2002:a0d:fd87:0:b0:46c:36ed:413b with SMTP id n129-20020a0dfd87000000b0046c36ed413bmr7131974ywf.115.1675199580936;
        Tue, 31 Jan 2023 13:13:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuAZCXgnQTSuhEQYytdfKwXPj4iRHgG+Ekq+j50BL69E2/r2c8BGuLrUd4Haf6Ux5FJr7K7hDN2RdEwvAAkO28=
X-Received: by 2002:a0d:fd87:0:b0:46c:36ed:413b with SMTP id
 n129-20020a0dfd87000000b0046c36ed413bmr7131968ywf.115.1675199580710; Tue, 31
 Jan 2023 13:13:00 -0800 (PST)
MIME-Version: 1.0
References: <20230131121608.177250-1-aleksandr.mikhalitsyn@canonical.com> <87bkme4gwu.fsf@meer.lwn.net>
In-Reply-To: <87bkme4gwu.fsf@meer.lwn.net>
From:   Aleksandr Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Date:   Tue, 31 Jan 2023 22:12:42 +0100
Message-ID: <CAEivzxfxkWtYP4bqFrmD__3M9WpJNZjTJNx9wp4WQ0_LoGKT6g@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs: filesystems: vfs: actualize struct
 super_operations description
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 31, 2023 at 8:56 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com> writes:
>
> > Cc: linux-fsdevel@vger.kernel.org
> > Cc: linux-doc@vger.kernel.org
> > Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
> > ---
> >  Documentation/filesystems/vfs.rst | 74 ++++++++++++++++++++++++-------
> >  1 file changed, 59 insertions(+), 15 deletions(-)
>
> Thanks for updating this document!  That said, could I ask you, please,
> to resubmit these with a proper changelog?  I'd also suggest copying Al
> Viro, who will surely have comments on the changes you have made.

Hi, Jonathan!

Sure. Have done and of course I've to add Al Viro to CC, but forgot to do that,
cause scripts/get_maintainer.pl have didn't remind me (-:

>
> > diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
> > index fab3bd702250..8671eafa745a 100644
> > --- a/Documentation/filesystems/vfs.rst
> > +++ b/Documentation/filesystems/vfs.rst
> > @@ -242,33 +242,42 @@ struct super_operations
> >  -----------------------
> >
> >  This describes how the VFS can manipulate the superblock of your
> > -filesystem.  As of kernel 2.6.22, the following members are defined:
> > +filesystem.  As of kernel 6.1, the following members are defined:
>
> Why not 6.2 while you're at it?  We might as well be as current as we
> can while we're updating things.

I'm on 6.2, but for some reason decided to put 6.1. Will fix it :)

Thanks,
Alex

>
> Thanks,
>
> jon
