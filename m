Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6C23C81B2
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 13:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813000; cv=none; b=eJyW8+p524r8YoskbePsrnWNFNSz/PnRUAXbipx6F7InHTVldmcQZ5F6arQChLMYvSBqujoHpK/rt55QfsQRjtEmXn282J+1HLS4fh0YlygH9f5yZYBPYJhDjv4X6pyv1I+1Mso80cZVqA5NZJxQdt8jnIw6c3rF2l7xulO21CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813000; c=relaxed/simple;
	bh=6QHe3gCwglIjK90q6m6GkJpBsYmYtm7uNJvBv8QiNOM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ClG5WXCwTv4y6zADoewpaBFYKTsdfpsy/TzLtgLjjSHjUzmpNLVBNa9T3vEuPqKoIsTKxjDok2nwu840e4+qSunzQKzV9xLvhK/Wsl7TdAPXcO65SYNrbPbeLgrf56QYVOsn0kRdP+uEfL6g0/0R17RXMmJIsJA2NAnVpcb7Zxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPhMzjg0; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPhMzjg0"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c315869241fso270299466b.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 06:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791812997; x=1792417797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4q8tx/vqsoUyoRGyu2AvHT6woUinvEI46vsxfOxlvRg=;
        b=iPhMzjg03qo3VjzKOHMnYWKB6CCotLGA25LVgnQrXXRmEaUqE7KTvQ65WdpFkCTEdP
         ef55VPVpXLCMQuMT2KZWvAWB0gsBSQpAbIupzVvAMgs7f+RxgkcWcbBazaBbYzkqy4YC
         rRn1GT22Sh3SskgRfEd8sUpI7GCA7Fp3zTuYtPaw7176tbJCY9uXoQDRgKNulyqpBDyH
         t5aLoZiIOCqi1A2wzoJx3DRQVXYt054b1UhliILxcucVCtdxkWa6cc0uNr/tprQI7Lkz
         FyLobfesX200aht6EBFa1nlkG7tCh0sjnTLByMPgYrVZ8X8Y2G79wipL1uK90jRcbkUr
         +E6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812997; x=1792417797;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4q8tx/vqsoUyoRGyu2AvHT6woUinvEI46vsxfOxlvRg=;
        b=gyRIedflTGn2QkdzxR9sDDYgyk6YWXw9yInChh/Cl4oRaOF329Cu8MA4jwIUjiloag
         u32xiDPU8nVKm9+SWgPBZj0CBEywqDaURA2Hs5e8Qk4LB+B0L+sqRxCSAtHy++aqWwyc
         Wf7jqb/jkK0mTcW3/KLkD3BjlYzp8YhBo+CQmKX9JW3tG0iMi069BPQzqNo2ECTDKt+R
         PctM80ZiC2ANYph6tz1pBt12kayGZHXTk6Iry1ZFYFSs85T9Lfwsg2FTjolRHogf/hLc
         kBnUdtihO1YFTFg8RfHPji6P3cFojkQbMGNd4Q6FKaZFPMzFqXs+VbP512I6+5tIAnzo
         qtIA==
X-Forwarded-Encrypted: i=1; AKwUvBzmoxZZOnb8Nk1YPsg3vT25b7oMnwHTdugtnr1FXVmtf9n8h+bzqE2G0zfBj9K9CuqYYetCcpuFoqo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZXEOf4isvJ5C6SrU5JhU0/7cAh2DrLDChVV5QrrjGlK3n59dd
	n3Q3qgQHNV5zSpFPk9mSvwtSF/WoSau2gbMJbLPG4rQkH7lofm/gDhLr
X-Gm-Gg: AYBFou131zj82zug0JPXWrSrD22wz+cC/3SP1NuFvnO7SGS3mfpKRF5bJyyjOpmm9E+
	yFwLuGjixApHHGlKNiNAph6qS69gN0WVbcfe5a5QDVq174qrwyJ88UfrXCnAjbgFYqtyyslOxaY
	bLU9v4T4YXdcu5PAdnskRSEvOB6GmdXuNa2SToBH3UsLVezGlnbixQHm3p0SOqp0Se0snUKZKur
	TlGe2bS88nYuJEQUyZ/F7yP8rT720XkO5K2g2ljWmT1u4uV8PCv5tZMY7y3WR3W3zGjX04wIoZ9
	j+PsP0+P1p3wN5Pm+CJJPz/QrzfVWJK86dn97EcAhtIXo+61vn9t70hZrjiFXNlCgK7lsNuA8fc
	BoRSw5r0tsGq2L0YrrDk3k3BlhTzE9n8pYFR4Kk3qk16soLBJ//+w+FlDjeWhpfCxuK5uWRTCK7
	rVRABhBGKhfEenlgBENhzDdw8dqWUFjglnXynoqyBY4baGYT62OXZKKsl516o8bbckZVq4Lstj0
	FD/nrT6AJwuMla/ZZPWulPdMRwugFFVvFi5kepj7UHRanZQsiZ1eA9iTj0RoqzTT843ItZaDV5g
	AeVFc31ks/C1XrM3MUmWFo/3xYqBg15O3sTXvhrcZxOcb8rZIuAR90EBTFmeVlgwvNbsZ2FSvvj
	huHDoSA33Bxc4vZ3Ze3ix2oUzHwYfLKo7+oTko6WU6qhzAPE+lf+soqPxFGuV0NA4DJ7GdHFHrr
	9sRvX1pebzWxxVsdQ=
X-Received: by 2002:a17:907:8d8d:b0:c26:306f:289b with SMTP id a640c23a62f3a-c31a9b0b097mr807813766b.13.1791812996554;
        Mon, 12 Oct 2026 06:49:56 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aac6a4sm19827476f8f.28.2026.10.12.06.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:49:56 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:49:54 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Marcelo Schmitt
 <marcelo.schmitt@analog.com>, Radu Sabau <radu.sabau@analog.com>, Janani
 Sunil <janani.sunil@analog.com>, Salih Erim <salih.erim@amd.com>, Jishnu
 Prakash <jishnu.prakash@oss.qualcomm.com>, Jakub Szczudlo
 <jakubszczudlo40@gmail.com>, <linux@analog.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 4/4] docs: iio: ade9000: document ADE9039 support
Message-ID: <20261012154954.000075be@gmail.com>
In-Reply-To: <20261012111342.48040-5-antoniu.miclaus@analog.com>
References: <20261012111342.48040-1-antoniu.miclaus@analog.com>
	<20261012111342.48040-5-antoniu.miclaus@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Oct 2026 14:13:40 +0300
Antoniu Miclaus <antoniu.miclaus@analog.com> wrote:

> Add the ADE9039 to the list of supported devices and note that, unlike the
> ADE9078 and ADE9430, it does provide the on-chip dip/swell events. Also
> document that it exposes no total reactive power attributes, since the part
> computes only fundamental reactive power.
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
