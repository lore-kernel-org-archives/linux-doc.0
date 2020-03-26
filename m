Return-Path: <SRS0=jv2Y=5L=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63EACC43331
	for <linux-doc@archiver.kernel.org>; Thu, 26 Mar 2020 23:00:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C86420774
	for <linux-doc@archiver.kernel.org>; Thu, 26 Mar 2020 23:00:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lbSiQuYz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgCZXAA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Mar 2020 19:00:00 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:42515 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgCZXAA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Mar 2020 19:00:00 -0400
Received: by mail-il1-f194.google.com with SMTP id f16so7043112ilj.9
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2020 15:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FYvxodz7d4pB6VdW2wEtyiPcxDIa/w32jDzfvDzkoU8=;
        b=lbSiQuYzsX/YLfN+amKkN7JbC15Gb8HRMWXLvWiCBK258OaPQEQ7d9xfRenumyr08U
         YcKjxNgsNm/3FM0LY9dxX6E4qwllOE6RUd1Tbiw0IzQBxryQx2UmIQQmhoX2Zv9oPyRU
         EEZrrO75nib7VAy3lsA/9BP7HHZ/uRgXXcV1lCJBcLT/bwC72VJKZxO4fvIszMKoCotW
         UtI9ZiiAn9BeiOpisURIzjiSa7pSDbIScdakKPDZ1XO9aJihiQGhVIu6//DNihisrNpg
         sWHefA17+Q6Jk5zeb3Rr3/2u/YynXU1YfG3L+MUb5k4y2Ee0C54t+20F/mCHyaJiaTl4
         AKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FYvxodz7d4pB6VdW2wEtyiPcxDIa/w32jDzfvDzkoU8=;
        b=Kd9KRzy2rABtr36WlSrIsHcjK9PA8VGJ1MJWMsrGPNNLN2CKoKsY9DMkedCdInoJyL
         UL5JJQ5832L5LkMkNXZUe2U+MeYexDDNzLT0mMbl0HdAOc3xUUcYspJ+PdjTFlXv6s4g
         ssocjENKuVxLjKAtgZMaFc4kPg+t5ps79QfAJNbKvIU/9IU/mQJt2vEg5nKuzpGccwSG
         vSWD0V0hYG1D02ZkxYZBA4z5Putcezh0bK2h8bv5mSnAV8Y0TCor1cFDZ9AVRx5nCzef
         OQJKBiBpO8AmGAkYOJac3rs65Qp0Cvu0cpUPKNNASJYCltCTvKQu59ePovG3/6p2spWS
         9Phw==
X-Gm-Message-State: ANhLgQ1KupGJ+uZ/TCYGAvTJPjB+L8YgO7jPlaAY4RnbZIBMjfkrvluw
        fHGSd1Ud5GW7IyYjR3/ilaJbMMqi5IIfu3o7/W0gUg==
X-Google-Smtp-Source: ADFU+vuAPTvM3KUXkmj+Y6Uglnz+a3Q5ZiayBinGz1MOoF086L2mOH6jeDwzcK/I0VCF5aU669EVQfotwXDcBSc3SYg=
X-Received: by 2002:a92:358b:: with SMTP id c11mr10435037ilf.64.1585263598976;
 Thu, 26 Mar 2020 15:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <CACdnJusd7m-c0zLmAjSq9Sb9HxyCkhyyp5W=4FMdysgu7_g=Sw@mail.gmail.com>
 <BB670F86-9362-4A8C-8BE6-64A5AF9537A7@amacapital.net> <CACdnJus6H3LQww8hkTMpPKN7u_sb1PXmgPwQOCSVZR_fi7GMrA@mail.gmail.com>
 <CALCETrU4W7q=QyTX_iq_kN4nVK58WoOD0F_NBt7z8p7xiE7hfA@mail.gmail.com>
In-Reply-To: <CALCETrU4W7q=QyTX_iq_kN4nVK58WoOD0F_NBt7z8p7xiE7hfA@mail.gmail.com>
From:   Matthew Garrett <mjg59@google.com>
Date:   Thu, 26 Mar 2020 15:59:47 -0700
Message-ID: <CACdnJuu9sqzUWjPJRPOY6pKDJxTqwwf6NQEWQewXtufPQHikOg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/12] x86: Trenchboot secure late launch Linux kernel support
To:     Andy Lutomirski <luto@kernel.org>
Cc:     Daniel Kiper <daniel.kiper@oracle.com>,
        Ross Philipson <ross.philipson@oracle.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "Daniel P. Smith" <dpsmith@apertussolutions.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        trenchboot-devel@googlegroups.com,
        Ard Biesheuvel <ardb@kernel.org>, leif@nuviainc.com,
        eric.snowberg@oracle.com, piotr.krol@3mdeb.com,
        krystian.hebel@3mdeb.com, michal.zygowski@3mdeb.com,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 26, 2020 at 3:52 PM Andy Lutomirski <luto@kernel.org> wrote:
>
> On Thu, Mar 26, 2020 at 2:28 PM Matthew Garrett <mjg59@google.com> wrote:
> > https://trustedcomputinggroup.org/wp-content/uploads/TCG_PlatformResetAttackMitigationSpecification_1.10_published.pdf
> > - you want to protect in-memory secrets from a physically present
> > attacker hitting the reset button, booting something else and just
> > dumping RAM. This is avoided by setting a variable at boot time (in
> > the boot stub), and then clearing it on reboot once the secrets have
> > been cleared from RAM. If the variable isn't cleared, the firmware
> > overwrites all RAM contents before booting anything else.
>
> I admit my information is rather dated, but I'm pretty sure that at
> least some and possibly all TXT implementations solve this more
> directly.  In particular, as I understand it, when you TXT-launch
> anything, a nonvolatile flag in the chipset is set.  On reboot, the
> chipset will not allow access to memory *at all* until an
> authenticated code module wipes memory and clears that flag.

Mm, yes, this one might be something we can just ignore in the TXT case.

> > When you say "re-launch", you mean perform a second secure launch? I
> > think that would work, as long as we could reconstruct an identical
> > state to ensure that the PCR17 values matched - and that seems like a
> > hard problem.
>
> Exactly.  I would hope that performing a second secure launch would
> reproduce the same post-launch PCRs as the first launch.  If the
> kernel were wise enough to record all PCR extensions, it could replay
> them.

That presumably depends on how much state is in the measured region -
we can't just measure the code in order to assert that we're secure.

> In any case, I'm kind of with Daniel here.  We survived for quite a
> long time without EFI variables at all.  The ability to write them is
> nice, and we certainly need some way, however awkward, to write them
> on rare occasions, but I don't think we really need painless runtime
> writes to EFI variables.

I'm fine with a solution that involves jumping through some hoops, but
it feels like simply supporting measuring and passing through the
runtime services would be fine - if you want to keep them outside the
TCB, build a kernel that doesn't have EFI runtime service support and
skip that measurement?
