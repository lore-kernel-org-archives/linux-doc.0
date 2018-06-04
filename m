Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DD53E7D043
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Jun 2018 15:38:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750815AbeFDPi1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 4 Jun 2018 11:38:27 -0400
Received: from mail-it0-f65.google.com ([209.85.214.65]:51509 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750759AbeFDPi0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Jun 2018 11:38:26 -0400
Received: by mail-it0-f65.google.com with SMTP id n7-v6so856783itn.1;
        Mon, 04 Jun 2018 08:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=y+WA7yYotvPjMxuA2Q/OiRZ3U0EtZFw7lmLXKgkBsSM=;
        b=QZjlJpzKAl8EzJqKc5XafHFL/6GiSwwwNt2XFyQwz46Y83uJhpAGfonJLPuQZLKihe
         ckoMg22qtFQAD0zWPfOc0qjwDoorINtDloIfarEALl9faE5yC9B6r/Fz/lInV+RXaPnV
         7ZZgMeOsEjqAR5nuoO7PP5XLvi2n/GZrYGi7PltMxXNdylyTfLj08ax8qOpD4vpjXHDD
         FsB33WRpdffqxnxghqx9HQg8zifqLP71WjDBoXWZi4eWnX4GoGBQPJ2LvvJDGbIDsQON
         4GHOyKJ5LnR8/YOqGt4TtU+lBPMOg6yAjB5CPTSfsiWP+3VhSO1PTsrONfTl/Miw53gV
         ZSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=y+WA7yYotvPjMxuA2Q/OiRZ3U0EtZFw7lmLXKgkBsSM=;
        b=ZCkWYhlGjnFZELgifyGkjSLNcurLMNa+oHB9OAy3LM5fWrFQMGcCgCAAAAgMTTIpm/
         QCQpahH8nThGLVsrJINScw+6UUCMzk8tH8XFMNS0tXisU3MfD1zudHM4ugxUuQvKKzIO
         lmuoE/X+jjSAPvdZaos1g04rJHF6MfOM1pBvnJpWqzgDFP9y8QVFznqMzBGUKVSN0fSI
         3Ld2Xjvyl/lAtBCJ2U45/Zmzr0Fzw1mFob/ERUYqZM4pnNztgzRjE7wPdq60a6Xo4TT1
         RD+w190sGlmWXxy6UwSu7GZLJZGJWRiHOWCPQ946CIqL+t2wZ0hu1qv7SImbWmaHwhiX
         aSFw==
X-Gm-Message-State: APt69E0SMTYqQEyfMS76gKT/EjAUWWLkB2pyEGOAcvSU+owX7UedGcK/
        O7/PUUMMZpx4xyAegV0nt51g6F1NyCtuQ19BoLE=
X-Google-Smtp-Source: ADUXVKIGXnUHqr6T2EoR0bDKvPw0PEXtlz5ivVt4zqNlGKxkaQQCJM99ZrzXk6uWIIh5I3W/hLIy6ShAKbgre4nWLs4=
X-Received: by 2002:a24:5649:: with SMTP id o70-v6mr14565256itb.56.1528126705832;
 Mon, 04 Jun 2018 08:38:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:b4ac:0:0:0:0:0 with HTTP; Mon, 4 Jun 2018 08:38:25 -0700 (PDT)
In-Reply-To: <20180604121005.24471-1-cgxu519@gmx.com>
References: <20180604121005.24471-1-cgxu519@gmx.com>
From:   Ilya Dryomov <idryomov@gmail.com>
Date:   Mon, 4 Jun 2018 17:38:25 +0200
Message-ID: <CAOi1vP852=pO2+djO9OZBYiMkgqEZA5zekZNHJMqMVGsYaNr6A@mail.gmail.com>
Subject: Re: [PATCH] doc: update description of ceph mount option
To:     Chengguang Xu <cgxu519@gmx.com>
Cc:     Ceph Development <ceph-devel@vger.kernel.org>,
        linux-doc@vger.kernel.org, "Yan, Zheng" <zyan@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 4, 2018 at 2:10 PM, Chengguang Xu <cgxu519@gmx.com> wrote:
> Based on code, default value of rsize/wsize is 16 MB.
>
> Signed-off-by: Chengguang Xu <cgxu519@gmx.com>
> ---
>  Documentation/filesystems/ceph.txt | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/filesystems/ceph.txt b/Documentation/filesystems/ceph.txt
> index d7f011ddc150..8bf62240e10d 100644
> --- a/Documentation/filesystems/ceph.txt
> +++ b/Documentation/filesystems/ceph.txt
> @@ -105,15 +105,13 @@ Mount Options
>         address its connection to the monitor originates from.
>
>    wsize=X
> -       Specify the maximum write size in bytes.  By default there is no
> -       maximum.  Ceph will normally size writes based on the file stripe
> -       size.
> +       Specify the maximum write size in bytes.  Default: 16 MB.
>
>    rsize=X
> -       Specify the maximum read size in bytes.  Default: 64 MB.
> +       Specify the maximum read size in bytes.  Default: 16 MB.
>
>    rasize=X
> -       Specify the maximum readahead.  Default: 8 MB.
> +       Specify the maximum readahead size in bytes.  Default: 8 MB.
>
>    mount_timeout=X
>         Specify the timeout value for mount (in seconds), in the case

Applied.

Thanks,

                Ilya
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
