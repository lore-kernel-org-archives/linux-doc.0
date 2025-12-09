Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E3D3081BE;
	Tue,  9 Dec 2025 21:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765314651; cv=none; b=FxEWWcSerxG4Rpc2rLsKve7d2dpx2ZHsrrew9vLgYMTYCAEl5BZrUwv7kyL6k9OH3oQkhyCXPUvzZ12rFKllL1pUTwj9jDWRe585aE0luDjRbCCrpySa7eHky7WxwtohiRuSq1nOPYv6RtFV3LoOYwJxBo9xnExtTqJ/g2rTErY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765314651; c=relaxed/simple;
	bh=n/Qf0H7fgMS6CJmA1i0un9AdOv3OTpCaotEoKrA6WgA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=rgRJGme/4AC2XDI81KeRA6YGszdY9Inqx/OVUPNSafspC8vVXQDlm7NYHSpjkPG8nGoUc1ZDbbbTjPs5lajI+PsszmPmqrKVA7XRTww7wz8IvC+FSEfM0FA6Uis3bxQg0xiBsBA3dtUQq4Gi7uXW1h66wtFOKFKQWxBdDjUUVlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eQP8QNC0; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eQP8QNC0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=xJn5/KZh0Z9l3rPow2y4TPATylpnKJUDx0hgaEnirxc=; b=eQP8QNC0VLKn26kcbC7xKQ5UhA
	rAGI2CyNVVBB+r/S5mi3yl4ZUDLh5Yfo+117o8lW8Of/5QuqoPD6H/bhvH7+SdzuwjrSjmfNqihd/
	VgHZkRdcpBhckrez16Yb/I9kFRLhL68ro0VjCrXX7wVwJLeWmvR3Vc18S5wdeWrBrShWNgxthvgIN
	+4gpwnSuSjIrJ+PdqcgShv+xj1xgqy2jg5eSMeO8U63jPVjfaLHIZEmntf3lALrdokx1ykk6OcCUU
	vGLVjBtk6y2IHnJlZMC1B+WHUL3MAH/SAhe4cDGzljVV1K+t7XefBi1FIkjbiwZuBUjc9Dy13Rb/O
	BQoH/1ag==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4yp-0000000EoIh-1vhv;
	Tue, 09 Dec 2025 21:10:44 +0000
Message-ID: <438a873c-0ca8-43cf-b705-e224d5c57d05@infradead.org>
Date: Tue, 9 Dec 2025 13:10:41 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Documentation: x86/boot: Fix malformed table in
 boot.rst
From: Randy Dunlap <rdunlap@infradead.org>
To: Ingo Molnar <mingo@kernel.org>,
 Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Cc: bp@alien8.de, corbet@lwn.net, dave.hansen@linux.intel.com,
 david.hunter.linux@gmail.com, hpa@zytor.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, skhan@linuxfoundation.org,
 tglx@linutronix.de, x86@kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>
References: <20251208210113.24057-1-swarajgaikwad1925@gmail.com>
 <20251209085330.9124-1-swarajgaikwad1925@gmail.com>
 <aTfjlAKBNeX6my4g@gmail.com>
 <a0a141d8-7e22-45ba-9bc2-74a3f0285cac@infradead.org>
Content-Language: en-US
In-Reply-To: <a0a141d8-7e22-45ba-9bc2-74a3f0285cac@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/9/25 10:15 AM, Randy Dunlap wrote:
> 
> 
> On 12/9/25 12:53 AM, Ingo Molnar wrote:
>> * Swaraj Gaikwad <swarajgaikwad1925@gmail.com> wrote:
>>
>>> Sphinx reports htmldocs warnings:
>>>
>>>   Documentation/arch/x86/boot.rst:437: ERROR: Malformed table.
>>>   Text in column margin in table line 2.
>>>
>>> The table header defined the first column width as 2 characters ("=="),
>>> which is too narrow for entries like "0x10" and "0x13". This caused the
>>> text to spill into the margin, triggering a docutils parsing failure.
>>>
>>> Fix it by extending the first column of assigned boot loader ID to 4
>>> characters ("====") to fit the widest entries.
>>>
>>> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>>> Tested-by: Randy Dunlap <rdunlap@infradead.org>
>>> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
>>> Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
>>> ---
>>> Changes in v2:
>>>  - Dropped accidental whitespace changes (the second chunk in v1).
>>>  - Simplified commit message as suggested by Bagas Sanjaya.
>>>
>>> ---
>>>  Documentation/arch/x86/boot.rst | 48 ++++++++++++++++-----------------
>>>  1 file changed, 24 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/Documentation/arch/x86/boot.rst b/Documentation/arch/x86/boot.rst
>>> index 6d36ce86fd8e..89e785850f7e 100644
>>> --- a/Documentation/arch/x86/boot.rst
>>> +++ b/Documentation/arch/x86/boot.rst
>>> @@ -433,30 +433,30 @@ Protocol:	2.00+
>>>
>>>    Assigned boot loader IDs:
>>>
>>> -	== =======================================
>>> -	0x0  LILO
>>> -	     (0x00 reserved for pre-2.00 bootloader)
>>> -	0x1  Loadlin
>>> -	0x2  bootsect-loader
>>> -	     (0x20, all other values reserved)
>>> -	0x3  Syslinux
>>> -	0x4  Etherboot/gPXE/iPXE
>>> -	0x5  ELILO
>>> -	0x7  GRUB
>>> -	0x8  U-Boot
>>> -	0x9  Xen
>>> -	0xA  Gujin
>>> -	0xB  Qemu
>>> -	0xC  Arcturus Networks uCbootloader
>>> -	0xD  kexec-tools
>>> -	0xE  Extended (see ext_loader_type)
>>> -	0xF  Special (0xFF = undefined)
>>> -	0x10 Reserved
>>> -	0x11 Minimal Linux Bootloader
>>> -	     <http://sebastian-plotz.blogspot.de>
>>> -	0x12 OVMF UEFI virtualization stack
>>> -	0x13 barebox
>>> -	== =======================================
>>> +==== ==============================
>>> +0x0  LILO
>>> +      (0x00 reserved for pre-2.00 bootloader)
>>> +0x1  Loadlin
>>> +0x2  bootsect-loader
>>> +      (0x20, all other values reserved)
>>> +0x3  Syslinux
>>> +0x4  Etherboot/gPXE/iPXE
>>> +0x5  ELILO
>>> +0x7  GRUB
>>> +0x8  U-Boot
>>> +0x9  Xen
>>> +0xA  Gujin
>>> +0xB  Qemu
>>> +0xC  Arcturus Networks uCbootloader
>>> +0xD  kexec-tools
>>> +0xE  Extended (see ext_loader_type)
>>> +0xF  Special (0xFF = undefined)
>>> +0x10 Reserved
>>> +0x11 Minimal Linux Bootloader
>>> +      <http://sebastian-plotz.blogspot.de>
>>> +0x12 OVMF UEFI virtualization stack
>>> +0x13 barebox
>>> +==== ==============================
>>
>> So why was the leading tab dropped and why wasn't this change,
>> unnecessary to the bug fix in question, declared in the changelog?
> 
> Hi Ingo,
> 
> It makes no difference to the generated html output, but for users
> who read Documentation/* files in place, the leading tab indentation
> looks a little nicer IMO. Yes?
> 
> Thanks for noticing.

FWIW, I would have done it like this:

---
 Documentation/arch/x86/boot.rst |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20251205.orig/Documentation/arch/x86/boot.rst
+++ linux-next-20251205/Documentation/arch/x86/boot.rst
@@ -433,7 +433,7 @@ Protocol:	2.00+
 
   Assigned boot loader IDs:
 
-	== =======================================
+	==== =======================================
 	0x0  LILO
 	     (0x00 reserved for pre-2.00 bootloader)
 	0x1  Loadlin
@@ -456,7 +456,7 @@ Protocol:	2.00+
 	     <http://sebastian-plotz.blogspot.de>
 	0x12 OVMF UEFI virtualization stack
 	0x13 barebox
-	== =======================================
+	==== =======================================
 
   Please contact <hpa@zytor.com> if you need a bootloader ID value assigned.
 


-- 
~Randy

