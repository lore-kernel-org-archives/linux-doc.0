Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEDF1C433FE
	for <linux-doc@archiver.kernel.org>; Wed, 16 Nov 2022 18:48:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiKPSsH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Nov 2022 13:48:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239312AbiKPSrq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Nov 2022 13:47:46 -0500
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1601CE8F
        for <linux-doc@vger.kernel.org>; Wed, 16 Nov 2022 10:45:30 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id j6so12479374qvn.12
        for <linux-doc@vger.kernel.org>; Wed, 16 Nov 2022 10:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uHOOMvz2CuTBiNJ38dc1eGjrINV+LfCfPhLvFKbKj2k=;
        b=X1WDywlsuPLiGlepdKq1ekCTeqSq2nY7sHvo+zrwu30PFYpPJJugb0qrSeQMFdlHEb
         QZARQnzwKsn0IGVvvza0vCYIFdZFpOJPVITWYzW2qWV724dTnDIS4I9LAwMKTS6vM2sc
         ky0DEi5eQ2g5cYEe5Cij99dccCGb8G0HAHOniWRd8udt7Bczpr97MAsw0QFZyvDg8wT8
         MuytXyWtYDDGrlfhc3A3jyU4/COVdveAt+irJVlqaIwJyKo0Z6itKcyP4KrhaoOSusNz
         SImmqvOber6UybkbZtJvpqz5kFpi0xe3ihGylet0IgmTjY6U/7vS+0atSJEtedxAJQFW
         FPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uHOOMvz2CuTBiNJ38dc1eGjrINV+LfCfPhLvFKbKj2k=;
        b=rCfPumG+DaE0aNwKq9/uEEOzFf+76Y7L9DIZQe7cplG+myYM+tHVKFrpuO100hGgfN
         koD9sI1eUZgs17pxqAnzh3+CPzk/uXXjCSf0o8a0E6BB9xZAeSSjrKglB/NTomAuVfoQ
         08y6Sw7RRPRzTlHSYKMDAjcTf6tCLjcjB6pie03k9+JxmWahm30KXwlmmTf8hnzH4IXv
         JEfitvYugXmig+qSM9sHS7b5DnuODPoSXtOGiwS0k5XGEYPFNQ47dpupCeiq1xFygbLw
         sKYvJJ9gZ9ss6D6MdEm5aAVlU8KeRJWUvtMDX+5tQI2o7pJBik3bxOkmV5fVL8+jsrGR
         Kxdg==
X-Gm-Message-State: ANoB5pn8fJkVH6Dv/fRKofmQ2X5dkJoW1M5T4296+8prSrqFjmOGvoPY
        9LJBELNdBJzKX7vm2b2AMMcu6Yb0NHykOA==
X-Google-Smtp-Source: AA0mqf5YxVXobIO14PlNv5fSF297lFkhBcUmOPb2qHc17MkOHU96f8DxSjMToh2CTz+lUnX/Jxgdiw==
X-Received: by 2002:a0c:fe89:0:b0:4b1:827d:f33b with SMTP id d9-20020a0cfe89000000b004b1827df33bmr21975379qvs.7.1668624327409;
        Wed, 16 Nov 2022 10:45:27 -0800 (PST)
Received: from hurd (dsl-10-133-21.b2b2c.ca. [72.10.133.21])
        by smtp.gmail.com with ESMTPSA id h68-20020a37b747000000b006fb9bfc6103sm3729912qkf.123.2022.11.16.10.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 10:45:26 -0800 (PST)
From:   Maxim Cournoyer <maxim.cournoyer@gmail.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: add texinfodocs and infodocs targets
References: <20221116164026.21064-1-maxim.cournoyer@gmail.com>
        <87h6yykfnp.fsf@meer.lwn.net>
Date:   Wed, 16 Nov 2022 13:45:25 -0500
In-Reply-To: <87h6yykfnp.fsf@meer.lwn.net> (Jonathan Corbet's message of "Wed,
        16 Nov 2022 09:50:02 -0700")
Message-ID: <875yfekabe.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jonathan,

Thank you for the quick reply.

Jonathan Corbet <corbet@lwn.net> writes:

> Maxim Cournoyer <maxim.cournoyer@gmail.com> writes:
>
>> Sphinx supports generating Texinfo sources and Info documentation,
>> which can be navigated easily and is convenient to search (via the
>> indexed nodes or anchors, for example).

> Can you tell me a bit more about the use case for this?  Nobody has
> asked for it so far...  I'm not really opposed to adding it, but it
> would be nice to know why.

I didn't know about Texinfo much at all until I started using Guix
System, where is it used extensively as the main documentation system.
Since then I've grown to appreciate it, even favor it most of the time,
to HTML docs due to it being usable offline even when only a terminal
emulator is available, and matching the version of the software
installed.  In contrast with man pages, which are typically very flat,
info manual can be organized into sections that are rendered into menus
that can be navigated using just a keyboard.  Another point is size.
The compressed TheLinuxKernel.info.gz info documentation weighs 12 MiB
on disk, compared to 183 MiB for the HTML version.

In short, Texinfo gives you the organization/navigability of HTML in a
format that can be used anywhere, even on headless servers.  When the
document is well indexed, it's even faster than HTML at helping you find
something, via e.g.:

$ info TheLinuxKernel i rcu_ TAB
--8<---------------cut here---------------start------------->8---
40 completions:
rcu_access_pointer (C macro)               rcu_pointer_handoff (C macro)
rcu_assign_pointer (C macro)               RCU_POINTER_INITIALIZER (C macro)
rcu_barrier (C function)                   rcu_read_lock (C function)
rcu_dereference (C macro)                  rcu_read_lock_bh (C function)
rcu_dereference_bh (C macro)               rcu_read_lock_bh_held (C functio=
n)
rcu_dereference_bh_check (C macro)         rcu_read_lock_held (C function)
rcu_dereference_check (C macro)            rcu_read_lock_held_common (C fun=
ction)
rcu_dereference_protected (C macro)        rcu_read_lock_sched (C function)
rcu_dereference_sched (C macro)            rcu_read_unlock (C function)
rcu_dereference_sched_check (C macro)      rcu_read_unlock_bh (C function)
rcu_expedite_gp (C function)               rcu_read_unlock_sched (C functio=
n)
rcu_head_after_call_rcu (C function)       rcu_replace_pointer (C macro)
rcu_head_init (C function)                 rcu_sync_dtor (C function)
RCU_INIT_POINTER (C macro)                 rcu_sync_enter (C function)
RCU_INITIALIZER (C macro)                  rcu_sync_enter_start (C function)
rcu_irq_exit_check_preempt (C function)    rcu_sync_exit (C function)
rcu_is_cpu_rrupt_from_idle (C function)    rcu_sync_func (C function)
rcu_is_watching (C function)               rcu_sync_init (C function)
RCU_LOCKDEP_WARN (C macro)                 rcu_sync_is_idle (C function)
RCU_NONIDLE (C macro)                      rcu_unexpedite_gp (C function)
--8<---------------cut here---------------end--------------->8---

rcu_barr TAB -> rcu_barrier (C function)
--8<---------------cut here---------------start------------->8---

 -- Function: void rcu_barrier (void)

     Wait until all in-flight *note call_rcu(): 4188. callbacks
     complete.

=E2=80=98Parameters=E2=80=99

=E2=80=98void=E2=80=99

     no arguments

=E2=80=98Description=E2=80=99
[...]
--8<---------------cut here---------------end--------------->8---

Unfortunately only the kernel API seems to be indexed for now.  I was
trying to find the supported kernel boot parameters, but no index
appeared to be registered for it.  In these cases, one can always
fall-back to plain text search (regexp) via C-s, or navigate the menus
like you would in HTML:

$ info TheLinuxKernel
--8<---------------cut here---------------start------------->8---
* Menu:

* Licensing documentation::
* User-oriented documentation::
* Firmware-related documentation::
* Application-developer documentation::
* Introduction to kernel development::
* Kernel API documentation::
* Architecture-agnostic documentation::
* Architecture-specific documentation::
* Other documentation::
* Translations: Translations<2>.
* Indices and tables::
* Index::
--8<---------------cut here---------------end--------------->8---

Press 2 or m 'User-' TAB' to enter the 2nd section.
--8<---------------cut here---------------start------------->8---
Next: Firmware-related documentation,  Prev: Licensing documentation,  Up: =
Top

2 User-oriented documentation
*****************************

The following manuals are written for =E2=80=98users=E2=80=99 of the kernel=
 =E2=80=94 those who
are trying to get it to work optimally on a given system.

* Menu:

* The Linux kernel user=E2=80=99s and administrator=E2=80=99s guide::
* Kernel Build System::

--8<---------------cut here---------------end--------------->8---

Press 1 to select the first entry.
--8<---------------cut here---------------start------------->8---
Next: Kernel Build System,  Up: User-oriented documentation

2.1 The Linux kernel user=E2=80=99s and administrator=E2=80=99s guide
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D

The following is a collection of user-oriented documents that have been

[...]
* Menu:

* GNU Linux-libre <http;//linux-libre.fsfla.org>: GNU Linux-libre <http //l=
inux-libre fsfla org>.
* The kernel=E2=80=99s command-line parameters::
[...]
--8<---------------cut here---------------end--------------->8---

Press 2.  The section "2.1.2 The kernel=E2=80=99s command-line parameters" =
is
now displayed.

If you know the name of the section and if it doesn't contain funny
characters, you can jump straight to it from the command line, like so:

$ info '(TheLinuxKernel) cpu lists'

Anyway, I hope I was able to demonstrate some of the strengths of
Texinfo with the above.  In case your interest is piqued, 'info info'
has it all.

>> This change also causes the html output to appear under its own
>> output sub-directory, which makes it easier to install, since it's
>> clean from .doctrees or other output formats.
>
> "This change also ... " is a red flag saying that you should have split
> it into a separate patch.
>
> That change may be a bit harder to accept, since it's a behavioral
> change that will certainly annoy some people.  At a minimum, it would
> have to be coordinated with the automated docs builds at kernel.org.
> One could certainly make the case that we should have done things this
> way from the beginning; I'm a bit reluctant to change it now.

I'll split the html prefix change in a v2, and it can be discussed
separately.

--=20
Thanks,
Maxim
