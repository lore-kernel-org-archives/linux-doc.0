Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E43C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 17 Mar 2022 01:27:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358304AbiCQB2Q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Mar 2022 21:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358401AbiCQB2I (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Mar 2022 21:28:08 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 402E41E3C2
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 18:26:52 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id gb39so7739952ejc.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 18:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=k7yicPIk+Z77xC2Jk5lIM3J4ayt0t0RngElOD1HAw4g=;
        b=rmXwQK3hU5r16A4VKdmhW6Ak9o21AzTO5x3KUBlzHD2dFxLANWlDhla7+jMAxwl0b9
         cofCUQwTGiGS4hT6hi1VscFkJLbgg4CqKsQrEg7/rZN7W02rsqGCSMHyJxMEwVIr/Ehw
         y14GzqGaagHLq1eJCLHdZ60DQ7v4R9y+0bDIaysTFHHjUndXiD/B7oeRv2OgYnIRFWPZ
         yfpSwTYQAsnSC8etUqZVoh3HPLOD8nn2ytExpf6pNYp5+I29p9STNaGDjE66uusbvmAi
         PfnocbZdpwVzDrDrNfHcB7EYLkTmAZJkHP2NpgZixULGY9vivSs9MNC+IqMz3kjkbBio
         ws7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=k7yicPIk+Z77xC2Jk5lIM3J4ayt0t0RngElOD1HAw4g=;
        b=kGKPIXVQNaFIkurh7E69QGdHTcXSVKU1XtFDLJc4Ss2JGHv7vUvJx8v9V5nmW2VAlu
         dDXSpurjMjXgwAJQNd0QHmka8EccSlidmTLxAwxp0/eSlJnW6Sb8af0B8IzU7Vjf9Uox
         o0//uAVuXofXrjFvoGimqFKDS8YJ8w/EvO7q9zPZDJg2aNoTin/XK5fBp7kv4cRaIuc/
         Obm7BJO1B6uUmZHxy15XiFVSLd43SvZ7E5G2Cb3JT2zBvr7vMHghPitm1fsY0bldKZY4
         167HpEvyUkknmZZ27axoqxLcbs2HnkJxqLwDJ5l3QdmT8tqVsYhIOUXWC5jbqMyXQqjA
         lX6Q==
X-Gm-Message-State: AOAM533j3lc4rYPEOz/tcQE9D4WcKak3hUKoX8BMSVFMwtzo7e1KNxvR
        TFmby3XeYeN5Xsh7T6TSgK1hx8kjo0shJELSx4Ep
X-Google-Smtp-Source: ABdhPJwRKa3vBL+HOFo2rnyMrLxHJvet528O/eIh737dM8Fqorv1ZTHburtLRJbVy4qlwVdRb99NwNuZ6JLOHDLf8rY=
X-Received: by 2002:a17:907:7202:b0:6df:83a9:67d2 with SMTP id
 dr2-20020a170907720200b006df83a967d2mr2189662ejc.327.1647480410692; Wed, 16
 Mar 2022 18:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220221212522.320243-1-mic@digikod.net> <20220221212522.320243-6-mic@digikod.net>
In-Reply-To: <20220221212522.320243-6-mic@digikod.net>
From:   Paul Moore <paul@paul-moore.com>
Date:   Wed, 16 Mar 2022 21:26:39 -0400
Message-ID: <CAHC9VhQM33jnJYMz+z1YoNt9=nNceW=TutuGO=x+SSpHW7PMyg@mail.gmail.com>
Subject: Re: [PATCH v1 05/11] landlock: Move filesystem helpers and add a new one
To:     =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc:     James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jann Horn <jannh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Konstantin Meskhidze <konstantin.meskhidze@huawei.com>,
        Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 21, 2022 at 4:15 PM Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> =
wrote:
>
> From: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
>
> Move the SB_NOUSER and IS_PRIVATE dentry check to a standalone
> is_nouser_or_private() helper.  This will be useful for a following
> commit.
>
> Move get_mode_access() and maybe_remove() to make them usable by new
> code provided by a following commit.
>
> Signed-off-by: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
> Link: https://lore.kernel.org/r/20220221212522.320243-6-mic@digikod.net
> ---
>  security/landlock/fs.c | 87 ++++++++++++++++++++++--------------------
>  1 file changed, 46 insertions(+), 41 deletions(-)

One nit-picky comment below, otherwise it looks fine to me.

Reviewed-by: Paul Moore <paul@paul-moore.com>

> diff --git a/security/landlock/fs.c b/security/landlock/fs.c
> index 9662f9fb3cd0..3886f9ad1a60 100644
> --- a/security/landlock/fs.c
> +++ b/security/landlock/fs.c
> @@ -257,6 +257,18 @@ static inline bool unmask_layers(const struct landlo=
ck_rule *const rule,
>         return false;
>  }
>
> +static inline bool is_nouser_or_private(const struct dentry *dentry)
> +{
> +       /*
> +        * Allows access to pseudo filesystems that will never be mountab=
le
> +        * (e.g. sockfs, pipefs), but can still be reachable through
> +        * /proc/<pid>/fd/<file-descriptor> .
> +        */

I might suggest moving this explanation up to a function header comment blo=
ck.


> +       return (dentry->d_sb->s_flags & SB_NOUSER) ||
> +                       (d_is_positive(dentry) &&
> +                        unlikely(IS_PRIVATE(d_backing_inode(dentry))));
> +}
> +
>  static int check_access_path(const struct landlock_ruleset *const domain=
,
>                 const struct path *const path,
>                 const access_mask_t access_request)

--
paul-moore.com
