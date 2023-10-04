Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E85ACE7B5F4
	for <linux-doc@archiver.kernel.org>; Wed,  4 Oct 2023 11:28:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232919AbjJDL2o (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 Oct 2023 07:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232784AbjJDL2n (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Oct 2023 07:28:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 442CFB0
        for <linux-doc@vger.kernel.org>; Wed,  4 Oct 2023 04:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696418880;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cdSHfe2J9tX/CZK02hK8nd5jgBFEGIUPIxT9+V2vDwg=;
        b=OaVkUjPZgJZLqzQYCDFNO1hgpw7/mCj/R6XhuzRU0/lJeVqk3i3VRlGtuLlWnVBQw24DS4
        tlclZtZ5V3FLkjhcmQxig8vf7hJAEz27t8ruMJ/IwngVr+XVz544KPwUcaXNaxl+bMbCUU
        KQW2rrMkb1LvDnQNPy6NfGKEcXsJEmI=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-MNBBj4HAPUq4xZrk0NHZbg-1; Wed, 04 Oct 2023 07:27:57 -0400
X-MC-Unique: MNBBj4HAPUq4xZrk0NHZbg-1
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-49a4fc85779so583145e0c.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Oct 2023 04:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696418876; x=1697023676;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cdSHfe2J9tX/CZK02hK8nd5jgBFEGIUPIxT9+V2vDwg=;
        b=vsdRghABwC/fYky+hTZwGEjzHg9aChpVROUcbIjR/W98NxI4W5p9sMoiNqqik9TWYm
         dj/cvWs4H8uZ4lBNgdoIbM6ANVrEQgeD7x/fOlToPVPReu3QDpfHJH7RsnU64tY7Z4t4
         zM7wNTSEF3UPxH4zQpOFUlhLwlVaa4B6tUPV0RmicbwXeSw0FfeJR/s7HxzIPjHEN4+P
         8EEdOyA0fIPxRYs3bBnC8kgCGdq5Lz/qopCnJYsbwhW1pbEoXgOX8a7eJWEeYDl7zfUq
         SG7RtUg7PTg06kvTEEYQXDDhSeEgQ3oUufBjJw4k4/FVYTK6IaajvLTfGS13MqAZ6Y/o
         +PQg==
X-Gm-Message-State: AOJu0YzvZE6H+B0Yl9gsN9tF655I8BBL0UvrzdSUR+XMH/fFu6siT0mr
        WOtexe/UI5cwyCpiQ8JbBZeQ1a5jREv2Mt/HMGbhgjnR0h5BCGh7KBKHmRtM9JtgnQ44Na50pGZ
        K2agD4W4hLkGEv4FTofQx
X-Received: by 2002:a1f:d687:0:b0:499:dec9:e1a7 with SMTP id n129-20020a1fd687000000b00499dec9e1a7mr1466072vkg.10.1696418876474;
        Wed, 04 Oct 2023 04:27:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqNF0zOVj059OFBBhwaXxiooYEPYkXZwSeFwrBxTJnmjzT3Zjs0XhqZTgjd89sE+eJY+TS6g==
X-Received: by 2002:a1f:d687:0:b0:499:dec9:e1a7 with SMTP id n129-20020a1fd687000000b00499dec9e1a7mr1466049vkg.10.1696418876198;
        Wed, 04 Oct 2023 04:27:56 -0700 (PDT)
Received: from vschneid.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id t3-20020ac87383000000b0041957506ca9sm1149451qtp.15.2023.10.04.04.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 04:27:55 -0700 (PDT)
From:   Valentin Schneider <vschneid@redhat.com>
To:     Shrikanth Hegde <sshegde@linux.vnet.ibm.com>, mingo@redhat.com,
        peterz@infradead.org, vincent.guittot@linaro.org
Cc:     sshegde@linux.vnet.ibm.com, dietmar.eggemann@arm.com,
        linux-kernel@vger.kernel.org, ionela.voinescu@arm.com,
        qperret@google.com, srikar@linux.vnet.ibm.com,
        mgorman@techsingularity.net, mingo@kernel.org,
        pierre.gondois@arm.com, yu.c.chen@intel.com,
        tim.c.chen@linux.intel.com, pauld@redhat.com, lukasz.luba@arm.com,
        linux-doc@vger.kernel.org, bsegall@google.com, linux-eng@arm.com
Subject: Re: [PATCH v5 2/2] sched/topology: change behaviour of sysctl
 sched_energy_aware based on the platform
In-Reply-To: <20230929155209.667764-3-sshegde@linux.vnet.ibm.com>
References: <20230929155209.667764-1-sshegde@linux.vnet.ibm.com>
 <20230929155209.667764-3-sshegde@linux.vnet.ibm.com>
Date:   Wed, 04 Oct 2023 13:27:50 +0200
Message-ID: <xhsmhttr6oceh.mognet@vschneid.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 29/09/23 21:22, Shrikanth Hegde wrote:
> +static bool sched_is_eas_possible(const struct cpumask *cpu_mask)
> +{
> +	bool any_asym_capacity = false;
> +	struct cpufreq_policy *policy;
> +	struct cpufreq_governor *gov;
> +	int i;
> +
> +	/* EAS is enabled for asymmetric CPU capacity topologies. */
> +	for_each_cpu(i, cpu_mask) {
> +		if (per_cpu(sd_asym_cpucapacity, i)) {

Lockdep should complain here in the sysctl path - this is an RCU-protected
pointer.

rcu_access_pointer() should do since you're not dereferencing the pointer.

> +			any_asym_capacity = true;
> +			break;
> +		}
> +	}

> @@ -231,6 +295,15 @@ static int sched_energy_aware_handler(struct ctl_table *table, int write,
>               return -EPERM;
>
>       ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);

Shouldn't this happen after we check sched_is_eas_possible()? Otherwise
AFAICT a write can actually happen despite !sched_is_eas_possible().

> +	if (!sched_is_eas_possible(cpu_active_mask)) {
> +		if (write) {
> +			return -EOPNOTSUPP;
> +		} else {
> +			*lenp = 0;
> +			return 0;
> +		}
> +	}

But now this is making me wonder, why not bite the bullet and store
somewhere whether we ever managed to enable EAS? Something like so?
(I didn't bother making this yet another static key given this is not a hot
path at all)
---
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index e0b9920e7e3e4..abd950f434206 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -209,6 +209,7 @@ sd_parent_degenerate(struct sched_domain *sd, struct sched_domain *parent)
 #if defined(CONFIG_ENERGY_MODEL) && defined(CONFIG_CPU_FREQ_GOV_SCHEDUTIL)
 DEFINE_STATIC_KEY_FALSE(sched_energy_present);
 static unsigned int sysctl_sched_energy_aware = 1;
+static bool __read_mostly sched_energy_once;
 static DEFINE_MUTEX(sched_energy_mutex);
 static bool sched_energy_update;
 
@@ -230,6 +231,15 @@ static int sched_energy_aware_handler(struct ctl_table *table, int write,
 	if (write && !capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
+	if (!sched_energy_once) {
+		if (write) {
+			return -EOPNOTSUPP;
+		} else {
+			*lenp = 0;
+			return 0;
+		}
+	}
+
 	ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
 	if (!ret && write) {
 		state = static_branch_unlikely(&sched_energy_present);
@@ -340,6 +350,8 @@ static void sched_energy_set(bool has_eas)
 		if (sched_debug())
 			pr_info("%s: starting EAS\n", __func__);
 		static_branch_enable_cpuslocked(&sched_energy_present);
+		// Record that we managed to enable EAS at least once
+		sched_energy_once = true;
 	}
 }
 

