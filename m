Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161D223817D;
	Tue, 25 Nov 2025 13:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078802; cv=none; b=ZsY7g32KfcXkp9sa2IhVXF5r1Xe3DseAJGC8JMbwuMHYkcKu26i1bX29rQA//4477uxXRcCkNYc9s2pEYpaMhkQwxp3SN2AC5GBmHZEA1IUKMuGsspZpw/i0gB+vSmY2crwY1RIWFqlAa71LTWpmjkPcShTqYDKVd2pr6Maf6+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078802; c=relaxed/simple;
	bh=wm6FV3IVT1IV0DpBE30PulkbTqg/dBVhT8sK6JRjf2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZENeTfhJ/BW9zcK31Myi85QKCAuvTdEYt47eH4Z8+bAGIGGUPoddv2pd/pGL+pMkX5li9Hp5SYHviY3P5sRWSjSyG2mIWCVAjsg8QABAK5o5rFiiprlK+I0F0lbHJ4X0kQUWuinFYm6sSyGqmsp6W5TCDHjm3nlKPI+ibzSIhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TPCDLMdK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPCDLMdK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4CAC4CEF1;
	Tue, 25 Nov 2025 13:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764078801;
	bh=wm6FV3IVT1IV0DpBE30PulkbTqg/dBVhT8sK6JRjf2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TPCDLMdKI43zuEecrbT9L31Ory6H5TCx9BWZdKDZON2SHCBPuwYMv0wBVhVS7cB0c
	 iIJQ1xIVYTxfl0Rpr3BS9XUzqXdlNwS/TPGeaTPVocHFJRKO8Gqc8qpCmxm7HROe5Q
	 5J3f0ZBm8mupwSBzJh9D3Q7rZJFPalAN5MpOOdFvro4YZWdLqgs4EH0J7U4SHB596+
	 WcRbnLveEiK3AkGThBNyo3eUk6ZvNRsZ8vEDjV/ONd0ORJY2a2c4GRoZi8rwW+bsk/
	 ppSENZ3oU8Reh+pE2+BZSB/zRrNw7O4CVBVKu8bHuocb3W76AuFFT5d3fkVQQz7vNb
	 WbIP1TP22cbbg==
Date: Tue, 25 Nov 2025 15:53:07 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Usama Arif <usamaarif642@gmail.com>,
	Changyuan Lyu <changyuanl@google.com>, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, anthony.yznaga@oracle.com,
	arnd@arndb.de, ashish.kalra@amd.com, benh@kernel.crashing.org,
	bp@alien8.de, catalin.marinas@arm.com, corbet@lwn.net,
	dave.hansen@linux.intel.com, devicetree@vger.kernel.org,
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com,
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com,
	mingo@redhat.com, pasha.tatashin@soleen.com, pbonzini@redhat.com,
	peterz@infradead.org, ptyadav@amazon.de, robh@kernel.org,
	rostedt@goodmis.org, saravanak@google.com,
	skinsburskii@linux.microsoft.com, tglx@linutronix.de,
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org,
	Breno Leitao <leitao@debian.org>, thevlad@meta.com
Subject: Re: [PATCH v8 12/17] x86/e820: temporarily enable KHO scratch for
 memory below 1M
Message-ID: <aSW0wySe2kRl1P8e@kernel.org>
References: <20250509074635.3187114-1-changyuanl@google.com>
 <20250509074635.3187114-13-changyuanl@google.com>
 <a0f875f1-45ad-4dfc-b5c8-ecb51b242523@gmail.com>
 <22BDBF5C-C831-4BBC-A854-20CA77234084@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22BDBF5C-C831-4BBC-A854-20CA77234084@zytor.com>

On Mon, Nov 24, 2025 at 04:56:34PM -0800, H. Peter Anvin wrote:
> On November 24, 2025 11:24:58 AM PST, Usama Arif <usamaarif642@gmail.com> wrote:
>
> >diff --git a/arch/x86/realmode/init.c b/arch/x86/realmode/init.c
> >index 88be32026768c..1cd80293a3e23 100644
> >--- a/arch/x86/realmode/init.c
> >+++ b/arch/x86/realmode/init.c
> >@@ -66,8 +66,9 @@ void __init reserve_real_mode(void)
> >         * setup_arch().
> >         */
> >        memblock_reserve(0, SZ_1M);
> >-
> >+#ifdef CONFIG_MEMBLOCK_KHO_SCRATCH
> >        memblock_clear_kho_scratch(0, SZ_1M);
> >+#endif
> > }
> > 
> > static void __init sme_sev_setup_real_mode(struct trampoline_header *th)
> 
> What does "scratch" mean in this exact context? (Sorry, don't have the code in front of me.)

In this context it's the memory kexec handover used to bootstrap the
kexec'ed kernel. Everything beyond these scratch areas could contain
preserved data and kexec handover limits all early memory allocations to
these scratch areas.

-- 
Sincerely yours,
Mike.
