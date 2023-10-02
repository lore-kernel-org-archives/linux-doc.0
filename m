Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DFA9E784BB
	for <linux-doc@archiver.kernel.org>; Mon,  2 Oct 2023 15:09:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237788AbjJBPJc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 2 Oct 2023 11:09:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237798AbjJBPJb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Oct 2023 11:09:31 -0400
Received: from out-205.mta0.migadu.com (out-205.mta0.migadu.com [IPv6:2001:41d0:1004:224b::cd])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FE3FAC
        for <linux-doc@vger.kernel.org>; Mon,  2 Oct 2023 08:09:27 -0700 (PDT)
Message-ID: <eb019ccf-c50b-e9d7-e4e6-f6574f805b49@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1696259366;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gGFXAbaXs8Nj2Cpg5sbO/dCRiJqdUsZgRUuUMFLuVoM=;
        b=VCub66B2s0NLBdJlQd/0EA+LIabve3M0YS4jSkZrd7Pmh4c/m8DAi6C84IDDvMioX5Pz5+
        PufnICXQtrAo8Iqb+1hTKiwkpOdpNhP3K1MbV8D+uBXnQ6LtZKWRPetQAO41GujGztGxF0
        QA/nNYVF+TKp11pwibFcRBnBzFQEdHU=
Date:   Mon, 2 Oct 2023 16:09:18 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next 3/4] dpll: netlink/core: add support for pin-dpll
 signal phase offset/adjust
Content-Language: en-US
To:     Jiri Pirko <jiri@resnulli.us>,
        "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
Cc:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "Brandeburg, Jesse" <jesse.brandeburg@intel.com>,
        "Nguyen, Anthony L" <anthony.l.nguyen@intel.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>
References: <20230927092435.1565336-1-arkadiusz.kubalewski@intel.com>
 <20230927092435.1565336-4-arkadiusz.kubalewski@intel.com>
 <4018c0b0-b288-ff60-09be-7ded382f4a82@linux.dev>
 <DM6PR11MB4657AA79C0C44F868499A3129BC5A@DM6PR11MB4657.namprd11.prod.outlook.com>
 <ZRrb87drG7aVrxsT@nanopsycho>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <ZRrb87drG7aVrxsT@nanopsycho>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 02/10/2023 16:04, Jiri Pirko wrote:
> Mon, Oct 02, 2023 at 04:32:30PM CEST, arkadiusz.kubalewski@intel.com wrote:
>>> From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>>> Sent: Wednesday, September 27, 2023 8:09 PM
>>>
>>> On 27/09/2023 10:24, Arkadiusz Kubalewski wrote:
>>>> Add callback op (get) for pin-dpll phase-offset measurment.
>>>> Add callback ops (get/set) for pin signal phase adjustment.
>>>> Add min and max phase adjustment values to pin proprties.
>>>> Invoke get callbacks when filling up the pin details to provide user
>>>> with phase related attribute values.
>>>> Invoke phase-adjust set callback when phase-adjust value is provided for
>>>> pin-set request.
>>>>
>>>> Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>>>
>>> [...]
>>>
>>>> +static int
>>>> +dpll_pin_phase_adj_set(struct dpll_pin *pin, struct nlattr
>>>> *phase_adj_attr,
>>>> +		       struct netlink_ext_ack *extack)
>>>> +{
>>>> +	struct dpll_pin_ref *ref;
>>>> +	unsigned long i;
>>>> +	s32 phase_adj;
>>>> +	int ret;
>>>> +
>>>> +	phase_adj = nla_get_s32(phase_adj_attr);
>>>> +	if (phase_adj > pin->prop->phase_range.max ||
>>>> +	    phase_adj < pin->prop->phase_range.min) {
>>>> +		NL_SET_ERR_MSG(extack, "phase adjust value not supported");
>>>> +		return -EINVAL;
>>>> +	}
>>>> +	xa_for_each(&pin->dpll_refs, i, ref) {
>>>> +		const struct dpll_pin_ops *ops = dpll_pin_ops(ref);
>>>> +		struct dpll_device *dpll = ref->dpll;
>>>> +
>>>> +		if (!ops->phase_adjust_set)
>>>> +			return -EOPNOTSUPP;
>>>
>>> I'm thinking about this part. We can potentially have dpll devices with
>>> different expectations on phase adjustments, right? And if one of them
>>> won't be able to adjust phase (or will fail in the next line), then
>>> netlink will return EOPNOTSUPP while _some_ of the devices will be
>>> adjusted. Doesn't look great. Can we think about different way to apply
>>> the change?
>>>
>>
>> Well makes sense to me.
>>
>> Does following makes sense as a fix?
>> We would call op for all devices which has been provided with the op.
>> If device has no op -> add extack error, continue
> 
> Is it real to expect some of the device support this and others don't?
> Is it true for ice?
> If not, I would got for all-or-nothing here.
> 

But nothing blocks vendors to provide such configuration. Should we
rollback the configuration? Otherwise we can easily make it
inconsistent.

I'm more thinking of checking if all the devices returned error (or
absence of operation callback) and then return error instead of 0 with
extack filled in.

> 
>> If device fails to set -> add extack error, continue
>> Function always returns 0.
>>
>> Thank you!
>> Arkadiusz
>>
>>>
>>>> +		ret = ops->phase_adjust_set(pin,
>>>> +					    dpll_pin_on_dpll_priv(dpll, pin),
>>>> +					    dpll, dpll_priv(dpll), phase_adj,
>>>> +					    extack);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +	}
>>>> +	__dpll_pin_change_ntf(pin);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +

