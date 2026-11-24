Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543932;
	b=ZvxrIlCJaWgDbmqxL5z+EiBLmQ8+p/chF39FU0rQ0nP+A1W8bot9lLcNwjDIVRohepOa
	 zjQUzFwpylJhkK1tPAmK/+FEaNHdKREoU7G7yq0VPjuNlrEmp6KEaQcdnNBjqQ3J/ayNK
	 4etvL/Aa08q/o57bc060xKVP46axqLW0sjjqyWMX+oyi50fTC2pDaJ1zmIcpJ8RJA3vOu
	 M5BB1fdVaXrCQ6W6lvnWRke3TcCEXnJ3nCEGU+j9qNOrxCxLHMQ7JqtvCS5MDj78Q1Vgn
	 JjqL/VV5VgnJTJGiSDmzLGkGb2K+8wkIKJ/uFoPRZmY9vhTyjpv/DoR3qJf8csejCww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543932;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=muXEpXsp4+0/5ZU311gJqIbUHfTI/heB2h0v87pFpis=;
	b=miyYKuY8pukKMRzLt+Xt+uh8VkLod0q1lqfwkuomJKWLrQFt4xFFbMepW7HdczbRlndc
	 a/MmrTSPD08TXxT0beygkK6qxAF+4zHObK2jGKNIvlTxTPnPuIwqWzcM1eW0KATD10gae
	 0MgEI+Fa2/kcSnCJmwvcbp7tyvDIv3vqEPf4rTGf0PkD5592i3p5akvLROVrgeRuOhKct
	 HXfnSw/q54A3F5pFS+3UobilgYUuJu2vII3dHLP0qeDNkxgBedlQgLn1dw8+Z6yjJmJOq
	 O4W22Ku+WiJGHTZQwvmJJ6odNIdUDr6PpxT8UjWgBPWCb1ZKztDWZ0KQdzd+GpcSkRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g4LEOWFw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B7D606A31E
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 18:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g4LEOWFw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ABC51F000D1;
	Tue, 24 Nov 2026 18:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795543931;
	bh=muXEpXsp4+0/5ZU311gJqIbUHfTI/heB2h0v87pFpis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g4LEOWFwgOkrXKXBtr09ASaitr5vcomBZoZYTSIvgOMK7bUwbW7eo8ejkH1ZZjWqQ
	 efsI9Iet39G6cQlY6qS5yCiSC3mA6I/84gCYY0IVeWFtdS0zJwekLmLCK+j9zx2FBF
	 jMih0WhgTOPWBe2dXMMIGdUdfGJudwvB71KEYBX7e6QfKD08fPPn2hVlOfD+ykfnCb
	 7H0/f+cgOX0L8KV3A7XNyzIFpq+R/Ideo9DPOVyUov8m0KkZBypm6FRi4ETPB0teb2
	 ARLke+0/GBCne0F16Mt41UCPsinAnCav3B7qGYNEAXS6V6rqqqyuNj8OskVwmMQB1l
	 WeNz43A7YxzZg==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.ams.internal (Postfix) with ESMTP id 38074198004A;
	Tue, 24 Nov 2026 13:12:04 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 24 Nov 2026 13:12:08 -0500
X-ME-Sender: <xms:c9MFa3bXPFJ3lfsLvjJCW-RqWkHQ57YNcCTlcDaLqdvzyhV9CBmLuw>
    <xme:c9MFa3PlX5XrQOAd0pvbvMUcOdWFqMpEm95RjzHZY5ihfJKrLscKJYciLvp8BPklf
    deUf4p9dveQwFvjme45dkufHKBgLOBnv_s-8fBaKYjaxbr84ug6Uwk>
X-ME-Received: <xmr:c9MFa4hERqhzd2NpktFPdCRsmzQAsN-ynRbj7QwnwqIbunpXaNOzATwbK_E>
X-ME-Proxy-Cause: dmFkZTEyEExkyyzfsHqUGry0fExPW1Jtpw47hOuK4Sgt4e32Tg9LBhxhuZTFmlGZzvoHLI
    ft0i5+sUAdxlFAmeDTZdeLPHhKHrQM4i8bv6qY+IHtbhUEl0JNpvDo/Xeta34r2bs4YDyp
    9Hl338CGNsKgKGvO/4rnRQgEnyYUgAttqm3SR9G5mF44b8PtEf0MEQjpB8Wp8TdbseAZ+a
    TZwF8ZNcWJ+uXDdfzZQBbkjKzMKqO+/uWAM7KPKZXIBkua0uzBKw0SrU0Cao0E2r8SZlEF
    ZvhwS+hyZGx6p3Uk6HyN1wct1IS8Zt1RiTmYxC2rG6rWqWKdD+IuUEbVN4v1oEurMCZnfo
    X/uQKffndMmhBtVBiMt8Fpza3T2I/3kPEyEADJpUMTo4E88rsPMyuATUIrKUGqghlLDs/h
    meSbcbcd3XfmjrZRuYT/9mGmEwoBXtUFM3G8vceUWoFNcfXkHrtK5qA80HOo/I0SuWiuWV
    uhWQWHO/gTLvWEAoNi9gOfserNsvIXU5Num5Hry8pvZ1/+kXzmkM4eMj+sJ9Ez2ClI6qv9
    lZfR02qK8vm03rQNjzvsjGDa4MlyH1hWzy0Uspd/Eyhci1vjwYsxd33B2zMolFOrlt0c73
    CXLENQ/Ck6OUqDoKMGMccfPQEzkU7S2UdKfkG/z9qqFWDZP97ZnAtKgduJ5w
X-ME-Proxy: <xmx:c9MFazeKZlZIxVPU74r1W8cehUXAUudom71-94Jq2YGjvpAEhTKE5g>
    <xmx:c9MFa9wkvxNFAInbwfCaTHKSeKTUV3NcdzINoDyCxkNiLh4DMimgzA>
    <xmx:c9MFa4ZKN13cFtpZGO26zex9eig0O4BQDa_oYdJVQpiLgj-OOOR5Ag>
    <xmx:c9MFaxpPexxjim9yYsc8Pxnm3k2tygWqWQjBx0LrTdR95eKn4CgB-A>
    <xmx:c9MFa8EBUwCi5suBDA0spCrkswB-ikT8tsixUIBrvh8YyTCYDZL4Opt0>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 13:12:02 -0500 (EST)
Date: Tue, 24 Nov 2026 18:12:01 +0000
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	james.morse@arm.com, rppt@kernel.org, arnd@arndb.de, kmehltretter@gmail.com, 
	dapeng1.mi@linux.intel.com, elver@google.com, enelsonmoore@gmail.com, bp@alien8.de, 
	jlayton@kernel.org, catalin.marinas@arm.com, sean@starlabs.systems, will@kernel.org, 
	jonathan.cameron@oss.qualcomm.com, tzungbi@kernel.org, steven.price@arm.com, chenhuacai@kernel.org, 
	tzimmermann@suse.de, wenst@chromium.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, vladimir.murzin@arm.com
Subject: Re: [PATCH] arm64: sdei: add sdei_nmi.disabled= to keep the GIC NMI
 path reachable
Message-ID: <awXQtcWmqf7c_49B@shutemov.name>
References: <20261123033222.1067923-1-ruanjinjie@huawei.com>
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
In-Reply-To: <20261123033222.1067923-1-ruanjinjie@huawei.com>

On Mon, Nov 23, 2026 at 11:32:22AM +0800, Jinjie Ruan wrote:
> While the SDEI cross-CPU NMI is active it claims every cross-CPU
> backtrace, so on a platform whose firmware exposes SDEI event 0
> the irqchip NMI path can never be used.  There is no way to opt out.
> 
> Add a boot parameter "sdei_nmi.disabled".
> 
> With sdei_nmi.disabled=1, the SDEI NMI stays registered and simply
> declines every request, so arch_trigger_cpumask_backtrace() falls
> through to its IPI path and smp_send_stop() skips its SDEI rung.

Why keep event 0 registered and enabled when the switch is on?

If sdei_nmi_init() returns before sdei_event_register(),
sdei_nmi_available stays false and both hooks already decline.

Then the flag is read only at init and can be __initdata. None of the
other hunks are needed. The check in sdei_nmi_stop_cpus() is not
reachable anyway: smp_send_stop() calls it only after sdei_nmi_active().

--
  Kiryl Shutsemau / Kirill A. Shutemov
