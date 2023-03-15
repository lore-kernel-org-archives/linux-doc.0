Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D95FFC61DA4
	for <linux-doc@archiver.kernel.org>; Wed, 15 Mar 2023 18:29:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbjCOS36 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Mar 2023 14:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232412AbjCOS3w (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Mar 2023 14:29:52 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E9838ABD4
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 11:29:42 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id y4so49680684edo.2
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 11:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google; t=1678904980;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wFueg1Re7r7oz+bq5GiyyDwW00ISWX7DiVqgOMzRA58=;
        b=z77gvtWr37A/s5VNJqbHRj5RMHdZyDNaJEFQwqIIut4z+DlUSrDiaHl4Kv474TkyTo
         PMtJeodhY9Sdc1cFqKmX02tf7fQ+YA1d30C+EOaFuIJrlIkavn22w+xZcGUZ+Fqtbo+r
         Egc9ZnO2h2BIuPSvNlvQPAEfy/3rhPfKKviynBm2JUBuf3BQCbvXz+Eg0fSuw5gvi7Pe
         6sA0vYN8/haAHMsNb/rZ/6C38LQP/w7PtgyMWswG/t67xwh0lVe2BX/zfDmadUHEdCUF
         rj0os6zkpLGszqEptTMycf7ZSZwPQUdWwhLpusTyJVsYFkLFOHPiUq+pUjjaBcKo3SsX
         X2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678904980;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wFueg1Re7r7oz+bq5GiyyDwW00ISWX7DiVqgOMzRA58=;
        b=RJk0e9ZQLzpmKhZklraEEHadAytu+3XLKhfly1eOPakQ7q7EwQ8CMOOGac4g9HfLcb
         KkBuK8kOWjxBFm05RfbXnpAPeMkjSAJIhEsWDA/bS1i6IohLKtzArXgHRgzORL25ayny
         /+rrenLU9zQ85H9MeB51QSYmlAEFOMfPNuA+oetl8aZoKy8QK5bE49B1+f/lcqGZMOMN
         M8HjBzKCeBtUI070yFyKZRevfHXaJxDkUXuD3g6zLRG4w9MZICKKDxZdXQmjV4XJk7Dw
         2s/HACNjURVvlm6YtC1KEMzVKG36QEck/RMXvwqwzfmhZ4ug915H7+GM8cKMTIYA9TqD
         x6gA==
X-Gm-Message-State: AO0yUKWlUlUVtlaa4qIXProwQqwct5pQUmLuSR2hws8f9qmNROxKqM1C
        cu9SX9pfO63AdGjSoSMQFvQyEw==
X-Google-Smtp-Source: AK7set9V2+oXGXLvqaa5erAztcj3u7fMWk+JUhyXOLyZzl8OTMMm30BM9l3QFu8UbAHFwKCWN/EDrg==
X-Received: by 2002:a17:906:7e4e:b0:929:bd3:eab4 with SMTP id z14-20020a1709067e4e00b009290bd3eab4mr7111332ejr.68.1678904980521;
        Wed, 15 Mar 2023 11:29:40 -0700 (PDT)
Received: from [10.124.6.19] ([195.181.172.151])
        by smtp.gmail.com with ESMTPSA id k1-20020a508ac1000000b004c0239e41d8sm2860526edk.81.2023.03.15.11.29.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 11:29:40 -0700 (PDT)
Message-ID: <1126b5c9-0742-0d3e-f483-8f08ea22aec4@tessares.net>
Date:   Wed, 15 Mar 2023 19:29:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] docs: process: allow Closes tags with links
Content-Language: en-GB
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        =?UTF-8?Q?Kai_Wasserb=c3=a4ch?= <kai@dev.carbon-project.org>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mptcp@lists.linux.dev
References: <20230314-doc-checkpatch-closes-tag-v1-0-1b83072e9a9a@tessares.net>
 <20230314-doc-checkpatch-closes-tag-v1-1-1b83072e9a9a@tessares.net>
 <20230315181205.f3av7h6owqzzw64p@meerkat.local>
From:   Matthieu Baerts <matthieu.baerts@tessares.net>
In-Reply-To: <20230315181205.f3av7h6owqzzw64p@meerkat.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Konstantin,

On 15/03/2023 19:12, Konstantin Ryabitsev wrote:
> On Wed, Mar 15, 2023 at 06:44:56PM +0100, Matthieu Baerts wrote:
>> Note that thanks to this "Closes" tag, the mentioned bug trackers can
>> also locate where a patch has been applied in different branches and
>> repositories. If only the "Link" tag is used, the tracking can also be
>> done but the ticket will not be closed and a manual operation will be
>> needed.
> 
> We will soon gain this ability on bugzilla.kernel.org as one of the features
> of the bugbot integration tool (which is still WIP).

Good news! This feature will be helpful for bugzilla users!

> So, if it helps, I
> support making this a recognized trailer.
Thank you for your support!

Cheers,
Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
