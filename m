Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290A01FDE2E;
	Wed,  8 Jan 2025 14:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736347504; cv=none; b=Xk/Ul+GdrCVqYm9/lKYySZIHvctwY2dtOYWxgZZs6sAHj2KStcibpBCEMOqa+8vMer88PtT6+OxUGE/CkfySKoj0MmZCeH0GfO1OIfByQfr2g8PT7Uw1Tg7vfJFMeBmbe0SC8NTxlp+AVsUXst1x6g/sdqpOife67Vn/cDZAvOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736347504; c=relaxed/simple;
	bh=uC8bKEbbMXPZiuMUhK9phUhFqGWoF00zy7qZc2N7mUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gaBo152KKxAHKZzAC/9ig+8a9V7rtZCScEarjy9ZrJHRl4EsZnKuMX6DDGy2FAnYP+J+6sjZgsdW5kT8Gp4kC2MF9BzxsKOFw9IWruG4xsJKP49PMlNo3onH6/4Rguw0jTloAU/Y9VwlsoX1k8YYxg7nBVoujoPmFBv/cYz+GFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D40C4CED3;
	Wed,  8 Jan 2025 14:45:02 +0000 (UTC)
Date: Wed, 8 Jan 2025 14:45:00 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Sangmoon Kim <sangmoon.kim@samsung.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, ardb@kernel.org
Subject: Re: [PATCH] docs: arm64: update memory layout for vmemmap region
Message-ID: <Z36PbN-s7YCR2HQi@arm.com>
References: <CGME20250102065607epcas1p296c550a7ba26884e1c2810f872e537f4@epcas1p2.samsung.com>
 <20250102065554.1533781-1-sangmoon.kim@samsung.com>
 <20250108135748.GA9367@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108135748.GA9367@willie-the-truck>

On Wed, Jan 08, 2025 at 01:57:48PM +0000, Will Deacon wrote:
> On Thu, Jan 02, 2025 at 03:52:37PM +0900, Sangmoon Kim wrote:
> > Commit 031e011d8b22 ("arm64: mm: Move PCI I/O emulation region above
> > the vmemmap region") and commit b730b0f2b1fc ("arm64: mm: Move fixmap
> > region above vmemmap region") have placed PCI I/O and fixmap region
> > above vmemmap region.
> > 
> > And commit 32697ff38287 ("arm64: vmemmap: Avoid base2 order of struct
> > page size to dimension region") has moved vmemmap region to higher
> > address.
> > 
> > Update document as the memory layout modified by the previous patches.
> > 
> > Signed-off-by: Sangmoon Kim <sangmoon.kim@samsung.com>
> > ---
> >  Documentation/arch/arm64/memory.rst | 28 ++++++++++++++--------------
> >  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> To be honest with you, this document is pretty stale (it doesn't even
> mention 16k pages) and almost impossible to keep in-sync with the code.
> I'd be inclined to remove these tables; we have ptdump support if people
> really want to see where things are.

I agree. They were somewhat useful in the early days when we didn't have
as many combinations but now they get outdated easily and I'm not sure
anyone still uses them as a reference.

-- 
Catalin
