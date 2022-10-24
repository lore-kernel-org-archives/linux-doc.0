Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65409FA3742
	for <linux-doc@archiver.kernel.org>; Mon, 24 Oct 2022 14:30:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235392AbiJXOaf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 Oct 2022 10:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237311AbiJXO3n (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Oct 2022 10:29:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35495D7E03
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 06:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666616521;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=trlf8J9SEf2L59s+RkYAnLixFP1fn9n6wg9XCVdSXj8=;
        b=hSpHhZDbjUPIAwLxXQbIxhJvzgKd2O+PXDVGQPxkcpK117TcvQ4Wc/Kes0cauqfgoPCHKY
        lFvr2uvInvwJpxduW3ESswGCb2BcCNMMYS+hrZX/eBt0OJ5hsAVYdGBZtTv7/phfhRROLg
        FZ6EWhMMvsuCRSit0/U+TlNr6R6gYwo=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-668-448OUmCpMVKQDYpgvjBn_g-1; Mon, 24 Oct 2022 08:58:05 -0400
X-MC-Unique: 448OUmCpMVKQDYpgvjBn_g-1
Received: by mail-pj1-f69.google.com with SMTP id om10-20020a17090b3a8a00b002108b078ab1so8762989pjb.9
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 05:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trlf8J9SEf2L59s+RkYAnLixFP1fn9n6wg9XCVdSXj8=;
        b=nxah1boBeDpn4QP8l7swaA87XZMGlZmJl0DNyn/7UIg1hzcxlTmrf5opU8tN2ok/jI
         Dpz3xFUr0lwuK/MYHIFpbmbASrU3NC5PPlrlEb/7V7/TNfTjnRPwlFyMZLpaXL6MF0m6
         D/Sv/5U/dVNreQ50syM58e1YeRYw2nea8RtdDmHuUR6pMspseRMR+6IVB6gOyHk9IaFP
         i/I70rHwUkqJPzzg6JV5TQduOSzq/9pV4s55JoUfF81T8aADtzzvLpUSoo4f1VVZ2Yie
         QXButmeSpmr/lp0ijem3UQDW92iS6Mw98MGsfeV9QL3wUdWKsORHl0OHKnCyBn6NQI5S
         pv5g==
X-Gm-Message-State: ACrzQf26zpacOE8NCc8z131a2j5jnVE2rX+W3qmQpm4k/dK3FDOjzG1r
        L52RDBdswW5ZcnrhEvAQ27XyNCLMhevI/R2omaexsc+lNIh86u8eZj9A5EFDDoE7nwa9gT9egEK
        Z7hYxlIcPotmARZqnQ8iDMSaiYmE7oJwei1Lp
X-Received: by 2002:aa7:8895:0:b0:565:e8b7:8494 with SMTP id z21-20020aa78895000000b00565e8b78494mr33933481pfe.82.1666616284941;
        Mon, 24 Oct 2022 05:58:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6ATKwMjs8fR874pMc+dAGC/SR7UmEe44jSAvTRPQT9j1GVtVWmlm5v8nZMryXEA7LvlnBtw+wBsTve+EXGjdg=
X-Received: by 2002:aa7:8895:0:b0:565:e8b7:8494 with SMTP id
 z21-20020aa78895000000b00565e8b78494mr33933461pfe.82.1666616284691; Mon, 24
 Oct 2022 05:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221020045828.2354731-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20221020045828.2354731-3-sathyanarayanan.kuppuswamy@linux.intel.com>
 <Y1De4IyAB6n2qs4V@kroah.com> <34ef18d6-69f8-853a-d1ba-7023822e17ff@linux.intel.com>
 <Y1Iimg0WItgIGq6/@kroah.com> <c09184e3-ac15-b230-6dea-d6718f6f0ab0@linux.intel.com>
In-Reply-To: <c09184e3-ac15-b230-6dea-d6718f6f0ab0@linux.intel.com>
From:   Wander Lairson Costa <wander@redhat.com>
Date:   Mon, 24 Oct 2022 09:57:53 -0300
Message-ID: <CAAq0SU=w-upGGstmQgTh63zGqLZnEy1OpF+9FwAjSWMuyYyXTg@mail.gmail.com>
Subject: Re: [PATCH v15 2/3] virt: Add TDX guest driver
To:     Sathyanarayanan Kuppuswamy 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc:     Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Shuah Khan <shuah@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Kai Huang <kai.huang@intel.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>,
        marcelo.cerri@canonical.com, tim.gardner@canonical.com,
        khalid.elmously@canonical.com, philip.cox@canonical.com,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Oct 23, 2022 at 1:13 PM Sathyanarayanan Kuppuswamy
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>
>
>
> On 10/20/22 9:39 PM, Greg Kroah-Hartman wrote:
> >>> You are allowing userspace to spam the kernel logs, please do not do
> >>> that.
> >> Added it to help userspace understand the reason for the failure (only for
> >> the cases like request param issues and TDCALL failure). Boris recommended
> >> adding it in the previous review.
> > Again, you just created a vector for userspace to spam the kernel log.
> > No kernel driver should ever do that.
> >
>
> Brois, any comments? Do you also agree?
>

Maybe dev_err_once() does the job?

