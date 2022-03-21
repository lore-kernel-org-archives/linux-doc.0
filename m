Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9292C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 21 Mar 2022 10:37:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243611AbiCUKi5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Mar 2022 06:38:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238264AbiCUKi5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Mar 2022 06:38:57 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF6CC13F8DE
        for <linux-doc@vger.kernel.org>; Mon, 21 Mar 2022 03:37:31 -0700 (PDT)
Received: from mail-lf1-f41.google.com ([209.85.167.41]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mk0FM-1nucvh2PDk-00kOWy for <linux-doc@vger.kernel.org>; Mon, 21 Mar 2022
 11:37:29 +0100
Received: by mail-lf1-f41.google.com with SMTP id t25so23855252lfg.7;
        Mon, 21 Mar 2022 03:37:29 -0700 (PDT)
X-Gm-Message-State: AOAM532JovTJ9LwgsMer+Sb9kiankp+qiXxr00rEgVF7rl+GWx43Dx66
        HOAnnJDdYVoLdt7ixv5PFFKtd6+vnPvJZRs1A5M=
X-Google-Smtp-Source: ABdhPJwXz+ToNHL4TpOoh+HdlcxuOPou7dXTvfzP0iFHuBYr3vtjBj/zXXognFOzrqzkSJ6ZJ2iZfEfVsapaC/m5OFY=
X-Received: by 2002:adf:d081:0:b0:1ef:9378:b7cc with SMTP id
 y1-20020adfd081000000b001ef9378b7ccmr17934085wrh.407.1647856084986; Mon, 21
 Mar 2022 02:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220319142759.1026237-1-chenhuacai@loongson.cn>
 <20220319143817.1026708-1-chenhuacai@loongson.cn> <20220319143817.1026708-6-chenhuacai@loongson.cn>
 <CAK8P3a2kroHVN3fTabuFVMz08SXytz-SC8X11BxxszsUCksJ4g@mail.gmail.com> <CAAhV-H6zE7p6Tq8rg1Fq5cK5L38z-VHjxsZ+qm8+Cp5x=u_bUQ@mail.gmail.com>
In-Reply-To: <CAAhV-H6zE7p6Tq8rg1Fq5cK5L38z-VHjxsZ+qm8+Cp5x=u_bUQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 21 Mar 2022 10:47:49 +0100
X-Gmail-Original-Message-ID: <CAK8P3a38nUyAt8gGEYregqivdP7NsXS0RuU1NX4_EAVvwGQBWA@mail.gmail.com>
Message-ID: <CAK8P3a38nUyAt8gGEYregqivdP7NsXS0RuU1NX4_EAVvwGQBWA@mail.gmail.com>
Subject: Re: [PATCH V8 13/22] LoongArch: Add system call support
To:     Huacai Chen <chenhuacai@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Yanteng Si <siyanteng@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        "H.J. Lu" <hjl.tools@gmail.com>,
        Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:haijpM3keV1rk/QAwmIvMaUZuHJsOKSMf96YvYO+mMa3CXIvMXx
 +HqrMZclpCL9cQz4v15wmW1ihA8kn6GDIHi3z/4pAkmS+Ex1Wdj6a5Hh78JEDqGVDZkBcWa
 HoAfAccRDgSKcfydRyX8RLxIQmNdewfCr9I1/MJ7+ETZwdW9SxnRHhLap4sd18ZNDJ33m0/
 bRjCh8VGBNDrmZsYKstvw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+ugELWlMmTc=:lYukMyZQJUK/hYgpSs4A6r
 nEmqgTinNBpz0u2YDQsGMddmpo/fw9i8MG9YwEAnHcM4g5hX8Ekc7tLLUdr3ZYxPhiHLzMaNE
 3JVkmMUq5q4ujbw5Qnvn1Hz75ED9FNWYaza1okeeYT3uupae2CPW0X1aZx0B/PDF+6ZyOuVIx
 ++PNZuLIm8qVBSrdTPHPL4TV96u6NKd2bXsjrDsGOYMI2QkBgWlJWP3xyiDN2c3OJHp49oVaP
 Xix8PNKYrNA0akdqsDRdi0rDAPg1mLu5Zn1TpL3UJhTlYnlJiBKMlGHC3MSDcSL4nK544aBjm
 Gc+IWAV+3L611VWOjCHPH47Ngwf4LlTalMI3GxdIk8w5TFOwUtK+IUbftX44FZRXjM4NXj6Lp
 y4qjEAaizXprUSnJPCoPpBxcV2y1oGffsvpUFxqNAfXS+FRJw/42QgWezrgpiaLBBbSoZ1wbz
 WaXWHtRhFpG5Jk1dhJgiEZvbANUi728Wdmo/O5VNSKWfLz9ejv8taz0yLJEpEGoLm9w1MW2/G
 0czQUIhmXWDIAC72L74lHw5i46oJwcszL+63BCG+ss7So6Lz++UExw4Tazn3JgJoO7mU+u4G0
 ROwI9uvMxJ1k3yATiLWAQFMpO1S5vy60LFDbUNXHbZF6WW2SbWpuLBZo2HZZhegnKsLmgNFe+
 BuyLBn4slyVvHM9BPqiTwv2+eHdDOcEPdJLhkQkRo/YQ5cIaaFGn/vEze5P2I5kLOSpytDiPH
 NSwTHxfZ17v7kkFo6/tpYHNPVpyqfnhEtnAAyut5zKO6sgwIrJIjbkMvHTtXZ6ptPblTCyUoG
 zUnAaKNfYebkLoAejkcBtfZwR4txe4Lt2MaGJIrM6TSxTa2hu6/phAkBZuPPXGPdvx/wHU8
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 21, 2022 at 10:41 AM Huacai Chen <chenhuacai@kernel.org> wrote:
> On Mon, Mar 21, 2022 at 5:01 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Sat, Mar 19, 2022 at 3:38 PM Huacai Chen <chenhuacai@kernel.org> wrote:
> > >
> > > This patch adds system call support and related uaccess.h for LoongArch.
> > >
> > > Q: Why keep __ARCH_WANT_NEW_STAT definition while there is statx:
> > > A: Until the latest glibc release (2.34), statx is only used for 32-bit
> > >    platforms, or 64-bit platforms with 32-bit timestamp. I.e., Most 64-
> > >    bit platforms still use newstat now.
> > >
> > > Q: Why keep _ARCH_WANT_SYS_CLONE definition while there is clone3:
> > > A: The latest glibc release (2.34) has some basic support for clone3 but
> > >    it isn't complete. E.g., pthread_create() and spawni() have converted
> > >    to use clone3 but fork() will still use clone. Moreover, some seccomp
> > >    related applications can still not work perfectly with clone3.
> >
> > Please leave those out of the mainline kernel support though: Any users
> > of existing glibc binaries can keep using patched kernels for the moment,
> > and then later drop those pages when the proper glibc support gets
> > merged.
> The glibc commit d8ea0d0168b190bdf138a20358293c939509367f ("Add an
> internal wrapper for clone, clone2 and clone3") modified nearly
> everything in order to move to clone3(), except arch_fork() which used
> by fork(). And I cannot find any submitted patches to solve it. So I
> don't think this is just a forget, maybe there are other fundamental
> problems?

I don't think there are fundamental issues, they probably did not consider
it necessary because so far all architectures supported clone().

Adding Christian Brauner and H.J. Lu for clarificatoin.

> > > +#define __get_user(x, ptr) \
> > > +({                                                                     \
> > > +       int __gu_err = 0;                                               \
> > > +                                                                       \
> > > +       __chk_user_ptr(ptr);                                            \
> > > +       __get_user_common((x), sizeof(*(ptr)), ptr);                    \
> > > +       __gu_err;                                                       \
> > > +})
> >
> > It would be good to also provide a
> > __kernel_kernel_nofault()/__put_kernel_nofault()
> > implementation, as the default based on __get_user()/__put_user is not
> > ideal.
> They are provided in this file below.

Ok, I see them now, not sure what I did wrong when I looked earlier.

        Arnd
