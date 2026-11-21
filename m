Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795259103;
	b=0w2Z4wd7ckAuIwMNZBOGd+vE3+iuEqDJQPp35nvO+/BV9+tcJbWel5cZY/eK6zjlav5Q
	 pL/ltbneSBWcmKLICl1Bs0nJwEO09q3zfN4owkaTAmLCCKMIV9e88KWQXZdX8WiQ/kmjl
	 /a9hkbbNFIWZhYhxeY/e0wdRkODzZ+rC/P434c7KpirrV5DSyxsP8zh46ydEALtOsP4Ln
	 7YsXC7Nnxt1OGJPCyjUpuZLoGC4//TkouEMZxmjC+3E7c/cUyBfkk/8b8LjHgRGRm8vx7
	 ApUoP6CFy9lYxbhtYryGtE9ujpXBSA16ytjj12jBH7JmKHAP6JivmfCVUqkhZ3vqKtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795259103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gHLZINtQTEgJKCqXvcXR7R3Zej47yaR3yrL5TOtoLHI=;
	b=5Kt1FrFZnLIYkekTRgKY442UlZca+sJmdNVD5rj1k7y6kPYCyCxmK9ZaQ58HngjHwez9
	 qAM9SKPHsexbdt6kFJzBS93dQ13zg3pQXT823xk2PjEMagzxW3E/JltOe0zPu4/wc15Pe
	 XC6PycV4ASbZIg/lT0aG5JD6LoaNFYTZ5TIE0v43JIn+Mh088NGiF8WZTYgY+9+ZzSyOB
	 8pD+iQt6qnTwrbuLMmDpg8ii6mJUK/FUuBttnxd9fMiyMnp6a5Jlx86sq+xYoEypKPG0q
	 awPMHTjUOBlTCv3n7JpxInqL7dAkGyACpFiCDn2Hc8fC6FBQNZFuX2/3gi+uq+0ZM2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pqkUgkLE;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FC0606A32A
	for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 11:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32FC0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pqkUgkLE
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so2583441a12.1
        for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 03:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795259100; x=1795863900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHLZINtQTEgJKCqXvcXR7R3Zej47yaR3yrL5TOtoLHI=;
        b=pqkUgkLEopLnSWl9nAWmTex8sf7ATk5xbpc8NhTaeLhog5YW67uyWLRuBf2cHMLeoN
         tYmROP0F4L5xHorXRjSRLaJYCW72nkpmHnQEiW9Ik7JqTk41C7bKab5BdHAYAW/PfIjA
         R72Vrl4P5SVgoZYT2izQ7zOaNCAE5iC2b1uxCm3jZXWd8jzKtacBORpfVVaNHgBqK8Ci
         yG5k2bA3GhKDQgRuK7G17fvfLtmpHgGNIlfadbuj7G1zbTpnZjpBD5CQnfWq3nrU87mB
         9Gh6K+Zu9Usza7jQb62SEqj0Er0tBJd/MeOzwhaxop9dE/FprZUe0BCoUfFVkaroeghf
         kPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795259100; x=1795863900;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHLZINtQTEgJKCqXvcXR7R3Zej47yaR3yrL5TOtoLHI=;
        b=Ewu1qdI9aKgpCTSRdQurnXfynJUD/s1zZalCnZ2zBrVubSXnWAQzxbeph9UQ5Ua9wc
         Y0wld5x3dTKj6PfSdoQ5UlR2tFCH1a5Ohjt/XBVBS8ED9io2XW0F4ZfCUMu5bsX0PHRk
         JVaBmpplEPS0Ia0BIe+5BZHXJKC7pg+whyo/b/9ytCde8LUjTCEGHmuGmHvg0/LfmgWb
         vXaa3ioFuBsHhjjqePamrJLwVrVG5rRW4hWlUb9CgMrHb7Ne8qYSx/UU+QdRdZ3PFfe0
         vBtuDm8iwJYFHZ9K0xn11T1qS/vTU02DOZDbD35rcqnXczhZiflaH/lYlA4cy9fj3hDt
         bOkw==
X-Forwarded-Encrypted: i=1; AL+hErFaF7phrE2wiHZ58GmAvgZSq38gkcXrYXcaZkLFGnN2NHRy2dhgfPDhgmhliDGSYaT9VENkU7Ucxas=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rQnbVVWztiwlRyC0I2ucJ7N1F6ll23TxR5X0im9oLKQQIvHf2
	vyi55aKOkziOQu6j8ht78POgZdRwsYOGyZsAsfxUzs69RB9XqW2CYgaQ
X-Gm-Gg: AZFdTZcBeOulpU6bhtK/ClvY5W08bS70fQ+tA3QfstHIVYBc+xoh5lASVjwwmHelYx9
	zm3jK1MlXvG3RyTyr5rx7v5VnAcTiEfsCLHXMs2XBMRtJqKhCzEITyYGUBJuMUyv8IbWhXL+z74
	7rKQB+mMz9sgie9iwt+oZ0PoC5BxJNt1AhVzez6BgJfuBztftKle1QtDPDv6IWAHu18ySw4A5bw
	qmCVNBu3IhzILNA25bZV9bi2Sj8x//NIrR5v2R4MpmRS8MD8VPo7oHVZUwEaQGUcMaPgeCJYWjy
	/qC/g85f9UttK35+X+pFqa5QQPcJX+7UkSKQigoLLV2DMWmHnTLYUeqnS2/UY4H9arLzGxn0NXo
	xuK4tV1P0yRgUddx1gc9pRz6yOylV0OgohPpWVPoZGRPDVstFTMCgiGT8hbr2gwo67GdqzYoHmL
	vAZv2FOhZlXpeZtrE41RUaFERzJS2gBBPSsyNRBokeYiNlO42SWi5o8IFdTrp2uEHacgWDW8Glb
	U+GdAQZ8PXMvhqg7yWoKhbOrpcHE0sBNLpvvAXr+5OGMCaGzrCo28Vyli8KXyrx5ykxx93pkZFS
	vmfRYDUxCuiW1RWVMwkYzwNqU0CZ2amUqKFG2P5FCce0E5qgjOCeBVKeq50HkPTNCngtGUdla+5
	vUR8=
X-Received: by 2002:a17:907:3cc7:b0:c2e:2d8c:4585 with SMTP id a640c23a62f3a-c513ab4cd0dmr513379466b.36.1795259100428;
        Sat, 21 Nov 2026 03:05:00 -0800 (PST)
Received: from ?IPV6:240e:47e:5028:61b2:a372:4c2:dce1:98eb? ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm182991366b.8.2026.11.21.03.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 03:04:59 -0800 (PST)
Message-ID: <ed689e5e-95e0-42b8-b1c8-afcc968bba1a@gmail.com>
Date: Sat, 21 Nov 2026 12:04:46 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/43] drm/vkms: Add new lines for configfs attributes
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
 Jonathan Corbet <corbet@lwn.net>, Harry Wentland <harry.wentland@amd.com>,
 Lucas De Marchi <demarchi@kernel.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>, sebastian.wick@redhat.com,
 victoria@system76.com, thomas.petazzoni@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Simona Vetter <simona.vetter@ffwll.ch>,
 llvm@lists.linux.dev
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com>
 <20261120-vkms-all-config-v6-3-78ace90f4fc1@bootlin.com>
Content-Language: en-US
From: Oarora Etimis <oaroraetimis@gmail.com>
In-Reply-To: <20261120-vkms-all-config-v6-3-78ace90f4fc1@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/20/26 6:58 PM, Louis Chauvet wrote:
> To uniformize the configfs attributes, add a trailing new line to the
> plane type and connector status values.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   drivers/gpu/drm/vkms/vkms_configfs.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 707cf3578e2d..5f5aa0a1812b 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -294,7 +294,7 @@ static ssize_t plane_type_show(struct config_item *item, char *page)
>   	scoped_guard(mutex, &plane->dev->config->lock)
>   		type = vkms_config_plane_get_type(plane->config);
>   
> -	return sprintf(page, "%u", type);
> +	return sprintf(page, "%u\n", type);
>   }
>   
>   static ssize_t plane_type_store(struct config_item *item, const char *page,
> @@ -527,7 +527,7 @@ static ssize_t connector_status_show(struct config_item *item, char *page)
>   	scoped_guard(mutex, &connector->dev->config->lock)
>   		status = vkms_config_connector_get_status(connector->config);
>   
> -	return sprintf(page, "%u", status);
> +	return sprintf(page, "%u\n", status);
>   }
>   
>   static ssize_t connector_status_store(struct config_item *item,
Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
