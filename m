Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 46C347DF86
	for <lwn-linux-doc@archive.lwn.net>; Fri, 29 Jun 2018 15:19:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S936100AbeF2PTk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 29 Jun 2018 11:19:40 -0400
Received: from mail-it0-f68.google.com ([209.85.214.68]:38390 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932460AbeF2PTi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Jun 2018 11:19:38 -0400
Received: by mail-it0-f68.google.com with SMTP id v83-v6so3364469itc.3
        for <linux-doc@vger.kernel.org>; Fri, 29 Jun 2018 08:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=n5dU8dDYoBFRM7eczdVWVhaAjjfQ7BkUWnwJMOWIdY0=;
        b=W7AXN49cIGz2/GF6ihIIvi948MQqazCya4QC/ybKmn+0O3Ny3DDkjnNhBTnB5L58nD
         YaHmZwPQOBJIbtIAPEWyjv/Kt50IlY16BzyRHZ0Yfoj0lsOClsKo26t+JNG6/L0KdM0n
         GRNI35aBE4l8t+cLAw4Rz81RqQNdW5tM42c0iLNI5b3ucQtdIHi6rnOrtHLzlDAHSZ98
         PKL7aAJG090cb855mwQVJpM5XDSQDn2HQyMjJhMt9ghZYUa10c7szRGLmRWH/dLa/9kR
         ONP6zTd0W3DBT9llfaWKOeQwaVtlwjaJPNTGJRHwfp/wym0xNSral9vbaxxutL1qyotV
         1O2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=n5dU8dDYoBFRM7eczdVWVhaAjjfQ7BkUWnwJMOWIdY0=;
        b=czdIEz1aVZYksSdJf9rixhyl4yq4LkMDXC1uufF4PXbOfXgUgWAJHdlonJsf4+Y8JQ
         dfvoenaNUj6aGtlaW1X6AMEgnuH8gAwty+eusrU2/u0IP8N03g2dRsEWP0eelw0YDlVA
         XvnaW3A9/t0SXvmM3QWm0fgGwnVZMSgUTXJ13U99u/xAP/Mfz3bWtKD8YQpqo5l6wrtB
         +ECCxVy1vJ5RJsireZs4OXQ0NqHm7tRsjfx+tnzhgFjG/IZ1dYOFdFYIp0fo0ToiTOTV
         bXNeFmHgZbpHObo1nuC/E59NNxQxnCSnz296t9NIIg5u+OtZMotZn3BUFSb1BNQJ5rVX
         wWLQ==
X-Gm-Message-State: APt69E29n0tU+jrVA1Fb4takwjO4ZE0eDsFVkAP0OrN353MYACbc1d3T
        bp2X9Fo4eP/4BmEJNYfMLBCtJAN6wkOcEo8rLkP87w==
X-Google-Smtp-Source: AAOMgpcdLH4OkrM5BW/xE7lLKZ5cvRj4Ejz5tjup+GON3yOzpPi/Hb78iYPpbLZHcPHVKxqKTLiTtuMBJefJjLmMGVg=
X-Received: by 2002:a24:ca43:: with SMTP id k64-v6mr2303524itg.44.1530285577284;
 Fri, 29 Jun 2018 08:19:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:9082:0:0:0:0:0 with HTTP; Fri, 29 Jun 2018 08:19:36
 -0700 (PDT)
In-Reply-To: <CAAeHK+wJbbCZd+-X=9oeJgsqQJiq8h+Aagz3SQMPaAzCD+pvFw@mail.gmail.com>
References: <cover.1529507994.git.andreyknvl@google.com> <CAAeHK+zqtyGzd_CZ7qKZKU-uZjZ1Pkmod5h8zzbN0xCV26nSfg@mail.gmail.com>
 <20180626172900.ufclp2pfrhwkxjco@armageddon.cambridge.arm.com>
 <CAAeHK+yqWKTdTG+ymZ2-5XKiDANV+fmUjnQkRy-5tpgphuLJRA@mail.gmail.com> <CAAeHK+wJbbCZd+-X=9oeJgsqQJiq8h+Aagz3SQMPaAzCD+pvFw@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 29 Jun 2018 17:19:36 +0200
Message-ID: <CAAeHK+x4jaN9w8O+hYJ0835Ln=rQ8VT1=ZrKLNsBOT92+iOwdQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] arm64: untag user pointers passed to the kernel
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Kees Cook <keescook@chromium.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-doc@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Kostya Serebryany <kcc@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Evgeniy Stepanov <eugenis@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

a bunch of compat
a bunch of ioctl that use ptr to stored ints

ipc/shm.c:1355
ipc/shm.c:1566

mm/process_vm_access.c:178:20
mm/process_vm_access.c:180:19
substraction => harmless

mm/process_vm_access.c:221:4
?

mm/memory.c:4679:14
should be __user pointer

fs/fuse/file.c:1256:9
?

kernel/kthread.c:73:9
?

mm/migrate.c:1586:10
mm/migrate.c:1660:24

lib/iov_iter.c
???

kernel/futex.c:502
uses user addr as key

kernel/futex.c:730
gup, fixed

lib/strncpy_from_user.c:110:13
fixed?

lib/strnlen_user.c:112
fixed?

fs/readdir.c:369
???



On Thu, Jun 28, 2018 at 9:30 PM, Andrey Konovalov <andreyknvl@google.com> wrote:
> On Wed, Jun 27, 2018 at 5:05 PM, Andrey Konovalov <andreyknvl@google.com> wrote:
>> On Tue, Jun 26, 2018 at 7:29 PM, Catalin Marinas
>> <catalin.marinas@arm.com> wrote:
>>> While I support this work, as a maintainer I'd like to understand
>>> whether we'd be in a continuous chase of ABI breaks with every kernel
>>> release or we have a better way to identify potential issues. Is there
>>> any way to statically analyse conversions from __user ptr to long for
>>> example? Or, could we get the compiler to do this for us?
>>
>>
>> OK, got it, I'll try to figure out a way to find these conversions.
>
> I've prototyped a checker on top of clang static analyzer (initially
> looked at sparse, but couldn't find any documentation or examples).
> The results are here [1], search for "warning: user pointer cast".
> Sharing in case anybody wants to take a look, will look at them myself
> tomorrow.
>
> [1] https://gist.github.com/xairy/433edd5c86456a64026247cb2fef2115
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
