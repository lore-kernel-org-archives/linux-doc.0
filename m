Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B796B12E6D
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 10:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ikwAnVEW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1762FC433C7;
	Tue,  7 Nov 2023 10:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699352449;
	bh=0m38NUeLOMHtl8nIK5Oyv/8a4A8+60kkJeGGDn+94Fo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ikwAnVEWM/HHqsj459F5JhhB7JP4ImUGuXoXvjFYvNIymldBGWla0G7mhYSH/s3UD
	 ROvTT4kI/Fa6mcbn2Xn5BbmBU98CmExlkYZ0PTQL/b7Ws5AU/SQbBXjQafJjtpgp7k
	 lNkYIFyiOoY/rG0gZi4SaKH2f9/mdjQyBcfZIkGsz9dvi44O+ciNJgqR5/LtftL0W3
	 P9IUfrHouKtnCVLsmvRCTTyTtfqKTsDn2lk945SU5lKWbbO+DwKmzgyLO55NkK5tKO
	 j3k12oqclPWuE13kng/nQWiVwv2vHkD60COLyZ9PkWF4hJIHYPbeGapX+UTaQkFeaE
	 UW7vqMECFk7/g==
Date: Tue, 7 Nov 2023 10:20:44 +0000
From: Will Deacon <will@kernel.org>
To: Marielle Novastrider <marielle@novastrider.com>
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/arm64: Fix typos in elf_hwcaps
Message-ID: <20231107102044.GD18944@willie-the-truck>
References: <20231031200838.55569-1-marielle@novastrider.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031200838.55569-1-marielle@novastrider.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Oct 31, 2023 at 08:08:38PM +0000, Marielle Novastrider wrote:
> Small typos in register and field names.
> 
> Signed-off-by: Marielle Novastrider <marielle@novastrider.com>
> ---
>  Documentation/arch/arm64/elf_hwcaps.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
