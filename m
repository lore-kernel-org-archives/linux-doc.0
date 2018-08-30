Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIMWL_WL_MED,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 03F297D584
	for <lwn-linux-doc@archive.lwn.net>; Thu, 30 Aug 2018 11:48:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728421AbeH3PuC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 30 Aug 2018 11:50:02 -0400
Received: from mail-it0-f65.google.com ([209.85.214.65]:53262 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728004AbeH3PuB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Aug 2018 11:50:01 -0400
Received: by mail-it0-f65.google.com with SMTP id p79-v6so2186735itp.3
        for <linux-doc@vger.kernel.org>; Thu, 30 Aug 2018 04:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=E/yy+1Y+flgnyyLy3ZISq6eXjOepMPD+ZhZMDllZ/Sg=;
        b=IGMxAMkzDZc7wE3meawP5g8+2N0zKdm/Hdd0FNS+IVWYPRyE4N7QGNOnnD7l5kTt6d
         i4ciPgLBXS62L68DUg4K0L3xzHoErViwcZWzNeFmoaMyiBouPvUSCMoaaR2nR9hihx/T
         501ded91Fgo6lAoVHm1QSVf4j5uYPiPLYvJn71byzMVDubeNpS1ImnQA3F757rRzd8BM
         EUJuK1JLxj1xNDIAXyuxpqU4+J5KOInE4vgYuGg/7jdZGXLx6Gy7ivMOS1+t5WbWTzCe
         FAEloGqHGmZjT5l8L3kpyDKQ1lLaVFbiNtW3jOZJqSjIorW8g17ZCaZ+Wc9k9vfSgKKP
         ikFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=E/yy+1Y+flgnyyLy3ZISq6eXjOepMPD+ZhZMDllZ/Sg=;
        b=ItCIl87tlPMYVIwSVrYyZWVYaT2U97S81LYC89hwP1KzCJ5B3BjYIHRj2m6/oREoqh
         FKIDCS3T1wjuJF2HTHkijdOlRNzZ40cFcl4bfbqN8JCnkR9BZvBMZLtuZgyTve+Bt0Vs
         YpCUqE2+Kg/HhYSrPWhuDwGiiFNmto4gGjKLdzhywpB9fIJYtzvEyMDNTbnT+FuLyjR9
         ADthy4WspPMRCfwL4NPcwmmJ3x08QrnTGK+SLrgWCgBgE91iyHcMhG2QyaA4RqJ+AlRZ
         JxMkfedZzV+X63RzLYVAe9ZU9ZgrdEJi8DkIG6EmocCP3V+W6iLZhR+FVO552AdM1byg
         kcjA==
X-Gm-Message-State: APzg51B7SJ//rHxj/2OeAzHOSHvuKDeOeW8ojEmf8fjf9gzdEZjVxTRx
        df/ri3g4esRgNeWG2jVJEQmVpNwh2LqfE1rG370PkA==
X-Google-Smtp-Source: ANB0VdanjDNQjw7NCY2pO/zlh6YsQAd3D+5Y/Qr0ciQG3HUQF2W4oGaPmdpwMOCmolGNxFCUrd3VbxIlDAUhM/uEL6k=
X-Received: by 2002:a02:9962:: with SMTP id d31-v6mr8940993jak.1.1535629696009;
 Thu, 30 Aug 2018 04:48:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:882:0:0:0:0:0 with HTTP; Thu, 30 Aug 2018 04:48:15 -0700 (PDT)
In-Reply-To: <cover.1535629099.git.andreyknvl@google.com>
References: <cover.1535629099.git.andreyknvl@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 30 Aug 2018 13:48:15 +0200
Message-ID: <CAAeHK+yyX95aBzzXRoSUYj1QF8c-7uwGNeuwfBU8zOjOWyO_Wg@mail.gmail.com>
Subject: Re: [PATCH v6 00/11] arm64: untag user pointers passed to the kernel
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrey Konovalov <andreyknvl@google.com>,
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
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 30, 2018 at 1:41 PM, Andrey Konovalov <andreyknvl@google.com> wrote:
> arm64 has a feature called Top Byte Ignore, which allows to embed pointer
> tags into the top byte of each pointer. Userspace programs (such as
> HWASan, a memory debugging tool [1]) might use this feature and pass
> tagged user pointers to the kernel through syscalls or other interfaces.
>
> This patch makes a few of the kernel interfaces accept tagged user
> pointers. The kernel is already able to handle user faults with tagged
> pointers and has the untagged_addr macro, which this patchset reuses.
>
> Thanks!
>
> [1] http://clang.llvm.org/docs/HardwareAssistedAddressSanitizerDesign.html
>
> Changes in v6:
> - Added annotations for user pointer casts found by sparse.

Hi Catalin,

I've added annotations for the user pointer casts pointed by the new
sparse flag -Wcast-from-as as you asked. I've used __force casts
instead of adding specialized macros.

There are also non annotated casts for other pointer types (iomem,
rcu) which are detected with the new flag, should I annotate those as
well?

I'm not sure though what value would that bring though, as there are
~3000 various sparse warnings produced with the default flags anyway.

WDYT?

Thanks!

[1] https://github.com/lucvoo/sparse-dev/commit/5f960cb10f56ec2017c128ef9d16060e0145f292
