Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43935C77B7E
	for <linux-doc@archiver.kernel.org>; Tue,  2 May 2023 15:48:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233781AbjEBPsX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 May 2023 11:48:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232627AbjEBPsX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 May 2023 11:48:23 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A88010D;
        Tue,  2 May 2023 08:48:21 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1683042499;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LS2fEnHsAGqEzKrFxb5zVFQIH3oA+8oYM3tRiuzQm7o=;
        b=tY/ZWHFhvvZE3rATE/m7Hpf6+JTJovfsgXxjqhIY+LozPfzpFPp5eAPxEsCFeUDma1AY5Q
        nC31se5ad5PWhhM6YoI4esC628CJSstBRPFEBzMAM2PE6HufUQ71vRVdTcZi4yYJZF2jSr
        wAVVlbh+pJ876l1P53ehk3qRwU5bysd4zt6IE0BmHk9UXOMlO9S989sR8Iwv4Be8+fQ/QP
        YFirnqX838JW7t0mRrxJSx/nKzH7BiVDdLFrtDrnO3YCKFu3ixE3e4NgI7uVzWDI6oDTJC
        t6uNgGWs1eyJcbRRxYLf1C5mbxX4rVus4rReSe1uHZlNtnZhofboV7t1pv2QwQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1683042499;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LS2fEnHsAGqEzKrFxb5zVFQIH3oA+8oYM3tRiuzQm7o=;
        b=IF8m7wXH28hQ2UoMgBUgfSaRT9CDHCIvDPflRdGIiyOeF4K08hnSSTW5B2svb2X0PGd4fR
        7V2b2iJlDricwJBw==
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        John Stultz <jstultz@google.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] Documentation: timers: hrtimers: Make hybrid union
 historical
In-Reply-To: <59250a3d1c2c827b5c1833169a6e652ca6a784e6.1683021785.git.geert+renesas@glider.be>
References: <59250a3d1c2c827b5c1833169a6e652ca6a784e6.1683021785.git.geert+renesas@glider.be>
Date:   Tue, 02 May 2023 17:48:18 +0200
Message-ID: <87v8ha4tvh.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 02 2023 at 12:05, Geert Uytterhoeven wrote:

> Non-scalar time was removed from the ktime hybrid union in v3.17, and
> the union itself followed suit in v4.10.
>
> Make it clear that ktime_t is always a 64bit scalar type, to avoid
> confusing the casual reader.
>
> While at it, fix a spelling mistake.
>
> Fixes: 24e4a8c3e8868874 ("ktime: Kill non-scalar ktime_t implementation for 2038")
> Fixes: 2456e855354415bf ("ktime: Get rid of the union")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
