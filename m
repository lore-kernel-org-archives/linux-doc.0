Return-Path: <SRS0=dTg4=5K=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D962C2D0E5
	for <linux-doc@archiver.kernel.org>; Wed, 25 Mar 2020 20:29:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 02D5D20719
	for <linux-doc@archiver.kernel.org>; Wed, 25 Mar 2020 20:29:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZI2byf2r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727316AbgCYU3Q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 25 Mar 2020 16:29:16 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:33881 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbgCYU3Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Mar 2020 16:29:16 -0400
Received: by mail-io1-f67.google.com with SMTP id h131so3753052iof.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2020 13:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PU8MusG8hezkzW5+KO/6eKPDv5BwIZAo7r3U1MyX75U=;
        b=ZI2byf2rDJAZbfLYIXaAtMe63t/0GZoKwJ4cK63V8WQp6VV2H/N8jjA3QPBc5D27gM
         kcc5YHnX7hmE9y5h4ERM1pqI8/u7ax3SGdAaz2nzqYK8MIeWO/F5R6sImG+aYjVIjGIe
         +mJupj1LoVmeoww+WGM9cKjT9YyWnxsVR2gjuo1doh6veivh3sR6gjhHvYV6DyZZY7J/
         6znmOWw1IZ9IKbczFzX4/NakSIY0YPwWONtukKHn45S/NknmbZ6ORd0r2/OoSfxdwlIo
         +YjNScxCFwoqud/dYZSZiUw66GNobXRASbg8+3OMXxCUD0MHhXmZC1/XDf+frjMWzZtC
         61bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PU8MusG8hezkzW5+KO/6eKPDv5BwIZAo7r3U1MyX75U=;
        b=Gk3CNP+L/FUxVg38Ncw9468NjSj/CKuSbU0p/rp3Em9uXwo2FyBVmyDQ4P0vWzhK5F
         RWF2W00enL2DGb7aeUn3g/XOIj1e4TZmNoQqz4FYz4DL0rmj9SUC+MyiLpDUP5KGax05
         cBa48Fj37x6yod9zEOAtgU4H916t5PFQD3gjD5TiUZR/N7ehf4S8bfP5tzS7F42ibvxJ
         djnVI4gYA7LVIMIsSgPxDbbrmav5e2kb4Siwr9azt7XByCW4UVJ2v1EPIp3kXP60g+2D
         CTIUmGqrf6fULrILIdx7fCjB8dmH+iZ4z+vjJKHHPHXpevF4AMlY9BVqHDlINZKxQRu8
         px7Q==
X-Gm-Message-State: ANhLgQ3QUXPAMT2umJJZovzIf30IORzjt9B1X8S+R0ECvlxhteIxIjnW
        CjyDG1+np2SLTFp+4MKZuMUj3fmPy9NTe1l/tRiqYg==
X-Google-Smtp-Source: ADFU+vtmJqBnftLMH2+YVqFQ9mUmLnM8IJNNLIYZmzTFdCDzijDPUJnekA7kYFkGsSJAc9tM9X7A8KYbax34+wu6Me8=
X-Received: by 2002:a02:93c1:: with SMTP id z59mr4456806jah.11.1585168154776;
 Wed, 25 Mar 2020 13:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200325194317.526492-1-ross.philipson@oracle.com>
In-Reply-To: <20200325194317.526492-1-ross.philipson@oracle.com>
From:   Matthew Garrett <mjg59@google.com>
Date:   Wed, 25 Mar 2020 13:29:03 -0700
Message-ID: <CACdnJut56WuqO=uLff0qy1Jp=C6f_sRxLpRBsrzb6byBsFYdCg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/12] x86: Trenchboot secure late launch Linux kernel support
To:     Ross Philipson <ross.philipson@oracle.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        linux-doc@vger.kernel.org, dpsmith@apertussolutions.com,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, trenchboot-devel@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 25, 2020 at 12:43 PM Ross Philipson
<ross.philipson@oracle.com> wrote:
> To enable the kernel to be launched by GETSEC or SKINIT, a stub must be
> built into the setup section of the compressed kernel to handle the
> specific state that the late launch process leaves the BSP. This is a
> lot like the EFI stub that is found in the same area. Also this stub
> must measure everything that is going to be used as early as possible.
> This stub code and subsequent code must also deal with the specific
> state that the late launch leaves the APs in.

How does this integrate with the EFI entry point? That's the expected
entry point on most modern x86. What's calling ExitBootServices() in
this flow, and does the secure launch have to occur after it? It'd be
a lot easier if you could still use the firmware's TPM code rather
than carrying yet another copy.
