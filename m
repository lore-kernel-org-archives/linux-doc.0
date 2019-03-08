Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E0F627D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  8 Mar 2019 03:16:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbfCHDQ0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Mar 2019 22:16:26 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:44120 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbfCHDQ0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Mar 2019 22:16:26 -0500
Received: by mail-qt1-f194.google.com with SMTP id d2so19758492qti.11
        for <linux-doc@vger.kernel.org>; Thu, 07 Mar 2019 19:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=P6BnX6q8Q7uCLbDnlfvpLIMBNcO1CjPWFYfVb8zYwEY=;
        b=PJK0HI7kkgv4qbex9w+rGyKZswQTqIzMfn0Xum3GJheRgFSgj1qvx4S16xZ3GWQWmR
         W0LYYNBGM3LuZLgaLMSfnpVlQvmkwy3c0L3QIv2vEOrqJ+DWKKfZtnTNjNOks1OlkOPf
         3OcUXXNTVe4rFirGvmeQzrPP+pKiW5HYVZ5cA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P6BnX6q8Q7uCLbDnlfvpLIMBNcO1CjPWFYfVb8zYwEY=;
        b=YJRRzCTOVTFm3pGQ35lFXmm5OGgqkcSvTRS8aV5qcN1+ZmiWTUMZhItYvqUbmpAJiz
         8WzSRRXW58c8BCGeL7emc7EhTfzT1fS8tHfNVFSiBwxZn4GcTM1qHpCOoPpsFDSgEYJR
         pQ9iZPsWaog+AIHvMuh0L4a7OYnIj3a8bywt9QsS0cIDzQIwwvuKAfjlQY3sght3sBgG
         2XiXujqiKOL820sflfsDMXOP7LMW/Ll8oiqD4x1sPLUS+hD4cptrMX5R2cvjsiI6gVlX
         7ivOoFHPO49IEJSra6UX17cSi/pb5j4alEPY36/26pBp1hY+bRE2eQaiwAeByx5FWpva
         UcPw==
X-Gm-Message-State: APjAAAU0g/6+aVhZmIEUnd/d+d0OmFVZBbfTTXSx8NUpQTa6C4BIn6bf
        TrVkUI71SJYn73NpFy4g3zCLzQ==
X-Google-Smtp-Source: APXvYqz+wUatUR7/lpzM5SLVE7Ju2SR/Xol8+IU9RFA4n4IEzkLylUrmBCIscfB5XETlLpeqQCUzlA==
X-Received: by 2002:aed:22d6:: with SMTP id q22mr13056831qtc.171.1552014985215;
        Thu, 07 Mar 2019 19:16:25 -0800 (PST)
Received: from localhost ([2620:0:1004:1100:cca9:fccc:8667:9bdc])
        by smtp.gmail.com with ESMTPSA id d80sm3276700qkg.83.2019.03.07.19.16.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Mar 2019 19:16:24 -0800 (PST)
Date:   Thu, 7 Mar 2019 22:16:23 -0500
From:   Joel Fernandes <joel@joelfernandes.org>
To:     hpa@zytor.com
Cc:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Greg KH <gregkh@linuxfoundation.org>,
        Daniel Colascione <dancol@google.com>,
        Pavel Machek <pavel@ucw.cz>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>, ast@kernel.org,
        atish patra <atishp04@gmail.com>,
        Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>,
        Jan Kara <jack@suse.cz>, Jonathan Corbet <corbet@lwn.net>,
        Karim Yaghmour <karim.yaghmour@opersys.com>,
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
Message-ID: <20190308031623.GA129529@google.com>
References: <CAKOZuetOePf89cXRkvmWeGnvG7zYN=SW1yyrZibuyOqZQFTGkg@mail.gmail.com>
 <754146f0-8b57-8644-81c1-528b5ca7dba1@zytor.com>
 <CAKOZuesjYZ2EH=BHBAJAFFaTOHjWU7BELJUV3QC9cjXVB2HhUw@mail.gmail.com>
 <0c46ab5f-8bd6-6916-fc4a-b6f00d456011@metux.net>
 <CAKOZuevksKGAPif_pUYVzFpbuBCxOZ5WzT6ukLCYm4TzyLUTMw@mail.gmail.com>
 <5ebec282-57b0-6ebe-0876-ce0dd7b0c11c@metux.net>
 <20190307205505.GB30028@kroah.com>
 <5e558126-9038-1ca5-4519-7b5864ca9fa1@metux.net>
 <20190307231207.GA51897@google.com>
 <6773AB0F-C197-4465-80D2-3F7DA28EF790@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6773AB0F-C197-4465-80D2-3F7DA28EF790@zytor.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 07, 2019 at 03:40:37PM -0800, hpa@zytor.com wrote:
> On March 7, 2019 3:12:07 PM PST, Joel Fernandes <joel@joelfernandes.org> wrote:
> >Enrico,
> >
> >On Thu, Mar 07, 2019 at 11:11:22PM +0100, Enrico Weigelt, metux IT
> >consult wrote:
> >> On 07.03.19 21:55, Greg KH wrote:
> >> 
> >> > Ick, no, no more squashfs please, let's just kill that mess once
> >and for
> >> > all :)
> >> 
> >> okay, then: s/squashfs/whatever_fs_image_or_archive_you_like/;
> >> 
> >> > Again, putting this in a simple compressed tar image allows anyone
> >to do
> >> > whatever they need to with this.  If they want a full filesystem,
> >> > uncompress it and use it there.  If they just want it in-memory
> >where
> >> > they can uncompress it and then discard it, that works too.
> >> 
> >> And let me stress the point: doesn't need any kernel changes at all,
> >> when it's just a file in the same place where the .ko's live.
> >
> >Yes, but you're missing the point that some people would also opt to
> >build it
> >into the kernel during their development/debugging (Config=y). For such
> >folks, they don't want to update the FS with anything during debug runs
> >either. Your "whole same place where the .ko lives" doesn't address
> >Daniel's
> >usecase. You may say "initrd", but this is a much cleaner solution to
> >that
> >IMO. There is no initrd needed and the path to the header files will be
> >at a
> >standard location that is already pre-decided by the kernel.
> >
> >As Greg said, you are welcome to keep it disabled for yourself if you
> >don't
> >want it. This doesn't affect anyone else who doesn't use it.
> 
> You do know that initrd can be built into the kernel, right?

Yes of course, Hans. I meant the proposed solution is cleaner than the initrd
(built-in or otherwise). The proc file location is fixed and all tools can
just refer to it than worrying about where in the initrd are the headers
located.

thanks!

 - Joel

