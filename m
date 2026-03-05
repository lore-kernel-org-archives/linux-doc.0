Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B8630B514;
	Thu,  5 Mar 2026 06:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772693289; cv=none; b=PqeZi1bJXVsiq3jBaNgeyTmiL5Zh+VAgsbXRwUTJbbnbDK4YTtYE4qHm0O+SmXE9Kgh29rzyri/ctCEtH2g42vbv2KmIsiH42Mz7aDn/W7WputjHTjm35hdul5yOcrK5wq4FyavW6Sui+F09jzhZqaOWkJArGvcHP2F7Vq5rRaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772693289; c=relaxed/simple;
	bh=nAIMGSgYi9XRRLBSfTYPT5G1klATEwCnOUQgYY1b2Ns=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=EO6pRTSjLhuTqSmrW710P7c1jHCM+RrQl6hh3n4rFQsGA20D8ivaq5GlwStPO1wXCcfFWKQqyCOypIXR/2c6BwSdtg7DS3pcL1mY2XVMZq7+xtparMjTuwQ+9sAiyHHVTpxg7t33BuzDQd3tbr43kER705uJd4tQDPaWg7wMJmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=BIE4dWJW; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="BIE4dWJW"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 6256VJDP2443815
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 4 Mar 2026 22:31:19 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 6256VJDP2443815
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772692283;
	bh=nAIMGSgYi9XRRLBSfTYPT5G1klATEwCnOUQgYY1b2Ns=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=BIE4dWJWCh3DjuzfRW8Y/9pMLOtV/KEhFRy412Mho9HQu/qi6USP7heUwYyuBOXOz
	 I5k3A+UimAhK75KEUwnTxvgrSyoFC+Q0/jZMiVwPKYz/jmP3zyIQkUF+snBu5wlBcs
	 bGi8WH4B+BGTMeaJbZze51RbF8iQA9eIpA+bc3vmZ+wacKdLC4tZsSeofeFz7XEmJD
	 wPjmjgZStBNl/6MWU5nIqPxt0ijThGVyDQALmpCM3X4WxEAW4NOdyyUFJkBp/+PXHU
	 G9QUT//tMJ4nDETVxOof0MN6sNPlIpFnkcDYgPjfmf+j7IkfEvYzm9BKNTS4d80kdj
	 wiBdHPUOTTLbw==
Date: Wed, 04 Mar 2026 22:31:13 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Dave Hansen <dave.hansen@intel.com>, Sohil Mehta <sohil.mehta@intel.com>,
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
In-Reply-To: <2e3b1765-ae56-4642-8a94-61805a64497e@intel.com>
References: <20260219233600.154313-1-sohil.mehta@intel.com> <20260219233600.154313-4-sohil.mehta@intel.com> <1383b357-2a10-4b36-afb9-42e2724faa31@intel.com> <faf58379-36df-4535-8c17-bcfe838ae4c4@intel.com> <3212161f-64b2-4825-8bcc-c36201ab6589@zytor.com> <eeec4ac0-be05-4a4e-a9c7-8716de50cfbb@intel.com> <2e3b1765-ae56-4642-8a94-61805a64497e@intel.com>
Message-ID: <FB1827F9-69C9-4E79-90E6-EABDD7F34445@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 4, 2026 5:45:48 PM PST, Dave Hansen <dave=2Ehansen@intel=2Ecom> wr=
ote:
>On 3/4/26 16:10, Sohil Mehta wrote:
>> Vsyscall emulation has two modes of operation, specified by the
>> vsyscall=3D{xonly, emulate} kernel command line option=2E The vsyscall =
page
>> is marked as execute-only in XONLY mode or read-execute in EMULATE mode=
=2E
>
>Is it really "marked as execute only"? We don't have a real execute-only
>paging permission on x86, the closest we've got is memory marked with a
>pkey that's got the AccessDisable bit set=2E
>
>I think it's _called_ execute-only because the kernel makes it behave
>like execute-only memory when it's handling the page fault=2E But I dobn'=
t
>think it is super accurate to say it is "marked" as execute-only=2E
>
>The rest of it looks great to me, though=2E

It's not marked as anything; it is in fact not present=2E
