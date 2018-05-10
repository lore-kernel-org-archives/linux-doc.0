Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EA94C7DE79
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 May 2018 16:33:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S966376AbeEJQds (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 May 2018 12:33:48 -0400
Received: from merlin.infradead.org ([205.233.59.134]:45690 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965017AbeEJQdr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 May 2018 12:33:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=kuC3vHgFv91dwGAusfXiLs77jtXyMRdINpInbIDzB6I=; b=P6oJx6evsrPlVgnZ9Z4AOt9Wca
        phghzbFfm7btbMctb8BqpZ3/Uforxb2vl7i7mJ9rlfR0XXX9YrlFlj1cRYlX7m8OR9r/zmrT8arn0
        ViqxzzR6b4eEklRvNGfgRMY8SxVNh+GZcEpPgChbKCkqEORLlf+IMPNQ87L8KJ91kQ0tCrUu4qzhL
        3Ds6K4G8Q3KODDVwD8JAWkd9c8tYMnw7Pd1KHawUJS4JgKjCBpCpJFJ2/W89GCNH7JwdLD+oGasN4
        RxYykxuxnLMqiHY6/qr3TIFjTt06gm4NrPWj14l8PlzAHAp62fg6O/rCA/6sP5CtMWwHNDHFEtfML
        YfdFU28g==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fGoVk-0001Wo-2U; Thu, 10 May 2018 16:33:44 +0000
Subject: Re: [RFC PATCH 2/2] wait: add a keyword to indicate a diagram code
 block on a kernel-doc
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab@infradead.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
References: <2ac6e3da22119f714406925139e40f4d835d11a4.1525962971.git.mchehab+samsung@kernel.org>
 <dfe40a6f75e9bd445ea36218dbcf367090b2367b.1525962971.git.mchehab+samsung@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f0c8a649-5304-b9e9-975e-e80fa3a4c44e@infradead.org>
Date:   Thu, 10 May 2018 09:33:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <dfe40a6f75e9bd445ea36218dbcf367090b2367b.1525962971.git.mchehab+samsung@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/10/2018 07:38 AM, Mauro Carvalho Chehab wrote:
> When handling code-blocks, usual parsing should be disabled.
> Indicate it by using the keyword disagram.

                                   diagram.

Please add such keyword(s) to one of Documentation/doc-guide/{kernel-doc,sphinx}.rst.

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  include/linux/wait.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/wait.h b/include/linux/wait.h
> index d9f131ecf708..653814475ee9 100644
> --- a/include/linux/wait.h
> +++ b/include/linux/wait.h
> @@ -101,7 +101,7 @@ init_waitqueue_func_entry(struct wait_queue_entry *wq_entry, wait_queue_func_t f
>   * lead to sporadic and non-obvious failure.
>   *
>   * Use either while holding wait_queue_head::lock or when used for wakeups
> - * with an extra smp_mb() like:
> + * with an extra smp_mb() as shown in this diagram:
>   *
>   *      CPU0 - waker                    CPU1 - waiter
>   *
> 


-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
