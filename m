Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015690;
	b=WogzPp7vuMwaCrjvlg5/79EK/YS8mgLG1oI/oiitNu4iotf9c3pRrNQkIWJ1RvZlPFaq
	 KCuYLIwIrtr77Dy3AuTteXj3narj/HzLzC5+FCuY2+mwjfVGZPyWBrtlr3GGE6Q6GYH6A
	 dUwqpTSg5UJKDt9OaWZmrl7ACyejhGjJOEXv+XmuUJ78t0aQ1HhfoCmtxZDBalc/F6F1d
	 7NVlTjQKk8jTLwFBbWOHTbrObuORrkbXa/Rm9vLs9cJUow+LwGeUDISVW9Oy25dwuLUMl
	 VcAodGH9Sln5Sgxw+x9/n4UcLwMXhcIDmeNPkj90K94FyCtLx4+znPH31p2B/STVpJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015690;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=612t0HLU+rW2P9Yzb/9+MoY1BFn31OfDqj8snJVcSFQ=;
	b=uER8dCybZ2ha15V4TDckwDk43N4kS3IsQj08yuK3hdgddwd5L9p6e2ikKRKpv1zqGFhf
	 ViLEoyziu9TRi1q4PXMiuIn+5Ktlt1yJUVVytM8mYDzN8sFyzkWOzlrZJuaJdkFMAxkLd
	 NWvkjTpUNkJl+XY0+Dc/QpmAJtony8Lc424K8Lpv0jydpQ42DZsKGec8bkrDRsdRGg6Ye
	 Mht2pUxUOMatxrXVlv/k5sNFA+PnP103CAQ7NiLyOjh9CLgnUaO+jdnVTsCW9qdPGE41j
	 j/nzZOJ79Xen7HMgkGDAytzBhnNBkNKvIrfp2IzuVM10ntpfIlL0+W4/3DHybdN0uoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C6WWCt5d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F78F606A31C;
	Wed, 18 Nov 2026 15:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C6WWCt5d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8521D1F000C5;
	Wed, 18 Nov 2026 15:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795015690;
	bh=612t0HLU+rW2P9Yzb/9+MoY1BFn31OfDqj8snJVcSFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C6WWCt5dN0/cGdt8InLKKSoFRd9kHbO+Qb/kaoFuD7R3UCeSxCTta3c+RwA+a5f/d
	 HB0vsS0L/9NBBSkPp2j4QyvOMLVyLdjASlxIPT8IgIT2sxaYLFu0OYvAJexxuUtyKr
	 X6nsWuZxSGJ6fXEedbkQ3Q4UdCEAm9UcipFF1GCXBnLAhfECYMET8yAM5V3lE4a6kx
	 k+0tO0PeoiwlWMBCKU2FkAoA5QHDEd27jGlX/tIFq0rwR41yTfi71Ib7gj4cBQbzZ+
	 +Fw293JvinKEWrR+e54eQbmXURWiePbSb74oCAGfUoqP5LPNdf1neN9okdt9Rq93eU
	 kN6kuRt7uw7yA==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Gabriel Whigham <gabewhigham@gmail.com>,
	Will Deacon <will@kernel.org>,
	Kiryl Shutsemau <kas@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	linux-doc@vger.kernel.org,
	hang.suan.wang@altera.com
Cc: dinguyen@kernel.org,
	muhammad.nazim.amirul.nazle.asmade@altera.com,
	tze.yee.ng@altera.com,
	chee.nouk.phoon@altera.com,
	genevieve.chan@altera.com,
	adrian.ho.yin.ng@altera.com
Subject: Re: [PATCH v9 0/3] Add Altera SoCFPGA Crypto Service (FCS) driver
Date: Wed, 18 Nov 2026 09:27:46 -0600
Message-ID: <179492434088.3111216.6016447945055810112.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
In-Reply-To: <cover.1793895849.git.hang.suan.wang@altera.com>
References: <cover.1793895849.git.hang.suan.wang@altera.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 05 Nov 2026 09:17:09 -0800, hang.suan.wang@altera.com wrote:
> This series adds Linux support for one of the Altera SoCFPGA Crypto Service
> (FCS): Secure Data Object Service (SDOS). SDOS is an Altera-proprietary
> service that seals and unseals arbitrary application data. FCS is a
> runtime cryptographic interface provided by the Secure Device Manager
> (SDM).
> 
> The SDM is the hardware security controller in Altera SoCFPGA devices. Host
> software reaches it through the existing stratix10-svc mailbox, which uses
> Arm Trusted Firmware SIP SMC calls. This series does not expose the rest of
> FCS (RNG, AES, SHA, key management, and so on).
> 
> [...]

Applied, thanks!

[1/3] firmware: stratix10-svc: increase args array
      commit: 71a5f8548729bcdc37cce69c022bccb34a67c116
[2/3] firmware: stratix10-svc: add FCS crypto-service commands for Agilex 5
      commit: cfafd39ef0ef09b33a06cb9564f210b3a113197d
[3/3] firmware: socfpga-fcs: add Altera SoCFPGA FCS driver with SDOS feature
      commit: c5548ffea1db1b77756145bfbbb7839edf0576ff

Best regards,
-- 
Dinh Nguyen <dinguyen@kernel.org>
