Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C0CC10F1E
	for <linux-doc@archiver.kernel.org>; Mon, 12 Dec 2022 20:20:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233461AbiLLUUF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Dec 2022 15:20:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233468AbiLLUUE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Dec 2022 15:20:04 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0E65BE3B
        for <linux-doc@vger.kernel.org>; Mon, 12 Dec 2022 12:20:02 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id e126so2861268pgc.6
        for <linux-doc@vger.kernel.org>; Mon, 12 Dec 2022 12:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rWGQ0ewoSOgdHyHpQZxxplSgMhk3BA5Qgh487mnlNvg=;
        b=3UQZGZq0WnojaJgHwxez521zVZCLZ5ZLKORv5N/bw8mjjxIpkALxswmLOlA82ZbbeF
         RQ22O1+zzXjggc08nX0sYen9Rip9BrQVLIw0cbvjPiknPS/djiqNLUELc64QotvXs5W7
         u8JuLbNneJTOU+FOHf4uBcNJfGF5Eb83QGdXK0fcvLDFnbUZegMLGo/WYInP0SIRjuH3
         iqDMFV3GqkIqxFqyHGYoGCxVfIC021XclKmFvwN4JhQKfzOaVOVtjUFBmUYtRE97LbXJ
         Q5FuKkNtRLtuUb0T55jd+XHDNaB7m+KqMk1lIr5XLOLlb9qsFA24Y7SC6UDovcm8VJxc
         /Lcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWGQ0ewoSOgdHyHpQZxxplSgMhk3BA5Qgh487mnlNvg=;
        b=PcZIFsQ6dH9zCcMT78vbHd3WGf+Dt/vbfr815xYdZ8u+PE1Ri9thW7V1KBsqSMzAqe
         Nmbg/jooXGb/qVVLkKxlvwBXRFSHk4OQiHg8G7rBJtRkHXZ7ltnaC9xcdox01M+eri1m
         yCwKXK2P4o58+JfiNtA7dezJfGLgCsdMIm88+10Iekw651wZhwD0UFa9QGNUvaJN9no6
         q4GrNtZiWTjKSNVnrIw5+e6lilio4rDxwpB124i9RApVeto/6C6tMDqJSRxXYwdLx+W1
         RJLOAp3iuH/ZbB6hwfyXj4SOfRNshLl78zc/76cfi/YXd1cUphrSOg/SXlNOdWRgtKAW
         EByQ==
X-Gm-Message-State: ANoB5pkAjwyJEoC+wnt1/VkJZry3Wn4aIvemBT1ookSdtmITp/mbRCUu
        X/L2j8kPq0F6DzS508oyOc4rqgSJOz9reolGYqLc
X-Google-Smtp-Source: AA0mqf488YlMEQSBbTYcDXP/fTBDwzZdjxp01Lxhjnf8ORmg16WBirt5KHghuxiWWkew+f2xB0LOJACqx8K+pb/5FYc=
X-Received: by 2002:a63:64c5:0:b0:479:2109:506 with SMTP id
 y188-20020a6364c5000000b0047921090506mr633770pgb.92.1670876402114; Mon, 12
 Dec 2022 12:20:02 -0800 (PST)
MIME-Version: 1.0
References: <20221209082936.892416-1-roberto.sassu@huaweicloud.com>
 <CAHC9VhSKeTqR+m5g2Nacp9ZJbvD3=OADGMEfDRX4rsH8HmGO9g@mail.gmail.com> <8b202f4e2e234e6786b1c078129e2c3e6853c404.camel@huaweicloud.com>
In-Reply-To: <8b202f4e2e234e6786b1c078129e2c3e6853c404.camel@huaweicloud.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Mon, 12 Dec 2022 15:19:50 -0500
Message-ID: <CAHC9VhTvzFdVGCFjFkyCjdXgqZrfvDCVJ3TJ8-0xq8RfFU1Rjw@mail.gmail.com>
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

On Mon, Dec 12, 2022 at 3:34 AM Roberto Sassu
<roberto.sassu@huaweicloud.com> wrote:
> On Fri, 2022-12-09 at 12:28 -0500, Paul Moore wrote:
> > On Fri, Dec 9, 2022 at 3:30 AM Roberto Sassu
> > <roberto.sassu@huaweicloud.com> wrote:
> > > From: Roberto Sassu <roberto.sassu@huawei.com>
> > >
> > > The fs_context_parse_param hook already has a description, which seems the
> > > right one according to the code.
> > >
> > > Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> > > ---
> > >  include/linux/lsm_hooks.h | 3 ---
> > >  1 file changed, 3 deletions(-)
> >
> > I just merged this into lsm/next with a 'Fixes' tag pointing at the
> > previous comment block commit, thanks Roberto.
>
> Thanks Paul. Didn't include it, as I thought it is part of the stable
> kernel process. I guess it is always fine to include it, and to not CC
> the stable kernel mailing list, when the patch does not meet the
> criteria.

To be clear, the 'Fixes' tag here was for the previous comment fix
patch which only exists in the lsm/next branch and not any released
kernel, adding a stable/CC to this patch wouldn't have done anything
except throw up a number of automatically generated merge conflicts as
the stable folks tried to merge just this patch.  The 'Fixes' tag is
simply a bit of administrative housekeeping to connect this patch back
to the original, problematic patch; it will largely go unnoticed
unless someone decides to cherry pick patches.

When in doubt it's okay to add a Fixes tag, but leave off the
stable/CC.  In fact I prefer if people leave off the stable/CC as I've
found it to often be misused IMO; I'd rather add it when merging the
patch into one of the stable branches.

-- 
paul-moore.com
