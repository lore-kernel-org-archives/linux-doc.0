Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169EA328B6D
	for <linux-doc@vger.kernel.org>; Tue,  4 Nov 2025 14:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762267207; cv=none; b=ZBrR9LLW7ExkA7lj68Gle13Kvqs3cjvVadBvUwNxUl8sEt8ycmGyr9Qmp8Hbayvb4HdkNHVwH2GFyBjjR4O0+GTHXn4ufydnuPzz+PZC0KMwHWPANR2Uekt5onfOHsRPmv6/3pzCDcW8T6ectLE/LPaK385FUDP9s2l1D3ASotg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762267207; c=relaxed/simple;
	bh=ZsrPvleOI3xxeiQePS3/NpD1qyrQbrxTc8ZEeW2EnYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gU7X6d60hWECN2/88auc/eDEtgVR0w/F3v6vjJ7HThH48h7mGJKK4VYIYYtSAuINCknhK4myFAPcn88UECrKMA+Int0TwjEhAMpikL1RQjhabpAZWmPAbrDcGi7hV81cMgqOm3SVprqw2Uii1wNLRm6MzZaKZdQi+f/T1SsQT4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=2MnCpc1K; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="2MnCpc1K"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47754e9cc7fso6372685e9.2
        for <linux-doc@vger.kernel.org>; Tue, 04 Nov 2025 06:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1762267203; x=1762872003; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rEkFVWT5NBv3AWUofiDX8hOm3L/6oD6jZrSiQV9+dPY=;
        b=2MnCpc1KYsJrOEdIyvwTisGdFiQuVqXmpc1WZErYJNmqxwTnfqYA54Ttfybi1d0PvI
         yAukgegu/2jJDatfU1C0raa16Mf0YercoXFgtgYZ5d9oDYQdrsFDQAn60kaOic39W8Ea
         N6CAKwemTNPaAUUN7gSOZGitxre0qm3hjPVA6i+n0TIM4jAMJWZ+rdPJJ2QzepzxJCeF
         k3l4DBiDB47poDRUHlSgMfe2gTTPv258dFM2+NPMXK9+ciCmIS8+gdrzwkenie1wIbSC
         0fno23PnaWTBZZ9555pWUVQKPtiUCdQaLhThO2mWEFHoASnHonksnbu6CMykeO4CKIX4
         oi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762267203; x=1762872003;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rEkFVWT5NBv3AWUofiDX8hOm3L/6oD6jZrSiQV9+dPY=;
        b=BCB5DycJ3pnmrM5yhuDAPniR7bj0x0gKTH1jx8+Q8bNoD/FxDBItRM1VB5Gxgz17sp
         +0JSKR7hciiLcYAqKM1KgnzbZSFAiv/aO7VcmmTNnvCNq8fQ29g3i3lhHGTdt+xUWKel
         pCIfbjlwzpDupHunMxyplc6h+LDZM41+z/jjsxpE9oI73zCR5AZsMF82C7tuqfH3bw0U
         YisfNAYQkXkjvg92I3vIAp04emYhkE2ckrO0l1wkwVKT3cDVTRc2yVkOUpewVvNhcvHs
         ftRfPSkQjUJrHSKuxa3BsbfEro/YU2Z8R6li/B04ulgQ0LMeXky97VwL+0IRCX04t+5I
         QS2A==
X-Forwarded-Encrypted: i=1; AJvYcCXDxlFfou1fatLFbxXe8dZ2g2jiUpKygE+spYkqEJ/F6/5sZ25KiCdZxwxwHZYnRIUBlxSRVl9l2nI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxld3cu1/LHUA1RvlyT9pNQVujDhhhg3Bq6bKpw7H3x5xPy3XNi
	+OBBwB3/v0CsTyfcwRDFKl0rgNlyelBlX2wZHnSdd+eKu+Ltx+r0n0uISPVQJB2cYP8=
X-Gm-Gg: ASbGncutFPVLncE8UHbG04+lzB3GpQ444yO0j+TLxMtiL3w6SDQNa5B4QRkoe5iEu0G
	xJkfky10keG1bGdisE8LIC47CbCpg1WXBlbNWDwfAUgogpyuCnu36lejuPKk6JAxfuIVRBMQPZP
	0qvG4CQTOxOcB0E6bchxOVtyqvXQ4htG7OZbYbA0kYGNQuGSHOQ8xqNM3ZQZFbq7BfQ9U5OwPDX
	Eyl7GvWbGq/GZzLNz2dh3Mn2e29GxExWk7s6s1s0rsb4AEuihLz+RHbf7k2Z31Dc5p4TgNlCmKx
	IJLbPGPnLYWqANcM6OOaOcpfg6n1Y9Tp37Aglwixzzbb7BWlp5IXniyTDwFdbq1CNQvteLm1KxV
	l3sQZWs2vG83yPQ0q38aZHjUwcKUd+iPXY5y76BdeGQCbP38w9l8Bmf1Mf6Fyxbu3d2+lfTZyal
	oiKpth5mTq
X-Google-Smtp-Source: AGHT+IH+wSpO7CA7uoT1EyqMsmESkKjEBIh7MZyEYgnZ6s42MxUO4LQk7aoyZId0Y8Jc8HF2ped2Fw==
X-Received: by 2002:a05:600c:1f8f:b0:477:58:7cfe with SMTP id 5b1f17b1804b1-477307e4885mr128649795e9.18.1762267202870;
        Tue, 04 Nov 2025 06:40:02 -0800 (PST)
Received: from jiri-mlt ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47755932134sm18947015e9.14.2025.11.04.06.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 06:40:01 -0800 (PST)
Date: Tue, 4 Nov 2025 15:39:54 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Srujana Challa <schalla@marvell.com>, 
	Bharat Bhushan <bbhushan2@marvell.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Brett Creeley <brett.creeley@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Michael Chan <michael.chan@broadcom.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Sunil Goutham <sgoutham@marvell.com>, Linu Cherian <lcherian@marvell.com>, 
	Geetha sowjanya <gakula@marvell.com>, Jerin Jacob <jerinj@marvell.com>, 
	hariprasad <hkelam@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>, 
	Tariq Toukan <tariqt@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, Ido Schimmel <idosch@nvidia.com>, 
	Petr Machata <petrm@nvidia.com>, Manish Chopra <manishc@marvell.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, Sergey Ryazanov <ryazanov.s.a@gmail.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Vladimir Oltean <olteanv@gmail.com>, 
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>, Aleksandr Loktionov <aleksandr.loktionov@intel.com>, 
	Dave Ertman <david.m.ertman@intel.com>, Vlad Dumitrescu <vdumitrescu@nvidia.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] net/mlx5: implement swp_l4_csum_mode via
 devlink params
Message-ID: <p3pj3mu4mabgninwowqikegeotxgzhc4yptf7qrfhns37bnkoz@ugkbgvlkxqxb>
References: <20251103194554.3203178-1-daniel.zahka@gmail.com>
 <20251103194554.3203178-3-daniel.zahka@gmail.com>
 <mhm4hkz52gmqok56iuiukdcz2kaowvppbqrfi3zxuq67p3otit@5fhpgu2axab2>
 <db5c46b4-cc66-48bb-aafb-40d83dd3620c@gmail.com>
 <6aa2f011-3ba5-4614-950d-d8f0ec62222b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6aa2f011-3ba5-4614-950d-d8f0ec62222b@gmail.com>

Tue, Nov 04, 2025 at 01:51:16PM +0100, daniel.zahka@gmail.com wrote:
>
>
>On 11/4/25 6:38 AM, Daniel Zahka wrote:
>> 
>> 
>> On 11/4/25 5:14 AM, Jiri Pirko wrote:
>> > I did some research. 0/DEVICE_DEFAULT should not be ever reported back
>> > from FW. It's purpose is for user to reset to default FW configuration.
>> > What's the usecase for that? I think you could just avoid
>> > 0/DEVICE_DEFAULT entirely, for both get and set.
>> 
>> I find that 0/DEVICE_DEFAULT is reported back on my device. I have
>> observed this same behavior when using the mstconfig tool for setting the
>> parameter too.
>
>e.g.
>$ dmesg | grep -i mlx | grep -i firmware
>[   10.165767] mlx5_core 0000:01:00.0: firmware version: 28.46.1006
>
>$ ./mstconfig -d 01:00.0 -b ./mlxconfig_host.db query SWP_L4_CHECKSUM_MODE
>
>Device #1:
>----------
>
>Device type:        ConnectX7
>Name:               CX71143DMC-CDAE_FB_Ax
>Description:        ConnectX-7 Ethernet adapter card; 100 GbE OCP3.0;
>Single-port QSFP; Multi Host; 2 Host; PCIe 4.0 x16; Crypto and Secure Boot
>Device:             01:00.0
>
>Configurations:                                          Next Boot
>        SWP_L4_CHECKSUM_MODE DEVICE_DEFAULT(0)

This is next-boot value. You should query current (--enable_verbosity)
to show in param get.
