Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4252C32771
	for <linux-doc@archiver.kernel.org>; Sun, 18 Sep 2022 10:31:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbiIRKbb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 18 Sep 2022 06:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiIRKb3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 18 Sep 2022 06:31:29 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A44741E3D7
        for <linux-doc@vger.kernel.org>; Sun, 18 Sep 2022 03:31:27 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id o2so40181853lfc.10
        for <linux-doc@vger.kernel.org>; Sun, 18 Sep 2022 03:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ce5cvWhhANY4HGxf0tRAuv3blHoMqL+HG3bwTNXRg7o=;
        b=Cv2CnAB1JfcEP+Qy5kSj1OisEBQTHOgZCWQdVEyN3+Mw7zERm6O+cEMRyg7ye0Mst4
         wJZeoxG7W/cSqjAmthTQ6nwOcRaVBfElh02x5xuz1V1mx4Fg7CLL9bfu9rjgdlVF0SxA
         2pq8IeVOGLcA/W7jRYIUQ8gk/jgMrRExOig/Sp7mBOV69JqTsKRzO+YKwIa1wodOxO12
         1R5eCcqAOaPdKxGK3fpX0/PDMU4ZbxMRXdMr27cEy63fHDxCztyc3NjHCxXaAy6HrEXw
         r5Ph8WrazcmMTI/cO04jF8kh+kDe5POzr5yce5IoJNjqmWMHT+BemfAJIeXRaxW4Y/h1
         KSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ce5cvWhhANY4HGxf0tRAuv3blHoMqL+HG3bwTNXRg7o=;
        b=McAIL124PUknnXsWYN5FR9fvhmibJBM6jwIa0Q8RmipDRZuwDwzOGpWUeiy9FQN/HO
         Wu2UkYaiUt+m5uGn+RNDGenxswff4xfjVpZgVpuiCNnhhy/kNWzhGynI0jjRWEk8HjCZ
         tdOQia/C5pU9s5d6dJ2LU/MGxQcX9J75htybNCP8CYIeRS48AC8SfZKvu/mQ0IohiKSg
         c9nPvR9Cx9hog7Gt5UMNRaPqTSZuEUb3rtER8mTV+DRe1rgTLmJR/44ZWALZKX6XFe3z
         nnqQ6AM4rLirOv3ard0fOhwGawCQzWcZorp1nqfxWMe1Jlie7gPW2AEGTx4WuAYexDfv
         5o+A==
X-Gm-Message-State: ACrzQf3Felr9RaJgJ6m4VYDuMsnjt1mV9YXYAQJQSx3jbLdeZ/3YhYqm
        QqZXRToyBBIdPvfujebwUIZNGQ==
X-Google-Smtp-Source: AMsMyM7THgRl7Dnqhj2HSj/pZd9M2s5IOoboHhohsTf6Oa+HUuxAmeG5E2XNuG5sTqaWF+zqk4TBsg==
X-Received: by 2002:a05:6512:1188:b0:499:6fbf:d751 with SMTP id g8-20020a056512118800b004996fbfd751mr4618770lfr.51.1663497085827;
        Sun, 18 Sep 2022 03:31:25 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o19-20020a056512053300b0049496608d58sm4589948lfc.155.2022.09.18.03.31.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Sep 2022 03:31:25 -0700 (PDT)
Message-ID: <07d87203-6fe1-c612-cb79-9080e1988454@linaro.org>
Date:   Sun, 18 Sep 2022 11:31:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 16/21] dt-bindings: reserved-memory: introduce
 designated-movable-block
Content-Language: en-US
To:     Doug Berger <opendmb@gmail.com>, Rob Herring <robh@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Mike Rapoport <rppt@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Borislav Petkov <bp@suse.de>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Neeraj Upadhyay <quic_neeraju@quicinc.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Oscar Salvador <osalvador@suse.de>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Kees Cook <keescook@chromium.org>,
        - <devicetree-spec@vger.kernel.org>,
        KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>,
        Mel Gorman <mgorman@suse.de>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mm@kvack.org, iommu@lists.linux.dev
References: <20220913195508.3511038-1-opendmb@gmail.com>
 <20220913195508.3511038-17-opendmb@gmail.com>
 <20220914145506.GA2149379-robh@kernel.org>
 <57f19774-39a1-03a6-fe68-83d7e4b16521@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <57f19774-39a1-03a6-fe68-83d7e4b16521@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 14/09/2022 18:13, Doug Berger wrote:
> On 9/14/2022 7:55 AM, Rob Herring wrote:
>> On Tue, Sep 13, 2022 at 12:55:03PM -0700, Doug Berger wrote:
>>> Introduce designated-movable-block.yaml to document the
>>> devicetree binding for Designated Movable Block children of the
>>> reserved-memory node.
>>
>> What is a Designated Movable Block? This patch needs to stand on its
>> own.
> As noted in my reply to your [PATCH 00/21] comment, my intention in 
> submitting the entire patch set (and specifically PATCH 00/21]) was to 
> communicate this context. Now that I believe I understand that only this 
> patch should have been submitted to the devicetree-spec mailing list, I 
> will strive harder to make it more self contained.

The submission of entire thread was ok. What is missing is the
explanation in this commit. This commit must be self-explanatory (e.g.
in explaining "Why are you doing it?"), not rely on other commits for
such explanation.

> 
>>
>> Why does this belong or need to be in DT?
> While my preferred method of declaring Designated Movable Blocks is 
> through the movablecore kernel parameter, I can conceive that others may 
> wish to take advantage of the reserved-memory DT nodes. In particular, 
> it has the advantage that a device can claim ownership of the 
> reserved-memory via device tree, which is something that has yet to be 
> implemented for DMBs defined with movablecore.

Rephrasing the question: why OS memory layout and OS behavior is a
property of hardware (DTS)?



Best regards,
Krzysztof
