Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569FB29BDBB
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 23:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774307456; cv=none; b=SEB2uBzt0+MQ0ZN6wsXudBk7YTlZDYHu7UHqyN15K56/eGLuhE3YfF7aev/9w7wpj/pcwodUkiYwpIwXgiDnT51AFOc3Pb6C67Xe9wUvJds+Q5tNJEodb1XK0orVnrlngahArQue+8qm65ahgs/u75s+gK5MJ/WBT9anDJ2KdnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774307456; c=relaxed/simple;
	bh=AZ9TpcvA7JbHmddDEEW46nc8M9aYhe0GaeJO6Vw0r3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jW42uKXvtfWy5q5egEghik6xANB/mQujSe6BL5N2xZPD2n5TllAmo8MW8uxTYH8p7ogK4UYEuq8vH75o+brgLUDJYhxE2a8JuC8VAWR5oI2un9XC1fQx/We54W3SvX9b8QyxhkEBBM8DkD4tg9TMA5Dhuliy+g5TwDTtt1iiZR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aaIAPh/M; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KIQJYoIC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aaIAPh/M";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KIQJYoIC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774307454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NL7u0uXFVbBow0LkO2mREfC0sqBnGNJGi0Yb4KYOjHE=;
	b=aaIAPh/MELGyimEx+iqcfohCqM8zV+bSFNacE4HX3hMrOuFwKq96qIfArXwHEjmkSZjw1c
	/LIM3epZBAbEt8UuzxJJ99e1SU3eN8rbX08giBTGOcmARigN6EW8WaGN5Qlo7QK6iASdz0
	/Y5sKOLOGllBszHBV6U9vxyYdwuNeXc=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-Irsgx7JNOs2dFeoBcIfiOQ-1; Mon, 23 Mar 2026 19:10:53 -0400
X-MC-Unique: Irsgx7JNOs2dFeoBcIfiOQ-1
X-Mimecast-MFC-AGG-ID: Irsgx7JNOs2dFeoBcIfiOQ_1774307452
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0601ff3d9so12423475ad.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 16:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774307452; x=1774912252; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NL7u0uXFVbBow0LkO2mREfC0sqBnGNJGi0Yb4KYOjHE=;
        b=KIQJYoICmzmFF4sLSiF4K3NNrAthnkV4u4lhA19VDbZoWrmbqonVexEnaMOJ/WWZCU
         eLNB7LG23zyg6avTi64IWDF9Z4ZQz2l5JN8WizjvlzR+BWoot8Rzzszra0qDOuHG0via
         92j41SkqronlQww2hMtGZdRGzuMi6WwSP89mlNpMls4K44tPF5swKB3KZ78vCKS/I+S6
         LaWVuzWY0/CgEADmqOFqVGTYd1QCGPuBxg+LCcBj6u5I01Ngln33h/0z9tdK67ZTWmmw
         B82pg1DbdvOuG2F32FFzPI8OJEXhXWQr8jGkUto3f0xBkzgmk0skDlvDI4XmUyM3U14/
         KGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774307452; x=1774912252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NL7u0uXFVbBow0LkO2mREfC0sqBnGNJGi0Yb4KYOjHE=;
        b=deWNMiWUTfouejpNAetv8/QVg98hn4pI/KBmVaGq6qkr5wFKgAxcHsekIWeoBE3xAB
         5en/BzitQwesNMOqcgcVGrp8ofrwMUUBFGRVJ825/31phFlWWWppWTUYyfj/Cioh6dMe
         56FupCs1SaVhifQNvjFZEMyMhLZFFtS5VzW3dWqrt9rtYP7/igg68FTqVgdq8lcNB2oz
         GzidyrJCjVzVRyyYnZppETcKD65kBCk9kNb+/WAlib0jJXEe+EFSaloX9N+I7qpcnqw9
         ARWtqX+Rn7OO0chUdMUIxyAP5DmPwd/ySKh3/UcW+M/JWjRmvObfp3j4pA7B4TW58wr6
         47sQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6rFUjxotHOk7U3MwJ8xScz9jAblj2njhiAUSN5ZsbrjEIJZAc6u6WWeYWxPoxb83VJCiXdrbA/uw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaQL9zImfYn7FK8cex//H4N95mx/YJtqAAdW2rqpcGLEKBWQj9
	evaAsVHQoEsoH9uJcXR5Hs5okYVn2S4IpfoPiERtdstvIEwMcHk2o133UkLuELOgwW1st+sHm0E
	xLNOyIdabnBreCHLn4Wa/zxTIfEan04U7F6fB1sDhQr8NYN4tHQgIwn2D4EOwPA==
X-Gm-Gg: ATEYQzwq1AsSY3IaB1n4BuF0y+Det7bt7cuZEgKnWDp6ZxAqlo7ux7mgrvjA95NNo3+
	m0hUZlOuZ9DySCxpfch/+kyGYUiSANM3XtY0iAGf+unDU9beoXI7PDAsyq7o4REVkMby2XF5naN
	Qx3AvMVY6hh9CDb8KckyD+parW8Z3VG9XnkAeqbQxTjEe+jLfNhc9OevxBWyDOFjeixZIY2/HFS
	j95jM3Yojq52dA8eaGtWqFB0HdsO0+SPoYBmFjwE/Jqz81D+wXzjWiJu4g/6N/ThQqr0+UBvp9E
	dGe0bRNFm8xfxFaViU7ktUO0eJAA3+pj49Dit+7E7BOp7XwdBmWzbA+7UsUKxwqTPdWDFW4+45L
	FiOo/oUPtVV7b4Kz3rJi3mVP6CMTEXGR42a/hb3rxpKm2HYpg72a2nYYoVL2jo46d
X-Received: by 2002:a17:903:41cf:b0:2b0:6d56:8d29 with SMTP id d9443c01a7336-2b08278b258mr140241965ad.32.1774307452106;
        Mon, 23 Mar 2026 16:10:52 -0700 (PDT)
X-Received: by 2002:a17:903:41cf:b0:2b0:6d56:8d29 with SMTP id d9443c01a7336-2b08278b258mr140241545ad.32.1774307451710;
        Mon, 23 Mar 2026 16:10:51 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083656b51sm152188685ad.54.2026.03.23.16.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 16:10:51 -0700 (PDT)
Message-ID: <ea39c13c-56d2-4f9e-b427-085b32720e40@redhat.com>
Date: Tue, 24 Mar 2026 09:10:34 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 26/40] arm_mpam: resctrl: Add kunit test for control
 format conversions
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
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-27-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-27-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/26 12:46 AM, Ben Horgan wrote:
> From: Dave Martin <Dave.Martin@arm.com>
> 
> resctrl specifies the format of the control schemes, and these don't match
> the hardware.
> 
> Some of the conversions are a bit hairy - add some kunit tests.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Dave Martin <Dave.Martin@arm.com>
> [morse: squashed enough of Dave's fixes in here that it's his patch now!]
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v2:
> Include additional values from the latest spec
> ---
>   drivers/resctrl/mpam_resctrl.c      |   4 +
>   drivers/resctrl/test_mpam_resctrl.c | 315 ++++++++++++++++++++++++++++
>   2 files changed, 319 insertions(+)
>   create mode 100644 drivers/resctrl/test_mpam_resctrl.c
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

