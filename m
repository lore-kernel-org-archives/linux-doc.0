Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979855;
	b=gyNFd2z14YjR/0I7C12qx1jEzc2lc28RHXFZytVIayC9BPHn4aX/g1Y/UlXW0150XQLr
	 1oa5P6CtgjfbgVvA5xrlF35JcAGqsN/VAlPpM5DiFN3nWgmRYGOzBeWwOmv4WPfAtsIvT
	 uN56PxOVKLoRhLMhaAj6uXJA9st0tOZrPpdQ2dDMUN/UdDwwRB7V/cflU9oz6zwTWWli3
	 I76UYUE9s90CngBmtMtc25CFFxts+eqIzLm6xSLEmrKSENkIKmG2mafa0HewkZtO8HKo9
	 yfmSqKDRQf2bavb+qHPV+GfzRsVWumWvgDg4sYbOCl37Jc8bw/ll7xU+vvn601Ey95w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kdSQ6gbIkbrqZrODfVj2GaSXZ9iZOLx1/t0MWwXpq7k=;
	b=gBfDYLQIxoYeOB48Xqc0Riu+bGiQ58lBL6dAfGu9yna3IaUG+ThVGgYyCdmAIuc6qkiS
	 0koNCPzawl06rI8SBJV4utJoD9JQPtqXfrYIFNORNRztoXdRWVrQ9w63CnY3F62gu3t9U
	 iQ5i6PS3lgYW1yhPA6/Z5WCjndF4vpzFUoszwOx1s3NcAy+RVjZMgI3eP9bEkD9/m8rOK
	 RnupGunCsuF9N9Nc2Kf+8QjgVAwd/qlI5FFfHvAGoRNPBRfOrlQwOdOte4x6bxPOciQtQ
	 cCxMU0tpCi3zYlTbSTOX6EEux1y54uLos8TRQ/pIVSO0xpcSwBbMgdLowcfFspbgTUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=XktBeRgf;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13932606A329
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 15:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13932606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=XktBeRgf
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso445815a91.3
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 07:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1793979854; x=1794584654; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kdSQ6gbIkbrqZrODfVj2GaSXZ9iZOLx1/t0MWwXpq7k=;
        b=XktBeRgfpL+sq7AMBNpPbpVCYV4IpQlj8VOARywQ/MtvATQ36atQ/67mLccb1l6wxw
         jP+dCNwrB6Cgg3D56aajxahDtwEeq9oKwt2Xg3tDDWkmVnk4Mhs6THW/+zq67cNod0n7
         jxTgllLdYzzofQySFjT78CE3sAs3q5fFmRz44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793979854; x=1794584654;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdSQ6gbIkbrqZrODfVj2GaSXZ9iZOLx1/t0MWwXpq7k=;
        b=H6phdM8g1a0yo+iW7vY6nQ8BJer3Vf7ewDR0bWHgnZ5satyhYhapl/yFQm3zxpUWSL
         LNa95Kqth3MvyJE8G4TmPyFURBnVVPIGDjJtI7/EOfWFzrSv63AKDnOs8FN9z+aOlzyX
         ciIl35zHTJdrEOdr8MoIVKkG9x391qoPlP6w0HcVTmxvX2MvJXgW9tpNKis2tlraoA8s
         qz0GMODhOUmm6BnN1E5fX+9Hr9RJ62vqaBxHnbGKein7KnKjFG9I8GZPwa/E0QSyCUNn
         Ki0q21R0/PD1WVLNnkwzY0jZgdr/r+43by4J91gLMaL/Twe/SoYnM8JWkcbz0alPuRaL
         nsuw==
X-Forwarded-Encrypted: i=1; AL+hErFc3tpPGYOE3AaEXSYuAyBUe1/2HTdTW11j3pSSGlzx0J5o14N+3Rw5eAv5Ekeo35LxMGfFqSfObQg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Bnb0P87nIaIrQr5ZMKTirFvM/962v01q3c/KYe8/hPtW10i4b
	ybxwHKgr2LEqHPQZA++0wzWTJNE02fv8pnvualpBUFeRsmSya0qVpuqlLQEQUkDRzWU=
X-Gm-Gg: AYBFou2bkqiEqMk5PTcV1dIlASEaVOVXgcKe4wfyKUuVMcfTij+ImvtgRHLAhR2MjMc
	FNysi7LKt4anI3XIwJJp3zp3+rVrPv98oTe2Z4d3w3Phn+JDku6ylK08GmSFZtCHQb5lyJpv+ZA
	nS/QO7NzKz21TfcXOwamP4yr5txek5hYSyAFJHA34HOikMmqmbiwV3ss4lvSv8mHcOh6oxYW6MR
	cZ8XVPeDm8T7e6yyZTaPEdd9xOfBgnsFnmqT4cG0rtSBN0lfbDnLbPOr41dulHxt/NlxNbOfiQo
	pMOgOOhYPhkXKkc13Vkn3p0hmoIk9kFHCZ9EuJG9rDjRKFyoSgnngTlER8Z2XKuydsyl0KnWr/g
	zhckHBTP0z+tD1N3ilgQRzWQXGDy2OKVuvOr/wZ4e6cn+gUFuMFUI+AftD2XfjPmIeiYtmtA8ax
	9XxbW/3M33r9GuL2r6xno/eq6RcpkaBWKH/Zf73tWpDSYa2wNcvshehfbQ7VWIClehf0XEV12tB
	moOt8RSEyb1JJhWt7n79m4ktaHIFDGSRr1ijLR/NP9j8jUI+nKt0rmLUpw4QdOpnZkwadGxgodV
	6DeK295A6ICgrfH/lhk6mYOXx9nzNKjNkw3rn3PlqTHOcUIB0VAihZQDZ3kix9JAZsL2fVeV0xa
	hZ7WTddQl/WU=
X-Received: by 2002:a17:90b:57ce:b0:3a4:fe48:d410 with SMTP id 98e67ed59e1d1-3b0db6e584fmr2823135a91.30.1793979854271;
        Fri, 06 Nov 2026 07:44:14 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b326add7sm8301270a91.8.2026.11.06.07.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:44:13 -0800 (PST)
Date: Sat, 7 Nov 2026 00:44:08 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
	Gyeyoung Baek <gye976@gmail.com>, Philipp Stanner <phasta@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] accel/rocket: Report NPU usage through fdinfo
Message-ID: <au31m2jC9SmQ6iZh@rock-5b-plus>
References: <20261103155338.1949294-1-sidong.yang@furiosa.ai>
 <a9f016ce-f086-412d-9ca6-6608a41840e5@ursulin.net>
 <33ccceef-3498-426a-ae7c-a8bafbb88992@igalia.com>
 <2ca12f1b-89f6-4069-aedf-4e5d645e8deb@ursulin.net>
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
In-Reply-To: <2ca12f1b-89f6-4069-aedf-4e5d645e8deb@ursulin.net>

On Thu, Nov 05, 2026 at 11:04:29AM +0000, Tvrtko Ursulin wrote:
> It would just be adding u64 drm_sched_entity_get_runtime(entity).
> Nothing else would need to be exported and the implementation simply
> locks entity->stats and returns the runtime. As long as the caller knows
> they haven't destroyed the entity it is safe since entity holds a
> reference to the stats object.

Thanks for the suggestion. If Philipp and Danilo are fine with it, may I
add drm_sched_entity_get_runtime() and switch rocket to it in v5?

Thanks,
Sidong
