Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E02F6C7EE29
	for <linux-doc@archiver.kernel.org>; Sun,  4 Jun 2023 18:25:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbjFDSZe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 4 Jun 2023 14:25:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbjFDSZe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 4 Jun 2023 14:25:34 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BA809F
        for <linux-doc@vger.kernel.org>; Sun,  4 Jun 2023 11:25:33 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-3f7a546efb1so30498161cf.2
        for <linux-doc@vger.kernel.org>; Sun, 04 Jun 2023 11:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685903132; x=1688495132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoDaxZYrMXoYYBthZoKFtcpdtCIkJoVqe+cep/VE5FA=;
        b=YX99qpjtGNflQoI5FXbShs5EF6Mo3Fd13KWF7Lf2bD6e97+6255bwZP4r5Od1gsZAn
         nB6Vmx9FmMeKLsCLPaPnRYz+IY6yd4vDm+gPNSRybBsgOJZq6DYwltKmLA6uxtRuHX+r
         bgsNdisYSj0X3Dv8moqTdNpz+cukNbHhFMvZe1Hn3i10bifypiuhGLOsKWx0PpzF8D+r
         EEc65HKmDy0ev1NXlX5AqoKxMF9nqHIqj+XginFfmDYUOrOlO3HLYAhSdnmkMfgBr/jk
         VjawW/JCyRquzJi/XhB6a8g2yPGpZk5RJOOtJtCHvF9WPQsKSmzN4twSIYa7O7wjRHPM
         DuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685903132; x=1688495132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoDaxZYrMXoYYBthZoKFtcpdtCIkJoVqe+cep/VE5FA=;
        b=PSOECUPmirhk2yIcfUE1h1ckDmhQZ1DMbLjd4/9sjRzWeJgUmeViVQ+aHqp6hpNrJs
         HSOHRTsTAUxencW6RXPq7KDqwI7T25lb9sGAzXSsAGt3YiKnsja7EHvCb0dkT0nq8T65
         /d1ew6Bt4QJT4L1z+eN7I0fgP8u0lZ4Z/TcXxyT0suoWUylGVrzMT4HmeDb6YpXXV07K
         LGPWQfmK7zCE+hUKAltsE2ZsCZKbqeKcWGK3yRwkE5ZExYDiJsH/HHKv0wjbNtsIxiCD
         TXc1LvmZy6qGddfnoWn/C8auH8PSyqUHvr9IV7vSzgose/qjcxMZtI5vmybMXXGjY23O
         zs2Q==
X-Gm-Message-State: AC+VfDyx6jNqC93LDg7c7XlcJ3377pZEoM/OoqFSvRfE+IOlRCQVvLWl
        UnJPpzvoNjiAc+ZBZ9mHfvlfmXSpKyT1L4evsXlsNoQEutM=
X-Google-Smtp-Source: ACHHUZ75hj0npR7Uh2z3sGVtGxoxc23KedhBpuzoaTVP7JzmVvaxeN9sMOGv56XXiOAqq2XhXgpOVrBmK4o+ZK40yd4=
X-Received: by 2002:ac8:5851:0:b0:3f5:3ff4:be07 with SMTP id
 h17-20020ac85851000000b003f53ff4be07mr5004691qth.64.1685903132352; Sun, 04
 Jun 2023 11:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <ZHs2BHGBrJ-YGd-v@debian.me> <20230603201525.9409-1-eatnumber1@gmail.com>
 <65b7bc64-4a4b-c056-db65-cd77bcc3d1d9@gmail.com>
In-Reply-To: <65b7bc64-4a4b-c056-db65-cd77bcc3d1d9@gmail.com>
From:   Russell Harmon <eatnumber1@gmail.com>
Date:   Sun, 4 Jun 2023 11:25:06 -0700
Message-ID: <CA+zrezTegR8jHQA3MNM6WnfFU_RP4=fiCuk6WgwJZsjZ2PYUSw@mail.gmail.com>
Subject: Re: [PATCH] Improve the dm-integrity documentation.
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jun 4, 2023 at 7:07=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com>=
 wrote:
>
> On 6/4/23 03:15, Russell Harmon wrote:
> > Thanks for taking a look. Here's the multi-patch series plus the change=
s
> > you suggested.
> >
> >
>
> This is v2, right? Next reroll, remember to version your patches
> (pass -v to git-format-patch(1)).

Will do.

> Also, I don't see description (that would be commit message
> once applied by jon) in all patches on this series. I hope you
> have a time reading Documentation/process/submitting-patches.rst
> so that trivial mistakes like this shouldn't happen again. In
> any case, when preparing patch series, always add cover letter
> by passing --cover-letter to git-format-patch(1) then edit the
> generated template (look for 0000-*-cover-letter.patch).

My "thanks for taking a look" email was the cover letter.

Interesting that the commit message didn't go through in the body,
they're each one line and were moved to the subject line. I'll try
again and add a little more description.
