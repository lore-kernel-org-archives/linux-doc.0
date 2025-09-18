Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FD02EA735
	for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 07:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758181146; cv=none; b=XRTOW4W7fSUNCyvmVz0pH79UdD5A02VeTzq9tPmIbp42vL1IwkTAGfyDBNy/ERSuvJ+7CCxAfjTp7xg6w0dLqELcY8Pc1c0S4Xom4bm6XNtos9xVCo+9SUW8qIl+2dPAe/hL73vmbJWjnhOCeCqMVjsY22lX1MlsLZz27EZsQG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758181146; c=relaxed/simple;
	bh=zr9sG0j68lmhOpqFGvsTn7V0/phVlb0kkL+RjN1CCm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IEKHkbw9dFm/+smFQmVkfZwCbYpuADlQtaozPPeHuNxDAufzNWMStapkeF1pVrzqFBZvdN+RvaF2xvzAB4TXdnsAs4+n+KjiWliWRvZbiepB8F846+LWk2y5glpeCw/trXcSjeOyTikfz4rh3dsLE9XahrmlAc4ty4GdmAxtKlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jSnk2+ai; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jSnk2+ai"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45f29d2357aso3833575e9.2
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 00:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758181143; x=1758785943; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EXt4qIjnPyB2Xiavamfk0cWdPtVvBQPn83+TPQKe3KE=;
        b=jSnk2+aiclMSdfvaENwl/v13ykOt04X0HlnCTT7V30DdbrP1cXbIz/sX/4jOQugfcd
         Xi/GdyIfvvHyywWNX0xdppR30bM+4mesm/h3JyYDFsRkOygGVbVUukIwLREglLsFkqsQ
         D6uhuIgJGsWt/NJ3ZsphlSleHbyOOqctidTbMMZQwNf/7KCqKI5lo1HZ2869bL+QvVPT
         Yuvvp51L3BZyvPAKA62kuoaIuLHem6gAppY4jWEFb1cF3kdpMNCuf6iortAcrp7z+YCV
         Apxx4mjkPvxZstkUqgMpAE9ppSJwcDZcqIqGhVsS8c824zPiTQyff0Pam9GHB2YfV9WI
         XT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758181143; x=1758785943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXt4qIjnPyB2Xiavamfk0cWdPtVvBQPn83+TPQKe3KE=;
        b=AV9qtmFzzTagDmCkCBIG0K+Gf0HkKBe1Ku0cu4YS4NFMK75f7y28Af4H8JWbhfN3/A
         6sOptSSy5V5D4Ge+Ruka9KME3FtMdcsETPDCVKGi0HkpyxZ30xdjpnosaFiDeczj50VM
         SToSqkFcKMAW1qboww3zWRCxVp/dN3Quyb45jqUYTcFZdO3X3bMp0DWaf327BClhIMOV
         VncWaXirDuPrv6nFuxA3tS7TFV5P1NMc4NwJKbSlOyJhINby89bFrl8IOtV0cWWXgpqj
         MXIId3Hz1SS4pgCRohpjl/IjiaMgRYSFIejcMJY5ngPlJD/MKeGwyvAdv/bbwDHQ1nbo
         d6jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU8VdZTnO58cQLsj8Vi8GzfIs3rxkDNEPSrlItX17f4D7ktJ7miycCd2taPaIuBt/VCwaXQc/j3Jw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRgJgsULMF/3TNESvSeMGNwvUtBF0hvT3wFNWLVFOhM1RvYpEO
	mUt2vgc0xF/PcrV+BswGjg1GJxP+tzXP0ahw98X4YIyk6HqeSYUDlTJMcx8Grfakoi0=
X-Gm-Gg: ASbGncutp8en+y70kPen3iLBwiGRFudHPvc1ZNHroqmYRAwk/6UiprrpHXl+3Y5fFHd
	2/2h47rmkIu/WfYio6U6GW7YBCyDLBUlait5EIc42y98frUe4ZtfW2Tg+l788g7ZoE+Sh4rfe8G
	Yy76h98vZZ2vnIWL05Tuv7XdRdQM1InZ405ZuBWZSPP3LxJ+/7v4QDg3NYdEj34iVkuBs3oMT3Z
	rsr2VUygV7IM9w7Jj4ir2K5Jf1JmSjsXwMV+wQWrPT7YM+JTFhn1GU0eKbAoWMwpVNBPStpmFXB
	+UfE6HEBXJFTQwkZHTnU46nmfcBISOhgd/qPDpIX/dX0Z7vPOcXFpb8utspAkM85GzZyvQ4IzJK
	QN6MjATAcs+JJYDnfCO80h3PoveVMzjDEgv5tI3iev/9Zug==
X-Google-Smtp-Source: AGHT+IH2MLUzEYKA2BPh6/SOk9G3FIKKjuMYakg7LjBGvzqYlCjhPjkDjyAhkJHpc9DvchwNU3Bf+A==
X-Received: by 2002:a05:600c:5250:b0:45d:d5fb:1858 with SMTP id 5b1f17b1804b1-46205adf916mr40396985e9.21.1758181143198;
        Thu, 18 Sep 2025 00:39:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee0fbc72e6sm2350863f8f.29.2025.09.18.00.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 00:39:02 -0700 (PDT)
Date: Thu, 18 Sep 2025 10:38:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Fan Gong <gongfan1@huawei.com>
Cc: Zhu Yikai <zhuyikai1@h-partners.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Bjorn Helgaas <helgaas@kernel.org>, luosifu <luosifu@huawei.com>,
	Xin Guo <guoxin09@huawei.com>,
	Shen Chenyang <shenchenyang1@hisilicon.com>,
	Zhou Shuai <zhoushuai28@huawei.com>, Wu Like <wulike1@huawei.com>,
	Shi Jing <shijing34@huawei.com>,
	Luo Yang <luoyang82@h-partners.com>,
	Meny Yossefi <meny.yossefi@huawei.com>,
	Gur Stavi <gur.stavi@huawei.com>, Lee Trager <lee@trager.us>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Suman Ghosh <sumang@marvell.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Joe Damato <jdamato@fastly.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH net-next v06 08/14] hinic3: Queue pair resource
 initialization
Message-ID: <aMu3E-wTfK-B18id@stanley.mountain>
References: <cover.1757653621.git.zhuyikai1@h-partners.com>
 <8d72eefd38d1c3b106eeb830d9e149df247b2906.1757653621.git.zhuyikai1@h-partners.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d72eefd38d1c3b106eeb830d9e149df247b2906.1757653621.git.zhuyikai1@h-partners.com>

On Fri, Sep 12, 2025 at 02:28:25PM +0800, Fan Gong wrote:
> @@ -102,6 +127,41 @@ static u32 hinic3_rx_fill_buffers(struct hinic3_rxq *rxq)
>  	return i;
>  }
>  
> +static u32 hinic3_alloc_rx_buffers(struct hinic3_dyna_rxq_res *rqres,
> +				   u32 rq_depth, u16 buf_len)
> +{
> +	u32 free_wqebbs = rq_depth - 1;

Why is there this "- 1" here.  Why do we not allocate the last page so
it's 1 page for each rq_depth?

regards,
dan carpenter

> +	u32 idx;
> +	int err;
> +
> +	for (idx = 0; idx < free_wqebbs; idx++) {
> +		err = rx_alloc_mapped_page(rqres->page_pool,
> +					   &rqres->rx_info[idx], buf_len);
> +		if (err)
> +			break;
> +	}
> +
> +	return idx;
> +}
> +
> +static void hinic3_free_rx_buffers(struct hinic3_dyna_rxq_res *rqres,
> +				   u32 q_depth)
> +{
> +	struct hinic3_rx_info *rx_info;
> +	u32 i;
> +
> +	/* Free all the Rx ring sk_buffs */
> +	for (i = 0; i < q_depth; i++) {
> +		rx_info = &rqres->rx_info[i];
> +
> +		if (rx_info->page) {
> +			page_pool_put_full_page(rqres->page_pool,
> +						rx_info->page, false);
> +			rx_info->page = NULL;
> +		}
> +	}
> +}
> +

