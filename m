Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69AD313E32
	for <linux-doc@vger.kernel.org>; Sun,  8 Mar 2026 17:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772991101; cv=none; b=C4L1BBw2luCK+ahzWUwQA5yiNvAk3ntMwkaI8EMfqaSptLOb8EciMy5sVCJr+7PHJusRzwdzqprAJrwXgYtmYofnIiJ2ECGlJOAGGMxS17Qgc7IMEMd2zepzs15xMGNIBfyL/kyVet6xwmLEjbo6wUmrmuLEKKudZl5J8D+uI+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772991101; c=relaxed/simple;
	bh=BAd7md9tw6EfRKEG5QtWON+EHxe1egsLBG33S3XVfdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UGV5eInT3a/Ep0V2llV1pKdtjBJ+yip0OxkNrfyPrnQtYiID6j6dxAYkCV7NBpOgrb0IBO5z0xre/ZFnXUfglNXzXjW14hkv7G7tFZQD5W+I6XZ+wVAVUNiCC92PmFg6NhxXTXGCtzakyrFbGJu6J2xtz9VicRFUz7/uCVDQQMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3P3wEUr; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3P3wEUr"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so9224309eec.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Mar 2026 10:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772991099; x=1773595899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wtq9/lhU2REDT28M9py6Cq5xxsx16xGsyDZF6Ur883M=;
        b=j3P3wEUrKT2eqO/PrLai6VeftX3dJG+bVwnCoB4JYCtlbhhoC5oiQuyhrqimsFg0rv
         WI16mZPjusZPyE/11UAloeNKNNgysKjDv9EV5uVjj17zq2xbX25zB0ZamFCPb0EXbDAv
         pgNlCF+h/NUmA6C81lz2VFCHt/6O6V2GkHb10rCZx5r4zvXIQI9QsPxG7r2GAE/dZTUT
         ANlyQGwescbxWJR0f/IuiLnmSWn0X8+K5HrQkLFSvr1hHNMTjGOkntIVz4xdr2Q0NAcc
         z0S1MuLgptkuQlwIVF6RgM3idLGHALJb5a70MB9aMy4u0JTvljH5U+GlbMQMYWkkdIhc
         /PHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772991099; x=1773595899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wtq9/lhU2REDT28M9py6Cq5xxsx16xGsyDZF6Ur883M=;
        b=erPInNc0koFolW26d7mygJ8cSwVT3t+KrIM87fY9uGpLJZISZX+tPfRe/LzNAGC4T6
         vf/Iqv9Ml4OVA33+ucVp6+ZefzHLmansjjZDviLv7BZCzaVwcyKfZnSpAcGkGI8bI4Ty
         2CPDPpgVHwvjE4+gdt2MRK2x0PX5HChVdKE29ZesTC7RBdqva+UhiiC5AVd71pQaVAtZ
         W6629STDd7G5/VD+uLI069wOCofY8tWOLRcBch+sOYSIl/8soo98MWvjoAPLAiJa6+E/
         ffxiOiIUm0VHo78R459IkLITawLTdJF6CZcfHuUFthNshuHRf+J9DddKfhtpF9EuCTl0
         cwCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV19W6bQNpHrmHpRq6cIN6am/HJspPn17c4VlXfKeqyq9i3EYEYVlMLwCKWxDKL3yj6vvy+SFkXBrg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6a/ixxH/2qINjSwi0hFv4Ag+ivRtoguiKnccW1M5vNQNWB3uv
	UcU3ZO/TKHcUN2CwntHy5XJkbtSXmdpl7/F4QEoe1uGgq1m5a/anVJmS
X-Gm-Gg: ATEYQzxbLzrlg9LKbHoSi86Rez3PIK4LvGHgGjXiAVkx/vYRNsp+vCMCWADNSpSYYeu
	Au0AZBuW1k5iImDtVeg7rmh+apoooT6JYq6k1CbDYEjq0i8quYhcUQfn/IE64X+eOheDcS3l6jA
	ejtky2u2GZLJmG6mthbQp2GRk6LfnNJ1DAKf2EqqAnLyyF5hxsYjpqHCKm08RUTIeNpfgu4sl8I
	S8+nlmTO1XYWcQ3RJqvI0YLe0RpdDEUq87bnmGUVtqJqoLLUkrTNvH8hOs3ji0dHMGsscXm5ctl
	KHLln6rXoxrZ1Y9ELxwzefgkrckOVg37cR5Pr/9e/IG/O1tBfh0Ewlu6bTY3D/ty1HC2yH40nHc
	5KYZDDF5bJH/hk+qLVoTfzM6c/6qfqzc78/FNQH6owFU9FJ/+Xel4qZW8HJAhTbvKzf8g12jcJw
	9PZFlsYWXKgKLFG1Gyf5MXCgPnc1pQ8sb0v8cA
X-Received: by 2002:a05:693c:8086:b0:2be:6709:3d97 with SMTP id 5a478bee46e88-2be67094029mr502015eec.17.1772991098821;
        Sun, 08 Mar 2026 10:31:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f80d6dcsm6838747eec.2.2026.03.08.10.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 10:31:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 8 Mar 2026 10:31:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Stoyan Bogdanov <sbogdanov@baylibre.com>
Cc: jbrunet@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: hwmon: pmbus/tps1689: Add TPS1689
Message-ID: <326f3dad-b2d4-44fb-a4b1-d09fb0dc5024@roeck-us.net>
References: <20260217081203.1792025-1-sbogdanov@baylibre.com>
 <20260217081203.1792025-3-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217081203.1792025-3-sbogdanov@baylibre.com>

On Tue, Feb 17, 2026 at 10:12:02AM +0200, Stoyan Bogdanov wrote:
> Add device compatible support for TPS1689
> 

The title and description of this patch are really misleading
since they don't mention that support is added to ti,tps25990.yaml.

Also, the "title" field in the .yaml file still refers to "Texas
Instruments TPS25990 Stackable eFuse" which isn't really accurate
anymore.

Guenter

> Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml          | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
> index f4115870e450..973ee00c2c49 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
> @@ -16,7 +16,9 @@ description:
>  
>  properties:
>    compatible:
> -    const: ti,tps25990
> +    enum:
> +      - ti,tps1689
> +      - ti,tps25990
>  
>    reg:
>      maxItems: 1
