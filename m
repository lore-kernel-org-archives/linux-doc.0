Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	BUG6152_INVALID_DATE_TZ_ABSURD,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INVALID_DATE_TZ_ABSURD,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88B2C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jan 2021 09:17:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56FD3207B6
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jan 2021 09:17:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbhAYJQq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Jan 2021 04:16:46 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:41062 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725880AbhAYJQQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jan 2021 04:16:16 -0500
From:   John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1611566008;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1SzT8fhkwfFKbfCPU3fuEttqP1gLZLOTt/FXQd2bkSA=;
        b=BiBU5RXdSdRec9ID8ZHHdI+sdnr0B32b1USYrr1AlfjfDJeo61hZ7IZELjRpycTkk1Ed+K
        Hproqo/2PP1z2wd4OCyAazDx58ET2NnbYHGMTLDKyihduvB6/yVR6TTCbUWZ3yJSVGvjla
        WGNIaQ513fiu+J130oRhTaAqzF/q2+o8vULAMHpmzmKkdueq0hy0i4u4n8ZtIiEQwX/WbP
        7kwpkG8bsrUVTlGhC6YsynjMU4y/WiE85vJbhq32iuKr8d5G3AvKccnLLPk+Jehtv95Vdz
        AJr0xL14Po4yMVCuaUXYir6uXd0J9bauKNcBxE8PqSWIzDBQCz3aHVjpIgLjWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1611566008;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1SzT8fhkwfFKbfCPU3fuEttqP1gLZLOTt/FXQd2bkSA=;
        b=cASJ6+XnJgaIbrx16wVIrE7BEnVmugMQbrKqSDPjRLshvDIvOQc/0Y6FxjHA+dqW62/+ed
        dxID6TtNXhzHB3CA==
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] printk: rectify kernel-doc for prb_rec_init_wr()
In-Reply-To: <20210125081748.19903-1-lukas.bulwahn@gmail.com>
References: <20210125081748.19903-1-lukas.bulwahn@gmail.com>
Date:   Mon, 25 Jan 2021 10:19:26 +0106
Message-ID: <871re94bwp.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2021-01-25, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> The command 'find ./kernel/printk/ | xargs ./scripts/kernel-doc -none'
> reported a mismatch with the kernel-doc of prb_rec_init_wr().
>
> Rectify the kernel-doc, such that no issues remain for ./kernel/printk/.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: John Ogness <john.ogness@linutronix.de>

> ---
> applies cleanly on v5.11-rc5 and next-20210122
>
> John, please ack.
> Petr, please pick this minor typo fixup.
>
>  kernel/printk/printk_ringbuffer.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/printk/printk_ringbuffer.h b/kernel/printk/printk_ringbuffer.h
> index 5dc9d022db07..73cc80e01cef 100644
> --- a/kernel/printk/printk_ringbuffer.h
> +++ b/kernel/printk/printk_ringbuffer.h
> @@ -287,7 +287,7 @@ _DEFINE_PRINTKRB(name, descbits, avgtextbits, &_##name##_text[0])
>  /* Writer Interface */
>  
>  /**
> - * prb_rec_init_wd() - Initialize a buffer for writing records.
> + * prb_rec_init_wr() - Initialize a buffer for writing records.
>   *
>   * @r:             The record to initialize.
>   * @text_buf_size: The needed text buffer size.
> -- 
> 2.17.1
