Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC0121D590;
	Thu,  5 Mar 2026 06:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772692414; cv=none; b=c3aR0cceb6811YNqeW0j2LIGapAM3N0XdMG3fUe2D17eOyPb9mEUh6N69q6i78dcD3VYEwgm8J6JIyTkYFVMKJ5X05IehWD10wyMAZ0LnVZlaD+U4q6pYZDdQ+8izxbqoTxI79hlDypJOD+C1KPWOw53SONvO43DYlX4VIsMkNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772692414; c=relaxed/simple;
	bh=FlZPCrefDFDsfJPmwWE4ATTJ0GE5RPbY4Rf85Fq/vcw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=uiJytWOKNpwy8kgDiAegd+gGmqRcmcupWgdtrIJk0d3o2NwPDVFT0CUTiMOdcMRAPySQ7G/2bvd/dgPLdFvw9MopfEFu6l836k0F+0pnkDbhyhoeckZCdw2blbHRJy9TjR7Bnzs3KCiSsp0+bnsAWQ2rBwZbAApUntFJJYii9o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=iv6rGWeP; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="iv6rGWeP"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 6256Wcp52445550
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 4 Mar 2026 22:32:39 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 6256Wcp52445550
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772692360;
	bh=FlZPCrefDFDsfJPmwWE4ATTJ0GE5RPbY4Rf85Fq/vcw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=iv6rGWePam2K2Ub87OuDrEQcxM42ZbkzHrP4anV9siU+bDtoFw2eLJNsHS4OJCJ7D
	 o9ki1J9ncUtvxoUHKjTtD9g7CHW3G9kdxKbIUoBUTa2sMK9W5hhSSG6Js6gBurZXP/
	 FytlFlnNs5FOctvGxp+xyGYp6Qr3UDR6mlyiOaAWCy/Kf6r7YczMZ75EwJVqsTU2ea
	 UQ1Z1VXxC3pU9RkUnbD0NuDznpcCpukUyvusCXnm1aiqsSrY06Wv23g06Tm6/dyNIi
	 cugq/DthmItdnbiJqmspw7X+1UJZFvoK7LgvxdQNGePyYKUxS5jQIRq58h5SfdIchk
	 2d61YrQyXPr4g==
Date: Wed, 04 Mar 2026 22:32:33 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Sohil Mehta <sohil.mehta@intel.com>, Dave Hansen <dave.hansen@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>
CC: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
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
Subject: Re: [PATCH 3/5] x86/vsyscall: Add vsyscall emulation for #GP
User-Agent: K-9 Mail for Android
In-Reply-To: <eeec4ac0-be05-4a4e-a9c7-8716de50cfbb@intel.com>
References: <20260219233600.154313-1-sohil.mehta@intel.com> <20260219233600.154313-4-sohil.mehta@intel.com> <1383b357-2a10-4b36-afb9-42e2724faa31@intel.com> <faf58379-36df-4535-8c17-bcfe838ae4c4@intel.com> <3212161f-64b2-4825-8bcc-c36201ab6589@zytor.com> <eeec4ac0-be05-4a4e-a9c7-8716de50cfbb@intel.com>
Message-ID: <E2EE2877-8B5A-4334-8441-2691AF981F68@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 4, 2026 4:10:22 PM PST, Sohil Mehta <sohil=2Emehta@intel=2Ecom> wr=
ote:
>On 3/3/2026 2:35 PM, H=2E Peter Anvin wrote:
>
>> Suggest making an introductory paragraph here with the background infor=
mation,
>> instead of mixing it into the rest of the text in a somewhat incoherent=
 manner:
>>=20
>
>I rewrote the whole thing based on your and Dave's input=2E I added
>sections because it was getting a bit wordy=2E
>
>x86/vsyscall: Restore vsyscall=3Dxonly mode under LASS
>
>Background
>----------
>The vsyscall page is located in the high/kernel part of the address
>space=2E Prior to LASS, a vsyscall page access from userspace would alway=
s
>generate a #PF=2E The kernel emulates the accesses in the #PF handler and
>returns the appropriate values to userspace=2E
>
>Vsyscall emulation has two modes of operation, specified by the
>vsyscall=3D{xonly, emulate} kernel command line option=2E The vsyscall pa=
ge
>is marked as execute-only in XONLY mode or read-execute in EMULATE mode=
=2E
>XONLY mode is the default and the only one expected to be commonly used=
=2E
>The EMULATE mode has been deprecated since 2022 and is considered
>insecure=2E
>
>With LASS, a vsyscall page access triggers a #GP instead of a #PF=2E
>Currently, LASS is only enabled when all vsyscall modes are disabled=2E
>
>LASS with XONLY mode
>--------------------
>Now add support for LASS specifically with XONLY vsyscall emulation=2E Fo=
r
>XONLY mode, all that is needed is the faulting RIP, which is trivially
>available regardless of the type of fault=2E Reuse the #PF emulation code
>during the #GP when the fault address points to the vsyscall page=2E
>
>As multiple fault handlers will now be using the emulation code, add a
>sanity check to ensure that the fault truly happened in 64-bit user
>mode=2E
>
>LASS with EMULATE mode
>----------------------
>Supporting vsyscall=3Demulate with LASS is much harder because the #GP
>doesn't provide enough error information (such as PFEC and CR2 as in
>case of a #PF)=2E So, complex instruction decoding would be required to
>emulate this mode in the #GP handler=2E
>
>This isn't worth the effort as remaining users of EMULATE mode can be
>reasonably assumed to be niche users, who are already trading off
>security for compatibility=2E LASS and vsyscall=3Demulate will be kept
>mutually exclusive for simplicity=2E

Other than David's comment this looks great to me too=2E
