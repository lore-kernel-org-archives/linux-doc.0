Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6ABFE7542B
	for <linux-doc@archiver.kernel.org>; Tue,  3 Oct 2023 06:27:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbjJCG1P (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Oct 2023 02:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239160AbjJCG1O (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Oct 2023 02:27:14 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81FEFD9
        for <linux-doc@vger.kernel.org>; Mon,  2 Oct 2023 23:27:09 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-534659061afso765618a12.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Oct 2023 23:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1696314428; x=1696919228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nasBPIo/xHcUBNpodGyPU6trXTolky3DJWsttEP7pMQ=;
        b=v7y4GTqN9zHXkvEPRgbVfNa1qUMxDszzY71kYW9V8KtXQ9vgfWrPAgOOH1wV3M8qNg
         3M23DZuiMLcb5Rhb8twZjfhJGPPM4Oce4ULeeGE7Ls7+I3n9xwUpEiaRvWi96MUuuYGa
         1n0JRqa7G0GIjFJBsYhDuGVcpqULeKjGHIRVLXznxqTg8CQy+Vgrn4NFVYBSS+koNurB
         AO9i1Uta2iDs03lip1TDk0YM6bHojnk9d7lIyLs7ow1sADcNCVpRn6JVbWfeUSDOrkwb
         C8oFYfWVNG+WNbzZ/6dluZgh8xdve1DpaFGPKSPbutdtvSO6V2Bjzjp+Y+X6s6nZOWo4
         4CNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696314428; x=1696919228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nasBPIo/xHcUBNpodGyPU6trXTolky3DJWsttEP7pMQ=;
        b=HRdcjqOe/1gQzGEAeDut6TEGPn3ZociTQ8EHvv8eLnOyS1mJ4ep7Ex1S/m8HkjzR0Q
         org1XBjvdRT4ubMCFQdCgcixBNPImTuFqTcopHkub+d9EeFSm0ONl68FMk1UAseGCQiH
         AkcAFIt1OwLlQITm+Vi5EMvbPMmhqqhcONduH8fSWtY9S43dTiP1BpAu07Z4QmPGIHXm
         +CQIvRR3qIQdXdkU3fEYQ2pBYJqqINHwPuAXu0YNz4ENkir5iE2l3zPorg+LkuqGWEkQ
         C1Jn8w/xSdcw5V+cwFgIqFc6XxsNrXd5EZ2t+RXGu2+vAHCTBt+MlpeXKR5mVcVnyX9o
         MQ0g==
X-Gm-Message-State: AOJu0YxY3CAGsmDU837rlHSzlKT022l22EBWnJDLsuUcpt/lp2lPCa99
        J6QyerSIkfpGlXw7UNsaay0AkQ==
X-Google-Smtp-Source: AGHT+IGktzEJPQwQ4FrIOHaSByngUhSzABrutCkp7xAGo5V5R4BfWDuJKH4B8vDl7eGG7nhBjMIC2g==
X-Received: by 2002:a50:ec89:0:b0:533:3d2b:7473 with SMTP id e9-20020a50ec89000000b005333d2b7473mr11167966edr.12.1696314427737;
        Mon, 02 Oct 2023 23:27:07 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id b20-20020aa7c914000000b0053331f9094dsm323417edt.52.2023.10.02.23.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 23:27:07 -0700 (PDT)
Date:   Tue, 3 Oct 2023 08:27:06 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
Cc:     Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "Brandeburg, Jesse" <jesse.brandeburg@intel.com>,
        "Nguyen, Anthony L" <anthony.l.nguyen@intel.com>,
        "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "davem@davemloft.net" <davem@davemloft.net>
Subject: Re: [Intel-wired-lan] [PATCH net-next 3/4] dpll: netlink/core: add
 support for pin-dpll signal phase offset/adjust
Message-ID: <ZRu0OlwKWSmXFOcV@nanopsycho>
References: <20230927092435.1565336-1-arkadiusz.kubalewski@intel.com>
 <20230927092435.1565336-4-arkadiusz.kubalewski@intel.com>
 <4018c0b0-b288-ff60-09be-7ded382f4a82@linux.dev>
 <DM6PR11MB4657AA79C0C44F868499A3129BC5A@DM6PR11MB4657.namprd11.prod.outlook.com>
 <ZRrb87drG7aVrxsT@nanopsycho>
 <eb019ccf-c50b-e9d7-e4e6-f6574f805b49@linux.dev>
 <DM6PR11MB4657DB3C9BC3E1EFE6A2F3389BC5A@DM6PR11MB4657.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB4657DB3C9BC3E1EFE6A2F3389BC5A@DM6PR11MB4657.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tue, Oct 03, 2023 at 01:10:39AM CEST, arkadiusz.kubalewski@intel.com wrote:
>>From: Intel-wired-lan <intel-wired-lan-bounces@osuosl.org> On Behalf Of
>>Vadim Fedorenko
>>Sent: Monday, October 2, 2023 5:09 PM
>>
>>On 02/10/2023 16:04, Jiri Pirko wrote:
>>> Mon, Oct 02, 2023 at 04:32:30PM CEST, arkadiusz.kubalewski@intel.com
>>> wrote:
>>>>> From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>>>>> Sent: Wednesday, September 27, 2023 8:09 PM
>>>>>
>>>>> On 27/09/2023 10:24, Arkadiusz Kubalewski wrote:
>>>>>> Add callback op (get) for pin-dpll phase-offset measurment.
>>>>>> Add callback ops (get/set) for pin signal phase adjustment.
>>>>>> Add min and max phase adjustment values to pin proprties.
>>>>>> Invoke get callbacks when filling up the pin details to provide user
>>>>>> with phase related attribute values.
>>>>>> Invoke phase-adjust set callback when phase-adjust value is provided
>>>>>> for
>>>>>> pin-set request.
>>>>>>
>>>>>> Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>>>>>
>>>>> [...]
>>>>>
>>>>>> +static int
>>>>>> +dpll_pin_phase_adj_set(struct dpll_pin *pin, struct nlattr
>>>>>> *phase_adj_attr,
>>>>>> +		       struct netlink_ext_ack *extack)
>>>>>> +{
>>>>>> +	struct dpll_pin_ref *ref;
>>>>>> +	unsigned long i;
>>>>>> +	s32 phase_adj;
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	phase_adj = nla_get_s32(phase_adj_attr);
>>>>>> +	if (phase_adj > pin->prop->phase_range.max ||
>>>>>> +	    phase_adj < pin->prop->phase_range.min) {
>>>>>> +		NL_SET_ERR_MSG(extack, "phase adjust value not supported");
>>>>>> +		return -EINVAL;
>>>>>> +	}
>>>>>> +	xa_for_each(&pin->dpll_refs, i, ref) {
>>>>>> +		const struct dpll_pin_ops *ops = dpll_pin_ops(ref);
>>>>>> +		struct dpll_device *dpll = ref->dpll;
>>>>>> +
>>>>>> +		if (!ops->phase_adjust_set)
>>>>>> +			return -EOPNOTSUPP;
>>>>>
>>>>> I'm thinking about this part. We can potentially have dpll devices with
>>>>> different expectations on phase adjustments, right? And if one of them
>>>>> won't be able to adjust phase (or will fail in the next line), then
>>>>> netlink will return EOPNOTSUPP while _some_ of the devices will be
>>>>> adjusted. Doesn't look great. Can we think about different way to apply
>>>>> the change?
>>>>>
>>>>
>>>> Well makes sense to me.
>>>>
>>>> Does following makes sense as a fix?
>>>> We would call op for all devices which has been provided with the op.
>>>> If device has no op -> add extack error, continue
>>>
>>> Is it real to expect some of the device support this and others don't?
>>> Is it true for ice?
>>> If not, I would got for all-or-nothing here.
>>>
>>
>>But nothing blocks vendors to provide such configuration. Should we
>>rollback the configuration? Otherwise we can easily make it
>>inconsistent.
>
>Good point, in such case rollback might be required.
>
>>
>>I'm more thinking of checking if all the devices returned error (or
>>absence of operation callback) and then return error instead of 0 with
>>extack filled in.
>>
>
>Well, what if different devices would return different errors?
>In general we would have to keep track of the error values returned in
>such case.. Assuming one is different than the other - still need to error
>extack them out? I guess it would be easier to return common error if there

In this case, it is common to return the first error hit and bail out,
not trying the rest.


>were only failures and let the driver fill the errors on extack, smt like:
>
>	int miss_cb_num = 0, dev_num = 0, err_num;
>
>	xa_for_each(&pin->dpll_refs, i, ref) {
>		const struct dpll_pin_ops *ops = dpll_pin_ops(ref);
>		struct dpll_device *dpll = ref->dpll;
>
>		dev_num++;
>		if (!ops->phase_adjust_set) {
>			miss_cb_num++;
>			continue;
>		}
>		ret = ops->phase_adjust_set(pin,
>					dpll_pin_on_dpll_priv(dpll, pin),
>					dpll, dpll_priv(dpll), phase_adj,
>					extack);
>		if (ret)
>			err_num++;
>	}
>	if (dev_num == miss_cb_num)
>		return -EOPNOTSUPP;
>	if (dev_num == err_num)
>		return -EINVAL;
>	__dpll_pin_change_ntf(pin);
>	return 0;
>
>??
>
>Thank you!
>Arkadiusz
>
>>>
>>>> If device fails to set -> add extack error, continue
>>>> Function always returns 0.
>>>>
>>>> Thank you!
>>>> Arkadiusz
>>>>
>>>>>
>>>>>> +		ret = ops->phase_adjust_set(pin,
>>>>>> +					    dpll_pin_on_dpll_priv(dpll, pin),
>>>>>> +					    dpll, dpll_priv(dpll), phase_adj,
>>>>>> +					    extack);
>>>>>> +		if (ret)
>>>>>> +			return ret;
>>>>>> +	}
>>>>>> +	__dpll_pin_change_ntf(pin);
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>
>>_______________________________________________
>>Intel-wired-lan mailing list
>>Intel-wired-lan@osuosl.org
>>https://lists.osuosl.org/mailman/listinfo/intel-wired-lan
