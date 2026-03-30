Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD70F3B52E0;
	Mon, 30 Mar 2026 10:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774866458; cv=none; b=VeWmj+OhrDiQnGK+V7b9pxk32Lw7hVw6SBqv99BHUjIbQsyvWSTHFCKqvait8vj8FOgdx7KESTWKe3W1NmfReZRSgGF+FJ20ZPqDl3dJ7SOsGLs2CUKuU9aD2Fv0rGV84+/sGKxNiOk77fwdD5W/3hjGbDL9U17csFHw1IdGVN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774866458; c=relaxed/simple;
	bh=+Qteq5dPyhbY15tJRt3TuJmErEIzgLhr1XV4UIcwuoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L6dQHnWN9cYTq3LLFo+XjgNaFCQvVwc/Ff34hlCSX9rk9myiU7yjRH4XlD4LgkZGAZPPpRWUoRRivd01Jb9ppsagdaK2Hib2QB9gdgN/TTbx9gt0j3PYq7V0JX0du/SLNNz17sD1+Ol38BBrLWhEqbkVXRwOHbHBgAFP5vpRmBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SzMLjlBB; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SzMLjlBB"
Message-ID: <447c9ec1-2f3e-4da6-bcd0-febce271ae6f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774866454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nUQgRzqepPeMNaAgLk7AwaLDULRzH/pnHtqpTNEISBs=;
	b=SzMLjlBB+PjsuuLHyVZ/zuy1uGb/2ASld9OBG6zvgqhznPEtkHaByJk3pawZdIk3/Ej/Ip
	C1dHEx9DpU/ABODUw2aCem3p9GWv7TcdMAqMQdV61HGo+twJ+n7/tAMLGRcox+RHE/XC/w
	lffWMqSFZ/6zwYfFh7J7DLYaoRBeaDI=
Date: Mon, 30 Mar 2026 11:27:30 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next 2/3] dpll: add actual frequency monitoring
 callback ops
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>,
 Prathosh Satish <Prathosh.Satish@microchip.com>, Petr Oros
 <poros@redhat.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260325193914.124898-1-ivecera@redhat.com>
 <20260325193914.124898-3-ivecera@redhat.com>
 <d0a6d302-c5af-4ad1-87e2-fa017bdd96a8@linux.dev>
 <e4372a58-13ba-4581-af4e-28d0c880c7bc@redhat.com>
 <a341fd52-3682-473f-8116-a8323bf846ee@redhat.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <a341fd52-3682-473f-8116-a8323bf846ee@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 30/03/2026 09:52, Ivan Vecera wrote:
> On 3/26/26 6:48 PM, Ivan Vecera wrote:
>> On 3/26/26 12:21 PM, Vadim Fedorenko wrote:
>>> On 25/03/2026 19:39, Ivan Vecera wrote:
>>>
>>>> +static int dpll_msg_add_actual_freq(struct sk_buff *msg, struct 
>>>> dpll_pin *pin,
>>>> +                    struct dpll_pin_ref *ref,
>>>> +                    struct netlink_ext_ack *extack)
>>>> +{
>>>> +    const struct dpll_device_ops *dev_ops = dpll_device_ops(ref- 
>>>> >dpll);
>>>> +    const struct dpll_pin_ops *ops = dpll_pin_ops(ref);
>>>> +    struct dpll_device *dpll = ref->dpll;
>>>> +    enum dpll_feature_state state;
>>>> +    u64 actual_freq;
>>>> +    int ret;
>>>> +
>>>> +    if (!ops->actual_freq_get)
>>>> +        return 0;
>>>> +    if (dev_ops->freq_monitor_get) {
>>>> +        ret = dev_ops->freq_monitor_get(dpll, dpll_priv(dpll),
>>>> +                        &state, extack);
>>>> +        if (ret)
>>>> +            return ret;
>>>> +        if (state == DPLL_FEATURE_STATE_DISABLE)
>>>> +            return 0;
>>>
>>> I think we have to signal back to user that frequency monitoring is
>>> disabled via extack.
>>
>> Hi Vadim,
>>
>> This would break pin-get operation... Do or dump pin-get operation would
>> fail with this extack message.
>>
>> Here we can check if the freq-monitoring is enabled and conditionally
>> call actual_freq_get() or measured_freq_get()

Let's make it this way, we don't want to waste even small amount of
resources for useless call.

>>
>> -or-
>>
>> Call this callback unconditionally and check for return code and if a
>> driver returns e.g. -ENODATA then skip nla_put_64bit() but return
>> success.
>>
>> WDYT?
> 
> Vadim?

Sorry, was AFK this Friday/weekend


