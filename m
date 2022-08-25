Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623C9C04AA5
	for <linux-doc@archiver.kernel.org>; Thu, 25 Aug 2022 12:28:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239668AbiHYM24 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Aug 2022 08:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240782AbiHYM2t (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Aug 2022 08:28:49 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 634AFB2CD6
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 05:28:48 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id w2so38419pld.0
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 05:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=o0E7YiHeVex1u0X6qaV95zV+IU6KmVTedW0VAfovtx8=;
        b=TRE19aRmzYeY60KDN1wOIIp3s3WQh2s1UiPVHSyC4h+toJTUn/oTh2+z/rhBhbwT6W
         NDeigQr3uEpitwebXfV935zr/yRXP0JDTsxyCSUw5JTINtlHZjKYcXG60i6fqttjH68I
         t/JoB4QAa0mGRFYYhWlznz5OiKOMTjBRy4TqgPJjFO3js0EKBC00oSRYeJ9dt11uCmeQ
         yhsE7wjOUDL3v6ZJEMykJvR8hjQvqCmRxoMTKurdisC/z/bcw3fE3F1j2ylZpsZaL9dH
         BBdloD+tLoAovOt6PQUfWLddZQetzIFhFIh3cfkO+ADUTA1v0pEvgxbuWN2v4QJxcGNj
         cjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=o0E7YiHeVex1u0X6qaV95zV+IU6KmVTedW0VAfovtx8=;
        b=2izaf7UVoAPkFoSvDNggWxlpMb99sR48z4EfsF15WNup0bZD/Degs+D0ZRaXvy2jRF
         qmpXSD5/JZs3Lomp+OgoiFvYxlkAUF10SRxl+eT16PaJ9jVsQs2kXqNRdtDk580K5gCT
         tbymzTDH1n/iX6D5kPNok1Hv1xd6abFT6JTL+K2/N9brI+7VBzi9RmlOdxPlVuPA7q01
         ADaMsENSECGO32/P6j5ESTjNIsVZr1FOE1BkL4jf6yXts3N/9aZ3B6ylR9ScWUh7CUXK
         cg4p+gsDnpWbgl3PRVRrlvBaa+gGBPthMYHb+jMqxh2LhkncLxD80QVvQyNVvPmocCaG
         jVGw==
X-Gm-Message-State: ACgBeo3sm5ikQbsC6j4pgghXJ5E6RkDRUejzBHQeZzVLjuSkbc9y4pkE
        6zK4XBU/9d3WISuIzpIENd50Kg==
X-Google-Smtp-Source: AA6agR6sM22N0p77QoFew7d776bTlmOcjbDP3P0nFDZUEv4yLZSU4Xsgwzh4MlgCqwFivfw0t507fw==
X-Received: by 2002:a17:90a:2b0f:b0:1fa:d73f:ce92 with SMTP id x15-20020a17090a2b0f00b001fad73fce92mr13508804pjc.60.1661430527863;
        Thu, 25 Aug 2022 05:28:47 -0700 (PDT)
Received: from [10.254.35.15] ([139.177.225.236])
        by smtp.gmail.com with ESMTPSA id w16-20020a170902e89000b0016f196209c9sm10948960plg.123.2022.08.25.05.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 05:28:47 -0700 (PDT)
Message-ID: <324b1d0f-42e5-8947-68cb-a3d20135f2c6@bytedance.com>
Date:   Thu, 25 Aug 2022 20:28:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v3 10/10] sched/psi: per-cgroup PSI accounting
 disable/re-enable interface
Content-Language: en-US
To:     Johannes Weiner <hannes@cmpxchg.org>
Cc:     tj@kernel.org, mkoutny@suse.com, surenb@google.com,
        gregkh@linuxfoundation.org, corbet@lwn.net, mingo@redhat.com,
        peterz@infradead.org, songmuchun@bytedance.com,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220824081829.33748-1-zhouchengming@bytedance.com>
 <20220824081829.33748-11-zhouchengming@bytedance.com>
 <YwX2jC2UQ/zeY2E8@cmpxchg.org>
From:   Chengming Zhou <zhouchengming@bytedance.com>
In-Reply-To: <YwX2jC2UQ/zeY2E8@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022/8/24 17:59, Johannes Weiner wrote:
> Hi Chengming,
> 
> Thanks for incorporating all the feedback. I have a few nitpicks
> below, but with those considered, please add:
> 
> Acked-by: Johannes Weiner <hannes@cmpxchg.org>
> 
> On Wed, Aug 24, 2022 at 04:18:29PM +0800, Chengming Zhou wrote:
>> @@ -5171,12 +5220,19 @@ static struct cftype cgroup_base_files[] = {
>>  	{
>>  		.name = "irq.pressure",
>>  		.flags = CFTYPE_PRESSURE,
>> +		.file_offset = offsetof(struct cgroup, psi_files[PSI_IRQ]),
>>  		.seq_show = cgroup_irq_pressure_show,
>>  		.write = cgroup_irq_pressure_write,
>>  		.poll = cgroup_pressure_poll,
>>  		.release = cgroup_pressure_release,
>>  	},
>>  #endif
>> +	{
>> +		.name = "cgroup.pressure",
>> +		.flags = CFTYPE_PRESSURE,
>> +		.seq_show = cgroup_psi_show,
>> +		.write = cgroup_psi_write,
> 
> To match the naming convention, these should be called
> cgroup_pressure_show() and cgroup_pressure_write().

I just find cgroup_pressure_write() already exists, so I change the names
to cgroup_pressure_enable_show() and cgroup_pressure_enable_write(),
since this file name is simplified from "cgroup.pressure.enable".

Thanks.

> 
>> @@ -745,6 +745,14 @@ static void psi_group_change(struct psi_group *group, int cpu,
>>  		if (set & (1 << t))
>>  			groupc->tasks[t]++;
>>  
>> +	if (!group->enabled) {
>> +		if (groupc->state_mask & (1 << PSI_NONIDLE))
>> +			record_times(groupc, now);
> 
> Thanks for the explanation in the other thread, it made sense. But can
> you please add a comment to document it? Something like:
> 
> 	/*
> 	 * On the first group change after disabling PSI, conclude
> 	 * the current state and flush its time. This is unlikely
> 	 * to matter to the user, but aggregation (get_recent_times)
> 	 * may have already incorporated the live state into times_prev;
> 	 * avoid a delta sample underflow when PSI is later re-enabled.
> 	 */
> 
> An unlikely() would also make sense on that branch.
> 
>> @@ -1081,6 +1092,40 @@ void cgroup_move_task(struct task_struct *task, struct css_set *to)
>>  
>>  	task_rq_unlock(rq, task, &rf);
>>  }
>> +
>> +void psi_cgroup_enabled_sync(struct psi_group *group)
>> +{
>> +	int cpu;
>> +
>> +	/*
>> +	 * After we disable psi_group->enabled, we don't actually
>> +	 * stop percpu tasks accounting in each psi_group_cpu,
>> +	 * instead only stop test_state() loop, record_times()
>> +	 * and averaging worker, see psi_group_change() for details.
>> +	 *
>> +	 * When disable cgroup PSI, this function has nothing to sync
>> +	 * since cgroup pressure files are hidden and percpu psi_group_cpu
>> +	 * would see !psi_group->enabled and only do task accounting.
>> +	 *
>> +	 * When re-enable cgroup PSI, this function use psi_group_change()
>> +	 * to get correct state mask from test_state() loop on tasks[],
>> +	 * and restart groupc->state_start from now, use .clear = .set = 0
>> +	 * here since no task status really changed.
>> +	 */
>> +	if (!group->enabled)
>> +		return;
> 
> Thanks for adding the comment, that's helpful.
> 
> I think the function would be a tad clearer and self-documenting if
> you called it psi_cgroup_restart(), and only call it on enabling.
> 
>> +	for_each_possible_cpu(cpu) {
>> +		struct rq *rq = cpu_rq(cpu);
>> +		struct rq_flags rf;
>> +		u64 now;
>> +
>> +		rq_lock_irq(rq, &rf);
>> +		now = cpu_clock(cpu);
>> +		psi_group_change(group, cpu, 0, 0, now, true);
>> +		rq_unlock_irq(rq, &rf);
>> +	}
>> +}
>>  #endif /* CONFIG_CGROUPS */
> 
> Thanks,
> Johannes
