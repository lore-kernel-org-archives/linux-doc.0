Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B388C4338F
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 14:36:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23623611C9
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 14:36:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240697AbhHFOgx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 6 Aug 2021 10:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240667AbhHFOgw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Aug 2021 10:36:52 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5B86C061798
        for <linux-doc@vger.kernel.org>; Fri,  6 Aug 2021 07:36:36 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id c16so7333156plh.7
        for <linux-doc@vger.kernel.org>; Fri, 06 Aug 2021 07:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZqXrxedYpNPa+pS9MJbTiWVLg/Z/EX+UpGC/w4iURC0=;
        b=ELeGMIX6y7VBCdKUScbWJkc4XgbYUEmqZR3z+eK89xK6emOE2IW9Z2zF/rPuOCthKO
         4foOBKtCvz1m0L998tQJzo3qLyiArIiaz951+dJ9JiDzQK68G25+hURtA0vAP1bp7ITw
         qORY1ROxfocMro77lZiqa9doTclZwa4Fwxi8TK1KpCq5j5Z9Hl5WjBR79ju2OJDXwyqG
         4N4L8e64/8y3X6gEsu9qEboMmRqrAjsgO8j0eXftLBEp6RfiLx84Q+3NlwJ30H2cf2iM
         xOOw75VFMbH1or4qDNQ4PQbAAcd5BjIfmiqdyrwiUAkFpJzbIo/U//NHgys4aICVHUrl
         Qgvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZqXrxedYpNPa+pS9MJbTiWVLg/Z/EX+UpGC/w4iURC0=;
        b=eciV7ggNDzEW+b76ahqGan5qTkNFpjEbz3a0GAeoeKExMVAflkRP2MPymCY7OoN7ob
         4Z/bAjBtvOvzgA6EwM5PQPAXpQCclMKlfTp7sYnEAJm+H/3YHjkNIz/pG36DolxihDnJ
         +n2A94HvIg8w9/OggJGSfkaxAjK3QIuDCxIRlIxHmHqJcahyBtDMOHjAdiveuyVHshU3
         aRVfxoIO4TEji61MMONomIVxBUS6t0ZYz7ygUzBAg2NBjYox83T4LuxyqoNPWrsb2VT9
         pWfrHijJwECCBz+N+rs2dAFFh/DJKrrgvpmclFSdE06qVKzY8GLZ9qqKsLJZs7QUp29X
         KMrg==
X-Gm-Message-State: AOAM530+QRbaAE5K8Jxj6xePa0xFQ6y5bpEekwEbTgLevpWXNHczeFD+
        mgvUALuzrfRMO7vtovyp6vUwp4p43kQzWrqPBp+o1Q==
X-Google-Smtp-Source: ABdhPJy+Q3BkJCryeJW9Z8KmQ8OJ6tx0sIStvtty3SBCJ+QKcdhXr8FQCmcHQKcHnPkMCpw81fjMpcibTxx3h4dqnEs=
X-Received: by 2002:a05:6a00:16c6:b029:32d:e190:9dd0 with SMTP id
 l6-20020a056a0016c6b029032de1909dd0mr10799551pfc.70.1628260596449; Fri, 06
 Aug 2021 07:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <YQuZdVuaGG/Cr62y@kroah.com> <YQuaJ78y8j1UmBoz@kroah.com>
 <fdf8b6b6-58c3-8392-2fc6-1908a314e991@linux.intel.com> <YQwlHrJBw79xhTSI@kroah.com>
 <21db8884-5aa1-3971-79ef-f173a0a95bef@linux.intel.com> <YQwpa+LAYt7YZ5dh@kroah.com>
 <1e0967ee-c41e-fd5d-f553-e4d7ab88838c@linux.intel.com> <CAPcyv4h26QmPhJKjtUB-VPc4TP95rBAer78OzkgXncg77tFWVw@mail.gmail.com>
 <9b2956f5-3acf-e798-ff0f-002d2d5254db@linux.intel.com> <CAPcyv4ju0kzUuamiuE=xC_DoEArk1KxD+n+-TUw0LLTWoSj2VA@mail.gmail.com>
 <YQzF/utgrJfbZuHh@kroah.com>
In-Reply-To: <YQzF/utgrJfbZuHh@kroah.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Fri, 6 Aug 2021 07:36:25 -0700
Message-ID: <CAPcyv4jXoj9_xJ9p3rfoHgZc6xsjnvbeqHwxw8Y2h+kx4-qs+Q@mail.gmail.com>
Subject: Re: [PATCH v1] driver: base: Add driver filter support
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 5, 2021 at 10:17 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Aug 05, 2021 at 06:00:25PM -0700, Dan Williams wrote:
> > That said, per-device authorization is a little bit different than
> > per-driver trust. Driver trust is easy to reason about for a built-in
> > policy, while per-device authorization is easy for userspace to reason
> > about for "why is this device not talking to its driver?".
>
> See my other email about how the "per driver" trust is the wrong model,
> you need to stick to "per device" trust.  Especially given that you are
> giving control of your kernel drivers over to third parties, you already
> trust them to do the right thing.

Andi, if the number of TDX devices is small could they grow an SPDM
over virtio channel? Then you can measure trust from the VM to the VMM
to the attestation server.
