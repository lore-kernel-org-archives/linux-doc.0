Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8EA167DF87
	for <lwn-linux-doc@archive.lwn.net>; Tue, 12 Jun 2018 16:01:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934147AbeFLQAT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 12 Jun 2018 12:00:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:47856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934044AbeFLQAR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 12 Jun 2018 12:00:17 -0400
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com [209.85.128.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5084D208CD
        for <linux-doc@vger.kernel.org>; Tue, 12 Jun 2018 16:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1528819217;
        bh=SkSKIBQ5l1tGKE9gK7FfuVTXSTwDDWbmoDA6knuV4MU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lFVbSxc+5IomiweQKy6NrQQud97TRL7/sdYwd9cwwEr47KHOsFNP9JPXJ4rFJSnPT
         MbPAWWY27aVZQuL4crQRF352+xJX9VkQrrmCrENmV4IFvPhozXFY3C247Ta6Wq0PFN
         5XFEK6U4WLqk7mgambIj68AnKnVn0jS22xu0UgJ4=
Received: by mail-wr0-f176.google.com with SMTP id l41-v6so24654450wre.7
        for <linux-doc@vger.kernel.org>; Tue, 12 Jun 2018 09:00:17 -0700 (PDT)
X-Gm-Message-State: APt69E0vW8YvZUV8uKjanWFsm65f2wHs1PdhcrlAEsQc4n1AnAuNIUer
        4CIzaH81B7BLm0nmHcDUe/wgtE4BPKRFL7rcd/z9QQ==
X-Google-Smtp-Source: ADUXVKLOh3wvvKEO3n9pxcaz/w57rzt9U/K+rTv55aPv3ymKxDys04mikHUoKM0ng1gVSgMcUWKccWpGTFYrdMn+IHk=
X-Received: by 2002:adf:85ec:: with SMTP id 41-v6mr791913wru.120.1528819215598;
 Tue, 12 Jun 2018 09:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <20180607143807.3611-1-yu-cheng.yu@intel.com> <bbfde1b3-5e1b-80e3-30e8-fd1e46a2ceb1@gmail.com>
 <1528815820.8271.16.camel@2b52.sc.intel.com>
In-Reply-To: <1528815820.8271.16.camel@2b52.sc.intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Tue, 12 Jun 2018 09:00:03 -0700
X-Gmail-Original-Message-ID: <CALCETrXK6hypCb5sXwxWRKr=J6_7XtS6s5GB1WPBiqi79q8-8g@mail.gmail.com>
Message-ID: <CALCETrXK6hypCb5sXwxWRKr=J6_7XtS6s5GB1WPBiqi79q8-8g@mail.gmail.com>
Subject: Re: [PATCH 00/10] Control Flow Enforcement - Part (3)
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     bsingharora@gmail.com, LKML <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>, X86 ML <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. J. Lu" <hjl.tools@gmail.com>,
        "Shanbhogue, Vedvyas" <vedvyas.shanbhogue@intel.com>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Oleg Nesterov <oleg@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        mike.kravetz@oracle.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 12, 2018 at 8:06 AM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
>
> On Tue, 2018-06-12 at 20:56 +1000, Balbir Singh wrote:
> >
> > On 08/06/18 00:37, Yu-cheng Yu wrote:
> > > This series introduces CET - Shadow stack
> > >
> > > At the high level, shadow stack is:
> > >
> > >     Allocated from a task's address space with vm_flags VM_SHSTK;
> > >     Its PTEs must be read-only and dirty;
> > >     Fixed sized, but the default size can be changed by sys admin.
> > >
> > > For a forked child, the shadow stack is duplicated when the next
> > > shadow stack access takes place.
> > >
> > > For a pthread child, a new shadow stack is allocated.
> > >
> > > The signal handler uses the same shadow stack as the main program.
> > >
> >
> > Even with sigaltstack()?
> >
> >
> > Balbir Singh.
>
> Yes.
>

I think we're going to need some provision to add an alternate signal
stack to handle the case where the shadow stack overflows.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
