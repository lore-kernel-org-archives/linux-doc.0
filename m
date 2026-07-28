Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E383F5BFD;
	Tue, 28 Jul 2026 11:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785237997; cv=none; b=uyZIKUcuM93iJ4Q5U8aAgw0zPoH0PobCCPsthr5IxS+SSuH3K89eK4tWPr9quleCf8f+Op7pZLTP5Ouh5JDBayNGfRdRQCzvKN0px47wtLz9Bfw4DklHE8e01HpJCpSWgqXC8/+e80SmXF3WolSZuXyvDSdKFNDwRBwJZOj3gOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785237997; c=relaxed/simple;
	bh=bI2N5ifGDUK4OijJQYi3DxEGFC9NnGafYoU8Eog31R4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eAZhxffC0EvBbw78qHPAv+WoGt82FjeEKC+4EtA3u/0A21RA7RR0lAeJsKAnQu+EhKZKHalQIiDEYlMzHmTT22JSyxSK1HH7eUIYooA6pRbbFyUakUBspU4lxtStZb+dTboyOujsI5p1XHeys8+MvJ4Dunmo2qUOukHtO0DDRC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l22hXoF2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l22hXoF2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022A51F000E9;
	Tue, 28 Jul 2026 11:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785237996;
	bh=GXym1yE0FtnVm0MfjQ4EMxQp7ufSR6NlktoTBBMfJVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l22hXoF26M/jWcfPnIwgj7VBA3BLMtQrlvG0GBAg5H0nRff85QkXpEmATvo3Scq6t
	 +GViblSyAdwPHfhXJpfWzXZDyP3RO7RktbuJCEOBqDJ0VJmk/X5ySz7P/PQQN/4X/r
	 JLgw4W2bMbdpf92m/o1s/Qvgf1SxUxF7D82VViXcERyYmi/8d+j7+ROHQMDCDr42lx
	 4a1ZkZFuT2zAFlMOFWIzQr065ZmMO8izDU608sEKEcw8f8Pa3NL0f18i2//xWLxynC
	 VepLZNpyTXNy13WH/3AQB7PLioBZ6X+x2AUkT/KK8qAGP36JnH4tM4sCFkwBuvUW8l
	 tR8UedhvbG6Tg==
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] arm64: fix cpu-feature-registers Malformed table
Date: Tue, 28 Jul 2026 12:26:28 +0100
Message-ID: <178523451439.2406080.13981549647507165259.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727001002.3016279-1-rdunlap@infradead.org>
References: <20260727001002.3016279-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 26 Jul 2026 17:10:02 -0700, Randy Dunlap wrote:
> The "visible" column was dropped so that last line's extra pieces
> should also be dropped to prevent a docs build error:
> 
> Documentation/arch/arm64/cpu-feature-registers.rst:170: ERROR: Malformed table.
> Right border not aligned or missing.
> 
> +------------------------------+---------+
> | Name                         |  bits   |
> +------------------------------+---------+
> | RNDR                         | [63-60] |
> +------------------------------+---------+
> | TS                           | [55-52] |
> +------------------------------+---------+
> ...
> +------------------------------+---------+
> | AES                          | [7-4]   |
> +------------------------------+---------+---------+ [docutils]
> 
> [...]

Applied to arm64 (for-next/cpufeature), thanks!

[1/1] arm64: fix cpu-feature-registers Malformed table
      https://git.kernel.org/arm64/c/d50a908ffde5

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
