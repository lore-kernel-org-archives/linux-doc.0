Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CE2C433B4
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 13:06:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1745C61159
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 13:06:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233070AbhEFNHT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 May 2021 09:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232750AbhEFNHS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 May 2021 09:07:18 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89028C061574
        for <linux-doc@vger.kernel.org>; Thu,  6 May 2021 06:06:20 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id t4so8241754ejo.0
        for <linux-doc@vger.kernel.org>; Thu, 06 May 2021 06:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KWJg+Vt3Q8NVH2ewzCg+bN0L04a/eNeDOHTWG7S8+10=;
        b=TEUqXuWA7rir5GMdojTKBQi0ozHKO/kw2Kyn2TmsraaXDBG0RE/vEg0hCoiED19Ysh
         YemqzZVLc/nzKTawNq7bAwRzhgOvdyzbCQtBOE8B2RGxOXGZWra//4uGWU9VIUIW0lRm
         bSZZlnXHg+plaV5Aza1BbWzs+BJ6laNTL5IRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KWJg+Vt3Q8NVH2ewzCg+bN0L04a/eNeDOHTWG7S8+10=;
        b=STKp4K3lcYJX+N6eIGFDOgzNZqYK26RLdxpWmYUOX9giwGLfp5/pESSYDwFp2DBeN9
         vxcnMRkqAjyJEjNxF+K1dzkOINpAT5fE3D10MeENnEgbp/UfdBkXwxKb2oFMjbYEDzOt
         hagLZZ/EAYa9Z33uF5UMYTtLtlYLnrT0ZmidIhPi/05UfrMmGfeNUta5XkYrtKR7VLCh
         GYZQrzYAiiuvkvKGIvYWw/hCGjhMxjL0nUDgUau0qDVlTY8WNUJF5Uob2mhqk7G/E19d
         mmt6Wb3D2aAUaUPQakIvjYVO4mWjykRXpe9hBnfcvuHxPEPpsFdjtXWPSyRokjpFCcTT
         6V3g==
X-Gm-Message-State: AOAM532/1j2qv6jGJ5P4oVDLQqAPUAMIbvxb+2ApiQcu3u6hsITbaBOB
        dUBs8ZUL6Z+aHZphpJYGYAsXkw==
X-Google-Smtp-Source: ABdhPJxGoEZFw1zzzvPrZ6QjKuGkiPMEf/oV0Q5C+88F8WrG/wmLZSf6SCZIQjq46irVRTAM2LD5iQ==
X-Received: by 2002:a17:906:46d0:: with SMTP id k16mr4295291ejs.105.1620306379262;
        Thu, 06 May 2021 06:06:19 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.71.248])
        by smtp.gmail.com with ESMTPSA id l26sm1368799ejz.27.2021.05.06.06.06.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 May 2021 06:06:18 -0700 (PDT)
Subject: Re: [PATCH] docs: admin-guide: update description for kernel.hotplug
 sysctl
To:     Jonathan Corbet <corbet@lwn.net>,
        Kay Sievers <kay.sievers@vrfy.org>,
        Greg Kroah-Hartman <gregkh@suse.de>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210420120638.1104016-1-linux@rasmusvillemoes.dk>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <58ed4157-b8f8-be1b-65f7-89fc2e318a43@rasmusvillemoes.dk>
Date:   Thu, 6 May 2021 15:06:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210420120638.1104016-1-linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 20/04/2021 14.06, Rasmus Villemoes wrote:
> It's been a few releases since this defaulted to /sbin/hotplug. Update
> the text, and include pointers to the two CONFIG_UEVENT_HELPER{,_PATH}
> config knobs whose help text could provide more info, but also hint
> that the user probably doesn't need to care at all.
> 
> Fixes: 7934779a69f1 ("Driver-Core: disable /sbin/hotplug by default")
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

Ping.

> ---
>  Documentation/admin-guide/sysctl/kernel.rst | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index 1d56a6b73a4e..c24f57f2c782 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -333,7 +333,12 @@ hotplug
>  =======
>  
>  Path for the hotplug policy agent.
> -Default value is "``/sbin/hotplug``".
> +Default value is ``CONFIG_UEVENT_HELPER_PATH``, which in turn defaults
> +to the empty string.
> +
> +This file only exists when ``CONFIG_UEVENT_HELPER`` is enabled. Most
> +modern systems rely exclusively on the netlink-based uevent source and
> +don't need this.
>  
>  
>  hung_task_all_cpu_backtrace
> 

