Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB566E82CBB
	for <linux-doc@archiver.kernel.org>; Wed, 27 Sep 2023 18:16:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbjI0SQq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 27 Sep 2023 14:16:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbjI0SQp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Sep 2023 14:16:45 -0400
X-Greylist: delayed 450 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 27 Sep 2023 11:16:43 PDT
Received: from out-204.mta1.migadu.com (out-204.mta1.migadu.com [IPv6:2001:41d0:203:375::cc])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFB07E5
        for <linux-doc@vger.kernel.org>; Wed, 27 Sep 2023 11:16:43 -0700 (PDT)
Message-ID: <4018c0b0-b288-ff60-09be-7ded382f4a82@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1695838151;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G57rpo1++Zl3if+NiAqrdipXpzXF4O8DuKQxu1acs6Y=;
        b=UGSLpovy39IQoNTjV00vQzdXtByKcO1708I/wTtTwg0OrqG2knrgm8aQAaFR+aRxapBNZD
        vxMcXn3hDzXXlL8hTEK+Mtk75UQDk6uk+QSSlqrcLOVdxsH9/Ntr3E0wWIfM7+LXPCVLDC
        fFu9aRtEQyDi2wMZo8tyiSksRgcGiaA=
Date:   Wed, 27 Sep 2023 19:09:07 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next 3/4] dpll: netlink/core: add support for pin-dpll
 signal phase offset/adjust
Content-Language: en-US
To:     Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        netdev@vger.kernel.org
Cc:     jiri@resnulli.us, corbet@lwn.net, davem@davemloft.net,
        kuba@kernel.org, pabeni@redhat.com, jesse.brandeburg@intel.com,
        anthony.l.nguyen@intel.com, linux-doc@vger.kernel.org,
        intel-wired-lan@lists.osuosl.org
References: <20230927092435.1565336-1-arkadiusz.kubalewski@intel.com>
 <20230927092435.1565336-4-arkadiusz.kubalewski@intel.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20230927092435.1565336-4-arkadiusz.kubalewski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 27/09/2023 10:24, Arkadiusz Kubalewski wrote:
> Add callback op (get) for pin-dpll phase-offset measurment.
> Add callback ops (get/set) for pin signal phase adjustment.
> Add min and max phase adjustment values to pin proprties.
> Invoke get callbacks when filling up the pin details to provide user
> with phase related attribute values.
> Invoke phase-adjust set callback when phase-adjust value is provided for
> pin-set request.
> 
> Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>

[...]

> +static int
> +dpll_pin_phase_adj_set(struct dpll_pin *pin, struct nlattr *phase_adj_attr,
> +		       struct netlink_ext_ack *extack)
> +{
> +	struct dpll_pin_ref *ref;
> +	unsigned long i;
> +	s32 phase_adj;
> +	int ret;
> +
> +	phase_adj = nla_get_s32(phase_adj_attr);
> +	if (phase_adj > pin->prop->phase_range.max ||
> +	    phase_adj < pin->prop->phase_range.min) {
> +		NL_SET_ERR_MSG(extack, "phase adjust value not supported");
> +		return -EINVAL;
> +	}
> +	xa_for_each(&pin->dpll_refs, i, ref) {
> +		const struct dpll_pin_ops *ops = dpll_pin_ops(ref);
> +		struct dpll_device *dpll = ref->dpll;
> +
> +		if (!ops->phase_adjust_set)
> +			return -EOPNOTSUPP;

I'm thinking about this part. We can potentially have dpll devices with
different expectations on phase adjustments, right? And if one of them
won't be able to adjust phase (or will fail in the next line), then
netlink will return EOPNOTSUPP while _some_ of the devices will be
adjusted. Doesn't look great. Can we think about different way to apply
the change?


> +		ret = ops->phase_adjust_set(pin,
> +					    dpll_pin_on_dpll_priv(dpll, pin),
> +					    dpll, dpll_priv(dpll), phase_adj,
> +					    extack);
> +		if (ret)
> +			return ret;
> +	}
> +	__dpll_pin_change_ntf(pin);
> +
> +	return 0;
> +}
> +
