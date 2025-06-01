Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793EE28C2CA
	for <linux-doc@vger.kernel.org>; Sun,  1 Jun 2025 23:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748820651; cv=none; b=PHAOS9hpdzXBdBfMsglAxTPHajMbaqvdI0nEahgMLYbELvIdDWhvsZ2gzRY8OQZoLtHtuGrXjniA0RwTcHHXSOqDYNDoZQLMXlUcJHDpZxWmnreFN9Amrlgp7acxQGxFRaxzhdtm1WOXJz8EcQU9FrBT3PC6Ygv5UoeHamVRmfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748820651; c=relaxed/simple;
	bh=SSGlRVBX7Ip3ay6aSI5KJLngtv0nEq6HZf42gbzA32M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZO5gbEtmPGXzaWjcF633qNK+Ipn1t3eONMlz3SDZCst3vNUkbh98KYxB53RQX9IuaMdCzSb1yfE90JKy+vbQKGO/sFbSjgEI48XtK/iTbGaLqr+n/Nxciwszat8twKaBZB84IhHWXu/1EVYekwmHqwj1TsNd80fXvICo7qMeUOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ALjex9gR; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ALjex9gR"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a44b3526e6so29767491cf.0
        for <linux-doc@vger.kernel.org>; Sun, 01 Jun 2025 16:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1748820647; x=1749425447; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3ahtq5iYBzerYLsn2L4RRjLdCR+uk5v7bMh9egaPjI=;
        b=ALjex9gRMTmQ50it4soOyvAbAxZmVhMqeTenLVUSlJgmgg2i436msWqW7NPxB+PcGz
         8E71fLpVjbn7fnG32k8Cd33Im37uQienEuVV5aZKfwwRJH/g2N4N0WSPUcHv/YJVB7Me
         vUCq1fJJRACnOIOO82ys7g6agTDGMGelgnXRZMkBRCPcyTJgNNyyNPL4QORouDo0bsWf
         LuiaONA3E5+LirJ8+frAHn94QnCaeSXPMS6UcWmmIxfgNPZMKmu1tTd1z2XgaaH2ZLfK
         s+wdNie7dcETYVAw3m7HcYLpI70eH6OKE/gT4ftKWRzPf9MJRXa9tWRLAiVM0w8zarNq
         p++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748820647; x=1749425447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3ahtq5iYBzerYLsn2L4RRjLdCR+uk5v7bMh9egaPjI=;
        b=fW5cH6X6HzS82WXzIEHV/g3C4xTE8SY/GYNttFygJqJDERpXP3tu/ldVGWj6daESRQ
         X0KSuKgtvmJZuOOQx4KG49xK/4kSkxouU/rSuQzTDAf0NoAp8v3TOHbjzKqysC71Gt4p
         sgjFl3m9LPyhLajgdpEkVvv4a7va8toKd7WjkvcuRl29j0QDUQlWNDZvHVVqs2lvuzxW
         lja6wl5t8501IVr/8iJLlJar/0AOXzeWPsVN4lAQerE8fKATNsn9QdaFROxKtdPaBBzF
         lIkkjt0BAaNuB3PbwePK7cof+orDrgtBaEXTnqlWvFQVwR5fMTUQZ8FXEUHftuGRV/lV
         PDkQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/sX8X3a4JcqQujSJWbIlndTpUrdPB2DajLcZ3tV3SwrgM/ZWBy3bbB4nKN3jYbPgBTYolU2sDGIs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfPlnLKjfg0Lw/QqHqKlsyVKISjUUl4+mzoldBOF7yCisb42r5
	tU9cKaD78QbkaOJsKiz2KCoMdgLJIGW9q5tCUD6QPRYt9WdcvMfTw7lYxIDRSvuYteQ=
X-Gm-Gg: ASbGncvfkxFdPUbiLX4+yHiZc2ziyRw+INmJEj4SR9lmhG8102jxFFBnFUyivvnXieE
	vSoPWzdPReul+QCcXbo0E7731K7a6X3escJ3Lnsl7UttU1TI5A5aySQplQHdtppowMmq+iBirar
	Ft3nhiXqli+hQzg8ky0DTkfDxYwIMyD/7KeFr7O6jNlBNGGxNED1HIlDpUdq+MW2h/H721odcFd
	kI0gL0ITN9D1sGObC7mkWyD7Kmfn9p2as3lNyqZrb4PfNG+dN93rev5E3mQa9pkwbwMVtGRKkJB
	dcHsd8XuPRBoQ0pn7g0Cr6ZvrKftz11HdbmiRKTtNMLcg3wuhY8CF0NuRPb7nOkhJwyGgmEsjcr
	dZIk6gQuGmwyQneRvEkcSNuWQqy8Shmg=
X-Google-Smtp-Source: AGHT+IHAt46IPZ2ZNZ13vLsgj7LdizYMg33TCIokRzOtUXTMz4rVh+t4qoD51lnIbRNNJhpIDOFVlg==
X-Received: by 2002:a05:620a:1a93:b0:7c5:49b7:237c with SMTP id af79cd13be357-7d0a1fb77c1mr1867411185a.27.1748820647265;
        Sun, 01 Jun 2025 16:30:47 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e00cebsm52506366d6.73.2025.06.01.16.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 16:30:46 -0700 (PDT)
Date: Sun, 1 Jun 2025 19:30:44 -0400
From: Gregory Price <gourry@gourry.net>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: dave@stgolabs.net, jonathan.cameron@huawei.com, dave.jiang@intel.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	ira.weiny@intel.com, dan.j.williams@intel.com, corbet@lwn.net,
	linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, darren.kenny@oracle.com
Subject: Re: [PATCH] Documentation: cxl: fix typos and improve clarity in
 memory-devices.rst
Message-ID: <aDzipGmldaeje43H@gourry-fedora-PF4VCD3F>
References: <20250531075209.3334261-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531075209.3334261-1-alok.a.tiwari@oracle.com>

On Sat, May 31, 2025 at 12:51:58AM -0700, Alok Tiwari wrote:
> This patch corrects several typographical issues and improves phrasing
> in memory-devices.rst:
> 
> - Fixes duplicate word ("1 one") and adjusts phrasing for clarity.
> - Adds missing hyphen in "on-device".
> - Corrects "a give memory device" to "a given memory device".
> - fix singular/plural "decoder resource" -> "decoder resources".
> - Clarifies "spans to Host Bridges" -> "spans two Host Bridges".
> 
> These changes improve readability and accuracy of the documentation.
> 
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---
>  Documentation/driver-api/cxl/memory-devices.rst | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/driver-api/cxl/memory-devices.rst b/Documentation/driver-api/cxl/memory-devices.rst
> index d732c42526df..e9e2952a967d 100644
> --- a/Documentation/driver-api/cxl/memory-devices.rst
> +++ b/Documentation/driver-api/cxl/memory-devices.rst
> @@ -29,8 +29,8 @@ Platform firmware enumerates a menu of interleave options at the "CXL root port"
>  (Linux term for the top of the CXL decode topology). From there, PCIe topology
>  dictates which endpoints can participate in which Host Bridge decode regimes.
>  Each PCIe Switch in the path between the root and an endpoint introduces a point
> -at which the interleave can be split. For example platform firmware may say at a
> -given range only decodes to 1 one Host Bridge, but that Host Bridge may in turn
> +at which the interleave can be split. For example, platform firmware may say at a
                                                                                ^^^^
If you wouldn't mind, can you also change:                           "at a"  - >  "a"

Otherwise

Reviewed-by: Gregory Price <gourry@gourry.net>
