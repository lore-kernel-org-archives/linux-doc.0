Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 55BB47DE75
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Mar 2018 20:10:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751348AbeCTUKl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Mar 2018 16:10:41 -0400
Received: from mail-yb0-f174.google.com ([209.85.213.174]:33185 "EHLO
        mail-yb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751317AbeCTUKk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Mar 2018 16:10:40 -0400
Received: by mail-yb0-f174.google.com with SMTP id b4-v6so992324ybi.0;
        Tue, 20 Mar 2018 13:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lAiQqpCcQDlXQITgI8JJALMA48DylJdpE65IrtFSPRE=;
        b=K3gaUsQtRdZaUajGpvLBM5j33738ehWUwPGd2E8Lp67tBrcaKQvW/SkMvRqcCffEHT
         LdgsAmz6aIlLoqSn+03YkZttjCgVebIT05v6UQncqYcb0DniCuIBRZZzmNYM+RushySo
         M5TLKUqdaHtBHFasHL/8Ksuvg6loIjsCgw6J3RDoC6717Yr3HUgY7m5jt1PzUJRwwIE/
         odVpgyhfXYO6PjqFSvIESIv5Z6Hv1IGZgbSCGs+jPoeqt62XquCfR/P8H0b0XnNzTb5L
         CRJIJkH9z3WxQBVqD6+LX4gNsKEHAeGWsS2/Bi9fOkRBNZl3+DfuwYJ+v2AOPn+JXmZ9
         E1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=lAiQqpCcQDlXQITgI8JJALMA48DylJdpE65IrtFSPRE=;
        b=Q+nSSa+IUKExLxqPLSTjLcgeEmGKKlGSV1V51zhv8xURJ5w2Xov6yc167DjbBRHAwq
         1dwpjR244vLK6weCJ9V3xXxvdqfsUv1nSMhRBQzU9Ybdy4R5YIjFpWr1l0VjdayTid5/
         4vFwtr6GfP0Au/IosDEQYCRjt2FXP5/GHmviMzC6s5ac4WGDlmkFvcXrNlidYGOLaGMP
         M7APS3Hho2PFrot+yWnEIjQbiqo1TJAqH4mznJCwxgBFaJPAmzixGYRc14pHkLbcQgnA
         GN4KcStcrRHi/F3SPCkNJhRaSY3DitN+9FsHbpfExUncKqNGocrTBiXBnbM6KXF8YB9W
         wH9w==
X-Gm-Message-State: AElRT7HdQNOhgBdMtTlsQznJICzTy96W8XrpLdy1rJ1j9HXWboe4trwN
        ibwlxL8B7uJFAEIax4GO7ienoF04
X-Google-Smtp-Source: AG47ELv+OENGhze4IVNjNndsY4+9fXctfKejsy05MpYs8PHzAdwyKdWApT0DxNUPyUQuPatqPZH49w==
X-Received: by 2002:a25:4003:: with SMTP id n3-v6mr10731468yba.390.1521576639713;
        Tue, 20 Mar 2018 13:10:39 -0700 (PDT)
Received: from localhost ([2620:10d:c091:200::2:472a])
        by smtp.gmail.com with ESMTPSA id u127sm926119ywg.63.2018.03.20.13.10.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Mar 2018 13:10:38 -0700 (PDT)
Date:   Tue, 20 Mar 2018 13:10:29 -0700
From:   Tejun Heo <tj@kernel.org>
To:     Waiman Long <longman@redhat.com>
Cc:     Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        efault@gmx.de, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>
Subject: Re: [PATCH v5 1/2] cpuset: Enable cpuset controller in default
 hierarchy
Message-ID: <20180320201029.GO519464@devbig577.frc2.facebook.com>
References: <1521148842-15486-1-git-send-email-longman@redhat.com>
 <1521148842-15486-2-git-send-email-longman@redhat.com>
 <20180319155937.GQ2943022@devbig577.frc2.facebook.com>
 <1881c1da-56ec-d76b-b736-fd0919737ec6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1881c1da-56ec-d76b-b736-fd0919737ec6@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello, Waiman.

On Tue, Mar 20, 2018 at 09:51:20AM -0400, Waiman Long wrote:
> >> +	It lists the onlined CPUs that are actually allowed to be
> >> +	used by tasks within the current cgroup. It is a subset of
> >> +	"cpuset.cpus".  Its value will be affected by CPU hotplug
> >> +	events.
> > Can we do cpuset.cpus.availble which lists the cpus available to the
> > cgroup instead of the eventual computed mask for the cgroup?  That'd
> > be more useful as it doesn't lose the information by and'ing what's
> > available with the cgroup's mask and it's trivial to determine the
> > effective from the two masks.
> 
> I don't get what you want here. cpus is the cpuset's cpus_allowed mask.
> effective_cpus is the effective_cpus mask. When you say cpus available
> to the cgroup, do you mean the cpu_online_mask or the list of cpus from
> the parent? Or do you just want to change the name to cpus.available
> instead of effective_cpus?

The available cpus from the parent, where the effective is AND between
cpuset.available and cpuset.cpus of the cgroup, so that the user can
see what's available for the cgroup unfiltered by cpuset.cpus.

> Right, I will set CFTYPE_NOT_ON_ROOT to "cpus" and "mems" as we are not
> supposed to change them in the root. The effective_cpus and
> effective_mems will be there in the root to show what are available.

So, we can do that in the future but let's not do that for now.  It's
the same problem we have for basically everything else and we've
stayed away from replicating the information in the root cgroup.  This
might change in the future but if we do that let's do that
consistently.

Thanks.

-- 
tejun
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
