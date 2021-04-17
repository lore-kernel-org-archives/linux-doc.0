Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109DAC43460
	for <linux-doc@archiver.kernel.org>; Sat, 17 Apr 2021 13:01:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6293611EF
	for <linux-doc@archiver.kernel.org>; Sat, 17 Apr 2021 13:01:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236355AbhDQNCW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 17 Apr 2021 09:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236265AbhDQNCV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 17 Apr 2021 09:02:21 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF644C061756
        for <linux-doc@vger.kernel.org>; Sat, 17 Apr 2021 06:01:54 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id k26so12842554wrc.8
        for <linux-doc@vger.kernel.org>; Sat, 17 Apr 2021 06:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+v8KSkqN0pv8xQKlIzIRV3KVCzjduD2sMPQGi6ecTqs=;
        b=iSHsdL+1b5IJMiBkkyJ43fDzFp4eqt2VC/FIVFd35ffURyzH/YtSsNwcshHwZmgr4i
         +wbr7XqE+qLBi8tgYX5V7UembUxWa693Y0AXLicpkEwM+1d+X2J16gVN73vXeyG7Opfi
         yWT2TkeqOpuLE1PZkXrlTMug5YrcR/bCF0sHEuKlJc8r2Qc01UMk2MKs7HCrkryabifH
         SrI8vuyKaBvMsSR91M9H+F77FUfzO1DfEq/r5SOATctwqbLXNcc9bCKMIq/JfBDlrsws
         OmW1Ip6Bg5SHikFLsQ+gg8JavMR+rNzEZ7/TGTURN9Cbw9c7XNrni3h4BPd13QLrtDh/
         Tsmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+v8KSkqN0pv8xQKlIzIRV3KVCzjduD2sMPQGi6ecTqs=;
        b=Y2JYuU3W8Ierzjed6r0M5Vg6J9IRBPfF7rudR9syXBRW118A+QlJFwsBhOh8UQfUWx
         CygEtUmE47EmMTPbmkaVql5U5MVXBo0mR308xMwHEpW2LceTxa+kStymUdBgJ7K7q+QP
         Fu3gZMHyIhPY/hLN7qGhxerb/E/YrcJGxrZF2NhhJecqliNnSQMWAy82tuCuiaS0L26/
         W/M1yHxVuaqLGxwtnMVVWCAMhdJPmIML0uSEHl6iYVrp/ZTUiHi2xbcVdPd6Wef9kddN
         UL7pbbvlBek8gLm4VZIGEgpZQ3Mat/oivNANX+MiCbOW/4M4WRTqDvdeDUga4C1uElKi
         rP+Q==
X-Gm-Message-State: AOAM532RS0P9b84VW6lLSz1qtWANlgxBeD07ICfCOT2xYppuMQW+Nhs+
        C7xcI4A+jpQpwi7L3jmTUvo0
X-Google-Smtp-Source: ABdhPJyDfR4fjAMTEqH2LV4RuPCRUIXQBxsqKNB76GScQRsrULmyLXoLGb7y/HQhJapPFyholtlnGA==
X-Received: by 2002:a05:6000:1449:: with SMTP id v9mr4307725wrx.295.1618664513253;
        Sat, 17 Apr 2021 06:01:53 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:3c1c:8462:b77e:21a4])
        by smtp.gmail.com with ESMTPSA id l9sm14433449wrz.7.2021.04.17.06.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 06:01:52 -0700 (PDT)
Date:   Sat, 17 Apr 2021 14:01:48 +0100
From:   Wedson Almeida Filho <wedsonaf@google.com>
To:     David Laight <David.Laight@aculab.com>
Cc:     'Peter Zijlstra' <peterz@infradead.org>,
        "ojeda@kernel.org" <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YHrcPOLJBq593z6P@google.com>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com>
 <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
 <39b8cbb2cfba4a5ba913311cb2448f50@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39b8cbb2cfba4a5ba913311cb2448f50@AcuMS.aculab.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Apr 17, 2021 at 12:41:23PM +0000, David Laight wrote:
> Or the cases where the locks are released in the 'wrong' order.
> Typically for:
> 	lock(table)
> 	item = lookup(table, key)
> 	lock(item)
> 	unlock(table)
> 	...
> 	unlock(item)

This is expressible in Rust with something like:

    table = table_mutex.lock()
    item = table.lookup(key).lock()
    drop(table)
    ...
    // item will be unlocked when it goes out of scope or on drop(item)

The added bonus here from Rust is that table is not accessible after
drop(table), so a developer cannot accidentally access fields after unlocking
it.

> 
> (In the kernel the table lock might be RCU.)
> 
> Or, with similar data:
> 	write_lock(table);
> 	foreach(item, table)
> 		lock(item)
> 		unlock(item)
> 	/* No items can be locked until we release the write_lock.
> 	...
> 	unlock(table)

I think I'm missing something here. Would you help me understand what part is
out of the ordinary in the code above? It would be expressible in Rust with
something like:

    table = table_mutex.write();
    for (item_mutex in table)
        item = item_mutex.lock
        // item is unlocked at the end of the loop iteration (out of scope)
    // table gets unlocked when it goes out of scope

Cheers,
-Wedson
