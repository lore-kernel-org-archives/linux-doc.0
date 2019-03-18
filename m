Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3D7347D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Mar 2019 16:09:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727336AbfCRQI7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Mar 2019 12:08:59 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38829 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726812AbfCRQI7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Mar 2019 12:08:59 -0400
Received: by mail-pg1-f196.google.com with SMTP id v1so6998084pgi.5
        for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2019 09:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4jnBV7KXAwRH/SBiWunplsgAO5XC9ZDTjIPOKm8iM+g=;
        b=oxnKC1TgVy0AfRUFzdhntQ4TnaWjo/dHSXwb/USSzN9iByb1J8qb9RNkXwR6mHS+mw
         U0ldrfn6mRkKtGFn2Svuia32YqyzgHr8lgGpA8Ip0euwMX1zgcj9IEez46oWi1IBddSU
         gwBvQTSUaqVbn9YXiSr6jTBOA8Xv5UO8CN9pXByf2+OfL6o1mjVRgyqe5P+Xg2G+PiCf
         NrrQ0yX3K59cnkolhi014Qa1wO07CtueVQk+/0EtrVmsp+hp6aDS9QuNbVuDWXjtk1vJ
         lpuGAyImKDa6JNaKflwTKUzEOC9JqWe+LJv/B30MBc7OlHCI7rVxIEK1sErhlvMqw4PK
         B6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4jnBV7KXAwRH/SBiWunplsgAO5XC9ZDTjIPOKm8iM+g=;
        b=eetRyntMU08BU3US1XP9tglpgvJRpfavlyMhnQnfZvlPxYRF/g+Esy6J1zBvonW0Sx
         kaTS+xBHyelJvUV91Cln96f0mkK2JPPehCu2p32mFtN2hSWN7sxuVoD9c0vjoIRJ7Ibb
         FWobzwEnMqnAG5Ep4GO6nnIGTU5kMBgrj7Sg3Q1CQHXu0AuFdbwDvUL4+3O4JuZA9MPX
         0n+XmjymRNLG66oBOZKQXi94n/jmgFB1KQa9NJFjSGJotnkmQ++Nn3H5i4XrNlBWeovK
         v298l3sDTYqu4FeesrRZgQWzrBCeCiCjl3wlbKdBngO8j8r6Wy3/BvBUiIeACnnyYTK7
         GxuA==
X-Gm-Message-State: APjAAAXTlCIKiuccXq7oYSiJadwEZyh1nc4R7KeZXG5vkaa+JLTqZxw0
        /ox7mAMoxa5012G+a0KsDnEySJQmIIjWQqszCHYiCA==
X-Google-Smtp-Source: APXvYqz4X+86iXGnn3Nho9z6FaNxwbl9pQbIbD8Gz0QIEPwnGUaSMpR4psZ3WXMcGuMVMNFbcG/Runz5qQVKQSjPXF0=
X-Received: by 2002:a62:4299:: with SMTP id h25mr19703730pfd.165.1552925338999;
 Mon, 18 Mar 2019 09:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1552679409.git.andreyknvl@google.com> <56d3373c1c5007d776fcd5de4523f4b9da341fb6.1552679409.git.andreyknvl@google.com>
 <04c5b2de-7fde-7625-9d42-228160879ea0@gmail.com> <CAAeHK+xXLypBpF1EE73KuzQAo0E6Y=apS46wo+swo2AB6cy3YA@mail.gmail.com>
 <CAAeHK+yxcG=KBjG0A5BicBA7Zwu6LR6t=g5b-9EAPXA8_Dfm2g@mail.gmail.com> <CANn89iJfjhNcDS_eHg-OUiGui-hyRL5iWQuu_U+BW_N9iSNbeA@mail.gmail.com>
In-Reply-To: <CANn89iJfjhNcDS_eHg-OUiGui-hyRL5iWQuu_U+BW_N9iSNbeA@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 18 Mar 2019 17:08:48 +0100
Message-ID: <CAAeHK+w+koPnKP2=3yQsj5wCVY-c6+NLBnkKWQP8Q6M6pzO4dA@mail.gmail.com>
Subject: Re: [PATCH v11 08/14] net, arm64: untag user pointers in tcp_zerocopy_receive
To:     Eric Dumazet <edumazet@google.com>
Cc:     Eric Dumazet <eric.dumazet@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 18, 2019 at 3:45 PM Eric Dumazet <edumazet@google.com> wrote:
>
> On Mon, Mar 18, 2019 at 6:17 AM Andrey Konovalov <andreyknvl@google.com> wrote:
> >
>
> > Looking at the code, what's the point of this address != zc->address
> > check? Should I just remove it?
>
> No you must not remove it.
>
> The test detects if a u64 ->unsigned long  conversion might have truncated bits.
>
> Quite surprisingly some people still use 32bit kernels.
>
> The ABI is 64bit only, because we did not want to have yet another compat layer.
>
> struct tcp_zerocopy_receive {
>     __u64 address; /* in: address of mapping */
>     __u32 length; /* in/out: number of bytes to map/mapped */
>     __u32 recv_skip_hint; /* out: amount of bytes to skip */
> };

Ah, got it, thanks! I'll add a comment here then, otherwise this looks
confusing.
