Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C3AC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 17 Mar 2022 13:34:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbiCQNfO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Mar 2022 09:35:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234604AbiCQNfO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Mar 2022 09:35:14 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C41BBE37
        for <linux-doc@vger.kernel.org>; Thu, 17 Mar 2022 06:33:57 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:35::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 1E9C6383;
        Thu, 17 Mar 2022 13:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1E9C6383
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1647524037; bh=jh4yklkR0A96/93mHLCG60KBxom+st5XJiYrynaXq/U=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=i0EFp4jkmXfxgcCccg9Irf77xcA+GoHzB0VAuNbbmoV8vPaaCyieU7TZhbZMgzooA
         0mL+5SLG0qYUpNnCjEaz2unNU6gn9qsLXJpkMi7sN6Wo+c9tnYhCJECHUGo3K/RjBH
         pqMGTocQGhMtkOQOX2pt8jP6NUmlCWg2jOWNz/TUlxK00NXPTDZ5fLJ5ITb5218lK7
         D+G5yqux7xQMJ42M3NrsSHwqwKEd/4ZXeRLPhDF/D6HtxqqtTp/jAjjE8iAXqGT3vL
         dJVEZuehr5khslZ2gRYHkko+q8pcRPwYnHvKx6+2r+udLjdWZlF5SfK3qyhfVM1SNO
         vYb32fGPiui/Q==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     linux-doc@vger.kernel.org, mingo@redhat.com, peterz@infradead.org,
        siyanteng01@gmail.com, siyanteng@loongson.cn,
        tangyeechou@gmail.com, tangyizhou@huawei.com, zhengbin13@huawei.com
Subject: Re: [PATCH v2] docs: scheduler: Convert schedutil.txt to ReST
In-Reply-To: <8c36fd06-b378-409b-6772-972b76cf630c@gmail.com>
References: <871qz1txmp.fsf@meer.lwn.net>
 <8c36fd06-b378-409b-6772-972b76cf630c@gmail.com>
Date:   Thu, 17 Mar 2022 07:33:56 -0600
Message-ID: <87y218r9dn.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Akira Yokosawa <akiyks@gmail.com> writes:

> Hi Jon,
>
> On Wed, 16 Mar 2022 15:07:10 -0600
> Jonathan Corbet <corbet@lwn.net> wrote:
>
>> I have applied this version.
>
> Jon, I think you missed Peter'z (implied) Nak on this conversion.
>
> Quote from Peter's message [1]:
>
>> As I'm sure you're aware, I'd *love* to convert the whole lot to plain
>> text again :-)
>> 
>> People, throughout the ages, have been able to read plain text, I don't
>> see why it should be made more difficult than that.
>
> I'd recommend you to drop this from docs-next for now.
> I think this should go through -tip.

I interpreted Peter's response differently.  I invited him to express
his opposition to *this patch* and he didn't do that.  As we know, Peter
does not suffer from an inability to express his thoughts explicitly and
succinctly; "implied NAK" is not normally his way.

Or are you saying that I should follow his message to the letter and
back out the entire RST conversion? :)

jon
