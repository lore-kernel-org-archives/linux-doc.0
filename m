Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACD3C07E96
	for <linux-doc@archiver.kernel.org>; Sun, 11 Jul 2021 15:22:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1EB7A611AD
	for <linux-doc@archiver.kernel.org>; Sun, 11 Jul 2021 15:22:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235483AbhGKPZj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 11 Jul 2021 11:25:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55012 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235477AbhGKPZi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 11 Jul 2021 11:25:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626016971;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VTnUpGQrEV+LSYMbonQQeBGOolBQlW/k+1JZ7zxRtwc=;
        b=NyIzS1euL60l2QsR8Na5PinMEy4wOvjY4avmZNFOV/SkXZxNkT2lX7gCzGGak/naUU9mP5
        mu3lFTdPH8a7a9bm85DYU+d7SYVMaP5kQqMV/w1t9w869Lyjaodkl3Jo0hK4yMkjz+DfzT
        vrEc+tvnK8IzVgLtjy+n6XJeHLTdbZA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-BWkxrkz6MFezSKSbCCOLVw-1; Sun, 11 Jul 2021 11:22:50 -0400
X-MC-Unique: BWkxrkz6MFezSKSbCCOLVw-1
Received: by mail-qk1-f199.google.com with SMTP id t144-20020a3746960000b02903ad9c5e94baso11709876qka.16
        for <linux-doc@vger.kernel.org>; Sun, 11 Jul 2021 08:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=VTnUpGQrEV+LSYMbonQQeBGOolBQlW/k+1JZ7zxRtwc=;
        b=EUL6h/rX3uNJM/dOLwR1g28sKBmEZy/Qpde1WJpsK+kySxNMzm/+GoptqfoEjQStPF
         1GB9n/dR2zy5iy0OylWZmJ6z0zV/tgL984MLyZTuK80+3GpQwp2eOKMKaKA98L3XJCi8
         f+lN2iWQAHjZ4wTAEBShvAc1JD5P+XbHZA8z+G7ZzxCKW0DRcXtAvOQjCwWKZQzWFKpw
         5Ljfi/jWMz28reaHakppQfm77/X+EkudfK8nlcdqdctp6lHtArFh458VxuPpJ3H/aCf+
         l+OSq2EYzUqixked3/Cyq+TzQoDYggqchbgKkfYuiY0ytjDg/uXDc0bfrW4HL3aWbdEI
         fhfA==
X-Gm-Message-State: AOAM531AACojWT25gL+G4RobJzg5neGhYQK+kNsvTlztwLweAz6WYElo
        lkAgb/nXz+x1vyXrybM+pGRjO4o6QRwL2BcMOIYwtDKzdimDn/FgNcwoJ2cuddpnv3FSVGLqtoU
        ravEKpJwr1soclyzl+wVYe3RzKn9iMdOqTtkbZxwT90WklwL9PwhT3ImVZjL5zrY6YaY5
X-Received: by 2002:a37:b0a:: with SMTP id 10mr1347235qkl.291.1626016969708;
        Sun, 11 Jul 2021 08:22:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNLdwFZM7zPxEdkWxzuSN3LFaXjkzAGfA1VfJCMjMZ/geXXJIWsoquAERpxBvyIEk6lhhTDQ==
X-Received: by 2002:a37:b0a:: with SMTP id 10mr1347214qkl.291.1626016969501;
        Sun, 11 Jul 2021 08:22:49 -0700 (PDT)
Received: from llong.remote.csb ([2601:191:8500:76c0::cdbc])
        by smtp.gmail.com with ESMTPSA id l6sm5345585qkk.117.2021.07.11.08.22.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jul 2021 08:22:49 -0700 (PDT)
From:   Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v1 3/3] locking/lockdep,doc: Correct the max number of
 lock classes
To:     Xiongwei Song <sxwjean@me.com>, peterz@infradead.org,
        mingo@redhat.com, will@kernel.org, boqun.feng@gmail.com
Cc:     linux-kernel@vger.kernel.org, Xiongwei Song <sxwjean@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20210711141430.896595-1-sxwjean@me.com>
 <20210711141430.896595-3-sxwjean@me.com>
Message-ID: <93ccb871-7f57-9109-9072-8fc26f3b811c@redhat.com>
Date:   Sun, 11 Jul 2021 11:22:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210711141430.896595-3-sxwjean@me.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/11/21 10:14 AM, Xiongwei Song wrote:
> From: Xiongwei Song <sxwjean@gmail.com>
>
> The max number of lock classes is 8192.
>
> Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---
>   Documentation/locking/lockdep-design.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/locking/lockdep-design.rst b/Documentation/locking/lockdep-design.rst
> index 82f36cab61bd..5c2dcec684ff 100644
> --- a/Documentation/locking/lockdep-design.rst
> +++ b/Documentation/locking/lockdep-design.rst
> @@ -341,7 +341,7 @@ Exceeding this number will trigger the following lockdep warning::
>   
>   	(DEBUG_LOCKS_WARN_ON(id >= MAX_LOCKDEP_KEYS))
>   
> -By default, MAX_LOCKDEP_KEYS is currently set to 8191, and typical
> +By default, MAX_LOCKDEP_KEYS is currently set to 8192, and typical
>   desktop systems have less than 1,000 lock classes, so this warning
>   normally results from lock-class leakage or failure to properly
>   initialize locks.  These two problems are illustrated below:
> @@ -383,7 +383,7 @@ you the number of lock classes currently in use along with the maximum::
>   
>   This command produces the following output on a modest system::
>   
> -	lock-classes:                          748 [max: 8191]
> +	lock-classes:                          748 [max: 8192]
>   
>   If the number allocated (748 above) increases continually over time,
>   then there is likely a leak.  The following command can be used to

Acked-by: Waiman Long <longman@redhat.com>

