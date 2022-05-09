Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE94C433EF
	for <linux-doc@archiver.kernel.org>; Mon,  9 May 2022 16:44:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239274AbiEIQsD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 May 2022 12:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239215AbiEIQsD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 May 2022 12:48:03 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE7B8201C10
        for <linux-doc@vger.kernel.org>; Mon,  9 May 2022 09:44:08 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id d22so11737917vsf.2
        for <linux-doc@vger.kernel.org>; Mon, 09 May 2022 09:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XqWCEiFRZR6d7K91PH8ezSoYLh3BKRbhvIoPlxx9A7I=;
        b=HUq4PANpxSIB27eIQbGcBLcJ1kMRfgia2LIbn1U/sr3tsZ29aWkap3rwOThAhgUyct
         MW4AAxZzt0kalHcKw0VYco7ySwx5B0Q6L9DvBsfj/UbG57AwzHEN8a6JkyYUfNQ29VTC
         pohnxIWc1viOIWSeXqW8vA+HehX4XegFte3mA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XqWCEiFRZR6d7K91PH8ezSoYLh3BKRbhvIoPlxx9A7I=;
        b=uMUT6vpuO0dn5AYnEIHRYAo+eX5YYG+edwCNUQx+1VB76B2QqecsVkjt+SYRgWQ6MD
         lJ3rLoBcTk5uVcUKZDsM4OzLMywz0pIaG3u5ASoub9o8S0pEUAe+PAOKYp8NYzQ33gH7
         J8QCOO4aY6e5ninklTXU8U73ZG63iDRsa2CBNWk7cvznoHbjWqRZDR2X1OIbduPPQsMU
         Gs1h4fS+DYeT8l8qp8jc7Yf/4XEyRTAwJmIEXbSjOpJuDNLLm8GmLtjO1ovvgmyBT6+w
         S30QG4QPyxMd8sj3h+sO/QBNV2suJuaN8hnEuP7g3JXu7Et6j4UjFNOCE/z9uqVdVjYW
         uX4A==
X-Gm-Message-State: AOAM533xzhKUxRGVcGO/1Vxz2/UZk9MSHWiP97jOQohq1GNDsewXXMmA
        FBIyofjoXXrG2LJQU60tF6CXMH997fh3qIeE
X-Google-Smtp-Source: ABdhPJzxeBLJr/vPauWHo8kTy+q6FoeDhxztmA8qvdtIEIUCL2GUIkv+GgZiO0ppT8VXiR7lzHrRXA==
X-Received: by 2002:a05:6102:2223:b0:32d:2ae1:412 with SMTP id d3-20020a056102222300b0032d2ae10412mr8694359vsb.6.1652114647760;
        Mon, 09 May 2022 09:44:07 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id u22-20020a1fab16000000b0034e6f1fd05asm1920378vke.36.2022.05.09.09.44.07
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 09:44:07 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id i16so5685943uat.5
        for <linux-doc@vger.kernel.org>; Mon, 09 May 2022 09:44:07 -0700 (PDT)
X-Received: by 2002:a9d:6953:0:b0:606:3534:168e with SMTP id
 p19-20020a9d6953000000b006063534168emr6192989oto.237.1652114636260; Mon, 09
 May 2022 09:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220504232102.469959-1-evgreen@chromium.org> <20220506160807.GA1060@bug>
In-Reply-To: <20220506160807.GA1060@bug>
From:   Evan Green <evgreen@chromium.org>
Date:   Mon, 9 May 2022 09:43:19 -0700
X-Gmail-Original-Message-ID: <CAE=gft6m75T0UC2DBhfFhuSMW6TK7aatD_04sQ18WosgGVsATw@mail.gmail.com>
Message-ID: <CAE=gft6m75T0UC2DBhfFhuSMW6TK7aatD_04sQ18WosgGVsATw@mail.gmail.com>
Subject: Re: [PATCH 00/10] Encrypted Hibernation
To:     Pavel Machek <pavel@ucw.cz>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Matthew Garrett <mgarrett@aurora.tech>,
        Daniil Lunev <dlunev@google.com>, zohar@linux.ibm.com,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        linux-integrity@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        rjw@rjwysocki.net, Gwendal Grignou <gwendal@chromium.org>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        David Howells <dhowells@redhat.com>,
        Hao Wu <hao.wu@rubrik.com>, James Morris <jmorris@namei.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Len Brown <len.brown@intel.com>,
        Matthew Garrett <matthewgarrett@google.com>,
        Peter Huewe <peterhuewe@gmx.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, axelj <axelj@axis.com>,
        keyrings@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 6, 2022 at 9:08 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > We are exploring enabling hibernation in some new scenarios. However,
> > our security team has a few requirements, listed below:
> > 1. The hibernate image must be encrypted with protection derived from
> >    both the platform (eg TPM) and user authentication data (eg
> >    password).
> > 2. Hibernation must not be a vector by which a malicious userspace can
> >    escalate to the kernel.
>
> Can you (or your security team) explain why requirement 2. is needed?
>
> On normal systems, trusted userspace handles kernel upgrades (for example),
> so it can escalate to kernel priviledges.
>

Our systems are a little more sealed up than a normal distro, we use
Verified Boot [1]. To summarize, RO firmware with an embedded public
key verifies that the kernel+commandline was signed by Google. The
commandline includes the root hash of the rootfs as well (where the
modules live). So when an update is applied (A/B style, including the
whole rootfs), assuming the RO firmware stayed RO (which requires
physical measures to defeat), we can guarantee that the kernel,
commandline, and rootfs have not been tampered with.

Verified boot gives us confidence that on each boot, we're at least
starting from known code. This makes it more challenging for an
attacker to persist an exploit across reboot. With the kernel and
modules verified, we try to make it non-trivial for someone who does
manage to gain root execution once from escalating to kernel
execution. Hibernation would be one obvious escalation route, so we're
hoping to find a way to enable it without handing out that easy
primitive.

[1] https://www.chromium.org/chromium-os/chromiumos-design-docs/verified-boot/

> Best regards,
>                                                                         Pavel
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
