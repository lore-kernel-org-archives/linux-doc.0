Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 69A277D072
	for <lwn-linux-doc@archive.lwn.net>; Thu, 28 Jun 2018 19:30:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933040AbeF1TaT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 28 Jun 2018 15:30:19 -0400
Received: from mail-it0-f66.google.com ([209.85.214.66]:37007 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754336AbeF1TaR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Jun 2018 15:30:17 -0400
Received: by mail-it0-f66.google.com with SMTP id p17-v6so9266399itc.2
        for <linux-doc@vger.kernel.org>; Thu, 28 Jun 2018 12:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=XfV0YwIao1ZThy48M/rzfQwaFP3aXW3fGxtnhPWGtws=;
        b=V7TnwCZS3G9n5jIXFCypNlSF9O9FsGCezRgOsnjku8hdMyFfrgDneB+KarFl+m+JPE
         mkWSsPUu2966xHsADYVpkYloYvHn+nKF83yvgexB5XlDv7hPpBYf7/9v2LeAvQRvmGJm
         FdDOxPgfJzyNP0OZ1VzNihnR1MnQEsnfWuWn0ECeYGPSJV2oYiAa54w0/Xkk1RcLn152
         b68wFzfOqQ3vq66MBUsR/ECIVz9dBow7jUA6WgFgxskjkpR5y3cqk7I8fx1HWAyAxCXZ
         vcIE3LOGtcguN0Z7JwtAvLJfP1DoohKd3RwnlibhpLcF9ykLZDM8IL4ZcJh+V2hgz18r
         tPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=XfV0YwIao1ZThy48M/rzfQwaFP3aXW3fGxtnhPWGtws=;
        b=ub8neh9Me/tcqsegZhgfkixlLGuVh8wY5DwpG7zCN2PclqW+mYyAyD/hhMC95qYYzx
         7RfPo62Wl5061Cm9CQALnt7V03NBEmLGeV/tykxFgeRRNUqtzgIeAf8+eOSfmgKr1yy0
         9Q7te/s/1HsxdSq/KJG4KEjuhNKJ8Rzeoz0cWeDx2WG3qV3oK/C4gCRl6sBH4xup/cZO
         2FLGwVPBU0pbSWOCXTgwkENNlCvJfi/gGEqgQc/CB7RST/kTAKxSS5fnw2Bs/ASjWh+J
         +WhO9+YNDfP3svm8xzckxEpqZFXmQnBpn26EYkrjfik7V1DK6inGhUZ6yuQxPdlG6reP
         B0uw==
X-Gm-Message-State: APt69E2eZ0cENJd+HpKB3YAs824UokI11gNmotKBmiQTvJVZJfDgD0cQ
        GkWd+YpDT8FRvLf8jBzm+Vb+he7ir5MCImKGoMWxSQ==
X-Google-Smtp-Source: AAOMgpdKcg1s52OL8mN+GAkdGe2OK2W2ILU6cjow8+aqbaqkzkYw3R5ICkk2QHv7MNG7QSxAYMWIrgn50STZiVidOPI=
X-Received: by 2002:a24:b046:: with SMTP id b6-v6mr10289685itj.48.1530214216643;
 Thu, 28 Jun 2018 12:30:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:9082:0:0:0:0:0 with HTTP; Thu, 28 Jun 2018 12:30:16
 -0700 (PDT)
In-Reply-To: <CAAeHK+yqWKTdTG+ymZ2-5XKiDANV+fmUjnQkRy-5tpgphuLJRA@mail.gmail.com>
References: <cover.1529507994.git.andreyknvl@google.com> <CAAeHK+zqtyGzd_CZ7qKZKU-uZjZ1Pkmod5h8zzbN0xCV26nSfg@mail.gmail.com>
 <20180626172900.ufclp2pfrhwkxjco@armageddon.cambridge.arm.com> <CAAeHK+yqWKTdTG+ymZ2-5XKiDANV+fmUjnQkRy-5tpgphuLJRA@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 28 Jun 2018 21:30:16 +0200
Message-ID: <CAAeHK+wJbbCZd+-X=9oeJgsqQJiq8h+Aagz3SQMPaAzCD+pvFw@mail.gmail.com>
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

On Wed, Jun 27, 2018 at 5:05 PM, Andrey Konovalov <andreyknvl@google.com> wrote:
> On Tue, Jun 26, 2018 at 7:29 PM, Catalin Marinas
> <catalin.marinas@arm.com> wrote:
>> While I support this work, as a maintainer I'd like to understand
>> whether we'd be in a continuous chase of ABI breaks with every kernel
>> release or we have a better way to identify potential issues. Is there
>> any way to statically analyse conversions from __user ptr to long for
>> example? Or, could we get the compiler to do this for us?
>
>
> OK, got it, I'll try to figure out a way to find these conversions.

I've prototyped a checker on top of clang static analyzer (initially
looked at sparse, but couldn't find any documentation or examples).
The results are here [1], search for "warning: user pointer cast".
Sharing in case anybody wants to take a look, will look at them myself
tomorrow.

[1] https://gist.github.com/xairy/433edd5c86456a64026247cb2fef2115
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
