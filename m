Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8172ED85E
	for <linux-doc@vger.kernel.org>; Thu, 24 Jul 2025 18:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753382501; cv=none; b=uCoZKs+6Pj80RnxLFa2flpLUaFauVadiX9sNoj2vdRS2DPLlRLAnnpZ3ppFPqIzj4tP4pw9TRLoRKQRRQRnr41hAPxCBeFJeyKPBuwGUZ1y043o2zBv02KT/du4MBcYCiM82iC2OAPhyeqE/gCbaQS79xuWgDjaumIiUplDCV44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753382501; c=relaxed/simple;
	bh=Dj7IK0VO4JBDXOnFR6yog2xGl3G13C/r3gAy1IBOtDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3wCRkD14voeTO72qnvqAM8XZM+JSqijCVXBWEnSbxBPSAuAJD083WgkMCPyHLEHptUQ33YrbQfvvbGnGkFqoOiyLZ/H9vqMkjgxNdx3dnoHDRASxzOZbR80l8vPU0VMMoVHAg5HZOA+iqtEMcLnPbXcnwW7GSunjYopqeUwOic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KY1Q+CM8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KY1Q+CM8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9464EC116B1;
	Thu, 24 Jul 2025 18:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753382501;
	bh=Dj7IK0VO4JBDXOnFR6yog2xGl3G13C/r3gAy1IBOtDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KY1Q+CM8GQbWvptmOblv5ZL4m8cjnLQMfTHTLP05EGC8CvznhOtZtTVhlRX/u4rUr
	 sDnuy6VnrAYMrrtXObhBw2X4BY0tEwN9fpYRdkCG4x87ktTHaXIinOb78pazPN31H0
	 JzjH3rQnWg/lf2Tu9+uF8HCtQpjQJLqH6Ay/T1rQ=
Date: Thu, 24 Jul 2025 20:41:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH] docs: filesystems: sysfs: Recommend sysfs_emit() for new
 code only
Message-ID: <2025072425-unfrozen-ascertain-1e62@gregkh>
References: <20250724153449.2433395-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724153449.2433395-1-bvanassche@acm.org>

On Thu, Jul 24, 2025 at 08:34:42AM -0700, Bart Van Assche wrote:
> The advantages of converting existing sysfs show() methods to sysfs_emit()
> and sysfs_emit_at() do not outweigh the risk of introducing bugs. Hence
> recommend sysfs_emit() and sysfs_emit_at() only for new implementations of
> show() methods.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: James Bottomley <James.Bottomley@HansenPartnership.com>
> Cc: Martin K. Petersen <martin.petersen@oracle.com>
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>  Documentation/filesystems/sysfs.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
