Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24962BFC85
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 17:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768410595; cv=none; b=YolfK/qU/ZXxFpjlQ6Z34q79YX88nsKfW4KNNmEnK0e5KgxLqoCdCQ+bOQu0Bxx/1nAuNfkdJL4grRr1fyGh6FgtJwTlXwAm2pKuBQr3QdvXBo/ZSmG75Q0xDpQVZX7QsxvtEruA4lBelLOKrpxqyshQCShpkSSLIgEBnB7A0wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768410595; c=relaxed/simple;
	bh=PM6sHi1aQfy0NtK9ko2ZFgH/OijvhK/kCkUnfQiolAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UGyrCnGj4N/aMjd3VgMvg6pp3qDQ59F3IkXo16oU9sQLRYEfzGyJ+1jdJSVHbHRUxy5c0KQIEcD/zAYO24m1GlynOtzzJfkU78UXDbx6i1oY1wttuNOHTh5LV9h9DBdF29yp2IyNNmf8KxIrXmEZAg3rMJOquLxE6Yq/4DOFHjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shenghaoyang.info; spf=pass smtp.mailfrom=shenghaoyang.info; dkim=pass (2048-bit key) header.d=shenghaoyang.info header.i=@shenghaoyang.info header.b=EvnJ18aU; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shenghaoyang.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shenghaoyang.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shenghaoyang.info header.i=@shenghaoyang.info header.b="EvnJ18aU"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-34abca71f9cso406077a91.3
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 09:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shenghaoyang.info; s=google; t=1768410593; x=1769015393; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7mzYYJYLlSKoW+IZetZsbxI9tBQZKOvmgPmXcCAqdY=;
        b=EvnJ18aUOj8QfcPfJ3/s1L7bK3/408J1P7VDM9KmmWQYvJTjvJnPm4YqTliIQtGvSq
         wton5eObUlJ1S8iboCnS2l0R5pEF9coWuxbtOzQL6WAvANp20SmSESejFVLb25J2LrNO
         0vdOAog4zgn4DEdwfmgU5/wTyAMSc7viT06AgV80csm66iSejYaIgmNFTobz1kxwUdmK
         5DAaDQD9HOvee+2HxMapiuus2tJlVF57NZUta3Gdv2Eds0qDGLXrm16y5uP1CHiCcyU2
         ortQd9+t1bEDQbezoIjwYDFoh3VSZUUuwgaVUm54SmEIhOdDGtR3/82Qcyd7kwP+spcg
         zADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768410593; x=1769015393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7mzYYJYLlSKoW+IZetZsbxI9tBQZKOvmgPmXcCAqdY=;
        b=BsyCFM+yG54MDEnlql6E+mjd7fvHWjdcX0CSYvLN7iBe08E5CiIUNzmqkn591EeWwp
         wh70i4sQ/1Rg67s3kJJrqWXPVANSzILZZZD+Ugse2ZZLij8sy/aryd5jSTDWjdNl49oJ
         qCN19n2o9VetcZt+euARIJmtwzOpxt72OaV6plF2rSe+x3dvj6lO1RF5FcmXS6llwuED
         IAcqXe35XqKTL3YwPyTzjlmgmhgKxNPCDbxfruXIt3qA286TKlqmL8umOe0dMBApdUBu
         fndTU0YUMmk7gkT48eLUf6A4SZc35S4oNqzYaDl8rVRLCupLlUMXu7YlRIqxHjYydJwH
         m45A==
X-Forwarded-Encrypted: i=1; AJvYcCVoWcs/6AXYJ0GryGtFFClktxaFRKlLUZpEmZXlEEPKoxzSGVhOjgSWQPwvkEWhPECkZ9a5VFneLxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU3VPwjVhdjVM57CzzSW/VQBQfaliOKKlDWuvsaulkeYoZGZRd
	bsPdgguhHESJAZ73ks7SkVTA5pOkGacWRXuvlIDP5ik2iPaJ5hXes7VAP4e/AVEM6tQ=
X-Gm-Gg: AY/fxX5YsDEjhqSD09/xK+84Ll/QpanJGw2mjYZkibceawWLFO2iqijFUOGo+MYOmPQ
	n23AL+dlYzJ+NBtChO2fpM0xNSKCNl+D+Wzf/aiXHb6kJGbR37C5qLS9vIk+xr1bXbQax7apCWb
	yxXmXZE/2Dskz8KzDIkLuNPkddxWDUDpG9BQtj2oZG9M3J6VkiOF7Fcl4MbrDk5WlmswkMTUQdp
	AqibuJZjf+f0xoHLgNn0ArktJEY8pTigqb9UH4Bjzw7R2dXp6RaTqrzUYp48jomywuA5VqCuHYl
	VspfCQQVU8c+w/Rn4lYexZpIxv++QWRlub9+xBncz5n7D0QD+BKvZm2Jl4hGHJg2b0x4JXxUtLs
	6TZBv5cgZyt7U/9LJsLyEI0aNknj+z1FppSwaxmv5G8JCveUl6CSi69aJGi76zxFKPZTEPEWc2V
	bE8q7j97nj0lEb
X-Received: by 2002:a17:90a:fc4c:b0:34f:4416:33b5 with SMTP id 98e67ed59e1d1-3510918d67bmr2365054a91.8.1768410593040;
        Wed, 14 Jan 2026 09:09:53 -0800 (PST)
Received: from [10.0.0.178] ([132.147.84.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3510691b655sm1211536a91.2.2026.01.14.09.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 09:09:52 -0800 (PST)
Message-ID: <b5d54942-f280-40ab-b445-00b6dc610a8e@shenghaoyang.info>
Date: Thu, 15 Jan 2026 01:09:40 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] x86/acpi: Add acpi=spcr to use SPCR-provided default
 console
To: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org, Jonathan Corbet <corbet@lwn.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org
References: <20251228092222.130954-1-me@shenghaoyang.info>
 <20260114154656.GDaWe6cFCruAGbJbhe@fat_crate.local>
Content-Language: en-US
From: Shenghao Yang <me@shenghaoyang.info>
In-Reply-To: <20260114154656.GDaWe6cFCruAGbJbhe@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14/1/26 23:46, Borislav Petkov wrote:
> On Sun, Dec 28, 2025 at 05:22:22PM +0800, Shenghao Yang wrote:
>> Commit 0231d00082f6 ("ACPI: SPCR: Make SPCR available to x86")
>> made SPCR available as an earlycon option on x86 but did not add
>> it as a preferred console to avoid breaking existing setups -
> 
> No one has noticed AFAICT since 2018 (this commit's date).
> 
> Also:
> 
>         /* Do not enable ACPI SPCR console by default */
>         acpi_parse_spcr(earlycon_acpi_spcr_enable, false);
> 
> Looks nicely conservative to me.
> 

Thanks for taking a look.

>> users have to round trip the dumped console options
>> ("SPCR: console: uart,io,0x3f8,115200") back via their
>> bootloader.
> 
> I don't know what that means.

The kernel decodes the SPCR table and dumps the settings to use
the firmware preferred console in the kernel log:

[    0.005091] ACPI: SPCR 0x000000007FFB5000 000059 (v04 ALASKA A M I    01072009 INTL 20250404)
[    0.073387] ACPI: SPCR: console: uart,io,0x3f8,115200

We've been inserting the dumped config into the kernel command 
line and rebooting on first boot (e.g. console=uart,io,0x3f8,115200),
but would love to avoid this loop.

> 
>> Let users opt in so serial console configuration can be made
>> automatic.
> 
> Why?

It's easier this way for larger fleets - we don't want to manage
hardware specific serial console settings on the kernel command line
if the firmware is already capable of telling us the correct ones.

> 
> Text says:
> 
> 	[X86] When used with no options the early console is
> 	determined by the ACPI SPCR table.
> 
> But the code doesn't enable the SPCR console by default.

If earlycon is specified on the command line the console from SPCR
is used, but only as a boot console. It's not present in
/proc/consoles.

It is possible to retain it with keep_bootcon, but that uses the
less efficient (in the 8250 case) 8250_early driver.

> 
> I have no clue what this patch is trying to do.
> 

In 0231d00082f6 ("ACPI: SPCR: Make SPCR available to x86") the SPCR
console is only added as an option for earlycon but not as an ordinary
console so users don't see console output changes.  

The patch adds an opt in so we can get the SPCR console added as
an ordinary console.

Thanks,

Shenghao
