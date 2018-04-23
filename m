Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8378C7E279
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Apr 2018 13:58:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755264AbeDWN6E (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Apr 2018 09:58:04 -0400
Received: from mail-wr0-f178.google.com ([209.85.128.178]:37124 "EHLO
        mail-wr0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755216AbeDWN6B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Apr 2018 09:58:01 -0400
Received: by mail-wr0-f178.google.com with SMTP id c14-v6so1466744wrd.4
        for <linux-doc@vger.kernel.org>; Mon, 23 Apr 2018 06:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gRSkwaYIv8ljJi9+uAFEft/9aQ/YQnmnWPsvc4/nSPI=;
        b=DMiaMsS/rjC/0D1q19qoogtwc5LqUgQLnAF+cjPTrjHwZ6YnAbxQ/ldRhcVQ90ACKm
         HkrmJZ5pev/fKITRGGravHQLhrWEjvGalmdyfasmFdn+MHLnZGAwghwEbEWmugRkbm4o
         qc7QNQguwVSnnksoASFryEXbDWxoOSSyjIa6XRCezHWPq4W4baK+7B1rh53APGZaZRWP
         1IKeIQRgOdLpzQmzC67gws6ZSEFm5KiWNv+jivRJ5G7IFzRoYzn6Hs4iok7vhLMDrNNa
         q7OhZTi8X7ZxUHZRLfzFFsTVGbe0iiUGAMzav3jgjLd3wzBRq4+doAEpB15TQdweKZ5M
         D4/w==
X-Gm-Message-State: ALQs6tCp1NuOFHMCTlG5I2Erhd+UQWjee84J91tvRnZPa1sVp2Z2xjGD
        N3MYY8GIDzoKXbTitRjoOLffEg==
X-Google-Smtp-Source: AB8JxZoEobyYsaPxVLFJn5xfXzsKBtfLztz4HptkAE9hrBIBbFGcz9gSy32hoxv3dOClkHz3MkfaVw==
X-Received: by 10.28.126.141 with SMTP id z135mr9885177wmc.6.1524491879859;
        Mon, 23 Apr 2018 06:57:59 -0700 (PDT)
Received: from localhost.localdomain ([151.15.228.118])
        by smtp.gmail.com with ESMTPSA id e64sm8451697wmg.22.2018.04.23.06.57.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Apr 2018 06:57:58 -0700 (PDT)
Date:   Mon, 23 Apr 2018 15:57:56 +0200
From:   Juri Lelli <juri.lelli@redhat.com>
To:     Waiman Long <longman@redhat.com>
Cc:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        Mike Galbraith <efault@gmx.de>, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>
Subject: Re: [PATCH v7 0/5] cpuset: Enable cpuset controller in default
 hierarchy
Message-ID: <20180423135756.GC32341@localhost.localdomain>
References: <1524145624-23655-1-git-send-email-longman@redhat.com>
 <20180423130715.GA32341@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180423130715.GA32341@localhost.localdomain>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 23/04/18 15:07, Juri Lelli wrote:
> Hi Waiman,
> 
> On 19/04/18 09:46, Waiman Long wrote:
> > v7:
> >  - Add a root-only cpuset.cpus.isolated control file for CPU isolation.
> >  - Enforce that load_balancing can only be turned off on cpusets with
> >    CPUs from the isolated list.
> >  - Update sched domain generation to allow cpusets with CPUs only
> >    from the isolated CPU list to be in separate root domains.
> 

Guess I'll be adding comments as soon as I stumble on something unclear
(to me :), hope that's OK (shout if I should do it differently).

The below looked unexpected to me:

root@debian-kvm:/sys/fs/cgroup# cat g1/cpuset.cpus
2-3
root@debian-kvm:/sys/fs/cgroup# cat g1/cpuset.mems

root@debian-kvm:~# echo $$ > /sys/fs/cgroup/g1/cgroup.threads
root@debian-kvm:/sys/fs/cgroup# cat g1/cgroup.threads
2312

So I can add tasks to groups with no mems? Or is it this only true in my
case with a single mem node? Or maybe it's inherited from root group
(slightly confusing IMHO if that's the case).
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
