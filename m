Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BA6C433FE
	for <linux-doc@archiver.kernel.org>; Sun,  6 Nov 2022 13:47:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbiKFNrG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 6 Nov 2022 08:47:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbiKFNrG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 6 Nov 2022 08:47:06 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C96F113B
        for <linux-doc@vger.kernel.org>; Sun,  6 Nov 2022 05:47:05 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id l11so13854527edb.4
        for <linux-doc@vger.kernel.org>; Sun, 06 Nov 2022 05:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4Cc3Cob2HMpA+4FuJJhkFj8IUBM4Qig1zRJRYFxaKeQ=;
        b=i+XtjvGSXRuumvaCFDiGQ3DTX1a6VYta2aAmDaYwPeZV47m/TFpCpgYNvrvc+oviIc
         2v6YOarLLUwNPaNXG8Sd8zzObAmDR3OuSwflTqP3Pi8wYUPLcRb3qpcUcNX3H5lME1AO
         2YX5341IlxRbenFdpH4Es5tSBqMgLe5DoNd2yUivWgB74w6B/haOqesq+5VOdo/V8l0Z
         J5446eY1lR+EavB5zej6PEfU9yVi3zznqcqVDLX2a5oVf8Uxq2EwI4Gueh7id3f/7H+d
         CNeqE3CEhAj7plFdnJ2OGxgnsWRc1lh0bEV7f3aBeHpEOhnPUIus1TymFzzJW/HePhtD
         olPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Cc3Cob2HMpA+4FuJJhkFj8IUBM4Qig1zRJRYFxaKeQ=;
        b=JVzRry8hPo3sq5IEP73QT3uBcxDl/bXxR/blxvAYb3YzKowsAwS8K8XLxRkHzDnp6h
         nPEBcibbHfI4ZuLyn+WJJFBm3s6irQo6vIaC2jcxKTeYcpcw5pXT8k1wwDz+vE1O/mqb
         hKWHZlKGHepOLbMCABtc07RCSRdX+lqduGRkWiPmELFlRvbkJjLmRQAVU6yPg8w8BID8
         a3zTkUVY+ottJvmiFtgTgK4D8WQ5FtImmc6SVjU1rfLT9MSSRC7TiPRaEaFAL3ptllMA
         7TdQp2YYRJnt2VTgctlfNZjkTgNvK1BKTYusOV4vDMeQdmLks4RVKeJ4DZlzPOe4CY4Z
         bSFg==
X-Gm-Message-State: ACrzQf3U+AY62kGmnC8jAogJ2e2oQYU1QpWdzPWinseUzKYD7fCaO4LU
        Shj2cMk26xh87azpCzOCHU/LOrTUNmNWDkwIOiD1SQ==
X-Google-Smtp-Source: AMsMyM48U0SeoynJS9XayTwbS33kzjYHL5TJWZzzOCIZ/D3eTcq7XZQc+SJqFkFx2x40ydFcGhc0xE5HaNQArM9a8qE=
X-Received: by 2002:a50:eb83:0:b0:462:a2ac:8623 with SMTP id
 y3-20020a50eb83000000b00462a2ac8623mr45311356edr.360.1667742423783; Sun, 06
 Nov 2022 05:47:03 -0800 (PST)
MIME-Version: 1.0
References: <20221105025342.3130038-1-pasha.tatashin@soleen.com> <Y2YuDfQbAwtLRLq4@debian.me>
In-Reply-To: <Y2YuDfQbAwtLRLq4@debian.me>
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
Date:   Sun, 6 Nov 2022 08:46:26 -0500
Message-ID: <CA+CK2bB2wz1c0kt0gegZ-MGnYBjbcdh3H-qo15R-egqt8pvquA@mail.gmail.com>
Subject: Re: [PATCH] mm: anonymous shared memory naming
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     corbet@lwn.net, akpm@linux-foundation.org, hughd@google.com,
        hannes@cmpxchg.org, david@redhat.com, vincent.whitchurch@axis.com,
        seanjc@google.com, rppt@kernel.org, shy828301@gmail.com,
        paul.gortmaker@windriver.com, peterx@redhat.com, vbabka@suse.cz,
        Liam.Howlett@oracle.com, ccross@google.com, willy@infradead.org,
        arnd@arndb.de, cgel.zte@gmail.com, yuzhao@google.com,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Nov 5, 2022 at 5:34 AM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> On Sat, Nov 05, 2022 at 02:53:42AM +0000, Pasha Tatashin wrote:
> > Since:
> > commit 9a10064f5625 ("mm: add a field to store names for private anonymous
> > memory")
> >
> > We can set names for private anonymous memory but not for shared
> > anonymous memory. However, naming shared anonymous memory just as
> > useful for tracking purposes.
> >
>
> Who are "we"?
>
> Instead, say "Since commit <commit>, name for private anonymous memory,
> but not shared anonymous, can be set".

Thanks will update.

>
> > @@ -431,8 +431,10 @@ is not associated with a file:
> >   [stack]                    the stack of the main process
> >   [vdso]                     the "virtual dynamic shared object",
> >                              the kernel system call handler
> > - [anon:<name>]              an anonymous mapping that has been
> > + [anon:<name>]              a private anonymous mapping that has been
> >                              named by userspace
> > + path [anon_shmem:<name>]   an anonymous shared memory mapping that has
> > +                            been named by userspace
> >   =============              ====================================
> >
>
> The table above triggers Sphinx warning:
>
> Documentation/filesystems/proc.rst:436: WARNING: Malformed table.
> Text in column margin in table line 8.
>
> =============              ====================================
> [heap]                     the heap of the program
> [stack]                    the stack of the main process
> [vdso]                     the "virtual dynamic shared object",
>                            the kernel system call handler
> [anon:<name>]              a private anonymous mapping that has been
>                            named by userspace
> path [anon_shmem:<name>]   an anonymous shared memory mapping that has
>                            been named by userspace
> =============              ====================================
>
> I have applied the fixup:
>
> ---- >8 ----
>
> diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
> index 8f1e68460da5cd..3f17b4ef307fe4 100644
> --- a/Documentation/filesystems/proc.rst
> +++ b/Documentation/filesystems/proc.rst
> @@ -426,7 +426,7 @@ with the memory region, as the case would be with BSS (uninitialized data).
>  The "pathname" shows the name associated file for this mapping.  If the mapping
>  is not associated with a file:
>
> - =============              ====================================
> + ========================   ===========================================
>   [heap]                     the heap of the program
>   [stack]                    the stack of the main process
>   [vdso]                     the "virtual dynamic shared object",
> @@ -435,7 +435,7 @@ is not associated with a file:
>                              named by userspace
>   path [anon_shmem:<name>]   an anonymous shared memory mapping that has
>                              been named by userspace
> - =============              ====================================
> + ========================   ===========================================
>
>   or if empty, the mapping is anonymous.
>
>
> Thanks.

Great, thank you.

Pasha

>
> --
> An old man doll... just what I always wanted! - Clara
