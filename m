Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE03620C461
	for <linux-doc@vger.kernel.org>; Sun,  4 Jan 2026 14:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767536967; cv=none; b=CkoYNrfERMuC4eVA9D82ZGM6s014b/1fJ1sw5HNswtQHd8BAQfrZAxvWEwvVGjoqBtplRmZ2+sOPBSkGXiD5EmcMG5GTLIYnPp5pc5PARfGgBk4Bscq8UzTpWz/EHI+PvOg6QDFbponf9Lgp+Qyr0P+6moEgEuyHMgYyDh54dbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767536967; c=relaxed/simple;
	bh=AjQSLSkhKZ+bvTLx1hSAwROc2sDMhOSmO656H2yHCHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AqfCwZ62HepKy566usM4gHH7ulCX3ze6v9Xm24wcbYaxRYi/gl0mt+/Qdpa832vdGpkJwOGIAcOdNiqjwtl31XMEn16W0LpoJo9RNF/acx2n6Ajz56Zr0cISjgUg5R7eTu18GZLnzCGaeGYI+K2rFMusa3FhsaWvDzY0uqNBkDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7iqIXej; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7iqIXej"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29f08b909aeso33682925ad.2
        for <linux-doc@vger.kernel.org>; Sun, 04 Jan 2026 06:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767536965; x=1768141765; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AjQSLSkhKZ+bvTLx1hSAwROc2sDMhOSmO656H2yHCHQ=;
        b=A7iqIXejTbFc9VuEhiJ/wqNXz4td4jMCEUwoxevh/CTIRLkfbv2Rtya4Z6GhTxhjgj
         vFSij3McJgCHp/21utK9dC9iY7rO0sAXzGl3yCuujctTv5Fguf9k979AAcWIsHWFT7Uz
         +SF4KmTj7O1WjyAPFF2uCJXqGZic5Mn7w2516Xa3n1X391ruVu9R/Zg9eudi/wqwLvix
         Xyy3hy6XYeS5uursOZ+u7iDL3cqqw/SK3NTG+PRkeKEhhzQBztCAIL+6yGqU/OKeq8bT
         GaPuEZN15Qsqgdg8P1tSumfGt1PIKJPV65mpnJsJlvgaxihsFLhIEkHySlLqsJdqo2Pg
         d+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767536965; x=1768141765;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AjQSLSkhKZ+bvTLx1hSAwROc2sDMhOSmO656H2yHCHQ=;
        b=ugRGasRP4j8WCflAbtCsrIXWFpPZ9XX4CTuNe7ylWIiJcNZxpUnMXiRLGfj1IAxX7L
         IPkELn/iUl+e1hTMVminyfNq8JO1JEySFnQ9cR72c+6gTAifo9wEAeTPZ9nLiaiA2tdO
         9RJ0JR5Q4wXIlPEacE+C4fHLbNjSQZjl5OGMdQJsSBLgRp/x5NAO9PLsxOLOO39Tc7SI
         M9WE1oiVv9UqYmKSsyFGycJoJs/lmYTPP9G/bTSU08ptnBZm67DmnaJw3ObyKLTs7buN
         gJY2Sd1pdSPk+cdHRHIzGsD3A1W+03R+J+EqUkDV260Zxo6gt7zpn5IiRb6G0VxvdGpg
         BUKg==
X-Gm-Message-State: AOJu0YxtfKxDGehhOAKglxKipLzXagXSNiQO40OzRcQrmbygdM1yaPYS
	OSd6TCBXzTl7DadQYZpDOdgIC4702EeQWEJXtj9hcR9fBtNoEx/hdYUv
X-Gm-Gg: AY/fxX7eBNlVbaMZrELXI00smyn7596zrg2c3ugKd89NyBTVFy8N3DnkI7/WKAkq5Jz
	mHz73AjzuelC0UA8EdpaDJVNtvn/eea92la6SbjPnyBqsMSqVZhd2rbuwUmkCeszLr0lD3XR4rL
	1KWMWRBc0ZBpE9Bzs3N1u0VvRiNMf9pMRC8tvRJIX9yICOS/E5jPsJBLeygIxnJtV8iPwyoz/uj
	ykm5s3pM5Itrw4ZieRYoJmw21R9N9uzYtInjTwoymxHgS2YY1A9hRRObS20GetCWHDvhffJqLHf
	ouF1CrOmB6JqQ78BeA6oy2uL+tbPdRciWCLFxDhu6fUrgUthRS/6JUaJe4kGemr67Z3/pMKVWEo
	XmUgU4JneOh/I5pVDUzWdNDo4TUbupi13g1qPkpAmX7WzYDZXdiif1ggHYMwcUVLzMidch/8CXf
	C4gJ8MqzdRkg==
X-Google-Smtp-Source: AGHT+IG84RJMOf0NHVxnZY9sQbUGSKA/hXCdMZG70OGVSthIktHH1ec+R+wut64RsYAe6EzqINNFHg==
X-Received: by 2002:a17:90b:4d8e:b0:343:e480:49f1 with SMTP id 98e67ed59e1d1-34e921c4431mr31022176a91.5.1767536965242;
        Sun, 04 Jan 2026 06:29:25 -0800 (PST)
Received: from elitemini ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f4751d783sm3829673a91.0.2026.01.04.06.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 06:29:24 -0800 (PST)
Date: Sun, 4 Jan 2026 23:29:20 +0900
From: Masaharu Noguchi <nogunix@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 2/2] docs/ja_JP: fix translation of freestanding C
 environment
Message-ID: <aVp5QKqo7jVYF27N@elitemini>
References: <20260104-ja-howto-v1-0-53e5564a47d9@gmail.com>
 <20260104-ja-howto-v1-2-53e5564a47d9@gmail.com>
 <fcd7fc75-2f56-475e-880b-f8a9edfe9db0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fcd7fc75-2f56-475e-880b-f8a9edfe9db0@gmail.com>

Thanks for the suggestion. I agree, and I’ve adopted 「自立した C 環境」 in v2:

https://lore.kernel.org/lkml/20260104-ja-howto-v2-0-8cac525b3dfe@gmail.com

Best regards,
Masaharu Noguchi
