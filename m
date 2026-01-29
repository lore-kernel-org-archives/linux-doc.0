Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E163770B
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 14:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769696245; cv=none; b=qDVrCO1lcS7bJ93ulKFSyog0SMD4fX+umGJ7R6hKn6010M5E8ERAafTT1+uOC3E6FWZP/g1fPzyXmdC42IHadg3OKFuCxHWuiIi6MNH5vQ1r7L3qR9J4GgHmN5BusHL3/6fklz/ZywqsVM4MHp7QM0LKKX/kmp5ppG9Dgw8D4aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769696245; c=relaxed/simple;
	bh=oqY18DYBL6CxSxe2u/WsaIhoDbIBO9Ga7W1HkI7RXhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kS+22DeFkp/j0uEkgqKKSzZoETiDGsWGmH4SsxDFBtdWQWS+MSgHMOzT3c6QtUX5tPjii8SrcsaTtD2nDJm3IsqKPBYdu+yN+DV5W/eNIgAEBQRq04TQwPBKVOUvBfTDkWd09jGVQ5vjv0SZYgEmDbL5gO+JZzqnrJA/v/Iiwzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D3+rLMGT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D3+rLMGT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB09C116D0;
	Thu, 29 Jan 2026 14:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769696245;
	bh=oqY18DYBL6CxSxe2u/WsaIhoDbIBO9Ga7W1HkI7RXhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D3+rLMGTO590r289EWivy2M2v4OikADV8U/vArGys4+gvHOp+GUgu42d2bPt98wQo
	 DTRPU1H0yn1xtqxzsePgEHaat6Jhs60zK1CdoYykhsiqkG9pW2zEe7sG7NVVHTcT3B
	 pCdjSCCMLTB7lEhKWugP8ZVA5DOUyaJie+CbGowI=
Date: Thu, 29 Jan 2026 15:17:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: harshdaniel66356@gmail.com
Cc: devel@driverdev.osuosl.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: Add bindings for dim2 compatible
 strings Add device tree bindings for the compatible strings used in the
 staging/most/dim2 driver to resolve checkpatch warnings: - fsl,imx6q-mlb150
 - renesas,mlp and renesas,rcar-gen3-mlp - xlnx,axi4-os62420_3pin-1.00.a and
 xlnx,axi4-os62420_6pin-1.00.a These bindings document the MediaLB DIM2
 module found in Freescale i.MX6Q, Renesas R-Car, and Xilinx FPGA platforms.
Message-ID: <2026012906-gristle-junkyard-0c96@gregkh>
References: <20260129103426.113005-1-harshdaniel66356@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129103426.113005-1-harshdaniel66356@gmail.com>

On Thu, Jan 29, 2026 at 04:04:26PM +0530, harshdaniel66356@gmail.com wrote:
> From: Harsh Daniel <harshdaniel66356@gmail.com>
> 
> Signed-off-by: Harsh Daniel <harshdaniel66356@gmail.com>

Your subject line looks very broken :(

