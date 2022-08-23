Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B86C32772
	for <linux-doc@archiver.kernel.org>; Tue, 23 Aug 2022 17:48:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbiHWRsS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 Aug 2022 13:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233140AbiHWRrl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Aug 2022 13:47:41 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEB0FAE9EB
        for <linux-doc@vger.kernel.org>; Tue, 23 Aug 2022 08:43:59 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id t11-20020a17090a510b00b001fac77e9d1fso14921367pjh.5
        for <linux-doc@vger.kernel.org>; Tue, 23 Aug 2022 08:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=WdZUWMe+w6NdkvEjJaHucwMuy21ym8cPJg6eP925ZQ0=;
        b=UhhdlLKQ2gDM2vQTqxNR3H3P54QELCmTYoRtFWOv3E2w4om1CvRbYVwedRQTd+Afao
         0qpcZIs3VEdxcpn3t4fBlWL3FsZsdeDru+azac3lUBr84uuKZTZ3mlZIQxwNYTEZ0+C3
         8myH9iaSwznHp48212VmuEt2w9h9vxetHBO1SHhA4XfmymVTL5vD34Si4OZGaZxmyCXq
         JZG25rmhvCeKVbiXdYQMg17r6Lw9PzEXpisKPi4dfNc9NyP3gXR5ayybTb+TbfD2MB3B
         gYFlnt6Ovve7/HS9Ci6ZQe4S/dcIGq/iyuwy9Rlll8tcHQ8vwDqGYJC8Fdolad+HrDWr
         CHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=WdZUWMe+w6NdkvEjJaHucwMuy21ym8cPJg6eP925ZQ0=;
        b=vJvkfAkG5+Vn2uWK8UEyXmxZQUIOCqI5261up53HHpyRQ3xAQZu0phShrFmqyqoU1u
         Rskcnsu1R1UTy8sIWUn0I39mdtw3rlDwKgkog73Oj8FtIFpKEByCVvNsSMg3vM0WWe+x
         lj/Z/QpmaDnw2nKRliZU4XlbEU2FSukxbib8bplD9py1ZNpck+WfOKUbYi84YsrKIOn+
         SLl6pcum98St4l2GpzfK7C3AZHjU7BHVcqroswi3EmhB0YXgQfr6s8tA/h4sDfKTPnNl
         NXg/oQluQTQ4LR80hgOKTGK8EeSugG4QhaZnQGnQjjl8t8Tn0gPqZUeD/OngKkadZdq4
         6UVA==
X-Gm-Message-State: ACgBeo0bcW5LOMqvqRGLWhhBXFfbQ2vMTrTBFfjv0OJaL8g1p68LJc38
        jRNG433Bc4qT8renlvrp1MpHvQ==
X-Google-Smtp-Source: AA6agR7OpXoJDkm2+4ZBvbYX/W5se8d30EMUB4Q5KliLBfi18pBw/Gf4DLXJmE2fUpqYnxLetm9FLg==
X-Received: by 2002:a17:903:258f:b0:172:a6ac:1504 with SMTP id jb15-20020a170903258f00b00172a6ac1504mr24930414plb.60.1661269439249;
        Tue, 23 Aug 2022 08:43:59 -0700 (PDT)
Received: from [10.4.208.12] ([139.177.225.228])
        by smtp.gmail.com with ESMTPSA id h16-20020a170902f55000b00172ad292b6bsm2148581plf.116.2022.08.23.08.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 08:43:58 -0700 (PDT)
Message-ID: <a562ede6-262c-b31b-4c96-75a69c265c41@bytedance.com>
Date:   Tue, 23 Aug 2022 23:43:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v2 09/10] sched/psi: per-cgroup PSI stats
 disable/re-enable interface
Content-Language: en-US
To:     Johannes Weiner <hannes@cmpxchg.org>
Cc:     =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>,
        Tejun Heo <tj@kernel.org>, corbet@lwn.net, surenb@google.com,
        mingo@redhat.com, peterz@infradead.org, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, songmuchun@bytedance.com
References: <20220808110341.15799-1-zhouchengming@bytedance.com>
 <20220808110341.15799-10-zhouchengming@bytedance.com>
 <YvKd6dezPM6UxfD/@slm.duckdns.org>
 <fcd0bd39-3049-a279-23e6-a6c02b4680a7@bytedance.com>
 <b89155d3-9315-fefc-408b-4cf538360a1c@bytedance.com>
 <YvPN07UlaPFAdlet@cmpxchg.org> <20220815132343.GA22640@blackbody.suse.cz>
 <9d1997a4-9278-07bd-7f57-952306b28b14@bytedance.com>
 <YwTz32VWuZeLHOHe@cmpxchg.org>
From:   Chengming Zhou <zhouchengming@bytedance.com>
In-Reply-To: <YwTz32VWuZeLHOHe@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022/8/23 23:35, Johannes Weiner wrote:
> On Tue, Aug 23, 2022 at 02:18:21PM +0800, Chengming Zhou wrote:
>> On 2022/8/15 21:23, Michal Koutný wrote:
>>> On Wed, Aug 10, 2022 at 11:25:07AM -0400, Johannes Weiner <hannes@cmpxchg.org> wrote:
>>>> cgroup.pressure.enable sounds good to me too. Or, because it's
>>>> default-enabled and that likely won't change, cgroup.pressure.disable.
>>>
>>> Will it not change?
>>>
>>> I'd say that user would be interested in particular level or even just
>>> level in subtree for PSI, so the opt-out may result in lots of explicit
>>> disablements (or even watch for cgroups created and disable PSI there)
>>> to get some performance back.
>>>
>>> I have two suggestions based on the above:
>>> 1) Make the default globally configurable (mount option?)
>>> 2) Allow implicit enablement upon trigger creation
>>>
>>
>> I think suggestion 1) make sense in some use case, like make per-cgroup
>> PSI disabled by default using a mount option, then enable using the
>> "cgroup.pressure" interface.
>>
>> But suggestion 2) auto enable upon trigger creation, if we hide the
>> {cpu,memory,io}.pressure files when disabled, how can we create trigger?
>>
>> Want to see what do Johannes and Tejun think about these suggestions?
> 
> Re 1: I agree. If desired in the future we can make the default
> configurable. Kconfig, mount option, what have you. cgroup.pressure
> will work fine as a name regardless of what the default is.
> 
> Re 2: Not all consumers of the pressure metrics create trigger. I
> would argue that few do. So it isn't the best signal to decide on
> whether aggregation should occur. And yes, it's further complicated by
> the triggers being written to the very pressure files. If we don't
> hide them, we have to come up with another way to mark them as stale,
> lest they confuse the heck out of users. Without breaking format...
> 
> So IMO, default-enable, "cgroup.pressure" as a name, and hiding the
> pressure files should be good for now while allowing to make the
> default configurable down the line.

Agree, it's what we want for now. Thanks for your reply!


