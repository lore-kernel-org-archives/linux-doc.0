Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1FD370D52;
	Tue,  3 Mar 2026 22:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772578342; cv=none; b=akr9+JQOEA5ADFI32tLeLaAFiUPuCOUH4IKGyX+FjyFyv0sH3rXFOnT8djlaNJTwnEi+j8E4rLzZeJBtRiO8In6QquOEGPjgfZgtxKHPatpMm7Pa8r//xXK8sy4CJYM6UjFsLKXI3GTUFAAMCLwXnbDGj7O6wYbZgIy7ZeGEEPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772578342; c=relaxed/simple;
	bh=KkKFMt+NKSjC/iuAWFOKDY+6iw+XZpHyZpJ2eGO+Vk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VXb6YWu9AXCVslnrf2ViwVsZwShbFOwddo1jQZ0pLHIAHBY1x2sG99yfF2F1y5zpW4iGXK2sn+f4/Olu2vSjnV4EpKWPauQTF6nd5Kh1cdehYmr+jIHOWHJSOsdQ1U6ScN2Tk9QWXTJxeySTu2iYlT6G+3WDrAtY6ZsBhht2VEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=U8VFaajR; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="U8VFaajR"
Received: from [172.27.2.41] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 623MZNuw3553846
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 3 Mar 2026 14:35:24 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 623MZNuw3553846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772577327;
	bh=PWkUhVKmvPcsYyQkSE4NsHuA0TlmqkuDcsXL0WFf/qo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U8VFaajRyrd9D/ni57g7wy0FTw3hgzom41MFBWfMDP4bxMGgwlC/D5AkQ24CkrHM2
	 UYM/pWGsL6ZTaEf6ruWZbE0rAiUfMo6gpX0XtTMZMQlb77hSWF+Z7uBDkdSyyUV+1V
	 uHICECWKzLonM4GhPIwwUTOZhn/OLmV2wwRGDYEMpKOVZX71koUpomJhIRH+yeui1T
	 NeU7bXoUjViZObR4nVN6+m1CVm4ammnIHtTIPtP7RijvcIKFdKmqSL2y55RswBprHX
	 IcVSthQNF2rJsbc4WEgwpCW+pAQyD4KMHJEXOpcqdu3CAgG57FM6uWJuhK3dOiAIvL
	 uh7IlOo0SLFaQ==
Message-ID: <3212161f-64b2-4825-8bcc-c36201ab6589@zytor.com>
Date: Tue, 3 Mar 2026 14:35:18 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] x86/vsyscall: Add vsyscall emulation for #GP
To: Sohil Mehta <sohil.mehta@intel.com>, Dave Hansen <dave.hansen@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Kiryl Shutsemau <kas@kernel.org>,
        Brendan Jackman <jackmanb@google.com>,
        Sean Christopherson <seanjc@google.com>,
        Nam Cao <namcao@linutronix.de>, Cedric Xing <cedric.xing@intel.com>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Tony Luck <tony.luck@intel.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maciej Wieczor-Retman <m.wieczorretman@pm.me>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260219233600.154313-1-sohil.mehta@intel.com>
 <20260219233600.154313-4-sohil.mehta@intel.com>
 <1383b357-2a10-4b36-afb9-42e2724faa31@intel.com>
 <faf58379-36df-4535-8c17-bcfe838ae4c4@intel.com>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <faf58379-36df-4535-8c17-bcfe838ae4c4@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-03-03 13:20, Sohil Mehta wrote:
> 
> Sure, combining things from the cover letter and what you suggested
> here. How about?
>

[...]

> 
> "The vsyscall page is located in the high/kernel part of the address
> space. LASS prevents access to this page from userspace. The current
> kernel only enables LASS when all vsyscall modes are disabled.

Suggest making an introductory paragraph here with the background information,
instead of mixing it into the rest of the text in a somewhat incoherent manner:

"vsyscall emulation can be execute-only (XONLY) or read-execute (EMULATE),
specified by the vsyscall= kernel command line option. XONLY mode is the
default. The EMULATE mode has been deprecated since 2022 and is considered
insecure.

This patch adds support for LASS with XONLY vsyscall emulation.

> With LASS, vsyscall page accesses trigger a #GP instead of a #PF. In
> XONLY (execute-only) mode, directly reading the vsyscall page is
> disallowed. So, the faulting RIP can be easily used to determine if the
> #GP was triggered due to a vsyscall access.

How about:

"With LASS, vsyscall page accesses trigger a #GP instead of a #PF. For XONLY
mode, all that is needed is the faulting RIP, which is trivially available
regardless of the type of fault."

> Reuse the #PF emulation code during a #GP and emulate the vsyscall
> access in XONLY mode. As multiple fault handlers are now using the
> emulation code, add a sanity check to ensure that the fault truly
> happened in 64-bit user mode.
> 
> In contrast, when vsyscall=emulate (deprecated) is configured, it maps
> the vsyscall page as readable. Supporting EMULATE mode with LASS is much
> harder because the #GP doesn't provide enough error information (such as
> PFEC and CR2 in case of #PF). So, complex instruction decoding would be
> required in the #GP handler which isn't worth the effort.

"... as remaining users of EMULATE mode can be reasonably assumed to be niche
users, who are already trading off security for compatibility."

Use "EMULATE mode" consistently here. Captializing it makes it clear that it
is a term and not just a prose word.

> LASS and
> vsyscall=emulate will be kept mutually exclusive for simplicity."

	-hpa

