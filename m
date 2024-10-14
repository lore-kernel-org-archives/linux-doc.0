Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320241C1AD8
	for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 16:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728924184; cv=none; b=nMukRIGruRbR5E+4tmHkTBG4RTZPW22OxP3OQ7sJuXM/FJKkQCIb/RYTvDglAor4osiEPO0i3nHPye4FlLlTORLETaiyB2/tmgRZd/jQVqYSm0EcIO6EWEg3G6ZsKPIhb/yvpjM2rLHOLYmIWfAvZL6hXvb+Fw4siZzp4/4dI8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728924184; c=relaxed/simple;
	bh=WAfKaHeXbbVah7bwFcibJuvheZIBTq0fcaLx6XJdukk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YDiOJMvOs1v93R8ziMeVAiiYuCOFpgbCmCkZesvsvOnqDA6cxlitb6bXwty1rPojAkODtXVfkOkKT6ZEz4QvgpK6/Z6b0cbUQDN0LMw267q/+UyowK2RZSU8l/oCXVh5Jy8JOPcAKsOCrT65quC4LpJ+UENtaUeMWEQvyI8Qu7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FdRireyE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FdRireyE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A5CC4CEC3;
	Mon, 14 Oct 2024 16:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728924183;
	bh=WAfKaHeXbbVah7bwFcibJuvheZIBTq0fcaLx6XJdukk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FdRireyEBTPZkVtk2nzCCGwpBx415cmMRtyPeWYJ00xZvTPY4r8ZRpVpclUvCZE5K
	 GnSRXwQbLsssgAvl0HhEkCQaOKUdlETZi/1JOE5jg6VyrE8L0CSCzd/u8vvpRwVNuQ
	 yAvknrIWF4mm8pToS68jTV83N1jxiOmnJhifPp2T4MTqa0DTfVsqY5xbhtcJol6eYw
	 lyH3kLK7EpL+gDVmMxys/c7xF0U9Zg5+iiFmNENCF5qrbVihWWg8rjMQmAY0HSIXs+
	 myvmBU9jBusODJAFnNOM2jldKMNkv6YdJ94ZX9WexDSzy1qqPbb76QpNecVip0mv/Y
	 2iM/CD3zuiGTg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v1 0/2] POE fixes: kthreads and docs
Date: Mon, 14 Oct 2024 17:42:53 +0100
Message-Id: <172892288709.3547698.6044261902661811960.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241001133618.1547996-1-joey.gouly@arm.com>
References: <20241001133618.1547996-1-joey.gouly@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 01 Oct 2024 14:36:16 +0100, Joey Gouly wrote:
> Two fixes/amendments for 6.12 for the POE series:
> 	- Set POR for kthreads, as discussed [1]
> 	- Add docs, as requested [2]
> 
> I have a (hacky) io_uring test, that I will try clean up and send out at
> some point.
> 
> [...]

Applied (with Kevin's suggested edits) to arm64 (for-next/fixes), thanks!

[1/2] arm64: set POR_EL0 for kernel threads
      https://git.kernel.org/arm64/c/e3e85271330b
[2/2] Documentation/protection-keys: add AArch64 to documentation
      https://git.kernel.org/arm64/c/f56d8d2389ba

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
