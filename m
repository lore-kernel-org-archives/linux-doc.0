Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA85C1C84C0
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 11:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773316801; cv=none; b=Xy708U6CxBS9gY+zZMUM6cHcUqQvCTydkPqeORSTQzfV4NHc0VpeVoP4a2FQ9OWt3jtlnXN9ouImT28Z5lbcyAM3ZlZRC2mTx0k1PTN7BtdgbmGbBR/PPH9vczG0otXvpusnwxBdbFfIIHoZ4Y880sYj1CliFjqv9il7wz6RERA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773316801; c=relaxed/simple;
	bh=pSM4c5SlwbfLlCY6MVDWcwT0Dj8gikrgvwZsevPv/bo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S9sKPkIvAiFNTWt9QD1tJ4EfVP2AR2S35e7kfHnc7FOyy0XLO0KSeDiHvPahC8mKr2KAZqIlZBnPLqSzmdwi8wiQor4j3skQfj3lIXhUvVuBSv9Y4GUtvPamIze5H5Up6tJhkcG50oaYyOsR/WLOxG2+RTM9Z4KqiVkoAEjptEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I5haxr+Y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=l5gq7hCh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I5haxr+Y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="l5gq7hCh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773316798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oRa4LvyU+A60q9Rpv8+AHl1L4aAB6JpU7wa5lWrjEDs=;
	b=I5haxr+YCJowGQKZoRfeL6fGlOjMIFmRfQEApwqIFvlD9dStQe67UoZrY420W2rNLc8ZGx
	37HBKL2ISUjPAyHHWOv0bJmiWGd7VzPfN2fYs2X61v0zR0BXmwB8fum39ojVxNOm7DLPp9
	eO6PrUyeD1ARKwf1oDGzkjub+VtJozc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-k7U3Y3x1NLe8Jg4i-DN9Og-1; Thu, 12 Mar 2026 07:59:57 -0400
X-MC-Unique: k7U3Y3x1NLe8Jg4i-DN9Og-1
X-Mimecast-MFC-AGG-ID: k7U3Y3x1NLe8Jg4i-DN9Og_1773316796
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4852ccff333so7297605e9.2
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 04:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773316796; x=1773921596; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oRa4LvyU+A60q9Rpv8+AHl1L4aAB6JpU7wa5lWrjEDs=;
        b=l5gq7hChyeyzzxYeDL5J57Hfkt4Cb3oU6QSJ1DO8hGkYINELnShHDbW3xYtnXVvUM2
         DOI1K1olalkbVal53hbpC+PfqWzCA2QQNPaNDNJb5uCBqOonCvJscUafKYQAyV3QdXhk
         Si2Nm+OVwaCW7imf/+uKTI/jUS3VaTSiS7m7ogMXSVddn69LTorpEosTC7bTzc2kF4Qy
         FZbYIP09mSkHZSN0BlGsMK2bqSItt3ufOoRunq4UAPh+IDH61OcKD6kMcsehr+vxtrnS
         B6/zDKAqtgweYBBc7WahGF4Py+szSz1YsGF6hty+vAnj1oTNzX1yJdZjLJehOTywbkiA
         8yMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773316796; x=1773921596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oRa4LvyU+A60q9Rpv8+AHl1L4aAB6JpU7wa5lWrjEDs=;
        b=R9NZIFU/AAYaM9MkkAMU3jorWmDd6lwQwnPsiGROi2wLpyIs74Le3vwszqzorJhSi8
         TQiZgDz/GRXOeul4tfCH8BqLiWs80rHkrVCDIeENm5A9xKmfrcvPFmR8c5MhrwuTEJSf
         rCa8+9hafUmwx/5ABgy2PDQO6E+LFxDrEl56tMyvsqJcEUul9DRxUgnvglLFWnePPWNL
         RAJ79esauuyIwGMjrQu2kOiHgcBRj9rjcCQ4FfTu1sMihcLo7brqAXaI/g1FgcBwriiL
         /GzlLQ+9k1QIt0pCp62yW6/dPviUI0o81rL5Zzb3D7dxtTsK7IdsufBvVuiISOrmpAS2
         1+1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzer70JS6oW1UyR5sSoEFfO947Dt1gCsetMt6GqQWaN3zO9X3A3F3afOBpZUb51ZEasUUXBLyt/eo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHoZ4SR7wW3AgQvBYN4FbtzjV9AiqUjfyIIDpzUCEXpOgW4deg
	oQHgoUDYyian5/YTq34+0QIdz1+YRckwm5T74Psqm5rYj1AspwtYKWglsUdJsUVTLrLuSqrNWNg
	PfpAESTDz636CGmX5J0QsP3Wib4/SYY9U8FPHgLRHlSe206ZueUe9wzMTQO56Vw==
X-Gm-Gg: ATEYQzyq+NupPTAeYpt3VeQk7osn9XnaWqof/VVV3Y/HvhmJLLL+Xs9HxhKXC5cs5Pk
	nw5cQZBjh2OvFB7O1r7L7Bk2TwpD+lHJMv1KSCA+1uV3OSg2+zXS1dNWbtEJy5SHLC/D3teEfW+
	X9hvmcL1KT0GgTW1XQdLwS2WN1s6GhcOk9j0up//jBL+sp1io4a2B+Yty+9QCPT0IUykR2ff16f
	JCgl0fTsM6mhrlw93FpPnNhjpa65D2tXeAHv5XvgK9cERwltfMoIxIsABff89E1TnvG7MFrBf+E
	WByVCuELs4bo5qmWc0Dmn3b1cZMnJaSNboVcBk4mZolPYihF589FIDJCrB9cjrm6oLdBR62tMfE
	xzvfymTXIJCTTvxRgb22cnsuH9ZhVacYhsNjX95D7A4nfy1K7yiGnKMY=
X-Received: by 2002:a05:600c:4ed0:b0:485:40a6:442e with SMTP id 5b1f17b1804b1-4854ad71905mr116049385e9.0.1773316795941;
        Thu, 12 Mar 2026 04:59:55 -0700 (PDT)
X-Received: by 2002:a05:600c:4ed0:b0:485:40a6:442e with SMTP id 5b1f17b1804b1-4854ad71905mr116048315e9.0.1773316795201;
        Thu, 12 Mar 2026 04:59:55 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b6070acsm106712865e9.8.2026.03.12.04.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 04:59:54 -0700 (PDT)
Message-ID: <c74e2c3e-277f-4f6d-b136-45bb049de905@redhat.com>
Date: Thu, 12 Mar 2026 12:59:53 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 net-next 06/11] net/nebula-matrix: add common resource
 implementation
To: "illusion.wang" <illusion.wang@nebula-matrix.com>,
 dimon.zhao@nebula-matrix.com, alvin.wang@nebula-matrix.com,
 sam.chen@nebula-matrix.com, netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, corbet@lwn.net, kuba@kernel.org,
 linux-doc@vger.kernel.org, lorenzo@kernel.org, horms@kernel.org,
 vadim.fedorenko@linux.dev, lukas.bulwahn@redhat.com, edumazet@google.com,
 open list <linux-kernel@vger.kernel.org>
References: <20260310120959.22015-1-illusion.wang@nebula-matrix.com>
 <20260310120959.22015-7-illusion.wang@nebula-matrix.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260310120959.22015-7-illusion.wang@nebula-matrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/10/26 1:09 PM, illusion.wang wrote:
> +int nbl_res_vsi_id_to_pf_id(struct nbl_resource_mgt *res_mgt, u16 vsi_id)
> +{
> +	struct nbl_vsi_info *vsi_info = res_mgt->resource_info->vsi_info;
> +	struct nbl_common_info *common = res_mgt->common;
> +	bool vsi_find = false;
> +	u32 pf_id = U32_MAX;
> +	int i, j;
> +
> +	for (i = 0; i < vsi_info->num; i++) {
> +		for (j = 0; j < NBL_VSI_SERV_MAX_TYPE; j++)
> +			if (vsi_id >= vsi_info->serv_info[i][j].base_id &&
> +			    (vsi_id < vsi_info->serv_info[i][j].base_id +
> +					      vsi_info->serv_info[i][j].num)) {
> +				vsi_find = true;
> +				break;
> +			}
> +
> +		if (vsi_find)
> +			break;
> +	}
> +
> +	if (vsi_find) {
> +		if (j >= NBL_VSI_SERV_PF_DATA_TYPE &&
> +		    j <= NBL_VSI_SERV_PF_DATA_TYPE)
> +			pf_id = i + common->mgt_pf;

AI review says:

This isn't a bug, but the condition checks if j is >=
NBL_VSI_SERV_PF_DATA_TYPE && j <= NBL_VSI_SERV_PF_DATA_TYPE, which is
unnecessarily complex. This is equivalent to checking if j ==
NBL_VSI_SERV_PF_DATA_TYPE.

The confusing comment was removed in v5, but the redundant comparison
logic remains. Could this be simplified to:

    if (j == NBL_VSI_SERV_PF_DATA_TYPE)

This was previously noted by Jakub Kicinski in v4 review.

Reference:
https://lore.kernel.org/netdev/20260207022455.4017894-1-kuba@kernel.org/

