Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC35C433EF
	for <linux-doc@archiver.kernel.org>; Wed,  6 Oct 2021 17:00:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EBFB61130
	for <linux-doc@archiver.kernel.org>; Wed,  6 Oct 2021 17:00:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231528AbhJFRCW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Oct 2021 13:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239495AbhJFRCU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Oct 2021 13:02:20 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BEB4C061753
        for <linux-doc@vger.kernel.org>; Wed,  6 Oct 2021 10:00:28 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id jo30so2346234qvb.3
        for <linux-doc@vger.kernel.org>; Wed, 06 Oct 2021 10:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4fxSi8PqelwXGAM49ee3GDsiOvmrlfsT7dixC4BvaXM=;
        b=DKI6N9arBNA5oyVG0LDMFRu1ic1bKetEFLPqkbH9XNMMZ+LVAfHnPxcnamhx0DqrS8
         nQjiwOCxkisKYxsbtnFKeeEbV2+g6TKqX8Wywj8U7UR0wr9v5m7lchTwPk8weCA5HRb6
         ocOn5uy2BrK8JXUUQFe1gzNbN4MSLankSnEAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4fxSi8PqelwXGAM49ee3GDsiOvmrlfsT7dixC4BvaXM=;
        b=qj1mf//LeY2zD8/RlEZ5eVreVEXTncR6w4eDLHA3MJ742wCTibLmE6klNp7LhDNoUo
         HZPtd7Sjrm2U0wAU69xjTJhWpMcAIEWiYKcjmmSO06NkVkAIcDgKpeWtzoOh9uLvuSqD
         iY7qu0zXQ6BdKUnqIiSaJRerzElBzODlhiMogfKrLktPVH4rbstjOVRoM1SCbiqccnFF
         WeTn6LnlonXdi91NK8s2qjTR7ahBtKAnoVrjJgADJvZjXF2L33j9u9b0NbyQLeXWTLjs
         CEACJPMQMgRL0gK1G68l82BTLcZzt98LW7T8IA2aP9rU+RCrOqg2vWXeJ4eMXXvimJQt
         5ATA==
X-Gm-Message-State: AOAM531m/BMnurYJT9fY2VonRO23y/f7JTs/VbhRo4OwTCB0feZan19C
        E7sNAi+hna5E+Qr8E0BMOEK3EkMrNi0HQQ==
X-Google-Smtp-Source: ABdhPJzPYxfIoYs7SZ8Pytg71GoZRSSALKsxoy4g2ZYi2Cf3Cs43GAGXQv4b6ifdDRPegOEgAna+Mg==
X-Received: by 2002:ad4:574c:: with SMTP id q12mr4186418qvx.47.1633539627372;
        Wed, 06 Oct 2021 10:00:27 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id v3sm11898770qkd.20.2021.10.06.10.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 10:00:26 -0700 (PDT)
Date:   Wed, 6 Oct 2021 13:00:25 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] docs: submitting-patches: make section on linking
 more explicit
Message-ID: <20211006170025.qw3glxvocczfuhar@meerkat.local>
References: <7dff33afec555fed0bf033c910ca59f9f19f22f1.1633537634.git.linux@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7dff33afec555fed0bf033c910ca59f9f19f22f1.1633537634.git.linux@leemhuis.info>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 06, 2021 at 06:37:38PM +0200, Thorsten Leemhuis wrote:
> +Add 'Link:' tags with URLs pointing to related discussions and rationale
> +behind the change whenever that makes sense. If your patch for example
> +fixes a bug, add a tag with a URL referencing the report in the mailing
> +list archives or a bug tracker; if the patch follows from a mailing list
> +discussion, point to it. When linking to mailing list archives, use the
> +https://lkml.kernel.org/r/ redirector with a ``Message-Id``, to ensure

We shouldn't be using "lkml.kernel.org" because that domain name can create
confusion that this is only valid for messages sent to "the LKML"
(linux-kernel@vger.kernel.org). The convention has been to use
https://lore.kernel.org/r/msgid for this reason. I would also reword that a
bit:

    ... or a bug tracker; if the patch was discussed on a mailing list, you
    may point to it using the lore.kernel.org message archiver service. To
    create the link URL, use the contents of the ``Message-Id`` header of the
    patch message without the surrounding angle brackets. For example::

    Link: https://lore.kernel.org/r/git-send-email.555-1234@example.org

    Please check the link to make sure that it is actually working and points
    to the relevant message.

-K
