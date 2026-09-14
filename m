Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77973B0AD8
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 06:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789365769; cv=none; b=PgaPgX3Vw23+C0Pc0md3oQL53hKTSpPNqyIXI0XkF4lo/n4WFRDTpRfcii8jTi9oT2ZF7SaZGTtVy1qvrTnQmj2tr79i2f8vJQ6YyjqiBplBG9Ya+a+YSyhmtyF+9MOPV4WMj0oYBYlL1pZhcuYQEcpBb5oNSiSrfGZuxAlZCfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789365769; c=relaxed/simple;
	bh=vfn7oQvpJgZPAKzryCw5hpXtzMja2nZlamVrv+FLhn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sIdhjJrC1YGY8W2EV6I60Vfls9W24jd9Wu9DC5r3EQkkoMtjnlwBB9YN9t3O0fYsCM2gVeFShHezjsyCXolqXxJg7Z7oDTDFgwzZeazelAXI4r0K15hU3g5hfFFImQ08o9beL7Rvz1gx/znEchfAUtyIEoOzBMq85AwfOLpsZA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UyTXTINW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RGIPOyZq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UyTXTINW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RGIPOyZq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789365764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jR3AopfYN87ksUtB3meqTk9HxnnS1LzTmbbTTCKyMFM=;
	b=UyTXTINW17Xt+BH85e+S1GZfQTSPMi/J0gFV/aV7+pfoXxSLXaIbDnIU8RWJv4yyw5n3jo
	LawoL4dCiu4a8RkntNMcWdg7/PSwsoxtRCgIHVjEaBsmHAXl2Shu8TLLrrtEpvk9Yym+6r
	4rBfoEYBKFFgfGwh50i40xnFG99y7EI=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-WYLu0RFjPpir7VhbSoLXEw-1; Mon, 14 Sep 2026 02:02:41 -0400
X-MC-Unique: WYLu0RFjPpir7VhbSoLXEw-1
X-Mimecast-MFC-AGG-ID: WYLu0RFjPpir7VhbSoLXEw_1789365760
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b1a3f01d2aso4205749eaf.1
        for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2026 23:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789365760; x=1789970560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jR3AopfYN87ksUtB3meqTk9HxnnS1LzTmbbTTCKyMFM=;
        b=RGIPOyZqctd64GJQlIm23DBGttj0aHt0/O/cxvANKOgbsBBpZ4YQJD5pX0t6ev1TOr
         do33dsj3b+mrSfD7TVNvenfuebuhHNBri7dlKiLcAGNS59DVstL/TwWpj8g6q1PZ7zza
         AH2DdafwOkjar6pNEqarmKBPxmfBeIjvXFpKuChZY6LbsEwxyogQnPP8LiMr5B73ysdc
         vN9TcLnGrVAfQl7nJtEjmM3Uqf0TRTYia7RrRP8kDoYAJcibAAP+oTgYnDrh3NfDjwUZ
         Yn97eELXp1lOwXKvJZCHrvz86RSqc7Pj7io41KS6ikdE6qzwoQu350cl45ToVxkYmCQy
         ktxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789365760; x=1789970560;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jR3AopfYN87ksUtB3meqTk9HxnnS1LzTmbbTTCKyMFM=;
        b=DxK/lPlMUWRZwKLdijTSA1X1XDPlnWPZVBxKEKRQFOq31cyRh0hCdnCS5JVS+o9Ccd
         s1X4Aoc7YxSnUDKf34LuBdcSNlzQrCJf2XaJLRa8q9vkzKFvNWqd1iX8J/bmMAsnZZ3P
         1/1T1ZeFvCkO4dvGCrkmN6Ct4NyZs9tNrI1DXlelLi23VLlrKbDI0HD9hpTPTvNcW/Um
         JQ4PnbSYbbu+EfwoEkfEkTCe753EkqxBE2U0vyRHm1pFqDY7TUDNmc0U7hdEzDUa78TP
         /9uCBbH6efAUgAmd35LZChupqFp8ie3ltMV6HVjNm6/3lGridH6nVhWHvVb/BICZfv0r
         CXQA==
X-Forwarded-Encrypted: i=1; AKwUvBwz8N84OOHIEsYVphKkARjc98+/I91nCywGu88Kl+Vd3YTNI5VJFTwQ9DN4dkAOgWO0Zkp694pezbo=@vger.kernel.org
X-Gm-Message-State: AFuF++m7BvTjiB1VTn5DVGuUdBoSdwX4qZfkloi+qzAkDJ1EBK3gvCS9
	23MBd6v35GB3AjUsURmV4Snc3kIV4ygYPCZPEC/YBQBsW3BTDS2+d+vgw+XK/zawBrTHMT+LSu+
	V1AX3g+ZYghQ4eZHWcnIJ1CDcJHiJ8EZJ5slirMywKS633/HsNjNqnD8aQW7IWg==
X-Gm-Gg: AYBFou2XXQfvtFVpUc9C8C1+LEAV3XjUjzZc6g2gZRX5pNKbkbiepNiiAQHwAPapz7i
	/KylwpgNuw9RsfVeDuW3LDgXkFFvweioCFGbcEN9cIU6PDtOBtB6rnw3po+0XJqRr2TsBqDyGNO
	CUAI/U22sHwUt+J6xaQqzBDVMkoTYgkp4JMiUy6Afim8W8iUJIpRxUTmV2Qi3CO33abNqNvs++/
	Fvs8xWw5m91VaDkYec4qeySjFFOVhxBHdNiBy/EQvuoxu2jm8YMlNsTFPGV84H1lrkV/FissAWp
	TXO8cXlLigaYGgUNarpeEwjuSSOy3/pD2DgL2PF1rzudseR1GmmtcpQEVemyu8BbxTIUgNNnixK
	xUkuNhUHzlmQEJUeeQ4d/JG4mhxAnQglDue/pW5yNlA==
X-Received: by 2002:a05:6820:2008:b0:6be:8d11:a077 with SMTP id 006d021491bc7-6c542d2884bmr578884eaf.67.1789365760264;
        Sun, 13 Sep 2026 23:02:40 -0700 (PDT)
X-Received: by 2002:a05:6820:2008:b0:6be:8d11:a077 with SMTP id 006d021491bc7-6c542d2884bmr578855eaf.67.1789365759829;
        Sun, 13 Sep 2026 23:02:39 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed64fcsm27179423eec.16.2026.09.13.23.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 23:02:39 -0700 (PDT)
Message-ID: <554580db-4ae1-4308-92e6-2f010afafdfb@redhat.com>
Date: Mon, 14 Sep 2026 16:02:30 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] x86,fs/resctrl: Add resctrl_arch_preconvert_bw()
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, corbet@lwn.net, x86@kernel.org,
 linux-doc@vger.kernel.org, dave.martin@arm.com
References: <20260911163613.1131447-1-ben.horgan@arm.com>
 <20260911163613.1131447-2-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260911163613.1131447-2-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/26 2:36 AM, Ben Horgan wrote:
> From: Dave Martin <dave.martin@arm.com>
> 
> On MPAM systems the rounding behaviour of the MBA control would be improved
> if the rounding in the fs/resctrl code is removed but this is not the
> case for x86. To allow any rounding or conversion of the bandwidth value
> provided by the user to be specified by the arch code a new arch hook is
> required.
> 
> Introduce resctrl_arch_preconvert_bw(), and add its x86 implementation.
> This is currently unused in resctrl but when plumbed in it will replace the
> call to roundup() in bw_validate().
> 
> Signed-off-by: Dave Martin <dave.martin@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> ---
> Changes since Dave's v2:
> Split from larger patch and add commit message
> Update kernel-doc (Reinette)
> 
> Changes since v3:
> Swap parameter order (Reinette)
> Change summary prefix include fs/resctrl (Reinette)
> val -> @val
> Add Reinette's R-b
> 
> Changes since v4:
> Set author to Dave as he wrote the patch
> ---
>   arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  6 ++++++
>   include/linux/resctrl.h                   | 19 +++++++++++++++++++
>   2 files changed, 25 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

