Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD7831283D
	for <linux-doc@vger.kernel.org>; Thu, 23 Oct 2025 14:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761230059; cv=none; b=m+GoryIzVfkHme3K1rkh1kd6H+cQmdxr2JZHJ/hFlFHJLRQf77G88iqXbCu5pYubO9iJ7Zmkfmgd+e8pGdVvw/DDAjY29HLIghaX6ePDBwoReYZ26fDIfkNawfoi8i0Ws934fXhmnktVSAIEYTY7HVs5Xs3Jhm33voXbOWLPX+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761230059; c=relaxed/simple;
	bh=/QeC+4KBQYT3wohYuPFOfqIAJyHO1wZV9UiHSECbF+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rgi68rbwUDeOl0Z0IWNNYGfltPT2cMYjRSqiPnhrqfySqgKMBWrDl2cuzBE1Wj84FChwYuqdsetvz1ii3TgvUIK/CsrRp8wfbbgcWBYdBui5HFRTnGkNnQuaKYv/tbhkcJCpHN0Vha9x/OkVuEaemGWm8uuN0w3zNvPCEtNoHBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lxf/SOFG; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lxf/SOFG"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-88e525f912fso96261485a.1
        for <linux-doc@vger.kernel.org>; Thu, 23 Oct 2025 07:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761230057; x=1761834857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ty8jqgEMWrkU/Nsac/whYt2eOAER5E6EFOQ1MIoYtJs=;
        b=Lxf/SOFGFAM7eVPDXAQhd1Enwft6Uq3rhsdzAfPR5okP8jkVsZfuBXe/cr2XbnZwI2
         0OIjUp+cHoHPceboKQtp3MgNMDgRa70y4km1HSv/HWELXd/yVrxVE7IxJMmc7zhhUmav
         FI7QjjX5odF40uyiNDRAmwSgAc3QQAt5A8io/k/X/UcfCGqtjH1xTu3W3JDeMoxsrhlV
         btWTclQZOrY64E6aC2jPzN8GE9QAsZdmcc3X0762pr1n3ohbAizhYbEcG2D6e+jX2YZ8
         a6yhxUJTzF/Wfsdr1DWU6HHf3VpVeXqQMnsOOqnILq1cL7o4eIF/WDhbAm49NCuQ7DiH
         6jUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761230057; x=1761834857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ty8jqgEMWrkU/Nsac/whYt2eOAER5E6EFOQ1MIoYtJs=;
        b=vB1QKsA7MJI4SklPchTFXnXfgSFlobcgQ3WamLOYlasYRDTxzKK5OzZ2HCDM8aj8qi
         gz0guHiRlvJU0a77dkEDbcSfX0kl/MPpk0ikSu8n/QblmArT1HF1vdPPG/F1Dim7aRcy
         ZucE4qT8OhFmgMQw1NB9DiZGprFZ5GC/L3gdldH0AI/RzA9h7LXUg232xy2YFu4B5Lm8
         TIRn5exvyu7hSMwbeXjsvaLqFMl738VidGlKvOOTPsw80/ZvyJIQfEGeo2Ri2F5amRmU
         bBoX9qF92OjoTeXRLgDbhkPdXWy/R0J05pI0KffbtjficaZxXCme/jK2y4QQyktFdghz
         2qUA==
X-Forwarded-Encrypted: i=1; AJvYcCUN9QgdAm9h2ZEUpbzZ5Q0dw2MiuJklLjarP3d+VsEzyS1J+NkBnpnmlM+00ZHcCIQRKxpuFU1PF0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOqIKddoDAHqF2add3EXK+qzrfd14sNMF8hXCOr7yXMULZXk0R
	c5k9f1ZGIFpZGT9BdhbUxHX+jYvxOy3MEaUIorPvhNRbnPnYG27V8FTg
X-Gm-Gg: ASbGncspMZL6hwJy7By1AqrHKSPaZZn6dcPy1UtfuCDXdHRVibTDKiLawIu1w33rrcH
	2yQth4fDrGTsgdov2dahfriQUqPZ2Z56h1D65kpXTwmLoQZgrjNfhlXZUvID2qFAEwLKEwoaWME
	pgm9ADeyrd1ogP2Gx9WXgcp0xWMzS6dL9+knfiw2a07/nXGUFcvqJH/pFIlcmBUy9gflGh/hg0M
	uwENqW5N+nghHtlhUK6uy5MAY1L6Y10mGWEAcp9UZENNHkf66YOGWKGrZqQMLvv6Fe5aoeduA9w
	LXytb2QlusutN6RUPMiJF8OQ0PQbZpvVaVB2humsrPBLxsm/evwaQHHTXUWW4L2m1nY71f9akZm
	4s54ZlHy+iq/xOuHsJUwRiybZ2OHpDwJOOCu95deCnzih5rGEQlbFSm1Q/EUyJnNFVUbRuYl7CV
	ddiyOALXs+zM1RjNMNIFLFdzVs00qMQrFSmWmPKpNj1Q==
X-Google-Smtp-Source: AGHT+IFk6zsFnw4L+tiI4iBc7mZ7I1pnhPccFZ233koLT7AqMhpvx2+P+Rp5WpaB7Fl/vtbeBra1Bg==
X-Received: by 2002:a05:620a:4512:b0:892:5412:b742 with SMTP id af79cd13be357-89c11e630d8mr327291585a.55.1761230056821;
        Thu, 23 Oct 2025 07:34:16 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1145:4:6893:5f51:a77:210a? ([2620:10d:c091:500::5:8f1b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89c11698b74sm171117185a.30.2025.10.23.07.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 07:34:16 -0700 (PDT)
Message-ID: <ae217501-b1e0-4f85-a965-a99d1c44a55b@gmail.com>
Date: Thu, 23 Oct 2025 10:34:15 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net/mlx5: Implement swp_l4_csum_mode via devlink
 params
To: Jiri Pirko <jiri@resnulli.us>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
 Tariq Toukan <tariqt@nvidia.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Leon Romanovsky <leon@kernel.org>,
 Mark Bloch <mbloch@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Vlad Dumitrescu <vdumitrescu@nvidia.com>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org
References: <20251022190932.1073898-1-daniel.zahka@gmail.com>
 <uqbng3vzz2ybmrrhdcocsfjtfxitck2rs76hcrsk7aiddjssp2@haqcnmzrljws>
Content-Language: en-US
From: Daniel Zahka <daniel.zahka@gmail.com>
In-Reply-To: <uqbng3vzz2ybmrrhdcocsfjtfxitck2rs76hcrsk7aiddjssp2@haqcnmzrljws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/23/25 8:18 AM, Jiri Pirko wrote:
> Wed, Oct 22, 2025 at 09:09:31PM +0200, daniel.zahka@gmail.com wrote:
>> swp_l4_csum_mode controls how L4 transmit checksums are computed when
>> using Software Parser (SWP) hints for header locations.
>>
>> Supported values:
>>   1. device_default: use device default setting.
> Is this different between devices/fw_versions?

That is what I presume. I believe the current setting for 
swp_l4_csum_mode is ultimately encoded in the capabilities advertised to 
the driver during initialization. For example, I am mostly interested in 
mlx5e_psp_init(), which depends on:

     if (!MLX5_CAP_ETH(mdev, swp_csum_l4_partial)) {
         mlx5_core_dbg(mdev, "SWP L4 partial checksum not supported\n");
         return 0;
     }

My guess is that "device_default" means that this bit would depend on 
the device/fw_version.
