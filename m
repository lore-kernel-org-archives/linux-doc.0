Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870911;
	b=Wf0d+3jEGOvtTMutLJLCwOn+nWuPdMTyKyXDV6vOtn+7WdQSLcYZlKe0lFblC/ZRdWb/
	 oSb05J49Ib647CayoacZXkFWiF4vSLAZjmtvd1mJ//rrMW7A1Fv88u4JHBeAJRQOY8L9E
	 lGlBXNOWkcexs02mPR8bDB+wuuWgCHhH4I6UwxVL7d4vv3W34T3FbGJc/V1E3889uuoIl
	 PKMX1QkmssWelH5M6qw9h+/IhjjhE/kCa1ilDT/1/T5GZ1UbXG6ZmcRqkO8lE5GuOUtUl
	 49t8XQ/j3uFwYnipGBNRpfDQaSN3UU9wo6wTTB7ta74H+CSsAzb+yOuOWyRH/KMXuYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870911;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=efrXWF7wn+Yhj8J3Aq0tfHDHFwNyrjWQVCM9PXFIXwo=;
	b=fl/dWb57/rZCYaR8pvfwNRtslwjYBoFzpJXTRtcr4gQE4mHxyzzLVNVDYsp86l+37u0W
	 X+xh2EFG7Uaz8csIbZJ0/WskvuqZO1a8f68TcwKM7/5hcQ01oUyp4FL6SU4nRpziObT2w
	 DJwsWyMZ1HKKOECTDOwfBrbrGChnIYdNT6vNo3rqAtyWGRSxDj0kiRaHx/enrzBwsYGCb
	 w0gVdss7K81T9fx4SBrjAQ01Lb9iAgOKslNQ/mvH7Pjf2djBEnNUHHRSb6U8ZEyeIKNx8
	 Sb4kfqmumS5Z0Mg8eP3x3KGzw46u/YWUVRDndCUhHcymRFA3pT34Ogs1kgsw9r5B6Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=RJemcz+W;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B362606A328
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 09:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B362606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=RJemcz+W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=efrX
	WF7wn+Yhj8J3Aq0tfHDHFwNyrjWQVCM9PXFIXwo=; b=RJemcz+WXW08s80sHHaG
	948hrZREnRQmmlr16e8I+wy+DF2O3faJ8F0RPLOsDMLlYKxUVppmeK3UX5Ei1mHD
	x7wxUBZNAeMr923ALvY3g+r2aoEEHvyCHL34DO2qoTW7AngkCtWAmVEeQgSAdcIL
	Ky/pjerdaFxr36FqPTrYykSoiPTDUjQIlpEVLQa3knjGZ2jlAqynEuew9AmeZ5y0
	W46LVJeseQ4YmGWKqfOpd8Wl4h8Ggmn5YkCqSL+HFUfUP5OvQwC58ayigEgS/nh8
	Es8G0vlWzAMGXGrpI16eqnhtdCyJfjFHMDxc/abYg9Eg2pPFP5v4zmPiTGQ99ynQ
	rg==
Received: (qmail 1088796 invoked from network); 5 Nov 2026 10:28:26 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Nov 2026 10:28:26 +0100
X-UD-Smtp-Session: l3s3148p1@Dr0fHoRfxurAwtcC
Date: Thu, 5 Nov 2026 11:28:25 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
Message-ID: <auxMOdmFYDYGjqa9@shikoro>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxDTdfMVS3yazCk@shikoro>
 <35983c5a-7deb-4b0e-9bd4-981754343200@oss.qualcomm.com>
 <auxHASG78dTviSz8@shikoro>
 <e1c7e287-ccc9-4705-bd72-e801ba203668@oss.qualcomm.com>
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
In-Reply-To: <e1c7e287-ccc9-4705-bd72-e801ba203668@oss.qualcomm.com>


> > Yes, if you want to spoil that, you'd need to introduce
> > 
> > 	Partly-reviewed-by: ...
> > 
> > or something.
> 
> Ack is for that, no need for a new tag, quoting:
> 
> "Acked-by.... user may not have carried out a technical review of the
> patch, yet they may be satisfied ..."

It seems you are mainly aiming about the "Ack/Rev"-distinction problem.
I don't care so much about this. I care more about the "# subpart"
problem. A list of 10 Acks without subpart is to me as useless as 10
Revs without subpart. The subparts give me the idea which parts of the
patch have been looked at in some way, at least.

> "Reviewed-by:, instead, indicates that *the patch* has been reviewed and
> found acceptable according to the Reviewer's Statement:"

So, for the SPI patch: if someone spent time and reviewed the complex
core changes, but only 2 out of dozens of drivers, this would be an Ack
according to you. I would, however, understand that this person doesn't
want to repeat the boring driver review a number of times. I'd happily
accept an:

	Reviewed-by: <hero@reviwers.org> # for the core parts

But still, the driver parts need review. We got a similar patch for I2C
and 4 drivers out of those needed some cosmetic improvements. I reviewed
that. But I did not review the changes in the dmaengine core which lead
to the driver-fixes patch.

