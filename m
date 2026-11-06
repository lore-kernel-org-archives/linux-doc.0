Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794009586;
	b=LLWPjwtmRKFxOdTjXl0r9+05cLYCjB9zDUUzPneHO2Bpn1I54UDNOjhRz8loMzKJoR20
	 c0IEe892vPhlpk/c4fjZSLCVPHdW4LTqDUGTzqmtDiWlSj9IiBE7cuQ/yy9pSMR/gFdJ/
	 Dt7JU7dIZh7RRkbmVJvHLJE4cpN3KxZ3qL7QwBVHttLqBHQIiGNXMrgYJADewoq5ixsxs
	 M5F4BWo1oo5Ikwdgu7GDs8xx+U6a2owHTXLjn7W/78k98CNEcKQzQkfBQx9xW7T1xl4DU
	 6WjCK15AtfgGpJWDTQBLPb7UjgzvNqtGwkeVNERXq81rZQDZjQRM6gKzm8Evy1hVTtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794009586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=yqLXf+mGS/hVPryb9Jb5sGJOrOI1a/GtAPkODUpEuoM=;
	b=Ugck3oBRT3p6pH5hFFE1+Q4R9KYhg+4bYdd3RnlP2s0jCErJZCFGorY7I35o8YP64EaI
	 ZROeJeds5QsXSze+okMQ1NpZID5/xXAQ06t1YdWC6J18+10Z+GXMQ3VjLRhyVnP7/FXBq
	 vLR7p9Ih3sBZFdwjczZtikF19IYTcAzkgTs7T09bttRUhXKCuXDRcdGVDmx8/llcs9Dg6
	 K+kSr7GVsOxlmHm/bPu5D39M26dnBfNTIiFk6FsF4wBFpXYzmV1ruwvFZYrHKdn6OZ3vd
	 EzS5Z5l4PbiX1RWH6xi3lvdiRoqOmesIcQBdTcmSshmthD7TPG53DtTk4dILQuGegbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="h/ICyHcG";
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA0E606A326
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 23:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FA0E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h/ICyHcG
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc758830601so791387a12.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 15:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794009586; x=1794614386; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yqLXf+mGS/hVPryb9Jb5sGJOrOI1a/GtAPkODUpEuoM=;
        b=h/ICyHcGMWHc24f+MituXdi7xwjGLeaO5ixga8lv5LhPNuARERbus+LiCh9/WbcdnL
         JpKYROxmeWOC8j8Zp/ry1ei1nFhKcJL5WcKf0jc13ynA/FsAIPy6mNFVlr+ll03o+F3c
         plY7RF3Y0KY4BON5W+HhLYmbGYUOoSGkISKCNmd+zkN+qjo3gaGzS/K9PO6cWDxeK1U5
         RXLE0qONQprr1Uocvf2/CgcFfMuTU9nQxbntCEKvKCYV4nT6gtWzDCzzXfUkoCEi8f9C
         i3flnmKQ65DDmln2n60CaEYojKnRboVcOyUuh9UWceg2HHdZGaJ3IQHp/RwHIaD6D+Mj
         AT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794009586; x=1794614386;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqLXf+mGS/hVPryb9Jb5sGJOrOI1a/GtAPkODUpEuoM=;
        b=mCu4QR+n5jhGHsDQJdf5gJo/BSWjZ3MOjhs1pSDMj0PzZH5CYckgnhOgRJPppigcQ3
         zwjW0d5zfDFR2+tpPlbnxTQDqS9wMVb4pXowozKN8Er9v6uhXsKl+WIHR+xWJ0NUZH8I
         Hgca/d/ph25Xfq0F3NP8Ff3no5KGZE/ViAj63fJt+W/RhAE6CbvZ1Yk14hZHYICksDJn
         xFnts3NI8IUroHL32UhohZptG8efo4Vx5U4L0L/kpCFU7oEHZM36voKFQY3s5w3PWsd4
         R83dF7I/wN6wSfZUez62FujDHgAwLUAoYfa/62ADFhF1uWU3HFBp8SwYocBfbp6UjqFJ
         2x7w==
X-Forwarded-Encrypted: i=1; AL+hErHrDSBm3UHykMeW/Vrw2VGTHPqQ4Fe6WtDnE6j+hzAKNYsFsrYwlbdIp2AIAMCde1up7YVDqNwxOII=@vger.kernel.org
X-Gm-Message-State: APuU4Z846B7/kd3pVfMUulefYEz2LzDWdxa864TEfwsUAbo7gzgmPpQr
	XJFLkzjfc/XaNmzt6+1yshQBucJN4BgQISc3gDZgzNzfIahjDf+OFjw8
X-Gm-Gg: AYBFou2vY0ufiTaZU5wPZ/3LrKt76zPXso8lCxqI82xpf3TOu8kjDFbXnud7UgPn2XX
	ch6iKb0Xhvva/v3EOD/jFOFuZGlYNagkIZx5zo5Ri6/6adu7Kv+Fz4LQZV+TxJWgpBnYDvMh1LG
	NdlBTb1xqQ87QfyjGNrDpka3Dhr3qEasxGCZ+qXH69ODD2hhAhYgFWCJWlrh1XPsAMMacR/7D96
	qU8qisxLMeJtP9mio0pdkBrWYNzhq6Ix3BkRo/w8PryGlpQfz4MaapFCm69pG0uk9MuhIAiYJpV
	SZcdn7u6Bh/etRV+Ji+AusSzmCUYdqr/RmqeqMt0YLFIsqcLkEUw9iRMWDpNJjgk7b/IWyGO4GR
	caprcuJLlznWuKBEFQVNEq4mzx0nCAMl1udKwzUJV7SUtLV1/RvcR1p41yp5PCDgFCnXMsSsJ04
	7Ow2ftb0vmfnQfx54gy2nBhmE7M88FXiiVJmW1Xly7sof2sB1EhUULaYG0jjk/V3OKC5wibwwcE
	hUMYMUoa7QF8vkeqzBCaxcuKDz2LhEUyjsJKPznVtAwIHn17hsR
X-Received: by 2002:a17:90b:5307:b0:3ab:24b2:9016 with SMTP id 98e67ed59e1d1-3b0db6c9e98mr4130726a91.25.1794009585770;
        Fri, 06 Nov 2026 15:59:45 -0800 (PST)
Received: from [127.0.1.1] ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10581caccsm750767a91.10.2026.11.06.15.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:59:45 -0800 (PST)
Date: Fri, 06 Nov 2026 15:59:45 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-arm-kernel@lists.infradead.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, TAKANO Mitsuhiro <takano32@gmail.com>
Subject: Re: [PATCH 0/2] arm64: errata: Fix two Kconfig column entries
In-Reply-To: <20261106235616.1533003-1-takano32@gmail.com>
References: <20261106235616.1533003-1-takano32@gmail.com>
Message-ID: <duplicate-notice-20261106-takano32@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Please disregard this copy -- it is a duplicate of the series sent
earlier as <20261106234541.1474324-1-takano32@gmail.com>.

Sorry for the noise.
