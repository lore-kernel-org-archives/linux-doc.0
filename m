Return-Path: <SRS0=XnAq=2G=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4061C2D0CF
	for <linux-doc@archiver.kernel.org>; Mon, 16 Dec 2019 06:46:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 79C6D2072B
	for <linux-doc@archiver.kernel.org>; Mon, 16 Dec 2019 06:46:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h8RGoPoi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbfLPGqa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 Dec 2019 01:46:30 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:58143 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726448AbfLPGq3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Dec 2019 01:46:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576478788;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uPUbX9Jz4xx+ZUII2dhvvUhvv4VHD3gib9TjJw4FvFo=;
        b=h8RGoPoi/1royfgMHd6sErkH7jK2y0+4sfACJ/lCj1ci3H7oU2lCxH2p815FJHxwjzz2+i
        pIMG/0fhgVSF3u/86Rv3Ry8Ue3JHkwNeXhQJOTxeidRZGKcd9KFLTYZ62SgqkdTk/U34i6
        61OeiaKGpFTECr8Te+sz/q0GlhgCPSs=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-_9y6Ny8ROmCnxX8Oeo8G5g-1; Mon, 16 Dec 2019 01:46:26 -0500
X-MC-Unique: _9y6Ny8ROmCnxX8Oeo8G5g-1
Received: by mail-lj1-f197.google.com with SMTP id 140so1789381ljj.3
        for <linux-doc@vger.kernel.org>; Sun, 15 Dec 2019 22:46:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uPUbX9Jz4xx+ZUII2dhvvUhvv4VHD3gib9TjJw4FvFo=;
        b=S3+Io64uh0emQc7+V8qGmoN+dLHpti0sWeAkt3NnEdqRDxpapzDS2Fumj0HE7YqdwK
         R+m7s48JoGg5L6qc9+n4acYvgud+xLovpvty9bU3GNMeb5L7h59+is887Nv1QtYyJAiO
         sPIGoSzDSc4w4RN7f5GKrLiSlpw2UCRJSmoWHZtTof91bWp4RNRFjSn8ikaduwY4Qeof
         7yJxjIKQHsUX+dL2HItnqiBopRP5yL9PB9Fv0HhxCTZUoj4/v5AA7ovQ+G/TXH5Sg1vv
         3EWERtOiyHFY+hWe+ez9vMvo8y5EeA3Vvo708ZQ7ntmUdr0yFiqUgHTCvx8feTblNJO0
         Xpwg==
X-Gm-Message-State: APjAAAXo+BVTnuDqLCNm+aVpuKoksl5nJ2/QRUT1o2laouXQ9oNkkXAe
        jvPIHVH+z6TorxKjh0kjnfMFCn8q8nHFoGxperw4wcW9gLJIsoPksmNJpRDcPavuXYj+IKQeYW7
        3/TvSRDlQN5UeFXRnmVMjBctWDBmQZHb6o2jK
X-Received: by 2002:a19:f619:: with SMTP id x25mr15220138lfe.146.1576478784857;
        Sun, 15 Dec 2019 22:46:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqxYIqap6RvvS/V3qRxs6d85Vgoutpx8l9xgfgCmVn0EpC3k91P2m6SYYYdmxGiRTrSSf+TXl7Fnv3bF7BQRunc=
X-Received: by 2002:a19:f619:: with SMTP id x25mr15220124lfe.146.1576478784677;
 Sun, 15 Dec 2019 22:46:24 -0800 (PST)
MIME-Version: 1.0
References: <1574972621-25750-1-git-send-email-bhsharma@redhat.com> <20191214122734.GC28635@zn.tnic>
In-Reply-To: <20191214122734.GC28635@zn.tnic>
From:   Bhupesh Sharma <bhsharma@redhat.com>
Date:   Mon, 16 Dec 2019 12:16:12 +0530
Message-ID: <CACi5LpP2PPcmaQw95V4MUzhvENq9+mB7UR7eib2HADCDHLz4oA@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Append new variables to vmcoreinfo (TCR_EL1.T1SZ
 for arm64 and MAX_PHYSMEM_BITS for all archs)
To:     Borislav Petkov <bp@alien8.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bhupesh SHARMA <bhupesh.linux@gmail.com>, x86@kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        kexec mailing list <kexec@lists.infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        James Morse <james.morse@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Will Deacon <will@kernel.org>,
        Steve Capper <steve.capper@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Dave Anderson <anderson@redhat.com>,
        Kazuhito Hagio <k-hagio@ab.jp.nec.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Boris,

On Sat, Dec 14, 2019 at 5:57 PM Borislav Petkov <bp@alien8.de> wrote:
>
> On Fri, Nov 29, 2019 at 01:53:36AM +0530, Bhupesh Sharma wrote:
> > Bhupesh Sharma (5):
> >   crash_core, vmcoreinfo: Append 'MAX_PHYSMEM_BITS' to vmcoreinfo
> >   arm64/crash_core: Export TCR_EL1.T1SZ in vmcoreinfo
> >   Documentation/arm64: Fix a simple typo in memory.rst
> >   Documentation/vmcoreinfo: Add documentation for 'MAX_PHYSMEM_BITS'
> >   Documentation/vmcoreinfo: Add documentation for 'TCR_EL1.T1SZ'
>
> why are those last two separate patches and not part of the patches
> which export the respective variable/define?

I remember there was a suggestion during the review of an earlier
version to keep them as a separate patch(es) so that the documentation
text is easier to review, but I have no strong preference towards the
same.

I can merge the documentation patches with the respective patches
(which export the variables/defines to vmcoreinfo) in v6, unless other
maintainers have an objections towards the same.

Thanks,
Bhupesh

