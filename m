Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C427EB64D7
	for <linux-doc@archiver.kernel.org>; Fri, 16 Jun 2023 13:57:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbjFPN5R (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Jun 2023 09:57:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344139AbjFPN5K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Jun 2023 09:57:10 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 105FF3AB9
        for <linux-doc@vger.kernel.org>; Fri, 16 Jun 2023 06:56:40 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-569fee67d9dso17853617b3.1
        for <linux-doc@vger.kernel.org>; Fri, 16 Jun 2023 06:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686923779; x=1689515779;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fLjpuuUE/jNF1tH6F57kU3/oz9GcPLjPemMOCQa+1A=;
        b=kNEwOe7XFugcmTjzejkuLqe708dE86ZSA2Z02MR+itoEcBA1IIXVGzEzNcM+7B/yit
         /G4/KfRJfYi8TfuA+schY99QKI/TgMRFSYQ3YShmf+jecxNfsH3FIycYHMvFkGYx3dO6
         csX3FpYeN9nHCvPR5xqobGs5gY/sWUAvRRDrsHMm4O/O/5Os7zOZs5Kn9EgWQFrxh4yp
         N3ffTABcIaPkXXPUx2UnPJ+63qtXb5iRnFA1BvlKY85/2QpvaUgCXGQ7Bbjqpa4jFC5K
         dYPkhAwcHFMJzsjx5/8e7eryiOfCf+EYLwADTFT7G50bhph4lhHC4vtoySHvJ5NdcK9u
         MgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686923779; x=1689515779;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+fLjpuuUE/jNF1tH6F57kU3/oz9GcPLjPemMOCQa+1A=;
        b=hhtr/b9VAx9P8MNwBduZMcnsMAl6ZIZTTXe9zkKTgNgo1BomrlgfZEx5uwaEoH38Fq
         PvTHvhYZQdesLuoaJa5BTIka3lExbXELrw8vfCOHXy0BZ0D5ZSE2WJxmRoliajSyK/CV
         6vpG6G9Orjyc334Sb+NV7JctwJtKw3oELSSYS4V5+SbV2AAut/x2sYcWDMdpyDWmdrjn
         gQbxr1RBC6xgyFU5dNSSFMwgTB+qr5Y5A13BsW6w/YL9b/gtmfkq2xbR9PVKWp+Hv8Xg
         J5P0JfIYfFTM+XfYA03Du5aHVjTyvxlWPAYlwzaZRpewuVjTUChgt7+ZjE4JPSx/fy7X
         1dQQ==
X-Gm-Message-State: AC+VfDz+lsHTeeOnYkrGZqT3LuiL+jVOV3nfeoz0M8gOXlOjYnilK5gH
        18nXlIbctqDmAc0hbczT6bVudEPl8Js=
X-Google-Smtp-Source: ACHHUZ7OzTA93Y1I7rU1NhrUcAYr1UEs7VGzDreSZWqL5hTvLcWQja6Louv3bjofLUuDe8EyPzVEx6z26Vk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:ac04:0:b0:56d:5db:2f07 with SMTP id
 k4-20020a81ac04000000b0056d05db2f07mr3772639ywh.5.1686923778815; Fri, 16 Jun
 2023 06:56:18 -0700 (PDT)
Date:   Fri, 16 Jun 2023 06:56:17 -0700
In-Reply-To: <001aa2ed-2f78-4361-451d-e31a4d4abaa0@semihalf.com>
Mime-Version: 1.0
References: <20230612164727.3935657-1-carlos.bilbao@amd.com>
 <ZIihRqZljMaMRGcK@google.com> <DM8PR11MB5750D16B08B769173DCD740AE75AA@DM8PR11MB5750.namprd11.prod.outlook.com>
 <ZInLlkXsgnej9ZpT@google.com> <001aa2ed-2f78-4361-451d-e31a4d4abaa0@semihalf.com>
Message-ID: <ZIxqAXhy1tCVpzz7@google.com>
Subject: Re: [PATCH v2] docs: security: Confidential computing intro and
 threat model for x86 virtualization
From:   Sean Christopherson <seanjc@google.com>
To:     Dmytro Maluka <dmy@semihalf.com>
Cc:     Elena Reshetova <elena.reshetova@intel.com>,
        Carlos Bilbao <carlos.bilbao@amd.com>,
        Jason CJ Chen <jason.cj.chen@intel.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "ardb@kernel.org" <ardb@kernel.org>,
        "kraxel@redhat.com" <kraxel@redhat.com>,
        "dovmurik@linux.ibm.com" <dovmurik@linux.ibm.com>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "Dhaval.Giani@amd.com" <Dhaval.Giani@amd.com>,
        "michael.day@amd.com" <michael.day@amd.com>,
        "pavankumar.paluri@amd.com" <pavankumar.paluri@amd.com>,
        "David.Kaplan@amd.com" <David.Kaplan@amd.com>,
        "Reshma.Lal@amd.com" <Reshma.Lal@amd.com>,
        "Jeremy.Powell@amd.com" <Jeremy.Powell@amd.com>,
        "sathyanarayanan.kuppuswamy@linux.intel.com" 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        "alexander.shishkin@linux.intel.com" 
        <alexander.shishkin@linux.intel.com>,
        "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "dgilbert@redhat.com" <dgilbert@redhat.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "dinechin@redhat.com" <dinechin@redhat.com>,
        "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
        "berrange@redhat.com" <berrange@redhat.com>,
        "mst@redhat.com" <mst@redhat.com>, "tytso@mit.edu" <tytso@mit.edu>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "joro@8bytes.org" <joro@8bytes.org>,
        "leon@kernel.org" <leon@kernel.org>,
        "richard.weinberger@gmail.com" <richard.weinberger@gmail.com>,
        "lukas@wunner.de" <lukas@wunner.de>,
        "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "cdupontd@redhat.com" <cdupontd@redhat.com>,
        "jasowang@redhat.com" <jasowang@redhat.com>,
        "sameo@rivosinc.com" <sameo@rivosinc.com>,
        "bp@alien8.de" <bp@alien8.de>,
        "security@kernel.org" <security@kernel.org>,
        Larry Dewey <larry.dewey@amd.com>, android-kvm@google.com,
        Dmitry Torokhov <dtor@google.com>,
        Allen Webb <allenwebb@google.com>,
        Tomasz Nowicki <tn@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>,
        Patryk Duda <pdk@semihalf.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 16, 2023, Dmytro Maluka wrote:
> On 6/14/23 16:15, Sean Christopherson wrote:
> > On Wed, Jun 14, 2023, Elena Reshetova wrote:
> >> Not having a network access requirement doesn=E2=80=99t implicitly inv=
alidate the=20
> >> separation guarantees between the host and guest, it just makes it eas=
ier
> >> since you have one interface less between the host and guest.
> >=20
> > My point is that if the protected guest doesn't need any I/O beyond the=
 hardware
> > device that it accesses, then the threat model is different because man=
y of the
> > new/novel attack surfaces that come with the TDX/SNP threat model don't=
 exist.
> > E.g. the hardening that people want to do for VirtIO drivers may not be=
 at all
> > relevant to pKVM.

...

> But I think I get what you mean: there is no data transfer whereby the
> host is not an endpoint but an intermediary between the guest and some
> device. In simple words, things like virtio-net or virtio-blk are out of
> scope. Yes, I think that's correct for pKVM-on-x86 use cases (and I
> suppose it is correct for pKVM-on-ARM use cases as well). I guess it
> means that "guest data attacks" may not be relevant to pKVM, and perhaps
> this makes its threat model substantially different from cloud use
> cases.

Yes. =20

> >>>> +This new type of adversary may be viewed as a more powerful type
> >>>> +of external attacker, as it resides locally on the same physical ma=
chine
> >>>> +-in contrast to a remote network attacker- and has control over the=
 guest
> >>>> +kernel communication with most of the HW::
> >>>
> >>> IIUC, this last statement doesn't hold true for the pKVM on x86 use c=
ase, which
> >>> specifically aims to give a "guest" exclusive access to hardware reso=
urces.
> >>
> >> Does it hold for *all* HW resources? If yes, indeed this would make pK=
VM on
> >> x86 considerably different.
> >=20
> > Heh, the original says "most", so it doesn't have to hold for all hardw=
are resources,
> > just a simple majority.
>=20
> Again, pedantic mode on, I find it difficult to agree with the wording
> that the guest owns "most of" the HW resources it uses. It controls the
> data communication with its hardware device, but other resources (e.g.
> CPU time, interrupts, timers, PCI config space, ACPI) are owned by the
> host and virtualized by it for the guest.

I wasn't saying that the guest owns most resources, I was saying that the *=
untrusted*
host does *not* own most resources that are exposed to the guest.  My under=
standing
is that everything in your list is owned by the trusted hypervisor in the p=
KVM model.

What I was pointing out is related to the above discussion about the guest =
needing
access to hardware that is effectively owned by the untrusted host, e.g. ne=
twork
access.
