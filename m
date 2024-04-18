Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A434E4EB23
	for <linux-doc@vger.kernel.org>; Thu, 18 Apr 2024 06:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713422777; cv=none; b=uH3R0r9YoT7kCCv7lxpD2QTtxUtYVmcVaxbKADSvsSaHrBupP2qZtLVkvW2iYolBBoi0JU+/u5eVQ+t5DVAcnkLjPK2d5ajlfkKjFu4CsBRjFXvvp+UUzal1KVJIvlTr1xV8Jexro2XalEhYElT0j8VHc6Hnxl2hoIzFpEkEmLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713422777; c=relaxed/simple;
	bh=2iicvfBJ14haF0z4MlgN0sCfropwn459k86+iV+26Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=akjFcVn5LvuCw+2rKqOtAcjlPSeweoazwa80iUR7IPs9bS7s2Gh+0qq3bTXRRUSNHkr6QZAXvbGLwC5M65/96IBTKx9SZtZfkiqWAtv5yCnvZz8DM+/W4/MdwCiLrWNRpFP9Cp95eQTUjCCkg/6oJ3aw30Nm9yTTxTyTysaSrNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gTD5MRAQ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gTD5MRAQ"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6ed627829e6so655587b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Apr 2024 23:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713422774; x=1714027574; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X3PCJ8oWEN4XTlqP9Mrd76yonyPYEOnddtJpcolQuiQ=;
        b=gTD5MRAQtL27f38e/H0wvtqO7Gu590JtiQ96Yuc7nBmWf9Xl9l7f/topjiDQwaOFhW
         GIDrD5shZkpfERwyASspOHcgrTrFTijhA26qKatTvyeEvHu7dr5xAUzFPN5Lu7yvvC7K
         y/dB8NBN2SCRGmZgSfQGTFbjqR/4+OnH4z7+VMHacoAGXkMjbDzzb7OgJxYsfQsY/bNC
         xPugv8LdMc/0IG6qGLOKWqjuKaRAwNJmV6s0bUobgWz2nJ/muCycMEEJ0bgZE78vMmPa
         Av9QjqJuF+YHe0q93eB/4wOK3RjiZbhITZR/gtswTWrdppmjOSeIU1KseJMUKNzRMoZZ
         QQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713422774; x=1714027574;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X3PCJ8oWEN4XTlqP9Mrd76yonyPYEOnddtJpcolQuiQ=;
        b=P2KMtekfPOwQvztTroxBBoAMGMo1lLjiWeGgsfoWSksJ0csKo5sXu74uwSQKWCx7jY
         uZ5AlnTHoxlnPhcVgezuXwHUZHtewJpz/LuF8kZwzf++y6ig+3hVtNOI4fVJhrR+qFjb
         lE0zx8Ky/pLazZC3H5MsQYmolpBF2c/FmM6nKHttN5pU5Sds98quMTdwpvyXFGtL3um2
         fYoLgkvG6jRtPmbEOpEtKwZpYnJ1UO0tfFYdsojmowsmcgZXJCH9UuhYeMTWZQ8Xjv7O
         F7UdlGfvHlw9BhnvIuKriz99F5O9pwkQ0z9w117J2pjEfNMnnb7QfskTAd5ERjW+zPIe
         rY+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0+p5aMbyaSV6adJetLnDQzbDdvHLJA8F4LF9kPuOHmSDQzpUG29MQesV7oRxoH0x+v96RWBMyyWy3rgMOq8uXSgZmxxJaFfpX
X-Gm-Message-State: AOJu0YxaGUh8oh9mPIDJTz7og0YLVIwDyudga3kEkm9ltEWGS0HryZRb
	mRZYJcnxxVDZ12Q/3a6134RjPjPLEYW/0lc2RrbjxNtrM7ih9mnqoJ5pZJZOkg==
X-Google-Smtp-Source: AGHT+IErIqcWnCwFDCXU2XNuAS5mw68F14w7Ox0Xh6/c+FP9VMngm+XN6I+b5z3vrGagpyTKzVAaOg==
X-Received: by 2002:a05:6a20:6a0d:b0:1a3:6fbb:e31f with SMTP id p13-20020a056a206a0d00b001a36fbbe31fmr2824885pzk.4.1713422773881;
        Wed, 17 Apr 2024 23:46:13 -0700 (PDT)
Received: from thinkpad ([120.56.197.253])
        by smtp.gmail.com with ESMTPSA id f33-20020a056a000b2100b006ecee611c05sm752862pfu.182.2024.04.17.23.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 23:46:13 -0700 (PDT)
Date: Thu, 18 Apr 2024 12:16:09 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-pci@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] Documentation: PCI: pci-endpoint: Fix EPF ops list
Message-ID: <20240418064609.GF2861@thinkpad>
References: <20240412095031.256163-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240412095031.256163-1-alexander.stein@ew.tq-group.com>

On Fri, Apr 12, 2024 at 11:50:31AM +0200, Alexander Stein wrote:
> With commit 5779dd0a7dbd7 ("PCI: endpoint: Use notification chain
> mechanism to notify EPC events to EPF") the linkup callback has been
> removed and replaced by EPC event notifications.
> 
> With commit 256ae475201b1 ("PCI: endpoint: Add pci_epf_ops to expose
> function-specific attrs") a new (optional) add_cfs callback was added.
> Update documentation accordingly.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

With the change mentioned by Niklas.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Changes in v2:
> * Separated paragraphs by blank line
> 
>  Documentation/PCI/endpoint/pci-endpoint.rst | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/Documentation/PCI/endpoint/pci-endpoint.rst b/Documentation/PCI/endpoint/pci-endpoint.rst
> index 4f5622a65555..3961ff4e5beb 100644
> --- a/Documentation/PCI/endpoint/pci-endpoint.rst
> +++ b/Documentation/PCI/endpoint/pci-endpoint.rst
> @@ -172,8 +172,7 @@ by the PCI endpoint function driver.
>  	 * bind: ops to perform when a EPC device has been bound to EPF device
>  	 * unbind: ops to perform when a binding has been lost between a EPC
>  	   device and EPF device
> -	 * linkup: ops to perform when the EPC device has established a
> -	   connection with a host system
> +	 * add_cfs: optional ops to create function specific config attributes
>  
>    The PCI Function driver can then register the PCI EPF driver by using
>    pci_epf_register_driver().
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
