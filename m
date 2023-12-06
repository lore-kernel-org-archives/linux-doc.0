Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA4210E1;
	Wed,  6 Dec 2023 01:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ar0vZZ3n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA41C433C7;
	Wed,  6 Dec 2023 01:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701826467;
	bh=0Ub3inJ2wgHo/fdvl0F3hZsMohV02nkHk6UaI4SB4/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ar0vZZ3nLb7DBySAUwolloKk5Xw9saEMq7hdktaeXLUvQfVOFZAgNieRCGBL0P3sH
	 rxmVD82+GfZLYwBuxGuRt01Xb5yOVy6cE3OlBqAVq2lzuZqTeYbUh/LRFnCPIQmMl5
	 qMxzmv7iUoJU2bdH2M1ULNstq6wvxOuiXrIPaKjLeMgJNHV/rC9SzU450/WDm268pJ
	 O5R57By5mgBDcPQnN2tV5AKnCeCJBbMjTztYFN1x6lx6t1ILtGlDELarRkzNqw1YAR
	 d+gR0Yw0wiFmpu18Ls3Irwdx0/qjIQFb14FhNfyMAENPUh/UzImTd8jOXmj0lc9Wua
	 hWfijEUUzhqSg==
Date: Wed, 6 Dec 2023 09:34:21 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: frank.li@nxp.com, corbet@lwn.net, s.hauer@pengutronix.de,
	kernel@pengutronix.de, will@kernel.org, mark.rutland@arm.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	festevam@gmail.com, conor+dt@kernel.org, linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: imx8dxl-ss-ddr: change ddr_pmu0
 compatible
Message-ID: <20231206013421.GZ236001@dragon>
References: <20231120093317.2652866-1-xu.yang_2@nxp.com>
 <20231120093317.2652866-5-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120093317.2652866-5-xu.yang_2@nxp.com>

On Mon, Nov 20, 2023 at 05:33:17PM +0800, Xu Yang wrote:
> i.MX8DXL's ddr pmu has port/channel filter capabilities, but it still is
> compatible with "fsl,imx8-ddr-pmu". This will change the compatible.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Applied, thanks!
