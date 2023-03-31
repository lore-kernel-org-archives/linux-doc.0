Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535A6C6FD18
	for <linux-doc@archiver.kernel.org>; Fri, 31 Mar 2023 09:45:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231820AbjCaJpQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 31 Mar 2023 05:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232113AbjCaJpH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 31 Mar 2023 05:45:07 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F339777
        for <linux-doc@vger.kernel.org>; Fri, 31 Mar 2023 02:44:50 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id t10so87156404edd.12
        for <linux-doc@vger.kernel.org>; Fri, 31 Mar 2023 02:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google; t=1680255887;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ojIigKKb4lX50seD+r4LK2VBtF1oxiuySnQx5T9yLKM=;
        b=SGm3jlndegPmQiUUfg/Z5lk0Mz2MCPTRgeR8JQizpHp6ESfVhi4iDD6zpByLQEdD7/
         oKeQdqE/oC5Ak6OIpGMEmlNGcJvNCFppT4gUE55XeiQbvuf8KUusEauDcZntvxoiBCXf
         QEZ/HPuq2+HiD0u1l0H1twwiICj4d3CRd6Rb0S8yKSRCLcuAeHOxsslppz8dhZJ/CHOQ
         H0SgKeyrmBsYhegda/A1dJTj6XuDExyixqj7IbjqaWLJ3FtovaVL4xPSdpJzB/PngUYF
         cQr7apDAy/11SOdQwsAv32AYdD6VdJscKALIe95v5b8AlgvKBd39NQ4wx0X+mDEeIjF/
         Qs8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680255887;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ojIigKKb4lX50seD+r4LK2VBtF1oxiuySnQx5T9yLKM=;
        b=nDMxQz+yq3PLKbl7r4Qs/dsc22Ehc1dKPp59cUk7v3tpwQzSNkWWCkd6uXZ5ehiQ2p
         NHs+0uP85WHFK1fLbz+PlKJh7+cfIMY05ULYfd6NT40qMka+Q0d+79/8h8h9ZVVGgiJK
         6l/+oAWpNw5fckZmdwH86TIamb2kxHPYLdv9oD0AQWAt2vRQDuPh+WbPa2UXy/JgqqLZ
         NpaVNPutJEpJlsCiGc/0txTRhzX7vISF3nbdG50jUavwiMHOwT2NJGuar/esiOFT2X8T
         cHnGnSy0KPg/Y6JhInOJtE723KYSe/iUIcRkZ6ds0DHePIU2EzzZkgfx+bKc/qkEMDkm
         iXxw==
X-Gm-Message-State: AAQBX9czE2xjFMvA+LA4V2h0u2yOcNRU6EPxbhm4lXG96VUkDfQsljuk
        Zxn9imSjs/iLa50OlR1n0D9r2g==
X-Google-Smtp-Source: AKy350ZCmmubrfuVppv7kX+VgOSXjLcMMRRmyUpkkRsRiAykSjmJYcQ5zjnP73l2IJdnR4WGGMdAHQ==
X-Received: by 2002:a17:907:7701:b0:92f:efdc:610e with SMTP id kw1-20020a170907770100b0092fefdc610emr25137363ejc.66.1680255887209;
        Fri, 31 Mar 2023 02:44:47 -0700 (PDT)
Received: from [10.44.2.5] ([81.246.10.41])
        by smtp.gmail.com with ESMTPSA id r6-20020a05640251c600b004fd219242a5sm836854edd.7.2023.03.31.02.44.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 02:44:46 -0700 (PDT)
Message-ID: <ac473b8f-e7c1-edf9-9d9c-f1fd726e1e17@tessares.net>
Date:   Fri, 31 Mar 2023 11:44:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 4/4] checkpatch: check for misuse of the link tags
Content-Language: en-GB
To:     Thorsten Leemhuis <linux@leemhuis.info>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        =?UTF-8?Q?Kai_Wasserb=c3=a4ch?= <kai@dev.carbon-project.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mptcp@lists.linux.dev
References: <20230314-doc-checkpatch-closes-tag-v3-0-d1bdcf31c71c@tessares.net>
 <20230314-doc-checkpatch-closes-tag-v3-4-d1bdcf31c71c@tessares.net>
 <c2d5cc07-ec95-eb64-0cef-42f8378ea054@leemhuis.info>
From:   Matthieu Baerts <matthieu.baerts@tessares.net>
In-Reply-To: <c2d5cc07-ec95-eb64-0cef-42f8378ea054@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Thorsten,

On 31/03/2023 10:57, Thorsten Leemhuis wrote:
> On 30.03.23 20:13, Matthieu Baerts wrote:
>> "Link:" and "Closes:" tags have to be used with public URLs.
>>
>> It is difficult to make sure the link is public but at least we can
>> verify the tag is followed by 'http(s):'.
>>
>> With that, we avoid such a tag that is not allowed [1]:
>>
>>   Closes: <number>
>>
>> Link: https://lore.kernel.org/linux-doc/CAHk-=wh0v1EeDV3v8TzK81nDC40=XuTdY2MCr0xy3m3FiBV3+Q@mail.gmail.com/ [1]
>> Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>
>> [...]
>> +# Check for misuse of the link tags
>> +		if ($in_commit_log &&
>> +		    $line =~ /^\s*(\w+:)\s*(\S+)/) {
>> +			my $tag = $1;
>> +			my $value = $2;
>> +			if ($tag =~ /^$link_tags_search$/ && $value !~ /^https?:/) {
>> +				WARN("COMMIT_LOG_WRONG_LINK",
>> +				     "'$tag' should be followed by a public http(s) link\n" . $herecurr);
>> +			}
>> +		}
>> +
> 
> I must be missing something here, but it looks to me like this is
> checked twice now. See this line in patch2 (which is changed there, but
> the check itself remains):
> 
>> } elsif ($rawlines[$linenr] !~ m{^link:\s*https?://}i) {

If I'm not mistaken, we had the following checks:

- after Reported-by, there is a link tag (Link:|Closes:)
- (link tags can take more than 75 chars)
- tags followed by "http(s)://" are restricted to link ones

Then not: link tags (Link:|Closes:) are followed by "http(s):".

But maybe I missed something, the checkpatch.pl script is quite big, I
would not be surprised :-)

Cheers,
Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
