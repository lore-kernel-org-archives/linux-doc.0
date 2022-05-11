Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B5C2C4332F
	for <linux-doc@archiver.kernel.org>; Wed, 11 May 2022 19:12:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345016AbiEKTMm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 May 2022 15:12:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346660AbiEKTMl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 May 2022 15:12:41 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8EE777F3A
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 12:12:38 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id ba17so3699526edb.5
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 12:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m0rLYZTGM9tABUfYW7kAK/fqq3Ax7YNevFHH/XCjFGs=;
        b=eCbRkCpG+1uv8o7qRy4S8ofMtbzrfrNObimViXJYOfvi54JNTAr6JFhhlnpgtpAcS+
         VN1OH3CnIDFz9Ap8QJJbmVusIA88+j05i4dmbpolhuHRtJjOf6pV7NrV6W8AIKtloJuO
         Epo1XPPLAfd3d4t/rIpKYoMleVpcQa62xi+gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m0rLYZTGM9tABUfYW7kAK/fqq3Ax7YNevFHH/XCjFGs=;
        b=n0VJvTLdPgyFA9+C2GokFHPnZGag/G6QhYRgsr5jFXMOI0T/1azmq59F+J1/IUABLJ
         I2KVniLaWp/3mZmbrq74tlwjs1c87sWo00EkBVJqcuVCpwYv4pRaVAhsZterBEBAVZ4f
         dlFDHN0N4a7hAs4HmIsJUDrEIhZd9fP6eIp0+hge2pyIXHseQHgnvLnr+FfPQVWrfKHH
         MJiCPPFEi8m2h+ph3cb7qQ4i+ASsAz8n+FhQ9xkYMIDiOwH/eKBYi/RVEeFrZ8kldv/A
         EmnX29C92ddZEUi5ONXIvYUEhXVShlrF86yHPLhiJBdTDJD5Ts3UmiPXgGE2C4VnO7zQ
         9TPA==
X-Gm-Message-State: AOAM532ONEJOOTvf9WSzRaGB1GZrn6RJ7E58tKYDCg7yd0FfKHxkcriE
        v2MRblYR8vGF/PWT2IhfGDsRCdhectKY8Sli8+Q=
X-Google-Smtp-Source: ABdhPJyfI8nUWVu7ov1tK2RpaaGwQctGtPN7N/w86jQ/qtYQIB9FNkuM05oi0UWPC9VzBkxML2EAlQ==
X-Received: by 2002:aa7:d407:0:b0:425:f57e:7ae5 with SMTP id z7-20020aa7d407000000b00425f57e7ae5mr30331025edq.393.1652296357178;
        Wed, 11 May 2022 12:12:37 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id g14-20020a056402424e00b0042617ba63a2sm1625412edb.44.2022.05.11.12.12.34
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 12:12:35 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id a5so487426wrp.7
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 12:12:34 -0700 (PDT)
X-Received: by 2002:a5d:6dad:0:b0:20c:4dc1:e247 with SMTP id
 u13-20020a5d6dad000000b0020c4dc1e247mr24044515wrs.274.1652296354621; Wed, 11
 May 2022 12:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com> <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
 <CAHk-=wg8YgH1h3wrm9CtXff7rSewa+NE0Z5upb1GOE8XiTL9HA@mail.gmail.com>
 <CAF6AEGusO9XAqHNatJLgV+wpVoyyLg1vHtUsnSkAxJeV7n3WNg@mail.gmail.com> <CAHk-=wjbE0f2AGroB1Hy=fx2fh7cRpS0wNdB46Ybk14Mb0b5Jw@mail.gmail.com>
In-Reply-To: <CAHk-=wjbE0f2AGroB1Hy=fx2fh7cRpS0wNdB46Ybk14Mb0b5Jw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 11 May 2022 12:12:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjy4DY_ya8TBs9W2wLWHibBiHMQW2T43DQR1SGRkqD=gw@mail.gmail.com>
Message-ID: <CAHk-=wjy4DY_ya8TBs9W2wLWHibBiHMQW2T43DQR1SGRkqD=gw@mail.gmail.com>
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

On Wed, May 11, 2022 at 12:08 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The kernel tree might have just the expected *failures* listed, if
> there are any. Presumably the ci tree has to have the expected results
> anyway, so what's the advantage of listing non-failures?

.. put another way: I think a list of "we are aware that these
currently fail" is quite reasonable for a development tree, maybe even
with a comment in the commit that created them about why they
currently fail.

That also ends up being very nice if you fix a problem, and the fix
commit might then remove the failure for the list, and that all makes
perfect sense.

But having just the raw output of "these are the expected CI results"
that is being done and specified by some other tree entirely - that
seems pointless and just noise to me. There's no actual reason to have
that kind of noise - and update that kind of noise - that I really
see.

                Linus
