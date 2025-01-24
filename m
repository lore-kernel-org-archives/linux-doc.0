Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC9A1D5CF5
	for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 12:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737720544; cv=none; b=u6YHlucR9xPKat64gEGn9QpcuqyoXY5kf/XoEErTzHrko+2nip3VShEzS8doCe/nla+q6IG0cYnChg5mH3LV4giNERFJQt/OOTt3KyfRHohX2MybgMw/yEEjwJ1ZRYIHVcuF3akwdbELz5OX57lZ8jkIqN9M+i4gtxuy3WOaspY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737720544; c=relaxed/simple;
	bh=sathMMYpkd9IE0uKf0R4f3atWBV9w8lHu5rElf14cQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fKbkoIN47QV8gXd6HRlYJ64A/0pDRBntKx5tZPG9DRngMh7MMPt0qW/e2GN19tZ8RCzcUuXY8EGjTRtF/IeGGkKDgzyBM2S+rmMYzpoyV4k90R4bPaswu5YGzFGI/Mvk57I/Xe82NuLLPUny67R/LZuuO6ZrpFJxg6sncHtKD5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z4KQcaWr; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z4KQcaWr"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so1500061f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 04:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737720540; x=1738325340; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g8iXRUajdsrMRbaddd2Fj3z0NrBTrdrHV4nnZ8KPUYE=;
        b=Z4KQcaWr3zyVzgar7eKGP2u+EgOyOrQHqSugBCDREsEpaBCpUhRamhs0Dxqk5AsywG
         +KbrOSEzY85dD4GadDQbRTzmbV3OCJsQKNvIp5ZtDijRjVT9ro6n+7R8VAtiZuzZo8vv
         5iv9HcyTB/J03PcDWnEaV78w7YG11J5hIpiKdjaXpG4WBN5Uel+aF7n+13JcqnDoLfIQ
         RsrcI2dCbH48+kFZoomIeDEB8PjCUYyV2NYwfcIpHn5E74CVBgv/ohf0FYOhfGOM0Qdy
         TStSV79a80h0A5tQv+hUxSlLxFROeuDUxZZgYDwZBdzFVv5Yn7dt7wK361m6jR5qgMzm
         DdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737720540; x=1738325340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g8iXRUajdsrMRbaddd2Fj3z0NrBTrdrHV4nnZ8KPUYE=;
        b=jRGx9McidxTQMZkHuNAJVKBlzO0jCfcUJGwVaGDD0wkrl40+QDsR8MJztAM3lIodGY
         1/kV9nFIXdwV8JEeM7526QDKwkkU2FmtTHMv2PNXkJfiElVPkZ71OmY/nkHrAHoW2lKu
         HCsFmaLDRncWMrzZwHMq2diE/wMPgDbSrRRdYq86U37kyLlaOS/AWdSPODq+FtoRAtO0
         rhM0LYSxxgP33QjqpjRt6n0KMDVW6eCalaHWAzI6NWrlDXUk6g/TpzL/7QVVymczrReP
         D7TotRsTyTI7kipKgcniJ/8i19Hp9vTlnEfV/XEpw8bED69Y2hAPE0WxLYpqEZIo1iDG
         G1bA==
X-Forwarded-Encrypted: i=1; AJvYcCU3FBv6RnTqWt73mr0UP/uk2ml7omCmMLikfywI5+MHIyGkQwSCyKnxqwcg9lb4FqPtUofcGjfvZXA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoWuRP/fVKy3Jv7eIh8uaA/IQDxntcQV+g35MHbCT1Ben4p8Xq
	mqxfb8dxG/p0UU+J/WjJ1SmMRQCf6H8npdbGlCQCj82oodFASWlyUoVqia+ShBI=
X-Gm-Gg: ASbGncvj2ckbGVCzGI6NNhqGVG1Us4v5TaOcRDhWsFPffjoWOdaASBIyNtOl1WIO9+4
	1bm/zfIYWbqCo7yPOgdiyRSblmZKjhVfrSBaCAyCT9FKB+plMk1TjH3mo+5VtPWpnoGVidPZNVc
	+uj2uiBI+NnKyxfcXNzd+80TP/x4C3L+lBLjw2PsDCA8gC8L4wpt06gEMNScyQR1QnPjzGpGdz3
	yIDF2e5+TiD+FsizMPldj5mZnbBDKRfhjfWCZLwyMmyZ+3VvxWwigm2UFeNe49gkbd6DT7D8ENC
	fLxnMLPFbwWnu0s=
X-Google-Smtp-Source: AGHT+IHOVyv4rF1Ie9u8PD45exHzGa60S5mXYDhT21RSV9wThybLuUYDNdK3QGFTrCOWKSuQcJXjJw==
X-Received: by 2002:adf:ee0a:0:b0:386:380d:2cac with SMTP id ffacd0b85a97d-38bf566c309mr21561411f8f.26.1737720540517;
        Fri, 24 Jan 2025 04:09:00 -0800 (PST)
Received: from [192.168.68.163] ([145.224.65.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d6b2sm2566833f8f.34.2025.01.24.04.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 04:09:00 -0800 (PST)
Message-ID: <da7dcddb-d407-41b2-8343-a0ec21914606@linaro.org>
Date: Fri, 24 Jan 2025 12:08:58 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 0/8] Coresight for Kernel panic and watchdog reset
To: Linu Cherian <lcherian@marvell.com>, suzuki.poulose@arm.com,
 mike.leach@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 devicetree@vger.kernel.org, sgoutham@marvell.com, gcherian@marvell.com
References: <20241216053014.3427909-1-lcherian@marvell.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241216053014.3427909-1-lcherian@marvell.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/12/2024 5:30 am, Linu Cherian wrote:
> This patch series is rebased on coresight-next-v6.12.rc4
> 
> * Patches 1 & 2 adds support for allocation of trace buffer pages from
>    reserved RAM
> * Patches 3 & 4 adds support for saving metadata at the time of kernel panic
> * Patch 5 adds support for reading trace data captured at the time of panic
> * Patches 6 & 7 adds support for disabling coresight blocks at the time of panic
> * Patch 8: Gives the full description about this feature as part of documentation
> 
> v12 is posted here,
> https://lore.kernel.org/linux-arm-kernel/20241129084714.3057080-1-lcherian@marvell.com/
> 
> Changelog from v12:
> * Fixed wrong buffer pointer passed to coresigh_insert_barrier_packet
> * tmc_read_prepare/unprepare_crashdata need to be called only once and
>    hence removed from read path and added to tmc_probe
> * tmc_read_prepare_crashdata renamed to tmc_prepare_crashdata and
>    avoid taking locks  as its moved to probe function.
> * Introduced read status flag, "reading" specific to reserved buffer to keep the
>    reserved buffer reading independent of the regular buffer.
> * open/release ops for reserved buffer has to take care only about the
>    set/unset the "reading" status flag as the reserved buffer is prepared
>    during the probe time itself.
> * Few other trivial changes
> 

Hi Linu,

I tested that decoding a crash dump of ETM1 (trace ID 17) from panic 
kernel works:

   $ ./ptm2human -i cstrace.bin

   ...
   There is no valid data in the stream of ID 16
   Decode trace stream of ID 17
   Syncing the trace stream...
   Decoding the trace stream...
   instruction addr at 0x140c9afc, ARM state, secure state,
   ...

I noticed that once in the panic kernel Coresight becomes unusable, and 
the Perf Coresight tests fail, with no obvious way to reset it other 
than a cold boot:

  $ perf record -e cs_etm//u -- true
  $ perf report -D | grep AUX
  ...
  AUX data lost 27 times out of 27!
  ...

I didn't debug it yet. I thought it might be something to do with the 
RESRV buffer mode, but it doesn't look like that should be the case from 
the code. Perhaps its the claim tags and coresight_is_claimed_any() 
lingering, so it's not really an issue that's introduced by this change?

Thanks
James

