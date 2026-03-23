Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E200C18027
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 04:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774241117; cv=none; b=It+zgQYMVoGyIgg3X5BaRMpgrlgjfCch65MsVSRRh2PaWljy1WocGXBjBj+7N6XQ1oBneWQWtexnHuFtUul8bwxDHlJYwuFr+2Ekf0rliUfWtqxNo826P2m5gqvxpSuWDaXxeUBE5OH8q93zLVIiz0179pRtKsfpGp6jFL3woqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774241117; c=relaxed/simple;
	bh=TlyCAWysWztqJphkgOF0JdYCt4KjGxEf6BKnZUwtClo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RltwjbHdd2sk4I09hHtf0pIkPxem6WA5dHH5U4hQBQQqQEYvau3NouxDb4lNsBC43PX3VT5MEtlvCfKe/NtxdN/3eke4HTzYf/f5JExoJt8ja7XitUAQbvqFeEOupSCOJ8/+RAmD+oQWTWmkkxv+zGQO4MX4z1ttKPKVL0smJ/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g1c0Rbw1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SxeOhvgg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g1c0Rbw1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SxeOhvgg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774241115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tKHlNzVZ8flcJLfDOJhZcXKBIi7eEiUriVf/nusyPOU=;
	b=g1c0Rbw191iJO0lVKy3Kk9UH8kX44htvhOSXjqUWRbd0x5kwN/l8hsTs7LxuZWF4WgABrL
	2shNjGD+yxG9ayw63ZhwDuHJhnb9UPE5Lwd+KrnqNHUSmCwHmzcMLd1LEcgjN1rbmcvkA+
	7gaNA5l0T92VfCTw31rhC3dJDzdMZrU=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-4Ef3D5wWMraQD5J_YwHPKw-1; Mon, 23 Mar 2026 00:45:13 -0400
X-MC-Unique: 4Ef3D5wWMraQD5J_YwHPKw-1
X-Mimecast-MFC-AGG-ID: 4Ef3D5wWMraQD5J_YwHPKw_1774241112
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b091c3f891so14477455ad.3
        for <linux-doc@vger.kernel.org>; Sun, 22 Mar 2026 21:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774241112; x=1774845912; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tKHlNzVZ8flcJLfDOJhZcXKBIi7eEiUriVf/nusyPOU=;
        b=SxeOhvggRMDifAri0o5SKvCqJU0R9JBSVOjfxHXdEbo7kJfIXCOXPRW5ronoAfdIG1
         BbQ2QOeSRHt1bMm/qFJL90cpoARFQkC6ksEjdD1tjRB3d9U2sQwxKfDUwVd/CsW6ZM9t
         jVyQZtDaYkCmjd9X6GDtJppBhOj1rJMcAnw0RCIVUB4D5mH57GNpskIjtKGytXkgXhjm
         shFr1CwAlwbFRTP+1V/HzLxkFA8tCPNm0+WDiMJI8Ep/O/qSGudHHtEaJT4Kmse4lLHg
         88SHu+Pgfl8rAI7//TKUUyUPv2SECgV67INXbT3fJyygntW5JDl9y/Dp1P042N9F11Ms
         C3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774241112; x=1774845912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tKHlNzVZ8flcJLfDOJhZcXKBIi7eEiUriVf/nusyPOU=;
        b=oaT+ZQsz6eO7wmNejRsVQ10/77Ghcd1bfYN0urCSKbi1CC0yjXrYTAX5FfsBuJOJhy
         wdMkf5hTgEPwdBRjUGR8X8C0ozS2rzGYy+HfmY+Zyfr4cxOuzaezN9NTFH4Ut+n+ydjR
         wOxK6e8P/lIB24GBfPLHTdet5e02IEsmVX2tD0v55u6KQHvMH2hGvDAm6RGg7h7kqDJW
         /W82LPd7sthgl8gu3Ln1KLoAgebXw6yB3H4rgR0CEAGUyGk5XhzvF4dyO1UTdTWKUOik
         Z443FK9KtJxjxCEONlrxBkkF8TUJXQpD4xRR7YOATz7YAe1EMMlp7woOZlTfb6crwtja
         Mybw==
X-Forwarded-Encrypted: i=1; AJvYcCXVPJtO+GwXq5gIz6GzToV94YoTsidxxNK3M/SMzt1kBUgFnr482hoAUswnz0VrdgqUX2knFmmhtmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjtPqWIwKTGbfmfQA/PfdYWeew1jT4pGCurDtsunNOPxgsV+uX
	nvEXN6Oo0jiHnDBhArtWctac5BDn8RVyr8Rt/+/aNxP/p9lUEY1+0IociN0N/dZxb0mL4KUee/q
	ZOVkX2SNdDNlxPxR5/NTmn3sffWNxXOFgggg5k4DfRS08lEAc1ZPfUwayEOkV1A==
X-Gm-Gg: ATEYQzwcGFTAHgiAr2dTlob81l8c4i7BUraUeSTOnv5s5jl++ZJSnEDa41C5KlYFOeM
	Ttq+Bzsk7/G56aWi2iFJGY+ttHk2AJWo9SGX2MP6KIYo+L6cpigGnw69Im2UpLzbYmqGwFAsxpD
	prcbASpJSUFKElEZT1peO/QKh0kvQgPTiugutaBgwn/Zw2X3ih10VQ1XVLQt18ZuQN3/m2dHW+A
	I7GvSLdPV7W5M1gD+d8PFFaTxluyPyrrvhhIPHXezFtcbZAWLGXKFDxGvddNzjPQ5ePhwJxQvx7
	z1MxlY/P+qexPU16Wjd10u76eV/179VLujGFrb/Di5sinsGFi2BLJaOiv4w12prHMdsEWipduiw
	uy9LyC+shLuqLxB+4m/deN6WsAUB3wbvZAAogBOhae25ZiKQ9TLwZZrWD+9ywf0be
X-Received: by 2002:a17:903:244f:b0:2ae:6192:8d78 with SMTP id d9443c01a7336-2b0826c7097mr103435885ad.1.1774241111993;
        Sun, 22 Mar 2026 21:45:11 -0700 (PDT)
X-Received: by 2002:a17:903:244f:b0:2ae:6192:8d78 with SMTP id d9443c01a7336-2b0826c7097mr103435595ad.1.1774241111581;
        Sun, 22 Mar 2026 21:45:11 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08369e41csm96333595ad.74.2026.03.22.21.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 21:45:11 -0700 (PDT)
Message-ID: <35f92bc8-1eb1-43a0-bed2-aaac87a61c19@redhat.com>
Date: Mon, 23 Mar 2026 14:44:58 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/40] arm_mpam: Reset when feature configuration bit
 unset
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
 zengheng4@huawei.com, linux-doc@vger.kernel.org
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-3-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-3-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/26 12:45 AM, Ben Horgan wrote:
> To indicate that the configuration, of the controls used by resctrl, in a
> RIS need resetting to driver defaults the reset flags in mpam_config are
> set. However, these flags are only ever set temporarily at RIS scope in
> mpam_reset_ris() and hence mpam_cpu_online() will never reset these
> controls to default. As the hardware reset is unknown this leads to unknown
> configuration when the control values haven't been configured away from the
> defaults.
> 
> Use the policy that an unset feature configuration bit means reset. In this
> way the mpam_config in the component can encode that it should be in reset
> state and mpam_reprogram_msc() will reset controls as needed.
> 
> Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> This goes back to the initial feature configuration policy that James
> used in the MPAM base driver rfc but I unfortunately
> suggested him to change it.
> ---
>   drivers/resctrl/mpam_devices.c | 40 ++++++++++------------------------
>   1 file changed, 12 insertions(+), 28 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

