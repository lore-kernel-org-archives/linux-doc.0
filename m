Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313217;
	b=AeKDlMte0ACET3vWJF3oBnhVT9lgc6p0WPqV5rZhAXVzjqOMoKyFGcUNa21zUs0CV0KK
	 HZrj6OoHmDJ64nS/6rczzcX2qNW6SOFLh7H77wdrDe7TYruskrcsACNBqI71amFYD9Nb0
	 pUjeeB+N2ypNd3hb/ILL1yiCIaWXkZ1KPga+nmBAoYTDmVhRjmXhFdZZycIW5wJy8KnJx
	 ZuB/bKYnfusUtJxEAxKpsiF9x0r02HGcgpXxg/WUH0+Pu9iT1DOAWaavKYFBACFLFDlYN
	 EQXKhYY6mKgXuDISWAii06659dgKd5TPjM4XVEuuOIj8D8x54n3Ie4xi4JuenVTEP5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313217;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kPdufsPBJpaLhkzWQqqT8FSuhylKhYmUXeIW0aMLwqc=;
	b=OSuPJsG9LWrZFemSmEFPpyrZ9P83ltQxMZhZF+DdwLSW3nhiZWt7DvrgNUhkBZXxITWW
	 2lyvpWl8pxpmVnCl5zT4UGXhQc6gCjwpen47bkdPeuIF0527jFtwiATJ5eJzXXqBK8n0L
	 FnZz3Zj4H2xjGeCs53UZxNdSrfJTNFAMz2/nsrzvgmZqrVDz9c1AlZxPuGS94r7xDIUQj
	 mZt6s8GlCiU1v3SjZ03AdlgGFCR1pgFoxZZhOOWS4BNWtJiwXf/D2qOy1B325w9opqimJ
	 13k948K7cqh83TBLxhWr6h3xTceCXZb0oZVMw1b05UMAFC431GDGc/5XldS6AIxfrGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LGkizSni;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ovaevFci;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865E9606A330
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 12:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 865E9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LGkizSni;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ovaevFci
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794313215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kPdufsPBJpaLhkzWQqqT8FSuhylKhYmUXeIW0aMLwqc=;
	b=LGkizSniNGYF4hqBVCtIB8IV798WGc5n7tl9FrMTCMWuyFJqZdqk706zaCf34QgvrjFrlW
	0tyc/rb0x++w82Ug5QsmQTXDiojsKxaBoGXQ9kYVjpEvkyqA1lyEugZEIVK0m3svATSUgU
	iBMSWTIJrMu9XhY1jJJFdJ/N2U5gjZs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-0TvnSXV_PoyPpMc_OzLKiA-1; Tue, 10 Nov 2026 07:20:13 -0500
X-MC-Unique: 0TvnSXV_PoyPpMc_OzLKiA-1
X-Mimecast-MFC-AGG-ID: 0TvnSXV_PoyPpMc_OzLKiA_1794313212
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-49090fde23aso1668187f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 04:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794313212; x=1794918012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPdufsPBJpaLhkzWQqqT8FSuhylKhYmUXeIW0aMLwqc=;
        b=ovaevFcimn2HnEBjjZ/NGwI9bTwKxnGNmYozXjxjutP/+44svBl3WI0nrxw003GSU5
         QQPmjOgGO8Ot+VFawHXgtbSi+i59M+yI7goxfir4Kk2nysNV91nr8XgtWod6r5IqyTX9
         NeSvpC71yJNnakGxqD6nmm/dbvsL4qGNF5Xyf/9ewEUwTIn4Bs1ImutMRuadkz4pop80
         1HdmENo6P5iHz0VEUoqeYbgce/bBgZJysPJokj5LXIQNYXsIzU28xrucgvCkulJwLZAF
         kxg3osvKjQlY0Z4+xanBxp67BY6br6ReKQs8CVQKIxDA5bGE0VbiSI209tR9eZwnCV3E
         GwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313212; x=1794918012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kPdufsPBJpaLhkzWQqqT8FSuhylKhYmUXeIW0aMLwqc=;
        b=0nD4S0teQqTdUsHEY5d1mGUPWohydnL90wGXhZiqqHO+D+W7Wpsf3ZhXGt4u35UKcu
         waR5HlxqJ6Rc9YteWkQ8PyZ2W0a9eOJltMp5zG4X8f2frfKVGAT77mwmM19a1B4sZwfQ
         2XRvL5JVqQ9Yud2M5WJTAvkZZ5BnHd/2nyVe9Tbys0WFybQL0HPnweRzub/xQv/VWdwE
         LLjdWR9/d/3uEUW7KOu9rWzJTHfnEhROKVgkYxcZzDu6atiGPwZ33q7fro3UCSONb+WV
         JuHvlxNbCS1I31PsY4JCOj/S0VrXJhuVSW6T1T+7zn3PWaHYZrardgSfW/Kq2tT9EYAv
         Q/mw==
X-Forwarded-Encrypted: i=1; AL+hErEpvBpCvEv7FFTyr16cbl6qvLNqLTloWcKqCUYDeZxf3Y0PRfpCBI0D48hjm309WhbaLoFBQjWKK9I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/p7XQYkP46eLur+ZcH5UoSVQfpuBWTrR9G40OKDAA1nt/X/4V2
	aX+ZzR9y4bkVxR8O9mP81T3Rd7W+d+lwXHxnydjQLPKJy1Y3qzCydwIsG9fe7+Ml/KkqI56quaf
	EUAlxjwNzhBu3CCGfiS8/8ydNMlSeXPuRoiRmfnj3LUz67fgr9lpdvaf91bR5Jg==
X-Gm-Gg: AYBFou2yM5FmxJiispfESkuYxELmDSAqG+Z3Be7lQNAxmSVyNlnzoWg0YyG8Glk5Hys
	QP0quaZfS/YKO+t9Qzs+B9aV+J92UbVIrFYojQ7tLRq89QfKTmoJrBBfJL7sI7V04fnNzskZQgw
	JY1V8nxL6eSGDN/4yigW30ANOhEmwXGC1iJpfDNhissyG+zBf03Y4rsMVyfqwTUA1GSNbIZ0SP9
	cL5Uy/gxAxrPu1sZteSqm5x/BSMDShCEUklb1SWfSZ6//YFEECNX5X86R+zYSGHR+BVPPmJE0aa
	fVpTWDM2749KNFO4BQnOY/veJi/Idy1oagJxbEpR2VBjOqgniXnQquPwsDIBp8mQQmt0Y8X2ez7
	gOtODm4+Ib2NwO0gpsWDNYLBmvSjja5ApsnQ=
X-Received: by 2002:a05:600c:1c0c:b0:4a2:150f:1607 with SMTP id 5b1f17b1804b1-4ba0233e877mr44341155e9.13.1794313212312;
        Tue, 10 Nov 2026 04:20:12 -0800 (PST)
X-Received: by 2002:a05:600c:1c0c:b0:4a2:150f:1607 with SMTP id 5b1f17b1804b1-4ba0233e877mr44340455e9.13.1794313211833;
        Tue, 10 Nov 2026 04:20:11 -0800 (PST)
Received: from [10.43.3.161] ([213.175.37.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835c377fdsm3961339f8f.21.2026.11.10.04.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:20:11 -0800 (PST)
Message-ID: <a873e0f1-ead6-49da-93af-d2c2d79c9741@redhat.com>
Date: Tue, 10 Nov 2026 13:20:09 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 01/10] ice: dpll: notify TSPLL lock status from
 the periodic work only
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Min Li <min.li@microchip.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 Grzegorz Nitka <grzegorz.nitka@intel.com>,
 Karol Kolacinski <karol.kolacinski@intel.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>
References: <20261106121005.1327603-1-ivecera@redhat.com>
 <20261106121005.1327603-2-ivecera@redhat.com>
Content-Language: en-US
From: Petr Oros <poros@redhat.com>
In-Reply-To: <20261106121005.1327603-2-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/6/26 1:09 PM, Ivan Vecera wrote:
> ice_dpll_tspll_state_on_dpll_set() notifies the TSPLL device from a
> callback of the TIME_REF pin. This pin belongs to an external DPLL and the
> DPLL core is going to run its callbacks under a lock of the pin's owner,
> which does not cover the TSPLL device.
> 
> Only update dpll_state in the callback, so a device get reports the new
> state right away, and leave prev_dpll_state to
> ice_dpll_periodic_work_e825(), which then sends the notification. It now
> arrives up to 500 ms later and after the reply to the request.
> 
> Refresh dpll_state on every run of the work, as the state written by the
> callback can be transient and the lock status can return to
> prev_dpll_state before the next run. No notification is sent in this case.
> 
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> ---
>   drivers/net/ethernet/intel/ice/ice_dpll.c | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/intel/ice/ice_dpll.c b/drivers/net/ethernet/intel/ice/ice_dpll.c
> index ade1fb3dd06743..bdbcf7af296eb4 100644
> --- a/drivers/net/ethernet/intel/ice/ice_dpll.c
> +++ b/drivers/net/ethernet/intel/ice/ice_dpll.c
> @@ -2914,7 +2914,6 @@ ice_dpll_tspll_state_on_dpll_set(const struct dpll_pin *pin, void *pin_priv,
>   	struct ice_dpll_pin *p = pin_priv;
>   	struct ice_pf *pf = p->pf;
>   	enum ice_clk_src clk_src;
> -	bool changed = false;
>   	struct ice_dpll *tp;
>   	int ret;
>   
> @@ -2947,15 +2946,12 @@ ice_dpll_tspll_state_on_dpll_set(const struct dpll_pin *pin, void *pin_priv,
>   		WRITE_ONCE(pf->ptp.tspll_locked,
>   			   new_state == DPLL_LOCK_STATUS_LOCKED);
>   
> -		if (tp->prev_dpll_state != new_state) {
> -			tp->dpll_state = new_state;
> -			tp->prev_dpll_state = new_state;
> -			changed = true;
> -		}
> +		/* ice_dpll_periodic_work_e825() compares the state with
> +		 * prev_dpll_state and sends the notification.
> +		 */
> +		tp->dpll_state = new_state;
>   	}
>   	mutex_unlock(&pf->dplls.lock);
> -	if (changed)
> -		__dpll_device_change_ntf(tp->dpll);
>   	/* TSPLL reconfiguration may complete before lock is reacquired.
>   	 * PTP periodic monitoring tracks and restores the final lock state.
>   	 */
> @@ -3372,8 +3368,8 @@ static void ice_dpll_periodic_work_e825(struct ice_pf *pf)
>   	mutex_lock(&pf->dplls.lock);
>   	new_state = ice_dpll_tspll_lock_status_get(pf, true);
>   
> +	tp->dpll_state = new_state;
>   	if (tp->prev_dpll_state != new_state) {
> -		tp->dpll_state = new_state;
>   		tp->prev_dpll_state = new_state;
>   		changed = true;
>   	}

Reviewed-by: Petr Oros <poros@redhat.com>

