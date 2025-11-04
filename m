Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC592C21D4
	for <linux-doc@vger.kernel.org>; Tue,  4 Nov 2025 11:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762256309; cv=none; b=SxFtYx0RK+7Kv5kfpK6n6pJopUKn7JogJx6jcIu/naHVUdxtV5UrsBHk/KTLbE3qh7jGOLyyU71AUDV2fPXf2xhtwZ1wyGVSQE8hSpJGiW3/kxc7bl1wvmMteMaHy0Q52hfcuRqchMBk5kNG6etH6OslYXAO1GJjA14DhsHYOTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762256309; c=relaxed/simple;
	bh=hcmVkgGfZct0hY4NeXH0SYoiz18CRfDbFXFrEJ5cVuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tGFmb+CaWxqXYfUCxqcrM3aHJQPd0/s3wV7i895TL69tw1b87EZ8ZyKDagFRRR2A2SgTrQeoy1h8t6ysCSCY4+rOcSSrgHxBejGy5fFTJ/jZCgJ43kxZKEduxUykpgvCNr+4hnf4UVBiVFt8ZjI7RtfjQS6FsaisleU5/67eQM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFroZgod; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFroZgod"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-88025eb208bso46378256d6.2
        for <linux-doc@vger.kernel.org>; Tue, 04 Nov 2025 03:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762256306; x=1762861106; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ty8EjZTIjoYFxQNfFxbRC87ROx45/mTNFipe8IcdbeE=;
        b=QFroZgod4D+9ziUZCoMnTggxTgRI4ChGX+nfrPa2++4cSENOO5vGBEq1rLejaZ6Yr7
         reeM973uBezYe6TyINBfumEGyR/qkZfW5X1HlqFRDN/t/tO0D/Js2AzZvpiOoNqY+KCE
         RSyBqfS2e8YICizd+JRB90ALDZfS9G4I2a7rOB1mh0om4c+xPx2qTWY8huey76tMYx4t
         fUCd9ZiV89loJbm7CZ9e+uxx8m7SELDhH9nLER4OTGR95XTRUb507GmxseVRSE/yomfH
         F8z7EXP5TlwSCkw8D2eYvL5YcdhDpo51qCeSiqLpBGbBufKS5zfW3dIJWoKHQv9AbbbL
         0gaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762256306; x=1762861106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ty8EjZTIjoYFxQNfFxbRC87ROx45/mTNFipe8IcdbeE=;
        b=RzhdE6qD04YtTtl8G7lMoKL9YTxP1Rk56JSumaHFgaj4UDkSgoocM0rSvTiPlJQZJ0
         sRzSngno/uYMuZ0X0WPJ9qvlhCbk0i2D/rRmh/TMtQibf1Wtn4bejipk8CEsM+wSy9tI
         ynP1wG1bbS/e6jeNvS6OdzBPKIUndP3YUsfMCA9NgkbdOzaDuS53k7wgfukroyl3KzgQ
         7GKw0gq3IZvGI6YeYe5T9tLQpXz626lyizF3VBqsuyUFBP2Z39RyyRctemIOhBMtGJFv
         pJ5hIA6sqq7Gvj2cuwF3PlDxviHQ4U2VwbE6/G1+91ey4oGXY3sLkDmFfIXQH5QprDrP
         gdfA==
X-Forwarded-Encrypted: i=1; AJvYcCUhgiasu9JsoG2ICnx+Qcm6FutMcqcA9L19KrQvkbq29F1l38zmbJOXzHT9Q63X7j2rxNnfkzjnY7s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6pbwVROKUBAbWZfFoIFrlbSlB4y9SRI/N0apke62atnzSJpYw
	egKXn6FDL72AIe16JLRhJh+a4eGrCuJQ9O/bZO1ytsIFfcdDHKM6EbaF
X-Gm-Gg: ASbGnctL8MOxogbitJV/IfWHnmiEXU3df/gDUZwEH+a4bW4WBI/ScHdGeEW25eWh1Jl
	XYpYq73izNDY9X/wN9OnAV5Eaw4kSCktpG7nb3/tvsaC+9dadngutpJgU8S/ZozmzYxFtuDweJI
	P9CdXYvExIVxQpNbGyj1MJ2Awopp0BGTsIc97N9ycYzyVzgcoH0bJiAVccvIwAYe4Sb2txlLCPB
	XXhDQBiohCvLzxComaKnDydSSuOLHSVJpv58/7Uh4zFUwIdYzKWKpszbYM99Ip3bE4bjU06ojNG
	au3uTo9VTPmVXxLWy30Lbx+dcNwyiCC6KboyjJK3Z0srvh314ka9GNr0UbzZ4g55NFHrjuqxJpc
	3WXdJMNkxGEAa4i7xDdUT5zdipjiz3++xqc7fiFV+kIf7282n9VkOWgTj0wG/qu+x5orBAZADzs
	IyFJvRSKyOXdnLm4XvNHuyC9qbinIpuJ90GU3hhjGF03fNNl1+nYf9kpk=
X-Google-Smtp-Source: AGHT+IHUdWJka00diDOSm3gEz5fAX+m1eynGGsYAsxJbIC9pNdUYm3UTMBl+lsslEkQP9lwiDDKGSg==
X-Received: by 2002:ad4:5d4d:0:b0:880:54eb:f65f with SMTP id 6a1803df08f44-88054ebf940mr96218996d6.53.1762256306128;
        Tue, 04 Nov 2025 03:38:26 -0800 (PST)
Received: from ?IPV6:2600:4040:93b8:5f00:52dd:c164:4581:b7eb? ([2600:4040:93b8:5f00:52dd:c164:4581:b7eb])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88060e9566dsm19023796d6.47.2025.11.04.03.38.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 03:38:25 -0800 (PST)
Message-ID: <db5c46b4-cc66-48bb-aafb-40d83dd3620c@gmail.com>
Date: Tue, 4 Nov 2025 06:38:23 -0500
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
Content-Language: en-US
From: Daniel Zahka <daniel.zahka@gmail.com>
In-Reply-To: <mhm4hkz52gmqok56iuiukdcz2kaowvppbqrfi3zxuq67p3otit@5fhpgu2axab2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/4/25 5:14 AM, Jiri Pirko wrote:
> I did some research. 0/DEVICE_DEFAULT should not be ever reported back
> from FW. It's purpose is for user to reset to default FW configuration.
> What's the usecase for that? I think you could just avoid
> 0/DEVICE_DEFAULT entirely, for both get and set.

I find that 0/DEVICE_DEFAULT is reported back on my device. I have 
observed this same behavior when using the mstconfig tool for setting 
the parameter too.
