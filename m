Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E35D5C4332F
	for <linux-doc@archiver.kernel.org>; Tue, 20 Dec 2022 22:05:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234011AbiLTWF0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Dec 2022 17:05:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbiLTWFZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Dec 2022 17:05:25 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D4A51B7BC
        for <linux-doc@vger.kernel.org>; Tue, 20 Dec 2022 14:05:24 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id m4so13671630pls.4
        for <linux-doc@vger.kernel.org>; Tue, 20 Dec 2022 14:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PRpBF4WUTe6XJVKrBhj4slZ23pvvv60iZTqKL7C+vCc=;
        b=HILcmf/mOJVag0pFwnctJu207LwnaL0jul6xVAevkxXSp0ghJ8Iy1di/aa3UThJZaQ
         cRSdSBSxSH/9D4Ri3bB8QfzOYfv11sxHoVKBSxhFvfaSSZ+3d8prsGmz/d8ZAEGgnL9b
         RqSQ8+VAdfVEHwH6pwga2rjRt887pqodgsUkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRpBF4WUTe6XJVKrBhj4slZ23pvvv60iZTqKL7C+vCc=;
        b=JnAngd28rfm7tMfqTYxRk6MykzVh5Xudw5BlY4ASjmRQrXznZHfC7azWB8b0AsFM7B
         saMNGLOOndqqND2nS8Sxieu1Fox6n6V49i5qEcKj1P12K0FQ9HAkQSs57QwMWZiVGGLk
         WpWz9sol018muXBwDF5AXu3G1bwPktuQN2HEnr7Do7xNooc5yzLaXx5JoEMvDD0s2giw
         8966+DqymS5Xh6irCs+O0+PDsV5Q17EwsvU5N5a+uBpRkzp2/vZoBJxc74W0++bxTKzj
         LzQE1qNp2Vt8Y7TKq9XcgWpraEq7teGGL0iFUzTfU5y5V68LTwApx49J9+CFOUlvcaKV
         Ii9g==
X-Gm-Message-State: ANoB5pn5+vrwVEpYjx7irhHV31b/12APZhJtWf9vZ58pjsmbRda1qTZE
        4jVs/UaF/D4khvdWp4uXjPRfPIaEMpPoheHssYQ=
X-Google-Smtp-Source: AA0mqf4/ady/H2/Y69wNBeVM2ZQktI1xdQV++3Xm3RsheZA5x4MOVZFXzNbCdlRdWu97HNJjD684Aw==
X-Received: by 2002:a17:90a:3b04:b0:219:7f29:3152 with SMTP id d4-20020a17090a3b0400b002197f293152mr50154514pjc.39.1671573923284;
        Tue, 20 Dec 2022 14:05:23 -0800 (PST)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com. [209.85.210.169])
        by smtp.gmail.com with ESMTPSA id om15-20020a17090b3a8f00b00218fba260e2sm5442pjb.43.2022.12.20.14.05.21
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 14:05:21 -0800 (PST)
Received: by mail-pf1-f169.google.com with SMTP id t18so9410712pfq.13
        for <linux-doc@vger.kernel.org>; Tue, 20 Dec 2022 14:05:21 -0800 (PST)
X-Received: by 2002:a63:1b44:0:b0:48c:8cc5:1b73 with SMTP id
 b4-20020a631b44000000b0048c8cc51b73mr564369pgm.520.1671573920530; Tue, 20 Dec
 2022 14:05:20 -0800 (PST)
MIME-Version: 1.0
References: <20221114-disable-kexec-reset-v2-0-c498313c1bb5@chromium.org>
 <20221114-disable-kexec-reset-v2-3-c498313c1bb5@chromium.org> <Y5tylKOaIO8Df8pu@google.com>
In-Reply-To: <Y5tylKOaIO8Df8pu@google.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 20 Dec 2022 23:05:09 +0100
X-Gmail-Original-Message-ID: <CANiDSCs8O5H0WbEMGEg6Q_JOz_hNWyXu5WuXzG5NSgwrGC=1Ow@mail.gmail.com>
Message-ID: <CANiDSCs8O5H0WbEMGEg6Q_JOz_hNWyXu5WuXzG5NSgwrGC=1Ow@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] kexec: Introduce paramters load_limit_reboot and load_limit_panic
To:     Joel Fernandes <joel@joelfernandes.org>
Cc:     Philipp Rudo <prudo@redhat.com>,
        Eric Biederman <ebiederm@xmission.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        kexec@lists.infradead.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ross Zwisler <zwisler@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Joel

Thanks for looking into this

On Thu, 15 Dec 2022 at 20:16, Joel Fernandes <joel@joelfernandes.org> wrote:
>
> Hi Ricardo,
>
> On Thu, Dec 08, 2022 at 05:38:02PM +0100, Ricardo Ribalda wrote:
> > Add two parameter to specify how many times a kexec kernel can be loaded.
> >
> > The sysadmin can set different limits for kexec panic and kexec reboot
> > kernels.
> >
> > The value can be modified at runtime via sysfs, but only with a value
> > smaller than the current one (except -1).
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  Documentation/admin-guide/kernel-parameters.txt | 14 ++++
> >  include/linux/kexec.h                           |  2 +-
> >  kernel/kexec.c                                  |  2 +-
> >  kernel/kexec_core.c                             | 91 ++++++++++++++++++++++++-
> >  kernel/kexec_file.c                             |  2 +-
> >  5 files changed, 106 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index 42af9ca0127e..2b37d6a20747 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -2374,6 +2374,20 @@
> >                       for Movable pages.  "nn[KMGTPE]", "nn%", and "mirror"
> >                       are exclusive, so you cannot specify multiple forms.
> >
> > +     kexec_core.load_limit_reboot=
> > +     kexec_core.load_limit_panic=
> > +                     [KNL]
> > +                     This parameter specifies a limit to the number of times
> > +                     a kexec kernel can be loaded.
> > +                     Format: <int>
> > +                     -1  = Unlimited.
> > +                     int = Number of times kexec can be called.
> > +
> > +                     During runtime, this parameter can be modified with a
> > +                     value smaller than the current one (but not -1).
> > +
> > +                     Default: -1
> > +
> >       kgdbdbgp=       [KGDB,HW] kgdb over EHCI usb debug port.
> >                       Format: <Controller#>[,poll interval]
> >                       The controller # is the number of the ehci usb debug
> > diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> > index e9e1ab5e8006..3d7d10f7187a 100644
> > --- a/include/linux/kexec.h
> > +++ b/include/linux/kexec.h
> > @@ -407,7 +407,7 @@ extern int kimage_crash_copy_vmcoreinfo(struct kimage *image);
> >  extern struct kimage *kexec_image;
> >  extern struct kimage *kexec_crash_image;
> >
> > -bool kexec_load_permited(void);
> > +bool kexec_load_permited(bool crash_image);
> >
> >  #ifndef kexec_flush_icache_page
> >  #define kexec_flush_icache_page(page)
> > diff --git a/kernel/kexec.c b/kernel/kexec.c
> > index d83fc9093aff..2b0856e83fe1 100644
> > --- a/kernel/kexec.c
> > +++ b/kernel/kexec.c
> > @@ -193,7 +193,7 @@ static inline int kexec_load_check(unsigned long nr_segments,
> >       int result;
> >
> >       /* We only trust the superuser with rebooting the system. */
> > -     if (!kexec_load_permited())
> > +     if (!kexec_load_permited(flags & KEXEC_ON_CRASH))
>
> nit: permitted.
>
> >               return -EPERM;
> >
> >       /* Permit LSMs and IMA to fail the kexec */
> > diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
> > index 18bd90ca9c99..7f9d5288b24b 100644
> > --- a/kernel/kexec_core.c
> > +++ b/kernel/kexec_core.c
> > @@ -952,13 +952,100 @@ static int __init kexec_core_sysctl_init(void)
> >  late_initcall(kexec_core_sysctl_init);
> >  #endif
> >
> > -bool kexec_load_permited(void)
> > +struct kexec_load_limit {
> > +     /* Mutex protects the limit count. */
> > +     struct mutex mutex;
> > +     int limit;
>
> Can you not just use atomic ops for limit, and get rid of the mutex?
>
> That will simplify the code as well.

I could not find a way to use atomic_t. The operations are not just
counters, but maybe I am missing a better way to do it :)

The current operations:

- permitted():

if (param==-1) {
  return -1;
}
if (param =0)
 return -1;
param = param -1;



- paramter_set()

new_param = min(-1, new_param);

if (param == -1) {
   param = new_param;
   return
}

if (new_param == -1) {
   return -EINVAL;
}

param = min(new_param, param);

>
> > +};
> > +
> > +struct kexec_load_limit load_limit_reboot = {
> > +     .mutex = __MUTEX_INITIALIZER(load_limit_reboot.mutex),
> > +     .limit = -1,
> > +};
> > +
> > +struct kexec_load_limit load_limit_panic = {
> > +     .mutex = __MUTEX_INITIALIZER(load_limit_panic.mutex),
> > +     .limit = -1,
> > +};
> > +
> > +static int param_get_limit(char *buffer, const struct kernel_param *kp)
> >  {
> > +     int ret;
> > +     struct kexec_load_limit *limit = kp->arg;
> > +
> > +     mutex_lock(&limit->mutex);
> > +     ret = scnprintf(buffer, PAGE_SIZE, "%i\n", limit->limit);
> > +     mutex_unlock(&limit->mutex);
> > +
> > +     return ret;
> > +}
> > +
> > +static int param_set_limit(const char *buffer, const struct kernel_param *kp)
> > +{
> > +     int ret;
> > +     struct kexec_load_limit *limit = kp->arg;
> > +     int new_val;
> > +
> > +     ret = kstrtoint(buffer, 0, &new_val);
> > +     if (ret)
> > +             return ret;
> > +
> > +     new_val = max(-1, new_val);
> > +
> > +     mutex_lock(&limit->mutex);
> > +
> > +     if (new_val == -1 && limit->limit != -1) {
> > +             ret = -EINVAL;
> > +             goto done;
> > +     }
> > +
> > +     if (limit->limit != -1 && new_val > limit->limit) {
> > +             ret = -EINVAL;
> > +             goto done;
> > +     }
> > +
> > +     limit->limit = new_val;
> > +
> > +done:
> > +     mutex_unlock(&limit->mutex);
> > +
> > +     return ret;
> > +}
> > +
> > +static const struct kernel_param_ops load_limit_ops = {
> > +     .get = param_get_limit,
> > +     .set = param_set_limit,
> > +};
> > +
> > +module_param_cb(load_limit_reboot, &load_limit_ops, &load_limit_reboot, 0644);
> > +MODULE_PARM_DESC(load_limit_reboot, "Maximum attempts to load a kexec reboot kernel");
> > +
> > +module_param_cb(load_limit_panic, &load_limit_ops, &load_limit_panic, 0644);
> > +MODULE_PARM_DESC(load_limit_reboot, "Maximum attempts to load a kexec panic kernel");
> > +
> > +bool kexec_load_permited(bool crash_image)
>
> nit: permitted.
>
> > +{
> > +     struct kexec_load_limit *limit;
> > +
> >       /*
> >        * Only the superuser can use the kexec syscall and if it has not
> >        * been disabled.
> >        */
> > -     return capable(CAP_SYS_BOOT) && !kexec_load_disabled;
> > +     if (!capable(CAP_SYS_BOOT) || kexec_load_disabled)
> > +             return false;
> > +
> > +     /* Check limit counter and decrease it.*/
> > +     limit = crash_image ? &load_limit_panic : &load_limit_reboot;
> > +     mutex_lock(&limit->mutex);
> > +     if (!limit->limit) {
> > +             mutex_unlock(&limit->mutex);
> > +             return false;
> > +     }
> > +     if (limit->limit != -1)
> > +             limit->limit--;
> > +     mutex_unlock(&limit->mutex);
> > +
> > +     return true;
>
> IMO, patch 2/3 can be squashed with 3/3 but no strong preference.
>
> thanks,
>
>  - Joel
>
>
>
> >  }
> >
> >  /*
> > diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> > index 701147c118d4..61212a9252a6 100644
> > --- a/kernel/kexec_file.c
> > +++ b/kernel/kexec_file.c
> > @@ -330,7 +330,7 @@ SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, int, initrd_fd,
> >       struct kimage **dest_image, *image;
> >
> >       /* We only trust the superuser with rebooting the system. */
> > -     if (!kexec_load_permited())
> > +     if (!kexec_load_permited(flags & KEXEC_FILE_FLAGS))
> >               return -EPERM;
> >
> >       /* Make sure we have a legal set of flags */
> >
> > --
> > 2.39.0.rc0.267.gcb52ba06e7-goog-b4-0.11.0-dev-696ae



-- 
Ricardo Ribalda
