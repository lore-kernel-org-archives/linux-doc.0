Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.93
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795491209;
	b=me1t/Lf+oHNVzS5oaMbpVHIjkGbsIWkicJLHc88hLtQV/0iQieHq1CefhhtgknjWaJAA
	 DXI1vNThRlSEHcwRzR3A83h6ia5XKoP8bMF3CzW4uru4DN1ce3g2uChGAGaPHat0R8fuT
	 xRhJmvFDMyTKHOo2h0Rre8poGbRaO01eambIebWoRLJadXlldfx/JXuP3qMfbarovu0S7
	 aEH+b2Oa7hYGJVesxjWHQzwekRCySedoAZ1aF5WZXD1MTFKPEnXlxcAbvCmXKA/W+E4S7
	 ewR/AB0b0MAJOIHDx5DTX5XA2tYy+uN/8ZZb9mEsoz5n7I0IDFVU9EAMA4JexD2MT1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491209;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=I5IYt5lD0t4uzj8miQUAufXofOEz3QHtC3aQ7LCE8Bw=;
	b=X/PvQJau3DyUgjAuHlrU1+UEu10zuVHIDOJx+dAfT4700yB+J/1NHldjmKVBvLfzb1bS
	 0E6YdiDu7AETQGChCef5Dad232LMM7Dbnnm0fDhIYoWpep7J+SZcY4luQuRvgNiHpTo1k
	 6MStVt3ZWWjLmpIrRDMJ/hkmQroHpGK+3SXBX/lwoKS6b1B7LEry+uvGd09NtQtqa6x8h
	 JM63soAp4MumuWe0DLwbNY+6MD64c7scyLwDPPPeNT/i2h84Wz+6Bl88A5bzNAKbC2f4Z
	 6JHMHJMCW67GGr65Ua11GrLFT3uw43CBMy0/qMw1t8w9qf5B+kVmpxOFzmwNP0sRy4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LDoHQM6n;
	arc=none smtp.remote-ip=91.218.175.93
Received: from mta0.migadu.com (out-93.mta0.migadu.com [91.218.175.93])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EB4606A31E
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 03:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9EB4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LDoHQM6n
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SFcrls7zpUQel+GbWPMlPJigKtY/3Ba5jJ274MNY1KU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795491205; v=1; x=1796096005;
 b=LDoHQM6nbU+G4M565Q29Wvwmf3IzIV/k0LjbazbPfZ1FpHDxexHeAzkLtVy8IL9yW1DJZ3Ru
 VO10yhUwcHpWgUUFVFOa+YSjvEvtC/hUTrP6i7pXmsFuo+bPehnCNXTQGXlrpOEk/oujppeHgDo
 d3a2uYGL6pmh+AwrcyuXFZOs=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5b1f3acdb92f82be;
	Tue, 24 Nov 2026 03:33:25 +0000
X-Mizu-Trace-ID: 5b1f3acdb92f82be
X-Migadu-Flow: FLOW_OUT
Message-ID: <fd62d092-a90a-4711-a3aa-16caa03bc806@linux.dev>
Date: Tue, 24 Nov 2026 11:33:13 +0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: errata: Set GIC-700 #2941627 Kconfig entry
 to N/A
To: TAKANO Mitsuhiro <takano32@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-arm-kernel@lists.infradead.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261121083950.1957044-1-takano32@gmail.com>
 <20261121083950.1957044-2-takano32@gmail.com>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20261121083950.1957044-2-takano32@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/21/26 4:39 PM, TAKANO Mitsuhiro wrote:
> The GIC-700 #2941627 entry in the arm64 silicon-errata table names
> ARM64_ERRATUM_2941627 in its Kconfig column, but no Kconfig file defines
> that symbol and no code refers to it.
> 
> The workaround has no Kconfig option: drivers/irqchip/irq-gic-v3.c
> passes the GICD_IIDR value to gic_enable_quirks(), which compares it
> against gic_quirks[]; the matching quirk,
> gic_enable_quirk_arm64_2941627(), enables a static branch.  The table
> already records GIC-driver workarounds that have no Kconfig symbol as
> "N/A", for example the NVIDIA T241-FABRIC-4 row, whose workaround is
> likewise in the GIC driver.
> 
> Set the Kconfig column to "N/A" for this row.  Leave the row in place:
> only the Kconfig column is wrong, and the table should keep recording the
> erratum.
> 
> No functional change; this only touches Documentation, so no build was
> run.  The change and this changelog were written with the help of an LLM
> assistant (Hermes Agent); I reviewed both and am responsible for them.

Please ask your Agent for a more concise commit message. Most of the words
are not necessary to be kept in it.

> 
> Fixes: 6fe5c68ee6a1 ("irqchip/gic-v3: Workaround for GIC-700 erratum 2941627")
> Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
> ---
> v2: the change is the same as in v1; only the index and hunk line
> numbers moved with the rebase.  One changelog sentence is replaced in
> each patch: in 1/2 v1 called the table row the tree's only record of
> the erratum, but irq-gic-v3.c records it in gic_quirks[]; in 2/2 the
> sentence about the symbol is reworded to name arch/arm64/Kconfig.
> Both changelogs now say that no build was run.
> v1: https://lore.kernel.org/all/20261106234541.1474324-1-takano32@gmail.com/
> A duplicate submission went out the same night with different subjects
> on 1/2 and 2/2 (20261106235616.1533003); please ignore it.
> 
>  Documentation/arch/arm64/silicon-errata.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index bffaa46c664b..4bb5707a880a 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -297,7 +297,7 @@ stable kernels.
>  | ARM            | MMU S3          | #3995052,       | N/A                         |
>  |                |                 | #3673557        |                             |
>  +----------------+-----------------+-----------------+-----------------------------+
> -| ARM            | GIC-700         | #2941627        | ARM64_ERRATUM_2941627       |
> +| ARM            | GIC-700         | #2941627        | N/A                         |
>  +----------------+-----------------+-----------------+-----------------------------+
>  | ARM            | SI L1           | #4311569        | ARM64_ERRATUM_4311569       |
>  +----------------+-----------------+-----------------+-----------------------------+

Otherwise,

Reviewed-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

Thanks,
Zenghui
