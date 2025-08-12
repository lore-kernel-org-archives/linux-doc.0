Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7A926A09B;
	Tue, 12 Aug 2025 06:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754980703; cv=none; b=Dl4ffxD8/7dY29XuVBbbiY6rHt9U0xBRtPlm2dwC+Xf6s3D5WctsBtcWJ+DYvqNxK79OP3kV6BO4ORgIDxyyg6VVBfakZ6Zd8s5UV6oz0JHcp1e8ZckbyQkI87OV9KIW9RHKtgdyaZ4fIJ+DuO9zC8PDmyNT4yN0Fwz5luDqttE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754980703; c=relaxed/simple;
	bh=2jRSIRl+CprjXobJfeDzSzXt26aDVpvPrbmuV7gUofk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6krn5uaGFyFlNzAaY//VgZr59+ODo+NPCJkILKf4V7eS6phAECC+RbpCoiLGxEqkFoG5i68+RW9HdDY9beUoSY3r5ACF6R1Ygl01NsofrG8PKeX+3P+KmNjDfSbuTYSg7LEMDTgjO3Q8LXDeoyDRqUn6yMR6L+CpuF4dSpHmT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yOlsY1z1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yOlsY1z1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E83EC4CEF0;
	Tue, 12 Aug 2025 06:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1754980702;
	bh=2jRSIRl+CprjXobJfeDzSzXt26aDVpvPrbmuV7gUofk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yOlsY1z1Ke1JNsJb4bRzQsjmcnPrdLMHLcmUARIuw2Gag1U9gKAhc1qEiPYxrArqp
	 WfITNKsRYJpqLHwjl6RH72xMwv2qBhY8euUkDmCg8Wklm0cIsgIzpna4ko51g4CBWS
	 wtkTvHNikGicRQ4Zct7NidozEkVf5rQSmTAgGpNM=
Date: Tue, 12 Aug 2025 08:38:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nikil Paul S <snikilpaul@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 2/2] docs: rcu: Update dead OLS link in RTFP.txt
Message-ID: <2025081254-aeration-populace-22b7@gregkh>
References: <20250811123837.4378-1-snikilpaul@gmail.com>
 <20250811123837.4378-3-snikilpaul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811123837.4378-3-snikilpaul@gmail.com>

On Mon, Aug 11, 2025 at 12:38:37PM +0000, Nikil Paul S wrote:
> From: Nikil <snikilpaul@gmail.com>
> 
> Replace a dead link to the OLS 2001 Proceedings with a working
> version hosted on kernel.org.
> Signed-off-by: Nikil Paul S <snikilpaul@gmail.com>

Sorry, but you need a blank line before your signed-off-by: line, as you
did in patch 1/2.

thanks,

greg k-h
