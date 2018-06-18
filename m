Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5BE197D062
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Jun 2018 14:59:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S935140AbeFRO6u (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Jun 2018 10:58:50 -0400
Received: from mail-wr0-f182.google.com ([209.85.128.182]:40107 "EHLO
        mail-wr0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934847AbeFRO6t (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Jun 2018 10:58:49 -0400
Received: by mail-wr0-f182.google.com with SMTP id l41-v6so17189892wre.7
        for <linux-doc@vger.kernel.org>; Mon, 18 Jun 2018 07:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dmp897KLH85f0UHihFbQHQP5zAQ+kYBUmXPLMF3Y12M=;
        b=RED+Dub9LDAZSKvBd28PQ4NFzkY1Z1Q4YjtgSGv3Rky1mXwzQRoDcRPCl8GJ1IdR1B
         otKrWT+mMJUTUbL0pVgGy6u7YcbPgsAfF+t7xbDLqnkMDFQUJWSVbXIUi16qb8lW5m8j
         Ht+3ggIpybbYLlarBGYI7xiKQl6/apcATJnEkSaKdh/SaPl6NF5wO2wrm0dywhgG6HOa
         k/HUzuMigLqk3BWXmPj/IHqTyv47d/tcaZcBS0VtArUztsG3acGkeO4gDBX3xaef/Q95
         FPAyGBmkQLLw6Z/ljzc9A/DBfGhTTcb0TquzyygVnnCWyLDi2/cFN3kCERXrCDwuKblf
         mmwQ==
X-Gm-Message-State: APt69E0FvPIIcOJuqJuWt7UEinB27CdsP1LDkgEU97vFzpOfuF7A1Ug7
        z3kfSW44DjEtIwICURBA5IrTkg==
X-Google-Smtp-Source: ADUXVKLgErRGhxsvTfNXP1AXRi1WPH+bbsVmr9E+pafr5LWKA262hUACmMwSlK9XhgaI/gGDOKFbBA==
X-Received: by 2002:adf:d84a:: with SMTP id k10-v6mr10675844wrl.26.1529333928009;
        Mon, 18 Jun 2018 07:58:48 -0700 (PDT)
Received: from localhost.localdomain ([151.15.207.242])
        by smtp.gmail.com with ESMTPSA id i10-v6sm10519567wmf.4.2018.06.18.07.58.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jun 2018 07:58:47 -0700 (PDT)
Date:   Mon, 18 Jun 2018 16:58:44 +0200
From:   Juri Lelli <juri.lelli@redhat.com>
To:     Waiman Long <longman@redhat.com>
Cc:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        Mike Galbraith <efault@gmx.de>, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>,
        Patrick Bellasi <patrick.bellasi@arm.com>
Subject: Re: [PATCH v10 6/9] cpuset: Make generate_sched_domains() recognize
 isolated_cpus
Message-ID: <20180618145844.GB13097@localhost.localdomain>
References: <1529295249-5207-1-git-send-email-longman@redhat.com>
 <1529295249-5207-7-git-send-email-longman@redhat.com>
 <64a0ea0d-c873-f53e-654e-1dd60f833478@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64a0ea0d-c873-f53e-654e-1dd60f833478@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 18/06/18 22:44, Waiman Long wrote:

[...]

> 
> Sorry, that one is bogus. Please ignore that.
> 

OK, ignoring this should actually "fix" the odd behaviour I was talking
about.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
