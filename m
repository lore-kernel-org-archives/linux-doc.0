Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68917E81DF0
	for <linux-doc@archiver.kernel.org>; Fri,  6 Oct 2023 12:41:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbjJFMlr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 6 Oct 2023 08:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232174AbjJFMlp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Oct 2023 08:41:45 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A325CEA
        for <linux-doc@vger.kernel.org>; Fri,  6 Oct 2023 05:41:43 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9a9f139cd94so353481066b.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Oct 2023 05:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1696596102; x=1697200902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mW5SVktj2xUWf9LqoXpgBXu7K2ICps52XbOnVUo46IM=;
        b=i3nyjPTWpnkWzEj/THfuRj8o7jQ0jJ8ceI69hsiWJFd768iOkaw8kuB7wlZU6mfcLW
         5C5mnnWwdyCDvlhh2+rQw3gclpLMQZMdOz9PCE4PhkkfKGit/74f5Tf388rn1kWm1Y12
         +m6OKTK7U+7Jg1mZCgOfMI+Z+y9JXFG3jZOuONhZ8wDjIyNJcw+dczZl/XrlUq3QSMoV
         SMo/E2zgkzLLTMqqmwaKjk+7NSYLZnVqaPSpjn0jVHB08zuoDJLZnVGaJQ0vKaXBa3np
         LklUdg5XDDdmUFCRRHkvu8yyMNRSPOdl0yzlGIwnSNdyLjbSzPeqZreCzetssCzlpzOq
         RyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696596102; x=1697200902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mW5SVktj2xUWf9LqoXpgBXu7K2ICps52XbOnVUo46IM=;
        b=l3I4d+MSDd8u+5SuupG+BhPDjJ5Q9UChXhD1y1waE1y6LmoZ7JiSLuLs//5qmXMajo
         LPOknkXTPTPSSENk/eO1bzh+Si9jgovint3kiI3dldfBzkw5/BBQf38pmxXuFUzSvL7m
         aUqdGLexYM47x0en+O7uM/ML42Wq3ANRj02CqGtjf7yPP6Nea/UTcGASkP5iuTAZ4kQV
         THGytA1FoaELS2xVnZ7kXcGlPdoOaKkewROqLIUiky6aefHK4V1t7+0M6StHE2WRMDQd
         4UeCIIV76Ea7350F1OpfV5MSJFfPcpN5WuMN6jHpTQX58G54620opLLGTWEmcmcHlJYk
         6bXA==
X-Gm-Message-State: AOJu0YzC0PJiDGyvfYIq7R3KitpbS54UIy/H/3cmFqhRJczjKVUUt6gD
        /GsSA3/OJJkhxCcQozcU1gxkmA==
X-Google-Smtp-Source: AGHT+IGDzND6oeHj41td9dY/OmMaIkCdkLJphE1fmDDVPuSEB4VwAnf7dRKhLynRWUzgKd6WFcyYhw==
X-Received: by 2002:a17:907:b10:b0:9aa:e08:9fb7 with SMTP id h16-20020a1709070b1000b009aa0e089fb7mr6240513ejl.76.1696596102024;
        Fri, 06 Oct 2023 05:41:42 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id oz10-20020a170906cd0a00b009ad8acac02asm2849794ejb.172.2023.10.06.05.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 05:41:41 -0700 (PDT)
Date:   Fri, 6 Oct 2023 14:41:39 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Simon Horman <horms@kernel.org>
Cc:     Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        netdev@vger.kernel.org, vadim.fedorenko@linux.dev, corbet@lwn.net,
        davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
        jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        linux-doc@vger.kernel.org, intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH net-next v3 4/5] ice: dpll: implement phase related
 callbacks
Message-ID: <ZSAAg39SzlDS55Kn@nanopsycho>
References: <20231006114101.1608796-1-arkadiusz.kubalewski@intel.com>
 <20231006114101.1608796-5-arkadiusz.kubalewski@intel.com>
 <ZR/+noRCdnsy6QJo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZR/+noRCdnsy6QJo@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fri, Oct 06, 2023 at 02:33:34PM CEST, horms@kernel.org wrote:
>On Fri, Oct 06, 2023 at 01:41:00PM +0200, Arkadiusz Kubalewski wrote:
>> Implement new callback ops related to measurment and adjustment of
>> signal phase for pin-dpll in ice driver.
>> 
>> Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>
>Hi Arkadiusz,
>
>some minor feedback from my side.
>
>If you do end up re-spinning the series, please consider
>running checkpatch.pl --codespell.
>
>> ---
>>  drivers/net/ethernet/intel/ice/ice_dpll.c | 224 +++++++++++++++++++++-
>>  drivers/net/ethernet/intel/ice/ice_dpll.h |  10 +-
>>  2 files changed, 230 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/net/ethernet/intel/ice/ice_dpll.c b/drivers/net/ethernet/intel/ice/ice_dpll.c
>
>...
>
>> +/**
>> + * ice_dpll_phase_offset_get - callback for get dpll phase shift value
>> + * @pin: pointer to a pin
>> + * @pin_priv: private data pointer passed on pin registration
>> + * @dpll: registered dpll pointer
>> + * @dpll_priv: private data pointer passed on dpll registration
>> + * @phase_adjust: on success holds pin phase_adjust value
>
>nit: The parameter is called phase_offset, not phase_adjust in the code below

Yeah, the non-sense static function docs and how buggy they are. Nobody
reads them anyway. Same old story for ice I guess....


>
>> + * @extack: error reporting
>> + *
>> + * Dpll subsystem callback. Handler for getting phase shift value between
>> + * dpll's input and output.
>> + *
>> + * Context: Acquires pf->dplls.lock
>> + * Return:
>> + * * 0 - success
>> + * * negative - error
>> + */
>> +static int
>> +ice_dpll_phase_offset_get(const struct dpll_pin *pin, void *pin_priv,
>> +			  const struct dpll_device *dpll, void *dpll_priv,
>> +			  s64 *phase_offset, struct netlink_ext_ack *extack)
>> +{
>> +	struct ice_dpll *d = dpll_priv;
>> +	struct ice_pf *pf = d->pf;
>> +
>> +	mutex_lock(&pf->dplls.lock);
>> +	if (d->active_input == pin)
>> +		*phase_offset = d->phase_offset * ICE_DPLL_PHASE_OFFSET_FACTOR;
>> +	else
>> +		*phase_offset = 0;
>> +	mutex_unlock(&pf->dplls.lock);
>> +
>> +	return 0;
>> +}
>> +
>>  /**
>>   * ice_dpll_rclk_state_on_pin_set - set a state on rclk pin
>>   * @pin: pointer to a pin
>
>...
>
>> @@ -1656,6 +1867,15 @@ ice_dpll_init_info_direct_pins(struct ice_pf *pf,
>>  				return ret;
>>  			pins[i].prop.capabilities |=
>>  				DPLL_PIN_CAPABILITIES_PRIORITY_CAN_CHANGE;
>> +			pins[i].prop.phase_range.min =
>> +				pf->dplls.input_phase_adj_max;
>> +			pins[i].prop.phase_range.max =
>> +				-pf->dplls.input_phase_adj_max;
>> +		} else {
>> +			pins[i].prop.phase_range.min =
>> +				pf->dplls.output_phase_adj_max,
>
>nit: It probably doesn't make any difference, but perhaps ',' should be ';'.
>
>As flagged by clang-16 with -Wcomma
>
>> +			pins[i].prop.phase_range.max =
>> +				-pf->dplls.output_phase_adj_max;
>>  		}
>>  		pins[i].prop.capabilities |=
>>  			DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE;
>
>...
