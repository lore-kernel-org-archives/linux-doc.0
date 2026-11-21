Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795265445;
	b=mYbYzP4ut7TylgpVFWK5ceorBHQsPtVprb5k2Rs/oqikCf+KEivw/DYleC/w+5vdmMzI
	 eYSW83Brifi982KbdoNvAXbCdh+7nJ+GNcMjskvjmCEU8ervuMFaZ2L8rJW1R9BVgJLKo
	 E0Tt6nvx8ZXqW+SaBMmxr3F7izatv3KIGpZnUozeQa6KYQe895jhyx2SIPhoWJRP2PRzz
	 BqaqhtD9M76/g3RZlmca5rQaVQqAa8XiFmLi+fjun0l/N6XbwChm8XO1HIRffXM/6y/KG
	 z+zWNgUy7IvOWHbWRMFlPZ+snYD/s3SJTI72zjLwac9ifLk/amptB3+KtObVAtCTV1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795265445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=205CdX5PCQW2SykzUQ2r0VNC2kEGRl78KXXpxrNibvQ=;
	b=lB+WOBfnHSqjzHANS8cscji8ayusR/nx7JHtdtzS6gW7Abcs8aFG7fLhHjapanJ9iJel
	 e4vNeQZOyhq62Sa4wVh3Tvo8rQbdJGAB+x2tzPIWhsD3u1gqAVO2br38ijBxQP+ndKW6s
	 imfhoauRh19q6scy6kuVIHqcTdXiDy/RTXREUmdWmSxLmvvq9O3jvONBCdzXn/nzSrZXI
	 Vn/SwaaJKOYxjzYTrn6LukGAIrCarPeg4t81cpQsvIVw+tAJDISWlKmaQiGuAs0Kg48xi
	 ysqgB4cqV9tjlTPbFU9digytZshscjgDt+fVTdesd+5ItjAcPOgVHSW3livmMcvmXFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jjatc78C;
	arc=none smtp.remote-ip=74.125.227.201
Received: from mail-pi2-f9.google.com (mail-pi2-f9.google.com [74.125.227.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81108606A32C
	for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 12:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81108606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jjatc78C
Received: by mail-pi2-f9.google.com with SMTP id 41be03b00d2f7-cdd9d0d40a4so449770a12.0
        for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 04:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795265445; x=1795870245; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=205CdX5PCQW2SykzUQ2r0VNC2kEGRl78KXXpxrNibvQ=;
        b=Jjatc78C1GDOfOdrN4t001k4boCfHUhzerg44IhlpB4cibql+etYI9ADEVT6Wx2u00
         Bb3/8oUwVAhTqF+eb26XT49fVDWjyowzgfokHTKVoZYbeygKQJZCHZoaVAynv0Jto1BZ
         U5OCMcGrNh9uPEfARNcKuW2C82mKNaHu6zMvInNs/j5dyYCoXmvCUI75/tMQiwN1oK60
         VwWEPi37ZJGFQsNLJ0usIQqvWNOirl0PQx9liZ9NDMEBEI4VoVOMmKxsRn5XiqEMb5Pf
         owmJfuOBMkIepcqeYge7eeeeR/tKqRppJYUTfvSnbiNFNoKpyNNOrSLF0+FcuE65FTiZ
         zv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795265445; x=1795870245;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=205CdX5PCQW2SykzUQ2r0VNC2kEGRl78KXXpxrNibvQ=;
        b=uVZMO3HpCFqfv3IBU7rQe9TWiJtP5vorzbMwXDSloaOYFDOSDj8E1il284xr0hPDKe
         3he2QMeOGudfP4mZgsfju6JtnvK1war62ZzSWZ3PiAEz0RLtJvg1s1TVzK88Pa+XPygT
         l9YMG6J/mMG6Vcw/T8sBH/cz8L5VnxIsTEJtaQTQD12aijWpavh1IGL5+sDVlzjmSwka
         faEM4/7a81itZgYAEGmeieXuc4PJyt+bJ4l3YzSxVbLEUsznLhvBbWfmXuU1t7Tu9cBJ
         qyF4phSwPT27Gd55AL069YG2EmvBHkBG3DfPor1YVNwB4YF64GD7SkdFV0G4Zzh+9qAf
         SOOw==
X-Forwarded-Encrypted: i=1; AL+hErHCdf6+ysPwi8bo/2FoIK5M8pG2Qv7XRg2qvLfm+oXgEnnWyih/8i8eh3EwgLFxInLd0RcyIdZEm/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/B7ME06azdYPysoPd+4qQkwqlKSAmLFktV7ll2DeHZURNbaqkr
	aVO9Kzl15pWjDyYDIt7nOpjJ6Q6WFEHEL23yfPqONbDPcAaOBbcZWPhJ
X-Gm-Gg: AZFdTZeTYbGnvU1CWGQsn8uytkaIcixdG/ik+s1Gc7EVvRqDkIGBwwUKWycF3zKdDmr
	Y13K0jjMEVKr04SoinWLJjqjMNuaoQx2NTfSkh/gryToyAsrptwYVkMHZXdNCx4P4/Jy8s6ldkg
	QwgCdKmXqyTPeO6Q2GaCifyHxq9wPxbTw6i5pzWyNIoh33ZDuW9Ofb9ZV9KRLtMlj39BZfyATxm
	1xdy5I7ihLi3H7Wt0f6c5TRWonLJc6LF36/KC/JAZJ5EBJWhHvmvyb2ycH+uvsexLiwE3yrw+De
	haXKsPAsQ4SjoxR+n8EJw87rnlbKePlrYn6gv3O9lTqOJrP1mAk8gh0kTDrn+Hhz1Eijmu6Rx+f
	ATa5/hGvVJZKT7/dNTBFa0AU73Kz5wFPfsjvVCm9I6l7imm4KuJi57ci+R+vM42IG0PDt5mdMQl
	ZgtlnQvvUO9RYw/EV6+x5gbOYORiuE06Xn0yXGJIBNtq7BMXbI8JCWfxLhbFbzd+0sDNipVdBZu
	MiHyy4GVfMlVX/UMv1t+ecO5mubr0VGJa+Q6QR/dkDMWD+OnGi+HZBwggGzU11lmf7PeMEseIf3
	tEyYuMdNpp8lIAs18R0MEg9jdu3Bzn0aPk+dZdjV74Ki5jjCrVvrjK4Yz0yUQG7odYHP07VURDx
	PI92Bb3s8oolJxHonUyWYjWHUsa+BUX0cEQ==
X-Received: by 2002:a05:6a00:4c8f:b0:8a0:70ff:ab27 with SMTP id d2e1a72fcca58-8c87c09e5bdmr5660349b3a.28.1795265444677;
        Sat, 21 Nov 2026 04:50:44 -0800 (PST)
Received: from localhost ([50.7.253.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c272sm2888869b3a.19.2026.11.21.04.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 04:50:44 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC PATCH 2/4] mm/damon/reclaim: set memory PSI 0.05% as
 default quota goal
From: Aveline Noir <jm5905938@gmail.com>
Date: Sat, 21 Nov 2026 23:39:16 +1100
Message-Id: <179526475633.4.14859465649138957731.b4-reply@b4>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, arijit.desaii@crusoe.ai, 
 Jonathan Corbet <corbet@lwn.net>, damon@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-mm@kvack.org, 
 Randy Dunlap <rdunlap@infradead.org>, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261120060741.92121-3-sj@kernel.org>
References: <20261120060741.92121-1-sj@kernel.org>
 <20261120060741.92121-3-sj@kernel.org>
X-Mailer: b4 0.16.0

Hi SJ,

On Thu, 19 Nov 2026 22:07:36 -0800 SJ Park wrote:

> Set 0.5 milliseconds per second
> (0.5%) as the default auto-tuning target memory pressure ratio.

0.5 ms per second comes out to 0.05%.

> +static unsigned long quota_mem_pressure_us __read_mostly = 500;

With a fixed 500 us target, maybe a longer aggregation interval also
lengthen the PSI measurement window. For example, if the quota ends up
being reset every 2 s, should 1000 us of stalls still be compared 
against 500 us? If so, the tuner would drop the effective quota
to 1 byte, skipping pageout for the next quota window.

Thanks,
Aveline Noir
