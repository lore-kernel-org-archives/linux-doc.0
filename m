Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B8FC001DE
	for <linux-doc@archiver.kernel.org>; Tue, 15 Aug 2023 07:47:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235389AbjHOHrV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Aug 2023 03:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235431AbjHOHrF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Aug 2023 03:47:05 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86B4C1737
        for <linux-doc@vger.kernel.org>; Tue, 15 Aug 2023 00:47:00 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-51d95aed33aso6889292a12.3
        for <linux-doc@vger.kernel.org>; Tue, 15 Aug 2023 00:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1692085619; x=1692690419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGe5aB5QQFtrcwstILThBVk8o25menFmktNdebKAlpo=;
        b=FOZc0Jg58vmTJ3w7Y4slBEtKA/i/NosQwUogj3m2eTUzme5uMzaRx+FsRyccaeWXOH
         FWUvLDxmICvhXrS2QE7RyCuZsZdwWd2MlyNq2lNWSjp4aJYj8O+0NPlXn7zqKJKhOyel
         MReGhZknKIbMk6Em6+RAkIOEx5DMlFOZeBK3m+HW8rawqQxFji5owRwkzwCRcpj3/qVT
         Pz1lPb7gNsYMOY/H8o7FfUJL1Mll5WAhQ46zVp9+q+pmJpN3fdb/6rg0ICOkS2t30cgQ
         pzbQv/HmFLrRtR+s6J4D3lQ9USgO000E7dPi5O6ufq15X34Y4aVc8j15UBD6ct0ff8P7
         N11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692085619; x=1692690419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGe5aB5QQFtrcwstILThBVk8o25menFmktNdebKAlpo=;
        b=MvDufk/xgi35iz65zN73TNWJLqsoK2eAviRb/MkvuN1il4WWHh4RlEcXuKaz254GIw
         ZXxOw1xeAzDiMKHqVdNnwbWWDLAuiyWIFeu7igZifXiSs3BVCK4v38OXvrkDWOT2I5Qv
         pCuU0upEWHOt4gk3pDyZz3kwlFMVlY4WMU2/AX6Z0CrBXd3MXAzGgm4BN18/bIzD4g5n
         pXYQv1qoD2TyFcbEd3tn6+uNNMK8eFN+iJwZ4kP0+sTx2HOjOXP0ZcI2dti/R+QyO+sL
         rkRas7BRyaCxruGJM+rjmGRqkaYqXD+kB2IFHBVInNzCI7dnLVH/fNFkcq27AZxHUdfh
         8C0w==
X-Gm-Message-State: AOJu0YzsXNXuLfRg2L4VvLLc02DC9EshWXSYuC5s1Ch24kVoCXYpJ6ZM
        BNcsRFbR4pAthhNgWvXs23CDB0qBuq067pAA791H6w==
X-Google-Smtp-Source: AGHT+IHuWD0xsdFGgQ//NNdDa0xXkJDK6dyoZ0eavZhIAFc2CRFqWXSPouUcFhxh7k6nJhonciV2SH/RP5EVUWLxFw0=
X-Received: by 2002:a05:6402:550:b0:523:1901:d19c with SMTP id
 i16-20020a056402055000b005231901d19cmr9389442edx.24.1692085618886; Tue, 15
 Aug 2023 00:46:58 -0700 (PDT)
MIME-Version: 1.0
References: <9b8d38f0-fd22-3f98-d070-16baf976ecb5@google.com>
 <20230814082339.2006418-1-snaipe@arista.com> <986c412c-669a-43fe-d72a-9e81bca8211@google.com>
In-Reply-To: <986c412c-669a-43fe-d72a-9e81bca8211@google.com>
From:   =?UTF-8?B?RnJhbmtsaW4g4oCcU25haXBl4oCdIE1hdGhpZXU=?= 
        <snaipe@arista.com>
Date:   Tue, 15 Aug 2023 09:46:22 +0200
Message-ID: <CAK8sBDM5aid1vkCKhBxqUHXrG_FbDRN0noLtPkcPv=jXb7NTNg@mail.gmail.com>
Subject: Re: [PATCH] shmem: add support for user extended attributes
To:     Hugh Dickins <hughd@google.com>
Cc:     ovt@google.com, corbet@lwn.net, akpm@linux-foundation.org,
        brauner@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 15, 2023 at 5:52=E2=80=AFAM Hugh Dickins <hughd@google.com> wro=
te:
>
> Thanks for the encouragement.  At the time that I wrote that (20 July)
> I did not expect to get around to it for months.  But there happens to
> have been various VFS-involving works going on in mm/shmem.c recently,
> targeting v6.6: which caused me to rearrange priorities, and join the
> party with tmpfs user xattrs, see
>
> https://lore.kernel.org/linux-fsdevel/e92a4d33-f97-7c84-95ad-4fed8e84608c=
@google.com/
>
> Which Christian Brauner quickly put into his vfs.git (vfs.tmpfs branch):
> so unless something goes horribly wrong, you can expect them in v6.6.

That's great to hear, thanks!

> There's a lot that you wrote above which I have no understanding of
> whatsoever (why would user xattrs stop rmdir failing?? it's okay, don't
> try to educate me, I don't need to know, I'm just glad if they help you).
>
> Though your mention of "unprivileged" does make me shiver a little:
> Christian will understand the implications when I do not, but I wonder
> if my effort to limit the memory usage of user xattrs to "inode space"
> can be be undermined by unprivileged mounts with unlimited (or default,
> that's bad enough) nr_inodes.
>
> If so, that won't endanger the tmpfs user xattrs implementation, since
> the problem would already go beyond those: can an unprivileged mount of
> tmpfs allow its user to gobble up much more memory than is good for the
> rest of the system?

I don't actually know; I'm no expert in that area. That said, these
tmpfses are themselves attached to an unprivileged mount namespace, so
it would certainly be my assumption that in the case of an OOM
condition, the OOM killer would keep trying to kill processes in that
mount namespace until nothing else references it and all tmpfs mounts
can be reclaimed, but then again, that's only my assumption and not
necessarily reality.

That said, I got curious and decided to experiment; I booted a kernel
in a VM with 1GiB of memory and ran the following commands:

    $ unshare -Umfr bash
    # mount -t tmpfs tmp /mnt -o size=3D1g
    # dd if=3D/dev/urandom of=3D/mnt/oversize bs=3D1M count=3D1000

After about a second, the OOM killer woke up and killed bash then dd,
causing the mount namespace to be collected (and with it the tmpfs).
So far, so good.

I got suspicious that what I was seeing was that these were the only
reasonable candidates for the OOM killer, because there were no other
processes in that VM besides them & init, so I modified slightly the
experiment:

    $ dd if=3D/dev/zero of=3D/dev/null bs=3D10M count=3D10000000000 &
    $ unshare -Umfr bash
    # mount -t tmpfs tmp /mnt -o size=3D1g
    # dd if=3D/dev/urandom of=3D/mnt/oversize bs=3D1M count=3D1000

The intent being that the first dd would have a larger footprint than
the second because of the large block size, yet it shouldn't be killed
if the tmpfs usage was accounted for in processes in the mount
namespace. What happened however is that both the outer dd and the
outer shell got terminated, causing init to exit and with it the VM.

So, it's likely that there's some more work to do in that area; I'd
certainly expect the OOM killer to take the overall memory footprint
of mount namespaces into account when selecting which processes to
kill. It's also possible my experiment was flawed and not
representative of a real-life scenario, as I clearly have interacted
with misbehaving containers before, which got killed when they wrote
too much to tmpfs. But then again, my experiment also didn't take
memory cgroups into account.

--
Snaipe
