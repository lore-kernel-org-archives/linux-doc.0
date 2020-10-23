Return-Path: <SRS0=PdnY=D6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB0E6C388F9
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 21:59:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50F2B20BED
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 21:59:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FpQmBJoq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nHmm/QYq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1757028AbgJWV7u (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Oct 2020 17:59:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757027AbgJWV7u (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Oct 2020 17:59:50 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 591B8C0613CE;
        Fri, 23 Oct 2020 14:59:50 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1603490388;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mcqtPkA0tz7ylkWcpgHi1whok+ruukbSXl7bVbRNeHw=;
        b=FpQmBJoq1nNNC4QO/xEsdNA1Wbti7sa5bKvyG9sxwcqPPWtOcPaCfWHtjhhrHtdUsbWyXk
        WuJFdPY9XA7e+0DEWHd8Rf+IBNRbxbf0fGtk3WY35MEYWRsCO/al04Qy+n8N35/YhhZLyT
        +qyXEDBepFoJ/UzLTB1z9KkOc67HKEEspRF1UkSXJFofyra8sQxfXRyr6iIdIJ522WMsTn
        rGHA9pvAWa0xtjYG5RpmS4+VYuClBkA7FcnnuaQjQsQavxrmtjMX1yyL73Onjqp8lR1m3x
        uqEwc+8Y5+pRUNn7WDf5/n76QQ5uM03H/QHZiUgjVoT9Lqy3Ug2xR58HjkD51A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1603490388;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mcqtPkA0tz7ylkWcpgHi1whok+ruukbSXl7bVbRNeHw=;
        b=nHmm/QYqpi4s8doFzwGapHfMVQpfgwSLj29GjpCVLTMZfVMcMdPOuaBxwzoLga1IiapECr
        VsJQfTGT65LC3sCw==
To:     Elliot Berman <eberman@codeaurora.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Elliot Berman <eberman@codeaurora.org>,
        Trilok Soni <tsoni@codeaurora.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] smp: Add bootcpus parameter to boot subset of CPUs
In-Reply-To: <1603404243-5536-1-git-send-email-eberman@codeaurora.org>
References: <1603404243-5536-1-git-send-email-eberman@codeaurora.org>
Date:   Fri, 23 Oct 2020 23:59:48 +0200
Message-ID: <87v9f04n8r.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 22 2020 at 15:04, Elliot Berman wrote:
> In a heterogeneous multiprocessor system, specifying the 'maxcpus'
> parameter on kernel command line does not provide sufficient control
> over which CPUs are brought online at kernel boot time, since CPUs may
> have nonuniform performance characteristics. Thus, add bootcpus kernel
> parameter to control which CPUs should be brought online during kernel
> boot. When both maxcpus and bootcpus is set, the more restrictive of the
> two are booted.

What for? 'maxcpus' is a debug hack at best and outright dangerous on
certain architectures. Why do we need more of that? Just let the machine
boot and offline the CPUs from user space.

Thanks,

        tglx
