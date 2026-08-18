Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202C333CEA8
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 23:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787096357; cv=none; b=P8DOglctoatfl/uOTC6HtkbwoC8qfBYn5QTRSeDVt7sgHvwoPR44k6MlRGT8qeA1w6gEHbsF1wujz49mWtPkq/kPYTLwhoGCaXdaGPr9v9DPl+P9NlMbDQLwUrMvTaBXrhodDO9y3yNTvPclBjn6Ca7QPIw6lwWmw8pu9XvGK6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787096357; c=relaxed/simple;
	bh=IlNVBIx4H6PkgD7zXgoekELCW5mFwid6ryMfcRReOq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=usBVMWRkS7q6WvOoBJHiy8GV1Mt5RqQwwqTkxpRJUJrTD6qVG7db5HDuaHQU94B9vDaBgWB+pxEJ9AOWHiiksfKCz6+dGQJDiXAcnhHNiu/wMoaxylAS1BHnET3wJnDU2IKCOpeyr/3Ahlu7IfaX7hKabqxz2iNzcWJg6814dac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXZgnG2o; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXZgnG2o"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso1140665a12.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 16:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787096355; x=1787701155; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aXe+DqGRO+U+o5USvhMVUyhu9ixk5r/8S43UJAXzTP4=;
        b=aXZgnG2oQoemKz9kr0peXnlUtIm4Q+VKAvh9z5/e+HvtjA6DmAH2BUfk/T2UUrl02B
         9v3s7VAeG43Jy1A4UDN2OpCr4tIa8t4U6vk3Obn6sH54SyZJyMDYlt35puR8pmT/0K8s
         5xrX0CpeIykOAFv36xu48kMFXkJeFah/qnf0ZzNFzpBTY5FR5BqVHrty25POZnQELt79
         PDP+Zm1dIfmuHt/hX2TW5oa1Ro2fgBdxaahVcvgvmQlmD/4A0PnxRHjLj6uMkSoiENaj
         mM/BqGEekdcG4yXjdxoce8n3ykQCNAnJnBF3MYDFVDq4ov2LRPlTEc4GY0pEX0hqnfY6
         IeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787096355; x=1787701155;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aXe+DqGRO+U+o5USvhMVUyhu9ixk5r/8S43UJAXzTP4=;
        b=Ox4ddzFGbqanI7lcbw5jlKiWXOGSQpsR49BWwDuZYKtrkVDBljeSFerp3NX+wDHmEZ
         JpkjIO/EvIkBfN08R0kRJWIkHZufli72ThvCebNWnY43DlIi3PvwokRlJgRBBe83luDZ
         FqoWhoptRvWciFgl2AhO6CIHs+tjt5Hha/nSkt3ctay4VnRzy7Sox/wVblbScrTQSC4j
         lKlTrLFabnty3eRyc2kLFF/Fx4xl/ihcBy9tzsQsml2qYnookAcW7sH8Q7pXqzYXMZyC
         ixrCAGDk8PSIfqiRcor/8m0u9N+RsYvqm0ka3WsLRmvoOWRZ0HN7xvK74+IIEsC2VseX
         NgBA==
X-Forwarded-Encrypted: i=1; AHgh+RojCLZCbNABMEY0lCqFhX9OPLmwor2muUyx5LRg6nEE5mdrMmyEGQEST5ZVUqAmt8weXaODsW3yx88=@vger.kernel.org
X-Gm-Message-State: AOJu0YwegiqSnxt9YgcTvDXY18LTDMPflyk/8V01T9o5CANVC4LWWPiV
	7rboK/jufIssg+QKI1PWsYStVErDwE2wm3TvomozL2KNWoLVuRjkO4QwWuRtSQ==
X-Gm-Gg: AR+sD10L3ZeDRXCjVPFBUgZCLOroZyWJ//t/cVFuwqs9XLbWN7tA35IjQ0ld6hPbZde
	moLYLGGxRiiHuu3ngG1buv+US7XRxnvahO/iv+OdcbRfNuUUOxqcsqemOKIVqSW6c4SUwgZnpFE
	wGIJHRBcJbAUk7xiOjMvBCqGXj7rNrlM3eU3sikh5jH2rXzayR+4e7RqqyY/A18DJi0LLDflir3
	kzCzfHc+6OFcjo4fDXVEyUoSq34WamYwy8McpEk8sZG4QtMQyFh7R6a//+TFMLFoDxdPbtJLMXr
	7oqvhQ/VpBXzPzNx6Gjakr0R2vhHavWpibTlIUlmkNO/QcvSKOVVtZRUPaNsDy7uVJw5hnVI/B9
	lR/Sq3FF38j2LWQTHhBHf8kbX4ZMHzptrQ8LHzzndHaLkGO72w7erYayoDUco5MZ7zTS7dRAbbT
	u8EktZwBnSgh3gJe8mtQa3U2jh4+YhQfgO2+n1bn8fLxhv6ays+75msWHksYt3qlrnf1P0cvcG1
	ozklk0i3JjdRA==
X-Received: by 2002:a17:90b:37d0:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-3957f989f59mr1093695a91.10.1787096355080;
        Tue, 18 Aug 2026 16:39:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10ca5csm552871eec.17.2026.08.18.16.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 16:39:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 18 Aug 2026 16:39:13 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: Cryolitia PukNgae <cryolitia@uniontech.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: hwmon: replace full-width colon by a
 standard ASCII colon
Message-ID: <075ee43e-633f-4bd0-b752-58f2fc7ab862@roeck-us.net>
References: <20260818-doc-hwmon-remove-confusable-v2-1-c1dff1ec01cd@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260818-doc-hwmon-remove-confusable-v2-1-c1dff1ec01cd@bootlin.com>

On Tue, Aug 18, 2026 at 10:08:40AM +0200, Antonin Godard wrote:
> It prevented the pdfdocs target to complete, prompting the following
> error:
> 
>   Latexmk: ====Problematic refs and citations with line #s in .tex file:
>   Missing character: There is no ： (U+FF1A) in font DejaVu Serif/OT:script=latn;l
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Queued for 7.4.

Thanks,
Guenter
