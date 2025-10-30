Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7877F34D3B6
	for <linux-doc@vger.kernel.org>; Thu, 30 Oct 2025 21:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761860228; cv=none; b=EOUfozAwxMmQ0jufh9RNJbipdwnzLcL4U7dL10f58Su1q1ggWVLVjgduoWoPmxT7t+fefItiw++da+eDlaPP1Ff2+pd8p6jYz3c+EAqSGUjfFav3I8xCN5QLkgIkKfl2B/VNyK4UmmX7ZKMEWjwun6jVFAr555jGnJLmWd4rCnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761860228; c=relaxed/simple;
	bh=45jfdJnyJ32bvuggaDRa8h9Sl7RrgHGsxTBiE2SnqnM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LioulhSdl0U5bg0Y8D5zGiWOyvDQBp5/UDm8lkyPEUOC1itsumwLFRA/Nqd2Y+BiJuUjiZXuBcgHopvjciLWMVdwYC5WVbq8qWW8bOpwpx6MgOQN5ph8lfP/t25Zp38sKLH0r173peGDpwGOnjscSgJUqO66bJpet0jESSMbcLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Evh5FF7N; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Evh5FF7N"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4770c34ca8eso13912965e9.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Oct 2025 14:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761860223; x=1762465023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBQJ8NZZeDhVExk7zItWUyrPMSm4Navew7MC0raFrQo=;
        b=Evh5FF7NeH2CdnS6fyJOz0yuZNQpRoE39f8hPOsiPZSAa4r0HO4Td40cQ2JqR7p98s
         kW9sC6uVKHfymR6Bwc0RHT0UiLqB+1c08pkfJ9FwC0m2t65GZbMbJ7B1qzNteXyY+ZWk
         cu9OkXFtQpgpuzCF84asi+QaaZDkun3OgofDQX8GxG5rzyXsyY4scEYMV+LesWfF5HRN
         stIClQywZY0X9Y//nNewmkxAHUX6V8TogoKwg87rS8jC22n7mhPoDr4zCV/shaUFAo3k
         Vlm4CPXn7Z1RpurzoP3d/1Fs5OcKWDetXRQk9Uz7YfLPG3w5xlKoeVDAVNrQ92KPsKLN
         kv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761860223; x=1762465023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HBQJ8NZZeDhVExk7zItWUyrPMSm4Navew7MC0raFrQo=;
        b=hXDyEjALQF2UzGvrM8WmbwKKYPDGiqg0cfJtk2RtYMibgAQsYqvpW734kmei5DD0V+
         Eo8jl5a9m/GlwSqorc53I6BbErzK/FiIsEDsUXZiCul5Or96jnBeilAG+OQWp3Gsp/1/
         ODu9MfyZqInVRA4y3C2pMMOUhtkNHZ/3wyFPnm1EEaYaTxHsRfgnaLXVeQQ90mGSupnW
         yLOGBIlma6asSYfkR3ReCGteDOgWwqZoTELSFwpFM+DMfNlW5EwXSg8ZS/a8wbM3E7DE
         LRCiDvDjn5aJcp6OjBFawTyTOsAYxMUN27Z8gsLRKA1UGQ/gqfHF4A+ed65h9DB0bJjZ
         0C7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXE9sHnNus/fJ4IkuflY/hLc+0ACPIMFetIQ0BC2Av7Ahb2JxaUAJWAfrwaO74uXcG29rrU21mKvMo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS2RsB46cQe53bGjJ76Ssne2Sf0bEKhAiRX3DZAfjaTZZWHWSY
	H7M3qIppQr3SA6K7Kwun8S8OBip6CcHQngtBvW44/lDylgIrBBelxr6h
X-Gm-Gg: ASbGnctIQVvWmFDpZ20g+8Q3KllJvxsBYuAb7UY3g/JSElp+Yd6enAIOYgjw9t5VmHV
	u22+ZeWULZukkZU1t9oZVdMbVYwuNU77oMnmVTb4WOo3MQJfEyjhSqRAowHwcYBzBN1PnLOwJj7
	H65oArreyq5bqhlqBaWp7EAag7LGFYpLx/ASko+ks60xuH7csUVSktgoMg0h4RAY7t9b2mBdQXx
	FNKThWYknVPnVdhLyKc6WKii2j+mxGXk9Qur0vDiRvPLnRcHc/kAiygmCbNfs57J+fAsqCIK8My
	/7K9thKjFQPcNYy2qoZ52viLdatFYLCV8mLM3G9eBqU4/xj3HeWnH4HQ5LaSVBqr7H3GMQMWpcP
	aG3qnoPtkWlCOFtmRojBF4v9Vv4S8VfvePmOPv+NnBxUhf34a9Uny07lp6orQcbFI5J9SwT+vA6
	ql0WNpMmHu/dMJZxHmoYd+oIEpPtKdfaIp37PkJ7a/nQ==
X-Google-Smtp-Source: AGHT+IHL5HKRR2VQHGsF+tRPHFz6hmgUmkPnqqQQjatvWEU2WCyYG6/w1jSGFQ7BPsCBPfDzFNjvNQ==
X-Received: by 2002:a05:600c:528e:b0:46e:450d:e037 with SMTP id 5b1f17b1804b1-477307c213fmr10872665e9.5.1761860222541;
        Thu, 30 Oct 2025 14:37:02 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429ba445463sm4164266f8f.10.2025.10.30.14.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 14:37:02 -0700 (PDT)
Date: Thu, 30 Oct 2025 21:37:00 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: Andy Lutomirski <luto@kernel.org>, Dave Hansen <dave.hansen@intel.com>,
 Rick P Edgecombe <rick.p.edgecombe@intel.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, the arch/x86 maintainers <x86@kernel.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, Ard
 Biesheuvel <ardb@kernel.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tony Luck <tony.luck@intel.com>,
 "Alexander Shishkin" <alexander.shishkin@linux.intel.com>, "Kirill A .
 Shutemov" <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, Randy
 Dunlap <rdunlap@infradead.org>, David Woodhouse <dwmw@amazon.co.uk>, Vegard
 Nossum <vegard.nossum@oracle.com>, Xin Li <xin@zytor.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, Kees Cook <kees@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 "linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Subject: Re: [PATCH v10 08/15] x86/vsyscall: Reorganize the page fault
 emulation code
Message-ID: <20251030213700.1e98203e@pumpkin>
In-Reply-To: <e3c7987f-7f8d-41bb-9d4d-966f35941757@intel.com>
References: <20251007065119.148605-1-sohil.mehta@intel.com>
	<20251007065119.148605-9-sohil.mehta@intel.com>
	<a33d59c7add98dd9ef352ac95178821dbcd0ce0e.camel@intel.com>
	<3e3d2426-6296-4a61-beae-4e3ff5d60f2c@intel.com>
	<f4ae0030-9bc2-4675-ae43-e477cd894750@app.fastmail.com>
	<e3c7987f-7f8d-41bb-9d4d-966f35941757@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 30 Oct 2025 12:28:52 -0700
Sohil Mehta <sohil.mehta@intel.com> wrote:

> Thank you for taking a look at these patches.
> 
> On 10/30/2025 9:58 AM, Andy Lutomirski wrote:
> 
> > So I think all that's needed is to update "[PATCH v10 10/15] x86/vsyscall: Add vsyscall emulation for #GP" to check user_64bit_mode(regs) for the vsyscall case.  (As submitted, unless I missed something while composing the patches in my head, it's only checking user_mode(regs), and I think it's worth the single extra line of code to make the result a tiny bit more robust.)  
> 
> I probably don't understand all the nuances here. But, the goal of the
> check seems to ensure a 32-bit process running on a 64-bit kernel
> doesn't ever go through this vsyscall emulation code, right?

Do remember that there is no such thing as a '32-bit process'.
Changing to/from 'long mode' isn't privileged.
OTOH in 32-bit mode you can't generate an address above 4G.
(But I've no idea if the high register bits get cleared before the register
is modified.)

	David

> 
> I guess a user_64bit_mode(regs) check wouldn't harm. I'll add it when
> the vsyscall series is posted.
> 
> 
> 
> 
> 

