Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E74E95A8E
	for <linux-doc@archiver.kernel.org>; Mon,  9 Oct 2023 14:50:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233309AbjJIOu5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 Oct 2023 10:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbjJIOu5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Oct 2023 10:50:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9473BCA
        for <linux-doc@vger.kernel.org>; Mon,  9 Oct 2023 07:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696863005;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0QI01TR518bmXZ35JoYLXbNHoVx8+Aq7SAiCBhjb9JM=;
        b=cHulkPud1YAYAZ6ZZPQflPseKS30WNdPSTc1zL03kMJRnwOwvw4r4/uyGsrIMyvL2vhh4P
        51RYwsP8kR27DmvXeZoCXPKV86vEVDWInwrxjoO7bJdSL0m1zV7lb/jqJH+XTYvOkkJGl+
        2tCHq/BIyoULMXbTJojXZOhVB9GB0f8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-hNUsxO1SNEmFIG0lxdvAbQ-1; Mon, 09 Oct 2023 10:50:04 -0400
X-MC-Unique: hNUsxO1SNEmFIG0lxdvAbQ-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-65b14f88921so58276176d6.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Oct 2023 07:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696863004; x=1697467804;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0QI01TR518bmXZ35JoYLXbNHoVx8+Aq7SAiCBhjb9JM=;
        b=U5C1eofETq2YSk3TcmXTN3e9mC9Iy/A3yjbUda1LazZMyP6JmCE/ACyrKa3ZboPdUc
         LePTMUIORKtFOX73uNmt6MLxtMVsQb1pPZYN4iur1K1mXDcSvEMZjWJDdYTQIpBM5hPt
         Wq9sxXONvIAJ0g5YaqeoGpRRR5smB8TTppImixRbKo9p8+u0uwP54NYFD9EExzr8oSM5
         6GFKtrlRDFaqh+60iayEt6UVCkIChzeg0WgMTS8PGVVMD8XHxKgM0yF/CrnJ7Lvh6Qpv
         Ve785KLNQ3x+5GnV2dd/NcKoNQpn3IhRVmJlQAcO4/3/lqiB2sU/C2U+JoMQJgiigNPq
         orLQ==
X-Gm-Message-State: AOJu0YyrBHKG4aqVBS/YnscJ3/9lD0ZCHFre1C4b3CQ9GcPzAhQht0Je
        743h7H6mRHyryVHmNfct06HlQDcbV1Fakz8zEgx4SixJACUjyIcAprFjI5OUHPQbkcze4eUMQvS
        KrBRZM3Vzg2LCiGxt9prs3gcz6W7QwVYHr7WPkng6gICYVaBENLr6keVYHhBTA/f4yiisbNFgxG
        RFavhS
X-Received: by 2002:a05:6214:5b0e:b0:65a:f1f2:470d with SMTP id ma14-20020a0562145b0e00b0065af1f2470dmr17296804qvb.58.1696863004013;
        Mon, 09 Oct 2023 07:50:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnMvDowT6c21TFAV40BzM0CK5NbMAXkDhmYPM3AH74OBOqDL5i5Vzxfry6kTn67iNpz4YE9A==
X-Received: by 2002:a05:6214:5b0e:b0:65a:f1f2:470d with SMTP id ma14-20020a0562145b0e00b0065af1f2470dmr17296778qvb.58.1696863003778;
        Mon, 09 Oct 2023 07:50:03 -0700 (PDT)
Received: from vschneid.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id d7-20020a0cb2c7000000b0064f5d70d072sm3956354qvf.37.2023.10.09.07.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 07:50:03 -0700 (PDT)
From:   Valentin Schneider <vschneid@redhat.com>
To:     Shrikanth Hegde <sshegde@linux.vnet.ibm.com>, mingo@redhat.com,
        peterz@infradead.org, vincent.guittot@linaro.org
Cc:     sshegde@linux.vnet.ibm.com, dietmar.eggemann@arm.com,
        linux-kernel@vger.kernel.org, qperret@google.com,
        srikar@linux.vnet.ibm.com, mingo@kernel.org,
        pierre.gondois@arm.com, yu.c.chen@intel.com,
        tim.c.chen@linux.intel.com, pauld@redhat.com, lukasz.luba@arm.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 2/2] sched/topology: change behaviour of sysctl
 sched_energy_aware based on the platform
In-Reply-To: <20231009060037.170765-3-sshegde@linux.vnet.ibm.com>
References: <20231009060037.170765-1-sshegde@linux.vnet.ibm.com>
 <20231009060037.170765-3-sshegde@linux.vnet.ibm.com>
Date:   Mon, 09 Oct 2023 16:49:59 +0200
Message-ID: <xhsmhmswronoo.mognet@vschneid.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 09/10/23 11:30, Shrikanth Hegde wrote:
> sysctl sched_energy_aware is available for the admin to disable/enable
> energy aware scheduling(EAS). EAS is enabled only if few conditions are
> met by the platform. They are, asymmetric CPU capacity, no SMT,
> schedutil CPUfreq governor, frequency invariant load tracking etc.
> A platform may boot without EAS capability, but could gain such
> capability at runtime. For example, changing/registering the CPUfreq
> governor to schedutil.
>
> At present, though platform doesn't support EAS, this sysctl returns 1
> and it ends up calling build_perf_domains on write to 1 and
> NOP when writing to 0. That is confusing and un-necessary.
>
> Desired behavior would be to have this sysctl to enable/disable the EAS
> on supported platform. On non-supported platform write to the sysctl
> would return not supported error and read of the sysctl would return
> empty. So
> sched_energy_aware returns empty - EAS is not possible at this moment
> This will include EAS capable platforms which have at least one EAS
> condition false during startup, e.g. not using the schedutil CPUfreq governor
> sched_energy_aware returns 0 - EAS is supported but disabled by admin.
> sched_energy_aware returns 1 - EAS is supported and enabled.
>
> User can find out the reason why EAS is not possible by checking
> info messages. sched_is_eas_possible returns true if the platform
> can do EAS at this moment.
>
> Tested-by: Pierre Gondois <pierre.gondois@arm.com>
> Signed-off-by: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>

Reviewed-by: Valentin Schneider <vschneid@redhat.com>

