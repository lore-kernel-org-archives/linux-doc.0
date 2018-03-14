Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AD54C7E6AB
	for <lwn-linux-doc@archive.lwn.net>; Wed, 14 Mar 2018 19:57:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751869AbeCNT5Q (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 14 Mar 2018 15:57:16 -0400
Received: from mail-yw0-f194.google.com ([209.85.161.194]:35294 "EHLO
        mail-yw0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751860AbeCNT5O (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Mar 2018 15:57:14 -0400
Received: by mail-yw0-f194.google.com with SMTP id c20so3026683ywa.2;
        Wed, 14 Mar 2018 12:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=mNzR5KMENUVyWqgjSK1EivG7Spr6h4RxAlgh2Yc24WM=;
        b=XTvqYQXK1C1k9E21UsRSJOZN/kIIyps4bpjY0Qon060BgZjLa97m9DhwCdsw6xpKaL
         v6kTgRV0HG1aGOUvExuxD89UmM8piax+7xnkbxX1mkxRAyQmAWsDhoixas0TAz3oPjsD
         APqP4YEDdUXG+lyOULY18qKn+/cN3AZWIt9mKem3HgQxHcNdV03fPVVl32sL1uJZejkE
         1bKwJU4wWxOaG2pO1vM1/S9a2nUUdsHjKnofq+lpBvPg7KtRVIC8aPvmV9tqrwSX3EAm
         fImguSpAIVjBIWVvKdg0s4JdxAQ6eVcZBDycC9PwMRb5fpKrqAh0QUWQnEssc5RaDEze
         UYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=mNzR5KMENUVyWqgjSK1EivG7Spr6h4RxAlgh2Yc24WM=;
        b=qKfloew/HNMRq6yzC3DNcxe4DVQMR3MGHapd0Phv1OeKQrgTv7CMh1CZ6kh5/dnQC6
         bQKvNDQat5u5d7i8fu/HBbPmXVwSYsAZ0EI8OFBGhiJOwDYRT3WVwtU47mQxYKXm5KSg
         582yUAUMXVA+UtcGDltoTPg/m9WFmLKXLQNChnHnhFrkFhC7JJ1/9tpHNaqyIapIUy5D
         6h8WeJzmqP12eUaMJIMn/CalbPWqZ9pp82u/Gkjd5xSuig9/EcGgRFRuv562BZ1eKOfL
         Mcai97Rg+9T4gQCES1Q4H7KDQj1NB6VKr4q6jaTbJfMy58BSn+9y/vIoLf4Basbl9+Ip
         vrBA==
X-Gm-Message-State: AElRT7Fh3YoOK+GO0bsCOO/Aqn/MRR1da/K8HfW268zj3JxVoURMzWuk
        rpCunJWW/ZrAe5PpJUn55PI=
X-Google-Smtp-Source: AG47ELtCDk44Znq8mlh5Ao860KVd9hEqIvnNKXMwazQbX0l2wkgWiO+pGoLMNd1GPASBJ1y5oYdkbg==
X-Received: by 10.129.216.9 with SMTP id d9mr4133623ywj.283.1521057433753;
        Wed, 14 Mar 2018 12:57:13 -0700 (PDT)
Received: from localhost ([2620:10d:c091:200::6ef7])
        by smtp.gmail.com with ESMTPSA id l145sm1296125ywb.105.2018.03.14.12.57.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Mar 2018 12:57:12 -0700 (PDT)
Date:   Wed, 14 Mar 2018 12:57:11 -0700
From:   Tejun Heo <tj@kernel.org>
To:     Mike Galbraith <efault@gmx.de>
Cc:     Waiman Long <longman@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        torvalds@linux-foundation.org, Roman Gushchin <guro@fb.com>
Subject: Re: [PATCH v4] cpuset: Enable cpuset controller in default hierarchy
Message-ID: <20180314195711.GD2943022@devbig577.frc2.facebook.com>
References: <1520609707-16582-1-git-send-email-longman@redhat.com>
 <1520613285.12489.36.camel@gmx.de>
 <1c3fe7b0-2600-c46d-1527-d3aaf024bb91@redhat.com>
 <1520619426.27998.18.camel@gmx.de>
 <55809fe4-98ba-5566-86ed-457acfef0e1c@redhat.com>
 <1520624424.27998.76.camel@gmx.de>
 <53de9683-01b7-bac4-8b70-dc1f93ede600@redhat.com>
 <20180309221736.GB5926@hirez.programming.kicks-ass.net>
 <f0fca497-e4e7-3dbd-1e5c-a7f502c05dcb@redhat.com>
 <1520653648.12749.20.camel@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1520653648.12749.20.camel@gmx.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

On Sat, Mar 10, 2018 at 04:47:28AM +0100, Mike Galbraith wrote:
> Some form of cpu_exclusive (preferably exactly that, but something else
> could replace it) is needed to define sets that must not overlap any
> other set at creation time or any time thereafter.  A set with property
> 'exclusive' is the enabler for fundamentally exclusive (but dynamic!)
> set properties such as 'isolated' (etc etc).

I'm not sure cpu_exclusive makes sense.  A controller knob can either
belong to the parent or the cgroup itself and cpu_exclusive doesn't
make sense in either case.

1. cpu_exclusive is owned by the parent as other usual resource
   control knobs.  IOW, it's not delegatable.

   This is weird because it's asking the kernel to protect against its
   own misconfiguration and there's nothing preventing cpu_exclusive
   itself being cleared by the same entitya.

2. cpu_exclusive is owned by the cgroup itself like memory.oom_group.
   IOW, it's delegatable.

   This allows a cgroup to affect what its siblings can or cannot do,
   which is broken.  Semantically, it doesn't make much sense either.

I don't think it's a good idea to add a kernel mechanism to prevent
misconfiguration from a single entity.

Thanks.

-- 
tejun
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
