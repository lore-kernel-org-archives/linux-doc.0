Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D9738DC46
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 09:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786438803; cv=none; b=dS/cR6VP87R7ly6lC8jQriaHDr6pBRbUsoGNS4xSl2L2DlGXZLKOY87t8Rk9DVIbnMUhGgToKO0Lv9zJI5XiFMyRIW7dUQwQfWtRVTXkmfT9FAGOl2I8K2rRhp4uYuhECtnIz/hOJV9yWHxD9eJmcTxW0Q75B344H4xN+RE1zCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786438803; c=relaxed/simple;
	bh=t7BOke3s47mhHVNiaxIizFib9eVQnX2fxrkzE8J1y+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rLXdOtnFCRnKyfUrOiTF2YThPMzfiXxKUFlv8I5JA0mtneMsT74+FPYbEzJ2yHOSKX+nXfyKiiZFWD6OHzFEjseuc374LRNbCGtVn+uBAr+UWImMGiz7rFrA5WBRhqnAB0Kfiy798QJCwlq0hSRTSPhh5mHto2SdwlIylLhTaLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FdY3kFOk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=R+DbLMsT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FdY3kFOk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="R+DbLMsT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786438801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eshuqxPuNO4xGCQCYL4zRadx/VGkau93YdDo0MWtilw=;
	b=FdY3kFOkw0iaRXmJUViBJlEncbI0uUN35s/dtvIMvukpSXxMJwepib1qdwZek7Xoo8uHZ4
	S8q7d/vN2kdewXs2VsUWVrDgEmoceuk40F/2bwrpMNMp+kva+dW5Lm4IgSknvcxdvT5JVD
	6Fwe2mn7oMcVSOy/bUpUpZjep6vF2V4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-OEBuMmN0N0eJgEyAOY8_zA-1; Tue, 11 Aug 2026 04:59:59 -0400
X-MC-Unique: OEBuMmN0N0eJgEyAOY8_zA-1
X-Mimecast-MFC-AGG-ID: OEBuMmN0N0eJgEyAOY8_zA_1786438798
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-496bbcf7d1eso18736515e9.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 01:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786438798; x=1787043598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eshuqxPuNO4xGCQCYL4zRadx/VGkau93YdDo0MWtilw=;
        b=R+DbLMsTycJBDbXuhsEUPnGjS57jO1PdUZKPqAV0jRPcCwtn4esfBtAoWZ8k2Yqcm2
         BgcsduBl80iSMPuhYbPDaEoFo0Rc9NlGQZNcEbK10jwaCxYwJ6fwoBlZxSk/BF57yl7j
         YhHPEhh8kg9Rtwmd162zMnnhVUtonq7hGTfn9TR6qAbsU8RMPoCEJXVCflY2TQynf1Py
         pm012IwsOojitxQK6+f/hXOE4QQ84b/8IboWHPRyj3Hl5ARZq3OAlLPp8OtTN/sYeARP
         ZwpSSCG+RbBbabUet7h30PwDLDevD93GtZu/lb0NjiG8tZXjs9/7eOh1ySiPLL0DJOKj
         4Dtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786438798; x=1787043598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eshuqxPuNO4xGCQCYL4zRadx/VGkau93YdDo0MWtilw=;
        b=Jd30LNmISDeAxf4VsMQ0sYQdQzamO/GW4wt2zF14yUTyxTBqvKdnD9HU0hOuy2A69q
         ff1knEpPEMN1PJEiIZ9PAZdRLtV0yXMS3e7XQjoMWZ2OfWXFDzp1zF/fC36xdDQ618MP
         TyJOzwkZUawRHg2XXaDeR1hipKYn9q+gY0Vni58+LR3DAUlNP+ifXjCo1Lfjg2n2rHDR
         tinOoDIF21yesQiv/ML55EG3AACMQ1W984MzFbbYWeBkRJnDhQPbDbSw4kW7oNTE4cVB
         UKjA0CwFlLAL/JQ6fTFJC3UldCa4h0BPWxDEsoiq7+DVCTsuDIEj9B/rh+aAs3Ph7X6Z
         Tgiw==
X-Forwarded-Encrypted: i=1; AHgh+RpqqB4Nx0rXV0d8VUjNH0teJBHLTYDrATX3+tlvEHDuvlZZhjYcdwsTlOmcM94AvlNXuhmDCz6OAXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwwO8Y3v4XOKxsneCnAkynz8JloyskS4ZRAhcqIjEbxQyEeyko
	tFjNiZRUPv3yzVcvU1d/Ik3IG6KDsGymutsDk2mJKZCTqMv0V4FJ1vm86uyTdVGxFbbT9XUTlSJ
	QIDgbr1oQRfbiODMNflaBzEiT5pr8uSHCwyr6I+lkMZnLcl/6w+wY1VDWeQXDhQ==
X-Gm-Gg: AR+sD126l++fJb45OrWo9yOsDfBGeF4fOk7jm+TmdPqe6ZkaywyY0ay+XpWabTWaxR+
	rSpx9hLMdSqxJQsR9OtPJRUhq+ZrOrmV8U/W94dRMFg/STYv1nFwxJbXR6L6rH5CDkCkkua3i0D
	SSavjnjEF8ZSbQpF54Ty3Z/1r3cr4Fd6gaAYHw6PXji6RJWNP3oBvKQmErDsUVoYeq/iGjyDXCX
	0/pVj2iuEYNWfL6vs1FH4sVEhiqB+242cKmANT5rCloFXTxIQARQX80Nv2rCWFRuo05J+15byPZ
	FKc44CFfBOJYwvXXwrSawh3/XwApAe2m6LsOVUCJY3KWMUr1gma9K5uluYTHMkY=
X-Received: by 2002:a05:600c:4709:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-4997844c55emr29605695e9.10.1786438798093;
        Tue, 11 Aug 2026 01:59:58 -0700 (PDT)
X-Received: by 2002:a05:600c:4709:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-4997844c55emr29604685e9.10.1786438797554;
        Tue, 11 Aug 2026 01:59:57 -0700 (PDT)
Received: from [10.43.3.161] ([213.175.37.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499788f11b8sm29690255e9.10.2026.08.11.01.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 01:59:56 -0700 (PDT)
Message-ID: <3cde09fa-3b68-4fdb-9797-f6e23b7166c4@redhat.com>
Date: Tue, 11 Aug 2026 10:59:55 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/2] dpll: zl3073x: update all DPLL channels
 on ref_sync_set
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Jiri Pirko <jiri@resnulli.us>,
 Min Li <min.li@microchip.com>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org
References: <20260807095926.386923-1-ivecera@redhat.com>
 <20260807095926.386923-2-ivecera@redhat.com>
Content-Language: en-US
From: Petr Oros <poros@redhat.com>
In-Reply-To: <20260807095926.386923-2-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/7/26 11:59, Ivan Vecera wrote:
> zl3073x_dpll_input_pin_ref_sync_set() excludes the sync source from
> automatic reference selection by setting its priority to NONE, but
> currently only does this on the single DPLL channel whose pin_priv
> was passed to the callback.
>
> Since input pins are registered with every DPLL channel, the datasheet
> recommends covering all channels to prevent the sync source from
> remaining a selectable candidate on the other channels. This is
> a preparation for the following patch which changes the DPLL core to
> invoke pin-level set callbacks only through the pin owner's reference
> instead of iterating over all registered DPLL devices.
>
> Replace the single-channel priority write with a list_for_each_entry()
> loop over all DPLL channels. Each channel's lock is acquired
> individually for its read-modify-write sequence. The guard(mutex) is
> replaced with explicit mutex_lock/mutex_unlock to allow releasing the
> owner's lock before iterating, avoiding nested locking of the same
> mutex class. A change notification is sent for the sync pin if any
> channel's priority was actually modified.
>
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> ---
>   drivers/dpll/zl3073x/dpll.c | 58 ++++++++++++++++++++++++++++++-------
>   1 file changed, 48 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/dpll/zl3073x/dpll.c b/drivers/dpll/zl3073x/dpll.c
> index 0488ae6ac486c8..83bd3027dbaa1e 100644
> --- a/drivers/dpll/zl3073x/dpll.c
> +++ b/drivers/dpll/zl3073x/dpll.c
> @@ -263,9 +263,10 @@ zl3073x_dpll_input_pin_ref_sync_set(const struct dpll_pin *dpll_pin,
>   	u8 mode, ref_id, sync_ref_id;
>   	struct zl3073x_chan chan;
>   	struct zl3073x_ref ref;
> +	bool sync_ntf = false;
>   	int rc;
>   
> -	guard(mutex)(&zldpll->lock);
> +	mutex_lock(&zldpll->lock);
>   
>   	ref_id = zl3073x_input_pin_ref_get(pin->id);
>   	sync_ref_id = zl3073x_input_pin_ref_get(sync_pin->id);
> @@ -285,17 +286,20 @@ zl3073x_dpll_input_pin_ref_sync_set(const struct dpll_pin *dpll_pin,
>   		if (sync_freq > 8000) {
>   			NL_SET_ERR_MSG(extack,
>   				       "sync frequency must be 8 kHz or less");
> -			return -EINVAL;
> +			rc = -EINVAL;
> +			goto unlock;
>   		}
>   		if (ref_freq < 1000) {
>   			NL_SET_ERR_MSG(extack,
>   				       "clock frequency must be 1 kHz or more");
> -			return -EINVAL;
> +			rc = -EINVAL;
> +			goto unlock;
>   		}
>   		if (ref_freq <= sync_freq) {
>   			NL_SET_ERR_MSG(extack,
>   				       "clock frequency must be higher than sync frequency");
> -			return -EINVAL;
> +			rc = -EINVAL;
> +			goto unlock;
>   		}
>   
>   		zl3073x_ref_sync_pair_set(&ref, sync_ref_id);
> @@ -308,20 +312,54 @@ zl3073x_dpll_input_pin_ref_sync_set(const struct dpll_pin *dpll_pin,
>   
>   	rc = zl3073x_ref_state_set(zldev, ref_id, &ref);
>   	if (rc)
> -		return rc;
> +		goto unlock;
>   
> -	/* Exclude sync source from automatic reference selection by setting
> -	 * its priority to NONE. On disconnect the priority is left as NONE
> -	 * and the user must explicitly make the pin selectable again.
> +	/* All code paths accessing per-channel reference priorities are
> +	 * serialized by the subsystem dpll_lock, so it is safe to release
> +	 * our lock here before iterating over the other channels.
>   	 */
> -	if (state == DPLL_PIN_STATE_CONNECTED) {
> +	mutex_unlock(&zldpll->lock);
> +
> +	if (state != DPLL_PIN_STATE_CONNECTED)
> +		return 0;
> +
> +	/* The datasheet recommends excluding the sync source from automatic
> +	 * reference selection by setting its priority to NONE on all DPLL
> +	 * channels. This is advisory - the ref sync pair is already
> +	 * configured, so a failure here is not fatal. On disconnect the
> +	 * priority is left as NONE and the user must explicitly make the
> +	 * pin selectable again.
> +	 */
> +	list_for_each_entry(zldpll, &zldev->dplls, list) {
> +		u8 prio;
> +
> +		mutex_lock(&zldpll->lock);
> +
>   		chan = *zl3073x_chan_state_get(zldev, zldpll->id);
> +		prio = zl3073x_chan_ref_prio_get(&chan, sync_ref_id);
> +		if (prio == ZL_DPLL_REF_PRIO_NONE) {
> +			mutex_unlock(&zldpll->lock);
> +			continue; /* Ref is already non-selectable */
> +		}
> +
>   		zl3073x_chan_ref_prio_set(&chan, sync_ref_id,
>   					  ZL_DPLL_REF_PRIO_NONE);
> -		return zl3073x_chan_state_set(zldev, zldpll->id, &chan);
> +		if (zl3073x_chan_state_set(zldev, zldpll->id, &chan))
> +			dev_warn(zldev->dev,
> +				 "Failed to set ref prio on DPLL%u\n",
> +				 zldpll->id);
> +		else
> +			sync_ntf = true;
> +
> +		mutex_unlock(&zldpll->lock);
>   	}
> +	if (sync_ntf)
> +		__dpll_pin_change_ntf(sync_pin->dpll_pin);
>   
>   	return 0;
> +unlock:
> +	mutex_unlock(&zldpll->lock);
> +	return rc;
>   }
>   
>   static int

Reviewed-by: Petr Oros <poros@redhat.com>


