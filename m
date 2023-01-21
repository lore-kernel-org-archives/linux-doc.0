Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE4AC004D4
	for <linux-doc@archiver.kernel.org>; Sat, 21 Jan 2023 16:58:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbjAUQ6Z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 21 Jan 2023 11:58:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjAUQ6Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 21 Jan 2023 11:58:25 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8242940D
        for <linux-doc@vger.kernel.org>; Sat, 21 Jan 2023 08:58:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8DEEB60110
        for <linux-doc@vger.kernel.org>; Sat, 21 Jan 2023 16:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8246C4339B;
        Sat, 21 Jan 2023 16:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674320302;
        bh=Rc60u3nQD8vjB9hfAtNH19XQTM3JZUxJHCTagm0Ww8w=;
        h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
        b=ert9M/F4BePRGhs1X+m748gTD3B9f4GCevOoIUfOYBlGXDKo8MMbJA5tUe/jxIeXC
         m+EKKetAxOc4eLj1O74ycN6a4TXmYZxHxUmwWO+ekp8uC2ZhfKASAeYliLPRisgk6p
         5sjKvCJLCz8pzL2Y/SJLyt9UROfudySTiSer6sA96wTsk+3liJDEo3Wd0GO1k5d83V
         UYLeA4p6EUyGLrArEMWueC69CHERNqgv/3Dw4C9mlRnbZO1TXnWnHvVn53VaANJkuC
         NAP7hBl9KYW1+XP6NSMb9Q8i1cI+N2ny+/cZqxDlzf6KshMkq6Uc8RaGuAuQljivJn
         /xl3KNnwkafMg==
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailauth.nyi.internal (Postfix) with ESMTP id 955BB27C0054;
        Sat, 21 Jan 2023 11:58:21 -0500 (EST)
Received: from imap48 ([10.202.2.98])
  by compute3.internal (MEProxy); Sat, 21 Jan 2023 11:58:21 -0500
X-ME-Sender: <xms:rBnMY3xs8CKfHZTWiTPvmFqdovIhH86r-nU_ReHS8_xuzBmUzFPmDQ>
    <xme:rBnMY_S0G7T1XAtFRgs2mrX0cWk6Ox4RRuS3IfKy8HmG63Yv6FEEkX6SEgLaqtmS5
    3gV9pN6vu-qg58OXCs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddugedgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ugihucfnuhhtohhmihhrshhkihdfuceolhhuthhosehkvghrnhgvlhdrohhrgheqnecugg
    ftrfgrthhtvghrnhepvdfhuedvtdfhudffhfekkefftefghfeltdelgeffteehueegjeff
    udehgfetiefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprghnugihodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduudeiudek
    heeifedvqddvieefudeiiedtkedqlhhuthhopeepkhgvrhhnvghlrdhorhhgsehlihhnuh
    igrdhluhhtohdruhhs
X-ME-Proxy: <xmx:rBnMYxWcr_StY-Je2QwqxKK1dbhMVCkQYrCnb9RmFXhUDRM05-Qhdw>
    <xmx:rBnMYxi_P1OkYINtWYQpUpy24A33gZmlwWJ71bzXi0nBDCToADHKUQ>
    <xmx:rBnMY5CxN-5-kQF7RdR5Lf3vMZQi7WPnH70detc7b1t1Jl7R21Hoig>
    <xmx:rRnMY73ogRNB9CTAUFW9AJ7a9ndlOBjr1SzBz4VIgUCSNJTv1veRKg>
Feedback-ID: ieff94742:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id B8B7231A0063; Sat, 21 Jan 2023 11:58:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <6bf667ca-da46-4759-b1b0-5aa56dd2eb28@app.fastmail.com>
In-Reply-To: <87v8l26ww7.fsf@meer.lwn.net>
References: <20230111193211.1987047-1-sohil.mehta@intel.com>
 <87v8l26ww7.fsf@meer.lwn.net>
Date:   Sat, 21 Jan 2023 08:58:00 -0800
From:   "Andy Lutomirski" <luto@kernel.org>
To:     "Jonathan Corbet" <corbet@lwn.net>,
        "Sohil Mehta" <sohil.mehta@intel.com>, linux-doc@vger.kernel.org
Cc:     "Thomas Gleixner" <tglx@linutronix.de>,
        "Kees Cook" <keescook@chromium.org>,
        "Tony Luck" <tony.luck@intel.com>,
        "Shankar, Ravi V" <ravi.v.shankar@intel.com>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>
Subject: Re: [PATCH] x86/vsyscall: Fix documentation to reflect the default mode
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On Thu, Jan 19, 2023, at 1:24 PM, Jonathan Corbet wrote:
> Sohil Mehta <sohil.mehta@intel.com> writes:
>
>> The default vsyscall mode has been updated from emulate to xonly for a
>> while. Update the kernel-parameters doc to reflect that.
>>
>> Fixes: 625b7b7f79c6 ("x86/vsyscall: Change the default vsyscall mode to xonly")
>> Cc: Andy Lutomirski <luto@kernel.org>
>> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
>> Reviewed-by: Tony Luck <tony.luck@intel.com>
>> ---
>> Do documentation fixes typically get backported to stable? I haven't included
>> a stable cc assuming they do not.
>>
>>  Documentation/admin-guide/kernel-parameters.txt | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> Applied, thanks.

Belated ack!  Sohil, thanks for the fix.

>
> jon
