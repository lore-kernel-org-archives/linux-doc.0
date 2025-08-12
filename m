Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418281898F8
	for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 16:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755014882; cv=none; b=AnHKhtNU+NTc1qAIBHOqpSYw4z/9F2Xt6B9B1cXwSNljRrBpr4qXG217T9LeJcvJfZudCI3NfJQYb1Ad9y97dvwd1rHZkpCQw7BVzIefAK2MAqxPmvCwfqtkZwF9Nilf/l4ESWMvVfPH6g5TzqHqtaj78mauLGze9WwZTrUaMjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755014882; c=relaxed/simple;
	bh=jX03RAcbAfJhNcL7aOavIN1goacBMuj5oRUp6A2MKFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=He0SraNH+NdkflMoOlmpX8njoyOivZdsfV49blb86B5VYb2I4JG+oC4x3hwc9IORqBKrsznVL9MSvHsF/z09RYgzBKmUgiCcaLmxcybjGr/KWVJqtdWWlr+ZiIV31u57TqDiDLofpTRb7TOkcJHBAgG3e4782HDgIKG4XjZeMys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WQf/gatK; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WQf/gatK"
Message-ID: <8a5027a2-0843-4787-bdfe-b33fecbb5fd6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755014876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zoTulFHaZzx1I/Kw9sVNIcow57siz1HTd5uDOy+OlVE=;
	b=WQf/gatKpDMMDx/KSl/PVYRAYgcSgBhCS/FK2M4lFDF9Lsaq8Dyj5Ue7dmFFr9ZiaxN0QX
	1Bc0+pVd6ID1+VPRuWfIxxun05ybPKNDm8Mr3b+5HHo9HbYEccArhmrXFXEwq44EugaWk4
	psT34+UGX49vXibChocdnO11asKY7nY=
Date: Tue, 12 Aug 2025 17:07:43 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 3/5] net: rnpgbe: Add basic mbx ops support
To: Dong Yibo <dong100@mucse.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, gur.stavi@huawei.com,
 maddy@linux.ibm.com, mpe@ellerman.id.au, danishanwar@ti.com, lee@trager.us,
 gongfan1@huawei.com, lorenzo@kernel.org, geert+renesas@glider.be,
 Parthiban.Veerasooran@microchip.com, lukas.bulwahn@redhat.com,
 alexanderduyck@fb.com, richardcochran@gmail.com
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250812093937.882045-1-dong100@mucse.com>
 <20250812093937.882045-4-dong100@mucse.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250812093937.882045-4-dong100@mucse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

> + * mucse_read_mbx - Reads a message from the mailbox
> + * @hw: pointer to the HW structure
> + * @msg: the message buffer
> + * @size: length of buffer
> + *
> + * @return: 0 on success, negative on failure
> + **/
> +int mucse_read_mbx(struct mucse_hw *hw, u32 *msg, u16 size)
> +{
> +	struct mucse_mbx_info *mbx = &hw->mbx;
> +
> +	/* limit read size */
> +	min(size, mbx->size);

you have to store the result of min() as it's lost now


