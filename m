Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4163C24217
	for <linux-doc@vger.kernel.org>; Thu, 18 Jan 2024 12:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705579361; cv=none; b=r+NOdguJyWtQLGMI+NCEGOJk14FASkQ+T6XBJ+fi7bWfvtnshrMOUI8scUt2BLuYo3Uu+/2jnqba1NDHzVH6lUibjp/vu+T7s6SfD/pUEzfVHJHfIO3/FV9c99+bhR4h0YapeeoeIDauczZbYKh/yOBjEaynvR78CZjy62DUbFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705579361; c=relaxed/simple;
	bh=DBdxiXz741NQpJAeLNerDWeeCXGbOJChL7ENwM8D8w8=;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=VeiRNXsQycz3G0hjK+9rIv+QkoDUJTp25vuT7LkFRBhBr2gnGeZ/CJgzcQZEpR8H3JE+sHddF7PDMEV+lKB9BVFGZIUO3U6uDOuD012G8mSdMD2YzOd/AUcMqjByEn5myOJpmWwmRUBhOE8Bf1nEW7TN6ELAk9Fb7yUaZAMHE6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EbluZaUv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EbluZaUv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F2DC433F1;
	Thu, 18 Jan 2024 12:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705579361;
	bh=DBdxiXz741NQpJAeLNerDWeeCXGbOJChL7ENwM8D8w8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EbluZaUvN6+NUj77ZRphhFQJ3MEB7KJH0PNji23vRNYg2aInMHRQlcuysdg9h1r8B
	 79qeVvsj4myUc0pMM8TC/09ohk8bs4FKytToii00zkiR1pSXG0qOW214E1MzFrFQ70
	 eWSdIokSXA9bTiE3+KXU2BBm1FgkRLtLaWq4vkz4Rg2unIE1haHD0V0TzJAUc2ueAr
	 KUzPtsNdV7eepe5aJkZ5+YYYH5+sQ9Ff3V1Xsnz9rAunczjZLdc9V5uS9FyrxwkZnQ
	 wIBfTTVDxB/rVVmIVb6yBA8drna9n9yJgFEo4vHTgioOCvA7noQ9BEACXy/blAD0Y/
	 Uisir2EkQVvQQ==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	corbet@lwn.net,
	Robin Murphy <robin.murphy@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: Fix silcon-errata.rst formatting
Date: Thu, 18 Jan 2024 12:02:27 +0000
Message-Id: <170557654375.3203146.7467582557187082198.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <b6637654eda761e224f828a44a7bbc1eadf2ef88.1705511145.git.robin.murphy@arm.com>
References: <b6637654eda761e224f828a44a7bbc1eadf2ef88.1705511145.git.robin.murphy@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 17 Jan 2024 17:05:45 +0000, Robin Murphy wrote:
> Remove the errant blank lines to make the desired empty row separators
> around the Fujitsu and ASR entries in the main table, rather than them
> being their own separate tables which then look odd in the HTML view.
> 
> 

Applied to arm64 (for-next/core), thanks!

[1/1] arm64: Fix silcon-errata.rst formatting
      https://git.kernel.org/arm64/c/1b20d0486a60

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
