Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185FD49504B
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 14:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787322083; cv=none; b=biOniaodk4S3UTCL2+l4tUZNgGuXZFp2wyixP+vQBF9JVTfGbEu+7D2OdJZnbCVM4XGG3Da/Tvvdc3Jll+kMBls8D7taSDfydPQazkbhQcpO39htsFeoXXaIb5/+XGk7fpo5MiNU/5p2hFwBqXS3ewW3/DZtD96oExCyq4q6uKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787322083; c=relaxed/simple;
	bh=95x6UgUlxaPm1d5NvFDzpq+9kEJ6eR0ufqiyyvmCgUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wc6RUMKOekxlvBXdu3/IDN2ln0OT/urvQDGw0ZoOflE0BPWhh1jd4r84jcGC+MUbi1uOPQLDq92vyUViC6DvtyqN7IQm59amOszVe0j1ihXmxDF0u5kZkQXCByDbqbyBlV3ZRm7t7mgrzU/a7zx+7iTsduGEuNzj4atN1RSJVuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwXwGv8V; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwXwGv8V"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cca0c5799eso9477985ad.0
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 07:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787322081; x=1787926881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SXdfnuXNDne6hnaasWxjsMSIZ0AuRi/ByGqammioC48=;
        b=QwXwGv8VaecsvkG9Bkk/Vgdl8mq+eoXEN6wIjEaf+F7d5E49nhmpxSJrSwmj2yIR6b
         D9jWXuNsNVN7YuJ3SFMm+MXcdnAgZWcJ8TKaH9zZC8Q9hV7XmJtPOvS5EZAoT236cyQQ
         sSpOW6mQrq/heFVS+beEwJnidir+8uBogtRijQchFhEFfVkFkGkVGy/wxbMzwWkNlMGL
         ODR9t04B9zUD0NydHTek4xeJyRxOUSuIVrVtr/6w+4Ux2y9CMYMqDuTXkP3CJlqUxnMq
         chG9hlEmicsxLcpLLFj0DxQj9vYjMVnBh9SPfzR9fyCuDp5haW60Bgg+glnBnhqX0kHH
         9IcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787322081; x=1787926881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SXdfnuXNDne6hnaasWxjsMSIZ0AuRi/ByGqammioC48=;
        b=oEBTNuk9dNXdxZuBc85/jW0tNNnUZH5LTs9vQNBdsku7OEWekfSVYfAMlgOUmqL6KO
         YKatIn2rv8h1hRzyp66Xg19ZvXHtZ3AQGxcWak/XhTX/xRTqraWqgSXg5gjtmElxyZ44
         V+9yH0idfD88E9MjXmNNqysH2UinM4B7GZzbmWIv+akrHC+f85E6tRVZLm4HPaHuadqO
         9N/Lr7specf9KUurd7wSKFKsM2WVvX2//7Rob4qq2dF6BNOxr8kpavK+G2NlOFMUaULM
         iZYkiNY+tQKsZC+yuapFzUDduDF8eYfJFdMHsDh/VTRA1N+bP3f+tNyEmO/oV68r4k4i
         UIwg==
X-Forwarded-Encrypted: i=1; AHgh+RomvFd9NdOB5oF4XHnRah96pa0qHr33EFhtIK2DN1vO0Lm/YbwCai+yEtlszxzOLb6USFVV7xh8S/A=@vger.kernel.org
X-Gm-Message-State: AFuF++mJ+TPoXWBkZbZcENSVGSkik+McVeWp26bIdYpU4jnYEOpwE2Op
	jqHlcXfFI3Q8IXfh3pPoBpqUfPiHyBaqO7KzmMtadOopBogGsT4/Su+e
X-Gm-Gg: AR+sD12MSULGr5QnjP8zCNwk9Upic2DBTP7rqxvl9DilrlfU55ECV0OCjTHWb4+XEs5
	9RwBnp0ZGqB5Zd7emMVs3/SXmvLvg4RQtqfHQJD+7m38KrzlJvBr+V0Xo6dYd8/PBk/YxcJVIaY
	N6JQ3qg5SjelpocP+SzxBbAdxDCvZXaEV5gNvMQzHHQnBV/WbAiT5SVVwG4P3k+dNby0BZjUXER
	vPEppfwpjwa4S8bd5aETxpMm2GOB2upEETN6uKDUT5ADUAz92kR63FYpKCwQTkZODbT4rYbS6pp
	PLpHrkkl5xMOBI3hGW/yvEu15JrBslkdSOaO8tBN6j8wY/+0M3ILfPSt753YtqzDhdVPH0Rx7dW
	/B7zRjM8a9jow5iv+QXPMoXg4+w9kTDuk9ryAp11piKy/jQradDAkzn5Ioi/hJZqiv67go0mKCS
	ZuoJf5ro4XnJhMWIZ0KoVLFYOUxJ8dws8=
X-Received: by 2002:a17:90b:5303:b0:38e:5ac1:9517 with SMTP id 98e67ed59e1d1-395c354cbffmr12802197a91.3.1787322081476;
        Fri, 21 Aug 2026 07:21:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10d475sm30707004eec.18.2026.08.21.07.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:21:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 21 Aug 2026 07:21:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alessandro Zini <alessandro.zini@siemens.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: trivial-devices: Add Sensirion STS4x
 series
Message-ID: <0319921d-dbcc-4150-8c59-de3cd4f299c8@roeck-us.net>
References: <20260821091924.18975-1-alessandro.zini@siemens.com>
 <20260821091924.18975-2-alessandro.zini@siemens.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821091924.18975-2-alessandro.zini@siemens.com>

On Fri, Aug 21, 2026 at 11:19:23AM +0200, Alessandro Zini wrote:
> Add "sensirion,sts40" as compatible for the Sensirion STS4x/STS4xA
> series of digital temperature sensors.
> 
> Link: https://sensirion.com/resource/datasheet/sts4x
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Alessandro Zini <alessandro.zini@siemens.com>

Applied.

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 435c4baab4365..48ded1b746723 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -423,6 +423,8 @@ properties:
>            - sensirion,sht21
>            - sensirion,sht25
>            - sensirion,sht4x
> +            # Sensirion temperature sensor with I2C interface
> +          - sensirion,sts40
>              # Sensortek 3 axis accelerometer
>            - sensortek,stk8312
>              # Sensortek 3 axis accelerometer
