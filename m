Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD178221299;
	Mon,  8 Dec 2025 18:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765217508; cv=none; b=HtGwX95/BTiJlb4DrJSSruBI6l+JWPx2hiSLhU8orYMwTQvtgrm8iMIRiUskdEfbKIxNP/zazowjaXC4XRYDLZrj0ARVyXMHUv90glLIcI6o52dobDhc2QLohNr72yyaLC5lie7BxPaTvNWTNCskzA/9u0MKhDZAFHoN3y04dK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765217508; c=relaxed/simple;
	bh=eemVUFIqPhxEdI15d8t4tOPqfcYkuP/uR8QRwXi9jHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e2jlcfJmZwbdqiPsY0Tf5EZ6+rIum8MF5DBu4maaz4b5fNR0nEH3WfgJDV6EWx8K/5oOohV4qb4MmUsUCZ2/w8XTyn7DMbc2wLakWpeOCvBVtiXAD7XNWeKeYBsMXMXndhZqTlgjTFaCKCE70nMzmeD7hB/SxqreTraDdIDSFQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QMYAbUOU; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QMYAbUOU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=1EV3YRoqvINn/Yg2XmShnLY6ODzLYeAG26MJkWFF6dw=; b=QMYAbUOU0ED2Ku03jCM0qkXhxM
	JKev2OVv/Mf72hRrtFu3kLA7IazIzao6OcKmuDzdsTwCXSHsXzLNGH0ZYuZ5KhSu8F7Ks6WunZkRe
	UvxDMqznUgxE3YeBQgvHPaqdpyzW8X5aZyseLRAO6ONf4+RtkNlNuZiUhXsKUTLySblkEx1O1m0CD
	PC+Yp5y2e+L5WO2AwdIrY0HM4w9Td7k2wJvyyZEko+ydQZijxH/p14a5aBf5Dr1lqTfxDL8+FSLSX
	E5plVvXecFIBld5hwaqk0uWyHMUXTcrOU0DbzIBKTdFaXopIAo4raIqM60Rf9H3o+tmJyVh5TnbJx
	g8vSKQJg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSfht-0000000DQBe-0cX3;
	Mon, 08 Dec 2025 18:11:33 +0000
Message-ID: <9f8909c8-e91c-47b8-9782-0bec25f12803@infradead.org>
Date: Mon, 8 Dec 2025 10:11:31 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: x86/boot: Fix malformed table in boot.rst
To: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
 "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)"
 <linux-kernel@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Cc: skhan@linuxfoundation.org, david.hunter.linux@gmail.com
References: <20251208210113.24057-1-swarajgaikwad1925@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251208210113.24057-1-swarajgaikwad1925@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/8/25 1:01 PM, Swaraj Gaikwad wrote:
> Building the documentation with make htmldocs previously failed with the
> following error, causing the "Assigned boot loader IDs" table to not
> render at all in the HTML output:
> 
>   Documentation/arch/x86/boot.rst:437: ERROR: Malformed table.
>   Text in column margin in table line 2.
> 
> This occurred because the ReStructuredText (RST) simple table header
> defined the first column width as 2 characters (==), which is too narrow
> for data entries like 0x10 and 0x13. This dimensional mismatch caused
> the text to spill into the margin, triggering a docutils parsing
> failure.
> This patch fixes the issue by expanding the column width in the table
> header to 4 characters (====) to correctly accommodate the widest
> entries and alignment. After applying this patch, the documentation builds
> successfully and the "Assigned boot loader IDs" table now displays
> correctly in the generated HTML.
> 
> Build environment: Python 3.13.7 Sphinx 8.2.3 docutils 0.22.3
> 
> Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

The second chunk does not apply cleanly. It was apparently
supposed to be deleting some trailing spaces, but somewhere
those trailing spaces were dropped. And that's not described
in the patch description, so I suggest that you or anyone who
applies this patch just drop the second chunk.


Thanks.

> ---
>  Documentation/arch/x86/boot.rst | 50 ++++++++++++++++-----------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/arch/x86/boot.rst b/Documentation/arch/x86/boot.rst
> index 6d36ce86fd8e..99b42e9d0e1c 100644
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
> 
>    Please contact <hpa@zytor.com> if you need a bootloader ID value assigned.
> 
> @@ -814,7 +814,7 @@ Protocol:	2.09+
>     	__u32 len;
>     	__u8 data[];
>     }
> -
> +
>    Where, the next is a 64-bit physical pointer to the next node of
>    linked list, the next field of the last node is 0; the type is used
>    to identify the contents of data; the len is the length of data
> --
> 2.52.0
> 
> 

-- 
~Randy
