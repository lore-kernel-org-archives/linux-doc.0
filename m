Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFD6C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 11 May 2022 19:08:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346629AbiEKTI1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 May 2022 15:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345203AbiEKTIZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 May 2022 15:08:25 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39A7A6BFD6
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 12:08:24 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id dk23so5915281ejb.8
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 12:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vmamqcS6UVefjf9ZEAc++snoGPnFlkAJ7A2gr6Hybu0=;
        b=dBuK2lymrrDPdlannsOQHXnUcfuHTrBkOPfEbu7qkW0E5kYO5Z+bFsewwOP9kO18lS
         Ebs/5hwuDtsE7odsW2FMFSxqELyAfsWmglvZotYHMj+VC+iTD8HgUjirJo2F71hfTMdW
         r33xYQIIdwMLG8WV5P6snakQvBwy2w3VlziQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vmamqcS6UVefjf9ZEAc++snoGPnFlkAJ7A2gr6Hybu0=;
        b=ylEZfxiOkGamdupFl5QDUwcyaMT5QPCqjT8qFdgu08gfYzh/pigjbW5XFw6rbQqS1x
         PyIsPWDCpLRFts/OvjKZGvuWXYJUAs/b1rRH37ATbcLEtjtwPPxMUtB0JxfXPOkkQHXo
         6haBiDQbL9zT9pwDI/KQrcCBYt0RNBmLyPNXpBK572VKLb8Xh2wi0/SuOIpVKmV1UdsC
         PuPUEHkjJsIlyuDQMe8R9JRv7PagD57q3Xxe6X9oJLzU66X9d6aj2XrnGlySnPsNNGcI
         1b7+6EfLzzv3LNRymnfwYZgWrM8FHJViprWV0BlrmEyXxD9ovqySg0+V2tMptLhd6vTD
         gBfA==
X-Gm-Message-State: AOAM530oLDU5mdU1XNajbK9PRpZihBGMbZH6pjf7vYTbPpXudTG3SLI/
        eVF9e5R7UOfPQnTyJUoBKSCcUNiG6OMxqZ5Dkes=
X-Google-Smtp-Source: ABdhPJwhhbu55jHHIjgAFGCXCJHKyoNWPdNmmr7fVlzEISKCpoAWlXYPKBTYstMNNpXxVOjG0kjyGg==
X-Received: by 2002:a17:907:3f9b:b0:6f4:4407:a421 with SMTP id hr27-20020a1709073f9b00b006f44407a421mr25931876ejc.557.1652296103556;
        Wed, 11 May 2022 12:08:23 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id s16-20020a1709060c1000b006f3ef214dd2sm1271139ejf.56.2022.05.11.12.08.19
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 12:08:21 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id bg25so1758531wmb.4
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 12:08:19 -0700 (PDT)
X-Received: by 2002:a05:600c:4f06:b0:394:836b:1552 with SMTP id
 l6-20020a05600c4f0600b00394836b1552mr6316930wmq.145.1652296099201; Wed, 11
 May 2022 12:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com> <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
 <CAHk-=wg8YgH1h3wrm9CtXff7rSewa+NE0Z5upb1GOE8XiTL9HA@mail.gmail.com> <CAF6AEGusO9XAqHNatJLgV+wpVoyyLg1vHtUsnSkAxJeV7n3WNg@mail.gmail.com>
In-Reply-To: <CAF6AEGusO9XAqHNatJLgV+wpVoyyLg1vHtUsnSkAxJeV7n3WNg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 11 May 2022 12:08:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjbE0f2AGroB1Hy=fx2fh7cRpS0wNdB46Ybk14Mb0b5Jw@mail.gmail.com>
Message-ID: <CAHk-=wjbE0f2AGroB1Hy=fx2fh7cRpS0wNdB46Ybk14Mb0b5Jw@mail.gmail.com>
Subject: Re: Adding CI results to the kernel tree was Re: [RFC v2] drm/msm:
 Add initial ci/ subdirectory
To:     Rob Clark <robdclark@gmail.com>
Cc:     Dave Airlie <airlied@gmail.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 11, 2022 at 11:40 AM Rob Clark <robdclark@gmail.com> wrote:
>
> It is missing in this revision of the RFC, but the intention is to
> have the gitlab-ci.yml point to a specific commit SHA in the
> gfx-ci/drm-ci[1] tree, to solve the problem of keeping the results in
> sync with the expectations.  Ie. a kernel commit would control moving
> to a new version of i-g-t (and eventually deqp and/or piglit), and at
> the same time make any necessary updates in the expectations files.

Wouldn't it then be better to just have the expectation files in the
ci tree too?

The kernel tree might have just the expected *failures* listed, if
there are any. Presumably the ci tree has to have the expected results
anyway, so what's the advantage of listing non-failures?

                  Linus
