Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E9F363C4F
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 15:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762874397; cv=none; b=KjyriMrtOhBjFUTdrlShKab6KGAW0Z1LmMbDjldhRzT25vde+IQkP2pCff+cEoj6mVyDKW+cyRlW8sTmmsNMcS0yqRAOcwrU+td6SJobru3od8Jwx51BHruZprRg24nPmri3l4Tmh6DZTyYUkSRehEZLBWjtw+ThVIZgE9za2NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762874397; c=relaxed/simple;
	bh=94GtY5KZjXmZPjl12JvyfDt0aWegthwLuMtBUxxbiGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cPv7Wc7hB5vZoncp8QVc1EZ97Jrftpy97tGN3domuW/uqQMtLFtarZXVau4vp7OTiRZs+bPQMyqxkC2NILmwptKt2DJZRoi1HDKhFc0OdpZBZMhks6CxGCC+twMqXWdi9h5I/rCAagYlfn0xtG3AJN+Yy0YVbjMgNp6J0Hu4TGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfPf0wyZ; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfPf0wyZ"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8804650ca32so42449196d6.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 07:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762874395; x=1763479195; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A5SVOaFDlCV2uNNJy3v3HZSAyck/afp0AOlD6vgrWKk=;
        b=gfPf0wyZuFA8eXSbBfB6sx8zsYhWsjzbtWIuwEJV9QsCbdj4lXEiwvy14oPL+BLR2i
         QoEiHfQzIwTYN7EOvavJICHoG90ewvQHqv2A5+mZTlcQVHT0Bwq8BeuHKaiiY2YIkfH6
         NoONLltZShp6fB6OmgBJrTPgxGV30KCdEVYtKj4fg7C1Zv3oIsahUCJUvUqDH36SPkiY
         +DyJtYml+nBfyd+3kh4/vrh3arhdTbJLi+O5KNgKBtcOphhOTksm0+o/xDNaRzuzMLrc
         229Jgt2BIDuxOfk5BW7pXpQtjKh/X3gF2Wz784UJx/Dsofz3nIyK2Xo20SAtmnA+VQ6B
         0vgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762874395; x=1763479195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5SVOaFDlCV2uNNJy3v3HZSAyck/afp0AOlD6vgrWKk=;
        b=LwSBroBkQ+7j8ipNuVuzZ/KOjB3UHag2bxIhYjm4UBBKekSOlyBIEFze1EnF/0Audm
         j4BnDrM1xVMIT2F8AdVFxzkmpV/aILTW1iPnOuFr9hoD0tMdsRgHCEgOQp9W+vK5cshp
         RpvHqqfWvWubRA9FQ/f2v17FDjynGXy/5uAMTrga9LVgXE9G0tckeqtKzdNpi6m41z1P
         Owyut+Lfa2NyKU4JkHEW0EyO1ZrOWeu6s3D7IambKxO5/3JWPN606lOIwnsddvKkFDvB
         dHiYqwwfKChq61hLIVn+vmlrGSp8XeyhHgO+lsBsqnimWOx/TI2dFeUUGtYNzHkc6YeH
         75Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXjkIoBZGKEwhMKKvpO+e2pxu8uqVEUUGrAHaSkqOeU8/DSkZhNiIVZjhOGKqH5U9HLauqcFWBkjhE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4FCqJkIZRq4VsURtOEdpVfu5GxUXHsRF1cLk+nZ37ocI6Sh7m
	ezXGfxtzcLvMA9d1Qn6LSSoaOB8Q070DlnKHslbu0qoFQ/YsXHKllpvE
X-Gm-Gg: ASbGncsNLZn+4mp6AULr7X8GAKKvpzo+D3JLJ0CUbRFmgHRQjWfD+VhF31DPrwVHrDH
	3efRM13/1gYoenRqVF0Rv9xf6GWit0bDnjzO3kaYF7rNtFLCD4+L4yMuDn1VoWzyzVAH6As1OTE
	3GqS8rH1zVi8LLObL5fRhpD6aU4dV47BOK7VS52H75rofb60vzy6VyEgttVOUaTIDpVOQibwhdn
	ekwuqOcewTzdYRxXGE8raeJ0wNT15/w5EDhamv6aqYJyTcLvetEaHsNsSp9YHm7KRFCybjQyoYX
	GIg4xuCd432H5VGa/ITG0tb/K8yoWvJU1o593wlyjg8pNUws6zY0Af482AeF4XC0osYcmtLESdM
	s8TWuN6hd5DUj3QZ4BugkMQIhEKvsW26moU3ivviic5OhNxZlrGXRrgnu50x4MlYR1cOtFDPrz8
	uW1nx7e533MHfzqGw0rcTkPAqR
X-Google-Smtp-Source: AGHT+IFAbbyQhephY+AI/cqoiVmNsBG/fPVAb6kdOEXVVnWOQfxDiV/20VWcE/IFvlGD21yeGrFzgA==
X-Received: by 2002:a05:6214:21c4:b0:880:5636:6241 with SMTP id 6a1803df08f44-88238769402mr175766236d6.65.1762874394765;
        Tue, 11 Nov 2025 07:19:54 -0800 (PST)
Received: from ?IPV6:2620:10d:c0a8:11d1::1065? ([2620:10d:c091:400::5:ddc])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88238b4c3c0sm72793516d6.33.2025.11.11.07.19.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 07:19:54 -0800 (PST)
Message-ID: <9fed6ab9-e748-4a78-b45b-5e6b3cc58006@gmail.com>
Date: Tue, 11 Nov 2025 10:19:51 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 2/2] net/mlx5: implement swp_l4_csum_mode via
 devlink params
To: Saeed Mahameed <saeed@kernel.org>, Jakub Kicinski <kuba@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Srujana Challa <schalla@marvell.com>, Bharat Bhushan
 <bbhushan2@marvell.com>, Herbert Xu <herbert@gondor.apana.org.au>,
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
References: <20251107204347.4060542-1-daniel.zahka@gmail.com>
 <20251107204347.4060542-3-daniel.zahka@gmail.com> <aQ7f1T1ZFUKRLQRh@x130>
 <jhmdihtp63rblcjiy2pibhnz2sikvbm6bhnkclq3l2ndxgbqbb@e3t23x2x2r46>
 <20251110154643.66d15800@kernel.org> <aRKs6jXqSvC3G_R0@x130>
Content-Language: en-US
From: Daniel Zahka <daniel.zahka@gmail.com>
In-Reply-To: <aRKs6jXqSvC3G_R0@x130>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/10/25 10:26 PM, Saeed Mahameed wrote:
> On 10 Nov 15:46, Jakub Kicinski wrote:
>> On Sun, 9 Nov 2025 11:46:37 +0100 Jiri Pirko wrote:
>>> >So, I checked a couple of flows internally, and it seems this allows
>>> >some flexibility in the FW to decide later on which mode to pick,
>>> >based on other parameters, which practically means
>>> >"user has no preference on this param". Driver can only find out
>>> >after boot, when it reads the runtime capabilities, but still
>>> >this is a bug, by the time the driver reads this (in devlink), the
>>> >default value should've already been determined by FW, so FW must
>>> >return the actual runtime value. Which can only be one of the 
>>> following
>>>
>>> I don't think it is correct to expose the "default" as a value.
>>>
>>> On read, user should see the configured value, either "full_csum" or
>>> "l4_only". Reporting "default" to the user does not make any sense.
>>> On write, user should pass either "full_csum" or "l4_only". Why we 
>>> would
>>> ever want to pass "default"?
>>
>> FWIW I agree that this feels a bit odd. Should the default be a flag
>> attr? On get flag being present means the value is the FW default (no
>> override present). On set passing the flag means user wants to reset
>> to FW default (remove override)?
>>
>>> Regardless this patch, since this is param to be reflected on fw reboot
>>> (permanent cmode), I think it would be nice to expose indication if
>>> param value passed to user currently affects the fw, or if it is going
>>> to be applied after fw reboot. Perhaps a simple bool attr would do?
>>
>> IIUC we're basically talking about user having no information that
>> the update is pending? Could this be done by the core? Core can do
>> a ->get prior to calling ->set and if the ->set succeeds and
>> cmode != runtime record that the update is pending?
>>
>
> Could work if on GET driver reads 'current' value from FW, then it should
> be simpler if GET != SET then 'pending', one problem though is if SET was
> done by external tool or value wasn't applied after reboot, then we loose
> that information, but do we care? I think we shouldn't.
>
>> That feels very separate from the series tho, there are 3 permanent
>> params in mlx5, already. Is there something that makes this one special?
>
> In mlx5 they all have the same behavior, devlink sets 'next' value, 
> devlink reads 'next' value. The only special thing about the new param
> is that it has a 'device_default' value and when you read that from 
> 'next' it will always show 'device_default' as the actual value is only
> known at run time ,e.g. 'next boot'.
>
> I think the only valid solution for permanent and drv_init params is to
> have 'next' and 'current' values reported by driver on read. Or maybe 
> go just with  'set' != 'get' then 'pending' as discussed above ?
>

The driver reporting 'current' and 'next' makes the most sense to me. 
'pending' would just be implied then. The 'set' != 'get' then 'pending' 
approach would not work on my multi host CX7 system, where rebooting the 
hosts individually does not trigger a fw reset.

To be clear, are we willing to go forward with treating swp_l4_csum_mode 
like other permanent params in nv_param.c in this series, and then defer 
the 'pending' solution to another series?

