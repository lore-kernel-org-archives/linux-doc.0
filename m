Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C94E9C433FE
	for <linux-doc@archiver.kernel.org>; Tue, 14 Dec 2021 03:13:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232689AbhLNDNS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Dec 2021 22:13:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27388 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235407AbhLNDNR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Dec 2021 22:13:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639451596;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/n9aD3d3fHxDG9Px4q5PGZku+eA71D79JAz4+k/9vSg=;
        b=I03Ni6bpMFmvufG1voFk2gB1egpLIS0bxw4zvB53lpTqFRdelSS9OJ8klARa+cnwPi7+9b
        Lm3vqRsd/KRIO90dRf2POldvs4ayhZ5QRD75EFEPvSfj4oqenxVEkB71htmWzluCbcee+x
        UbkbQGInXzFpiuUYC2ffP+yWymV4Xx0=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-zQ7G4-fHOGKYAXGGzKzo9g-1; Mon, 13 Dec 2021 22:13:16 -0500
X-MC-Unique: zQ7G4-fHOGKYAXGGzKzo9g-1
Received: by mail-ot1-f69.google.com with SMTP id m9-20020a0568301e6900b0055c8135f148so7321455otr.10
        for <linux-doc@vger.kernel.org>; Mon, 13 Dec 2021 19:13:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/n9aD3d3fHxDG9Px4q5PGZku+eA71D79JAz4+k/9vSg=;
        b=Uee/jkMLHfBVotfb5Wwt0myrtxj2mMABFg+M12EpeX1+v48H1Qher2fJUlT/2BJiaD
         wxacWyc1bZPxrIcuJu4kpUJCF1E2Yg3ytKHDqNJOKkb8L5oeJzTjJRfwEgTsy/THcTvY
         kP8fZ5QY85in5WQPZ8C8UvYfV77jmbb2/wqyhfAxSMHxbdofjJTUs7jqc5b2/DM3t7kI
         ElQbNSBiNJATKG/vjGM5ZeKn6UQg9zsqm1G/J1SwfVVeU8OpaF4XPOk8r+ZLU5+7o9Xm
         SGI4WdIpxWKgaVcCf8qExZ8/127NfOmXnFlfhsNYtirisLVmclrPYgTZyoecm7/T7uvc
         WBfA==
X-Gm-Message-State: AOAM530lbDs12TOISw9r1AeR549JfkbtBfEGmEH2juNAd1DNU9rjpaqk
        vO18RFBtG+tN2QNOrB0fCA5cLhZ0xp/AMSWSZtZxndhGkReYZaV2xiKdCgnp3TGLbOb4xnPVvr/
        cmnmaw5ZNxgqwLMxU+Qx2
X-Received: by 2002:a05:6830:195:: with SMTP id q21mr2069563ota.355.1639451594184;
        Mon, 13 Dec 2021 19:13:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2iz3hCs6r9lH/lXETVLAPnC49R3ZFNXhsPRQSXrmKaougoXLA3UjZIBo5VrH12Mh87hPjNg==
X-Received: by 2002:a05:6830:195:: with SMTP id q21mr2069533ota.355.1639451593954;
        Mon, 13 Dec 2021 19:13:13 -0800 (PST)
Received: from treble ([2600:1700:6e32:6c00::49])
        by smtp.gmail.com with ESMTPSA id 186sm2963571oig.28.2021.12.13.19.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 19:13:13 -0800 (PST)
Date:   Mon, 13 Dec 2021 19:13:10 -0800
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     David Vernet <void@manifault.com>
Cc:     pmladek@suse.com, linux-doc@vger.kernel.org,
        live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
        jikos@kernel.org, mbenes@suse.cz, joe.lawrence@redhat.com,
        corbet@lwn.net, yhs@fb.com, songliubraving@fb.com
Subject: Re: [PATCH] livepatch: Fix leak on klp_init_patch_early failure path
Message-ID: <20211214031310.p6kmbvd73kn6j7x3@treble>
References: <20211213191734.3238783-1-void@manifault.com>
 <20211213201022.dhalhtc2bpey55gh@treble>
 <YbfQHjoUO5GTvImR@dev0025.ash9.facebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YbfQHjoUO5GTvImR@dev0025.ash9.facebook.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 13, 2021 at 02:58:38PM -0800, David Vernet wrote:
> > I don't think the fix will be quite that simple.  For example, if
> > klp_init_patch_early() fails, that means try_module_get() hasn't been
> > done, so klp_free_patch_finish() will wrongly do a module_put().
> 
> Ugh, good point and thank you for catching that. Another problem with the
> current patch is that we'll call kobject_put() on the patch even if we
> never call kobject_init on the patch due to patch->objs being NULL.
> 
> Perhaps we should pull try_module_get() and the NULL check for patch->objs
> out of klp_init_patch_early()? It feels a bit more intuitive to me if
> klp_init_patch_early() were only be responsible for initializing kobjects
> for the patch and its objects / funcs anyways.
> 
> Testing it locally seems to work fine. Let me know if this sounds
> reasonable to you, and I'll send out a v2 patch with the fixes to both the
> patch description, and logic.

Sounds reasonable to me.  Thanks.

-- 
Josh

