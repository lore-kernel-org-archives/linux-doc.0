Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC2E304BDF
	for <linux-doc@vger.kernel.org>; Sat, 21 Feb 2026 05:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771651611; cv=none; b=OapgDRQQJJWaJY92rviTZEWkdFbrURtWRJg/MicH9z04gAvBj3mLos+DcFRiMQyHnMDUCsUTXB8kaQi7kutTwQefLE7CsnIxQp+I0AaemRF9naxdTvt3Bsdb9zRiF4IHkvYlh+j5UsYh2gU78XLwvIRbdoqsfiXbB2wGJs9yjr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771651611; c=relaxed/simple;
	bh=kiTfRvw3ON9cCRNdNaDCd7yl2YiRv00yp4ueo2XTDbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJbIyyS1Y8dGvKWGas9bYKR7LeHoTjF7FRrNL9zC6qDzhEoXgTb/c/Erb1kAlrwKkt3ac/k6VFbRV0mS4VgSYjVpcDs3C5NvyaUVON00ANPOJyH2TjWEX4Ft91/XM3dYmDkiAOSiyNDt9BDmL1HzxGEYub666yUOc2rkeS+xG1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=o9ve8Xaq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="o9ve8Xaq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2DCBC4CEF7;
	Sat, 21 Feb 2026 05:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771651611;
	bh=kiTfRvw3ON9cCRNdNaDCd7yl2YiRv00yp4ueo2XTDbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o9ve8XaqQ5h/o/nqfTSM09S5tRSRjyfllUWyxtr0AuWJZfnWhFnl2vbH3oP0LyyQp
	 xke6BRX5XcoFPTRVMm56K1PqpgHUZ3M1Nke5mixee3t93xZyL9df5/M84tdjrJH62L
	 VsYBeTrD2ELmyjXw02ixxaoXL/Cd5KL+ON4JvOW0=
Date: Sat, 21 Feb 2026 06:26:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: polish Executive Summary and Intro in
 stable-api-nonsense.rst
Message-ID: <2026022124-epidermal-childlike-4b1a@gregkh>
References: <20260220132910.9645-1-islamarifulshoikat@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220132910.9645-1-islamarifulshoikat@gmail.com>

On Fri, Feb 20, 2026 at 07:29:09PM +0600, Ariful Islam Shoikot wrote:
> Signed-off-by: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
> ---

For obvious reasons I can't take patches without any changelog text at
all, sorry.

thanks,

greg k-h
