Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868625;
	b=LaV5jcgbxZ13F8m0ojSDEy5f/CDYpVMJ/VFGyo4qF2QU1bmuzzRgkqSo5/1xwV2anzt6
	 eDlgdpvm9Um/ezEWKns1jwSQiMXVeeUBffzCHWYXHqLY2D+ow44ho1PJmpwxYhGV6pCFc
	 vgxzHrvpP1AMauecjIip54bvDAjS2EUn+i5rJwsSY+nOmj1rm3MKuuN/J7wOE0wVvZ7QQ
	 mNLo2fURgl20epY+nT1iyeA3L+iU+fYGVYYgOIs33doa+RIe+mj4BMpp6LlFr8g6fJ+w+
	 xd1WjLz2uYKBY1GFrL6mHIxtEP3e4/JWE7FTBeNQ9ZASUTnLnxB/Q3W4n8XN4Fm7lDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868625;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=i09FKaWoTqtKsFXZIJxb/id6UZzTo17qjziWu87IOTI=;
	b=MPA8tdTCbWtOogPq1UYNuR70cCJYiuyjYwlbb6NsU5WMJHmt5HWAhVnUwAVB3bS0zcsh
	 mtqCBN+UOU2KyqkaQv//niAisVQzD/RDEPcOjSPPFV93KPVDGtbDm3xNbXNdfELUfS5xB
	 0w7LUP+XFOi2e7WZdQTF5nneusWQz2hf0buE4bJzQextziFM7xFnsFHfBR88piTGYwanC
	 BBBhOswG/oKlbYO+JuMVFLnNyZTSIiwjxZinBglTyGOQU2M8ZFBtmEGGBfZswl9KUOi84
	 ieLnzK9rQeKwP7PC1m/d02+l0S8uxLZvOM0HK79u9kNjZM5b1VrSBwQBw639Iyav4hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=BSuAcfX0;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE211606A328
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 08:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE211606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=BSuAcfX0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=i09F
	KaWoTqtKsFXZIJxb/id6UZzTo17qjziWu87IOTI=; b=BSuAcfX0CNLkKQs4idDV
	9bc6Kj4bL1r9/LHXlpPoDPeFZRhlnv2TmWBsLltrIY4fhrJw6xfyRPKNSk54SBT/
	FJnSasVB+LNWDxWJ8C+1M4Fa4NdaedAuWTQyCNKBmiVQGc2nvJgiG9RAdEHlDPBD
	ydR8t1n8vrVv7yLuYqcp+07XmspQO2ADP2suN5qxp6tfAh/Y3FtLygWuYij+Oy23
	0B+b7rGJndz8IxmkfUPVZPsuXy9qV7rFdwkV9Flc3mFbUWKS31d3bN/++InbHBqX
	7cYcp9TDygZCKByg2LDy3aFlEtJkWz4/+SXMuvZxIYGGLdSCILFATg35IEkYTIjQ
	jA==
Received: (qmail 1073366 invoked from network); 5 Nov 2026 09:50:22 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Nov 2026 09:50:22 +0100
X-UD-Smtp-Session: l3s3148p1@O3b4lYNfeq/AwtcC
Date: Thu, 5 Nov 2026 10:50:21 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
Message-ID: <auxDTdfMVS3yazCk@shikoro>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>


> +If the reviewer checks only a piece of the patch, leaving the rest unreviewed,
> +then more appropriate is Acked-by tag or adding a "# subpart-name" marker

"... is an Acked-by ..."?

> +after the Reviewed-by tag:
> +
> +	Reviewed-by: I Did Not Read Everything <foo@example.org> # bar, baz

How about being more specific?

 +	Reviewed-by: Driver X author <foo@example.org> # for Driver X

TBH, I think the above is even better than a generic "Acked-by" which is
basically "Yeah, I didn't look in detail but the general approach looks
fine". Which is not what the above says. The above says: "I didn't check
the general approach, but assuming it is okay, the changes to my driver
are correct". If I get a couple of those, then I know which parts have
been reviewed and which have not. A list of generic Acked-bys will not
provide that information. So, actually, I think even the Acked-by should
have the "# subpart name" once only a part of the patch has been looked
at. Ack/Rev is then describing the thoroughness of that look.

Do you get what I mean?

