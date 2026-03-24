Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBF239EF28
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 03:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774323847; cv=none; b=fXgXUlaF014TtgB/P5kLeTpRp5y/tw7KpoxYZTRRYXs+3cn/Rr9Sy5Vntbkg/RgwCoyL5caYsBxMONm+PcCDdN9mtUUze+38iPxb7Rn3f+EPPRH2dNR7PYhuaFt2XFxQcm0Wb+XjTrL934T5KZpYEIbUyi2Ly8ONO27gqG9BGJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774323847; c=relaxed/simple;
	bh=4N9M70mrOIh0OO9rMT+OhiXTYQ/fudlY2z4WjzA3saQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCmUdYsph/WlUNEIBsU5A1ZsY8qtV2eym78uDLF6HrR9thor0yC108MIAH6N20DwimNrYM6yaVWg3PDDgKs2XF1D8larTjTLRm8uaLtqQuIDt7JC+CquVM38rq66bsLO+gMtsGZW0gp6PJ0rPCSmlYOXBqYC9qHwIXtFxiqBTts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z7QHDzby; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QwtkfI0T; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z7QHDzby";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QwtkfI0T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774323844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=46vkEpgGwh3UWUDmy3UOMOyjg6y8cRBpPBBpbY3RHZo=;
	b=Z7QHDzbyPzWO6RU6PgFomJtv64hprEguElMO7NsphCeHJzTAi3zEHL+OzqXM/f0Mepdvav
	nPlvC39H9ie+X5WjrxJ88LtOe3Lhgn6Xz6RZqDMothsKsp+hTmJF8PUXZ1+jS2iWlLwL8r
	lKn3NGry9XhY0j1Lx4ipmSXa0xneErs=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-uAXl7xiHOiuBnu6GfkC34w-1; Mon, 23 Mar 2026 23:44:03 -0400
X-MC-Unique: uAXl7xiHOiuBnu6GfkC34w-1
X-Mimecast-MFC-AGG-ID: uAXl7xiHOiuBnu6GfkC34w_1774323843
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0565d77a6so12320095ad.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 20:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774323843; x=1774928643; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=46vkEpgGwh3UWUDmy3UOMOyjg6y8cRBpPBBpbY3RHZo=;
        b=QwtkfI0T/+0WVBBLuwDNGn4dZUNFkQd9DadS+QV0sm991j9aUz4hWH+9MgVEKF0bE3
         RcaPGm0FR6v3ONjllmhO29sgdlQLWEuF0ko5E3ZidJ7fz4OQKh4Tb5bhMqHB35k3lJHp
         B57yAeOMd53m8xFa7DMA/60ZqVGN+DPYv1IM3kVfGZ19ulU28qFkEh6Rw0AlFenfl5YA
         UzviCVzy7665Wtqgk2dYnZ4Ge0SEqT+BOpIaaJbGoD7VfZa2MBeVLOWyP4snKt/fXm93
         OFXcZM805dPXEoW0Nbjj2lIUQ34q+3SroPHbUlYtQ72lh/+oUT5Sis9/j5juG8g2DlgO
         Hlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774323843; x=1774928643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=46vkEpgGwh3UWUDmy3UOMOyjg6y8cRBpPBBpbY3RHZo=;
        b=ipV+AEjEhj7c9FKA+YcCHREn2ZT1ZLueM1eCR+3TIzFZxUQ862axHcs19bvs3d0BFE
         REQE9p1zTJ8Duvnqj4ss402480dAHrBLxVBy2kLxqK7SLGQjNm9Fwy6FNk4Tx/oN0+6o
         WYVpui71aHrNUydT5JMM4jrLXfRwP1qmspVCDYwQoqfBenPaKHcDHmCs01rmx0EPydZI
         gOYEh9bUXjpJV8YVmaZc3bZdFnqOd9Kz4Weh0rzidGVdpDdX+Ivg3dIxKA85qMxtRC1X
         QlCApifcUiqqoB9NuH0UCMdDjIFrj1crBDb8x1+RS7iuhpp1ICGY87P0ylVy/MMoDMDa
         PWFA==
X-Forwarded-Encrypted: i=1; AJvYcCVE4jV8n1jR8N9dkwaHEmElPzUloViPBlvHxwpxhFk6DK4T7yH6bsASh6m1wOeMVo1+Iufh0/Xj2hQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGa2/jT1zLXqv5sK0x4FGG0sWQV45LPNIpDFYgxB5/tUBod71L
	I5PtFE8eMCblnA30ZjR5VkU/h928M7zOuA/uPWjYMVFmb2YxoI8Pu3aZN67gZkIuKDJoE3tnWWy
	FHX+7nzcZ1m7CcPIN0nWixuPzFiixhBV1n2rO+xCeUScpE3aqW3gVNeBPqTDorA==
X-Gm-Gg: ATEYQzznjTsYluBH7uHNqjgiGk3291zpPJ6uWYWUWDyuwrnSRsIYiWexcv8JLQaj5qe
	EW+q0hghNALKax7gECSvpePtctFz5AjkHZx5VV+IrPQ03DEuopJOSjNB5q3rxApSEWwWl40SCs0
	Qea8FYSkYS/n57kh0aQhFXCriVz+SKwwwSnk9GHhl7LpHfGQMHp+VcjUKA6WkKK9PE6Q5e+YbUZ
	zSo6Ql4DY6DaMHrWB7AvDfmIoksDYr7p3KlAsegCrPCj4AZ+pcKQeDSOsVVIj5rUKIiz4203TDC
	x196D3jkLLI8mGlSxJziET6R4VzgasaZgLavuMpygXqzVPfyrY6bMERuHDY/nJ9Fk4+oX6R7sDP
	i5n/OBtAovjKnK6HeDBNzjn1YJH8hhIKaPmUvgtFW3zY7XeRLwESWnMpE4zjDL+kc
X-Received: by 2002:a17:903:1a0c:b0:2b0:686a:d461 with SMTP id d9443c01a7336-2b0827b7946mr131722275ad.45.1774323842344;
        Mon, 23 Mar 2026 20:44:02 -0700 (PDT)
X-Received: by 2002:a17:903:1a0c:b0:2b0:686a:d461 with SMTP id d9443c01a7336-2b0827b7946mr131721755ad.45.1774323841960;
        Mon, 23 Mar 2026 20:44:01 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08352aea8sm162613375ad.21.2026.03.23.20.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 20:44:01 -0700 (PDT)
Message-ID: <32238136-6edc-4bab-a539-76b66f6276b0@redhat.com>
Date: Tue, 24 Mar 2026 13:43:44 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 34/40] arm_mpam: resctrl: Call resctrl_init() on
 platforms that can support resctrl
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
 <20260313144617.3420416-35-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-35-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/26 12:46 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> Now that MPAM links against resctrl, call resctrl_init() to register the
> filesystem and setup resctrl's structures.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v2:
> Use for_each_mpam...
> error path tidying
> 
> Changes since v3:
> Don't consider abmc/mbwu in teardown
> ---
>   drivers/resctrl/mpam_devices.c  | 32 ++++++++++++++---
>   drivers/resctrl/mpam_internal.h |  4 +++
>   drivers/resctrl/mpam_resctrl.c  | 63 ++++++++++++++++++++++++++++++++-
>   3 files changed, 94 insertions(+), 5 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

