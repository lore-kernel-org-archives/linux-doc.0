Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 762827DBD4
	for <lwn-linux-doc@archive.lwn.net>; Fri, 15 Nov 2019 21:14:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfKOVN4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 15 Nov 2019 16:13:56 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33832 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbfKOVNz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Nov 2019 16:13:55 -0500
Received: by mail-lj1-f195.google.com with SMTP id 139so12142390ljf.1
        for <linux-doc@vger.kernel.org>; Fri, 15 Nov 2019 13:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+QttHXVJvcZqwhVgyVwgnCv493NjVQEnXEFR/PqThZ4=;
        b=rAGQBwn46CNz/WC6GrPnxkodqpiC0jpnjufKmmf8NaplXhj0IMsMHR1slTGJD+FBz7
         UJNvrxe32toCYYBYIgn9IrOBOIiodHNmw3JWS3W3cAQzCgRVxBQTiRmPozpREHlBMTxh
         FWgca3AeZp7yd4R01O9i7DpwGh/UXEQj15gamUjK87J0i09uEHefOtWTShqxTEtsokDR
         1LMfA/HHcMknRZ0+TMHS5OhG3cmajhXcZcY7RIf8W10VFuHlbtap1Oqy+su75Sd3Ll4Q
         z2IHtM9rmjnnk0uFaaeq9NrZtQhZCIbY2iHfBFxJhcikpNu397NLdr9+2TP1tIQNTZp+
         2YAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+QttHXVJvcZqwhVgyVwgnCv493NjVQEnXEFR/PqThZ4=;
        b=CTILVLtcUeSD+tTWR5vXY5AP4t0kH1hjyvOc+84/fiokyEnEtQMnGPHK0Kxt6jrwL5
         R/oolmvkm/9eMMPqQeCGaEEO8uh5rHLNiyMMkrWbvte/nCHgK4hk8ng9u85/X6o9fIlS
         XPRM0r3VIWzXdSHkxzh4PUaB24FP7OttA32vFrz+cvf9/Oq3xBSISm/Js8NLMTS+NIvK
         nSug4A/eV+ve2cpXfHIo+BsylBqyKy07oOqrrahWBPaUkTlOTbEoYe7P9Ql1ISfgtlKS
         dvbm7MTawRk66ccXtZOvisUPnP1mDizgvAT4Q/aVlOZ/GPxI9uBM+V+HvdrJjT3M7/9e
         L+3g==
X-Gm-Message-State: APjAAAXti+MmBIM2b83WSAm2ptdIQwvyasSAx77KUgcq7k54i4z0A4Fs
        nA8AgI7L2eVHmq6MFbFpcI7QZ19wmc2baUSAKY5s
X-Google-Smtp-Source: APXvYqy+/DvJAuoF2M7w1ofdJfuK3LRf6bgEH/ARzOop7NzxSq0+Ipsz2N5w5rQEUBn4aGgi44v4yAx0lwHh9uxGf+E=
X-Received: by 2002:a2e:8518:: with SMTP id j24mr11605346lji.13.1573852432480;
 Fri, 15 Nov 2019 13:13:52 -0800 (PST)
MIME-Version: 1.0
References: <20191114221634.258799-1-asteinhauser@google.com>
 <alpine.DEB.2.21.1911142334250.29616@nanos.tec.linutronix.de>
 <CAN_oZf21kYk8FZ_Ah93UQ_rCd7afrxiiX7O4v_xbErFRcGXm9w@mail.gmail.com> <871ru9e595.fsf@mpe.ellerman.id.au>
In-Reply-To: <871ru9e595.fsf@mpe.ellerman.id.au>
From:   Anthony Steinhauser <asteinhauser@google.com>
Date:   Fri, 15 Nov 2019 13:13:41 -0800
Message-ID: <CAN_oZf099MO5pzfbh4H6Hb7r3DBNp3Oo75cZJaw6h+nQAjTUOw@mail.gmail.com>
Subject: Re: [PATCH] Mention PowerPC in the L1TF documentation.
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Jiri Kosina <jkosina@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks a lot, Michael!

On Fri, Nov 15, 2019 at 3:41 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Anthony Steinhauser <asteinhauser@google.com> writes:
> > OK, I don't intend to work on it to that extent, so you can consider
> > this abandoned.
>
> I or someone else at IBM will pick this up and get it massaged into a
> form that Thomas is happy with.
>
> cheers
>
> > On Thu, Nov 14, 2019 at 2:55 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> >>
> >> Anthony,
> >>
> >> On Thu, 14 Nov 2019, asteinhauser@google.com wrote:
> >>
> >> > From: Anthony Steinhauser <asteinhauser@google.com>
> >> >
> >> > There is a false negative that L1TF is Intel specific while it affects
> >> > also PowerPC:
> >> > https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=8e6b6da91ac9b9ec5a925b6cb13f287a54bd547d
> >>
> >> Please use the regular
> >>
> >>    commit 12-char-sha ("powerpc: .......")
> >>
> >> notation. These links are horrible.
> >>
> >> > Another false negative is that the kernel is unconditionally protected
> >> > against L1TF attacks from userspace. That's true only on x86 but not on
> >> > PowerPC where you can turn the protection off by nopti.
> >>
> >> Missing newline between body and SOB
> >>
> >> > Signed-off-by: Anthony Steinhauser <asteinhauser@google.com>
> >> > ---
> >> >  Documentation/admin-guide/hw-vuln/l1tf.rst | 15 +++++++++------
> >> >  1 file changed, 9 insertions(+), 6 deletions(-)
> >> >
> >> > diff --git a/Documentation/admin-guide/hw-vuln/l1tf.rst b/Documentation/admin-guide/hw-vuln/l1tf.rst
> >> > index f83212fae4d5..243e494b337a 100644
> >> > --- a/Documentation/admin-guide/hw-vuln/l1tf.rst
> >> > +++ b/Documentation/admin-guide/hw-vuln/l1tf.rst
> >> > @@ -9,10 +9,11 @@ for the access, has the Present bit cleared or other reserved bits set.
> >> >  Affected processors
> >> >  -------------------
> >> >
> >> > -This vulnerability affects a wide range of Intel processors. The
> >> > -vulnerability is not present on:
> >> > +This vulnerability affects a wide range of Intel and PowerPC processors.
> >> > +The vulnerability is not present on:
> >> >
> >> > -   - Processors from AMD, Centaur and other non Intel vendors
> >> > +   - Processors from AMD, Centaur and other non Intel vendors except for
> >> > +     PowerPC
> >>
> >> No. This needs restructuring. The non Intel vendor means vendors which
> >> produce x86 machines (not really clear TBH), but adding these two PPC parts
> >> above and here does not make it any better.
> >>
> >> >     - Older processor models, where the CPU family is < 6
> >>
> >> Also this suggest that _ALL_ PowerPC processors are affected as there is
> >> no exception list.
> >>
> >> So I suggest to structure this like this:
> >>
> >> Affected processors
> >> -------------------
> >>
> >>  1) Intel processors
> >>
> >>     Move the existing list here
> >>
> >>  2) PowerPC processors
> >>
> >>     Add some meat
> >>
> >> Whether a processor is affected or not...
> >>
> >> > @@ -125,7 +126,7 @@ mitigations are active. The relevant sysfs file is:
> >> >
> >> >  /sys/devices/system/cpu/vulnerabilities/l1tf
> >> >
> >> > -The possible values in this file are:
> >> > +The possible values in this file on x86 are:
> >>
> >> That commit you referenced added the sysfs output for powerpc. So that
> >> should be documented properly here as well, right?
> >>
> >> >    ===========================   ===============================
> >> >    'Not affected'             The processor is not vulnerable
> >> > @@ -158,8 +159,10 @@ The resulting grade of protection is discussed in the following sections.
> >> >  Host mitigation mechanism
> >> >  -------------------------
> >> >
> >> > -The kernel is unconditionally protected against L1TF attacks from malicious
> >> > -user space running on the host.
> >> > +On x86 the kernel is unconditionally protected against L1TF attacks from
> >> > +malicious user space running on the host. On PowerPC the kernel is
> >> > +protected by flushing the L1D cache on each transition from kernel to
> >> > +userspace unless the 'nopti' boot argument turns this mitigation off.
> >>
> >> Please make this clearly visually separated. Just glueing this together is
> >> hard to read.
> >>
> >> What about the l1tf boot param? Is it x86 only? If so, then this wants to
> >> be added to the the documentation as well.
> >>
> >> What about the guest to host issue on PPC? Not affected or same mitigation
> >> or what?
> >>
> >> We really spent a lot of time to write understandable and useful
> >> documentation. Just sprinkling a few powerpc'isms into it is really not
> >> cutting it.
> >>
> >> This needs proper structuring so that it's obvious for the intended
> >> audience (administrators, users) which part is applicable to which
> >> architecture or to both.
> >>
> >> Thanks,
> >>
> >>         tglx
