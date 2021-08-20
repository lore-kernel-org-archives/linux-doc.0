Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A5BC4338F
	for <linux-doc@archiver.kernel.org>; Fri, 20 Aug 2021 15:52:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE32D6113E
	for <linux-doc@archiver.kernel.org>; Fri, 20 Aug 2021 15:52:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241134AbhHTPxC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 Aug 2021 11:53:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42792 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241039AbhHTPxB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Aug 2021 11:53:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629474743;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JlZGKQdLiYduLYkrU1ycwzHzZ/QPrtvBjhejt7xEWxE=;
        b=FD3IUmW5wOeh1WiNCZUeNRs/ar0AKJk4PisJqED4PayKk2+NPomEd3baDFrDyrpWBz7MDq
        w35zrGxiHyvFihX5eh4RSrxkRkxPf9uKEwSFJDIxyabbXUM98f2uMQOu/obIVHcdE2fpM5
        qls5iIoTf+4jrzoonAVjSLjfKOUKkoc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-DNHVXvXOPcWtZPuWIxrd0g-1; Fri, 20 Aug 2021 11:52:22 -0400
X-MC-Unique: DNHVXvXOPcWtZPuWIxrd0g-1
Received: by mail-wm1-f70.google.com with SMTP id v2-20020a7bcb420000b02902e6b108fcf1so4962880wmj.8
        for <linux-doc@vger.kernel.org>; Fri, 20 Aug 2021 08:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=JlZGKQdLiYduLYkrU1ycwzHzZ/QPrtvBjhejt7xEWxE=;
        b=kLabZpebFUNd3zmEyTWIp66XiKtjdSwMP8ftl+3blYF3yGr4iLjH7UYHULTucf0H7+
         HrVWRZvuYxWVUVZOXad9g/PL2L+a7UV0M6+J6VaXefDGek2RXCkIUwuraJVA9zES9I9m
         ZjgYKC99WUMx9HR3JGqNeiIjQFLI5BqP+5dtsMLB2jL/CjhqGaZsKLnO/LVauz+9uJ5o
         z2FJi1vXzwc+Rss8B1tR4JWdfP5T0HIP30x5ZjUZsQXwtRCepWAPaazMIG4ySOT1DR6/
         /OnOeN75kEWsPMeN1VwkuRUEHKFCobtAb+0OPWbgxU/Ru+fE6OkFo6B+S1CqNrj4rP3u
         hJog==
X-Gm-Message-State: AOAM530b5IlRne8AemfJNbYUHXj8H621TCCA+ftEL1ZwOLUkiugzd4Ay
        7MB3KRFlIuJue+AhccDNxtgT/Vyn7IW/wy1GrJN+5b2IpLvYQNR6G0Hh/X0OGlL8H7iUjMp4+8T
        u+A3S8FnXInuamklYpR4t
X-Received: by 2002:a7b:c112:: with SMTP id w18mr4714048wmi.60.1629474741076;
        Fri, 20 Aug 2021 08:52:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaJBeCrGw4MnIfr+I5SADEkPPbDd6DJwmXEz/DXBgKbV1Dt/yBLdB7ItdMspgW4ZXDhi9QGA==
X-Received: by 2002:a7b:c112:: with SMTP id w18mr4714020wmi.60.1629474740919;
        Fri, 20 Aug 2021 08:52:20 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f? (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de. [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
        by smtp.gmail.com with ESMTPSA id a18sm10107804wmg.43.2021.08.20.08.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Aug 2021 08:52:20 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] fs: warn about impending deprecation of mandatory
 locks
To:     Jeff Layton <jlayton@kernel.org>, torvalds@linux-foundation.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     ebiederm@xmission.com, willy@infradead.org,
        linux-nfs@vger.kernel.org, viro@zeniv.linux.org.uk,
        linux-doc@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
        linux-afs@lists.infradead.org, cluster-devel@redhat.com,
        ocfs2-devel@oss.oracle.com, linux-mm@kvack.org,
        akpm@linux-foundation.org, luto@kernel.org, bfields@fieldses.org,
        w@1wt.eu, rostedt@goodmis.org, stable@vger.kernel.org
References: <20210820135707.171001-1-jlayton@kernel.org>
 <20210820135707.171001-2-jlayton@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <0f4f3e65-1d2d-e512-2a6f-d7d63effc479@redhat.com>
Date:   Fri, 20 Aug 2021 17:52:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820135707.171001-2-jlayton@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 20.08.21 15:57, Jeff Layton wrote:
> We've had CONFIG_MANDATORY_FILE_LOCKING since 2015 and a lot of distros
> have disabled it. Warn the stragglers that still use "-o mand" that
> we'll be dropping support for that mount option.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>   fs/namespace.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/fs/namespace.c b/fs/namespace.c
> index ab4174a3c802..ffab0bb1e649 100644
> --- a/fs/namespace.c
> +++ b/fs/namespace.c
> @@ -1716,8 +1716,16 @@ static inline bool may_mount(void)
>   }
>   
>   #ifdef	CONFIG_MANDATORY_FILE_LOCKING
> +static bool warned_mand;
>   static inline bool may_mandlock(void)
>   {
> +	if (!warned_mand) {
> +		warned_mand = true;
> +		pr_warn("======================================================\n");
> +		pr_warn("WARNING: the mand mount option is being deprecated and\n");
> +		pr_warn("         will be removed in v5.15!\n");
> +		pr_warn("======================================================\n");
> +	}

Is there a reason not to use pr_warn_once() ?


-- 
Thanks,

David / dhildenb

