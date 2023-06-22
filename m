Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7483AEB64DA
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jun 2023 23:32:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbjFVXb7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Jun 2023 19:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230503AbjFVXb6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Jun 2023 19:31:58 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32289210B
        for <linux-doc@vger.kernel.org>; Thu, 22 Jun 2023 16:31:57 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-4717a29e19bso28111e0c.3
        for <linux-doc@vger.kernel.org>; Thu, 22 Jun 2023 16:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687476716; x=1690068716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67piO5m5kwhgkGZRSCs+P2mt8JZPTPY6ZNmz3uFEERw=;
        b=Go9OPZrCjyYQrsGYmeyjij/CYhyZz00UzA7dWA9yE65QecRbdBxLjHb3CHXsjMLhgE
         cHOBEJyeVN5chDlUh00cwig04AbPvMnUmLiS7c9iR1pFC2dRjvhIpHnbmq112EW1f9th
         WR2cmAM8Al8Q/WbPfSwc0vJl4NkTl7vLJYvpqHo7KYa3tyErj29HOJ4HsFNergrI31U2
         MJVW/Czc3AdfmGXsRk2YmM+QXV9rh5kaUf0eNvt6cqbat9Y92TT4V6CKZQLD3s6s5B4n
         Le0KRFp7o6I6fiA26eSskq/Vr+AvyD7atFVXYPMv1bm+lDSdRpl0sVOnNORrJSb1C1um
         QB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687476716; x=1690068716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67piO5m5kwhgkGZRSCs+P2mt8JZPTPY6ZNmz3uFEERw=;
        b=DQrs4MCYkIB3QEqawpA8nbb0sjQrt+vlHh+JOSKEFhE7gnkLleyFXqZobbkHBOhfr1
         MPPFvfWR6ig3cdVVAWb08Cjd7xgHHLRip0xE46+UfICO0VPnwqZ+TVNkpXlSaoWI+rW2
         ZShrVFJkbemT38PbFDKg1mL0BQYn0MZIdL3Gl8FqfclnofKCwdrVWo7zDAvZV+lXm1CM
         rhS7pIqv+9IeY/u9OcGEqZwWq4v0ZJThp7ZUCJxkwV9e0ED1Lnh7UklapuyiCRQ5zZAh
         ea2V2OMtY4c0pBy7LQnpQEwFZgsKDtXTZcVO/ShqXsBnHdjEoxCHmTXUQ9jt9Vw4C8U7
         NQyQ==
X-Gm-Message-State: AC+VfDzr4bJNU8Of2kT1R5FWBxPgmSgoLS8RyzbAfkip82VRr4TyFWMV
        x8dSnMbfbbMSEZHOh1uW2Kbf5a7m8BzuE8uvJ0C37g==
X-Google-Smtp-Source: ACHHUZ4yBGctwXzyOZ7e9UbJK1NZq9tQ5XS38jtR9N8MJn8TxhDelZEf+HQlQgnvEqQ9UsmFPsgR3BRng60Q7TltBmI=
X-Received: by 2002:a1f:5744:0:b0:471:5110:49e8 with SMTP id
 l65-20020a1f5744000000b00471511049e8mr9920922vkb.4.1687476714680; Thu, 22 Jun
 2023 16:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1684048511.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <972e1d5c5ec53e2757fb17a586558c5385e987dd.1684048511.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <64876bf6c30e2_1433ac29415@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <64876bf6c30e2_1433ac29415@dwillia2-xfh.jf.intel.com.notmuch>
From:   Erdem Aktas <erdemaktas@google.com>
Date:   Thu, 22 Jun 2023 16:31:43 -0700
Message-ID: <CAAYXXYzOUQC0G7yoh1i2+SW-FodCABwhD6TgArLf28iG=i65zw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] selftests/tdx: Test GetQuote TDX attestation feature
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     Kuppuswamy Sathyanarayanan 
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
        Dionna Amalie Glaze <dionnaglaze@google.com>,
        Chong Cai <chongc@google.com>, Qinkun Bao <qinkun@apache.org>,
        Guorui Yu <GuoRui.Yu@linux.alibaba.com>,
        Du Fan <fan.du@intel.com>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        dhowells@redhat.com, brijesh.singh@amd.com, atishp@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 12, 2023 at 12:03=E2=80=AFPM Dan Williams <dan.j.williams@intel=
.com> wrote:
>
> [ add David, Brijesh, and Atish]
>
> Kuppuswamy Sathyanarayanan wrote:
> > In TDX guest, the second stage of the attestation process is Quote
> > generation. This process is required to convert the locally generated
> > TDREPORT into a remotely verifiable Quote. It involves sending the
> > TDREPORT data to a Quoting Enclave (QE) which will verify the
> > integrity of the TDREPORT and sign it with an attestation key.
> >
> > Intel's TDX attestation driver exposes TDX_CMD_GET_QUOTE IOCTL to
> > allow the user agent to get the TD Quote.
> >
> > Add a kernel selftest module to verify the Quote generation feature.
> >
> > TD Quote generation involves following steps:
> >
> > * Get the TDREPORT data using TDX_CMD_GET_REPORT IOCTL.
> > * Embed the TDREPORT data in quote buffer and request for quote
> >   generation via TDX_CMD_GET_QUOTE IOCTL request.
> > * Upon completion of the GetQuote request, check for non zero value
> >   in the status field of Quote header to make sure the generated
> >   quote is valid.
>
> What this cover letter does not say is that this is adding another
> instance of the similar pattern as SNP_GET_REPORT.
>
> Linux is best served when multiple vendors trying to do similar
> operations are brought together behind a common ABI. We see this in the
> history of wrangling SCSI vendors behind common interfaces. Now multiple

Compared to the number of SCSI vendors, I think the number of CPU
vendors for confidential computing seems manageable to me. Is this
really a good comparison?

> confidential computing vendors trying to develop similar flows with
> differentiated formats where that differentiation need not leak over the
> ABI boundary.

<Just my personal opinion below>
I agree with this statement in the high level but it is also somehow
surprising for me after all the discussion happened around this topic.
Honestly, I feel like there are multiple versions of "Intel"  working
in different directions.

If we want multiple vendors trying to do the similar things behind a
common ABI, it should start with the spec. Since this comment is
coming from Intel, I wonder if there is any plan to combine the GHCB
and GHCI interfaces under common ABI in the future or why it did not
even happen in the first place.

What I see is that Intel has GETQUOTE TDVMCALL interface in its spec
and again Intel does not really want to provide support for it in
linux. It feels really frustrating.

>
> My observation of SNP_GET_REPORT and TDX_CMD_GET_REPORT is that they are
> both passing blobs across the user/kernel and platform/kernel boundary
> for the purposes of unlocking other resources. To me that is a flow that
> the Keys subsystem has infrastructure to handle. It has the concept of
> upcalls and asynchronous population of blobs by handles and mechanisms
> to protect and cache those communications. Linux / the Keys subsystem
> could benefit from the enhancements it would need to cover these 2
> cases. Specifically, the benefit that when ARM and RISC-V arrive with
> similar communications with platform TSMs (Trusted Security Module) they
> can build upon the same infrastructure.
>
> David, am I reaching with that association? My strawman mapping of
> TDX_CMD_GET_QUOTE to request_key() is something like:
>
> request_key(coco_quote, "description", "<uuencoded tdreport>")
>
> Where this is a common key_type for all vendors, but the description and
> arguments have room for vendor differentiation when doing the upcall to
> the platform TSM, but userspace never needs to contend with the
> different vendor formats, that is all handled internally to the kernel.

I think the problem definition here is not accurate. With AMD SNP,
guests need to do a hypercall to KVM and KVM needs to issue a
SNP_GUEST_REQUEST(MSG_REPORT_REQ) to the SP firmware. In TDX, guests
need to do a TDCALL to TDXMODULE to get the TDREPORT and then it needs
to get that report delivered to the host userspace to get the TDQUOTE
generated by the SGX quoting enclave. Also TDQUOTE is designed to work
async while the SNP_GUEST_REQUESTS are blocking vmcalls.

Those are completely different flows. Are you suggesting that intel
should also come down to a single call to get the TDQUOTE like AMD
SNP?

The TDCALL interface asking for the TDREPORT is already there. AMD
does not need to ask the report and the quote separately.

Here, the problem was that Intel (or "upstream community") did not
want to implement/accept hypercall for TDQUOTE which would be handled
by the user space VMM. The alternative implementation (using vsock)
does not work for many use cases including ours. I do not see how your
suggestion addresses the problem that this patch was trying to solve.

So while I like the suggested direction, I am not sure how much it is
possible to come up with a common ABI even with just only for 2
vendors (AMD and Intel) without doing spec changes which is a multi
year effort imho.

>
> At this point I am just looking for confirmation that the "every vendor
> invent a new character device + ioctl" does not scale and a deeper
> conversation is needed. Keys is a plausible solution to that ABI
> proliferation problem.
