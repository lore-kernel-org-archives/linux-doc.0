Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CEB7C001DE
	for <linux-doc@archiver.kernel.org>; Tue, 15 Aug 2023 03:54:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234425AbjHODxz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Aug 2023 23:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234647AbjHODwM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Aug 2023 23:52:12 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC1571703
        for <linux-doc@vger.kernel.org>; Mon, 14 Aug 2023 20:52:08 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-58c4f6115bdso9687847b3.1
        for <linux-doc@vger.kernel.org>; Mon, 14 Aug 2023 20:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692071528; x=1692676328;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P6v5atA1MLk+jjexl38Oyge5Liq245V+Bs/9eMZT5qA=;
        b=Hqstt6gpw4qMxWppig97Rr6Qlp3T5tHXqrV5+Qy5v3hpqNIb3H8haad6Oh5Lq22ZIY
         b4PhmWj8GDeD5Z69Avs0HD+85Ab7CfHWdkMpg7iGPsqvy/3hvQOkEEq+bqVYbUXLYExI
         t/VhAsv5Q4Fs191fnx9/eSaqTiP4t5xMM5KBSpiwDXd9OVyAXdGEN1Uz7DK9tXgSOGJL
         z/IfltwnTZ5EHMXdvcI/6S5AfKrkPMtaz3MM0NnfrfGADM6h6PxO8XoEqwb5+vFFIyN8
         +CKj4mwRMp+CpCQRejAbXaPIgB99Xaw3zdykYucPdtKMA3lFc28QmC35jW+Sgi/hOC7M
         jkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692071528; x=1692676328;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P6v5atA1MLk+jjexl38Oyge5Liq245V+Bs/9eMZT5qA=;
        b=iZ+98/4QHtImXXJPBvJgDMAvJkRe2Dsq4x+WRwqqzP4C9xcNr6ONZDY1QXWvCvjIlX
         RNg5vQAEXLq+Dcoiq8C6uaaS12WjU98IGBKZkWQfoJeXOkQREsX7CNUHPIfYqAlNoD2S
         7ks3cyoeMas4Gafi0rwjnTR0zWI0LNci1EYNZuiGB3SBqsKWA+Nck3dHc05XsyFc08If
         R3cNqYeuDdQhfzk2eg01F4w1Hugdy8f8LCViutNSKChd/IprfS9HP2y1McGH/UvX5E4k
         LNoydCiUYHJXSwxOHcyfyGHgNSGJMgy/O75PwNaxbdUBT1zio72YH6fSfdoYdOOuwuYM
         wkWg==
X-Gm-Message-State: AOJu0YxOQdmk3G9n+PYq0mOpV2IeszXSUbY5Y+Yvqwvi0cCpSQadv+bZ
        S+fghEZfZOKzEo2OcApGiCYNmVi514dRTQgTBJvWyA==
X-Google-Smtp-Source: AGHT+IH0F5gScGnhM0E+60bW0tBpWCasf6XoXDM9+Kb+W9jwZ/n+VEOGms7zmDhiut4cXb6Bi2nhRQ==
X-Received: by 2002:a81:600b:0:b0:559:f18d:ee94 with SMTP id u11-20020a81600b000000b00559f18dee94mr13057498ywb.10.1692071528050;
        Mon, 14 Aug 2023 20:52:08 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id n186-20020a8172c3000000b0058605521e6esm3190149ywc.125.2023.08.14.20.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 20:52:07 -0700 (PDT)
Date:   Mon, 14 Aug 2023 20:51:59 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To:     Snaipe <snaipe@arista.com>
cc:     hughd@google.com, ovt@google.com, corbet@lwn.net,
        akpm@linux-foundation.org, brauner@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH] shmem: add support for user extended attributes
In-Reply-To: <20230814082339.2006418-1-snaipe@arista.com>
Message-ID: <986c412c-669a-43fe-d72a-9e81bca8211@google.com>
References: <9b8d38f0-fd22-3f98-d070-16baf976ecb5@google.com> <20230814082339.2006418-1-snaipe@arista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 14 Aug 2023, Snaipe wrote:

> > Your sending this patch does help to raise the priority for my
> > sending that patch: thank you; but I cannot promise when that will be.
> 
> Hey Hugh,
> 
> Just as an additional data point, if it helps with priority :)
> 
> The lack of support of user xattrs on tmpfs our last remaining blocker for
> using unprivileged overlayfs mounts that use a tmpfs for the upper dir & work
> dir. Not that it isn't possible to use unprivileged overlayfs mounts in general,
> but not having this option means that use-cases for discardable upper layer
> changes are harder to clean up correctly when not on an tmpfs mount whose
> lifetime is bound to a mount namespace.
> 
> I don't think there's any rush; we can live with rmdir failing with EIO for now,
> but it'd be great to see this fixed rather than having to implement expensive
> cleanup routines that have to remove the upper+work dirs recursively with
> CAP_DAC_OVERRIDE.

Thanks for the encouragement.  At the time that I wrote that (20 July)
I did not expect to get around to it for months.  But there happens to
have been various VFS-involving works going on in mm/shmem.c recently,
targeting v6.6: which caused me to rearrange priorities, and join the
party with tmpfs user xattrs, see

https://lore.kernel.org/linux-fsdevel/e92a4d33-f97-7c84-95ad-4fed8e84608c@google.com/

Which Christian Brauner quickly put into his vfs.git (vfs.tmpfs branch):
so unless something goes horribly wrong, you can expect them in v6.6.

There's a lot that you wrote above which I have no understanding of
whatsoever (why would user xattrs stop rmdir failing?? it's okay, don't
try to educate me, I don't need to know, I'm just glad if they help you).

Though your mention of "unprivileged" does make me shiver a little:
Christian will understand the implications when I do not, but I wonder
if my effort to limit the memory usage of user xattrs to "inode space"
can be be undermined by unprivileged mounts with unlimited (or default,
that's bad enough) nr_inodes.

If so, that won't endanger the tmpfs user xattrs implementation, since
the problem would already go beyond those: can an unprivileged mount of
tmpfs allow its user to gobble up much more memory than is good for the
rest of the system?

Hugh
