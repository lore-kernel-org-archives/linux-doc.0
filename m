Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D487459AD1;
	Wed, 22 Jul 2026 21:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784756432; cv=none; b=Db0nf9CH7JMxAb9fGhXFMgU0f4Nk0/SQxvwBXBlxZlK9GcAs8V85ngQAgl58ADWrQ5Uf+sm84bBAWB9giIesmOSaWWCGrD5VoPRuJHbTAa0SdkOon41LGEpynO7lVC5UR/nvE4Ecgeso0w0cMruCwxCCr+nZcNArJAlUQcabUUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784756432; c=relaxed/simple;
	bh=z8KIj9+PS+GGKJ+9GRYP6OO5LQLkqoDDpRpZA7UTVgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WXqpeaq/frvfUh08kB+qsfjQ37M/TPyO65VDfb1JHtoyhSIjdUuUdh9OMkpSwaCTSIXmpXuw6xue9jBPZazf3N/yOx+g061QSstZzdovBidrsyg8S82EBYBKt0pqrCrY5Zg1oc86Z5t+kWoYZffKxFSbyXjTszb6wDL7dBfeWv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTPhaHby; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTPhaHby"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD3A1F00A3A;
	Wed, 22 Jul 2026 21:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784756431;
	bh=gtAILz1mcVabOpEujo5Y/+sqsk9d8o+pd+qfRrcg/ks=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hTPhaHby/AKYHnmkWim05EyEk8bneEdeyKktrwhUMP6hNXSngWDC8TKkwZvzZJcrT
	 HO/re99KKiviIHRa/AfW0xEVlTaKjFUuuH3tfaCP9NUZpbWi2IBQyxtrNpALzePCP7
	 9NKOKS1mXMG1T9gBrSLWrOaAsBVIEcvUlmsoIoTAmNzI7m3HBy1AGREVQLjSJMuG55
	 8AfK184rNyphRpCyubu1bfcJeGH4e44hlZRgpuDTw99RNobpH5rOQR5zNDafH05Xf6
	 HsuB6XZRJBlY2n8NWNk6sJVgK/t8yw3viZaXaZZO90abol7cVcWu6oMa8RDBi7x70V
	 wX40zJfl3aObw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v5] arm64: errata: work around NVIDIA Olympus device store/load ordering
Date: Wed, 22 Jul 2026 22:39:31 +0100
Message-ID: <178475249728.3277623.8138156958776808199.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715204856.3707449-1-sdonthineni@nvidia.com>
References: <20260715204856.3707449-1-sdonthineni@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jul 2026 15:48:56 -0500, Shanker Donthineni wrote:
> On systems with NVIDIA Olympus cores, a Device-nGnR* load can be
> observed by a peripheral before an older, non-overlapping Device-nGnR*
> store to the same peripheral. This breaks the program-order guarantee
> that software expects for Device-nGnR* accesses and can leave a
> peripheral in an incorrect state.
> 
> The erratum can occur only when all of the following apply:
> 
> [...]

Applied to arm64 (for-next/errata), thanks!

[1/1] arm64: errata: work around NVIDIA Olympus device store/load ordering
      https://git.kernel.org/arm64/c/12aab25ca56e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
