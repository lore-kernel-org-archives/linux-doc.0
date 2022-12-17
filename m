Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60319C4332F
	for <linux-doc@archiver.kernel.org>; Sat, 17 Dec 2022 10:02:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbiLQKCg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 17 Dec 2022 05:02:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbiLQKCf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 17 Dec 2022 05:02:35 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E03A6E033
        for <linux-doc@vger.kernel.org>; Sat, 17 Dec 2022 02:02:33 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id kw15so11379513ejc.10
        for <linux-doc@vger.kernel.org>; Sat, 17 Dec 2022 02:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p+u+CGb7Yuv+MW0kOaj7dOs/W6xktBydlnkGc7+xHlE=;
        b=mUj3tWbQktgVRdxMAJJO+uru+5kagDNSsWO9HUkyddtUqJ+uF+djColfpRVOglbF+/
         cz1L2aUsdhBlqR8uXpsWv/3Ah3spdj1OlVE+tVAFO01TGGnL9KZguEkQv6eCcvsVlhGb
         UafyfUUzC7OITS9AOvMfvJed2pef3r9sOwf9teX1Anlzz99poTZp6esa7iBJBgDQ0jKZ
         sMV+3Nd/XRnWixFq/SuI1LptIg8gq9OypmiV7GrufHv4m7oR5vPdg4JvypXUGYy8vW56
         gHRaOBLXAak/NdbGrmBJgSJcLR+VpvPJ3RHQOpe0X4S3u0+ztXID0i0ejJMUAW8zjJb2
         VVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p+u+CGb7Yuv+MW0kOaj7dOs/W6xktBydlnkGc7+xHlE=;
        b=nC3/AeliHkuhh+TtuKxLJYjFALAFsVrmCn+ireZxEzhtDpvvrGqXuPAS8mX5FkK6hC
         Px+lMNiC2mYo30yR9EhY7v1x/xNwzwVsPnPcXSjWhzY0acNNVKkCfXMK0UJG+0zOFbCg
         pKIqhV75LcWyaajC62zsyzf7oJ77rfHOfbrM2ESMoa3LH6drZ6oJV2m7voDF9RV6Egnu
         OGosFzOCMzoQdwhMxedxWiJ44XDShUJv+v2vm8BBB0eybeU2wPR8cU+iS0frbIM8RXYC
         DRgWb5vN1tU1CRSrH+63XRW+piLwLsu3DStWMIYL9W+zQ96NaWdRiHVfNjxRYf4SXZCA
         Nlxg==
X-Gm-Message-State: ANoB5pmpCyG30q4w/Y2pQy1+VbSHzuYHEi8jU+8KMq4fxNk5FgvwNrIH
        GgAQ+z3VjwHQOU8vJIJDsgKdtl7G2MZl/jI9jjM=
X-Google-Smtp-Source: AA0mqf6tG90CZ3sfht96CJYgAbLtOiy2AS99221qR/9LkQ5EvwDNSnhhi8L9gyx+4rTrpwZTOGIZiw==
X-Received: by 2002:a17:906:3c15:b0:7c1:4d21:abb7 with SMTP id h21-20020a1709063c1500b007c14d21abb7mr26509622ejg.54.1671271352448;
        Sat, 17 Dec 2022 02:02:32 -0800 (PST)
Received: from ?IPV6:2003:d9:972b:1f00:3e55:a4ce:cea1:d3ce? (p200300d9972b1f003e55a4cecea1d3ce.dip0.t-ipconnect.de. [2003:d9:972b:1f00:3e55:a4ce:cea1:d3ce])
        by smtp.googlemail.com with ESMTPSA id n6-20020a05640204c600b004702caff4f6sm1800116edw.73.2022.12.17.02.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 02:02:31 -0800 (PST)
Message-ID: <869cef04-e2f8-30f5-3680-ce12f70ea3f7@colorfullife.com>
Date:   Sat, 17 Dec 2022 11:02:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] docs: kernel-hacking: discourage from calling
 disable_irq() in atomic
To:     "A. Sverdlin" <alexander.sverdlin@siemens.com>,
        linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
References: <20221212163715.830315-1-alexander.sverdlin@siemens.com>
Content-Language: en-US
From:   Manfred Spraul <manfred@colorfullife.com>
In-Reply-To: <20221212163715.830315-1-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Alexander,

On 12/12/22 17:37, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>
> Correct the example in documentation so that disable_irq() is not being
> called in atomic context and remove the comment allowing to do so "with
> care" from the function header itself.
>
> disable_irq() calls sleeping synchronize_irq(), it's not allowed to call
> them in atomic context.
>
> Link: https://lore.kernel.org/lkml/87k02wbs2n.ffs@tglx/
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Reviewed-by: Manfred Spraul <manfred@colorfullife.com>

(but check below, I would prefer if the change to kernel/irq/manage.c is 
dropped.

> ---
>   Documentation/kernel-hacking/locking.rst                    | 4 ++--
>   Documentation/translations/it_IT/kernel-hacking/locking.rst | 4 ++--
>   kernel/irq/manage.c                                         | 2 --
>   3 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
> index 6805ae6e86e65..95fd6e0900d92 100644
> --- a/Documentation/kernel-hacking/locking.rst
> +++ b/Documentation/kernel-hacking/locking.rst
> @@ -1274,11 +1274,11 @@ Manfred Spraul points out that you can still do this, even if the data
>   is very occasionally accessed in user context or softirqs/tasklets. The
>   irq handler doesn't use a lock, and all other accesses are done as so::
>   
> -        spin_lock(&lock);
> +        mutex_lock(&lock);
>           disable_irq(irq);
>           ...
>           enable_irq(irq);
> -        spin_unlock(&lock);
> +        mutex_unlock(&lock);
>   
>   The disable_irq() prevents the irq handler from running
>   (and waits for it to finish if it's currently running on other CPUs).
> diff --git a/Documentation/translations/it_IT/kernel-hacking/locking.rst b/Documentation/translations/it_IT/kernel-hacking/locking.rst
> index 51af37f2d6210..bfbada56cf351 100644
> --- a/Documentation/translations/it_IT/kernel-hacking/locking.rst
> +++ b/Documentation/translations/it_IT/kernel-hacking/locking.rst
> @@ -1309,11 +1309,11 @@ se i dati vengono occasionalmente utilizzati da un contesto utente o
>   da un'interruzione software. Il gestore d'interruzione non utilizza alcun
>   *lock*, e tutti gli altri accessi verranno fatti così::
>   
> -        spin_lock(&lock);
> +        mutex_lock(&lock);
>           disable_irq(irq);
>           ...
>           enable_irq(irq);
> -        spin_unlock(&lock);
> +        mutex_unlock(&lock);
>   
>   La funzione disable_irq() impedisce al gestore d'interruzioni
>   d'essere eseguito (e aspetta che finisca nel caso fosse in esecuzione su

> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
> index 40fe7806cc8c9..2054de5bf3c53 100644
> --- a/kernel/irq/manage.c
> +++ b/kernel/irq/manage.c
> @@ -722,8 +722,6 @@ EXPORT_SYMBOL(disable_irq_nosync);
>    *	This function waits for any pending IRQ handlers for this interrupt
>    *	to complete before returning. If you use this function while
>    *	holding a resource the IRQ handler may need you will deadlock.
> - *
> - *	This function may be called - with care - from IRQ context.
>    */
>   void disable_irq(unsigned int irq)
>   {

Can you drop this part?

I haven't noticed that you added this change into the patch, and thus I 
created a seperate patch.

https://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new.git/tree/patches/kernel-irq-managec-disable_irq-might-sleep.patch

As core difference: I've added a might_sleep() into disable_irq().


--

     Manfred

