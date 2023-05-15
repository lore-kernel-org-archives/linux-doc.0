Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83AE4C77B75
	for <linux-doc@archiver.kernel.org>; Mon, 15 May 2023 21:21:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245124AbjEOVV4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 May 2023 17:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243904AbjEOVV4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 May 2023 17:21:56 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FAE993D9;
        Mon, 15 May 2023 14:21:55 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1684185713;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wI2IfXLNms3B2n2S6c3RgOqoGhaDXYyU2AW4VBMeLPw=;
        b=snx9vsjHPZCMsXGBGD2t9oBj14GZi5iSZEwQGFdJUTf44GQ/wFSl5W8wHnIQowoKqsANOH
        EATJdiA/v5Gw24qXTa/J+OheoL7SU4VDOFazTT1g47A/bk/OZa7o2jZhvU3trqQeo6wcKI
        1KUapgNS7dNdJWFoNkyvTl/rMgnXC7wEt7G8LUAr1qCqJaYZG7GD/UJ0owEjqgAOhNyvu/
        s21ZRLDOZy9LJm39J5cD5a/tcfe8TItmf2cMSVgZ93igRVQcACekMeTuSETBDdL5CDhyXj
        jH9fFVRF9HM0/ieZfPNRmg2f3+2jneTQlEjSc0VWqmVSGiWe70VXrDUq6slqqw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1684185713;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wI2IfXLNms3B2n2S6c3RgOqoGhaDXYyU2AW4VBMeLPw=;
        b=Jr0LTkC0rQkeLRXSwZ473qn+kewYKm9BpzlwMWNtGyLXYHPPH3ieBMpB9Od3xw5b/mUy7J
        LOyqT+JMx/G7jhDg==
To:     Anna-Maria Behnsen <anna-maria@linutronix.de>,
        linux-kernel@vger.kernel.org
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH] Documentation: core-api/cpuhotplug: Fix state names
In-Reply-To: <20230515162038.62703-1-anna-maria@linutronix.de>
References: <20230515162038.62703-1-anna-maria@linutronix.de>
Date:   Mon, 15 May 2023 23:21:53 +0200
Message-ID: <87ttwd8f4e.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 15 2023 at 18:20, Anna-Maria Behnsen wrote:

> Dynamic allocated hotplug states in documentation and comment above
> cpuhp_state enum do not match the code. To not get confused by wrong
> documentation, change to proper state names.
>
> Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
