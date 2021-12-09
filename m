Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E43C433EF
	for <linux-doc@archiver.kernel.org>; Thu,  9 Dec 2021 14:37:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238802AbhLIOlA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 09:41:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238714AbhLIOkz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Dec 2021 09:40:55 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1DA1C0617A1
        for <linux-doc@vger.kernel.org>; Thu,  9 Dec 2021 06:37:21 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id iq11so4571922pjb.3
        for <linux-doc@vger.kernel.org>; Thu, 09 Dec 2021 06:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:references:subject:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=s+guWAWkvb8XYKPmjFmWLaye95sRI2OREc6lkm5x0ik=;
        b=o06mkmPQf46/oWy6J8ZDEjTjo7/+7fo6U5esgHVkYF9M3AlsVq7PF3gP1EyrgQXkNZ
         A9Jcpv1e3qGtKiGCNPMXIBbNfj20lpTros7HvNvtCI72CMHoJXBwTTzc0zIro3vYsOw3
         7edk03/6ZcBvBnivON0H4M5eQukgwxG8S+SvPWXPLCP7KMgp3b3Nvw59lTNwvPD2+B4T
         xnZoQjOpjalvlRoziLYK64Dv8RBp68J2n1LL/wMp574QUN9SPS5P2sIQfNt+YU6+t3sF
         /frA4nyxE2Q3rOMi0dXpLQC1WDxpvpQ8aX/2/ChQ37cp/IUqSwEWIOqYp1HnLNdRzXM0
         fpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:subject:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s+guWAWkvb8XYKPmjFmWLaye95sRI2OREc6lkm5x0ik=;
        b=3goqoqQfaIt3+KL3s2fd6HyfiCMpe/f+YmxG4UYYu2nQ2gt051o4TUkdESri3A48B3
         6tgL8gFXRo0GUy2heRByQnwQdFlv9tDIcABDpfrS6Spe2ioeN6DWO6izhz5yTKT2aIuq
         Z+l59nFwplyutlu/J0Oo7UaGqURveTDNWkzQyFc/zuLYXCoSfqlqXojp/duBfgB3j5x8
         Z8cu1L3KwYGuM0BTxNaObKRMFoo7EPySp464q7oVtDTs9ca86a32yEN5oXCMRBvQah5P
         PUxbAbtNBgWp1LxSUjAxTgAUfZpP9I1wJtr96/7UY1rETtBpEVHmIJvC3dcxO9JdA4PN
         jcUg==
X-Gm-Message-State: AOAM530WcrzCNPSgYyUDMLVanMDXA290Ov/vT9xdI1PqcYn0M3OfeNQ0
        0Vg311hWdnl2Kq8K+2gm/4M=
X-Google-Smtp-Source: ABdhPJw7YOYpX05jXSZcTMCsc2+R3zBKP01qzqbWIp0nJIzWMcGDU0RaQaUBW0o4TljCB3w1zvpuzw==
X-Received: by 2002:a17:90a:df96:: with SMTP id p22mr16090607pjv.129.1639060641236;
        Thu, 09 Dec 2021 06:37:21 -0800 (PST)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id c2sm5894447pgh.64.2021.12.09.06.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 06:37:20 -0800 (PST)
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Masami Hiramatsu <mhiramat@kernel.org>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Yanteng Si <siyanteng@loongson.cn>
References: <20211209091133.558744-1-siyanteng@loongson.cn>
Subject: Re: [PATCH] docs/trace: fix a label of boottime-trace
From:   Akira Yokosawa <akiyks@gmail.com>
Message-ID: <374c6a63-c118-a60f-e455-3d4014f15cab@gmail.com>
Date:   Thu, 9 Dec 2021 23:37:16 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211209091133.558744-1-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Thu,  9 Dec 2021 17:11:33 +0800, Yanteng Si wrote:
> Since 559789539255 ("Documentation: tracing: Add histogram syntax to boot-time tracing") which
> introduced a warning:
> 
> linux/Documentation/trace/boottime-trace.rst:136: WARNING: undefined label: histogram (if the link has no caption the label must precede a section header)
> 
> Replace with:
>               :xxx: path
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/trace/boottime-trace.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/trace/boottime-trace.rst b/Documentation/trace/boottime-trace.rst
> index 6dcfbc64014d..efb75ec5bf48 100644
> --- a/Documentation/trace/boottime-trace.rst
> +++ b/Documentation/trace/boottime-trace.rst
> @@ -133,7 +133,7 @@ action option, there are tree-style options under per-event 'hist' subkey
>  for the histogram actions. For the detail of the each parameter,
>  please read the event histogram document [3]_.
>  
> -.. [3] See :ref:`Documentation/trace/histogram.rst <histogram>`
> +.. [3] See :histogram: Documentation/trace/histogram.rst

This does not look like a right change.
Where did that ":histogram:" come from?

        Thanks, Akira

>  
>  ftrace.[instance.INSTANCE.]event.GROUP.EVENT.hist.[N.]keys = KEY1[, KEY2[...]]
>    Set histogram key parameters. (Mandatory)
> -- 
> 2.27.0
