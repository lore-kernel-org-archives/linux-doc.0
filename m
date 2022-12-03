Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40C8C4332F
	for <linux-doc@archiver.kernel.org>; Sat,  3 Dec 2022 10:52:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbiLCKwA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 3 Dec 2022 05:52:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiLCKv7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Dec 2022 05:51:59 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F90726CD
        for <linux-doc@vger.kernel.org>; Sat,  3 Dec 2022 02:51:58 -0800 (PST)
Received: from localhost (mdns.lwn.net [45.79.72.68])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 64261723;
        Sat,  3 Dec 2022 10:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 64261723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1670064718; bh=IELCPGd4pMFb3FdrKuZkE5R1fS+lKXxB1BXtWLqcflU=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=qc9sSGf3xVIzvt0aCSAy1WeqUYb7JI1pa5I2Vw9sBhvDrg4bHJ9HCLyW5mFz6P9tc
         +szFTEed32+tRrqL9U0rsRDgV8T5ZK1LAQnUpz6Ap80FEvpwutT/klFoCBePb1SSgM
         OjctOaCAo25jg37D8ACrHFMrD1B8bPrGdat/rsdHeZ0io5sauV0dPPJUSzXWw6+bZ3
         6JEawYHz6NEry9EIGVg4lK84F47sl8AT4RMjAF7QdT9uxHLjsvbbxBS6ZCnsDsXL/x
         EDaR85buo31hbe0bYSGhjvwdJriAv62krQ+QyMeMWJCBiTDgVL2FzEIEw1Iigu96eQ
         uYGY6lIBHR4Fg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Elliott, Robert (Servers)" <elliott@hpe.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: kernel-doc headers for assembly language functions
In-Reply-To: <MW5PR84MB1842B6A43CB2D9B5B3179B3CAB169@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
References: <MW5PR84MB1842B6A43CB2D9B5B3179B3CAB169@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
Date:   Sat, 03 Dec 2022 03:51:53 -0700
Message-ID: <87pmd0oj3q.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"Elliott, Robert (Servers)" <elliott@hpe.com> writes:

> Is there a recommended way to document assembly language functions
> with the kernel-doc format?
>
> scripts/kernel-doc doesn't understand assembly language files and
> using SYM_FUNC_START to identify a function entry point. Unlike
> a C function header, that line just identifies the function name,
> not any of the arguments.

As you note, it doesn't work currently.  The most common way of dealing
with this, I think, is to put the kerneldoc comments with the declaration
of the function that is (usually) found in a C header file somewhere.

Thanks,

jon
