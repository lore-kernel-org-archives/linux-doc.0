Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D814135DA67;
	Thu, 30 Jul 2026 15:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785426242; cv=none; b=E34QwTNsdGwCEzdrrEnuua2CbvPdF9x1tGvAm0neCjvhKy+QvTD7o3JaWvULCmUZgMF+FCGNouNVJrTBcRsD/uyIHju2L5/X2YJ7Qj+Sxpkp5qXw+w10WFe8OrMfRtt7NhGothhk3IYWeddRVfSvUQ7DUSYnWK2magO+Ki9fJ9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785426242; c=relaxed/simple;
	bh=wZU+L2ZShZz8yrwW9RrEUc7MDwr+ETWf3JSG7T9eDdk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=pWlhGLfoxzqAKoBEIYwfzizwYDqf/dKQ4dx7oXVP9bjc9ItR9MQMZtE7mO3zllicpCpCCDh/HMs2mWwIosldOhM2G7aof3wtokwJBWGMIClm1Xs8MuWns2XGl1qqq2yo+Fll2DMkFBOiM5e6foMPyAp47Ct7GqlfJemGAb6urEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ju6VC6Fq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IeicST7F; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ju6VC6Fq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IeicST7F"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0EB61140010D;
	Thu, 30 Jul 2026 11:44:00 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 30 Jul 2026 11:44:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785426240;
	 x=1785512640; bh=WI4LNu/7fUEYKhtFW6YxSGKyrKoHt8lPVWmkwnHy/Fw=; b=
	ju6VC6FqnrtzlDpCMZSvRulcCTZ8fEcFnLGnwZ1nEK/NzaRfstYri+NRmOU9gejv
	INYxYTouA23Ad6G6EnmdMDwz/Mqn+x/DZNGLE3Crn5X79WjwcrfyaPLxItiVdeCU
	WUE0xcJ+dSQ+igLUX06VsEbDWW4KpVkFK8wqYNdFfgi2IVZyqsJ5x2inMZmqs+J9
	HQyRQTgMCE7QVTuDnH+SUqnJC3vhMa+kCVKs2pLwBCPyA4GlJRXVWocXcgHGulx8
	7OFFy39iyRGb5lcIzHzAMk5qDWQnxCRQzjJPFoejO80r3qaVnxxTfshHxypt9+u1
	GalwEL7l6Jdk6UzarfIPZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785426240; x=
	1785512640; bh=WI4LNu/7fUEYKhtFW6YxSGKyrKoHt8lPVWmkwnHy/Fw=; b=I
	eicST7FSJQU8Has4QnTLknHHjT4h0q7iBii+oFrb0LRzVQOSChCjMI2YNZn8Lh9W
	yFPXoSY7PZKPBtRHylC55GRKVrdLQjIuyogknewP4LuNuP8UBogscuk4EDrhV9IO
	u+03hPiXJOQVqckl4KKIM+8OPu+JPx69wjL3RYI/yaTWzScondg4mzRJjNs3qmPi
	LVX3dgSVIuE+jC6otiZocIjm0thMNhUk3CxvEVcXcUmhLLm79TR4z73ItUYWq8LO
	J6FS+NAx6G7zvF8QsTcNIv6+Xq+zpujoaOyasZbizLdbdQfhY5n7g8n28/X8xtKY
	GBqjbdDNnfD0KBAK+G6JQ==
X-ME-Sender: <xms:P3FraiBKATeEkyqFTk6BhOj052h1NLVC1f99bv8lvV0pBFEPP7AFeQ>
    <xme:P3FranUjNIVdvKV1VzZqWIfLhZtPd2sFZOYL0izAvj6NRy3xLmpPoYv-43dIXRONv
    5PSRprp71ppytJQ9aPvxOv_-oJxbfNMOafZCt-DTsJ2Pa0nvlClIumo>
X-ME-Proxy-Cause: dmFkZTF2+A2jcsRJ1XyhmepzxdHT3REtmBQXKg9QnXjQj+yI9k0wFI0r2EYrtVDowJvBdo
    LB/dVRIldbX2THKggxWeqL0eoptDMjEDxIl/kTwJUXsedg/PctNhnwpKScN7HDmipNRpEU
    7nb+2v/iRIohNO+Rbj0Wf0Ll+IozQh4dfUm2PM/bub9JGu27UvQtPgsweUhmWbSNMlYE7e
    yBaqanbLePkAQyPtgqdfOLP8+P/XvblhC4Qrg0Eof7gOzErFuAe01tq9uFC5V7xdUzRgqO
    dd5vmhMDawjX+JDoJVY4BIQpLZDU8NC4scJG5zFN+EXP2KfjBgrE5qgQg5sF3h0bEX1KuD
    5GomjswBONoCFyDX4O8O8a4nBErgEGeODLQxKByMZNUK1fbPYOOQY1ystENX3a95rXKfif
    Zj5zuQW0qQUaL4TbIBbdDtswLP4sTqTVvoDU4wJUVKB1RKetILZPxdkoaqSWb/bNvSr86+
    ZPPrfiYVzdW1Rwz/L4Y6B3FFPrBHtk/RRgbn+4cmHCIJ2TmBsVLAJaD7quDMqBTD2+qmRU
    NAQXKFbJ4CQP3bQaAdv2Q3ROhdwVd24dcs7LWiYI+bkeOTxBhb8XRkYn0jNatyPVg2BAvu
    2rBQbjEO90x6SDcVvenKCbG55XO4k98XrqBmJRYn9u/TDj7Qo/FmuVAO66Xg
X-ME-Proxy: <xmx:P3Franv-M92isMROPBnJ108qnUkdWxo0Qwc_gjDcwvwNwxG8sjC-hg>
    <xmx:P3FraudTLAKoLqaYawEU1458YmAVisMN1Pf0h1H2UvFhHfjeiWpEiA>
    <xmx:P3Fralms9f74GQaEpU5e9lSlpra8JmbPEPlRmWM9w0s9DYDfbZACjQ>
    <xmx:P3FrapBo8Bl5ubUNAc6d6vATb4IouOPYzMFxctGHRonihQ7BaI6spg>
    <xmx:QHFrapHFhJMYfJeaQjRUxUqxd8XE2KFzFBTCgbfHG71AstCK-HcaU_u7>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B707D182007E; Thu, 30 Jul 2026 11:43:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AHOvGHbUHvkw
Date: Thu, 30 Jul 2026 17:43:29 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexander Graf" <graf@amazon.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jonathan Corbet" <corbet@lwn.net>
Cc: "The AWS Nitro Enclaves Team" <aws-nitro-enclaves-devel@amazon.com>,
 "Shuah Khan" <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, mancio@amazon.com, diapop@amazon.com,
 mknaust@amazon.com
Message-Id: <421d4cb5-77ab-4d36-aa61-64d4f536cc81@app.fastmail.com>
In-Reply-To: <20260730125312.71415-1-graf@amazon.com>
References: <20260730125312.71415-1-graf@amazon.com>
Subject: Re: [PATCH 0/8] nitro_enclaves: Support multi-NUMA CPU pools and per-node
 allocation
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jul 30, 2026, at 14:53, Alexander Graf wrote:

Hi Alex

> I picked a per-fd target over a second NE_ADD_VCPU carrying the node on
> every call. NE_ADD_VCPU already reports the id it chose, so a VMM
> spreading an enclave over several nodes needs no new call, only the
> target and the count it already drains; the variant would make that
> same VMM learn a new ioctl for behaviour it already has.

I had to read this three times to understand what you are trying
to say, but still don't know why you picked one over the other.

> I wrote this series with an AI coding assistant, which drafted the code
> and the changelogs, this cover letter included; I reviewed and reworked
> all of it before sending, and each commit carries an Assisted-by:
> trailer. All eight commits were built detached in three configurations
> (x86_64 defconfig with CONFIG_NITRO_ENCLAVES=m, the same with
> CONFIG_NUMA=n, and allmodconfig) for 24 warning-free driver builds, and
> scripts/checkpatch.pl --strict is clean on all eight.

The patches look fine to me overall, I only have some very minor
comments on them. The autogenerated changelogs seem actively
counterproductive though, despite your attempts to to rewrite
them into something readable. This seems to have just made the
series harder to review. Instead of telling the reader a
consistent story about what each change is for, the generated
text has too much useless detail about the implementation.

     Arnd
