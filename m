Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA00C77B7E
	for <linux-doc@archiver.kernel.org>; Thu,  1 Jun 2023 20:13:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjFAUNd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Jun 2023 16:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjFAUNc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Jun 2023 16:13:32 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DB16D1;
        Thu,  1 Jun 2023 13:13:31 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1685650409;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VhqYS2lyDFfuoa88kODGtonbyEtHNG3TXqkVpEvaQl8=;
        b=PGlHMojZjN/9GkSbz2rHDfnwxnlRvrOxaaLVJunjL9LP8LHNGsxTaALStcWxUxIi8sdJX8
        lqvT3ilMtpVyNXbpQeqU81GEIRUGIPEklrKJKr5YEgd7xaLFHSyZz/zdHQWZaBJnzTb4Dd
        I8AEhgdqt2QnVwEIx+HzhdQIjKHNiXWzDTJ2uWIC/vh6X+GcLfc+cOx5jpLsSuuY7AwlXq
        TQKRmBK2E5db9IpX6/1KXh7U0yhsB6Ok2fxS7jdrnS/SM3YhPnKeIl8EqPhZKtBnN9zDvX
        w709Is3z8nO4YgoJ41KJ5VOx+pGJkACicnoqZLXtsfM07ekiRkGNjUeZALfsHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1685650409;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VhqYS2lyDFfuoa88kODGtonbyEtHNG3TXqkVpEvaQl8=;
        b=xleRV+bWpbXMbVWK7dfSAyfJ/A8lvCBKqJk3V6HyfWibUAieNU5VU48PDtqZp09tXaj8ag
        6rd61mxCICbDZ6CQ==
To:     Steven Noonan <steven@uplinklabs.net>
Cc:     Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>, kernel@collabora.com
Subject: Re: Direct rdtsc call side-effect
In-Reply-To: <871qivdjui.ffs@tglx>
References: <6719fb05-382c-8ec4-ccda-72798906a54b@collabora.com>
 <87mt1jeax1.ffs@tglx> <87h6rrdoy0.ffs@tglx>
 <L9sTQNWVFoNxz-HmzFoXBX4twp84wuAx5Mf4LcxWw9k0rTAXI32rSl7WEOr7058iN6_Nyf8fLN-Ye3sq5THHjJCKG2vQLlpnVs77kKlLFV4=@uplinklabs.net>
 <871qivdjui.ffs@tglx>
Date:   Thu, 01 Jun 2023 22:13:29 +0200
Message-ID: <87y1l3c55i.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 01 2023 at 22:10, Thomas Gleixner wrote:
>
> So back to the options:
>
>    1) Kernel
>
>       If at all then this needs to be disabled by default and enabled by
>       a command line option along with a big fat warning that it might
>       disable TSC for timekeeping and bug reports related to this are
>       going to be ignored.
>
>       Honestly I'm not too interested in this. It's yet another piece of
>       art which needs to be maintained and kept alive for a long time.
>
>       The fact that we need to check for synchronized TSCs in the first
>       place is hillarious already. TSC_ADJUST makes the resynchronization
>       attempt at least halfways sensible.
>
>       Without it, it's just a pile of never going to be correct
>       heuristics with a flood of "this fixes it for my machine (and
>       breaks the rest)" patches.
>
>
>    2) Binary patching
>
>       Unfortunately RDTSC is only a two byte instruction, but there are
>       enough advanced binary patching tools to deal with that.
>
>       It might be a completely crazy idea, but I wouldn't dismiss it
>       before trying.

Duh. Hit send too early

     3) Virtualization

        Obviously not trivial either but definitely workable.

Thanks,

        tglx
