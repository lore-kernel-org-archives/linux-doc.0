Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956376;
	b=1WVvgpZDzM31CDIBDTmKo7imjGHvRxbNaFO9KVzbNCTkbBtKLHZTnt/aVxD5dczs6ia5
	 0xpn50JP9DAYS7OyjvLbXBJh+D/MR0c8hXEWswYHCUd13GllZFcnOpYSNZJKoJe5ajZng
	 vxgZ1enS6cZTSJ6PaqavS3JcKaMmwJv0nRcKxccflTPGSaIFymAepv+/l4P/xbcJcNtqU
	 lR6KfWMwN0udRhdfDCi6ldyQ7ShFQA6mHNiaMflsntyBF5Vlv1oYMUXL2myGdBVZ4sHGR
	 QUqa1N/xVnpGSp5Sk4um5Rqo5AuqBuoXGLJVTn0J9fEdHJyKKzJck3bdPjT1JZxPNJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fmoyspqstw2/9PiOOpzl/yM+dFrdSjNpOnDbiAxrbfI=;
	b=QPdv/ao33/n7W0cvaCaR/FI5C4Im7R3SonNsBEhdIo9/zDCtRVKpKMgP2lzShhnyKVXe
	 SEI3g5KreFEaQ5YEJ7vm7zRrSuJ7G73FXe9JKLvYnQXb6Ln5QmtHG+qOk/x2yKsOyaJU+
	 G6+B2IJErTaTzSXSkzh6ll3MOx5pHQWsEk7WD/w/6Y7GU8ZvVR1jSLUR1320ZK6UWB3NU
	 1ntXKLn2vbG2Rx90BJl8NONx3o1hN7wOS/cvbqURPSVZimtjbRihdjAGXkXHL1awZw+g2
	 /hOrzAoMiCRNwfzBsGSgIBu0usStDZXFVxtaHsBhPm4tCUo7zE+Hr/weRIzQlyV/6Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tomeuvizoso.net;
	spf=pass smtp.mailfrom=tomeuvizoso.net;
	dkim=pass header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=F7DCHBDW;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B90606A33B
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 09:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38B90606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=F7DCHBDW
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a214af2076so2440035e9.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 01:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20260707.gappssmtp.com; s=20260707; t=1793956372; x=1794561172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fmoyspqstw2/9PiOOpzl/yM+dFrdSjNpOnDbiAxrbfI=;
        b=F7DCHBDWJZ+4W4fYCOJAzTGIPUZxKEM3GQC0UOoOPoAWs2sXUCP0NuFdJ6wVu2Os50
         3wVL8GvuFQE9sHoxI8MVjxE6iTpOBUpa5gDiv+DeuFw4+Jk1J47d+J9iL2ailF9aRunt
         evoZoHyEB8egMEAfX7568Yz8zZUnzf91RfioeY/omDmPu3ZKADe6339IZJqYWVHPc26J
         z5VNCpWEHO2L7dXDObSFERCeTlRP/WQ8092QYY/fghw9MpgBbnJG83NLZf4fc2Y3H0ed
         Y06oe2zadbaLO6k1LP9aUY+7pkHtxwkzuUfNJKb94ZaW874HUt18oTsDZzdhU8U4MzRj
         c9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956372; x=1794561172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fmoyspqstw2/9PiOOpzl/yM+dFrdSjNpOnDbiAxrbfI=;
        b=TS+Ct2jSQupnIrfCnj7nPSlJ8KX2yZ3497sza0cr5f7AV0UmmYdDdOyx4fD1JPJawb
         o8YvxkdJWQAt+xEg6lEN7qAqB2boE2DgdkxbVwYRMNxamktPCCIUAqP0dRoz+VApGOEu
         qh/MZtJr20YKiG+nmN2NpOXue8uIOIMn83HKUwGGp7FzfCsknpmdb4d8mlxvVRs8P+lG
         xkMSS/uo4jnP/ht2cFv0RlD5DmzpO1xqTMQl52dDfX+UdbhGDFxNKC0LCy8+8rGK76Ay
         x40w3BVkHMnwLeaaJs0CGRnzC081Zf1N5npwkUexQFdru+A1z2zCiMhDMDzM3hAvycpl
         2TRA==
X-Forwarded-Encrypted: i=1; AKwUvBxp1+7ThIi38CZyhoiX6K0t9pf7ieqEKRkqEdfplqz9xl05LNijuef57HslkHpuBJw+5nUDWQD30uo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Cp30s0o1fdOWIHwRJFhF96Kz1I1vPAiFx4CPWHPHLnHoIfGPa
	MBdg17iAT4Xj3t4rr45nbk4IQ1rnSgJVTIL3EF2Za+tZcXaT03Oirwp2mZtDSM/r7Pc=
X-Gm-Gg: AYBFou0n9W6ZO9vKXPOw1NGgP4qHbdGZJwcFJRuKiDK1Bng5WUSj7S7gHNR559/FWTQ
	mQSFn2r9LsXG8G2RTruRGtnt7w4GlE2gCOGcIxHFz6QOUe1XIAnQ3RntMIYVy522UfnFJX770lR
	DgnXY0r+HFi/nt0b7VhxieE1apo4nZyjdxMlIzWldm2ksHqZyRp69EZqdgnDYvnEhC/nU/OMyEz
	DJ6QEfn4qyetSmicpnSkNOiqg93Ffp94vzX96oiKpZ2WAk/GkNsrgbMtqiV9pj/LRBeTN9mT8rY
	2KYp4pzu69B0VF35QYdh2aOtMZI1P/VVr9B/XElbIBzZXlioWPmryxt71+LFSpHS8gBzw6w0gM2
	a5DpRbkZVx0jFT/B895bxO78sKSzwMMJ90j6UPS65TxEsvh8MY33/G3Dk5MVyzBGdKYq1fnVGDS
	cv+YmZ5qdmaSSiYmpLbB9sYjgw3qBd5X+if3uHL/5skhqI96QpGtQ7/h/2aVfFxeHtq2gGaOVsh
	mT2IyalTi7YdrCkA/c57+JR+JidBoU8jpA7HhxBFWxLo6qJqyuheVE7Vo/p7XAy6c/pBz6t7wCn
	1UHuwkusGsD+aOoAG+T6E7Qyi4OBBYLmsbz6YJm5wVlAfy4K7t2sOyudbi/sWKA9FiBhfOwWD3z
	jZh65e3pbR8OhHMYWuvVNkSaNgwQwyLgOgK4BKEvNu2kQUppIvQ==
X-Received: by 2002:a05:600c:a4b:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4b6dff8449emr26012245e9.35.1793956372121;
        Fri, 06 Nov 2026 01:12:52 -0800 (PST)
Received: from alcachofa.home (cst-prg-36-190.cust.vodafone.cz. [46.135.36.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcc6sm226920045e9.2.2026.11.06.01.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:12:51 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	dmitry.baryshkov@oss.qualcomm.com,
	andersson@kernel.org,
	krzk@kernel.org,
	rob.clark@oss.qualcomm.com,
	jgg@ziepe.ca,
	lingtong@qti.qualcomm.com,
	cacar@qti.qualcomm.com,
	sandheep@qti.qualcomm.com,
	Bharath Kumar <bkumar@qti.qualcomm.com>,
	Chenna Kesava Raju <chennak@qti.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Bharath Kumar <quic_bkumar@quicinc.com>,
	Chenna Kesava Raju <quic_chennak@quicinc.com>,
	Ekansh Gupta <ekangupt@qti.qualcomm.com>
Subject: Re: [PATCH v4 00/25] accel/qda: Qualcomm DSP Accelerator driver
Date: Fri,  6 Nov 2026 10:11:19 +0100
Message-ID: <20261106091121.3958523-1-tomeu@tomeuvizoso.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Nov 02, 2026 at 03:51 AM, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com> wrote:
> User space
> ==========
>
> - FastRPC library: https://github.com/qualcomm/fastrpc
>   (accel support: https://github.com/qualcomm/fastrpc/tree/accel/staging)
> - QAIC compiler:   https://github.com/qualcomm/QAIC

Hi Ekansh,

I'm still confused on how userspace gets to execute its compute kernels
with this uAPI. Let's say I have a compiler and have compiled a function
that reads some values from a buffer and writes to another buffer. Could
you explain to me how should I use the uAPI so this kernel executes and
I get the expected results in the buffers?

Regards,

Tomeu
