Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890A91E0DD8
	for <linux-doc@vger.kernel.org>; Thu,  4 Dec 2025 15:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764862246; cv=none; b=fJKpGP5h2xmTBS3dNkUahaDw8WQ+B5LrmC7a/bW1sLHwtyZEqt93vafoAVbOIbD9MsTYChrg2vTbVHDFyYig/wd1kpYM7yokTXSSpyiwIciDnSuPNAs2+V+P3k5d5X5/5vEU4jSxztwzmS2sF0xAcmk2nxnO96dB0yZ+7090muY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764862246; c=relaxed/simple;
	bh=Zm9ieslCALH/z4AjjiHUD1iIfB2/hgCbdZHjkZ+mjpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=asf88gtM+y7Qjl65qOPUdaLUCUEI2MWdOvJeAUj2lp7DTe8JtedIJtuXGvQuwE9VJ6nInIS0kOQnOQbvlU+Zh8Y/36yLLvcfkpH7TvSymzNAu8tvxELDpsMYy98tVppZaquCbi8pdepkK3ILISxGeqSwkh593972F8+U+5FntoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIpmek74; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIpmek74"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-29555b384acso11238815ad.1
        for <linux-doc@vger.kernel.org>; Thu, 04 Dec 2025 07:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764862244; x=1765467044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4eYlycY1hylOTB5YUsmJJW41uY2q4hI0Kj0UWi48gjk=;
        b=XIpmek74Xd0B78Gu4v2qCnnpgD0WUvFTbGg5TfdL1GtbGpzCTbtk9lAv5s43ivTSj7
         iaY3yLYTaw2Mo0Why5fDcmzpdA8dqO8InhRTQd6PZYNdTM+BHnhfOxxULWsguqY3pCMa
         dnMHwdX9RwAFSx7P/ngSaLdLRilOdfT1HTSjBMWkN9hmMHEAsdGV4Tfv/X+ow9QYkJGD
         omRtLRlAY0MkiOsU3dM/xDOc7guqm9bgbzNvPxdbbj5gQ2jlv2Uu6G0zmRyUuDQcR1fq
         wGlmqzENa38LMxUb9Hkf/En3tHcRjLRtsUJBFurmT9iQs5VEkfwZFj153osaqroIeWZE
         HKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764862244; x=1765467044;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4eYlycY1hylOTB5YUsmJJW41uY2q4hI0Kj0UWi48gjk=;
        b=hoDBY1E4pwN2kg7pe6KNgZtT3ppXRtOE0Deq+mKSjVrNFeH8G54b0HkoE7w2t5GpoV
         pnZAsBgN+CqgBreQ2cq4ZeldqlIfwm4FwSD3DmUGpWzy8uImNZ75+kjuYRZkQeB1NGPT
         7NC9zBvByGUXSqDY1xAVGP4arD+5WB9VwdbRrp7wwOLvqDyD+wWANbQPSoqQclsm3qpR
         QS45+mYRdrUrTfFSBf9TZnUKpcd+F2RiTjGX/PzeZ+NWJKGrB5WiM7GFXNt1refQKLJm
         KwNgw3LwuNnq4+Xw85qCApHjtP32QJQBBlSX51U1CD4lChgnpKWkZhmG+Z3gt0gcgZA7
         ecSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiD8yMhe87Z1XprxUhvcRVo3H0bmpYp/ZCVpUg8vGq858PrDmzrgt5vbxYK5vC4eynSK0g3z/qqd4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfSA2c3niMyA+hgFpDfEMgSuz5t6SiPCzvABGtPsDNZBQeDSe4
	EW54vwP8X4zksumyFamJe1fR05OV1c3Nh9QhEkn+k3W4Ir12+CZHKGE7
X-Gm-Gg: ASbGncummvZGp17mkqHE9XOQTlmBfNJUxi7sbowt66gRjCeb9fP+sgAkQTXwyqYu/X/
	mpLT+7rFVNgvo4ylsjx+xWZolhbY5BhO9BhfI6vEA4gPGi7mUMRs+bskwYFzzqpViyZVevDWWj/
	GF4O0ZkHi6MwOPZzUyPPeNIZJDApT1S4A+SqLP5ZrkXqamXh3YQBVvRdkC3ITiD3aOI0h/Tx532
	Ro4isGWAKf6Y0bv64L1S6GxTJfJ2jXSJW0IW+Y7pJk5YUKKZxR+ptsNCFF9CQ12ZHo/uBm+5vYA
	58mavJgtKI1ggcwvcl+1Nmj05L3DsV4PKJmxKG+2SR8hGbTyXtsKd/N3qU2YBCTLZrzWL6MP0oS
	E46mGpuFqjQRwUTeOva+ru1+pUZYM+NbMt50iaN3TO5Aj1ugGSNpFXhUg9FFGeeOHqDo8ZW+FcR
	2VQ+53AxKwKQ4+967fNtw=
X-Google-Smtp-Source: AGHT+IGUuxpLqmy4omgL7DayDrCXKB4XMbmLpb2m72M6WfzhzKd/lpFRyfBDddrHoUtvpi7znSaRDQ==
X-Received: by 2002:a05:7022:e98d:b0:11b:ceee:a469 with SMTP id a92af1059eb24-11df0c2fc19mr4186449c88.22.1764862243599;
        Thu, 04 Dec 2025 07:30:43 -0800 (PST)
Received: from localhost ([2804:30c:941:4500:2e30:10b5:73b0:4b74])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-11df7552211sm8769605c88.1.2025.12.04.07.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 07:30:42 -0800 (PST)
Date: Thu, 4 Dec 2025 12:32:16 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Tomas Melin <tomas.melin@vaisala.com>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, jic23@kernel.org, nuno.sa@analog.com,
	dlechner@baylibre.com, andy@kernel.org,
	Michael.Hennerich@analog.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net
Subject: Re: [PATCH v3 3/3] Docs: iio: Add AD4134
Message-ID: <aTGpgEFew2vP1CTG@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1764708608.git.marcelo.schmitt@analog.com>
 <69b230190abb4cd76ad9eb25e2bde51caaa23d9a.1764708608.git.marcelo.schmitt@analog.com>
 <19d5c51d-41f3-446a-aced-5be2fe6ec0d2@vaisala.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19d5c51d-41f3-446a-aced-5be2fe6ec0d2@vaisala.com>

On 12/03, Tomas Melin wrote:
> Hi,
> 
> On 02/12/2025 22:55, Marcelo Schmitt wrote:
> > Add initial documentation for the ad4134 IIO driver.
> 
> I wonder is there some information in here that is not readily available
> in the device datasheet? After all, isn't idea with this file to
> document peculiarities that are not easily found elsewhere?

You are correct, these docs are mostly from data sheet info.
The main idea of having the doc is to make clear what peripheral connection
schema is currently supported.
Because AD4134 is both flexible and somewhat extensible in the way it can be
connected to the host, we could have different wiring configurations, for
example

                                                              +-------------+
  +----------------------+                                    |  DATA HOST  |
  |       AD4134         |                                    |             |
  |                      |                                    |             |
  |Data interface  DOUT0 |----------------------------------->| GPI0        |
  |for ADC data    DOUT1 |----------------------------------->| GPI1        |
  |read back       DOUT2 |----------------------------------->| GPI2        |
  |                DOUT3 |----------------------------------->| GPI3        |
  |                DCLK  |<--------------+        +---------->| GPI4        |
  |                ODR   |<------------+ |        | +-------->| GPI5        |
  |                      |             | |        | | +------>| GPI6        |
  |                      |             | |        | | | +---->| GPI7        |
  | SPI interface   CS   |<-------+    | +--------|-|-|-|-----| DCLK        |
  | for register    SCLK |<-----+ |    |          | | | |     |             |
  | access          SDI  |<---+ | |    |          | | | |     | TRIGGER     |
  |                 SDO  |--+ | | |    |          | | | |     +-------------+
  +----------------------+  | | | |    +----------|-|-|-|---------+
                            | | | +---------------+ | | |
                            | | +-------------------+ | |
                            | +-----------------------+ |
                            +---------------------------+

or even with two devices [1].
[1]: https://lore.kernel.org/linux-iio/aRIIDTUR5Pyz1Rxi@debian-BULLSEYE-live-builder-AMD64/

That is not a current use case but it could be possible. I think it's likely we
will need extra software to support those cases and, when we get to that, we
would be adding more diagrams to this doc. Still, no strong opinion, we can
alternatively add the doc only when we get to those more complex cases.
I'll follow reviewers' preferences if you or anybody else express any.

Best regards,
Marcelo
