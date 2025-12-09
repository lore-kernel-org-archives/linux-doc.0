Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7C32D7802;
	Tue,  9 Dec 2025 08:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765270427; cv=none; b=WrEaDkywW17yaMXOiPjqrNyXErciRmihRymh/XpjiymZBXmWhx056+hd4ASKB1S6i6/R2tygCf9nDz5KeCfY5fKyqkJf1YfFQaUlUo54Q+CX1ck/MdglHZqBQvVxchig6VsKMv+WuxDy3VDFIFTmP4XYwBy9L4Nhnxq7wrTCNGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765270427; c=relaxed/simple;
	bh=B+06a2AIDoEn+gEmD77Npv3dqKKw3n7NJtW7XJENQIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KoxM621FtWvlLkz9vTJJ0GDND3fZreNPWK6SbNqz/gwWqFMreguDy344yFRFaznlolqjYi5a8b20iuZZUpCmDxvyfvxjB39cMqHpYm0crpj0Za/jbIwoGn4iSMgfFHybZu/uJPBOwlW5DmMjf9C0/uNyh2iaXl7/JIFxZl3ab6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gSO0bRmA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gSO0bRmA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B525C19422;
	Tue,  9 Dec 2025 08:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765270426;
	bh=B+06a2AIDoEn+gEmD77Npv3dqKKw3n7NJtW7XJENQIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gSO0bRmApEBoecKzvj3LdQDbI+/AZ+HvrgM0DzZsui0ovhcdW0kYvcSdapoZZFHQM
	 D0siBMpu+oZBOvYzHsskRRAP94Dt/KOvCfxENAwhqzm2pK5moEUyAu+32wpZQG9my+
	 kHoh/5dP8mFn3uk4pBoJPYkahOGtVH8TakBkZd93k15uMzQGGiUSWZxZ0waEaFfIsP
	 +qsmTcs2dUILpSC772VC+ZK1mNSMVECShqaEMSkBvhZggljDK1VtYebytvvG2r1fhB
	 YsVh+WfzQMPPvv3qdk53UVRwQU9n+ho07MVGpPWJ/ZzhrVN//n1anxpkr78L4NfazL
	 wWv3oq1UXtI6Q==
Date: Tue, 9 Dec 2025 09:53:40 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Cc: bp@alien8.de, corbet@lwn.net, dave.hansen@linux.intel.com,
	david.hunter.linux@gmail.com, hpa@zytor.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	mingo@redhat.com, skhan@linuxfoundation.org, tglx@linutronix.de,
	x86@kernel.org, Randy Dunlap <rdunlap@infradead.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v2] Documentation: x86/boot: Fix malformed table in
 boot.rst
Message-ID: <aTfjlAKBNeX6my4g@gmail.com>
References: <20251208210113.24057-1-swarajgaikwad1925@gmail.com>
 <20251209085330.9124-1-swarajgaikwad1925@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209085330.9124-1-swarajgaikwad1925@gmail.com>

* Swaraj Gaikwad <swarajgaikwad1925@gmail.com> wrote:

> Sphinx reports htmldocs warnings:
>
>   Documentation/arch/x86/boot.rst:437: ERROR: Malformed table.
>   Text in column margin in table line 2.
>
> The table header defined the first column width as 2 characters ("=="),
> which is too narrow for entries like "0x10" and "0x13". This caused the
> text to spill into the margin, triggering a docutils parsing failure.
>
> Fix it by extending the first column of assigned boot loader ID to 4
> characters ("====") to fit the widest entries.
>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
> ---
> Changes in v2:
>  - Dropped accidental whitespace changes (the second chunk in v1).
>  - Simplified commit message as suggested by Bagas Sanjaya.
>
> ---
>  Documentation/arch/x86/boot.rst | 48 ++++++++++++++++-----------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
>
> diff --git a/Documentation/arch/x86/boot.rst b/Documentation/arch/x86/boot.rst
> index 6d36ce86fd8e..89e785850f7e 100644
> --- a/Documentation/arch/x86/boot.rst
> +++ b/Documentation/arch/x86/boot.rst
> @@ -433,30 +433,30 @@ Protocol:	2.00+
>
>    Assigned boot loader IDs:
>
> -	== =======================================
> -	0x0  LILO
> -	     (0x00 reserved for pre-2.00 bootloader)
> -	0x1  Loadlin
> -	0x2  bootsect-loader
> -	     (0x20, all other values reserved)
> -	0x3  Syslinux
> -	0x4  Etherboot/gPXE/iPXE
> -	0x5  ELILO
> -	0x7  GRUB
> -	0x8  U-Boot
> -	0x9  Xen
> -	0xA  Gujin
> -	0xB  Qemu
> -	0xC  Arcturus Networks uCbootloader
> -	0xD  kexec-tools
> -	0xE  Extended (see ext_loader_type)
> -	0xF  Special (0xFF = undefined)
> -	0x10 Reserved
> -	0x11 Minimal Linux Bootloader
> -	     <http://sebastian-plotz.blogspot.de>
> -	0x12 OVMF UEFI virtualization stack
> -	0x13 barebox
> -	== =======================================
> +==== ==============================
> +0x0  LILO
> +      (0x00 reserved for pre-2.00 bootloader)
> +0x1  Loadlin
> +0x2  bootsect-loader
> +      (0x20, all other values reserved)
> +0x3  Syslinux
> +0x4  Etherboot/gPXE/iPXE
> +0x5  ELILO
> +0x7  GRUB
> +0x8  U-Boot
> +0x9  Xen
> +0xA  Gujin
> +0xB  Qemu
> +0xC  Arcturus Networks uCbootloader
> +0xD  kexec-tools
> +0xE  Extended (see ext_loader_type)
> +0xF  Special (0xFF = undefined)
> +0x10 Reserved
> +0x11 Minimal Linux Bootloader
> +      <http://sebastian-plotz.blogspot.de>
> +0x12 OVMF UEFI virtualization stack
> +0x13 barebox
> +==== ==============================

So why was the leading tab dropped and why wasn't this change,
unnecessary to the bug fix in question, declared in the changelog?

Thanks,

	Ingo
