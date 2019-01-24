Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5387E7D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 24 Jan 2019 14:18:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727562AbfAXOS0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 24 Jan 2019 09:18:26 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:36206 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727600AbfAXOSY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Jan 2019 09:18:24 -0500
Received: by mail-qt1-f196.google.com with SMTP id t13so6674020qtn.3
        for <linux-doc@vger.kernel.org>; Thu, 24 Jan 2019 06:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Skgo5z9eJrMNa3iKEaytgJwZNUVdVDbHbeZE63F3NTM=;
        b=yNHjIS0RUjmjSVgNCZuEmnai/AWXdZdxhVo5KnKrxFp3CLCpxQ1O/FHQSPzhDnoCz+
         4km35tLrGopa6q5oXvRlY9UWTkOCCM309D5pLu1ZCsr7UlXnSwIpkajKcWmHXZC7QbH6
         ZlcC6Xh4DNGrDG8F2yWbCFEPwCpVqkWh0/AQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Skgo5z9eJrMNa3iKEaytgJwZNUVdVDbHbeZE63F3NTM=;
        b=FDdZ+MRHRB8dqcD8PnXEMxz5Xrvp8L0MQP859+0CRf6oNQjaMKTdH4td3LVeyFRRy6
         AymVpfbrKEgvpgBYgeVw2Swml5RPwxq5Q6gN6q2UQHBLNPdtDCwm+IvApAuX7sCw7eKg
         RNrFWCcWFUn6HAjwjgH6Xtve0Nju0PeUKijjPDp2BG5ok+vcEXl19dirP2oDuXx81qgp
         iI6hwr8qKYvV5yzuwebQxY6UMPxSzGhDk1Vw6X4u1AtyLItPYRcfyyStilO9p7+eDqE2
         MxIxZeNm5MT8yQHxtPI97Dh8dBIuEylYUrBbLhccJd+DFCjr1nIRlfI8osm8O2gI0ZTF
         ybXQ==
X-Gm-Message-State: AJcUukc98Usq52A3nvr5CDIOyI60V9ykpRPhlVRCbFjW5zsXKUylrfKL
        13QsatGNQrGCDSEykVRe05b+HA==
X-Google-Smtp-Source: ALg8bN6H+RibSIYE5wCeIFQjFIrYx+ErfTeIQamXHGqjBXY088xzCNCHQGFWRafEGYms1bySHwklJQ==
X-Received: by 2002:a0c:d0a8:: with SMTP id z37mr6326530qvg.86.1548339502151;
        Thu, 24 Jan 2019 06:18:22 -0800 (PST)
Received: from localhost ([2620:0:1004:1100:cca9:fccc:8667:9bdc])
        by smtp.gmail.com with ESMTPSA id r24sm76718067qtr.2.2019.01.24.06.18.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Jan 2019 06:18:20 -0800 (PST)
Date:   Thu, 24 Jan 2019 09:18:20 -0500
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Daniel Colascione <dancol@google.com>
Cc:     Karim Yaghmour <karim.yaghmour@opersys.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>, ast@kernel.org,
        atish patra <atishp04@gmail.com>,
        Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>,
        Jan Kara <jack@suse.cz>, Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>, kernel-team@android.com,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Manoj Rao <linux@manojrajarao.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Paul McKenney <paulmck@linux.vnet.ibm.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>, rostedt@goodmis.org,
        Thomas Gleixner <tglx@linutronix.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        yhs@fb.com
Subject: Re: [RFC] Provide in-kernel headers for making it easy to extend the
 kernel
Message-ID: <20190124141820.GA75378@google.com>
References: <20190119103606.GA17400@kroah.com>
 <8BD4CB7A-944C-4EC5-A198-1D85C9EE28D6@zytor.com>
 <20190120161003.GB23827@google.com>
 <A40C22DF-B43F-44BA-8148-FC0881087315@zytor.com>
 <20190121014553.GD23827@google.com>
 <BC774ED4-C0FC-4AA6-9BAF-36930A661D9B@zytor.com>
 <20190122133901.GA189736@google.com>
 <117d2f96-b0e9-2376-69b7-836fa0c52539@opersys.com>
 <CAKOZuesWgo3CZj49aUChX_-dpijCrVLxgVZChyLLmOWXCLQf-Q@mail.gmail.com>
 <20190124023216.GA75730@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190124023216.GA75730@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 23, 2019 at 09:32:16PM -0500, Joel Fernandes wrote:
> On Wed, Jan 23, 2019 at 02:37:47PM -0800, Daniel Colascione wrote:
> > On Wed, Jan 23, 2019 at 1:29 PM Karim Yaghmour
> > <karim.yaghmour@opersys.com> wrote:
> [...]
> > > Personally I advocated a more aggressive approach with Joel in private:
> > > just put the darn headers straight into the kernel image, it's the
> > > *only* artifact we're sure will follow the Android device whatever
> > > happens to it (like built-in ftrace).
> > 
> > I was thinking along similar lines. Ordinarily, we make loadable
> > kernel modules. What we kind of want here is a non-loadable kernel
> > module --- or a non-loadable section in the kernel image proper. I'm
> > not familiar with early-stage kernel loader operation: I know it's
> > possible to crease discardable sections in the kernel image, but can
> > we create sections that are never slurped into memory in the first
> > place? If not, maybe loading and immediately discarding the header
> > section is good enough.
> 
> I am happy to see if I can shrink it down further. Especially using xz and
> stripping all comments period. I am optimistic this can be brought down
> further to a point where it would make sense to everyone to build it into the
> kernel. Lets see.
> 
> Last time I stripped comments, it went down by ~40%. What I haven't tried is
> doing this *with* xz compression. I am also open to brainstorming what else
> can be stripped.

Removing comments (/* */) with xz compression brings it down to 3.3MB.

thanks,

 - Joel

