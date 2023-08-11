Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2990C001DB
	for <linux-doc@archiver.kernel.org>; Fri, 11 Aug 2023 08:57:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbjHKI5U (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Aug 2023 04:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbjHKI5T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Aug 2023 04:57:19 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 513BB9B;
        Fri, 11 Aug 2023 01:57:18 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 777DDD75;
        Fri, 11 Aug 2023 01:58:00 -0700 (PDT)
Received: from [10.163.54.13] (unknown [10.163.54.13])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C36B83F59C;
        Fri, 11 Aug 2023 01:57:14 -0700 (PDT)
Message-ID: <1c0e47a0-1e84-1e02-33dd-76d8eaaa41b0@arm.com>
Date:   Fri, 11 Aug 2023 14:27:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V3 2/3] coresight: etm: Make cycle count threshold user
 configurable
Content-Language: en-US
To:     Mike Leach <mike.leach@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, suzuki.poulose@arm.com,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        James Clark <james.clark@arm.com>,
        Leo Yan <leo.yan@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, coresight@lists.linaro.org,
        linux-kernel@vger.kernel.org
References: <20230811034600.944386-1-anshuman.khandual@arm.com>
 <20230811034600.944386-3-anshuman.khandual@arm.com>
 <CAJ9a7VgNmY0_vPfRfz=+hSjbFqnsOAzBgHtZva9fkG04mRaeaQ@mail.gmail.com>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <CAJ9a7VgNmY0_vPfRfz=+hSjbFqnsOAzBgHtZva9fkG04mRaeaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 8/11/23 14:22, Mike Leach wrote:
> On Fri, 11 Aug 2023 at 04:46, Anshuman Khandual
> <anshuman.khandual@arm.com> wrote:
>>
>> Cycle counting is enabled, when requested and supported but with a default
>> threshold value ETM_CYC_THRESHOLD_DEFAULT i.e 0x100 getting into TRCCCCTLR,
>> representing the minimum interval between cycle count trace packets.
>>
>> This makes cycle threshold user configurable, from the user space via perf
>> event attributes. Although it falls back using ETM_CYC_THRESHOLD_DEFAULT,
>> in case no explicit request. As expected it creates a sysfs file as well.
>>
>> /sys/bus/event_source/devices/cs_etm/format/cc_threshold
>>
>> New 'cc_threshold' uses 'event->attr.config3' as no more space is available
>> in 'event->attr.config1' or 'event->attr.config2'.
>>
>> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Cc: Mike Leach <mike.leach@linaro.org>
>> Cc: James Clark <james.clark@arm.com>
>> Cc: Leo Yan <leo.yan@linaro.org>
>> Cc: coresight@lists.linaro.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-doc@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  drivers/hwtracing/coresight/coresight-etm-perf.c   |  2 ++
>>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 12 ++++++++++--
>>  2 files changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> index 5ca6278baff4..09f75dffae60 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> @@ -68,6 +68,7 @@ PMU_FORMAT_ATTR(preset,               "config:0-3");
>>  PMU_FORMAT_ATTR(sinkid,                "config2:0-31");
>>  /* config ID - set if a system configuration is selected */
>>  PMU_FORMAT_ATTR(configid,      "config2:32-63");
>> +PMU_FORMAT_ATTR(cc_threshold,  "config3:0-11");
>>
>>
>>  /*
>> @@ -101,6 +102,7 @@ static struct attribute *etm_config_formats_attr[] = {
>>         &format_attr_preset.attr,
>>         &format_attr_configid.attr,
>>         &format_attr_branch_broadcast.attr,
>> +       &format_attr_cc_threshold.attr,
>>         NULL,
>>  };
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> index 1f3d29a639ff..ad28ee044cba 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> @@ -644,7 +644,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>>         struct etmv4_config *config = &drvdata->config;
>>         struct perf_event_attr *attr = &event->attr;
>>         unsigned long cfg_hash;
>> -       int preset;
>> +       int preset, cc_threshold;
>>
>>         /* Clear configuration from previous run */
>>         memset(config, 0, sizeof(struct etmv4_config));
>> @@ -667,7 +667,15 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>>         if (attr->config & BIT(ETM_OPT_CYCACC)) {
>>                 config->cfg |= TRCCONFIGR_CCI;
>>                 /* TRM: Must program this for cycacc to work */
>> -               config->ccctlr = ETM_CYC_THRESHOLD_DEFAULT;
>> +               cc_threshold = attr->config3 & ETM_CYC_THRESHOLD_MASK;
>> +               if (cc_threshold) {
>> +                       if (cc_threshold < drvdata->ccitmin)
>> +                               config->ccctlr = drvdata->ccitmin;
>> +                       else
>> +                               config->ccctlr = cc_threshold;
>> +               } else {
>> +                       config->ccctlr = ETM_CYC_THRESHOLD_DEFAULT;
> 
> Don't normally have {} round a single statement else clause - did

I would believe single statement else clause could have { }, only
when the preceding if clause consists of multiple statements just
to be symmetrical ? 

> checkpatch.pl not object here?

No, it does not object.

> 
> 
> Otherwise
> 
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> 
>> +               }
>>         }
>>         if (attr->config & BIT(ETM_OPT_TS)) {
>>                 /*
>> --
>> 2.25.1
>>
> 
> 
