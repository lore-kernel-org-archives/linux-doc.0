Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416942737E0
	for <linux-doc@vger.kernel.org>; Thu,  2 Oct 2025 20:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759438350; cv=none; b=UM+lW2JIbqYgNMTyApcrnX8NCYyF4xvpje9gTfMi3vieSagBGZnd7GWYHkWD5oVZxUnlyxMNc60TCop30EXi2eEONZ9xdn0NtlokyxnX8uSszc8M7wbSr6hF3bWWb41kzb+J38TdpI+GSryzWTczmsc/ODPX+GmtKTCzgoyl/wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759438350; c=relaxed/simple;
	bh=DvKZeJuc8q1pMCcveAAdBLsuoO3iYHiqN7Yxh8CK/bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eMB4i9EDJK/leHkmDP/4X/j3k2JrilEm8HlO9mn4zeXTvM74xgNnyuJy5P8GUfazq6VFyh+DmGv1BnuXX9GzAbSytJ1b4q/Awb/4u0lKuzV1XQo4XXV06V6spHrabqFMnAeQeUc2iK6pDspMK5hGDU0PzvNETq2uliE2HNabkGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjnxI9Fs; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjnxI9Fs"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-33067909400so1123960a91.2
        for <linux-doc@vger.kernel.org>; Thu, 02 Oct 2025 13:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759438347; x=1760043147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wt8+KJKLTvjnTsuEvXC7oAoHF1RulS1QZOqpF4RenyQ=;
        b=VjnxI9FsS0LtdoezIfJ650dPiD8s7Qdm80G57wvuC7AZs0vPjHFRa69WFn+P0AWUcT
         HT0Wfq44xLZD3jUpHHr3kREbXlx09js7vVtFUgil0tPOcxv0JFYT4tgXC2O4jjPMoLf+
         VeKO+Htwevi6g/ZNPNrEwfh/YiLOKzGYaXSKqJRx5Hhd1lcbDbyWzElr6JiC+biTOIrw
         6bVn/8terpx3pJFrCNKPNdIJgV1edcmgbnFFrgJyKo+vYUaXEa6c7dk886HXuNX3ev6t
         +lw9dxTFiC48EWxg4QgpIOijgVNFzfxTmb7AZbjiGRX4ttXiNod1PI/M0PJWCDLpR3W1
         fxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759438347; x=1760043147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wt8+KJKLTvjnTsuEvXC7oAoHF1RulS1QZOqpF4RenyQ=;
        b=U7kHRjXOlyH2LmqqMbAzpRiz2Gb+FZAw3Mx6fvo+FdtfJsT7KsYBY6n/bihnvglrxy
         SPtVsBC4CMeV/164SV9zbIGdg/+tBxddZvTNfQVM+kK2KCO2LVQj5/relYiyMm1dulEi
         7YXj08dpNdvcwbPaxaeetJJTn7ABa/OtNDRiL9bPk2ZnGdDIXRKVZepEUTc/ECHzfkOn
         iEyOkIMadPAQ+gtIxqf6TmMamZw5USH5LdRRD+m1Ue0v5stqKKw9w/ARYdBdQZ5oevhJ
         JP8Ix/WuxmPMwaOzgNmlnszJ7iMO/CQvH7YThzzG2teuQLBJ4zLMRiUstQnGSqfz6fm5
         pLyA==
X-Forwarded-Encrypted: i=1; AJvYcCWFQe9VaHNOfRgpvTpi3TE1TYm2L0B1Wvp9pBX2GFNmG74tHPfzmife3QOc22XNshJy6/m7yMfqmck=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdF5TWyt5FvQqhXsadJjEo4I3egTb1YH7bZTqKn34Kics+14kr
	RnVZ/0t1viNFC4L1tgcL2gJrcmLkKIpvbHurs29Vzsm4LBjF7RnSmsd6
X-Gm-Gg: ASbGnct/8r3Kxwds8wickSym49mlE3ht9qEffUXaBk7wghiAkKFDAKVq8Uz/K6V+vgT
	2MGUe6w4EhI2ES2XGgiwndsFH4ONOyXN+5As0yeCqg9zmz4qlH6qNfk8J87EIW5qAwLH9nbfsDO
	jaWTayO+8qnwtuIFvQLNHDQUWzqouIsYITQOLnBMmkgGFV2heYsZfUW4NM1RlgqRW/QFt7l9Sxz
	R3JYBtk/3Rj7JPQsIRAg8BJVjvqGGZ9WLTzJF5wOtE/mTlHOarvt5C8ov292vKTgdTzo863go3e
	ZnDekwQa/WSGua0CEizLrHD/o9T7escZLg8SZiD6RN8R2DzW9ZSyj4EkDKbsp5YUyRd+Rn51pzk
	ESo+L4bU1rVSzZhNI8v3AyCc4fN9WtpXrAdL+wN1ftHIJuHekdhIs5/G5ob8DmsqhwOxIIA==
X-Google-Smtp-Source: AGHT+IGUkkG0M/4u6akYKC5LQ5MwjiuQ21TfsswJrB9jKVK8JMKVo01HtMK12v0tDjHeG8d4+1MNuQ==
X-Received: by 2002:a17:90b:4d0e:b0:334:e020:2f16 with SMTP id 98e67ed59e1d1-339c2720714mr717648a91.11.1759438347329;
        Thu, 02 Oct 2025 13:52:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701bf31sm5792124a91.19.2025.10.02.13.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 13:52:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 2 Oct 2025 13:52:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jdelvare@suse.com, corbet@lwn.net, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add MPS mp2925 and mp2929
Message-ID: <7c751da9-e480-4c20-85e8-5ceaaefa1027@roeck-us.net>
References: <20250928092655.1394429-1-wenswang@yeah.net>
 <20250928092845.1394718-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928092845.1394718-1-wenswang@yeah.net>

On Sun, Sep 28, 2025 at 05:28:44PM +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add support for MPS mp2925 and mp2929 controller.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>

Applied to hwmon-next.

Thanks,
Guenter
