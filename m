Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18750257854
	for <linux-doc@vger.kernel.org>; Tue,  4 Nov 2025 14:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762267706; cv=none; b=pGX3UjJrNseK/Kv4dKiEwktxsu2OgN7jxKrMQHm3w/aYKCoWHBup3ZD6tft/ZppeWdNyLdltc663FHKuPPS0xhyg9C/vKfEWLrRC0M7F40oAjODoceCMcUvKuEVYwPCmcCb4PzekOkH87Ku0E/nJoeUyJA1g1Sqr5u9iyG0xl34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762267706; c=relaxed/simple;
	bh=JMLaYY6hZzPARYlgwS336pFX+gMN7vDHCCMc++BjmpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c8bqr9XKfIQywwDtSkLmfxmJpvXHPB0fvGv960DeCnKQM9jUfS1bteMrxcwnNKYPwhl7Yl1qJxy49nJ+HxlU+8Ga/Wy3XFEMtWbQcUz2TwpfwzhaGzy03CA4SHNE9rh/sWrUa3wuMOsjOdho+cU1p9Cp+Y9yEbxQ6+lu32kYi+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpK9nyZm; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpK9nyZm"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-891208f6185so520792885a.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Nov 2025 06:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762267704; x=1762872504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TYbk9wPxk/JA4+MxrrdLZ/GfKAsrpCoWC70+eUl4rp4=;
        b=lpK9nyZmhhKVs4MaUwGdwSTH3jpjY2avo4MDRIQ5wFbIO5Lp6laDw2X1rj5LQe5QjX
         5+0H0RAvSiwas1GTdRFBdguxoK1vTrKbzQ568DJ4NHWmgPF8uNoG2GCBOzQDD6N86uHE
         k5f52xGDpxZ0N6i2WVXnCR8BP5E5dB/V/IrTkcOsjeEfGAIBvYA243u+4OrTCqa8nP8/
         toWL2tFpt4wLEgr5wwVVT5kuIPp16zavB0wD7+OLpk2t7UVal3Q00kJgm33k/HeCzmkW
         gJ6yReeDlpcXjJ3A7UIQ3IFOcgpEYckbC0fCC/e77NJcxwwrtR5ONlGW5oc69M+D4iqQ
         9lCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762267704; x=1762872504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TYbk9wPxk/JA4+MxrrdLZ/GfKAsrpCoWC70+eUl4rp4=;
        b=k99QaW2QMLRnJ3/qEc+43k2itKtfMkNFzWxOSRnZScSxF/Ysan+z86VEjglVq0JfXk
         6wFs+idAL15iN6fr82wsF+GiYEfuhJFNfIhEBmFKWjVnV5PCZJfc21YBxcJ3KzRcOGCa
         uA+8X4M+4G+ZBULKz8zVCSixOS4I5mJuQY1wTrwrzBYA1cpHmFJGiIq55QF1WteIIOap
         UnOgTcIUV1DF/GAWsBZmV58+aBY84sjMHvY2avWVCfj+seJ/ELTtn1ZwMR/gOe4zPD8y
         HVTbjtR2vlXWgjFYrDmu9w0M1AzTlWYtGod++7deHQD88LUVR+VNo8thH3xdOFZLFjTK
         D1hw==
X-Forwarded-Encrypted: i=1; AJvYcCWVZw3qUTG561xdtlNA8SmQHBos+l7245w5ujF3yAtSUyT0xhYbHT1zkf5Fk2ML8nvhF1uA36n5jB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH/z6o/410YVBkkRcXDVPic2HoNHYLZjLHVyQvQcXipUGe8VfL
	IXr9et6TYleO303HdPGB/bCuvhz1X8kuELxxaztw5Iw+lqC/o0PPUrs/
X-Gm-Gg: ASbGncvPpC2l/Jg8PiCOkgiVff9ypIfVaN8Mdi7GDsTvLd++6+wXwre61vTO006ZtAk
	uiICocV9zYSs5SIxVB6bJ30pNN2yE5fx3khIDIgKxTuCMEqwYQ070dHSjBqSir/hErISaVPosFC
	T1C9XWlbhX/ofuQcnM/i7mu4rMhaC1NLqdhi7jCzvo1EugLdN6YJjKBXpX5JhnzGNS4SImp1r1q
	SqVBzhh76ThgqcNWFJo24MpssXLtfjf/BuoIFbcRMa+58p1k5xsUP9WiwVBpEw2TWmj0GQMCQNC
	EORRgeNJZuRy4b3r6q6ss2e6slHrAnccF1rfw0nuyRCrYGVSXDOrPgvXsLkBhxh/iYtHw/sABWc
	2H14dMrffqWp2UvC/Y9hff7SUsxQIrPVmNQD8cWOLox/lyaT8A9st/vB0ZfuRje+zBwH/VfFEbu
	yG+9sxQv/lCyAiMARiUBwPO+cBkJTJk9adcNRgWoB1QDtTFT2g2Wxk4/Hw2/JwaHeD3Q==
X-Google-Smtp-Source: AGHT+IGmraHbZP2E2iRwXxMxNgGXM9zhZedCgpJV66vhLBH8PzAO8Dn4btILshzP2e0cEKgwNzEvBA==
X-Received: by 2002:a05:620a:1a27:b0:886:173f:1b4c with SMTP id af79cd13be357-8ab9ba6fd3emr1982205785a.80.1762267703489;
        Tue, 04 Nov 2025 06:48:23 -0800 (PST)
Received: from ?IPV6:2600:4040:93b8:5f00:52dd:c164:4581:b7eb? ([2600:4040:93b8:5f00:52dd:c164:4581:b7eb])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b0f543d90csm198693785a.17.2025.11.04.06.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 06:48:23 -0800 (PST)
Message-ID: <78db1fab-e482-4ebc-82ce-ba84b3f561e2@gmail.com>
Date: Tue, 4 Nov 2025 09:48:21 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/2] net/mlx5: implement swp_l4_csum_mode via
 devlink params
To: Jiri Pirko <jiri@resnulli.us>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Srujana Challa <schalla@marvell.com>,
 Bharat Bhushan <bbhushan2@marvell.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Brett Creeley <brett.creeley@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Michael Chan <michael.chan@broadcom.com>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Sunil Goutham <sgoutham@marvell.com>, Linu Cherian <lcherian@marvell.com>,
 Geetha sowjanya <gakula@marvell.com>, Jerin Jacob <jerinj@marvell.com>,
 hariprasad <hkelam@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>,
 Tariq Toukan <tariqt@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>,
 Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>,
 Manish Chopra <manishc@marvell.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Vladimir Oltean <olteanv@gmail.com>,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Dave Ertman <david.m.ertman@intel.com>,
 Vlad Dumitrescu <vdumitrescu@nvidia.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-rdma@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
References: <20251103194554.3203178-1-daniel.zahka@gmail.com>
 <20251103194554.3203178-3-daniel.zahka@gmail.com>
 <mhm4hkz52gmqok56iuiukdcz2kaowvppbqrfi3zxuq67p3otit@5fhpgu2axab2>
 <db5c46b4-cc66-48bb-aafb-40d83dd3620c@gmail.com>
 <6aa2f011-3ba5-4614-950d-d8f0ec62222b@gmail.com>
 <p3pj3mu4mabgninwowqikegeotxgzhc4yptf7qrfhns37bnkoz@ugkbgvlkxqxb>
Content-Language: en-US
From: Daniel Zahka <daniel.zahka@gmail.com>
In-Reply-To: <p3pj3mu4mabgninwowqikegeotxgzhc4yptf7qrfhns37bnkoz@ugkbgvlkxqxb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/4/25 9:39 AM, Jiri Pirko wrote:
> Tue, Nov 04, 2025 at 01:51:16PM +0100, daniel.zahka@gmail.com wrote:
>>
>> On 11/4/25 6:38 AM, Daniel Zahka wrote:
>>>
>>> On 11/4/25 5:14 AM, Jiri Pirko wrote:
>>>> I did some research. 0/DEVICE_DEFAULT should not be ever reported back
>>>> from FW. It's purpose is for user to reset to default FW configuration.
>>>> What's the usecase for that? I think you could just avoid
>>>> 0/DEVICE_DEFAULT entirely, for both get and set.
>>> I find that 0/DEVICE_DEFAULT is reported back on my device. I have
>>> observed this same behavior when using the mstconfig tool for setting the
>>> parameter too.
>> e.g.
>> $ dmesg | grep -i mlx | grep -i firmware
>> [   10.165767] mlx5_core 0000:01:00.0: firmware version: 28.46.1006
>>
>> $ ./mstconfig -d 01:00.0 -b ./mlxconfig_host.db query SWP_L4_CHECKSUM_MODE
>>
>> Device #1:
>> ----------
>>
>> Device type:        ConnectX7
>> Name:               CX71143DMC-CDAE_FB_Ax
>> Description:        ConnectX-7 Ethernet adapter card; 100 GbE OCP3.0;
>> Single-port QSFP; Multi Host; 2 Host; PCIe 4.0 x16; Crypto and Secure Boot
>> Device:             01:00.0
>>
>> Configurations:                                          Next Boot
>>          SWP_L4_CHECKSUM_MODE DEVICE_DEFAULT(0)
> This is next-boot value. You should query current (--enable_verbosity)
> to show in param get.

I am still seeing that DEVICE_DEFAULT(0) is read back:

$ ./mstconfig --enable_verbosity -d 01:00.0 -b ./mlxconfig_host.db query 
SWP_L4_CHECKSUM_MODE

Device #1:
----------

Device type:        ConnectX7
Name:               CX71143DMC-CDAE_FB_Ax
Description:        ConnectX-7 Ethernet adapter card; 100 GbE OCP3.0; 
Single-port QSFP; Multi Host; 2 Host; PCIe 4.0 x16; Crypto and Secure Boot
Device:             01:00.0

Configurations:                  Default             Current       Next Boot
         SWP_L4_CHECKSUM_MODE DEVICE_DEFAULT(0) DEVICE_DEFAULT(0)    
DEVICE_DEFAULT(0)

