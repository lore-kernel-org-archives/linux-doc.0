Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CE61FBC8E;
	Tue,  9 Dec 2025 18:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765304131; cv=none; b=KTy5uA3l2Iy7MkqgdqKSZbiu4eynBUvWdLSYQoyJF4bktwCqeWrRVZyNV3hovF+5TQJlu3SsRQPh2cHS+6Y8yremW+/JMl7wS26IZLHezat39atatTsvMe408teemmOIyqwvDL0rSFA68t86fQa6javy5V7B+UP8LRbK/FI70LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765304131; c=relaxed/simple;
	bh=LH5+klOjVc76hTwA4TrNZMOqvVWC063/qhUHROKv1+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S/zMBzDmolZAQjDF+YRInsUMC3tOjq9HXc4BK55+F4ENHvmyVqdrByT5GXYi1TOWMzz5iwUbpfuwAG2mK4i+kmspGRCr/AO3R8IBdaIWItBQZuSXWLI6x31eAUzz92j3mUin4lEG8JaSUYKBWM4lk/IXJnTAkKYBXkRmhSHeGLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qTGIHjXN; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qTGIHjXN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=uN2sCqPF/oq2UMysh8J25QMZlJf+jrZOQd9WALtcvbw=; b=qTGIHjXNmU86U+qI1GrANFYMgu
	GrFyD9MS/F+1oGfbsn+S33HMDHr8uCttfdKT4fu8izk+SPjFetKdk7molwIh/b18pe4nxibRyHv/m
	3Fz+nIX0WsofTZaA+RlR/nNzr1NSmZpDZ0fz5cubZ3wSfwwIljz0kZq0Y+jqJGgg9s4Hao1OdleuO
	Sae/eKfMjSefMnkBWv7i+Jyt33+vFIlng5YVQIKiLl8yVvXf32bJTbFRg9pYahoN8L4hRvvay6LWZ
	vhPAuLwZ1Rt+VLjgRzH6Q1rR9sYx7X30m2TzN0y6j0EFIlJUzSQURihn02QT8kv/xHjcqIa9fVNJl
	FKzu2yFQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT2F4-0000000Edqg-0jUA;
	Tue, 09 Dec 2025 18:15:18 +0000
Message-ID: <a0a141d8-7e22-45ba-9bc2-74a3f0285cac@infradead.org>
Date: Tue, 9 Dec 2025 10:15:14 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Documentation: x86/boot: Fix malformed table in
 boot.rst
To: Ingo Molnar <mingo@kernel.org>,
 Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Cc: bp@alien8.de, corbet@lwn.net, dave.hansen@linux.intel.com,
 david.hunter.linux@gmail.com, hpa@zytor.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, skhan@linuxfoundation.org,
 tglx@linutronix.de, x86@kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>
References: <20251208210113.24057-1-swarajgaikwad1925@gmail.com>
 <20251209085330.9124-1-swarajgaikwad1925@gmail.com>
 <aTfjlAKBNeX6my4g@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aTfjlAKBNeX6my4g@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/9/25 12:53 AM, Ingo Molnar wrote:
> * Swaraj Gaikwad <swarajgaikwad1925@gmail.com> wrote:
> 
>> Sphinx reports htmldocs warnings:
>>
>>   Documentation/arch/x86/boot.rst:437: ERROR: Malformed table.
>>   Text in column margin in table line 2.
>>
>> The table header defined the first column width as 2 characters ("=="),
>> which is too narrow for entries like "0x10" and "0x13". This caused the
>> text to spill into the margin, triggering a docutils parsing failure.
>>
>> Fix it by extending the first column of assigned boot loader ID to 4
>> characters ("====") to fit the widest entries.
>>
>> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>> Tested-by: Randy Dunlap <rdunlap@infradead.org>
>> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
>> Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
>> ---
>> Changes in v2:
>>  - Dropped accidental whitespace changes (the second chunk in v1).
>>  - Simplified commit message as suggested by Bagas Sanjaya.
>>
>> ---
>>  Documentation/arch/x86/boot.rst | 48 ++++++++++++++++-----------------
>>  1 file changed, 24 insertions(+), 24 deletions(-)
>>
>> diff --git a/Documentation/arch/x86/boot.rst b/Documentation/arch/x86/boot.rst
>> index 6d36ce86fd8e..89e785850f7e 100644
>> --- a/Documentation/arch/x86/boot.rst
>> +++ b/Documentation/arch/x86/boot.rst
>> @@ -433,30 +433,30 @@ Protocol:	2.00+
>>
>>    Assigned boot loader IDs:
>>
>> -	== =======================================
>> -	0x0  LILO
>> -	     (0x00 reserved for pre-2.00 bootloader)
>> -	0x1  Loadlin
>> -	0x2  bootsect-loader
>> -	     (0x20, all other values reserved)
>> -	0x3  Syslinux
>> -	0x4  Etherboot/gPXE/iPXE
>> -	0x5  ELILO
>> -	0x7  GRUB
>> -	0x8  U-Boot
>> -	0x9  Xen
>> -	0xA  Gujin
>> -	0xB  Qemu
>> -	0xC  Arcturus Networks uCbootloader
>> -	0xD  kexec-tools
>> -	0xE  Extended (see ext_loader_type)
>> -	0xF  Special (0xFF = undefined)
>> -	0x10 Reserved
>> -	0x11 Minimal Linux Bootloader
>> -	     <http://sebastian-plotz.blogspot.de>
>> -	0x12 OVMF UEFI virtualization stack
>> -	0x13 barebox
>> -	== =======================================
>> +==== ==============================
>> +0x0  LILO
>> +      (0x00 reserved for pre-2.00 bootloader)
>> +0x1  Loadlin
>> +0x2  bootsect-loader
>> +      (0x20, all other values reserved)
>> +0x3  Syslinux
>> +0x4  Etherboot/gPXE/iPXE
>> +0x5  ELILO
>> +0x7  GRUB
>> +0x8  U-Boot
>> +0x9  Xen
>> +0xA  Gujin
>> +0xB  Qemu
>> +0xC  Arcturus Networks uCbootloader
>> +0xD  kexec-tools
>> +0xE  Extended (see ext_loader_type)
>> +0xF  Special (0xFF = undefined)
>> +0x10 Reserved
>> +0x11 Minimal Linux Bootloader
>> +      <http://sebastian-plotz.blogspot.de>
>> +0x12 OVMF UEFI virtualization stack
>> +0x13 barebox
>> +==== ==============================
> 
> So why was the leading tab dropped and why wasn't this change,
> unnecessary to the bug fix in question, declared in the changelog?

Hi Ingo,

It makes no difference to the generated html output, but for users
who read Documentation/* files in place, the leading tab indentation
looks a little nicer IMO. Yes?

Thanks for noticing.
-- 
~Randy

