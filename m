Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502672;
	b=ckQfLDwspB4FIo5h+LJP7WxdJlJdq1f4uvc/76/BZHw152s4mcvnX3+xRl5sqFJugDpv
	 iMaGu7+PWgY5Wguyi5VGbyMqSpf7tM6LW2ArQmOle8N0lcIlaHikKNrrgzK4khRezmlqu
	 ompS0BRnlVMcjUlHGscyfU5yEljEulrNZT5rUe1oUc/DdiLrxDMPLQ6jIhoDY8SKlmXYp
	 SCXiBPaMjySnzYI3OsMKlRuRi4dWSN9940tPASzD7cT/S3J3CUW4aubr10hkFovG6T++U
	 d8wPOSFiFXaA2Zuc24NakE6audx3P1okh1HsMXK+tsVkgHSsPHZpM2kw3HaB4xSiBlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hUnOVjFYHGFbt1mgqPXrl0v314IpNkEBO0y4IzTD0JQ=;
	b=2IAyF0xWD24ngPiqDzBQOsmSmbxQ10/UkP3X9CX+Nyp9F7GPePQ0PwkzXoPexWQGtQe9
	 rajN6BBcgXHnKR+OAIHqNkjqJwX2Atd+Kh+bR9pu9Sd6gjMMKeI1ag1BVWlm3PiRH1S40
	 XR599lf0t9vpxyL2Hc2qr8wkJHw9JiAkkK85ddwinyAgwT4eQNGPaTvDj6bKk0fiYwncE
	 /IFn4QtnUJoHlCql1cokiUcyTeVJcxTx8ae/LWUEYwPI2uFT7TI+bP+NpHEJaV1q5Wh4Y
	 VbJ/mOBybfNUHhqEOZwm9B7a/Ge/yWpgfYCLhKX+YmamPl5ftGH8om6pGUFs6thOALg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=eFsdmVnw;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373AA606A31C
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 16:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 373AA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=eFsdmVnw
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so37563a12.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 08:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1794502671; x=1795107471; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hUnOVjFYHGFbt1mgqPXrl0v314IpNkEBO0y4IzTD0JQ=;
        b=eFsdmVnws1YHcyPrg5gzVXT1wz4U85lItJg/8kGHzCRkFAUjQgrJnFC21MTgfQWpBX
         Pl0DRhj6De+1QUD8pFyORIbWjMZt0B3hX79aaEdnvv+yTCyWKj9tQ7LRY71LHoX2485V
         yB/SYnFHTpEGTrAeZekNh+uXfa7nVnGleI2Nk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502671; x=1795107471;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hUnOVjFYHGFbt1mgqPXrl0v314IpNkEBO0y4IzTD0JQ=;
        b=aWUv1+B06OE/KXKVO51zJyXAx6w20eqz3Vk+tY6zFKPmrFe/scJKDggWCtzC1MCJRp
         tw4xfoN1mCTWYXhUOSzsRZi8WAp/t1dFR33964I3HLVajQuqR+UHoaCbQ2b81gL/h9H+
         4a248fM2iGRg0IyvkXjLEsJcyDr5b1TfaD+3iy3c8bMf8uFtWSzbd6Vsu3heHb7ZDX0n
         vsEjasTjO5HK2Xm9tSXK86WOdExkF7aKzBIeLc310HKc54F6jAUhxTYtNUhcS/RAymAw
         TkNxw4Rj5Lh/uDcLmkEi2cihBag+qX9A39rsHblC5dY4mGyXm+SXo723lTf8qyh2hJVa
         Gozw==
X-Forwarded-Encrypted: i=1; AL+hErHSNTJ8TESjSOZEsQEam7ffU1arMxkQ4W0Ys6jQLYqZR+fPoKfUmJmm+RQ2pNOnI4hRpxC5ZKMkMUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6xxGjwcwBPqkRdFjfxoM/slqfPU/TklbNs5PHecS3PSXFtpxh
	HH/JK2BYLIqFSgLMGree5l8zpVM6ZgOhwjj4p8h1f4+ExdSfnlqgtCft5dsVvi4JQ+AAOKVTyn1
	OgU/qLLU=
X-Gm-Gg: AYBFou2Li+ZoBaeIMdfJA5M8xxMxIJxxvrIkxYcyhVf4BkM1xBsTao+P2g0+LNFhh5Q
	XONzqo4sLzvhIr4xe1oYcJ/LOipCIKYobWsaEJo2lrwAnx4UrFFsLUb5a/7dn2e9i9v0Gkbpixd
	JG6F6hz0Ji4wCNEo3wQMy93BrYo0eXzciS8GRIkQClXMbdic6XUz8y9jyhDLw/tu2gRKKP1xPoi
	GscP3hU+GEFDL+xPWV7vIFv5Hw7BsmDV5sCM96fp242FzYQJ0KEFvmQf9Wk2AlATZBA/UN5nlEO
	cu2p8qeBSrqDFLQCrinkeczgx5mnpnwGJ141ceLcdRtqtTrB5pfL9xSrjlCGhuWlI8Kihh832hj
	etDzYdrBXO3KPgMX/rlbwls/VL/rWRolxp05+Fqdr4bUgb9+kaLq8Ql3bNMKjgR5du984j+YR39
	ibxusdCyNh+C2J6Fb0MWnfuvIBCbiP3YJWS1ogh6PksFXwP5D4UemW/2f5CE/ZgbiiExwiL//tY
	VWuiAEy180pjl2SwWZtdgw9BE2Vg9QxmGsfxz6igwAha2MOgW5A2dciXmDMiUHccoi9A7ucCTZ7
	/uIN9b7+jEbDoJDL0+alOjW4iBlyqv2B2oHs3fP8j6kXoDjrPuOCrNO1rEYI+PynczmuWPTb6+T
	FmuH2CcymaaE4
X-Received: by 2002:a17:90a:c110:b0:3ac:d39d:ee4f with SMTP id 98e67ed59e1d1-3b182f58538mr5387882a91.44.1794502671465;
        Thu, 12 Nov 2026 08:57:51 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aed76745sm163431a91.16.2026.11.12.08.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:57:51 -0800 (PST)
Date: Fri, 13 Nov 2026 01:57:35 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
	Gyeyoung Baek <gye976@gmail.com>, Philipp Stanner <phasta@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] accel/rocket: Report NPU usage through fdinfo
Message-ID: <avXv7jGeaXOPeHCR@rock-5b-plus>
References: <20261103155338.1949294-1-sidong.yang@furiosa.ai>
 <a9f016ce-f086-412d-9ca6-6608a41840e5@ursulin.net>
 <33ccceef-3498-426a-ae7c-a8bafbb88992@igalia.com>
 <2ca12f1b-89f6-4069-aedf-4e5d645e8deb@ursulin.net>
 <au31m2jC9SmQ6iZh@rock-5b-plus>
 <fc21d057-be4a-4cea-ab92-0951c4eb7de2@ursulin.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc21d057-be4a-4cea-ab92-0951c4eb7de2@ursulin.net>

On Thu, Nov 12, 2026 at 01:46:37PM +0000, Tvrtko Ursulin wrote:
> I am neither Philipp nor Danilo but I would say go for it.

Thanks, I'll send v5 with drm_sched_entity_get_runtime().

Thanks,
Sidong
