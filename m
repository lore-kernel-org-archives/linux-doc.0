Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13DD1EB64D9
	for <linux-doc@archiver.kernel.org>; Tue, 11 Jul 2023 00:22:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbjGKAWf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Jul 2023 20:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230314AbjGKAWe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Jul 2023 20:22:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73A38FB
        for <linux-doc@vger.kernel.org>; Mon, 10 Jul 2023 17:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689034908;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3lffsLwd9raQCh04kyVM/H+XhSacCMhW6kPfQWTCBjE=;
        b=JBVQ7FfdZlFNoVj9OXEm3STK4WO4SrjBuKgThc4FbgNyOdcaN/ohLAYiFOQxW+VDLYwDm2
        qTNxPdEKKqSl9iIYnXia3S0QuOQIMd6mmL2DOboVZg2kXBWnOkzRzgVLC/2UE+gEhBgn98
        FE1+3k9iWML70MOvCI+3TyRnHe7ZuIQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-ObH99LfENPezcnZF7mrKCg-1; Mon, 10 Jul 2023 20:21:44 -0400
X-MC-Unique: ObH99LfENPezcnZF7mrKCg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 352AA80006E;
        Tue, 11 Jul 2023 00:21:44 +0000 (UTC)
Received: from [10.22.18.171] (unknown [10.22.18.171])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3BC8E200B415;
        Tue, 11 Jul 2023 00:21:43 +0000 (UTC)
Message-ID: <6d5aee58-f558-868c-76e0-0b58f8332110@redhat.com>
Date:   Mon, 10 Jul 2023 20:21:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 8/9] cgroup/cpuset: Documentation update for partition
Content-Language: en-US
To:     Tejun Heo <tj@kernel.org>
Cc:     Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Juri Lelli <juri.lelli@redhat.com>,
        Valentin Schneider <vschneid@redhat.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Mrunal Patel <mpatel@redhat.com>,
        Ryan Phillips <rphillips@redhat.com>,
        Brent Rowsell <browsell@redhat.com>,
        Peter Hunt <pehunt@redhat.com>, Phil Auld <pauld@redhat.com>
References: <20230627143508.1576882-1-longman@redhat.com>
 <20230627143508.1576882-9-longman@redhat.com>
 <ZKx4ZJowRhRtjZxB@slm.duckdns.org>
From:   Waiman Long <longman@redhat.com>
In-Reply-To: <ZKx4ZJowRhRtjZxB@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/10/23 17:30, Tejun Heo wrote:
> Hello,
>
> On Tue, Jun 27, 2023 at 10:35:07AM -0400, Waiman Long wrote:
> ...
>> +	There are two types of partitions - local and remote.  A local
>> +	partition is one whose parent cgroup is also a valid partition
>> +	root.  A remote partition is one whose parent cgroup is not a
>> +	valid partition root itself.  Writing to "cpuset.cpus.exclusive"
>> +	is not mandatory for the creation of a local partition as its
>> +	"cpuset.cpus.exclusive" file will be filled in automatically if
>> +	it is not set.	The automaticaly set value will be based on its
>> +	"cpuset.cpus" value.  Writing the proper "cpuset.cpus.exclusive"
>> +	values down the cgroup hierarchy is mandatory for the creation
>> +	of a remote partition.
> Wouldn't a partition root's cpus.exclusive always contain all of the CPUs in
> its cpus? Would it make sense for cpus.exclusive to be different from .cpus?
>
> Thanks.

In auto-filled case, it should be the same as cpuset.cpus. I will 
clarify that in the documentation. Thanks for catching that.

Cheers,
Longman

