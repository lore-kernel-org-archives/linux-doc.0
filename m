Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20652431E69;
	Wed,  1 Jul 2026 22:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782944464; cv=none; b=rtgRak+XSRp5i2fzCljgIFXHNPg95mb2HqiSiT0J0YVj3q+kl9s9hHwCDFmrJ7HJqyAbdgWDpotgiyqea1+TTjldlIhQOSv8dY7e9obgOwP2VpEH9JTzg5zBBH5Rb/iMqZoxjMHFW61l7n5vZfUUKPeRpZ5uApIVaIA6tpsLekQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782944464; c=relaxed/simple;
	bh=X1ipCCVzFEWioiD/b6gecBdSOz8GNxqnybhTAHyd18o=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iUxT+YxkOQrQ4Fzq6ZAK/XNko9MOPLubdR7FHnSSVpT8JmFXtfSqJyJ7/987UtF9hNbgUQg5Jyn0T/fPItIxmizuG+MqUtMvrEVTdQgLC68WYHcJi5uqbcai1befo2KUp+4fkF18GgqS7gCcWY8+p6J29l0gpLovKb97ZmdFZGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FAWNjKi7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FAWNjKi7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28791F000E9;
	Wed,  1 Jul 2026 22:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782944462;
	bh=wZxfncYELTQZTvTtNjVQzGhcKkNoRje3hAgFORnXv5k=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=FAWNjKi7pK2H+wvkFqDc8mMmHT3SxJTXcw6Ix1w1j4uT1B6mglq+XRmy1+nqHhNGa
	 Zfx0bGB53glpTzYltAWk3BT0rpQmd13fIefe+CSnIR0K2YcebeWqPRdSwPLa01Xtc0
	 oMxJGekbuvYovo1RgH7pGws07SmOea5qRzk8uIS3JAJiZAV5xbMf8zmgQ4nZkbQIHU
	 6Guu4tzEjO1dnDx/eOnHu4lZ6WfnP720XO3GV24ynsXqW8C4NtkperLEGmVInPMa1M
	 GRGlHj7xpuxS/OoRpd022ZMWie1KZK2q/rQxuou8nvaJVGNwBqOknONO+ueBrOdg09
	 uNgjXCHgDAZFw==
Message-ID: <83fe3c9e-6c2c-4d33-ba49-eac6c3430f64@kernel.org>
Date: Wed, 1 Jul 2026 17:21:00 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Documentation/arch/x86/amd-debugging: Add example for
 reset register
Content-Language: en-US
To: Daniel Gibson <daniel@gibson.sh>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
References: <20260624124326.746525-1-daniel@gibson.sh>
 <20260624124326.746525-2-daniel@gibson.sh>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260624124326.746525-2-daniel@gibson.sh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/26 07:43, Daniel Gibson wrote:
> The amd debugging documentation didn't state how to identify kernel log
> lines with information from the reset register about the cause of a
> previous random reboot.
> 
> The added example rectifies this.
> 
> Suggested-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Daniel Gibson <daniel@gibson.sh>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   Documentation/arch/x86/amd-debugging.rst | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/arch/x86/amd-debugging.rst b/Documentation/arch/x86/amd-debugging.rst
> index d92bf59d62c7..3176a1240fee 100644
> --- a/Documentation/arch/x86/amd-debugging.rst
> +++ b/Documentation/arch/x86/amd-debugging.rst
> @@ -366,3 +366,8 @@ There are 6 classes of reasons for the reboot:
>   This information is read by the kernel at bootup and printed into
>   the syslog. When a random reboot occurs this message can be helpful
>   to determine the next component to debug.
> +
> +For example, if bit 19 was set, you will get a message like this in the log on
> +next bootup::
> +
> +  x86/amd: Previous system reset reason [0x00080000]: software wrote 0x6 to reset control register 0xCF9

