Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1AA3D984
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 12:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V/lKsuLM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58753C433C7;
	Tue, 14 Nov 2023 12:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699964050;
	bh=lv1Pg2gEfccXVD0Fm2ZP5fMGrIlZAHX99ebAvqwyGnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V/lKsuLMxJhRiasdNNvc5zb0wmEs78M25k7V8I5SvH2bu2nvPtN5ceNDpUeYKgXIq
	 Y/0RAxcn3sAE2a/F9NCoQxOqZLa1B07ASSvZee8SKnsVc6JbnAOdL4fejAXYJ5DfiW
	 rJ9izZXobAdjfXgVjM9nYY+LSouyn5yvLTaWuVbs=
Date: Tue, 14 Nov 2023 07:14:08 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: Tomas Mudrunka <tomas.mudrunka@gmail.com>
Cc: jirislaby@kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v4] /proc/sysrq-trigger: accept multiple keys at once
Message-ID: <2023111454-hypertext-anymore-f2a6@gregkh>
References: <a7308079-2605-4708-9886-2f517481d728@kernel.org>
 <20231114095557.74619-1-tomas.mudrunka@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114095557.74619-1-tomas.mudrunka@gmail.com>

On Tue, Nov 14, 2023 at 10:55:57AM +0100, Tomas Mudrunka wrote:
> Just for convenience.
> This way we can do:
> `echo _reisub > /proc/sysrq-trigger`
> Instead of:
> `for i in r e i s u b; do echo "$i" > /proc/sysrq-trigger; done;`
> 
> This can be very useful when trying to execute sysrq combo remotely
> or from userspace. When sending keys in multiple separate writes,
> userspace can be killed before whole combo is completed.
> Therefore putting all keys in single write is more robust approach.
> 
> Signed-off-by: Tomas Mudrunka <tomas.mudrunka@gmail.com>
> ---
>  Documentation/admin-guide/sysrq.rst |  4 ++++
>  drivers/tty/sysrq.c                 | 17 ++++++++++++++---
>  2 files changed, 18 insertions(+), 3 deletions(-)
> 

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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
