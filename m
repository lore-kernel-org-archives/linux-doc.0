Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8CC1917F1;
	Thu, 15 Jan 2026 00:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768437577; cv=none; b=OyNHLiDicBiVHYEuA00e+QRDXByZrp+9ysl4L7781HTSHn6T+kgoTfV9AQnYXP53zCop47kHq5S2qX9Azf3fHsUzGB5FMEdizwG9mug6pfLmB9gZSxNQcdwKdsMx414e0fbW36FbCI+bzHHZECNmK0y3A89KYlCaOKYKQ2nKGwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768437577; c=relaxed/simple;
	bh=NK6H6hJtfATaruOaMMeAo/X/tsh1ZpMFyB+26JRS3EU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntefvVAwpBif832y40BUm0tMvc/wmNw9d+J8RFW2zPePaWDy4q/Q05jm44KrYJwOH/PpcF3KgAJxGHY4XVu6fotTVzYh8DWhKTzt8aFk0Z4Cv+MqhTUBK0h8B+Jag2O/EL2uiUYhJy7iT2mzY7fvW+n3dd9uSIYxQB5f7UA2NvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 36B89340FC6;
	Thu, 15 Jan 2026 00:39:32 +0000 (UTC)
Date: Thu, 15 Jan 2026 08:39:29 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 4/4] riscv: dts: spacemit: k1: Add "b" ISA extension
Message-ID: <20260115003929-GYA33650@gentoo.org>
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
 <20260115-adding-b-dtsi-v2-4-254dd61cf947@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-adding-b-dtsi-v2-4-254dd61cf947@riscstar.com>

Hi Guodong,

On 07:19 Thu 15 Jan     , Guodong Xu wrote:
> "b" is ratified (Apr/2024) much later than its components zba/zbb/zbs
> (Jun/2021). With "b" added into riscv/extensions.yaml, a dependency
> checking rule is now enforced, which requires that when zba, zbb, and zbs
> are all specified, "b" must be added as well. Failing to do this will
> cause dtbs_check schema check warnings.
> 
> According to uabi.rst, as a single-letter extension, "b" should be added
> after "c" in canonical order.
> 
> Update k1.dtsi to conform to this rule.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

Reviewed-by: Yixun Lan <dlan@gentoo.org>

-- 
Yixun Lan (dlan)
