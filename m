Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD6BC4332F
	for <linux-doc@archiver.kernel.org>; Thu,  9 Dec 2021 16:59:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241706AbhLIRDb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:03:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241888AbhLIRDY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Dec 2021 12:03:24 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C8E1C061A72
        for <linux-doc@vger.kernel.org>; Thu,  9 Dec 2021 08:59:50 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d:444a:d152:279d:1dbb])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id EB6C02B7;
        Thu,  9 Dec 2021 16:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EB6C02B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1639069190; bh=eDGxw6uOJI0duGGCTrY80irf2x94zmBQbJJ63xdFEOY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=mZRorBZUHpXqc8UVGAQ306/6ef9xnwemqj3KUAzYgwN4SRHcu2EybLbFUexS0UvOv
         F2z6VVY+wnRqYo4pFxZO3ZEmY5WkpbUYHtN4N1tIaIZFExrWPqo7aBLMz26UKwIi/0
         QVrv5zcyjli5LJyCSz5cevsi7d6XUQjt+O985yf2PGDOzCOSjCHl2U2vC+NsMD8D94
         3NnKlT+NwA1ESVHc1cO6Zf02AF195PLAhOgmHpdOUFvuHPb2e69watbNASRbbOlp1t
         yWQkwYXIKUzAA9lEOnJd6cs343F7yJiQt/uST1lAv+lsckAsusbeeccF8YH9A35Uqg
         OG6k/lKzofKnA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Yanteng Si <siyanteng01@gmail.com>, mhiramat@kernel.org,
        rostedt@goodmis.org, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH] docs/trace: fix a label of boottime-trace
In-Reply-To: <20211210011758.0963cbb51a7d4752ccbfe957@kernel.org>
References: <20211209091133.558744-1-siyanteng@loongson.cn>
 <87y24tvnmo.fsf@meer.lwn.net>
 <20211210011758.0963cbb51a7d4752ccbfe957@kernel.org>
Date:   Thu, 09 Dec 2021 09:59:49 -0700
Message-ID: <87pmq5vhmi.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Masami Hiramatsu <mhiramat@kernel.org> writes:

> On Thu, 09 Dec 2021 07:50:07 -0700
> Jonathan Corbet <corbet@lwn.net> wrote:
>
>> I don't see that this is going to work either.  Is there any reason not
>> to just make the text read:
>> 
>>    please read the event histogram document Documentation/trace/histogram.rst
>> 
>> and let automarkup link it in?
>
> Hmm, I think we need the following change instead of this.
> (the label is not in this document, but in the target document.)
>
> diff --git a/Documentation/trace/histogram.rst b/Documentation/trace/histogram.rst
> index 859fd1b76c63..ea722eae2810 100644
> --- a/Documentation/trace/histogram.rst
> +++ b/Documentation/trace/histogram.rst
> @@ -1,3 +1,5 @@
> +.. _histogram:
> +

That would work, but it will have essentially the same effect as what I
suggested while adding extra markup.  I think we can leave the label out
and keep the plain-text a little cleaner.

Thanks,

jon
