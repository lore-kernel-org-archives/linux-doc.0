Return-Path: <SRS0=H354=AN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E550C433DF
	for <linux-doc@archiver.kernel.org>; Thu,  2 Jul 2020 09:32:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7086820702
	for <linux-doc@archiver.kernel.org>; Thu,  2 Jul 2020 09:32:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728184AbgGBJcp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Jul 2020 05:32:45 -0400
Received: from foss.arm.com ([217.140.110.172]:58908 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727057AbgGBJcm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 2 Jul 2020 05:32:42 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5769331B;
        Thu,  2 Jul 2020 02:32:41 -0700 (PDT)
Received: from [10.37.12.95] (unknown [10.37.12.95])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C22A23F71E;
        Thu,  2 Jul 2020 02:32:38 -0700 (PDT)
Subject: Re: [PATCH v5 4/5] coresight: sysfs: Allow select default sink on
 source enable.
To:     mike.leach@linaro.org
Cc:     mathieu.poirier@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, coresight@lists.linaro.org,
        corbet@lwn.net
References: <20200616164006.15309-1-mike.leach@linaro.org>
 <20200616164006.15309-5-mike.leach@linaro.org>
 <20200629174756.GA3724199@xps15>
 <CAJ9a7ViHMXTiXqbNPQPBBBs87XHALvh6bW+nTiysfvK2TQGRoA@mail.gmail.com>
 <ce4437ae-072b-dc2e-21ad-1390825fda43@arm.com>
 <CAJ9a7VjzEb_7xFu2sjeCsORay5t0HKv8c4hVau9LTCdvy4=xyA@mail.gmail.com>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <2b8e494f-8c0c-e568-de12-8537beeda757@arm.com>
Date:   Thu, 2 Jul 2020 10:37:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAJ9a7VjzEb_7xFu2sjeCsORay5t0HKv8c4hVau9LTCdvy4=xyA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 07/02/2020 01:21 AM, Mike Leach wrote:
> Hi Suzuki,
> 
> On Wed, 1 Jul 2020 at 23:19, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>>
>> Hi Mike, Mathieu,
>>
>> On 07/01/2020 05:40 PM, Mike Leach wrote:
>>> Hi Mathieu,
>>>
>>> On Mon, 29 Jun 2020 at 18:47, Mathieu Poirier
>>> <mathieu.poirier@linaro.org> wrote:
>>>>
>>>> Hi Mike,
>>>>
>>>> I have applied patches 1 to 3 of this set.  Please see below for comments on
>>>> this patch.
>>>>
>>>> On Tue, Jun 16, 2020 at 05:40:05PM +0100, Mike Leach wrote:
>>>>> When enabling a trace source using sysfs, allow the CoreSight system to
>>>>> auto-select a default sink if none has been enabled by the user.
>>>>>
>>>>> Uses the sink select algorithm that uses the default select priorities
>>>>> set when sinks are registered with the system. At present this will
>>>>> prefer ETR over ETB / ETF.
>>>>>
>>>>> Adds a new attribute 'last_sink' to source CoreSight devices. This is set
>>>>> when a source is enabled using sysfs, to the sink that the device will
>>>>> trace into. This applies for both user enabled and default enabled sinks.
>>>>>
>>>>> Signed-off-by: Mike Leach <mike.leach@linaro.org>
>>>>> ---
>>>>>    drivers/hwtracing/coresight/coresight.c | 39 +++++++++++++++++++++++--
>>>>>    include/linux/coresight.h               |  3 ++
>>>>>    2 files changed, 40 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/hwtracing/coresight/coresight.c b/drivers/hwtracing/coresight/coresight.c
>>>>> index e9c90f2de34a..db39e0b56994 100644
>>>>> --- a/drivers/hwtracing/coresight/coresight.c
>>>>> +++ b/drivers/hwtracing/coresight/coresight.c
>>>>> @@ -934,6 +934,16 @@ static void coresight_clear_default_sink(struct coresight_device *csdev)
>>>>>         }
>>>>>    }
>>>>>
>>>>> +static void coresight_set_last_sink_name(struct coresight_device *source,
>>>>> +                                      struct coresight_device *sink)
>>>>> +{
>>>>> +     /* remove current value and set new one if *sink not NULL */
>>>>> +     kfree(source->last_sink);
>>>>> +     source->last_sink = NULL;
>>>>> +     if (sink)
>>>>> +             source->last_sink = kstrdup(dev_name(&sink->dev), GFP_KERNEL);
>>>>> +}
>>>>> +
>>>>>    /** coresight_validate_source - make sure a source has the right credentials
>>>>>     *  @csdev:  the device structure for a source.
>>>>>     *  @function:       the function this was called from.
>>>>> @@ -994,8 +1004,15 @@ int coresight_enable(struct coresight_device *csdev)
>>>>>          */
>>>>>         sink = coresight_get_enabled_sink(false);
>>>>>         if (!sink) {
>>>>> -             ret = -EINVAL;
>>>>> -             goto out;
>>>>> +             /* look for a default sink if nothing enabled */
>>>>> +             sink = coresight_find_default_sink(csdev);
>>>>> +             if (!sink) {
>>>>> +                     ret = -EINVAL;
>>>>> +                     goto out;
>>>>> +             }
>>>>> +             /* mark the default as enabled */
>>>>> +             sink->activated = true;
>>>>> +             dev_info(&sink->dev, "Enabled default sink.");
>>>>
>>>> I'm very ambivalent about extending the automatic sink selection to the sysfs
>>>> interface, mainly because of the new sysfs entry it requires.
>>>
>>> That's interesting - this was added to overcome Suzuki's objection
>>> that it wasn't possible to determine which sink was in use!
>>
>> I personally don't prefer the auto selection for sysfs mode. And that
>> was one of the arguments to support it.
>>
>>>
>>> However, I think it is important to allow this as once we see systems
>>> with many cores + many sinks, determining the correct sink to enable
>>> becomes much more difficult.
>>>
>>> You said yourself, albeit in relation to perf, that for 1:1 systems,
>>> sink selection should be implicit. This is something I completely
>>> agree with, and hence the automatic selection algorithm that was
>>> chosen to ensure that this is the case.
>>> Is there any reason not to make the same assertion for sysfs?
>>>
>>> Further, this allows sysfs users to write board agnostic tests
>>> (similar to the one Leo wrote for perf) - effectively all we need to
>>> do to test the coresight function on a board is iterate through the
>>> cpus / etms without worrying about the sink in use, then name of which
>>> can be read from the etm and then data read out.
>>
>> The tests could use the "connections" exposed via the sysfs to figure
>> out the appropriate sink for a given source.
>>
>>>
>>> As an aside - last_sink also shows which sink was used should you
>>> happen to explicitly enable two sinks in the etm path (e.g. etf &
>>> etr).
>>>
>>>>    I find it
>>>> clunky that users don't have to specify the sink to use but have to explicitly
>>>> disable it after the trace session.
>>>
>>> Sure - but is it not just as clunky to have to figure out which sink
>>> attaches to your etm in the first place? (yes there are topolgy links
>>> now but this is not the most straighforward thing to use)
>>> Ultimately, if you are only using sysfs, you never actually need to
>>> disable the sink to read back data if you don't want to. I am not sure
>>> there are many people who use both syfs and perf in the same session
>>> to collect trace - and these are the ones who would need to be careful
>>> about disabling the sink.
>>
>> The problem lies exactly there. Just like we don't know how many actual
>> sysfs mode users are there, who consume the trace data and use it in a
>> production environment compared to a bring up situation (verifying
>> that the board topology is detected fine and the components are working
>> fine), there could be users of the perf on these systems.
>>
> 
> This is an issue irrespective of how the trace sink is turned on, be
> it automatically or explicitly.
> Given that it is possible to read the sink data without disabling the
> sink - the chances are it could happen either way.
> 
>> Debugging such cases where someone forgot to disable the trace can be
>> a painful process. Like I have said from the beginning, this is not
>> worth the benefit that we get from this code (i.e, figuring out which
>> sink is closer to a source in sysfs mode, when there is an existing
>> infrastructure, i.e, "connections" already available for this).
>>
> 
> Actually all connections can tell you is the number sinks available to
> the etm on the path - not which would be selected by the current
> priority algorithm - unless the user is willing to dig into the driver
> source code and figure out the priority mechanism.

Exactly. My point is, don't do this for sysfs mode.
The user can figure this out for sysfs mode, if he/she wanted to (unlike 
the perf mode, where the event could be placed on any CPU). We
don't have to add this fragile change just because the user
don't want to do this himself, when he must know what was used for 
collecting the trace back (again, something the perf mode doesn't have
to worry about and is justifying the use there). In other words, the
change for sysfs mode is not justified enough.

Cheers
Suzuki


> 
> Regards
> 
> Mike
> 
>> Cheers
>> Suzuki
> 
> 
> 

