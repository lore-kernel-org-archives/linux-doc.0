Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53852BEFED
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 13:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761054491; cv=none; b=iLPLq05vPMQfw//KvZ41YAGrhH6e1qQ1WZ2xcJRA+ungc4/Ak05NTPHTLS6qb8d7wTju/A3kiH+HM2Bz6VmV3nPqGHRMsvisKR/9ENdpwy5v2TS8gyX+EBopkuo7v+G/+P284+qz8ZUAdIr8leuL0OZrpt1a0KmAVvPRNVROT4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761054491; c=relaxed/simple;
	bh=hWVpdQ4qzW3f4IwuZZhcoX4ShVzp4YZhPQ1LBXovShI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KXrFuP6MEhVy273h0xmGjlbNEQ9B1gvCAitPJDlylIHCcpOtjnjdB1aGHCPnCI5Ack1ewSLGRXfFjVF8lNXZGF01V6uJcYCI+8Mzts7yRbR8djlj1fj1r3ZKMnqf8htl+Aks6cnw9FBlqbWS/DAg81siD1X6NqcCp1NBAeKzcRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YNJ7zmN1; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNJ7zmN1"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-427091cd4fdso2709001f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 06:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761054486; x=1761659286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fDKI+uqj4/PiSrDUg7xaC6n35ZWBi8QY/gzE9TEB0ME=;
        b=YNJ7zmN17iHMQuFs/KTWcvDxIYJtnMzrERHM4ZNbU6kCmRvLKIV+JsStIVkOFNAb18
         EUI69Sl5onBFYOTYukm3PYYVPvJ20GHzV1FKTWCBQZTGGbwBKextq2keypg6MxvAv+QX
         /xqtV+ZiN0WuCMLMzhxyS5VT/ffVOto55LruF0miMLzgHlSTLTrRoXg6Ds18NtlTHmYA
         NhYUhcrs0kJ0ZQsmTSbiuNACrJgygH2MeSWmDkpelLWwcfxHqt+tLuHiB7lKgO+JuyMe
         Nv3Br0iCec68hZhBYpGWcKWt9SZITdSg790JOsWG/lD24jZP2eNmd3tpN6QSkoaQK6Ld
         jv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761054486; x=1761659286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDKI+uqj4/PiSrDUg7xaC6n35ZWBi8QY/gzE9TEB0ME=;
        b=kh0ky7BN4U9X44y0e581NjmOjlP+UjVc/je8e2w/blp0yExUOe+msh6L5oEidGQ6gV
         1uIIysCcTTeRiKjaQ8U3W9c8omsI4LWGDiiRoLkQnwZikQX8r5FtAczScFBSxfzHVjfz
         yBnaoRz8AqKavcpksvM9P/frTCvjcJXj/EipMqEHjtjgnBEdMcRcACbr16bhBF6l5Y1u
         yUF9SOeHUUp8oFqNQP09QLdrYaLp1Lx9WhMPBhLCFffWJpCUToH5tkad3OH8ogPmYKbL
         artw4K0Erb0+WrZvibZ8JUDtGUTo5yleZXAkW/UK76GQ2AkGNOk0HKv+Ayn08ZG/Sq7G
         YKcA==
X-Forwarded-Encrypted: i=1; AJvYcCX26wciIwv7Rv/BeyetXkjSGD4ZwdaDxXxhfmvwweBUhCZwz3hhS3OSKE+DVuv2IkbN7C72HLBsPm8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRIc84Iboeq8sVGRKdtDM01JfCP4iVd4O6KGCLs8lwejL9OoTJ
	xgU9DAs0XiQgEn2WGMC0WySfpNq8OaYK7I1Fn4W2UxOaHw2YeEGG0W6m
X-Gm-Gg: ASbGnct8ZUMinyDK8m63yoQYykvC84aDEtrR49Xu+KHhiQgAvJzscOk1or4mVwaPrgA
	iAfmS5vsz6qyAr7OcRw00mUUExNdTc+KITcx2B4+uCXOUxAhkjXm+c0UbITKLncYel1XjstOf0b
	fXp3jAjJ82HsJTw7TRUf+7aBr7kNkmdfcx7M/Tkm1Y9o/G/4vRMBLOOU0+b6wtMSXcQB26kP/3V
	3n032JHx9Kd9JoStcfs/2PKLeCKIQdmWkCJhqFQUpVMF84db+84V939Vl8hFJ9hmnisok73i9px
	KfzbxaKx5uxX4yvT4KTm5ENCJ5pjQ22dGcgd5OXbClqdfmmt/ExK4toN2SPNK0AseIG4sib+J+h
	2zVyzrNLPoYDlO3/D0O7KI/SGU9/laNnUdPtoGja9/+Iaddp6H1o/Ctn7yvQ32DwqLH5Lw5PpxW
	TlNzvOdABRRSZ9V9kEzEzItfbNPThlINsRoLn3SOdesQ==
X-Google-Smtp-Source: AGHT+IF6HCVp6aK0SgfW6hE72HLbI/KN18j5SeYFoFF6iWu0oTL02abLRhSo7ownBmlUpl0HSN4Z6A==
X-Received: by 2002:a05:6000:310b:b0:426:d80c:2759 with SMTP id ffacd0b85a97d-42704d610f8mr10968224f8f.25.1761054485851;
        Tue, 21 Oct 2025 06:48:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a781sm20879873f8f.30.2025.10.21.06.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 06:48:05 -0700 (PDT)
Date: Tue, 21 Oct 2025 14:48:03 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Sohil Mehta <sohil.mehta@intel.com>, x86@kernel.org, Dave Hansen
 <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>, "H . Peter
 Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ard
 Biesheuvel <ardb@kernel.org>, "Kirill A . Shutemov" <kas@kernel.org>, Xin
 Li <xin@zytor.com>, David Woodhouse <dwmw@amazon.co.uk>, Sean
 Christopherson <seanjc@google.com>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, Vegard Nossum <vegard.nossum@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Randy Dunlap
 <rdunlap@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Kees
 Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org
Subject: Re: [PATCH v10 02/15] x86/asm: Introduce inline memcpy and memset
Message-ID: <20251021144803.519e6244@pumpkin>
In-Reply-To: <20251021124751.GLaPeA9z8BCIe8AudC@fat_crate.local>
References: <20251007065119.148605-1-sohil.mehta@intel.com>
	<20251007065119.148605-3-sohil.mehta@intel.com>
	<20251021124751.GLaPeA9z8BCIe8AudC@fat_crate.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Oct 2025 14:47:51 +0200
Borislav Petkov <bp@alien8.de> wrote:

> On Mon, Oct 06, 2025 at 11:51:06PM -0700, Sohil Mehta wrote:
> > From: "Peter Zijlstra (Intel)" <peterz@infradead.org>
> > 
> > Provide inline memcpy and memset functions that can be used instead of
> > the GCC builtins when necessary. The immediate use case is for the text
> > poking functions to avoid the standard memcpy()/memset() calls within an
> > RFLAGS.AC=1 context.  
> 
> ... because objtool does not allow function calls with AC=1 because... see
> objtool/Documentation/objtool.txt, warning type 9, yadda yadda...
> 

But for the purpose of code patching they don't need to be 'rep movsb'.
An inline function with a C byte copy loop is fine - provided you do
something to stop gcc pessimising it.

Obvious options are a volatile pointer (or READ_ONCE()) or a barrier().

	David
