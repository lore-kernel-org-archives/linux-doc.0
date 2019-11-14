Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 463D97D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Nov 2019 23:15:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbfKNXPM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 14 Nov 2019 18:15:12 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43894 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbfKNXPM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Nov 2019 18:15:12 -0500
Received: by mail-lj1-f196.google.com with SMTP id y23so8530295ljh.10
        for <linux-doc@vger.kernel.org>; Thu, 14 Nov 2019 15:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XXZe+K4zB1eSQ+I4AvJ+G8ioC0b+UW3leVUnkC1ev08=;
        b=Xh29Jf0KD0zYUNy/Wdl8tgQPecfrVzeKWkZLQ8DT9np+Kp+TjJWkuXdGVtWCC3tWzG
         3+rPJXPh7Rm1kG3EFaxmdgUnkSvToCOindmvIwI0RzS+AW5LQI6AdEbrcLxO9NfXRbgk
         4vfgojQPkgpUm8TBmQ73vSpJUPICi6AFvoKZaHXWIEQmVChxAl0OAdShoa3qI18dY4Ab
         UrPReLlBxiBtuW6ZxQJyz/wYHFeDKhn2hVttPrehKVqZScACjCWHeSbjLiAkPVwjXoVE
         ucVNMfyViqatgV4E1wjlDLRGHZZ8c+xMR67WN3lJlCLnQibcCGfiF0SW/ODKZD7j40yf
         MY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XXZe+K4zB1eSQ+I4AvJ+G8ioC0b+UW3leVUnkC1ev08=;
        b=A02CJUO9kKgLjh/PA3jfyfbHfX4Bel/fCxBhUpTl2ZL7+blMOcjoIRb7bGJ+8bSTGF
         tsfPLKz2gsumBTCmtI1ffXLHqw/P+Z6wwxcR48Sbr2jaVPWn/m/QyNWu1LIMeXKpIVOZ
         prsaS0mT/zZ08MkpQb65iTjJFtLpU5vMgS8lOt3gaVI9Goe0fCHcafYg3b9XkKqvPJFQ
         qvd+VsH86p7g/IpoLjINYdhwa008tqjXQaJ63RnU8DN+1pOpjABSbkqc9s8LXBVt1OWm
         ocADIPv7qLWCUVCZcE5HtzIQPzWopDijHu494R4wKYSIxJXSlatPwHUug5OTMaEtveTT
         /Rfw==
X-Gm-Message-State: APjAAAVFuSnv905hJN0OVAbZZieccLf9Lp1P5cxVqqm191Z+nK8qVctT
        3/tIIQrH/Qigzhx0QevlOg3Vf2lDM8ztC2wDn/5b
X-Google-Smtp-Source: APXvYqz9Topjf7e96aAXN5meTDnmr7i8zWTbMZXZVoOZzSlivxhZUCU2so8hfFfojaD2suC7c2zBglqXlSaDSnfl0+w=
X-Received: by 2002:a05:651c:1053:: with SMTP id x19mr8771824ljm.39.1573773309621;
 Thu, 14 Nov 2019 15:15:09 -0800 (PST)
MIME-Version: 1.0
References: <20191114221634.258799-1-asteinhauser@google.com> <alpine.DEB.2.21.1911142334250.29616@nanos.tec.linutronix.de>
In-Reply-To: <alpine.DEB.2.21.1911142334250.29616@nanos.tec.linutronix.de>
From:   Anthony Steinhauser <asteinhauser@google.com>
Date:   Thu, 14 Nov 2019 15:14:57 -0800
Message-ID: <CAN_oZf21kYk8FZ_Ah93UQ_rCd7afrxiiX7O4v_xbErFRcGXm9w@mail.gmail.com>
Subject: Re: [PATCH] Mention PowerPC in the L1TF documentation.
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Jiri Kosina <jkosina@suse.cz>,
        Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

OK, I don't intend to work on it to that extent, so you can consider
this abandoned.

On Thu, Nov 14, 2019 at 2:55 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Anthony,
>
> On Thu, 14 Nov 2019, asteinhauser@google.com wrote:
>
> > From: Anthony Steinhauser <asteinhauser@google.com>
> >
> > There is a false negative that L1TF is Intel specific while it affects
> > also PowerPC:
> > https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=8e6b6da91ac9b9ec5a925b6cb13f287a54bd547d
>
> Please use the regular
>
>    commit 12-char-sha ("powerpc: .......")
>
> notation. These links are horrible.
>
> > Another false negative is that the kernel is unconditionally protected
> > against L1TF attacks from userspace. That's true only on x86 but not on
> > PowerPC where you can turn the protection off by nopti.
>
> Missing newline between body and SOB
>
> > Signed-off-by: Anthony Steinhauser <asteinhauser@google.com>
> > ---
> >  Documentation/admin-guide/hw-vuln/l1tf.rst | 15 +++++++++------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/admin-guide/hw-vuln/l1tf.rst b/Documentation/admin-guide/hw-vuln/l1tf.rst
> > index f83212fae4d5..243e494b337a 100644
> > --- a/Documentation/admin-guide/hw-vuln/l1tf.rst
> > +++ b/Documentation/admin-guide/hw-vuln/l1tf.rst
> > @@ -9,10 +9,11 @@ for the access, has the Present bit cleared or other reserved bits set.
> >  Affected processors
> >  -------------------
> >
> > -This vulnerability affects a wide range of Intel processors. The
> > -vulnerability is not present on:
> > +This vulnerability affects a wide range of Intel and PowerPC processors.
> > +The vulnerability is not present on:
> >
> > -   - Processors from AMD, Centaur and other non Intel vendors
> > +   - Processors from AMD, Centaur and other non Intel vendors except for
> > +     PowerPC
>
> No. This needs restructuring. The non Intel vendor means vendors which
> produce x86 machines (not really clear TBH), but adding these two PPC parts
> above and here does not make it any better.
>
> >     - Older processor models, where the CPU family is < 6
>
> Also this suggest that _ALL_ PowerPC processors are affected as there is
> no exception list.
>
> So I suggest to structure this like this:
>
> Affected processors
> -------------------
>
>  1) Intel processors
>
>     Move the existing list here
>
>  2) PowerPC processors
>
>     Add some meat
>
> Whether a processor is affected or not...
>
> > @@ -125,7 +126,7 @@ mitigations are active. The relevant sysfs file is:
> >
> >  /sys/devices/system/cpu/vulnerabilities/l1tf
> >
> > -The possible values in this file are:
> > +The possible values in this file on x86 are:
>
> That commit you referenced added the sysfs output for powerpc. So that
> should be documented properly here as well, right?
>
> >    ===========================   ===============================
> >    'Not affected'             The processor is not vulnerable
> > @@ -158,8 +159,10 @@ The resulting grade of protection is discussed in the following sections.
> >  Host mitigation mechanism
> >  -------------------------
> >
> > -The kernel is unconditionally protected against L1TF attacks from malicious
> > -user space running on the host.
> > +On x86 the kernel is unconditionally protected against L1TF attacks from
> > +malicious user space running on the host. On PowerPC the kernel is
> > +protected by flushing the L1D cache on each transition from kernel to
> > +userspace unless the 'nopti' boot argument turns this mitigation off.
>
> Please make this clearly visually separated. Just glueing this together is
> hard to read.
>
> What about the l1tf boot param? Is it x86 only? If so, then this wants to
> be added to the the documentation as well.
>
> What about the guest to host issue on PPC? Not affected or same mitigation
> or what?
>
> We really spent a lot of time to write understandable and useful
> documentation. Just sprinkling a few powerpc'isms into it is really not
> cutting it.
>
> This needs proper structuring so that it's obvious for the intended
> audience (administrators, users) which part is applicable to which
> architecture or to both.
>
> Thanks,
>
>         tglx
