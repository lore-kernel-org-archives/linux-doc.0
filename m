Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 399177E27A
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Mar 2018 21:35:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S965230AbeCSVeA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Mar 2018 17:34:00 -0400
Received: from mail-yw0-f194.google.com ([209.85.161.194]:46147 "EHLO
        mail-yw0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965043AbeCSP7k (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Mar 2018 11:59:40 -0400
Received: by mail-yw0-f194.google.com with SMTP id v68so9013704ywg.13;
        Mon, 19 Mar 2018 08:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AriMpbPmhFykEuV9cKv6WH/lAYzTqQXMm/EzcTM+nb0=;
        b=bLQsGZWN+/V6Z5tEBi9Hm9KrE6r/H14bP2eOIOGL6FvBIX5wpnDA62ntZhOQAqJanZ
         EPnWTeZYVwZNWaDNGUr6kYffX870XYKTnlQK4q/orgOv+zuJiDrBX+osiWiHyGhcqywU
         QSt8XPKJNfe8DyKRS5gugovF/s45T09QnzhxBt1fkOQWGCwz8tbmvC+c8JBlAc6oXhaM
         zCItuMqLsK6IeXlDSJdYolrJm9dBrvv8LPRFwhvhZxpyiF9uUhrnWDGa2LKUqqfOB0zC
         GZDJ+EYFVhkvlT1YzyxgYhDnmlCAQKuuCyOuKvhmyPkC/09wQnT/oHM07oWUDZw23fzN
         HiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=AriMpbPmhFykEuV9cKv6WH/lAYzTqQXMm/EzcTM+nb0=;
        b=qbHDLIxi+wel1YLjkoIqvqtz5U7SU7TQKEv7vB0oeGOo+IAaDQLlmhCOSgw37htPMB
         BtnONgyL9kU74pXWfMD3j/zjTzp5e8p/k/iRBxr2QMlJh9cfH0CMymVSjr9MGgaanfqU
         EbXh05zk8XrBteRtGlzRlqGjdL88yC2rkWAKb1z18Ibi5t0kRX7p7407nZ0OIPQ8pQo0
         P6aRHDn/iJO2wVJ55gtjf2V/TQPuimZ7PvqNq9CHl7pdqRFXYZ5iBfy+P8Zz+rjAWPfv
         VxDMcyKMQ0Mz2Dd8hc67AR1/S8LjIoYrTdrrVwFMRRwGlozsahP/RQaIVZwRJjDMZf5p
         Cprg==
X-Gm-Message-State: AElRT7FswOKsBc0ZxYoKrj0vXyqbeIFI2CUzJmZ1xt4a1HxFhdJgtVS0
        IdW9d3LiguEOLS2MqHbIyNU=
X-Google-Smtp-Source: AG47ELubZqdzN6gnLxtx/A8CR2pV/hsz5qqwNRbRvX0pshJWEx3+Fo991RshmZreqXtSzmeU80nIrg==
X-Received: by 10.129.175.2 with SMTP id n2mr7506077ywh.204.1521475179984;
        Mon, 19 Mar 2018 08:59:39 -0700 (PDT)
Received: from localhost ([2620:10d:c091:200::2:72b4])
        by smtp.gmail.com with ESMTPSA id c70sm132910ywa.22.2018.03.19.08.59.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Mar 2018 08:59:38 -0700 (PDT)
Date:   Mon, 19 Mar 2018 08:59:37 -0700
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
Message-ID: <20180319155937.GQ2943022@devbig577.frc2.facebook.com>
References: <1521148842-15486-1-git-send-email-longman@redhat.com>
 <1521148842-15486-2-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521148842-15486-2-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello, Waiman.

This looks great.  A couple nitpicks below.

> +     5-3. Cpuset
> +       5.3-1. Cpuset Interface Files

Can we put cpuset below pid?  It feels weird to break up cpu, memory
and io as they represent the three major resources and are in a
similar fashion.

> +  cpuset.effective_cpus
> +	A read-only multiple values file which exists on non-root
> +	cgroups.
> +
> +	It lists the onlined CPUs that are actually allowed to be
> +	used by tasks within the current cgroup. It is a subset of
> +	"cpuset.cpus".  Its value will be affected by CPU hotplug
> +	events.

Can we do cpuset.cpus.availble which lists the cpus available to the
cgroup instead of the eventual computed mask for the cgroup?  That'd
be more useful as it doesn't lose the information by and'ing what's
available with the cgroup's mask and it's trivial to determine the
effective from the two masks.

> +  cpuset.effective_mems
> +	A read-only multiple values file which exists on non-root
> +	cgroups.
> +
> +	It lists the onlined memory nodes that are actually allowed
> +	to be used by tasks within the current cgroup.  It is a subset
> +	of "cpuset.mems".  Its value will be affected by memory nodes
> +	hotplug events.

Ditto.

> +static struct cftype dfl_files[] = {
> +	{
> +		.name = "cpus",
> +		.seq_show = cpuset_common_seq_show,
> +		.write = cpuset_write_resmask,
> +		.max_write_len = (100U + 6 * NR_CPUS),
> +		.private = FILE_CPULIST,
> +	},

Is it missing CFTYPE_NOT_ON_ROOT?  Other files too.

Thanks.

-- 
tejun
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
