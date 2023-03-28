Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F42C761A6
	for <linux-doc@archiver.kernel.org>; Tue, 28 Mar 2023 20:43:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbjC1Unw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Mar 2023 16:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjC1Unv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Mar 2023 16:43:51 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9102012B
        for <linux-doc@vger.kernel.org>; Tue, 28 Mar 2023 13:43:50 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-545e907790fso137913247b3.3
        for <linux-doc@vger.kernel.org>; Tue, 28 Mar 2023 13:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680036230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wa0LfFSjVxiVuRv97x/zQwaxJI/K9lza1arifqvGksw=;
        b=O/2GpUlj5wwbEi1Kekelt0BSM8jT3q6K9BPbeFRL/HOLPyzBwut4I7tfHO4vMde8Vp
         fxLILFCiGZolEDUb9SNUHf6mT3LOusPAB/rbryqkJ5fdK03sVWQB5e09K6W2Tg2dW6eU
         0NW6+NJhFwGEt+hboYzSw4xMrCFtiaIm+0AtP0tt0qRm9JbCnFS7rLBUMiRXzy+mB3W7
         MbBy+RgQz8rzixGuilnbiPl3tMM8xV+U0e4B2ZQ/XwrrDE1HrkOIqg/FCvUlmPHT7X+4
         BWgCpCsUVEsIToMaIkXjoaYSVJtS1UFITQdsn25qWYujXhnY4K5cuRTtETOJ7YVJLG/E
         msbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680036230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wa0LfFSjVxiVuRv97x/zQwaxJI/K9lza1arifqvGksw=;
        b=sDoeuprV/VF3UyW8f5zOSfXcna3k45JsM1RCB8GMpu59ZAUj2ilFd+NN6ljPiJo6Ck
         IVUciseWa+w/W8P1Uc3c2CoD25LiBkEJuQrA/72KWphlVvt9Gy9aKNWrI/eNwBH/q5+G
         dcL7TId9AmsmsEy+rZtA92HAZBa1HN0lWej9+VjNQkmuvOCS90FMhWwEIv8O9sIbOdqp
         AgBkmJVFOPJAfU7dDe8gMKcWubWV6Ckx96mlPbdc8ZsLAJkz2mV2yZ/9oRh5J5ckj+Jy
         nmaisyEm9H+ptqoKGGN1MOCI1R2L+Bu8RanUM26skEu1WJV3TMso60S4rC4iy17ICkiL
         qXyQ==
X-Gm-Message-State: AAQBX9dsbUYcomMef74q+d8tPZPFVDJOMGhnDKaIixPiPmbdpc2wOBw8
        wX+KCi1iDBFSJf5gFSmFc7h3c00bhY+6IF0NO4ZEag==
X-Google-Smtp-Source: AKy350aw2E9VYrmeTnJprBZcBOtblePseGi0OF0lUoBNJrLP0cQxQckQ7y4WztgnEs8YWj52AgFk7vsmlyozuICsg8o=
X-Received: by 2002:a81:ad5d:0:b0:540:e744:13ae with SMTP id
 l29-20020a81ad5d000000b00540e74413aemr7016748ywk.3.1680036229542; Tue, 28 Mar
 2023 13:43:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230326062039.341479-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <CAAYXXYxC++kRW_Kg0jieaxuwzTC2hu-9SxRjsHH_kqZW_DTE7Q@mail.gmail.com> <CAAH4kHZWW6QsMcLCLYwRo25i6d6Uhg+=rTeoVV7yrGHqUWwFUQ@mail.gmail.com>
In-Reply-To: <CAAH4kHZWW6QsMcLCLYwRo25i6d6Uhg+=rTeoVV7yrGHqUWwFUQ@mail.gmail.com>
From:   Chong Cai <chongc@google.com>
Date:   Tue, 28 Mar 2023 13:43:37 -0700
Message-ID: <CALRH0ChZ7dtJ9ST-mbjVz7Q2jY9QQm6mor5137YyFtSX4td-bw@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] TDX Guest Quote generation support
To:     Dionna Amalie Glaze <dionnaglaze@google.com>
Cc:     Erdem Aktas <erdemaktas@google.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Shuah Khan <shuah@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Wander Lairson Costa <wander@redhat.com>,
        Guorui Yu <GuoRui.Yu@linux.alibaba.com>,
        Du Fan <fan.du@intel.com>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 28, 2023 at 12:59=E2=80=AFPM Dionna Amalie Glaze
<dionnaglaze@google.com> wrote:
>
> +Chong Cai
>
> Adding a colleague per his request since he's not subscribed to the list =
yet.
>
> On Mon, Mar 27, 2023 at 10:36=E2=80=AFAM Erdem Aktas <erdemaktas@google.c=
om> wrote:
> >
> > On Sat, Mar 25, 2023 at 11:20=E2=80=AFPM Kuppuswamy Sathyanarayanan
> > <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
> > >
> > > Hi All,
> > >
> > > In TDX guest, the attestation process is used to verify the TDX guest
> > > trustworthiness to other entities before provisioning secrets to the
> > > guest.
> > >
> > > The TDX guest attestation process consists of two steps:
> > >
> > > 1. TDREPORT generation
> > > 2. Quote generation.
> > >
> > > The First step (TDREPORT generation) involves getting the TDX guest
> > > measurement data in the format of TDREPORT which is further used to
> > > validate the authenticity of the TDX guest. The second step involves
> > > sending the TDREPORT to a Quoting Enclave (QE) server to generate a
> > > remotely verifiable Quote. TDREPORT by design can only be verified on
> > > the local platform. To support remote verification of the TDREPORT,
> > > TDX leverages Intel SGX Quoting Enclave to verify the TDREPORT
> > > locally and convert it to a remotely verifiable Quote. Although
> > > attestation software can use communication methods like TCP/IP or
> > > vsock to send the TDREPORT to QE, not all platforms support these
> > > communication models. So TDX GHCI specification [1] defines a method
> > > for Quote generation via hypercalls. Please check the discussion from
> > > Google [2] and Alibaba [3] which clarifies the need for hypercall bas=
ed
> > Thanks Sathyanarayanan for submitting patches again.
> >
> > I just wanted to reiterate what I said before that having a clean
> > TDVMCALL based interface to get TDX Quote without any virtio/vsock
> > dependency  is critical for us to support many use cases.
>
> +1 to Erdem's point. A simple TDVMCALL interface could make it much
> easier for user cases that can not depend on virtio and vsock.
> Without the TDVMCALL, it will largely limit those user cases to adopt TDX=
.
> Thanks Sathyanarayanan for submitting this patch.
> --
> -Dionna Glaze, PhD (she/her)
