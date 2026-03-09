Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE232116E0
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 06:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773038748; cv=none; b=FVv+5i2pUMvv8M0lkfsl944AQCaimL+bizEBAIZTUEsvtltSc6C08OBDXS5t61v8nmuS96zp4048qQhyZ3umbf6DZdxZxaR05AokTBRMg4I5dPmIpImPckOr5HWv8tWoXBkbKXeswvXI8P52QGr5HLz3EbCoyC2hC0bmnDJcdKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773038748; c=relaxed/simple;
	bh=QkKK4fWpumxzrhaCggneBeugGhgpEzJlB/gJYTUgD9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GFohKsQccWO6/afvkWE6M8rlniZ+IazbHW0dF9tjGccD5U2qFOs1H6vb7Nfzv1xr+B8AqVP3rLjSHVmAc+xdZIU9j8r1ObcuVHfKewFtbP5uC1APPMLqeC3h6T4lE54JA6d9rpdNAUSLehEP1ioC2xcl+KfVP7Pa28L6AKIgw+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JNKBKlBE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mdl0piiZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JNKBKlBE";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mdl0piiZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773038744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=30KVmZahPHcWNSCxYdF/dWg9gkm2uvgSkG/Do3sMyq0=;
	b=JNKBKlBE7eTZQCQmvEQ1wSYvYR/lVV0ylAMeL0rRe9N5bEsPR4U5jbCeB725+7oB5qhHUQ
	btR+ENv3yPcoRnUb8fcdU3iJJbsz3aGVRFrN+vD5FgafYoqf7MMJ4ktH5RTEznOyn4ent3
	LPcNgaSI0aSJMLg4qowrrcWBrPJR/l4=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-1ofqMB-6PrCyQkwIDGCQjg-1; Mon, 09 Mar 2026 02:45:44 -0400
X-MC-Unique: 1ofqMB-6PrCyQkwIDGCQjg-1
X-Mimecast-MFC-AGG-ID: 1ofqMB-6PrCyQkwIDGCQjg_1773038743
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358e425c261so10109923a91.3
        for <linux-doc@vger.kernel.org>; Sun, 08 Mar 2026 23:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773038743; x=1773643543; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=30KVmZahPHcWNSCxYdF/dWg9gkm2uvgSkG/Do3sMyq0=;
        b=mdl0piiZg1Ztayi2D/v8SAnAB9hsAR5PJ5okdhPJH11duXlWFxVXoclbkOpjHDDyql
         ywNVmgrYEDZpkxwjEwEurYnIqhczQ5968c38wuftw5PY6BGR+qr7XpXCYiF8yBadflsa
         amAIH5UY428litmJ6y2PMu9vtMgXfi0TipD2o1hZiKRyrwNXGOCEUBsRR1bKqPuzdqEh
         17m1tgOVnx9Zilgi0xpJ0btBhcpvwPxuMK7e64tB9c5Z6wwm6Gwqm5i2UK536J1LLFs4
         fddxfF5v/dYDlWl4aw8yFbPSxq1w5/3BYsDzAvY4p+/RdA/SniHnU0jQspg1LVAeE6mP
         m3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773038743; x=1773643543;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30KVmZahPHcWNSCxYdF/dWg9gkm2uvgSkG/Do3sMyq0=;
        b=mEbfBYZQRn8wb6gdtN9MOQrBYni8FeTvnI8vCLRLaJ7J6K01HoJHFAkXrQn6GDVeC9
         4AOI68ZP9owclGkYYqU+nEYPHad6GPw1qnDqKkIIyuTcYgvGaJ9/dxqnw1iTfgbttAAr
         QN0Z0ZU8C+7c1SpV1WORpgPxQq4CbVCbTLnq7pfdNBH3ARUg9eP3ltBgl9rozbg5caQq
         imVzME+cFzEdp2vfxuWcMx+32FTy/GON7G8yHImSUq7v32IM4suYQZJn9hTCCA6A0QVQ
         bDSVz8HrRBvDReIOv6hvaFv72/E96cPIWr7V50vlt0hSsTRWjBaqPMvYKklOijjtLyQZ
         egOg==
X-Forwarded-Encrypted: i=1; AJvYcCWHnuYGXW4oUwQ82pZvRI8movlsxTjQw5/GouDpxHGErN+MUaFcI13aN5Jz7xRNteAMrl1YDrWUCJI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbSlyovUgA3IMMAcGGok1MNKRezpQNJW4REARCC+Z/cZOOugxq
	tiUTlTQOqK98SUVl8vMG5X6obReLpCNYwEhlGLOEdrlpKNgOC9w1veox4ZhEluxQChlscH3xKkI
	oId+iHekfn+b5cnRq9CWeRlcmzgdQviYMRqNpXLez21DV1VhEfMEdk+sTxlGqpA==
X-Gm-Gg: ATEYQzyGgsm1z6FVgsKtJIcBdz8lIHydrpN4sQWErxyR8m2dDptNLS80OmZt+1WIf6H
	sEV9ZxnTdG9KdHgJGIEERl2f/dctWmS7CEjJPYzgLm5Sv2bX7BMVqEOjADO8XRp5fm2THHqZs9s
	3Z3q/DRuVqjroKUc+DhRzcLVb6a5KcQwQgJVR1NDiZxT0dzdM9TwXF3/6VjfXby//SJjEqrptpq
	ZSxMNWlL3szrcZQQ7nY1ZUBYg+qr3/yfzzEAb1Tr8Auq2+Cqsj0WwqBCQhFU85YASC8ZteV2u90
	bg0cl073N2tMe83ubrW+XvQ5OaZEkbL35eNPaPBI94/hVCuv8bdveJ0Wp3jHTHWWOtWVPQvE5G3
	6oEWwvnRYuWxNnnhqoFR/Aai31Ke0bVv7DA/CMdbHAxV/idvZA9QjkEbIXyA/iP+3
X-Received: by 2002:a17:90a:fc45:b0:359:9224:6c26 with SMTP id 98e67ed59e1d1-359be238ec4mr9680082a91.3.1773038742758;
        Sun, 08 Mar 2026 23:45:42 -0700 (PDT)
X-Received: by 2002:a17:90a:fc45:b0:359:9224:6c26 with SMTP id 98e67ed59e1d1-359be238ec4mr9680051a91.3.1773038742409;
        Sun, 08 Mar 2026 23:45:42 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2e0e1aasm16842789a91.15.2026.03.08.23.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 23:45:41 -0700 (PDT)
Message-ID: <d4cef1f4-5329-4f0a-a951-7c23716ee78f@redhat.com>
Date: Mon, 9 Mar 2026 16:45:24 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/41] KVM: arm64: Force guest EL1 to use user-space's
 partid configuration
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260224175720.2663924-1-ben.horgan@arm.com>
 <20260224175720.2663924-12-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260224175720.2663924-12-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/25/26 3:56 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> While we trap the guest's attempts to read/write the MPAM control
> registers, the hardware continues to use them. Guest-EL0 uses KVM's
> user-space's configuration, as the value is left in the register, and
> guest-EL1 uses either the host kernel's configuration, or in the case of
> VHE, the UNKNOWN reset value of MPAM1_EL1.
> 
> We want to force the guest-EL1 to use KVM's user-space's MPAM
> configuration. On nVHE rely on MPAM0_EL1 and MPAM1_EL1 always being
> programmed the same and on VHE copy MPAM0_EL1 into the guest's
> MPAM1_EL1. There is no need to restore as this is out of context once TGE
> is set.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> Drop the unneeded __mpam_guest_load() in nvhre and the MPAM1_EL1 save restore
> Defer EL2 handling until next patch
> 
> Changes since v2:
> Use mask (Oliver)
> 
> Changes since v4:
> Explicitly set the mpam enable bit
> ---
>   arch/arm64/kvm/hyp/vhe/sysreg-sr.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

