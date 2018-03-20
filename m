Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4B9977DD32
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Mar 2018 21:14:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751548AbeCTVOW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Mar 2018 17:14:22 -0400
Received: from mail-yw0-f172.google.com ([209.85.161.172]:34221 "EHLO
        mail-yw0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751319AbeCTVOU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Mar 2018 17:14:20 -0400
Received: by mail-yw0-f172.google.com with SMTP id x17so1026631ywj.1;
        Tue, 20 Mar 2018 14:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lsAxwkIMWl2Ao4HVu62uHV+qSHZ7dlBH5KZ7YUQ12dA=;
        b=XiQAsXLB0oJdXqH0G2TaBzXY6bfQinBwxgSa6GbdSVIkf2888O6RJYBbzpw9IuraHa
         Xy8QdMA1erJdzCV+Afb2EnqHOorWha7y3qFK+eyOGpZeZ0bxmHKytJy7ffMSwsFZnQNA
         RyJ8r7glAgAzKMY6jAcZxEud/50EvPrkBatXOn2ZRq6R0DktNv/WDhXsk9OxQkBK78oU
         AdiK7+4fzox2Kg8tG6rCzj62k5v+yaacv1CMNw7Bej04TmnieCxu4jEVabEPe/2EVs/C
         tiC32ssrUDxB1zqJiewxt/G/5gyBmoO2GNy0ejLhMq4s7s4nAKg0Ydct4cwL3COP4vde
         Eigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=lsAxwkIMWl2Ao4HVu62uHV+qSHZ7dlBH5KZ7YUQ12dA=;
        b=jFgazSf+Lb0fvZN33FbroR1l8JsC1T2fMby/NSZxxo/LXMMv7ysHTtyKe+SwycHxAX
         mNLShd3h+ThbL0nhEJq2vyNlYCmmrMtWKpntLuzhjnnF0hDSIhs8H2lbTJ9aVG6IQdaj
         EkXRU0QpHzm5x+UvdLg16xoXWgQdspd/qTVT2NN0/pKhUbLvV6Wgb4FwKBL9+iWZsmHt
         6gyY1WjjT9ayUWdLW4886GdzQOC9znEscl+yaswS6T/aZiZPyvKbiG7/lvkuPFng9kis
         Vn7daKjAxmi7vSsYdHcnqfXoLE8dEVP6I8OawjRFavgpXeffptZtCOcN/JHKw5lIxG7d
         kx1g==
X-Gm-Message-State: AElRT7GDAl9SX0AvYfHACaG5w/kyOTxnrqf1nNlGW26JtFQ71XGSOB9J
        TTYD+Cu5FrSdlfNEW+sab8U=
X-Google-Smtp-Source: AG47ELtK1ZcIv9dlxxZPT4RXv8RqxTO4YfePYyabj/4pY7y/w8myoX2T+6yWYPI/YBrZYImnMzdXMg==
X-Received: by 10.129.88.86 with SMTP id m83mr10220275ywb.276.1521580459864;
        Tue, 20 Mar 2018 14:14:19 -0700 (PDT)
Received: from localhost ([2620:10d:c091:200::2612])
        by smtp.gmail.com with ESMTPSA id k6sm972385ywi.11.2018.03.20.14.14.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Mar 2018 14:14:18 -0700 (PDT)
Date:   Tue, 20 Mar 2018 14:14:17 -0700
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
Message-ID: <20180320211417.GA2149215@devbig577.frc2.facebook.com>
References: <1521148842-15486-1-git-send-email-longman@redhat.com>
 <1521148842-15486-2-git-send-email-longman@redhat.com>
 <20180319155937.GQ2943022@devbig577.frc2.facebook.com>
 <1881c1da-56ec-d76b-b736-fd0919737ec6@redhat.com>
 <20180320201029.GO519464@devbig577.frc2.facebook.com>
 <2b9261b8-6a3a-81d1-9c9a-394524a0d413@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b9261b8-6a3a-81d1-9c9a-394524a0d413@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

On Tue, Mar 20, 2018 at 04:53:37PM -0400, Waiman Long wrote:
> ASAIK for v2, when cpuset.cpus is empty, cpuset.effective_cpus will show
> all the cpus available from the parent. It is a different behavior from
> v1. So do we still need a cpuset.cpus_available?

Heh, you're right.  Let's forget about available and do
cpuset.cpus.effective.  The primary reason for suggesting that was
because of the similarity with cgroup.controllers and
cgroup.subtree_control; however, they're that way because
subtree_control is delegatable.  For a normal resource knob like
cpuset.cpus, the knob is owned by the parent and what's interesting to
the parent is its effective set that it's distributing from.

Thanks.

-- 
tejun
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
