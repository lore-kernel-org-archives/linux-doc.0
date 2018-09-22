Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E813E7D57F
	for <lwn-linux-doc@archive.lwn.net>; Sat, 22 Sep 2018 23:38:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbeIWFdi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 23 Sep 2018 01:33:38 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45488 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbeIWFdi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 23 Sep 2018 01:33:38 -0400
Received: by mail-lj1-f194.google.com with SMTP id x16-v6so8732024ljd.12
        for <linux-doc@vger.kernel.org>; Sat, 22 Sep 2018 16:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t4vsmcrWT914V8JL5+69GqM4sSIsQ2EBYEbRFEjx/8I=;
        b=RP8dllz44cqDoJpKJ8wcwuRwtQS9mTyHuzgB0SXdtdgsiGtVCRjgDjs+kJonZJtqK7
         rZOEDa0QB4cLq9eT20hiKeaEdd5KAph1nWUKNAGIjEIRcysGvMse77OOtrhfqXh8q4m7
         TsI1etAfzPqVHwKoBgj1esgSY+nN2DpqfskU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t4vsmcrWT914V8JL5+69GqM4sSIsQ2EBYEbRFEjx/8I=;
        b=PFxFrOHQeSQobmx69gU8GA3Ay2be2AbaqoCKMWHWJLjHKBYXbmu9n2F8DXehjVbkzP
         Nn7QNdhibMcvfzS7Pfx+awna0P1O2T/FeuoINvWZj5JIFh+tDiRE3tlSwt4SKqPn3aFu
         k8rU9lnNVRLfWnwSIzWMcupvTargL8xRQ0owCNeakplsc9BBDgQA8d/TSviHTllfyccm
         NKaD2n7DxFuqEtUyQpIz88jZSr3dtI3RL2abPkzoyd45jXNlZvJkEXIiPXvnypiHRt53
         FmTtlj9qwODNrMG3PeF6+6fVvRCVBwSVYtK3b8RUePdmnb2V49idFvgwZzQAqpdwdfSw
         9sJQ==
X-Gm-Message-State: ABuFfohPD7cEHdYm1AHi7x6bdcb+ob9L8+yB6dzfknCXAvgn5ZTJy50u
        7o9MDaNQlTmEAptKN0D9LP/D1CVqJ1xnhmY5GK8alQ==
X-Google-Smtp-Source: ACcGV63uH2ajeHZ4Xguu3ovKQkh/zNcAprJnMoniW7rwdqenX03WMnLtyWuGwohuxnm5CeEIgsl750Qc8cdaZls+04o=
X-Received: by 2002:a2e:901a:: with SMTP id h26-v6mr445800ljg.121.1537659496988;
 Sat, 22 Sep 2018 16:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20180921223153.114728-1-joel@joelfernandes.org>
 <20180922011428.GU4222@linux.ibm.com> <CAEXW_YTgSFr5r3Qkr0+0_wxKGQV1KKP_8X8uQKAnHmhvem8XtA@mail.gmail.com>
 <20180922134616.GX4222@linux.ibm.com>
In-Reply-To: <20180922134616.GX4222@linux.ibm.com>
From:   Joel Fernandes <joel@joelfernandes.org>
Date:   Sat, 22 Sep 2018 19:38:05 -0400
Message-ID: <CAEXW_YRaLjRWH9BYV_r8e4pCuBEGCzMSRdS6x7Qozc8HKoej=w@mail.gmail.com>
Subject: Re: [PATCH RFC] Documentation: RCU: Clarify comment about fanout
To:     paulmck@linux.ibm.com
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Sep 22, 2018 at 9:46 AM Paul E. McKenney <paulmck@linux.ibm.com> wrote:
[...]
> > I have a few more as well, I'll send them out soon.
>
> I do have on my list to update this document based on the changes in
> -rcu, which among other things eliminate the rcu_dynticks structure
> and  make it so there is only one rcu_state structure in a given
> running system.
>
> If you are crazy enough to want to make the corresponding changes,
> I would welcome the patches (and would be happy to help with editing,
> grammar, and soforth.  The potential advantage to you is familiarlzation
> with the new version of the code.
>
> This is not a small amount of work, so please give it some thought
> before saying "yes".  (In contrast, I would of course understand and
> respect an immediate "no".)

I thought about this and I'd be happy to do it as long as you don't
mind me asking questions about parts I don't understand (which
shouldn't be a problem from my past experience ;-)). I am spending
time understanding the code anyway so I'd rather update the main
documentation than my own notes for the benefit of everyone ;-) As you
said, it'll help familiarization of the code. Btw I got rid of those
extra rcu_state externs too, I'll send that patch out today and
continue working on things next week...

Thanks!

 - Joel
