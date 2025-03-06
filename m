Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A794F42A99
	for <linux-doc@vger.kernel.org>; Thu,  6 Mar 2025 02:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741227643; cv=none; b=FLF1x7vhjtK3mP9KfEem4jKhm0vZx+oyTGE3MM9llcn66PJ9hkKJgLjgi/M3mS5B6k8oSw9uqUvH+5CIyDeErVVDr24RiTfh0L5dFFyjXq2EXkr9ripEhdYqvZ8Q7hEOqdfIoHzXi0y0ZllUEUqB6xJgR4RyWKTRZlYlJmJ0Ztc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741227643; c=relaxed/simple;
	bh=oLWPQghY/bSHCKkbFvGDR7UFg2VgIHWEtjU/D13VZ0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eC6VA8X8C6s6G8tsU3g4Rqedhxgd0Koklvnbqyk317Bnx6we1bRCxfimSDYvVrPJEAGzMT58FrmP+VTzI0M3v/pezLcHeZymykASYwrEzIRRyYAMO+5beUDPQtTgxidQKlBse5ErfrpmtPFL95j8VT34GVJT9ylUm1droCBXE9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J6qsrIqT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6qsrIqT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19702C4CED1;
	Thu,  6 Mar 2025 02:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741227643;
	bh=oLWPQghY/bSHCKkbFvGDR7UFg2VgIHWEtjU/D13VZ0c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J6qsrIqTRNIxA1baGYCWfp51iqB+XUS5MHPS6ZsvntJoxvITn797n0zgDgEal3oWx
	 fnYjaVW0NuhukHfDm/Es7rtQPC2YiN2kxPSpriftFWVaoTtS0x2dN/IgqiaHBa/NaD
	 CgbmJof01WIgry3qGwbNGCeyZLFpgSNNJKgIBetjlfxiZh2Zzy8YyaYrQtube+Kx+U
	 21gUcLQll2PqbYAFQ4uZiX3gtSUwm8Hq2EJwUeUOwA4KmojGOFvahb16zybtmL38Kp
	 Q6JnTZHmhhr4SZby9WIzMKvNXm2yn5WHfBaGDbKA0Un/Ljdenl+bv6cbf9SKYbboQQ
	 bJ9P+Ok2BWC1g==
From: alexs@kernel.org
To: alexs@kernel.org
Cc: Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/Chinese: change the disclaimer words
Date: Thu,  6 Mar 2025 10:20:28 +0800
Message-ID: <174122757048.28991.13719764815611467532.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305025101.27717-1-alexs@kernel.org>
References: <20250305025101.27717-1-alexs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Alex Shi <alexs@kernel.org>


On Wed, 05 Mar 2025 10:50:58 +0800, alexs@kernel.org wrote:
> 2 paragraph warning and note take a bit more space, let's merge them together,
> and guide to other maintainer and reviewers.
> 
> 

Applied, thanks!

[1/1] docs/Chinese: change the disclaimer words
      commit: 17c8896c43eab4ff1e2220fa061c40e2509c67b3

Best regards,
-- 
Alex Shi <alexs@kernel.org>
