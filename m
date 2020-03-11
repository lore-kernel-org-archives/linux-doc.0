Return-Path: <SRS0=0k1m=44=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA23DC4CECE
	for <linux-doc@archiver.kernel.org>; Wed, 11 Mar 2020 19:32:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D3EC020738
	for <linux-doc@archiver.kernel.org>; Wed, 11 Mar 2020 19:32:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DWMg+i0R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731114AbgCKTb6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Mar 2020 15:31:58 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46622 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731003AbgCKTb5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Mar 2020 15:31:57 -0400
Received: by mail-pg1-f196.google.com with SMTP id y30so1716445pga.13
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2020 12:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=nrr0UrVgn5X3zlkkY/AvuhDFOpNyA1sBfPxPwX99Zio=;
        b=DWMg+i0RW/xutS/C0lrLv5qkdOkRJdJrd7AEzJ+nhuFzo5UDID2I7osmZjKepfTMG4
         QQ67+/sCPNIZ7NiaU8mRmDgy1xa+7fBGAeZZZkoTx0ai5DVbYNyxHYdGOZP0auhU1pUF
         UePGYNNb68RUudvV922Q5HtVehqC2USEIk+jpbQq+gqi7fI8y+o1huJ0sJdj4YlbDaNc
         a+tkRUGnWS+VXaa4CUwX7hR+D1hdRnZIhTJ92Lgzzk3/jj1uAGlq0dC5KMSpGWJr/Wmn
         sId2NEwJHNKE/JOvxQjgupkfsriJZ9/JR7Q0YcDQmyz76MrrEKq3+0syQOUAMb6O47t8
         CX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=nrr0UrVgn5X3zlkkY/AvuhDFOpNyA1sBfPxPwX99Zio=;
        b=Hvw/k4Tzi3wsrPYrqci6BRC+3mtlQUStJOJWEObDoys9WQNe5vxpPICItkoM8DmRA/
         wXAN77B542QClGyL2XgOyS4xB/2KRvE98KD9iJVzfOWoPadQeKePmRxo1zWAMDNxTewT
         qjtlsEv7+GbClmXLDwqTMl/7S1zGcApS6MbzQhzxifjvTJx9F5/AFJ4QthM4p94eQqY0
         acJO4Mxzc3xdVD72t7nR4CLD4r1SuLdyOTmCpQI+zz1kkGdY06L3poa2XQe5DM+X7Trx
         r2De1A+e7/VvGO0wU/rUKCJuosXzSHFIfQsUWHGVxmw0XZ/kXp4PBRGd3r+RVxfofM9Y
         ccQg==
X-Gm-Message-State: ANhLgQ2DD36lhHEq9yR6iT9DQyJ+/7oemzK18JOJRau80jEEr9OxOt35
        W4AhdheciILOPxzSLR3mgRnSSdwIIRk=
X-Google-Smtp-Source: ADFU+vukvfW+3meQvVc7eQJOnbW2y3Dt9sKRma1Xy4nV73Wr4TLb+pJSKHj51H8zu6dSS6TupFT38g==
X-Received: by 2002:a62:7f8f:: with SMTP id a137mr4368557pfd.145.1583955115898;
        Wed, 11 Mar 2020 12:31:55 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598] ([2620:15c:17:3:3a5:23a7:5e32:4598])
        by smtp.gmail.com with ESMTPSA id k20sm29707459pfk.123.2020.03.11.12.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 12:31:54 -0700 (PDT)
Date:   Wed, 11 Mar 2020 12:31:53 -0700 (PDT)
From:   David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To:     Ivan Teterevkov <ivan.teterevkov@nutanix.com>
cc:     "corbet@lwn.net" <corbet@lwn.net>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "jpoimboe@redhat.com" <jpoimboe@redhat.com>,
        "pawan.kumar.gupta@linux.intel.com" 
        <pawan.kumar.gupta@linux.intel.com>,
        "jgross@suse.com" <jgross@suse.com>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [PATCH] mm/vmscan: add vm_swappiness configuration knobs
In-Reply-To: <BL0PR02MB560167492CA4094C91589930E9FC0@BL0PR02MB5601.namprd02.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2003111227230.171292@chino.kir.corp.google.com>
References: <BL0PR02MB560167492CA4094C91589930E9FC0@BL0PR02MB5601.namprd02.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 11 Mar 2020, Ivan Teterevkov wrote:

> This patch adds a couple of knobs:
> 
> - The configuration option (CONFIG_VM_SWAPPINESS).
> - The command line parameter (vm_swappiness).
> 
> The default value is preserved, but now defined by CONFIG_VM_SWAPPINESS.
> 
> Historically, the default swappiness is set to the well-known value 60,
> and this works well for the majority of cases. The vm_swappiness is also
> exposed as the kernel parameter that can be changed at runtime too, e.g.
> with sysctl.
> 
> This approach might not suit well some configurations, e.g. systemd-based
> distros, where systemd is put in charge of the cgroup controllers,
> including the memory one. In such cases, the default swappiness 60
> is copied across the cgroup subtrees early at startup, when systemd
> is arranging the slices for its services, before the sysctl.conf
> or tmpfiles.d/*.conf changes are applied.
> 

Seems like something that can be fully handled by an initscript that would 
set the sysctl and then iterate the memcg hierarchy propagating the 
non-default value.  I don't think that's too much of an ask if userspace 
wants to manipulate the swappiness value.

Or maybe we can be more clever: have memcg->swappiness store -1 by default 
unless it is changed by the user explicitly and then have 
mem_cgroup_swappiness() return vm_swappiness for this value.  If the user 
overwrites it, it's intended.

So there are a couple options here but I don't think one of them is to add 
a new config option or kernel command line option.

> One could run a script to traverse the cgroup trees later and set the
> desired memory.swappiness individually in each occurrence when the runtime
> is set up, but this would require some amount of work to implement
> properly. Instead, why not set the default swappiness as early as possible?
> 
> Signed-off-by: Ivan Teterevkov <ivan.teterevkov@nutanix.com>
> ---
>  .../admin-guide/kernel-parameters.txt         |  4 ++++
>  mm/Kconfig                                    | 10 ++++++++
>  mm/vmscan.c                                   | 24 ++++++++++++++++++-
>  3 files changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index c07815d230bc..5d54a4303522 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -5317,6 +5317,10 @@
>  			  P	Enable page structure init time poisoning
>  			  -	Disable all of the above options
>  
> +	vm_swappiness=	[KNL]
> +			Sets the default vm_swappiness.
> +			Ranges from 0 to 100, the default value is 60.
> +
>  	vmalloc=nn[KMG]	[KNL,BOOT] Forces the vmalloc area to have an exact
>  			size of <nn>. This can be used to increase the
>  			minimum size (128MB on x86). It can also be used to diff --git a/mm/Kconfig b/mm/Kconfig index ab80933be65f..ec59c19e578e 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -739,4 +739,14 @@ config ARCH_HAS_HUGEPD  config MAPPING_DIRTY_HELPERS
>          bool
>  
> +config VM_SWAPPINESS
> +	int "Default memory swappiness"
> +	default 60
> +	range 0 100
> +	help
> +	  Sets the default vm_swappiness, that could be changed later
> +	  in the runtime, e.g. kernel command line, sysctl, etc.
> +
> +	  Higher value means more swappy. Historically, defaults to 60.
> +
>  endmenu
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 876370565455..7d2d3550f698 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -163,7 +163,29 @@ struct scan_control {
>  /*
>   * From 0 .. 100.  Higher means more swappy.
>   */
> -int vm_swappiness = 60;
> +int vm_swappiness = CONFIG_VM_SWAPPINESS;
> +
> +static int __init swappiness_cmdline(char *str) {
> +	int val, err;
> +
> +	if (!str)
> +		return -EINVAL;
> +
> +	err = kstrtoint(str, 10, &val);
> +	if (err)
> +		return -EINVAL;
> +
> +	if (val < 0 || val > 100)
> +		return -EINVAL;
> +
> +	vm_swappiness = val;
> +
> +	return 0;
> +}
> +
> +early_param("vm_swappiness", swappiness_cmdline);
> +
>  /*
>   * The total number of pages which are beyond the high watermark within all
>   * zones.
