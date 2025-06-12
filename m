Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF712BCF72
	for <linux-doc@vger.kernel.org>; Thu, 12 Jun 2025 17:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749749277; cv=none; b=u6BeREeZEniGrarqgiXtx1utoCzjN76GlFeXzMEmTbAsogiyeY8Nwh6UXbZltANnBbXsTxWrup6k6blkXGb5Y9WXIVY9wHyHsZM6DjRbtAHeovRkc0qTfGOJQbWMHGJwPw7LhFpWuLykHhLG8/HZQbuzsY7ECj3Ql78YlI/vjeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749749277; c=relaxed/simple;
	bh=PrgQmr9RGtzfNpjORGADjA2i5T/gKByYDyMqNAkbjes=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MU7wSwq3y6o2O/0uqp27rq0oZ/RGc5y4gr6FolUZ1fW5W9FLEW+k1IUN8MsXzb5/IYkxmxyGi0Fp8fM2DrY4QRm5D7C1fOFieJhFPnZDJ2W1kXFcwkxPJP72VcGOnvJtMEhkFIHz4iBnNlZPkZ6odqtm5M0QvtENQoK528ZxjEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JdEHI+Pm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JdEHI+Pm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B232C4CEEA;
	Thu, 12 Jun 2025 17:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749749277;
	bh=PrgQmr9RGtzfNpjORGADjA2i5T/gKByYDyMqNAkbjes=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JdEHI+PmeDRk8zkYVqYlfi2GrqiuyzNBDkU0uGBP+srqOtivqC5GuXcW+/Hrxk9Ez
	 IWAzLphX/Vw4OjSIFz3eB53BUjmv8w5q99NWMD86VfLs4KWmhOifk/LQYU9+2iIW8b
	 DuwMHa1x/SumFcaGZDaKVrojr/5SITueFRfR7PMAITq+bno1Cfbj2Pb5OKn8UydK2K
	 lsa+RzSf7+MMEB0M5JqJmMgNyjL4RvHtFgbk8jQBQrjqdPR0BjkrTUvgzFOdssXs9O
	 +6GSvNSZC0ULfdOEtwMYaL0KqH3cjr2NSaN6u1JQ1lQMOzB3f9XQSDeJbSTAd4wIzP
	 hi8F9FV+D4Z/w==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] docs: arm64: Fix ICC_SRE_EL2 register typo in booting.rst
Date: Thu, 12 Jun 2025 18:27:47 +0100
Message-Id: <174973980080.2446925.9518474417822842973.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250610120935.852034-1-lpieralisi@kernel.org>
References: <20250610120935.852034-1-lpieralisi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 10 Jun 2025 14:09:35 +0200, Lorenzo Pieralisi wrote:
> Fix trivial ICC_SRE_EL2 register spelling typo in booting.rst.
> 
> 

Applied to arm64 (for-next/fixes), thanks!

[1/1] docs: arm64: Fix ICC_SRE_EL2 register typo in booting.rst
      https://git.kernel.org/arm64/c/c0c7fa4e7a51

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
