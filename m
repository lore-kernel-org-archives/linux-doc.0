Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7C8407D087
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 19:17:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727677AbeJCCCI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 22:02:08 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:37470 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727653AbeJCCCH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 22:02:07 -0400
Received: by mail-yw1-f67.google.com with SMTP id y14-v6so1247647ywa.4
        for <linux-doc@vger.kernel.org>; Tue, 02 Oct 2018 12:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=grN8AMjjDCH1UIcWr3BrHVkT4cVrEMnQ0E1dTL0Fukc=;
        b=KeSmrAWR8Tzm7VnCsqWa9ea/4Bxs78nUMqb3BLiLrM9sMnhbe22xMt/vjYsVcGcPzn
         7fSElIlrchz9KZOtLS9ZXmrwLHMaKfPnkZMYJqgHxLMOKLtmQm7Y3s5ME3CaesdwxCw2
         1R1EzYRODbdUdZoDkK+dMlSUbhMFGAsPpIAXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=grN8AMjjDCH1UIcWr3BrHVkT4cVrEMnQ0E1dTL0Fukc=;
        b=GWB4He9zatq3ufwsCTH0WheW0ahhl4IBed9J2CVM6Wrvntc2ydb7jQKZ4hHfjMgDxu
         q6/qxcKfie+1h/HYhNcS+tUhIHPngNC4IDO2D+u1f3bbg37nj0mGMVNBBjaDUYDXZywT
         5ADMFrbo+jpkR9xsu6FK/h4YBq62QOt06HoNI8Kr1szOLsw/ntzriVZzRoF6Zp8kE4f9
         TjYapq+/u1zfWrYgC5dVkehGZujMblJVdp4hhwyUc0YALSz4YctQE58QOEBqF0ldXeEk
         UruBxyQg6KMAz388uGP84WSxMyHkuEaEURsz+tf0nqmE5yirMBEn0QvNuW47TBRMsUlu
         kiDA==
X-Gm-Message-State: ABuFfohOd/Os0PC4IUmoxoiU8jl80MOvTfN1T6Erhr0XAofBMiyCjsye
        qhArXRo5Y8RU3BOdJHHmH6tr0dGgp6M=
X-Google-Smtp-Source: ACcGV60tTbh4DljMnOxR1fPY84PFBuqq8P42++Mzpqsb89Ctd2holekiG5xasn/c8IV8JMhWBJtwUA==
X-Received: by 2002:a81:1b85:: with SMTP id b127-v6mr7693370ywb.381.1538507834473;
        Tue, 02 Oct 2018 12:17:14 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 189-v6sm6226613ywf.4.2018.10.02.12.17.11
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Oct 2018 12:17:11 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id e190-v6so1285968ybb.5
        for <linux-doc@vger.kernel.org>; Tue, 02 Oct 2018 12:17:11 -0700 (PDT)
X-Received: by 2002:a25:3588:: with SMTP id c130-v6mr8045250yba.410.1538507831148;
 Tue, 02 Oct 2018 12:17:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Tue, 2 Oct 2018 12:17:10 -0700 (PDT)
In-Reply-To: <abe03d09-4dcb-2b02-4102-5e108d617a42@canonical.com>
References: <20181002005505.6112-1-keescook@chromium.org> <20181002005505.6112-24-keescook@chromium.org>
 <CAHC9VhQjMfH6Q+Tif8nBknZojgxrb6x+oDz4vHRiZN8rb8MZ5Q@mail.gmail.com>
 <785ef6a9-ae46-3533-0348-74bcf6f10928@tycho.nsa.gov> <CAGXu5jKNzG3rGUAV39D0w4txHRG3H2qU1Z1e_b+03OgycTaWqA@mail.gmail.com>
 <809f1cfd-077b-ee58-51ba-b22daf46d12b@tycho.nsa.gov> <QpdcE4QSCQKJqDmB2QBEGBlnlioHuRHlM0g5HF8KbHjU1zIUAOjnQ2r9EIMu3m0S2OWNR3_M_TSp_M6CVDqkp6kKuFPUvegsyDPNw1AGju4=@protonmail.ch>
 <CAGXu5jKqXNbEvPr1axQtGCCnWsGhDgjynW5u326mcx4vZ1oH8g@mail.gmail.com> <abe03d09-4dcb-2b02-4102-5e108d617a42@canonical.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Tue, 2 Oct 2018 12:17:10 -0700
X-Gmail-Original-Message-ID: <CAGXu5jJtC1gkJ0ZKDFroL8UzvjiPfmC+6EsrzyB0j0oETdSQQg@mail.gmail.com>
Message-ID: <CAGXu5jJtC1gkJ0ZKDFroL8UzvjiPfmC+6EsrzyB0j0oETdSQQg@mail.gmail.com>
Subject: Re: [PATCH security-next v4 23/32] selinux: Remove boot parameter
To:     John Johansen <john.johansen@canonical.com>
Cc:     Jordan Glover <Golden_Miller83@protonmail.ch>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Paul Moore <paul@paul-moore.com>,
        James Morris <jmorris@namei.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        "Schaufler, Casey" <casey.schaufler@intel.com>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 2, 2018 at 11:57 AM, John Johansen
<john.johansen@canonical.com> wrote:
> Under the current scheme
>
> lsm.enabled=selinux
>
> could actually mean selinux,yama,loadpin,something_else are
> enabled. If we extend this behavior to when full stacking lands
>
> lsm.enabled=selinux,yama
>
> might mean selinux,yama,apparmor,loadpin,something_else
>
> and what that list is will vary from kernel to kernel, which I think
> is harder for the user than the lsm.enabled list being what is
> actually enabled at boot

Ah, I think I missed this in your earlier emails. What you don't like
here is that "lsm.enable=" is additive. You want it to be explicit.

Are you okay with lsm.order= having fallback?

The situation we were trying to solve was with new LSMs getting
implicitly disabled if someone is booting with an explicit list. For
example:

lsm.enable=yama,apparmor

means when "landlock" gets added to the kernel, it will be implicitly disabled.

> If we have to have multiple kernel parameter, I prefer a behvior where
> if you hav conflicting kernel parameters specified
>
>   apparmor=0 lsm.enabled=apparmor
>
> that the conflict is logged and the lsm is left disabled, as I think
> it is easier for users to understand than the overrides scheme of v3,
> and sans logging of the conflict is effectively what we had in the
> past
>
>   apparmor=0 security=apparmor
> or
>   apparmor=1 security=selinux
>
> would result in apparmor being disabed

Okay, so for this part you want per-LSM boot param to have priority
(which seems to match SELinux's concerns), possibly logging the
conflict, but still accepting the apparmor= and selinux= state.
security= would still driving initialization ordering (so I think the
behavior I have in the series would be correct).

> That being said I get we have a mess currently, and there really
> doesn't seem to be a good way to fix it. I think getting this right
> for the user is important enough that I am willing to break current
> apparmor userspace api. While apparmor=0 is documented we have also
> documented security=X for years and apparmor=0 isn't used too often
> so I think we can drop it to help clean this mess up abit.
>
> I am not going to Nak, or block on v3 behavior if that is considered
> the best path forward after this discussion/rant.

I could define CONFIG_LSM_ENABLE as being "additive" to
SECURITY_APPARMOR_BOOTPARAM_VALUE and
SECURITY_SELINUX_BOOTPARAM_VALUE?

-Kees

-- 
Kees Cook
Pixel Security
