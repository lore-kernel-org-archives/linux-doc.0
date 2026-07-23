Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CED921773D;
	Thu, 23 Jul 2026 03:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784777246; cv=none; b=rmdYml2i2fZ8sT3wJagMnhb6l8eIhIbYtkBz4P5GA0Ob0VdGf8sMP6tNnjUcY/0KWC0M9pkiAMRfS9+w9h9Gn9K2x16GNwX89uMAHSta3Wb3H4bgEpxXDFfgUXTyMBT+FG7dkkMDqrJAAGm3vBjp+wXlV6/iJ98MzgPQXyHkp/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784777246; c=relaxed/simple;
	bh=e58OWIRpkVaT0xxXqTlJHCfzB1+wPzLkZKq7hmnltNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e5HCeLIIqL3LxUdP8QZQI8qJstK94goVpDlV4htcZBTpP7vUbskP9XBq1tp/4ZysZQVXuetCCIfx4miB6IGwNg7bwDSzHCpgM0kE2mXGBv22gmC/RV41gdB1QzF+1bAMtG4cEh3qldD0prStu0LnM6O0Dgbaoli1aVaxSjpPWX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Dc75o0QA; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Dc75o0QA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=+kwAUpwqK6rZRGh60kugQF2OVsXfnhHAR8TiCu3vEm0=; b=Dc75o0QAtjEDDA3Fdv2BTwAmYl
	8wJIg+HpuEtyBhNtRurAeOeq07+5vGymYFpFfwP87YLEz/HQyfDCOZW/sISzxwj06J8DtVcOnjoGU
	6+hIqnSsw+2GNItsTOR+DBiUbdRHx0q0e11oEekRicwfdL/RvkIK05yWNnaiBkLdIpwMxJVPCWdHM
	LUcBTZKiQ94HDT7J46NeEnmeoqca7WLQkwk2dECFzrA3vI93A9vknvpgAe/6CyRm0Lnnzw+YRKRJL
	Ue3Ler6QI62UbPsYi938aG/hryUErPIk5uq6bmIdF9+4omUSWgFuq4zYiXUwfDUJ5ybL66m4GNJ3I
	8l6JYJBg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmk5R-0000000DJ6s-3AFN;
	Thu, 23 Jul 2026 03:27:05 +0000
Message-ID: <ee9df943-3f09-4c14-b532-3212098a7ed7@infradead.org>
Date: Wed, 22 Jul 2026 20:27:04 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mce: Document the mce=print_all command line
 parameter
To: Shreshth Srivastava <shreshth.srivastava@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>,
 Jonathan Corbet <corbet@lwn.net>, x86@kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>, Marco Elver <elver@google.com>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>, Jakub Kicinski
 <kuba@kernel.org>, Eric Biggers <ebiggers@kernel.org>,
 Li RongQing <lirongqing@baidu.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>,
 Sohil Mehta <sohil.mehta@intel.com>, Tony Luck <tony.luck@intel.com>
References: <20260723013730.3033-1-shreshth.srivastava@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260723013730.3033-1-shreshth.srivastava@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/22/26 6:37 PM, Shreshth Srivastava wrote:
> The mce=print_all command line option is supported but has never
> been documented. Add it.
> 
> Suggested-by: Sohil Mehta <sohil.mehta@intel.com>
> Signed-off-by: Shreshth Srivastava <shreshth.srivastava@intel.com>
> Acked-by: Tony Luck <tony.luck@intel.com>

Looks good. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Documentation/admin-guide/kernel-parameters.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index eb4e0d28f74b..0ec18a5597a2 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3792,6 +3792,9 @@ Kernel parameters
>  		nobootlog
>  			disable boot machine check logging.
>  
> +		print_all
> +			print all machine check logs to the console.
> +
>  		monarchtimeout (number)
>  			sets the time in us to wait for other CPUs on machine
>  			checks. 0 to disable.

-- 
~Randy
