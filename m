Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435462;
	b=1Ez4CpCWixNemwBdZxuiZ1A1G/27rBc+TGgZUEbZqJbn51HJJEM9kRi3oZ9m7CaATp8m
	 TrUCV9OniHPPKTdwuos9afC6DNAcsXhMw0dtVzuMup3rIlbLmQOrbcvv+EUnUjZoNt4dE
	 7oxKzqj/NS91IYYgsevATU7+hLnTJhrHZKX/camuWGb35oAvnFNrH04GigkyWYFjbARZb
	 SvWIlB41o17uOOiZ7biMVITonQpvfU3vk1+8mv86dnFgFi4h1DpTGDzgHEmaZ4JHFVtru
	 kFN9cabAfpD1XWe8wo+C+WkLBwZTu1WCj/7HsOWbd3aoPMXFOo178QWVlmMn2i5RPqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=on4OwLeblNaonT3lNV7MZNGdksvxJ91EU4BXLnkFgWI=;
	b=fOhQ5WcP+3D6KRYrDAA7Hwgk9/q6e5/BsQksgLsj5FRxDeUoUYPpY8Hh8K88mLKJhT44
	 KOfuf9rm1+e9Z/qfiymAzCbeROr6qxRIX32pKltOVQoG9r4XSY7wnkDz3LDTmttmKsSed
	 icD83PAhr/HPRhII7xWebYCU+VGw2IpvodqhxLelpXMicApHoiae/xC8IsyO5r5ECrgHv
	 OHBGQvFKuUCWIhPGrHSqsz2MD56MnCjGwFJUUH5BgfbDXIPJbBCUfDj63icjfk6+8g1P/
	 jSsZrIqMr7rAOta96XV4kU8p+gbvSXin2vwP2HZts00kZPSb9gv2GmZSCumNh8FH/Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ryPeGfdY;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D515606A31A
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 12:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D515606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ryPeGfdY
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38564b4b017so3434345eec.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 04:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795435462; x=1796040262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=on4OwLeblNaonT3lNV7MZNGdksvxJ91EU4BXLnkFgWI=;
        b=ryPeGfdY9Dw7UtJibXciFJDmrnxkqnoLzmumHGJKYNrUHuvdfxlNAAhHDP7odFh/d9
         GINx9NrdKboe8HYYZAoPWE50C/UEdjE+jJbFStAIbXFb0vmK3O9hiUImJaj4YHYrLW2n
         PzL9zehZfLTVh4ClDHc/y9U4d4VswKKA0noTVfzogW3OUA1lz/q4UfOPF4shNy+A3kUS
         b1tyVB5sRh497s23loI5jS3cTTJtUXpqs33Ai4pj4y+l1CfVuvfOd+GUm+m/yAf9jfeN
         Eys21zobvqQBmKbAObicNC7IHbMMwYn2dnEucPCJDOvbOxguLJY/aVmpwAgKjoagmAfD
         Qjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795435462; x=1796040262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=on4OwLeblNaonT3lNV7MZNGdksvxJ91EU4BXLnkFgWI=;
        b=CDGO8eCvtFV3CjB56gFspeMdi+pKTBL3bHdg1WS9qoKcMKFE4C7Y+5l7FcmpfBe/1C
         PVxd6sIYhozh6LYMe7mkdpYDi1TDc8zLLCfYed/rApWcIZsGrCnrJth+xBSpmwPFpljB
         k2V7rGYi/jGDNPWQt3/Z7ZpEtl5BJzCnWXEn+JP7EGVJ7ceCCIXGlysrdF0Ur+wHRkI4
         m2mCPR8DXI2HZlx2OqVoem4L4sR8obu/qQMDhUuCS6XsZyKCWg9xx4cv4IlMYQV1aGoW
         k039ENw6wbDfoB6P9h4OPuN6SA9oiY5HAVGGMiK1KHOEOw+IS0C3sVZBqg7zxvzZEQ7q
         rXLw==
X-Forwarded-Encrypted: i=1; AL+hErGcZth1P8SzSxKpIIdMGnqEzt4/It5u7Zzt/P76ojClIzJPhV9IBM+Rl1+TtDftmMBsFU9E+TEiWkI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PzcqY+Hk7FNkpmtKSq0C99FenS8u6AirGcSRdWrkP/tJx4Sd8
	riXYbgH6q8lgmg7ayzNRzJqjWbhlTtOnKyJaJeJxQbRhQn/KHYq9Gz78
X-Gm-Gg: AZFdTZc+yJHpkQUizyYKM1oPmeB54UjWyLYIRNTO/D+kA3DnNrrEcbck90hUceh3U7V
	KALUIYFE0xIcC++FikGL3GgynSl7Dd07M8iLK4BCQXGrZ2l16df59j4Q9RDie+LPlKejx2Z75MP
	zyFUCByN7irSjGcpaS1nuNfu1v+c4oTSyIYZV/SETvAC2bWIEIaTtjmwqjiBKQY8L6sVkMMqj3u
	wVRRtk7NU7Y77tItAB9gECPwT7hukZOtvm2y1VsberSGtzlMY4DheAVAqGs5g4fASjr3j+uzZMz
	KWWVFK9CgaC3ivdjpvLw9UJIJ7+sf+D0A2nZTNnVySZVpuNDcJpL3/ADy+T+B8EYeAjAl9TxLKI
	KmOjPXoUPnCVSk9ZmKGTUV42jO0FLAUlxf4Du9OMC+SZvVGYgXUrflQX6mPZcHuiylzJHcTXF+w
	1L99s8jPeu0PzGzAZp7ueVNyb4OJaNMdvodFsu0btBQ16vPfKSxgJDgzHjzfXyMOsc9AYwZRNnt
	8hlNHCrgRJsRvhMQrPpbvRn2RX3H/soS2moXVGrNFxQ6eOGs6UBAdsRbRx+xpx+k8MzgRQeKJbE
	W1rTD3Me948MSIvO3ARArgtyETZSBghq7BqJIawxKXyNCtlh0nmdMe9bBULGvk5dOID9
X-Received: by 2002:a05:7301:2b5:b0:386:b8a7:a195 with SMTP id 5a478bee46e88-386b8a7a885mr850543eec.2.1795435461549;
        Mon, 23 Nov 2026 04:04:21 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm42190014eec.10.2026.11.23.04.04.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 04:04:21 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 25/27] Docs/mm/damon/design: update for user report support
Date: Mon, 23 Nov 2026 20:04:03 +0800
Message-ID: <20261123120410.9542-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121210013.130397-26-sj@kernel.org>
References: <20261121210013.130397-1-sj@kernel.org> <20261121210013.130397-26-sj@kernel.org>
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

On Sat, 21 Nov 2026 13:00:09 -0800 SJ Park <sj@kernel.org> wrote:

> Update DAMON design document for the newly aded user_report type data
> attribute reports.

Makes sense, so LGTM.

Reviewed-by: Lian Wang <lianux.mm@gmail.com>
