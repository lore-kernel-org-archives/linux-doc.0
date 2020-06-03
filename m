Return-Path: <SRS0=FLyy=7Q=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 645B6C433E0
	for <linux-doc@archiver.kernel.org>; Wed,  3 Jun 2020 20:39:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37D952074B
	for <linux-doc@archiver.kernel.org>; Wed,  3 Jun 2020 20:39:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MMzEnDbt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbgFCUjU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Jun 2020 16:39:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46193 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726076AbgFCUjU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Jun 2020 16:39:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591216757;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7qXutEZtbDBMnxHPxNkfv1ht6U8C9RNtapAPHQL9k7E=;
        b=MMzEnDbtHGRUwKfejfVI05XVXRmS/uQbaSTXtLyyPgEeRhNzhBl0LVnp54EWQell0pb5yb
        yltXUFUJsD5osVjAkOVAis2HVRzEWwKkLqANl16QDIE6JKjtmx3w29YkXRMsZamP1njKmj
        cQqOqsDMspIKaHtp6BNe1MO9PiY0Y78=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-5mwR9fKGP32ap5LHZIgaCQ-1; Wed, 03 Jun 2020 16:39:12 -0400
X-MC-Unique: 5mwR9fKGP32ap5LHZIgaCQ-1
Received: by mail-qt1-f198.google.com with SMTP id w14so2962267qtv.19
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2020 13:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7qXutEZtbDBMnxHPxNkfv1ht6U8C9RNtapAPHQL9k7E=;
        b=QgGTLKxqeLEcAnWoDDkWJsfu09uEmkOlBqh1mSNL9Cz+AHpGHoUXa/SZQtQo8Bfmg6
         5xY6iUnCro1VjaznzN2ZkxV/N4WXy3hdCpEU4kA0flnBYRR6EFXRVhR5FUGUPGq8KUPl
         V7iOr5J3XWOWZ8pyupYv5Bn1IbfygvdukBkLbOkXzLPq+xpOZiusNRM9cColQv4KnTYu
         dLsuhCllTwU+3/wKJbPWmRTItrSkLhlnKqB7dLz9gIhLfN1bPZrZ+PoETMpWHVZptkHl
         QX9g6iMQSTqk2TqMLSLVaW7GmjLG/gJ7Pq6Wo4NUHYKDV74Q+0jiP5DSXH4pczz1be40
         FbkA==
X-Gm-Message-State: AOAM5330rJu19rlqMmi2mwhZbyKi7MpzCKwGY/Yw7QD313rfl68gNHks
        3fcSeZ5/3KJv9uVe2Q5+WaLjhXFuC5TAFpt0RRwOXmJaqeZY32n29sOADYiKGjA9IzWCZoxBlOs
        JlN/gmEKwl058n/MTRAAYNFQ/XXlKkq4x4jHM
X-Received: by 2002:ac8:4d03:: with SMTP id w3mr1222319qtv.200.1591216752192;
        Wed, 03 Jun 2020 13:39:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyX+YaZBQVbV2mhorUVRsDMl0Wf97S2ntVZndHXWse1f45tLhDNwlcPqJjxs9yW7dXPLwuee+I38exKcoMgNnI=
X-Received: by 2002:ac8:4d03:: with SMTP id w3mr1222300qtv.200.1591216751906;
 Wed, 03 Jun 2020 13:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
 <1575057559-25496-6-git-send-email-bhsharma@redhat.com> <8a982138-f1fa-34e8-18fd-49a79cea3652@arm.com>
 <b7d8d603-d9fe-3e18-c754-baf2015acd16@redhat.com> <51606585-77a3-265f-1d4e-19f25a90697d@broadcom.com>
In-Reply-To: <51606585-77a3-265f-1d4e-19f25a90697d@broadcom.com>
From:   Bhupesh Sharma <bhsharma@redhat.com>
Date:   Thu, 4 Jun 2020 02:08:59 +0530
Message-ID: <CACi5LpPXdcJ7AmFWiSyM8rG_+7C=wTqiP0oCa9QAPe0Y0_wH=Q@mail.gmail.com>
Subject: Re: Re: [RESEND PATCH v5 5/5] Documentation/vmcoreinfo: Add
 documentation for 'TCR_EL1.T1SZ'
To:     Scott Branden <scott.branden@broadcom.com>
Cc:     James Morse <james.morse@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Will Deacon <will@kernel.org>, x86@kernel.org,
        kexec mailing list <kexec@lists.infradead.org>,
        Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
        Dave Anderson <anderson@redhat.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Bhupesh SHARMA <bhupesh.linux@gmail.com>,
        linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Steve Capper <steve.capper@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello Scott,

On Thu, Jun 4, 2020 at 12:17 AM Scott Branden
<scott.branden@broadcom.com> wrote:
>
> Hi Bhupesh,
>
> Would be great to get this patch series upstreamed?
>
> On 2019-12-25 10:49 a.m., Bhupesh Sharma wrote:
> > Hi James,
> >
> > On 12/12/2019 04:02 PM, James Morse wrote:
> >> Hi Bhupesh,
> >
> > I am sorry this review mail skipped my attention due to holidays and
> > focus on other urgent issues.
> >
> >> On 29/11/2019 19:59, Bhupesh Sharma wrote:
> >>> Add documentation for TCR_EL1.T1SZ variable being added to
> >>> vmcoreinfo.
> >>>
> >>> It indicates the size offset of the memory region addressed by
> >>> TTBR1_EL1
> >>
> >>> and hence can be used for determining the vabits_actual value.
> >>
> >> used for determining random-internal-kernel-variable, that might not
> >> exist tomorrow.
> >>
> >> Could you describe how this is useful/necessary if a debugger wants
> >> to walk the page
> >> tables from the core file? I think this is a better argument.
> >>
> >> Wouldn't the documentation be better as part of the patch that adds
> >> the export?
> >> (... unless these have to go via different trees? ..)
> >
> > Ok, will fix the same in v6 version.
> >
> >>> diff --git a/Documentation/admin-guide/kdump/vmcoreinfo.rst
> >>> b/Documentation/admin-guide/kdump/vmcoreinfo.rst
> >>> index 447b64314f56..f9349f9d3345 100644
> >>> --- a/Documentation/admin-guide/kdump/vmcoreinfo.rst
> >>> +++ b/Documentation/admin-guide/kdump/vmcoreinfo.rst
> >>> @@ -398,6 +398,12 @@ KERNELOFFSET
> >>>   The kernel randomization offset. Used to compute the page offset. If
> >>>   KASLR is disabled, this value is zero.
> >>>   +TCR_EL1.T1SZ
> >>> +------------
> >>> +
> >>> +Indicates the size offset of the memory region addressed by TTBR1_EL1
> >>
> >>> +and hence can be used for determining the vabits_actual value.
> >>
> >> 'vabits_actual' may not exist when the next person comes to read this
> >> documentation (its
> >> going to rot really quickly).
> >>
> >> I think the first half of this text is enough to say what this is
> >> for. You should include
> >> words to the effect that its the hardware value that goes with
> >> swapper_pg_dir. You may
> >> want to point readers to the arm-arm for more details on what the
> >> value means.
> >
> > Ok, got it. Fixed this in v6, which should be on its way shortly.
> I can't seem to find v6?

Oops. I remember Cc'ing you to the v6 patchset (may be my email client
messed up), anyways here is the v6 patchset for your reference:
<http://lists.infradead.org/pipermail/kexec/2020-May/025095.html>

Do share your review/test comments on the same.

Thanks,
Bhupesh

