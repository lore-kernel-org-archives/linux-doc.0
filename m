Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB152F60CC
	for <linux-doc@vger.kernel.org>; Sat, 19 Sep 2026 11:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789817752; cv=none; b=Vlrrj/ZsS511j1Lqeq51xYHMkjYlnDRZ9ylYSieh5ymq6Td9med80v9/xYbT4Yss4rmSoZm3XslNXEyr1el7Z7vdxEZP+91rstfYH4k3mD7TVZSeoerJbVzDNJiZVa1WoFOv8YyHok92A5hpTy6GOsp2GJSsIJsXpmksJIajZLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789817752; c=relaxed/simple;
	bh=db6RuuBhwMozGXCwqVkwUYnmsJM3LcJNboRTL/tXiaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XL/gZ+ndae1+9/jOEYx1CGNSLC6kgPR64FiuTWCozeZifU5q2eE4JABg03yxfzNwrBF0EWvCLfzhcsvbC9rxqwoF+Rvg9bqKtIpg4ZJpbHd6TJTVdwQuFWwfEFe6aUXhD7cClQwviUfGfAqzzLOtdiPtr0VvXXpdULwVNFKRNYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAmVntU2; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAmVntU2"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so1219953a12.0
        for <linux-doc@vger.kernel.org>; Sat, 19 Sep 2026 04:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789817751; x=1790422551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LB+tpTvHTK46vCvYu1SsitSoCwkJYe5UWMMUceYuMuY=;
        b=aAmVntU27V7Jpb6qixRHxQiRGEsiv+SodGwg1szoBCVFt6t/ecYo6AWH5xGNkRZ4Iy
         m6Gmy6G6EWn6HzihBt8Nw/liMpAkm4ldObabO0dzkNka/Qks6cVuBMQglWzt06E/ovKG
         /lEvq/Y0ZVwuEwjGsEu5ERW1XJozljGNccr4YF41/MLhZpCqNnFb3TpfI0BOe4r3z8X7
         6Jsjs0qniPXYmnetIqxiw6xsj/uKiHDsMy5ZkSvxFr5ahm7Jdp8NWHg1dzKBZjGZGwt1
         ftYbNLULYxxeQto3aho2mHCOq6Nw+D3N70ieZOxqImynTxitGkM5YDTxKcklJVUAo1A4
         QGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789817751; x=1790422551;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LB+tpTvHTK46vCvYu1SsitSoCwkJYe5UWMMUceYuMuY=;
        b=uFzjRQ0P1HuOtM9PEqpUGnw9lagEZkIn3Iat6rDpNOPjddOum0DwmkEyfNNdPetXOt
         cFnSmf9jVssmIv5HBe/esc7+pNvLXdLTKP2DpGZ4xgC2yVKuCOWcP18zi5LMN6+mKb+o
         GG0Ge7swu+2m8idXGH5MD713U+iR4rmYrStwPI75W3cPq0Q+to04UVGfChJ3XlmUs8+Y
         mz6XoMWY9L2ifEs+geadEgIvVD9wi49ALCHOdHFRj2X0RvPxDgiTc6mjI1mLJpu+D/TY
         WjMgSaPcJXHWeCRa4/+R9GMBnYD9FxaapXBiTODdrKRJ0W98QU0Unz3V8LpNKUABUeg/
         R5nA==
X-Forwarded-Encrypted: i=1; AKwUvBxTTd9xbRjm8IopbsW7bzJvqGdOpmLrdLJACh1Mq+aKIjfrr1tLuo1LbaEGr8sLVDdh1qzpRNP6Y8A=@vger.kernel.org
X-Gm-Message-State: AFuF++mZuoE4CXNS7HPsW03n2gUeSnONhS8d3R+t6GoAml+D7ZPpN7H4
	aXS7jNBdF8QIZTr9PtNxQogC18Yoplba7tCL4PVq1qdh03Ryl0OXWIFZ
X-Gm-Gg: AYBFou07+ILinc7XFqIvFWJmEP2KaOeesntTySUlrH7SZrhRa9SkBt6k16730iWVCSN
	uVty9gcXi2LXYJrW9yiuJKsy6heRW/Eb6NJrt9yOr/8OPO8NZyZd0hSJxf5MjFBKj2B2p+TKSXt
	O8Cuthk5X+GVNijRWdlHiqSPArrwnybKGsL4ooXi7IkdQ21JPoxMOnuPCId4ORiTtbrDpbNlu+X
	5E1abGkAetwZtIOZVClKhLo8VvAi4o7hlsrpBYm0/CeC/hdiA6IMgh17MVUvPN/2dJzbLGaER9E
	Ck79qHu8KnJW3k5DUuZWsIC5BZAdwvZjgiwMHCrie1/UMHm/VK3eXEYf/S5eajcEesujaOnwgWw
	FLxfLEI650Q/m3vaRvzsIhq9bxEQwQ0u2DpUb8KWXmxAsOMKucedR8yi9DcaIoUJ7jVxgZoxoEZ
	EnmNtIM044Twcr3+P3Hukhxz8yCNcPAVRtXmkT85bT/Hw4pIDt/zmrbWxm+n1f+cYqU/Cd3ZYaa
	o579KNxex86
X-Received: by 2002:a05:6a20:20c3:b0:3d8:1f68:59ac with SMTP id adf61e73a8af0-3dd8c529902mr9848155637.23.1789817750774;
        Sat, 19 Sep 2026 04:35:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c32f17d77sm6091435eec.3.2026.09.19.04.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 04:35:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 19 Sep 2026 04:35:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	colin.huang2@amd.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
Message-ID: <d815627d-b03e-4ea3-b8d3-52bc3448c798@roeck-us.net>
References: <20260918-add-tda38740-and-tda38725-v6-0-a8b11018d850@gmail.com>
 <20260918-add-tda38740-and-tda38725-v6-1-a8b11018d850@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-add-tda38740-and-tda38725-v6-1-a8b11018d850@gmail.com>

On Fri, Sep 18, 2026 at 06:23:54PM +0800, Colin Huang wrote:
> Add devicetree bindings for the Infineon TDA38740 and TDA38725
> single-voltage synchronous buck regulators with PMBus interface.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied..

Thanks,
Guenter
