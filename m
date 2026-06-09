Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8933E51C8
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 08:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995580; cv=none; b=Hm1ULOZDgsUpMLaTw9CTkqlTEjNsgTiIo/0x76cNPVAOxYZO83KoZTCDEJcJIRawET650RWku0DI/RLVG9uamYfmPJK8uYY+paHr0fzm2XMcjagirc96HBS8RDv/5hXktb+2mgy/I72Ch7FrITqnDqyMNTJ07DMsRAfbLHvbIwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995580; c=relaxed/simple;
	bh=f5S+i3RVl0cUqmWNDjtmc/b/yyrLqBrgrSpRPlEOqsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=il4y+kt3rKDDienrYHPxDx5LYm0locvfw7uElJra8q2r49p0xxWgfBs7By8ueIEdXjQ5Sx0TXa+zkMOl/lZft00Y7/1+u0ygYhqwohXsKfvRTPtqIbQMGQ/zx8EcgqcYrTNZ6slFRDslSl7nUfhe0X/m1jeQBjzSFMQhG23M7Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b17Eq3bP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cq0BaCuP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b17Eq3bP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cq0BaCuP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780995578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CPgszwVt4cFE4ELVefG0ZpctOAG18a7ufhv6a2Zqquk=;
	b=b17Eq3bPGnJWwW25ozowFsB7H2X136jhynn/Fc+q2kW3GWbAzH9CtulJQlQtO/JG0SnOoT
	rwUWx5b1FH2yQesgmM4taN8/nMACk2vfNwzRMayrJcxP+f7mM+7TIuHCAeWgZ/RpFTCmFc
	7G2UVyjwBgFxArnBCKZb3K4tTzgbToU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-7EtjDhZ9Nh-Uh18tt3SL5Q-1; Tue, 09 Jun 2026 04:59:36 -0400
X-MC-Unique: 7EtjDhZ9Nh-Uh18tt3SL5Q-1
X-Mimecast-MFC-AGG-ID: 7EtjDhZ9Nh-Uh18tt3SL5Q_1780995576
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-490bde3d239so40484935e9.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 01:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780995575; x=1781600375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CPgszwVt4cFE4ELVefG0ZpctOAG18a7ufhv6a2Zqquk=;
        b=Cq0BaCuPiTvsTF+xmUMsCxNR55fBWyi+rCep3/zJp3Gv30I+Lpr9d8rPdPJ94gMmU0
         AgBekT0UE0aHxZCQ8IR5hruzvwQ8KwRHgO05XM7dsYn/rnuPGydDgWr5wTqMYUb3Sbzw
         kmyR4E6WZ3fYkpWwWoGV5wjLkfI01oTmWQLuIg5BMkIMQLsTEcgitMtVK+3rq18gthxG
         XrRsrQ2AV1fp4AqTKM7MsuVsTJELRcSTYoR1WwLyoVH+bhD3c00vsi2SYuwasg+6WmM3
         vpVzdPxUqLd+H0Zf0Yqp/gqJ/dqsdTeH2CQoGdTOoEss2rnQcf5ooaOiXfaA/Oo3eM4G
         wrcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995575; x=1781600375;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPgszwVt4cFE4ELVefG0ZpctOAG18a7ufhv6a2Zqquk=;
        b=CFanpJc6mCam8tSKJR1iWWvNHvwPSHB5YcNF+0qpZtIJRxSwwErtzf96qRyLmxdfSj
         7rwsP7VkjgGCiwtA2c4NW2tK1LZsi1NkAW9QofSEYy8O5Pgg4i3lVFvvi8+9JSlOEk9j
         cbGn0jO7vmCf3ultuGUrIUJFdzYmAExTBNJ8CfrBqnCvHXx8RlrHukyWupPvpT2r0AVZ
         k9VtCDdKsx8RTJ1uOQo7lwTs7AP817umGG26jGgsZVHi0QruK1QTxX8x2bQtktpiWDUn
         Tw9h0odGjLisXFn7HpAPHheYpexDqxdI4h9c1r8JPwGlHyhHj6DV+KRztjfAIiFrFsDS
         QCVA==
X-Forwarded-Encrypted: i=1; AFNElJ/V4AfuUPc6QiBDMRmGSMunG3qcZDpwdzUzlMinoxHOT0oDNvWRGIvc/kdziB0+OwZccvY9YnxLz4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzegPVzIyZnX359Ob+E6lEnm4BVfZAcKIg8AXjcIG5odnatRn9C
	3ZPsT9MsrGhQM4XwFW4yLbWuOVo/LCtv7GGedc/AcSopYVk5mud+vBExd3r2sQmKJ+SoedUhE6D
	TOw7+n1mfXGJt/i0AiSX5o7TPT50bhhLpNQsV9XJtkitfMTOqyYiLbGGyZjmn5w==
X-Gm-Gg: Acq92OFo3dLkGsCt0oGLd/bqlwF4j+Qxd6IUz/Yoj1c7bSVO6gePH2qi8cZ0zqSOrbo
	kQolCO656BttUiZv7Btd3TxbJIxCVdSajK7BIhfgYebPAZfJB6aY83fDumZ6rCLK5mOe4F8anUW
	PJjMNE7eK7hGh/fzEuDclExVn8S1rOJb1wvLAJbHKxn9Cd5wqdLt7fNPcCmuoyNF6hs4AIAzlca
	X3yYA++rge/Sewr47wQQbdpjqS23I9VyDs8RYT2/8pR6o1a+YnmZqysOSNJTEoqnV+plzBOtv2a
	kXIyv1V6+hiH++/h/zCNgGoH3efGbsQ+U5bEKIIJgZRdWTJAYYGhmMAy+xwnsqyYf5ZnIx9ZMpw
	kvoZeXLYWD5Tpe9u3iYcl216XgBfLITZW6cIMVfwIA/NWlAO+r3s6BTehr3Bex97T2Q==
X-Received: by 2002:a05:600c:4ec7:b0:490:b8ee:d6a5 with SMTP id 5b1f17b1804b1-490c2589927mr315117355e9.6.1780995575645;
        Tue, 09 Jun 2026 01:59:35 -0700 (PDT)
X-Received: by 2002:a05:600c:4ec7:b0:490:b8ee:d6a5 with SMTP id 5b1f17b1804b1-490c2589927mr315116965e9.6.1780995575267;
        Tue, 09 Jun 2026 01:59:35 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d6c65sm455288105e9.12.2026.06.09.01.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:59:34 -0700 (PDT)
Message-ID: <4e2fb478-1d37-47b7-9bb9-3553d5ca2fee@redhat.com>
Date: Tue, 9 Jun 2026 10:59:32 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] dt-bindings: net: dsa: Convert lan9303.txt to yaml
 format
To: Frank.Li@oss.nxp.com, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Frank Li <Frank.Li@nxp.com>,
 "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20260603210929.3099363-1-Frank.Li@oss.nxp.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260603210929.3099363-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/3/26 11:09 PM, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Convert lan9303.txt to yaml format to fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx53-kp-hsc.dtb: /soc/bus@50000000/i2c@53fec000/switch@a: failed to match any schema with compatible: ['smsc,lan9303-i2c']
> 
> Additional changes:
>   - rename switch-phy to switch in example.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Does not apply to net-next cleanly anymore. Please rebase and resend.
While at it, please additionally add the target tree in the subj prefix.

Thanks,

Paolo

