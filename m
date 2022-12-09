Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2932C10F1E
	for <linux-doc@archiver.kernel.org>; Fri,  9 Dec 2022 17:29:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbiLIR3T (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Dec 2022 12:29:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbiLIR3J (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Dec 2022 12:29:09 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F0935FBBA
        for <linux-doc@vger.kernel.org>; Fri,  9 Dec 2022 09:29:08 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id t17so5477684pjo.3
        for <linux-doc@vger.kernel.org>; Fri, 09 Dec 2022 09:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=034e6aXc5fwWVn7G8vG+SaZPWqCX6o7xueBmeUitIAo=;
        b=rQ7AcbnKUrYvtNvh5YEHFUt4qfi3oZXzaQMILUfbeyl3Zgt1bhCdGFxPQAZNxQjk4L
         ZqFzkPYtzhkQ/wAKPM8WylMyw0iYwX/ybdFp38hvhrCG/KnTw8RwxJgfB0BjKuZTUJSf
         F6VCaNN1M/cx2BCvuH/+mbkzGat/b4CtjLK9xoGuVlbBN5yB6VhOdmDpFyhhmDt9E2Sv
         EuSmWUHno0BgAANPkcRCN69P1P0QppoWhcI42uft/jYBZn48yFPKz82OcEeNR6L4swgp
         ViR9sCr07hxo/v+/GsePIRxZXMuGmPpe04RVQRDI1AHVahI4lTKy5lrrFCAz2+J4nw3F
         NNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=034e6aXc5fwWVn7G8vG+SaZPWqCX6o7xueBmeUitIAo=;
        b=G1DXuMOOogKGOmfESalrSUcxS/6kMTM+YxckJkwlGZQiJF8swT2cB1fxkgOw5ztCBX
         nfqFJ3LoIfzvg+yTWwh357nf3+kL+67b+BjNz0cqVjm6fM2ZB0r5kYuED3KWSKw7h/UD
         g2Ngbaznr3d2rCCctPAHDjRCvTSD7Gj4SETyhVit+nSBjJ0dQYOTcK3k3HeNPEPSHTcB
         0PfETdHz3bEY1bQo0ORy6baRuK5SCYB7SphoEk21KaeUPCJ89THCyBWZQNR9I4QJU0j/
         anEqNFxWR1SpFjtAGRYD6ta/wsjp08Ji56t3Ps0cI91Sje9V5O0ot8Gy/5nYYJ52wmzW
         mHyA==
X-Gm-Message-State: ANoB5pmGLO0aZGAXvfLnathS9SQs9ICjyCjm0ItAOUeTZEJ/nVpGJzhg
        gWbu7HIKWTj/UJTxnrOicEPZ4nYAoeL8aknphHq0PnQZHlxs
X-Google-Smtp-Source: AA0mqf55vDvD0XlojvFe+sHxcQ/CjVBdp2MNl8uBQtS5gamKa8U/V0fzvoC6+i8XO/cxnQbhqCfBO1kZu3x0cdpCiwg=
X-Received: by 2002:a17:90a:2f22:b0:219:8ee5:8dc0 with SMTP id
 s31-20020a17090a2f2200b002198ee58dc0mr31085363pjd.72.1670606947501; Fri, 09
 Dec 2022 09:29:07 -0800 (PST)
MIME-Version: 1.0
References: <20221209082936.892416-1-roberto.sassu@huaweicloud.com>
In-Reply-To: <20221209082936.892416-1-roberto.sassu@huaweicloud.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Fri, 9 Dec 2022 12:28:56 -0500
Message-ID: <CAHC9VhSKeTqR+m5g2Nacp9ZJbvD3=OADGMEfDRX4rsH8HmGO9g@mail.gmail.com>
Subject: Re: [PATCH 1/2] lsm: Fix description of fs_context_parse_param
To:     Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc:     corbet@lwn.net, casey@schaufler-ca.com, omosnace@redhat.com,
        john.johansen@canonical.com, kpsingh@kernel.org,
        bpf@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Roberto Sassu <roberto.sassu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Dec 9, 2022 at 3:30 AM Roberto Sassu
<roberto.sassu@huaweicloud.com> wrote:
>
> From: Roberto Sassu <roberto.sassu@huawei.com>
>
> The fs_context_parse_param hook already has a description, which seems the
> right one according to the code.
>
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> ---
>  include/linux/lsm_hooks.h | 3 ---
>  1 file changed, 3 deletions(-)

I just merged this into lsm/next with a 'Fixes' tag pointing at the
previous comment block commit, thanks Roberto.

-- 
paul-moore.com
