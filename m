Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A0117BA5;
	Sat,  1 Feb 2025 08:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738399447; cv=none; b=kVvS+cg1m+883M2YqBomZ2K76rfJjXNkfId38ZnkTZQEo54HjWWVbyeg6iAPmEy/8D6K22VHXfG749Kc6k43waRgtdsR0TnGFct33NuPkPFm2CA6u21g5h70n9kvhYBsLAiMZL92wOArMiRPM+p7Zq3td0IuREvbxo3AtZ0VFGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738399447; c=relaxed/simple;
	bh=lxXyUn5qFud2NsxWVWULEHPnZk8LHtsNtj789rG/aSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWwJd5VDDp/wbEiENdEDZrWA49bcLRhvZrOlsBl1awJhsOimqEkrYl5PVeUUywC4kauWucm34vffvfJnBj5AUrdugnGl0RLBWEMmjUGYKGYz/VWAmI4UvWfLl8rNbJfMroimxAOaaDjF9ouyF1IciCsy/9hkX9suhsQHkQRZzZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JUXneXSG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JUXneXSG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A23C4CED3;
	Sat,  1 Feb 2025 08:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738399446;
	bh=lxXyUn5qFud2NsxWVWULEHPnZk8LHtsNtj789rG/aSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JUXneXSGZgzbn4gRXEtxdIGZ7/sjnhf4CHutZuWYBmJfMc98o9qERdgmZ6D2W2cNc
	 EH3vmPcFiYqSeJfwecUb4QOhtRy1qJIdfM55SpVQdjBlg5O2rYiYKdEes81ZBqkN10
	 GJfAzLC9IQzn0j3Co531a6X3xCUTfCIu7kKPenmU=
Date: Sat, 1 Feb 2025 09:43:06 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pranav Tyagi <pranav.tyagi03@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] documentation grammer correction
Message-ID: <2025020128-harmonize-lapdog-fa42@gregkh>
References: <20250131174704.12501-1-pranav.tyagi03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131174704.12501-1-pranav.tyagi03@gmail.com>

On Fri, Jan 31, 2025 at 11:17:04PM +0530, Pranav Tyagi wrote:
> Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> ---

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
