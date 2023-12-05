Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4901E68E8B
	for <linux-doc@vger.kernel.org>; Tue,  5 Dec 2023 15:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bw9LE1Wa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC45C433CA;
	Tue,  5 Dec 2023 15:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701789428;
	bh=RbLg9T6AMJ5NL/D819BJlKf7wAYf0xJaQbaEvx+laAA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bw9LE1Wa/2C4T7BBITd2qcWq/ha/cEPhgIFiN2NgwWfkuMTfjK/JocYA4i/nrrz8E
	 vd9Zs0+X92gZRNGIT9HeziLtrtxBGbjKDfqS3rCUMuUL6XeWfVNQBw1RV8GcfbkVPs
	 +OhPlc+Rsn5xYw2wSK3w4c72rwCGuipPf2wSe1CsgaDbowPjF1LhhMP2ySkfynCupB
	 j4mJob5avu+hNYBD0ojoPvqIlA9mC146m0LlOs2QVbmK2yipP3KrTTVKpuMNFxgLOS
	 yyJhhnLDuGIw2XlU2U5St8A+N2Wrg3ZD84SqzUN2Wxq9/PzHRdX9veD3GgnzZjW8jO
	 9dfsFSV/eCH+Q==
From: Will Deacon <will@kernel.org>
To: Tsung-Han Lin <tsunghan.tw@gmail.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] Dcoumentation/arch/arm64: fix typo
Date: Tue,  5 Dec 2023 15:16:37 +0000
Message-Id: <170178649190.14021.17307806382838211619.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20231203011804.27694-1-tsunghan.tw@gmail.com>
References: <20231203011804.27694-1-tsunghan.tw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 3 Dec 2023 09:18:04 +0800, Tsung-Han Lin wrote:
> Should be 'if' here.
> 
> 

I, err, fixed the typo in the subject when applying this...

Applied to arm64 (for-next/misc), thanks!

[1/1] Dcoumentation/arch/arm64: fix typo
      https://git.kernel.org/arm64/c/365b1900c93a

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
