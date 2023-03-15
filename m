Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C2EC61DA4
	for <linux-doc@archiver.kernel.org>; Wed, 15 Mar 2023 18:29:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbjCOS3E (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Mar 2023 14:29:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbjCOS3D (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Mar 2023 14:29:03 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73BD114E83
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 11:29:02 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id x3so79038842edb.10
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 11:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google; t=1678904941;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gUbRckqd0nEijMwKi1AIDAn2hV+bXi7xjztBWswsvno=;
        b=rOXXdIV6t7rljnncFqewGcYEYMM70vXXYp1QPHopmQYJ+W2fffSxGPF4twuMFSOxU7
         o7VtNKS/bBt/SwRcQ86S/7ezQ+8nulUvIzlDEG6kgzkXGAwgbYfEEzkNnXqySdlJVGu8
         q34WpynDiyOgNTA824I7uRpRbDcWqWZtxTUi4QO9GdpHwDSYPoFqrA/IqbN6ZJyeWKSf
         bp5wndn8wY/IkprgrzI83ByQ8n9u+fUd4WhHtVoOzg8/MhwAh9O0TwIbUCbYvdsLqmJw
         4CqFhXr4pZD95k9Rc8oMOmSUrA2D5t0+8YsPCQ3d6al8KyGtq+VMsXCjaIIRTvubsDh4
         +fZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678904941;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gUbRckqd0nEijMwKi1AIDAn2hV+bXi7xjztBWswsvno=;
        b=PHGDdgSJA5f2SMTmfyNsYBm7BpCFo9p/LrhEI0bI7OBRYjKrTRAhpUdQtfsNAVoTX4
         jN5eWy07wG7cE0WY6KGusO02nMvMdM444q9I3OCp/EKwHVDXMq3l2Gitg2NY1w/dx9Wi
         00RIC+7KvZBpQh8KjyGbHWh9kxV4nRTWRgmmqs5cSzcTnFqhvMlUPYwPogbd30q/CVya
         nxNuBjjmG89DtaWuS3JE2lunqxrkb9H77ZNBEG5j7QSMnuEKfZCnBxflwbXVpy2Ef/WD
         GEweeDhKez+ViYBjsn9ciXlmnVLSVLQVpLhCTp+QIBh61cSux6qYxU7iZ+OOtbYQohue
         Bn8A==
X-Gm-Message-State: AO0yUKWRR4TCIzVDo8chKKwtIp0aqJiPlK0cyX9NO9TxYu9dYYObT5WR
        TLZFalHycFce5FZIM869yFhojQ==
X-Google-Smtp-Source: AK7set+YP4V7cNq9/LxvoeWy/yAlU4Q7AJ72zkkjPFDlO66C88+wzpH46jOzXNM2f55n5KV7XVlmHA==
X-Received: by 2002:aa7:c515:0:b0:4fc:c7c8:e78e with SMTP id o21-20020aa7c515000000b004fcc7c8e78emr3655713edq.25.1678904940825;
        Wed, 15 Mar 2023 11:29:00 -0700 (PDT)
Received: from [10.124.6.19] ([195.181.172.151])
        by smtp.gmail.com with ESMTPSA id b4-20020a50b404000000b004fcd78d1215sm2840392edh.36.2023.03.15.11.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 11:29:00 -0700 (PDT)
Message-ID: <5b92ed08-5a0c-7fcd-a75d-61cee3f28192@tessares.net>
Date:   Wed, 15 Mar 2023 19:28:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] docs: process: allow Closes tags with links
Content-Language: en-GB
To:     Jonathan Corbet <corbet@lwn.net>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        =?UTF-8?Q?Kai_Wasserb=c3=a4ch?= <kai@dev.carbon-project.org>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mptcp@lists.linux.dev
References: <20230314-doc-checkpatch-closes-tag-v1-0-1b83072e9a9a@tessares.net>
 <20230314-doc-checkpatch-closes-tag-v1-1-1b83072e9a9a@tessares.net>
 <87zg8dop1f.fsf@meer.lwn.net>
From:   Matthieu Baerts <matthieu.baerts@tessares.net>
In-Reply-To: <87zg8dop1f.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jon,

On 15/03/2023 19:19, Jonathan Corbet wrote:
> Matthieu Baerts <matthieu.baerts@tessares.net> writes:
> 
>> +In the same category as linking web pages, a special tag is also used to close
>> +issues but only when the mentioned ticketing system can do this operation
>> +automatically::
>> +
>> +        Closes: https://example.com/issues/1234
>> +
>> +Please use this 'Closes:' tag only if it helps managing issues thanks to
>> +automations. If not, pick the 'Link:' one.
> 
> So if there is a consensus for this, I can certainly apply the patch.
> 
> I do think, though, that if we accept this tag, we should ask that it
> only be used for *public* trackers.  A bunch of tags referring to
> internal trackers and such aren't going to be all that helpful.

Thank you for this feedback!

I agree, this should only refer to public bug trackers otherwise the
link is useless for most people.

In fact, that's what I wrote in submitting-patches.rst but I just
noticed I forgot to duplicate this into 5.Posting.rst. I can do that in
a v2 if there is no objection to allow this "Closes:" tag.

Cheers,
Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
