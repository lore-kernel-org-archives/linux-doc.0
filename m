Return-Path: <SRS0=iu5e=BI=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E15AC433DF
	for <linux-doc@archiver.kernel.org>; Wed, 29 Jul 2020 20:37:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5787206D4
	for <linux-doc@archiver.kernel.org>; Wed, 29 Jul 2020 20:37:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IOAAJ9Ns"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbgG2Uhg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 29 Jul 2020 16:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726606AbgG2Uhg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Jul 2020 16:37:36 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BA9DC0619D2
        for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2020 13:37:36 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id d18so25986875ion.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2020 13:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=feuGkbN2E+CY4DYEzbMyw1G53COndnQfGzu4PNYGrlE=;
        b=IOAAJ9NsSUh5yPDkFHrM/yn3ArdUgh3ru5J4RxxujQQYlhEtwasJPcFfg1ZH9GjWCC
         akWYg59be45KQkJHM5B0zSMQR7QpIGxQVNncfQurnOShEO9Kb4ZivhYBsLqBAyUapySW
         v5lblsElXPV/9TvCxpQBLNIREiWtyULDcKxU7cshmtZKAaTwriPNj3GdOFEfFzlcQ3NR
         GEJQa3d7nGpTv+76mckr7sfY6gircJtEylXlfquXn4VRA8QeBDtqVbGnxkKxOtJxt90b
         byAThQy067Cg8IjzQw8D2as8g1XRE3oMeC4gSaFhDXo18AyV7G0RPYTN+/wG4RBLAcWm
         RXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=feuGkbN2E+CY4DYEzbMyw1G53COndnQfGzu4PNYGrlE=;
        b=Y1tGA9m4mlFI7Ja61VpZ7+wQbm++1TqiEFvKirfHhlHd63N5nheLdtjjG0x0n+JU7e
         Km0z+KbcRkyL8g9iwNumCbmQ4yW5WnSATVzoNjqxt5D9eplBLQvLqZE95yC6RtBdI63Q
         hd65P2DNC9cowmzANYC5m2MurD8yjacyfTjpuyqlhXwprGUTOKwrbu4AJLWF9BqCGBdK
         yMR7/IVjHdWbU8arPX37u34LeSM04Mb+x/BoPhsNoPeMyJ/968EV2UitqC/7xXlIa3FU
         0vWwFm3R6yIkJDVyuyfHuXXkBPn8lxIniXRGo6+R8u4XDVhiG3HGXa2EieBTi8cWcQt1
         p28A==
X-Gm-Message-State: AOAM531NLWSSt9gDAMHSHO3bild/epuoCZXxApg9+WV/z7S+raeUmqp9
        R//AZmbEzAzmXkhwIF91gDIUqzdK45jzRP71Lbpx2A==
X-Google-Smtp-Source: ABdhPJzJnBn4g3Z3/OC6fL9PkJmR/5alLnXd4E6YmWDnugeSVP+FbZ742waST/DjPHmcFtTyupDePhDtpQu8+Chiwbw=
X-Received: by 2002:a05:6638:1685:: with SMTP id f5mr17236458jat.48.1596055055453;
 Wed, 29 Jul 2020 13:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200728004446.932-1-graf@amazon.com> <87d04gm4ws.fsf@vitty.brq.redhat.com>
 <a1f30fc8-09f5-fe2f-39e2-136b881ed15a@amazon.com> <CALMp9eQ3OxhQZYiHPiebX=KyvjWQgxQEO-owjSoxgPKsOMRvjw@mail.gmail.com>
 <14035057-ea80-603b-0466-bb50767f9f7e@amazon.com> <CALMp9eSxWDPcu2=K4NHbx_ZcYjA_jmnoD7gXbUp=cnEbiU0jLA@mail.gmail.com>
 <69d8c4cd-0d36-0135-d1fc-0af7d81ce062@amazon.com>
In-Reply-To: <69d8c4cd-0d36-0135-d1fc-0af7d81ce062@amazon.com>
From:   Jim Mattson <jmattson@google.com>
Date:   Wed, 29 Jul 2020 13:37:24 -0700
Message-ID: <CALMp9eSD=_soihVJD_8QVKkgGAieeaBcRcNf2gKBzKE7gU1Tjg@mail.gmail.com>
Subject: Re: [PATCH] KVM: x86: Deflect unknown MSR accesses to user space
To:     Alexander Graf <graf@amazon.com>
Cc:     Aaron Lewis <aaronlewis@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Joerg Roedel <joro@8bytes.org>, kvm list <kvm@vger.kernel.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 29, 2020 at 1:29 PM Alexander Graf <graf@amazon.com> wrote:

> Meanwhile, I have cleaned up Karim's old patch to add allow listing to
> KVM and would post it if Aaron doesn't beat me to it :).

Ideally, this becomes a collaboration rather than a race to the
finish. I'd like to see both proposals, so that we can take the best
parts of each!
