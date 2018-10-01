Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B092F7D08F
	for <lwn-linux-doc@archive.lwn.net>; Mon,  1 Oct 2018 21:57:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbeJBEgo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 00:36:44 -0400
Received: from mail-yb1-f195.google.com ([209.85.219.195]:43941 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbeJBEgm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 00:36:42 -0400
Received: by mail-yb1-f195.google.com with SMTP id w80-v6so6292073ybe.10
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 14:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=qEzzBMCxb12vY/FYUOpb/kfbgPGZDUraFm4sj/mqu0U=;
        b=DL62DlLdJoL5VRrkxAthiGviLnWqwFc2ajZmhsS/NFYfSO2p493+64GvzGdH6przN0
         Nh3+vd3a61tlfRYRwbUamxXzFR3XdtWpT7N7WR+wHCigGrh7KSxC3LWdGNBkGJb5/pzF
         p7Lc2X4KfEfBu2uaXhFx2+bwui7VK0URrTXGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=qEzzBMCxb12vY/FYUOpb/kfbgPGZDUraFm4sj/mqu0U=;
        b=apdORmhOhKXM4W9ZTCrxpRhC3E1wKGubROVYDqMOIsP20sI88niWscLd3serWEnVvV
         NP3gVqGql/bXYZ1ApYGjA+dt/iX+s4fHQavI0vgWKwODm2RPCbp8mAlkpHrlan+k38FK
         RZR2G2xZsfiOqlyetJbXwxPCrLBawSbZtvkHjKmDEeep5iZv4NQA607IHBUVBQQKPYz7
         FEgu1+9uc5sNNYTHTcfmkGTgmLU/K2SPK+44LlM50D1yIUVVZh8pY0Ih+NEeUxYkkbvr
         x2M31563c80x4b96fnl+hxGiXrDHE1K70ujbCUI02Vus6nchKw1sEKTlfDLIAovLRSCk
         3UeA==
X-Gm-Message-State: ABuFfohdV8I0BOQPmAMg0gmTyWfVq2hqpgAHwPrMS1NivH7buPkfnyeH
        uMPoc5m3MKd7nChGCmSwqjZ8r4NC1fM=
X-Google-Smtp-Source: ACcGV61fyw6Rg13wSwnPkZnPP+kmWtakDkH+0wUyf8PDTKSeVAfAmOb+eRg6rWgx5lhD5EyLdKnQZw==
X-Received: by 2002:a25:b3c9:: with SMTP id x9-v6mr6856277ybf.508.1538431007326;
        Mon, 01 Oct 2018 14:56:47 -0700 (PDT)
Received: from mail-yw1-f54.google.com (mail-yw1-f54.google.com. [209.85.161.54])
        by smtp.gmail.com with ESMTPSA id c142-v6sm11364104ywa.81.2018.10.01.14.56.44
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Oct 2018 14:56:44 -0700 (PDT)
Received: by mail-yw1-f54.google.com with SMTP id d126-v6so6193626ywa.5
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 14:56:44 -0700 (PDT)
X-Received: by 2002:a81:2288:: with SMTP id i130-v6mr7188157ywi.288.1538431004028;
 Mon, 01 Oct 2018 14:56:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Mon, 1 Oct 2018 14:56:43 -0700 (PDT)
In-Reply-To: <alpine.LRH.2.21.1810020747380.20364@namei.org>
References: <20180925001832.18322-1-keescook@chromium.org> <20180925001832.18322-15-keescook@chromium.org>
 <alpine.LRH.2.21.1810020747380.20364@namei.org>
From:   Kees Cook <keescook@chromium.org>
Date:   Mon, 1 Oct 2018 14:56:43 -0700
X-Gmail-Original-Message-ID: <CAGXu5jJKvb=3vu3_b-NNdr_=KwvgO9qa96Qo5qzSZuiy2=+Oig@mail.gmail.com>
Message-ID: <CAGXu5jJKvb=3vu3_b-NNdr_=KwvgO9qa96Qo5qzSZuiy2=+Oig@mail.gmail.com>
Subject: Re: [PATCH security-next v3 14/29] LSM: Plumb visibility into
 optional "enabled" state
To:     James Morris <jmorris@namei.org>
Cc:     Casey Schaufler <casey@schaufler-ca.com>,
        John Johansen <john.johansen@canonical.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        "Schaufler, Casey" <casey.schaufler@intel.com>,
        LSM <linux-security-module@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 1, 2018 at 2:47 PM, James Morris <jmorris@namei.org> wrote:
> On Mon, 24 Sep 2018, Kees Cook wrote:
>
>> In preparation for lifting the "is this LSM enabled?" logic out of the
>> individual LSMs, pass in any special enabled state tracking (as needed
>> for SELinux, AppArmor, and LoadPin). This should be an "int" to include
>> handling any future cases where "enabled" is exposed via sysctl which
>> has no "bool" type.
>>
>> Signed-off-by: Kees Cook <keescook@chromium.org>
>> ---
>>  include/linux/lsm_hooks.h | 1 +
>>  security/apparmor/lsm.c   | 5 +++--
>>  security/selinux/hooks.c  | 1 +
>>  3 files changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
>> index 5056f7374b3d..2a41e8e6f6e5 100644
>> --- a/include/linux/lsm_hooks.h
>> +++ b/include/linux/lsm_hooks.h
>> @@ -2044,6 +2044,7 @@ extern void security_add_hooks(struct security_hook_list *hooks, int count,
>>  struct lsm_info {
>>       const char *name;       /* Populated automatically. */
>>       unsigned long flags;    /* Optional: flags describing LSM */
>> +     int *enabled;           /* Optional: NULL means enabled. */
>
> This seems potentially confusing.
>
> Perhaps initialize 'enabled' to a default int pointer, like:
>
>         static int lsm_default_enabled = 1;
>
> Then,
>
>         DEFINE_LSM(foobar)
>         flags = LSM_FLAG_LEGACY_MAJOR,
>         .enabled = &lsm_default_enabled,
>         .init = foobar_init,
>         END_LSM;

The reason I didn't do this is because there are only two LSMs that
expose this "enabled" variable, so I didn't like making the other LSMs
have to declare this. Internally, though, this is exactly what the
infrastructure does: if it finds a NULL, it aims it at
&lsm_default_enabled (in a later patch).

However, it seems more discussion is needed on the "enable" bit of
this, so I'll reply to John in a moment...

-Kees

-- 
Kees Cook
Pixel Security
