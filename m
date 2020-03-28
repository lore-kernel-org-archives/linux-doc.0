Return-Path: <SRS0=px74=5N=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AB9C43331
	for <linux-doc@archiver.kernel.org>; Sat, 28 Mar 2020 11:50:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 16F6D20732
	for <linux-doc@archiver.kernel.org>; Sat, 28 Mar 2020 11:50:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="wruyawcv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgC1Lu2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 28 Mar 2020 07:50:28 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:36468 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbgC1Lu2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 28 Mar 2020 07:50:28 -0400
Received: by mail-qk1-f193.google.com with SMTP id d11so13803165qko.3
        for <linux-doc@vger.kernel.org>; Sat, 28 Mar 2020 04:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PXOaWkf6K2Whqr4tczFKE+1Lhm0x7YcGQ6GGzYXABXQ=;
        b=wruyawcvW8FYxDeUaH/b3sR9f8qVFJNMds5GXrlnCIL4b4t3MHPibhHne7Za5AesWp
         +oZnYwJyHBF7rLaEj3+xRg7T5fJxnvcgCaXvzW/j0ZoW8S8LGz7HY/9cmXGJaWBhgnkX
         3ev0sjOfZuxAiXphJs4iPsEiSx26FWby11+kM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PXOaWkf6K2Whqr4tczFKE+1Lhm0x7YcGQ6GGzYXABXQ=;
        b=a8n/MbzHqPLGmP6xbkOuo60ZXC7CWMz90idrGU0MfWDUs5jcN6N3qcRW31RgeDXtFB
         y79NPon4JQv2HFxMzC/8T79ys6xmPzFl3Ojto3nza8Vt68Ijj4XymPTKWr3vj68tU9rq
         SnA3I6MTv7okkmK4z0lhs3MQ153y6AIKLWuSI7k+wzp5Dok1WLLwRwGfi0zNeYf9ahEp
         CqOqLazxNrWMEtNsE/E+DR26gVfdiK084lZPsrX8LEJu0Pfh2h1aelgIwIl9skvyrmni
         N+tU3WPYoOTU9f+3dUvt4RYgwGopzXsjkWBeBGJoFY2tputXXxZtcwWXMxJsH9SQeZcv
         +sDQ==
X-Gm-Message-State: ANhLgQ0wgeY9xsz0qJnrCgXZ98yiPqOelpYO/6lx5NXv2AIVdw9nj+PL
        s1NMMnAEX2E6PuoHWezFlhwr7Q==
X-Google-Smtp-Source: ADFU+vuJZg9x4i3uIawWWwhUP6qOTLg47eTiVN4Q7Bu5YZJWAls9LsVdqiTybdkCsbmFuWW5s7NtMg==
X-Received: by 2002:a37:4d88:: with SMTP id a130mr1086530qkb.443.1585396227212;
        Sat, 28 Mar 2020 04:50:27 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id q1sm6610470qtn.69.2020.03.28.04.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2020 04:50:26 -0700 (PDT)
Date:   Sat, 28 Mar 2020 07:50:26 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Waiman Long <longman@redhat.com>
Cc:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        Sonny Rao <sonnyrao@google.com>
Subject: Re: [PATCH] docs: cgroup-v1: Document the cpuset_v2_mode mount option
Message-ID: <20200328115026.GA135587@google.com>
References: <20200328014748.24140-1-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200328014748.24140-1-longman@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 27, 2020 at 09:47:48PM -0400, Waiman Long wrote:
> The cpuset in cgroup v1 accepts a special "cpuset_v2_mode" mount
> option that make cpuset.cpus and cpuset.mems behave more like those in
> cgroup v2.  Document it to make other people more aware of this feature
> that can be useful in some circumstances.
> 
> Signed-off-by: Waiman Long <longman@redhat.com>

Acked-by: Joel Fernandes (Google) <joel@joelfernandes.org>

thanks,

 - Joel

> ---
>  Documentation/admin-guide/cgroup-v1/cpusets.rst | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/admin-guide/cgroup-v1/cpusets.rst b/Documentation/admin-guide/cgroup-v1/cpusets.rst
> index 86a6ae995d54..7ade3abd342a 100644
> --- a/Documentation/admin-guide/cgroup-v1/cpusets.rst
> +++ b/Documentation/admin-guide/cgroup-v1/cpusets.rst
> @@ -223,6 +223,17 @@ cpu_online_mask using a CPU hotplug notifier, and the mems file
>  automatically tracks the value of node_states[N_MEMORY]--i.e.,
>  nodes with memory--using the cpuset_track_online_nodes() hook.
>  
> +The cpuset.effective_cpus and cpuset.effective_mems files are
> +normally read-only copies of cpuset.cpus and cpuset.mems files
> +respectively.  If the cpuset cgroup filesystem is mounted with the
> +special "cpuset_v2_mode" option, the behavior of these files will become
> +similar to the corresponding files in cpuset v2.  In other words, hotplug
> +events will not change cpuset.cpus and cpuset.mems.  Those events will
> +only affect cpuset.effective_cpus and cpuset.effective_mems which show
> +the actual cpus and memory nodes that are currently used by this cpuset.
> +See Documentation/admin-guide/cgroup-v2.rst for more information about
> +cpuset v2 behavior.
> +
>  
>  1.4 What are exclusive cpusets ?
>  --------------------------------
> -- 
> 2.18.1
> 
