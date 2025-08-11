Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0171922FB;
	Mon, 11 Aug 2025 05:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754890148; cv=none; b=HLCeimRdXl8SYPE1tEzoo0nF3aDe9IzR99usXirGQHpEuHdZ2Q5eh7JqfKaNX29Osx+Jmr62Ps4tmXjMDl4IrflqUtBO2nnGR/VgCFQ7ZKAFdwib9iXUwCETs6W0zo6yr3i0i8QYZCjRDc4WsJGOzLrnwOXFhh7ErcKE+/H1wT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754890148; c=relaxed/simple;
	bh=fwUmUHih8bzEzyRBwV95L3I4y/zsVn44tOqOAqbjF38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvzvS+DrJvCCGhEzV3lIG7qXedV+rO1aPhGvLSYzEJREt7G8EoTpilym+hTnsYqRTdoN1CS60StrkREk5KGBWNdj3YVntQWaGFyfshVmOFAx39mAU0nAQIq7O757tw17brPCJFBE04EVCY4KEcCjciHJA8J89x6WbfrO7J2RX/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=u2XmpVRb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="u2XmpVRb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6331C4CEED;
	Mon, 11 Aug 2025 05:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1754890148;
	bh=fwUmUHih8bzEzyRBwV95L3I4y/zsVn44tOqOAqbjF38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u2XmpVRbtHZ++Aj+uioqnQ4ckIj9LWQamPKpJfIU4KgcUpKZT5SXDr7C1EstS5p2F
	 wqNbZs+C0hn8G9HzM4+5k7TX20mcAui+Lb8Gotl8+En0BR8QoflxWlTm0ZOD6WWuHk
	 SWaPQbYLmRjVIMwUbpjHje9FYCltqxfG4jGfXmJc=
Date: Mon, 11 Aug 2025 07:29:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nikil <snikilpaul@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] docs: fix broken link in Documentation/RCU/RTFP.txt
Message-ID: <2025081134-washhouse-rebuff-ea13@gregkh>
References: <20250811042357.7470-2-snikilpaul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811042357.7470-2-snikilpaul@gmail.com>

On Mon, Aug 11, 2025 at 04:23:58AM +0000, Nikil wrote:
> 
> The original link to the Linux Symposium 2001 abstract is no longer valid,
> as the Linux Symposium website is no longer active. Replaced it with an updated
> link to the read-copy document available on kernel.org
> 
> This ensures that readers can still access relevant resources without encountering
> a dead link.
> 
> ---
>  Documentation/RCU/RTFP.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/RCU/RTFP.txt b/Documentation/RCU/RTFP.txt
> index db8f16b392aa..87b1c97c3ec3 100644
> --- a/Documentation/RCU/RTFP.txt
> +++ b/Documentation/RCU/RTFP.txt
> @@ -641,7 +641,7 @@ Orran Krieger and Rusty Russell and Dipankar Sarma and Maneesh Soni"
>  ,Month="July"
>  ,Year="2001"
>  ,note="Available:
> -\url{http://www.linuxsymposium.org/2001/abstracts/readcopy.php}
> +\url{https://www.kernel.org/doc/ols/2001/read-copy.pdf}
>  \url{http://www.rdrop.com/users/paulmck/RCU/rclock_OLS.2001.05.01c.pdf}
>  [Viewed June 23, 2004]"
>  ,annotation={
> -- 
> 2.43.0
> Signed-off-by: Nikil <snikilpaul@gmail.com>

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

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/process/submitting-patches.rst and resend
  it after adding that line.  Note, the line needs to be in the body of
  the email, before the patch, not at the bottom of the patch or in the
  email signature.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
