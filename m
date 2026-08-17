Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4A647125F
	for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 21:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787000563; cv=none; b=kKA7qlU9VjaZiiPbBYA2lBoxp4tdU2MZiNnCWrx4eBGVjtNweUZb1g6H7Ignrq1RF/u9H8A3yTEaZMojuQvw/1AHURyjaf5wSRTvI2yeaUnQaKUIC3EVDev8XCospVNTID69udJm2wSNKNFljq0KKgdJaqV1kY4+cqkrW+UKKjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787000563; c=relaxed/simple;
	bh=OBF4nRNWRkXeGvYZgQo5/rE99ZlB0dZCjPG6K+A5+9o=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPyJdJv7yCIDhpvWHVJojVR/uOcuCB5tkkrrh2gQv97BQMzOYC4g+Gxt4yNZpES7q7fcbtG84LMq05OMSHvlJ8T3bLuYUUEUWQkCyDCHXLvI7j0knUesY2g5Qyfvp4W3lv5d/inN0Mwi5aJtKRPCG5+z11VETxmHz9UMbURjRwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUGc8WLw; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUGc8WLw"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4980dc26022so39363125e9.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 14:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787000560; x=1787605360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YsdJSQ5fYAT9wBvdQXX0+jSKWG1ZCV+4ju+rZFixoe4=;
        b=dUGc8WLwtjvazkOoF1yo+1IiQ01uJQWBdJne6fmCMi6VB6JzO1nUjqaSYPhqUdLsTt
         798JAwuKNy6Vjaj4fDWKIJDeNfkYLGsltIbRic1Hv1tvQzyqHZktNzb5mAL9KUetTjdM
         GyKNX0dgJGHvBAAu6lSo6ngDxW5SgC7EXLwRoppX9la+1ObVvCoqxJxKYta6d02JpA43
         BBUf5z85reOAB2CcIMTx7BkkIILFQ3emovVLokjp+YT8irdGNj2Trm3zGL0Q283HmdDR
         IVwtr/OCmL9LLWk69AtQ6EEqWUqpRUUfH7WkyXwy0hfQE3p9UzppQeEUqy6K8jX9zVqK
         9qMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787000560; x=1787605360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YsdJSQ5fYAT9wBvdQXX0+jSKWG1ZCV+4ju+rZFixoe4=;
        b=YLtKSKoTKjytx95kUJOy0n+EbuDHLEXpnQYwxXJrE+9atu6Hw91Qn7E1nNMU1gAZZ8
         4k6RuODYCORt+4hOAlEtZdZzKHOi2sV4zgOFXXouWZy+IWw69NjL/2pKu4GSOH+T0bqC
         U2dBzKIK1Vd0RfGshKOTPWbrpCljZRB5KSCaq/2N5yzx9QcoqROihZVzwId/kSVwum5k
         a8TsLQDa2kSg/9zcnUoV9fnXdyIxVgtJDtfGM2+htbYPn5qOeJeRoIDrIAKrF9AUUxj+
         uXMR9+gAqOgjSJHwnqRe+LZrGZehLkQblDIMdjARKn11OzwzlSNCxOaQA4Ir3Dk4WVgo
         EHyw==
X-Forwarded-Encrypted: i=1; AHgh+RoN6yC/Rnz6I5Bnv9Wgf6fNki6voJdANVnQTNOd2qIK6qVmc4AK9R0cNxJXXauFJ1h6kKHh1eXlzrw=@vger.kernel.org
X-Gm-Message-State: AOJu0YztkvneOF4uB+zb/DBhPf7TcN1ukPYPVlUxd89nXw7k2MT7bMF8
	lBkgmkie068RBtR0ZpAleMKU5gGmPUvRY3cBbvFNO5PCkjlpRYdFWkcW
X-Gm-Gg: AR+sD10HJJsSwxlF6ulC1+MmTZt7WpqmC8TGYgV6hrzaZaiE0ox8fz4ZoC+OaqJNrLL
	cv9HlnCEaJTxGZGokA72gQUbxgGnJ/K+b5FNQS8frrA4hb/8UPYfbqXJOjO1oghKS54X2kSpTsY
	HHHY3XzQeVSsQyDrJK94Odg8gbZRCYwUFQozdmDyvUwLMtNcD78NfpmoklFmNYCe0mkZMu0LcSu
	QkcR9NJj5MwakuKHkXqaOkxnB4rAAf43HTd3v94H7T3DBLzPnwMBM2TH8xZVpfZSel2YAz/D6Xc
	fNPxGMj0VM9NjnvHEoVReeCdOZ/K+p3MtatewfM7HePYKK9Y2xrjL1cl9IMVsS+soHKHtfUnyYn
	nwMiMeMEWKJetTL3LQlwotfE3eO5BBBmZxSoY5lcNy3VSeerri6yKb/Z9mlnNMVJ3OqT3YtU1pm
	E/ISqa2fffOEozCJnJqcTFVRZ1eYY1/DEKGeQpiMmnjuxqOORoO6+8O9O88oH5pP8938C3zdHQM
	31WMGW11QwY4Iqx8kKZRxbr+MqMsDw=
X-Received: by 2002:a05:600c:8209:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-4998796f497mr470360865e9.13.1787000560141;
        Mon, 17 Aug 2026 14:02:40 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-21-27-15.retail.telecomitalia.it. [87.21.27.15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b81748sm7050409f8f.37.2026.08.17.14.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:02:39 -0700 (PDT)
Message-ID: <6a8376ef.be1895d6.92f57.c9dd@mx.google.com>
X-Google-Original-Message-ID: <aoN2606mlY7pWZ-X@Ansuel-XPS.>
Date: Mon, 17 Aug 2026 23:02:36 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH v14 00/12] net: pcs: Introduce support for fwnode PCS
References: <20260813083536.970196-1-ansuelsmth@gmail.com>
 <20260817134727.1f76d6dd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817134727.1f76d6dd@kernel.org>

On Mon, Aug 17, 2026 at 01:47:27PM -0700, Jakub Kicinski wrote:
> On Thu, 13 Aug 2026 10:35:05 +0200 Christian Marangi wrote:
> > This series introduce a most awaited feature that is correctly
> > provide PCS with fwnode without having to use specific export symbol
> > and additional handling of PCS in phylink.
> > 
> > At times there were 2 different implementation (this and the one
> > from Sean) but Sean agreed that this can be picked and used in favor
> > of his implementation as long as his case with race condition is
> > correctly handled.
> 
> Coccicheck says:
> 
>   drivers/net/phy/phylink.c:1039:31-34:
>     ERROR: invalid reference to the index variable of the iterator on line 1028
> 
>   drivers/net/phy/phylink.c:1364:26-29:
>     ERROR: invalid reference to the index variable of the iterator on line 1346
> 
>   drivers/net/phy/phylink.c:582:7-10:
>     ERROR: invalid reference to the index variable of the iterator on line 569
> 
> I vaguely recall that you're supposed to make a copy of the pointer,
> not just add a "found" boolean. Dunno if it ever happened but Linus
> was trying to make the list iterators override the pointer on exit.

Oh! I wasn't aware of this intention... I have seen lots of pattern where
the last value of the iterator was directly used (if detected valid)

It's and easy fix... I can send a new revision right away if you want,
I'm already on it fixing this in the meantime.

-- 
	Ansuel
