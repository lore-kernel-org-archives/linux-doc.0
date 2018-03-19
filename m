Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 37AE17D0F3
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Mar 2018 16:27:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S966911AbeCSQ1D (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Mar 2018 12:27:03 -0400
Received: from mail-yw0-f181.google.com ([209.85.161.181]:43869 "EHLO
        mail-yw0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965769AbeCSQ05 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Mar 2018 12:26:57 -0400
Received: by mail-yw0-f181.google.com with SMTP id r66so11619984ywh.10;
        Mon, 19 Mar 2018 09:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8eNInYkHwQkCuJcX3qBfesUQwAMJyRKRawyW/fU43j0=;
        b=aCpOKbXJtXGVVO/VTBzsDbJ+Cg5JrGm7pDYXCQocL/l6NEuvZOa79qZhH1bh+3xUrO
         UjENbD3Ew5vCDDFtNLoBxCB6WXwvATgkv/NQ1g/i+cr9oBdYOljrDrMDFnO0F/lTmaa8
         wWOKE1s1jH8EI2d5ZmzRKS8mz98ceGqk3PiBQu1dPSbadBTZopkjL0sXItEDZfNmnaKQ
         FpmE4NBCPvQIv+KO+ODCODyvtVCILoEmuud/PBVMlIZXwvNQ8VfVlGK61zyKPwIUlETs
         JGbk0kiMlWa0SMAGbkmtasPamuHawzwMCq0dTqt2Uw5eZDX/NzDE0nEqD50iGi/A7LpI
         IVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=8eNInYkHwQkCuJcX3qBfesUQwAMJyRKRawyW/fU43j0=;
        b=lFMLV1WoN5iZ1HxauE8fmRo2PMcnNU4TXnCYv37n27HDxvd4ezSN0EqDo00PzrxVQB
         TGo2Ub6NkGIrOIT/Omhr/IZVED6Vq99/+yPs2KhTsmlojesYCqRI2/+n32Eb0UzeIJL+
         sRrpsY6P8IoIzFZG1ia7jFMAzfCEhebm2Q9KpQkoUDnQJDiO4B/jEe0swPvVUawghqTn
         oZyaFaVV8GOD4RL46nXAvNDPfeRcGun385xE/G03wtGC9vwLuw3OpYiLEYuMJd2j+OlZ
         eIdU6MfSHUKj/SQi0Q2q3nKtwgJJhuTehWHIjIS1+IF4Rh62hVHvQfRSRB7W1wDx4kql
         +biw==
X-Gm-Message-State: AElRT7HkRlwXWRk03naIamp+2O6y8ZdgmPQgeV9/pvt/ODf8RPr7WV0P
        6jzSvlbC5laQvphjJN8rmJA=
X-Google-Smtp-Source: AG47ELt5zntUSYh3eP4A4u2RWKLLtz/dihZ07j3dR51mLlJd07IrRMQo4AeEiqPQmAlwpdoXhZKy/w==
X-Received: by 10.129.35.10 with SMTP id j10mr7064127ywj.463.1521476816639;
        Mon, 19 Mar 2018 09:26:56 -0700 (PDT)
Received: from localhost ([2620:10d:c091:200::2:72b4])
        by smtp.gmail.com with ESMTPSA id i123sm137741ywd.73.2018.03.19.09.26.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Mar 2018 09:26:55 -0700 (PDT)
Date:   Mon, 19 Mar 2018 09:26:54 -0700
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
Subject: Re: [PATCH v5 2/2] cpuset: Add cpuset.flags control knob to v2
Message-ID: <20180319162654.GR2943022@devbig577.frc2.facebook.com>
References: <1521148842-15486-1-git-send-email-longman@redhat.com>
 <1521148842-15486-3-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521148842-15486-3-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello, Waiman.

On Thu, Mar 15, 2018 at 05:20:42PM -0400, Waiman Long wrote:
> +	The currently supported flag is:
> +
> +	  sched_load_balance
> +		When it is not set, there will be no load balancing
> +		among CPUs on this cpuset.  Tasks will stay in the
> +		CPUs they are running on and will not be moved to
> +		other CPUs.
> +
> +		When it is set, tasks within this cpuset will be
> +		load-balanced by the kernel scheduler.  Tasks will be
> +		moved from CPUs with high load to other CPUs within
> +		the same cpuset with less load periodically.

Hmm... looks like this is something which can be decided by the cgroup
itself and should be made delegatable.  Given that different flags
might need different delegation settings and the precedence of
memory.oom_group, I think it'd be better to make the flags separate
bool files - ie. cpuset.sched_load_balance which contains 0/1 and
marked delegatable.

Thanks.

-- 
tejun
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
