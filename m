Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D2D68E8B;
	Tue,  5 Dec 2023 15:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ix49uvV8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BDD2C433CB;
	Tue,  5 Dec 2023 15:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701789432;
	bh=WxBLNu98B1cLwePPURJz8e+EQWq5ivagn8IAmvjaT3Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ix49uvV8oLKxiIEprFaWOAde/iQBJKopyRhqC8e3Oeq7vo9/0533Ykgobh4dvgXw1
	 Yh4TW0z3zHD9+AbWCSNbtFKev35vnrVBDZ+yNRSrHmbm3ET2f4HAbEFq5YBVdqz0B+
	 7Xc01gdnidPQlbbEiI58lTcwhIuhvODKLnGmXEjBlicoQS87Urhw2EZSDBduSyW80z
	 OOaZ/UyD7hb/9swK83N4omotpvJ8iNMAintAQ73somh10nxvAd0DtUOYxdb/Xi4+Ap
	 SvYXSOlx/Jc2q9GmaXiKoIhvQE7hGWgl6lHBU/ldgZv12feL26iK8koECfAGqQxdA4
	 3MDGGcGfz+30g==
From: Will Deacon <will@kernel.org>
To: s.hauer@pengutronix.de,
	mark.rutland@arm.com,
	corbet@lwn.net,
	Xu Yang <xu.yang_2@nxp.com>,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	kernel@pengutronix.de,
	shawnguo@kernel.org,
	frank.li@nxp.com
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-doc@vger.kernel.org,
	festevam@gmail.com,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v3 1/5] perf: fsl_imx8_ddr: Add AXI ID PORT CHANNEL filter support
Date: Tue,  5 Dec 2023 15:16:38 +0000
Message-Id: <170178552961.2948567.1593321424507215483.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20231120093317.2652866-1-xu.yang_2@nxp.com>
References: <20231120093317.2652866-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 20 Nov 2023 17:33:13 +0800, Xu Yang wrote:
> This is the extension of AXI ID filter.
> 
> Filter is defined with 2 configuration registers per counter 1-3 (counter
> 0 is not used for filtering and lacks these registers).
> * Counter N MASK COMP register - AXI_ID and AXI_MASKING.
> * Counter N MUX CNTL register - AXI CHANNEL and AXI PORT.
>   -- 0: address channel
>   -- 1: data channel
> 
> [...]

Applied first four patches to will (for-next/perf), thanks!

[1/5] perf: fsl_imx8_ddr: Add AXI ID PORT CHANNEL filter support
      https://git.kernel.org/will/c/afd83967e7bb
[2/5] docs/perf: Add explanation for DDR_CAP_AXI_ID_PORT_CHANNEL_FILTER quirk
      https://git.kernel.org/will/c/9745295358f4
[3/5] dt-bindings: perf: fsl-imx-ddr: Add i.MX8DXL compatible
      https://git.kernel.org/will/c/2fe44e7dcb86
[4/5] perf: fsl_imx8_ddr: Add driver support for i.MX8DXL DDR Perf
      https://git.kernel.org/will/c/46fe448ec3b7

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
