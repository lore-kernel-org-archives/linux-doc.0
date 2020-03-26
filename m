Return-Path: <SRS0=jv2Y=5L=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AFD8C43331
	for <linux-doc@archiver.kernel.org>; Thu, 26 Mar 2020 22:41:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DF90720719
	for <linux-doc@archiver.kernel.org>; Thu, 26 Mar 2020 22:41:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N6Gty9j5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbgCZWlm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Mar 2020 18:41:42 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:36247 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727751AbgCZWlm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Mar 2020 18:41:42 -0400
Received: by mail-io1-f65.google.com with SMTP id d15so7909956iog.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2020 15:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pV3Rq8VV90pxzUn7HWtfxwIKA8SXzWzO13gSV7nMFrE=;
        b=N6Gty9j58iW0NCChfzETpTWosimkiJkW8BSlHpEzXoRpx7+3yyrL2JfyvnsLwqytP+
         glRFlMDN+9LZG5Q9vel1puCJqCe5ST5AlB6OwLbWjBwQqg0lBIgC1vKc+fjm043etgTg
         icisCnlYQsGnLCtIAqQHIlT/sBhgZh3z3CzbVtgvW6B9vnVgEtz+wsSkKMP7auq6+gKQ
         SvtkCXy9mcRdRisJruku2oMHbPt3z3iYxnhFzpGy5HvojACZyh3cFyLViGzj59IgsP98
         zTCKjtlfsX9qWSKcmAFFV0zFPBjz0HiJFR7foV96nMRPV+uqZYiWEGQ1UzSJ8Sj4XyyN
         Z24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pV3Rq8VV90pxzUn7HWtfxwIKA8SXzWzO13gSV7nMFrE=;
        b=HqmXRJAV4sIpNePp+j2WyyyNwCmt0bzN0pISIMO0D1IlB+opP+faK3GvYAbXW48jkE
         xUsk2WLu9jmaINV/HEwupx4WKFDWm9MEwqHFlZHMbLzJC8oJrR/7uYGXPOsQ844/YIAn
         pxEYmVLxfen2rF87bnyB0xQDoZ2LGciDONPS2/WmJT7oNYzNGQhJqADF4RvHO8yiXGCY
         ZMNJVuBnSrXZfrBmJwbGL1gb7xYjuZrrlYGwmiqe8qnd+SLMHMrA96HFdAbFRq6w9E6S
         3dUR6uZzRz58fr8pOcQzXvTyslPE7KvdanXmPDtrH9/H3P343KXvlgqbkZp4bWDdH3sd
         b1IQ==
X-Gm-Message-State: ANhLgQ0Dwnqk1KMY4nBUDOnP7zfg7NKnZIv/nHWrPj5DptkwIGHAc5x6
        hgkK7cd1hn9aRPCBaeJCuqyg1XUd6eOYxIxTQfAa0w==
X-Google-Smtp-Source: ADFU+vsKGHwH8Spq/xRSNDHIu1GpTN+FuWhTH0IftdKhYeDQz1oulDBbwSPTkP+9fJRjfucv0U30KyL8bVVDjWM6Q90=
X-Received: by 2002:a6b:378a:: with SMTP id e132mr10007692ioa.206.1585262501204;
 Thu, 26 Mar 2020 15:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200325194317.526492-1-ross.philipson@oracle.com>
 <CACdnJut56WuqO=uLff0qy1Jp=C6f_sRxLpRBsrzb6byBsFYdCg@mail.gmail.com>
 <bacbc25a-c724-d2fd-40bd-065799cd6195@apertussolutions.com>
 <CACdnJusRATYv3Une5r14KHJVEg5COVW9B_BNViUXjavSxZ6d5A@mail.gmail.com> <8199b81d-7230-44d9-bddf-92af562fe6b1@apertussolutions.com>
In-Reply-To: <8199b81d-7230-44d9-bddf-92af562fe6b1@apertussolutions.com>
From:   Matthew Garrett <mjg59@google.com>
Date:   Thu, 26 Mar 2020 15:41:29 -0700
Message-ID: <CACdnJuvxSaF96PkCiDp5u+599+bU5SnXRgLyWetaOKa0+1UqAg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/12] x86: Trenchboot secure late launch Linux kernel support
To:     "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc:     Ross Philipson <ross.philipson@oracle.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        linux-doc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, trenchboot-devel@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 26, 2020 at 3:37 PM Daniel P. Smith
<dpsmith@apertussolutions.com> wrote:
> On 3/26/20 4:54 PM, Matthew Garrett wrote:
> > PCs depend on the availability of EFI runtime services - it's not
> > possible to just assert that they're untrusted and so unsupported. The
> > TPM code is part of boot services which (based on your design) are
> > unavailable at this point, so I agree that you need your own
> > implementation.
> >
>
> I appreciate this has been a heated area of debate, but with all due
> respect that might be a slight over statement w.r.t. dependency on
> runtime services and not what I was saying about the trustworthiness of
> UEFI. If I have a UEFI platform, I trust EFI to boot the system but that
> does not mean I have to trust it to measure my OS kernel or manage the
> running system. Secure Launch provides a means to start a measurement
> trust chain starting with CPU taking the first measurement and then I
> can do things like disabling runtime services in the kernel or do crazy
> things like using the dynamic launch to switch to a minimal temporary
> kernel that can do high trust operations such as interfacing with
> entities outside your trust boundary, e.g. runtime services.

I understand. However, it is *necessary* for EFI runtime services to
be available somehow, and this design needs to make that possible.
Either EFI runtime services need to be considered part of the TCB, or
we need a mechanism to re-verify the state of the system after making
an EFI call (such as Andy's suggestion).

> Please understand I really do not want my own implementation. I tried to
> see if we could just #include in the minimal needed parts from the
> in-tree TPM driver but could not find a clean way to do so. Perhaps
> there might be a future opportunity to collaborate with the TPM driver
> maintainers to refactor in a way that we can just reuse instead of
> reimplement.

I think it's reasonable to assert that boot services can't be part of
the TCB in this case, and as a result you're justified in not using
the firmware's TPM implementation. However, we still need a solution
for access to runtime services.
