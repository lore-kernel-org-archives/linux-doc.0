Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3FE224D4
	for <linux-doc@vger.kernel.org>; Mon, 13 Nov 2023 17:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gigaio-com.20230601.gappssmtp.com header.i=@gigaio-com.20230601.gappssmtp.com header.b="i900fow+"
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EEAC1A5
	for <linux-doc@vger.kernel.org>; Mon, 13 Nov 2023 09:23:37 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-543456dbd7bso11555274a12.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Nov 2023 09:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gigaio-com.20230601.gappssmtp.com; s=20230601; t=1699896216; x=1700501016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lVqsNrhllEHnB4x52KwFNyneQvBLGalc6x52PGAy2ek=;
        b=i900fow+ChmHw+WmGwwhKIIUhrtkUdfDOC7BW2gaiIH/r0es2x1IoyHeXpnEjYWBkA
         72jw8Wl80ZAe8T+nXn0QJvwpRULGhm2aDvXR4L5AxGZ72IauLtSARoIC9OlUMOz93oKY
         ZJHnukTi5eDyZvEAdt2E0ZY6fEg+SKNc/X6RVsClPl00z21SLVWm2DxQoEezN4M0v9OV
         G+gUIso2mHXP+HK+OFPEEN6QxjrtcscTh9UWOxvJOyd3NbN00pMGPaDD6TA4pjKl/+kY
         LPXC78eqePnj/cfDV6wR8BolOwBDZXt34fY95aM7qfvJwkU5vNzJ2Ccjux1Y/hkHF0OL
         qs4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699896216; x=1700501016;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lVqsNrhllEHnB4x52KwFNyneQvBLGalc6x52PGAy2ek=;
        b=sWxYpjGY/b5TtBisHWdtXmGCm7OZNmPX3IE6DOC0SdXCh0KONoXLxkJ/SoXCDHlFfL
         axZYeBBT+IEKSEgWSRWZAT7mP1GGzs5yc4SARXW/+GvTPm4LbbI/4uAEdV7atFvpzTwI
         W5eh6KYvq6qs6wudhBO42Ye4QcDEymTEYNXE2iB0/utnffw4+4OuQOl5QFoa/aogPFkU
         kd0O85diK+4Mj4U/aa8wV8uj7Ri5msJ7n3QLOSNz39DEvcKDO3ncUms2WmlBERFzoesc
         HxRkn+x2M/n6AjOy3OahrElq2x3eYjRtqmvj2jMJigZXyKcMdgx1/iphLktX/PnUGRXf
         I2DA==
X-Gm-Message-State: AOJu0Yy3WIeCtXTZsHCOyVQff8nlCSylYlie4Yq4mNvtAnvmUiI4flb9
	M21/GzciYV7oyrdHIz5vYHqiEg==
X-Google-Smtp-Source: AGHT+IElFkVJxCHDW/sZY3OLOGSEFp8GzqIT3ftzzh5itBe7jccohEBc3cMqFsei5POSjgUCDkdrZw==
X-Received: by 2002:a17:906:bf4b:b0:9e5:21d9:3bc8 with SMTP id ps11-20020a170906bf4b00b009e521d93bc8mr161279ejb.0.1699896215610;
        Mon, 13 Nov 2023 09:23:35 -0800 (PST)
Received: from [10.0.0.11] ([109.95.114.4])
        by smtp.gmail.com with ESMTPSA id un1-20020a170907cb8100b009a9fbeb15f5sm4250880ejc.46.2023.11.13.09.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 09:23:35 -0800 (PST)
Message-ID: <777d9449-0207-401b-a239-40110fab2977@gigaio.com>
Date: Mon, 13 Nov 2023 18:23:34 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: PCI/P2PDMA: Remove reference to
 pci_p2pdma_map_sg()
Content-Language: en-US
To: Logan Gunthorpe <logang@deltatee.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-pci@vger.kernel.org,
 linux-doc@vger.kernel.org, stable@kernel.org,
 Tadeusz Struk <tstruk@gmail.com>
References: <20231111092239.308767-1-tstruk@gmail.com>
 <8899b3e9-50bd-4356-9c94-d2d8a5256b0b@deltatee.com>
From: Tadeusz Struk <tstruk@gigaio.com>
In-Reply-To: <8899b3e9-50bd-4356-9c94-d2d8a5256b0b@deltatee.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *

On 11/13/23 17:44, Logan Gunthorpe wrote:
> Might make sense to rework this next paragraph as well seeing it
> references the P2P mapping functions that no longer exist.
> 
> Thanks for cleaning up the documentation I forgot about!

Ok, I will need to check exactly what was removed when.
Currently I'm working with v6.1, and all the other functions are
still there in this version.
The pci_p2pdma_[un]map_sg() functions are gone since v6.0.
If you want to take this one, I will follow up with updates that
apply to more recent versions.

--
Thanks,
Tadeusz
