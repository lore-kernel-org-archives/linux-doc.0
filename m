Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD26E7AD77
	for <linux-doc@archiver.kernel.org>; Tue,  3 Oct 2023 17:19:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240543AbjJCRTv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Oct 2023 13:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbjJCRTv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Oct 2023 13:19:51 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C32C4A3
        for <linux-doc@vger.kernel.org>; Tue,  3 Oct 2023 10:19:47 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9a9f139cd94so200662966b.2
        for <linux-doc@vger.kernel.org>; Tue, 03 Oct 2023 10:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1696353586; x=1696958386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nm1Co97Gzfh8Vq750T8kSdQUCIb/1ye+ULTOO7iQfz8=;
        b=ued1PvZbWv6go1LR6GNnc6Z3VS61EDk90pB/EPX4suyO7yAkQPtScfBfWBYiLI8aRh
         kTCpeotPh7bLcsBFt/N5LIoNfah8pHusKX77N5ZI3KbgXb2UC6BL3amDUGUAdjljKXEj
         tvxB29tXO77CFIct1qk6vrEaAkD3cv/FYEzGnM7SruC2GnQehFJIazF5AIJvLcOjKOmo
         SBS8QprVA+ez37SgPRmK3VpOoAjFXLTU9JNSTpzefJIA/iROIBrreSr6BmoREKslLONZ
         OiipTiLnLLFiTKUeFiIBUhzhX/kFkPaztILpJRDFeh25H6oIXCjQOI17iGFo2+yf96X4
         CEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696353586; x=1696958386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nm1Co97Gzfh8Vq750T8kSdQUCIb/1ye+ULTOO7iQfz8=;
        b=gSxLVvvhl6rHJ1/RWIo/ND9uL+YmYS8w/wbHhEDDOgEc5ArjC4aqODl9qqwOgYLl3U
         UTd2NvIP5BLp+qyY+uNmu1YKhIErp+7ulhV7vnVTXap0vNRK4OBHi8Dta87IbdCnc+05
         4D7+8RYKyoN71Gno9ov2nXwCk7uNEqLRJXwMiW3tj3b1tCxBfeWOXKiE1/Ej2qllYwkO
         z5MmVe6FYFRqFB4Ug6hla/pXUwZPPZ+Y0DqBqHpCoej1aCH9swVKnCIPnJpIfW1JH6mz
         xPlh/a4v6XfQG54U4Yl9A3deo1gRY4E8vU9sFhBwIkzYF7MlIXudygiDUOhzGKOy2scd
         wz8A==
X-Gm-Message-State: AOJu0YxTVHzsbT7FPVBmSXHYp14Ah8PK7EspDyRBanRCelhYTVAMku+N
        M1VKEwn5l5UohuhPWWlZ6VGVhQ==
X-Google-Smtp-Source: AGHT+IFL89GFPQftGrDAdWk1LB4hpVU3dne0w1ogcBIfCpwhJPO4BRAxt67OuAblcJV4cPFvVxZBvw==
X-Received: by 2002:a17:906:1350:b0:9ae:3d17:d5d0 with SMTP id x16-20020a170906135000b009ae3d17d5d0mr13562375ejb.31.1696353586218;
        Tue, 03 Oct 2023 10:19:46 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id ss26-20020a170907039a00b009a5f1d15644sm1325283ejb.119.2023.10.03.10.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 10:19:45 -0700 (PDT)
Date:   Tue, 3 Oct 2023 19:19:44 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
Cc:     Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "Brandeburg, Jesse" <jesse.brandeburg@intel.com>,
        "Nguyen, Anthony L" <anthony.l.nguyen@intel.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>
Subject: Re: [PATCH net-next 3/4] dpll: netlink/core: add support for
 pin-dpll signal phase offset/adjust
Message-ID: <ZRxNML855TG7L5To@nanopsycho>
References: <20230927092435.1565336-1-arkadiusz.kubalewski@intel.com>
 <20230927092435.1565336-4-arkadiusz.kubalewski@intel.com>
 <4018c0b0-b288-ff60-09be-7ded382f4a82@linux.dev>
 <DM6PR11MB4657AA79C0C44F868499A3129BC5A@DM6PR11MB4657.namprd11.prod.outlook.com>
 <ZRrb87drG7aVrxsT@nanopsycho>
 <DM6PR11MB4657C61104280788DF49F0E59BC5A@DM6PR11MB4657.namprd11.prod.outlook.com>
 <ZRu1cG2uglhmCdlI@nanopsycho>
 <DM6PR11MB4657B52BD09700F49799ED8C9BC4A@DM6PR11MB4657.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB4657B52BD09700F49799ED8C9BC4A@DM6PR11MB4657.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tue, Oct 03, 2023 at 04:29:43PM CEST, arkadiusz.kubalewski@intel.com wrote:
>>From: Jiri Pirko <jiri@resnulli.us>
>>Sent: Tuesday, October 3, 2023 8:32 AM
>>
>>Tue, Oct 03, 2023 at 01:03:00AM CEST, arkadiusz.kubalewski@intel.com wrote:
>>>>From: Jiri Pirko <jiri@resnulli.us>
>>>>Sent: Monday, October 2, 2023 5:04 PM
>>>>
>>>>Mon, Oct 02, 2023 at 04:32:30PM CEST, arkadiusz.kubalewski@intel.com
>>>>wrote:
>>>>>>From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>>>>>>Sent: Wednesday, September 27, 2023 8:09 PM
>>>>>>
>>>>>>On 27/09/2023 10:24, Arkadiusz Kubalewski wrote:
>>>>>>> Add callback op (get) for pin-dpll phase-offset measurment.
>>>>>>> Add callback ops (get/set) for pin signal phase adjustment.
>>>>>>> Add min and max phase adjustment values to pin proprties.
>>>>>>> Invoke get callbacks when filling up the pin details to provide user
>>>>>>> with phase related attribute values.
>>>>>>> Invoke phase-adjust set callback when phase-adjust value is provided
>>>>>>> for
>>>>>>> pin-set request.
>>>>>>>
>>>>>>> Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>>>>>>
>>>>>>[...]
>>>>>>
>>>>>>> +static int
>>>>>>> +dpll_pin_phase_adj_set(struct dpll_pin *pin, struct nlattr
>>>>>>> *phase_adj_attr,
>>>>>>> +		       struct netlink_ext_ack *extack)
>>>>>>> +{
>>>>>>> +	struct dpll_pin_ref *ref;
>>>>>>> +	unsigned long i;
>>>>>>> +	s32 phase_adj;
>>>>>>> +	int ret;
>>>>>>> +
>>>>>>> +	phase_adj = nla_get_s32(phase_adj_attr);
>>>>>>> +	if (phase_adj > pin->prop->phase_range.max ||
>>>>>>> +	    phase_adj < pin->prop->phase_range.min) {
>>>>>>> +		NL_SET_ERR_MSG(extack, "phase adjust value not
>>>>>>> supported");
>>>>>>> +		return -EINVAL;
>>>>>>> +	}
>>>>>>> +	xa_for_each(&pin->dpll_refs, i, ref) {
>>>>>>> +		const struct dpll_pin_ops *ops = dpll_pin_ops(ref);
>>>>>>> +		struct dpll_device *dpll = ref->dpll;
>>>>>>> +
>>>>>>> +		if (!ops->phase_adjust_set)
>>>>>>> +			return -EOPNOTSUPP;
>>>>>>
>>>>>>I'm thinking about this part. We can potentially have dpll devices with
>>>>>>different expectations on phase adjustments, right? And if one of them
>>>>>>won't be able to adjust phase (or will fail in the next line), then
>>>>>>netlink will return EOPNOTSUPP while _some_ of the devices will be
>>>>>>adjusted. Doesn't look great. Can we think about different way to apply
>>>>>>the change?
>>>>>>
>>>>>
>>>>>Well makes sense to me.
>>>>>
>>>>>Does following makes sense as a fix?
>>>>>We would call op for all devices which has been provided with the op.
>>>>>If device has no op -> add extack error, continue
>>>>
>>>>Is it real to expect some of the device support this and others don't?
>>>>Is it true for ice?
>>>>If not, I would got for all-or-nothing here.
>>>>
>>>
>>>Let's step back a bit.
>>>The op itself is introduced as per pin-dpll tuple.. did this
>>>intentionally,
>>>to inform each dpll that the offset has been changed - in case dplls are
>>>controlled by separated driver/firmware instances but still sharing the
>>>pin.
>>>Same way a pin frequency is being set, from user perspective on a pin, but
>>>callback is called for each dpll the pin was registered with.
>>>Whatever we do here, it shall be probably done for frequency_set()
>>>callback as
>>>well.
>>>
>>>The answers:
>>>So far I don't know the device that might do it this way, it rather
>>>supports
>>>phase_adjust or not. In theory we allow such behavior to be implemented,
>>>i.e.
>>>pin is registered with 2 dplls, one has the callback, second not.
>>
>>If there is only theoretical device like that now, implement
>>all-or-nothing. If such theoretical device appears in real, this could
>>be changed. The UAPI would not change, no problem.
>>
>
>I can live with it :)
>
>>
>>>Current hardware of ice sets phase offset for a pin no matter on which
>>>dpll
>>>device callback was invoked.
>>>"all-or-nothing" - do you mean to check all callback returns and then
>>>decide
>>>if it was successful?
>>
>>Check if all dplls have ops and only perform the action in such case. In
>>case one of the dplls does not have the op filled, return -EOPNOTSUPP.
>>
>>
>>Regarding the successful/failed op, I think you can just return. In
>>these cases, when user performs multiaction cmd, he should be prepared
>>to deal with consequences if part of this cmd fails. We don't have
>>rollback for any other multiaction cmd in dpll, I don't see why this
>>should be treated differently.
>>
>
>We don't have it because no one have spotted it on review,
>as mentioned the frequency_set behaves the same way,
>we need one approach for all of those cases.
>I am opting for having the rollback as suggested on the other thread.

Okay, but let's do that consistently.

>
>Thank you!
>Arkadiusz
>
>>
>>>
>>>Thank you!
>>>Arkadiusz
>>>
>>>>
>>>>>If device fails to set -> add extack error, continue
>>>>>Function always returns 0.
>>>>>
>>>>>Thank you!
>>>>>Arkadiusz
>>>>>
>>>>>>
>>>>>>> +		ret = ops->phase_adjust_set(pin,
>>>>>>> +					    dpll_pin_on_dpll_priv(dpll, pin),
>>>>>>> +					    dpll, dpll_priv(dpll), phase_adj,
>>>>>>> +					    extack);
>>>>>>> +		if (ret)
>>>>>>> +			return ret;
>>>>>>> +	}
>>>>>>> +	__dpll_pin_change_ntf(pin);
>>>>>>> +
>>>>>>> +	return 0;
>>>>>>> +}
>>>>>>> +
>>>
