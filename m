Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531A933AD9C;
	Tue, 24 Feb 2026 18:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771958403; cv=none; b=c23LS+nG74impcmImDGhMxjlyLBnyUAdeBCyp/pDLltlunBD529QVz/XfQT3Qjc6ttF64baMLCNIZ3s6NchG7kfSMPXjEnN1Mk26ADlwbg4eHROOnHylCWaM2TBBCBFrs60gfpLhzYsQS3DOK0x90OtmEgKM5eQDJW8BkISMKGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771958403; c=relaxed/simple;
	bh=tStRS8KB0V20XKC/Dt5aKDP2xZNQUVl+3ZrOp5PQtHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZs5T81sxrY1H4CYLsmBSsxgMZuWYdAX96gkKG7K+UhUZt61M5ZfdHeTTB3pe8H0w2fF5lzxoY7LiWzDR08D1XeagEHk0n4EgFHVqCMoXG/9X5CoCwFD87OSD11mcnUHHRqW70rcLxN8t6Py7gf/PulZ7DKUpFtUXoczmdvCSOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cmqx0zGr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cmqx0zGr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4EDCC116D0;
	Tue, 24 Feb 2026 18:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771958403;
	bh=tStRS8KB0V20XKC/Dt5aKDP2xZNQUVl+3ZrOp5PQtHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cmqx0zGr74C5Orv+tBKHEOJnNCcMzUOcwJk62EF7Gv3wAaxRZ1tVYvte98CmsMo3U
	 jE5BaUauiBXq4Lw+eTxk5ckjqUd32vM8t9BJezzSHUwbWTH2Mn/Gw7oBIZSFrECXXr
	 ue+QatGGT1cLmrypddQMMJFPiny0DQnUhsqsi7AmQnizHB2ObjUv1NbUr4hhzmPGHy
	 wIDsuObAiAEZVTYQqouF9r+RWuuA7MwzRmJZWpwNhA4Cqa23fJSZ/1mXK5sKUDDJHZ
	 rtX537DX79S7KWqFwVHBXryYzXJsEefyYJMopm3Ar2hsG/QFujJD8SscTwqyhsmjtA
	 vq2VuykH+/K2Q==
Date: Tue, 24 Feb 2026 12:40:01 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Markus Heidelberg <m.heidelberg@cab.de>
Cc: Dongliang Mu <dzm91@hust.edu.cn>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yanteng Si <si.yanteng@linux.dev>
Subject: Re: [PATCH] docs: dt: unittest: update to current unittest filenames
Message-ID: <177195840111.3253999.18404449119161660687.robh@kernel.org>
References: <20260223111207.54640-1-m.heidelberg@cab.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223111207.54640-1-m.heidelberg@cab.de>


On Mon, 23 Feb 2026 12:12:03 +0100, Markus Heidelberg wrote:
> There have been several renamings and modified Make rules since
> introduction of this unittest document.
> 
> The file list in the Chinese translation had been extended.
> For a change to drivers/of/unittest-data/tests-*.dtsi surrounding
> translation has to be updated.
> 
> Signed-off-by: Markus Heidelberg <m.heidelberg@cab.de>
> ---
>  Documentation/devicetree/of_unittest.rst      | 20 +++++++++---------
>  .../zh_CN/devicetree/of_unittest.rst          | 21 +++++++++++--------
>  2 files changed, 22 insertions(+), 19 deletions(-)
> 

Applied, thanks!

