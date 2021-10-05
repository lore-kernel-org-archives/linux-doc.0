Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC33C433F5
	for <linux-doc@archiver.kernel.org>; Tue,  5 Oct 2021 14:22:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AD846120F
	for <linux-doc@archiver.kernel.org>; Tue,  5 Oct 2021 14:22:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235294AbhJEOYt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Oct 2021 10:24:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234355AbhJEOYs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Oct 2021 10:24:48 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0627DC061749
        for <linux-doc@vger.kernel.org>; Tue,  5 Oct 2021 07:22:58 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id j11-20020a4a92cb000000b002902ae8cb10so6445093ooh.7
        for <linux-doc@vger.kernel.org>; Tue, 05 Oct 2021 07:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xF+jNwW5BFEV+lIRF79mZl5w3T2WmTQ1n+ANOqGSM58=;
        b=G6WOlcyfrBgIu0kBXl6Bx3ZoUEQr6/41sXdy6lq/sSgNafvyAemd+dwNdapXnV3vQ4
         UKifj/kxPStJlaVPMTA9ab+lLDZY4sQ2+f2wY++qX7vRBaVpW5zNTqa9fFNe98irLV3S
         GVWYWVhmPK8KnUJNQ+LADA8ROn56XNvBR+c+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xF+jNwW5BFEV+lIRF79mZl5w3T2WmTQ1n+ANOqGSM58=;
        b=TgOVsr3y8Ee+Wis9dVd9PJNu9rNqV3BgQUiyPD8bwCA0NPUo8Ls9779q4kvNexy40U
         cmhefFmTvlUXYKl3oyupG5L6bCgWvgcMmecCY6KywUoFMOX6vzzIQChuVqz4A01Qerx/
         Bq7ODsiAnclWGCM9P2CxuaO7eL3XsMx6pydIDfLnd6l0tJgajeV+KHvgnvExFN8yah35
         AEV6XvncVpOU6/mEjS7MHkjN1B/RAhfjgLX/fLz8twNNUMikZ2hvqSqWl0uyRwJ/jPbL
         FvdaTgpsvtLV5MyvrtwxBzlCzx8rMf3nShx3MceImYq8z2bIGzWrbv+Ur3PpdenRE5nt
         Qofg==
X-Gm-Message-State: AOAM530BG1TsxlV2a0hvfmRYRTKvSHcVtcR+0tqweyetp/QZaonLZUK7
        C7G5vKHRpaT3+Glj1woLT7Vt1Q==
X-Google-Smtp-Source: ABdhPJyBcGscPewH1ZEk7sJd92chljhW3DetsHnRNw1RAHBxKccwA91AIJhkvrbu0pKqg5g+Lc7jUQ==
X-Received: by 2002:a05:6820:358:: with SMTP id m24mr13754323ooe.34.1633443777284;
        Tue, 05 Oct 2021 07:22:57 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id v9sm1382374oth.62.2021.10.05.07.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Oct 2021 07:22:56 -0700 (PDT)
Subject: Re: [PATCH v1 2/6] mm/memory_hotplug: remove
 CONFIG_MEMORY_HOTPLUG_SPARSE
To:     David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Shuah Khan <shuah@kernel.org>, Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.de>,
        Mike Rapoport <rppt@kernel.org>, x86@kernel.org,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        virtualization@lists.linux-foundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20210929143600.49379-1-david@redhat.com>
 <20210929143600.49379-3-david@redhat.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <0489ea97-0a78-0299-335a-ca1166bb2735@linuxfoundation.org>
Date:   Tue, 5 Oct 2021 08:22:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210929143600.49379-3-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/29/21 8:35 AM, David Hildenbrand wrote:
> CONFIG_MEMORY_HOTPLUG depends on CONFIG_SPARSEMEM, so there is no need for
> CONFIG_MEMORY_HOTPLUG_SPARSE anymore; adjust all instances to use
> CONFIG_MEMORY_HOTPLUG and remove CONFIG_MEMORY_HOTPLUG_SPARSE.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   arch/powerpc/include/asm/machdep.h            |  2 +-
>   arch/powerpc/kernel/setup_64.c                |  2 +-
>   arch/powerpc/platforms/powernv/setup.c        |  4 ++--
>   arch/powerpc/platforms/pseries/setup.c        |  2 +-
>   drivers/base/Makefile                         |  2 +-
>   drivers/base/node.c                           |  9 ++++-----
>   drivers/virtio/Kconfig                        |  2 +-
>   include/linux/memory.h                        | 18 +++++++-----------
>   include/linux/node.h                          |  4 ++--
>   lib/Kconfig.debug                             |  2 +-
>   mm/Kconfig                                    |  4 ----
>   mm/memory_hotplug.c                           |  2 --
>   tools/testing/selftests/memory-hotplug/config |  1 -
>   13 files changed, 21 insertions(+), 33 deletions(-)
> 

>   {
> diff --git a/tools/testing/selftests/memory-hotplug/config b/tools/testing/selftests/memory-hotplug/config
> index a7e8cd5bb265..1eef042a31e1 100644
> --- a/tools/testing/selftests/memory-hotplug/config
> +++ b/tools/testing/selftests/memory-hotplug/config
> @@ -1,5 +1,4 @@
>   CONFIG_MEMORY_HOTPLUG=y
> -CONFIG_MEMORY_HOTPLUG_SPARSE=y
>   CONFIG_NOTIFIER_ERROR_INJECTION=y
>   CONFIG_MEMORY_NOTIFIER_ERROR_INJECT=m
>   CONFIG_MEMORY_HOTREMOVE=y
> 

For Kselftest change:

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
