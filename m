Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E023FC001B0
	for <linux-doc@archiver.kernel.org>; Tue,  8 Aug 2023 17:14:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234027AbjHHRO5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Aug 2023 13:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234030AbjHHROU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Aug 2023 13:14:20 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D49FD1C13D;
        Tue,  8 Aug 2023 09:05:57 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1691484892;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+tYmrs7XxfKFkF1xflpSM4UFyr7UbprYHEwGy5087hQ=;
        b=cZV/NsmzdU6V5qR4zmGmKTK0wM4rNd2+RBdTGJAsfbniEzlUeU2lB5CN6bUAqZcAg9FOb8
        ebVxstALHtkjgs2SaPTQ6PvxHfkvw6KGGy0oWqgNyE6hmD67AIxq16tqK+K1fIQGtbWtcU
        t93061GdfI2JyWm95X2BR5d6y9g/ntAfkd71cdxFPT/9sLJoeXgnePX7gj7nRJL4rWosuq
        K/O2mDb4+RCR5SGGR8LWkWq4PQoFVGaUcC3qXMoNCBwUP5JlOYwGUTCYaP8y6oO0e3x3zD
        oRz9M+r0uoBMP4dkD2v5faGIg5EY/I0gtTFmPvVSuz8cGajMCsLenQIXWBAXcg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1691484892;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+tYmrs7XxfKFkF1xflpSM4UFyr7UbprYHEwGy5087hQ=;
        b=E/YYZDoXKnZsVXNcqNN057HtMKjj7UQ7AhJv1RS+tXRlYidcYmynANkOHEdhG1F1JAuyw+
        EeCPpeqd6pdQ00CQ==
To:     Jonathan Corbet <corbet@lwn.net>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: core-api/cpuhotplug: Fix state names
In-Reply-To: <87a5v26bvw.fsf@meer.lwn.net>
References: <20230515162038.62703-1-anna-maria@linutronix.de>
 <87ttwd8f4e.ffs@tglx> <427ee6f-61e3-e97e-195d-cee0bede2ceb@linutronix.de>
 <87a5v26bvw.fsf@meer.lwn.net>
Date:   Tue, 08 Aug 2023 10:54:52 +0200
Message-ID: <871qgdud5v.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Aug 07 2023 at 10:44, Jonathan Corbet wrote:
> Anna-Maria Behnsen <anna-maria@linutronix.de> writes:
>
>> On Mon, 15 May 2023, Thomas Gleixner wrote:
>>
>>> On Mon, May 15 2023 at 18:20, Anna-Maria Behnsen wrote:
>>> 
>>> > Dynamic allocated hotplug states in documentation and comment above
>>> > cpuhp_state enum do not match the code. To not get confused by wrong
>>> > documentation, change to proper state names.
>>> >
>>> > Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
>>> 
>>> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
>>> 
>>
>> Ping?
>
> I didn't pick this up because linux/cpuhotplug.h is a bit outside my
> turf; I can certainly do so, though, if that seems like the best path.

I'll pick it up.
