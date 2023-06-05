Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35277C77B73
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jun 2023 14:44:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232837AbjFEOoC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jun 2023 10:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232958AbjFEOoC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jun 2023 10:44:02 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40FA49C;
        Mon,  5 Jun 2023 07:44:01 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1685976239;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Yu8yb2dMCQCeQyNY1nsYlHKgfhBjDttjfMXiSlTo35k=;
        b=wkeKIqvikWtIbmarvgI7c1qD64y8lAjpTFP4POEo8RpT5Gb04ueDK6KMUTImZAfAVK0pmc
        qmFrbu0vGSxz/MAZ06gBt92VcOWtG1xy09CbvWYSM+5yaMTMaT4bTAIHM3UHCwDZmbkVd1
        XfYS9r01Brn9aEqx0ZJNyHyQqoyHQ+rAL5prUG5gdvzSGMDbgUdf5RVoVO2oD2ehtOK+Mi
        fiY8qadg1nlHpRRuGQAvCIPpNUFQgYlxKblEYbKQuiqUZi5pokF9Cw0I4T5+OzbocpzzIb
        rlG3Q3H2BuCpbqWKYYvfO+EEukCgLUI5oijxgeQmgm9htCGyoIYv9t78nqHN9A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1685976239;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Yu8yb2dMCQCeQyNY1nsYlHKgfhBjDttjfMXiSlTo35k=;
        b=mGTycwY1wOkkE9XanANgMyGs568fQpM7xE3JHTc2pqw/l5dmCPXWcDC0F+HZQmyn1kKYn7
        xxlDu0MXR9YM04Dw==
To:     David Laight <David.Laight@ACULAB.COM>,
        Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc:     Steven Noonan <steven@uplinklabs.net>,
        "kernel@collabora.com" <kernel@collabora.com>
Subject: RE: Direct rdtsc call side-effect
In-Reply-To: <353732783fde46919fdcf698c326b7ed@AcuMS.aculab.com>
References: <6719fb05-382c-8ec4-ccda-72798906a54b@collabora.com>
 <87mt1jeax1.ffs@tglx> <353732783fde46919fdcf698c326b7ed@AcuMS.aculab.com>
Date:   Mon, 05 Jun 2023 16:43:59 +0200
Message-ID: <87jzwi55qo.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 05 2023 at 10:27, David Laight wrote:
> It has to be said that using it as a time source was fundamentally
> a bad idea.

Too bad you weren't around many moons ago and educated us on that. That
would have saved us lots of trouble and work.

> Sometimes (eg micro benchmarks) you really want a TSC.
> You can extract one from the performance counters, but it is hard,
> root only, and the library functions have high and variable overhead.

Interesting view that high end databases are considered micro benchmarks
which need root access.

I'm sure you already talked to the developers of such code how they can
elimiate their performance problems when VDSO/TSC time queries are not
available.

Alternatively you have a replacement implementation to make VDSO work
with the same performance and precision based on (potentially
non-existing) legacy time sources.

There are damned good practical reasons, why we spent a lot of effort to
implement VDSO and make TSC usable at least on any modern platform.
Micro-benchmarks are definitely not one of those reasons.

Thanks,

        tglx


