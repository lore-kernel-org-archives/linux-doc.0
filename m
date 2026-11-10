Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324671;
	b=XAzAUSeeafLZxI0Qp8d/vzICI5Y0lXNKAVS/zJ83KXlyGbMkQcoZN84i3LQ3wMCArhAi
	 BSQJJAg6JIv+8nUUpc9dlqrhCcZA/ah7KJW/Ju4pNMha9fbYUnCLHQnjzHYcO7r+SrCQ1
	 W7ieHj4Cfiunf19Mgx/muOVid0oUdJSD+axW0HvOasUWIFbuY1s7UWk6mU7Y7kXqBFXDk
	 +dwhvqzf7o2dUY/SI8NQVAbsPxSotyYpGgCMe1jVWf2icdbqMfTZsnphSb6l+MCB3a1ST
	 3YgfhJy83XEUDAR1omh3S1RDSNTCVm7tl8ww6pS3DdZjg41xEBLN4U5z7+dB0CX5zRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324671;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gXjqAYmOZzBpoVOClTeMCf3Fr5RoD9/tZaRkMD38hnw=;
	b=vQ3CY07zucGcUIPcDlSZ4EjNNTW4vc6QzVy3up1HCUtjQ78AvaEfrt+E8WiIlVPwhOp0
	 Ta3HZihUHOrgXDME37g/aa/buQPneqktB6EpciFQeMAdlOGW7or8dxIjxWSNaYeVokom8
	 ABxCIX2+hAgbQAGtYE6qCnQtWeCSWA+WGZdSGgpYdRyZ5e/tL0vbDSMRD0kNuFXQHpDHj
	 +43lJ2m5gS1EDfMJTLJI1pz+d4FunzB5gD/UMS2vzSkH+Pp6gMsEWCzvBt/HwsT/eZWm+
	 L1Ify0emggXRqWc/Ld44lvr1x9KvHfh8yUl0Mwk+fsPxdCd3icWSKczdRN+ajmJqZ7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hcQUGjb4;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=o2DRGKwa;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF3560A2600
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 15:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEF3560A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hcQUGjb4;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=o2DRGKwa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794324669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gXjqAYmOZzBpoVOClTeMCf3Fr5RoD9/tZaRkMD38hnw=;
	b=hcQUGjb4o9ZInWycESOrSrCPhAWfXSoa2WP81h/GTWZB+3SSAaeexbsov8hi+t/xVenCYU
	XV2VPzeZAd8vcNiPyCyfETT6iGJHPYXANGIAPKDZ+Dpbo/KOytaAE3VpO0CvcxhQ7IEKqu
	c0xr/Xato41pKFnrogQyusx3RuxjYOo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-_eCnRxgEMz6pV1F5P7uRrA-1; Tue, 10 Nov 2026 10:31:08 -0500
X-MC-Unique: _eCnRxgEMz6pV1F5P7uRrA-1
X-Mimecast-MFC-AGG-ID: _eCnRxgEMz6pV1F5P7uRrA_1794324667
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-490a0e72578so1524544f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 07:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794324667; x=1794929467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gXjqAYmOZzBpoVOClTeMCf3Fr5RoD9/tZaRkMD38hnw=;
        b=o2DRGKwamIrWbnBK8ZAYCOGE6SW95LqzSGt7qtdluNDesOZ5jy4HWjJJUYO3RlAtMY
         p2LKWjmpdnr8AvjY8atM7KdhDQGSPhIuVPCSDrJby4abJkS3FfEQ5BxA5hemjvN9xZYC
         f0HQLuHH242uuwmKRoDKbsoz8BP2/4KdsGeCEO+ZpioQLw/PVjVTIUjecxrF5bjUk/dB
         7w2kcnrcWh5gGvoKh4496mkOxZSXxIvRWmgyNsTl4I4yZvTdCn88gL9cDX10EXtimZ+v
         id3WdZR5kBsHOGlzrBfsIkTsqhIWc0mipnLJsf8eszFjO8xdX28RHQPKyA+lWVyCnoww
         d3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324667; x=1794929467;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gXjqAYmOZzBpoVOClTeMCf3Fr5RoD9/tZaRkMD38hnw=;
        b=YNAEP3pmCzRbFr6K461Dd5TLBK0ToqkPtDfpdYWS1BoyEx+OwwwXne2UNILyIPjd1h
         d/fvFL2LUnYTxsXFmi9cys7jX5W6ObdSEtSpYFzD1N/qjydDtg7/Mt/+hEjzDw4kxUNz
         V5k9VHDugq+39oofefCMcakzaT2ncnvsrmJFuuQb3mzm/t3kWAoJ4q5BLRZA1trzDyoV
         OSjAS+iraMYhdDVZqBemCCdsvmV5JFRe5RBrlE9XZXkWcRWOjAgQK4k6MwzMYbiLnZjh
         emCZfjrFY9KyWY9X1uN/0eh+5K6KH+lHQpBPtFbDjLl/9638JOzTwcdY0JRTbzrykYGh
         pljQ==
X-Forwarded-Encrypted: i=1; AL+hErGWEIf0o/Kv1AQ9p3oykLn8grktZXMS/7qtxrn+Mm7+Kki2m2MFnTB9D6ZhiJurMm4yZJUrYXoMZJQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/G6UAyJFKl2Ndeval8mutIYKihY+5AaNCx9fjXOykbpWevugCS
	GSoHbTUR6c3OHpo55Xg/KJALNAqPejtGbngRpA7o/quNtl7rApeOCr56blpVsB66vB+a8hdKMnn
	D9lZgMFUbVcafVnmLbZO2MJNOLuhc0qbeaay/NETqCiXNyPuduCQjAVv922iudQ==
X-Gm-Gg: AYBFou1yDtxsFbb/YC+mXpQ8ZacHAF6ADU9K32yFwHpp1WJ4QF3RR3aggpAD1dEXXpL
	peiNa8hA8G4J1/N3iTv3+XPWvgnq5lpJ+zcRsVBD4w+ppwFwbQyLBw3EoNN2JlOwNVJEItCJCBA
	SS0FVEQBxKoskstRf9+uM/GClFkJapCS1oAbctc+0P/r8Kz/TaJjR+rcB9m3VNw7fr2F8MCQ5C2
	g5zCq0+s/6sNfxPvivwfR/Ih8FVu3rgcNsMjcJhPqXl4yQ3H6WoBCk9vCmW6mfK3Siodax7y+ob
	yCn4dO70i9dYDLQmt3YFALE1znWwghjwCbHzM3jOlPZ77CqmPyxj7i9c3bNUmBcUA8nxgnAIZK3
	IAYDpnwl8lAK0VDEfWx/vXVDpPxzCtoP3B+o=
X-Received: by 2002:a05:600c:811a:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4ba02348d9amr50067545e9.16.1794324666992;
        Tue, 10 Nov 2026 07:31:06 -0800 (PST)
X-Received: by 2002:a05:600c:811a:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4ba02348d9amr50066905e9.16.1794324666429;
        Tue, 10 Nov 2026 07:31:06 -0800 (PST)
Received: from [10.43.3.161] ([213.175.37.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba022ff5c3sm31998605e9.0.2026.11.10.07.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:31:05 -0800 (PST)
Message-ID: <f85f84fb-6e19-465b-8bd6-4d62998c1f5a@redhat.com>
Date: Tue, 10 Nov 2026 16:31:04 +0100
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
Subject: Re: [PATCH net-next 09/10] ice: dpll: update locking comments
Content-Language: en-US
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
 <20261106121005.1327603-10-ivecera@redhat.com>
From: Petr Oros <poros@redhat.com>
In-Reply-To: <20261106121005.1327603-10-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/6/26 1:10 PM, Ivan Vecera wrote:
> Callbacks run under the DPLL core domain locks instead of dpll_lock. Note
> that callbacks of pins of an external DPLL run under the domain of that
> DPLL, so only pf->dplls.lock serializes them with the rest of the driver.
> 
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> ---
>   drivers/net/ethernet/intel/ice/ice_dpll.c | 4 ++--
>   drivers/net/ethernet/intel/ice/ice_dpll.h | 3 +++
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/intel/ice/ice_dpll.c b/drivers/net/ethernet/intel/ice/ice_dpll.c
> index d6302409a2dacf..07cbd4cf0160ca 100644
> --- a/drivers/net/ethernet/intel/ice/ice_dpll.c
> +++ b/drivers/net/ethernet/intel/ice/ice_dpll.c
> @@ -1178,8 +1178,8 @@ ice_dpll_input_state_get(const struct dpll_pin *pin, void *pin_priv,
>    * peer via dpll netlink learn about the update.
>    *
>    * Context: Called from dpll_pin_ops callbacks after pf->dplls.lock is
> - *          released.  Uses __dpll_pin_change_ntf() because dpll_lock is
> - *          still held by the dpll netlink layer.
> + *          released.  Uses __dpll_pin_change_ntf() because the domain lock
> + *          is still held by the dpll core.
>    */
>   static void ice_dpll_sw_pin_notify_peer(struct ice_dplls *d,
>   					struct ice_dpll_pin *changed)
> diff --git a/drivers/net/ethernet/intel/ice/ice_dpll.h b/drivers/net/ethernet/intel/ice/ice_dpll.h
> index 4ba76e2e2e0b01..39e041a30090d0 100644
> --- a/drivers/net/ethernet/intel/ice/ice_dpll.h
> +++ b/drivers/net/ethernet/intel/ice/ice_dpll.h
> @@ -165,6 +165,9 @@ struct ice_dpll {
>    *     tx_refclks usage map), acquire pf->dplls.lock first, then
>    *     ctrl_pf->dplls.lock. Skip the second acquire when pf == ctrl_pf
>    *     to avoid recursive locking.
> + *   - Callbacks of the SYNCE and TIME_REF pins of an external DPLL run under
> + *     the DPLL core domain lock of that DPLL, not of the TXC and TSPLL DPLLs,
> + *     so only @lock serializes them with the callbacks of these DPLLs.
>    *   - @txclk_notify_rwsem is held for read across
>    *     ice_txclk_update_and_notify(), including the out-of-lock
>    *     dpll_*_change_ntf() calls. ice_dpll_deinit() takes the write side
Reviewed-by: Petr Oros <poros@redhat.com>

