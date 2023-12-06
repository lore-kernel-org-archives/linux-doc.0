Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEA847F5B
	for <linux-doc@vger.kernel.org>; Wed,  6 Dec 2023 20:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RFIUMCH/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE312C433C7;
	Wed,  6 Dec 2023 20:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1701892821;
	bh=Koi93LbGH2rLrbWoIsKD/bXf4ABvx0mX2odLSgcJaKE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RFIUMCH/K7FdPYQy4HptM6nUYoFOO+mYyud0DBt+v21AsD3NKYuV1VsT6qQeLwrwS
	 lY7lgiMr78+xIHj/u4zoNlFL5wHn+3bD6NGgi9nONieS26t0Hrr4ct5RptCWiL2q/a
	 ODLF5YKREkISB26E4LXcn4wT78MydHzhckw4/glM=
Date: Wed, 6 Dec 2023 12:00:20 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Alexander Graf <graf@amazon.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jan H . =?ISO-8859-1?Q?Sch=F6nherr?= <jschoenh@amazon.de>, James Gowans
 <jgowans@amazon.com>
Subject: Re: [PATCH] initramfs: Expose retained initrd as sysfs file
Message-Id: <20231206120020.215a51251cba5a2c4fa51df2@linux-foundation.org>
In-Reply-To: <20231206141627.91659-1-graf@amazon.com>
References: <20231206141627.91659-1-graf@amazon.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 6 Dec 2023 14:16:27 +0000 Alexander Graf <graf@amazon.com> wrote:

> When the kernel command line option "retain_initrd" is set, we do not
> free the initrd memory. However, we also don't expose it to anyone for
> consumption. That leaves us in a weird situation where the only user of
> this feature is ppc64 and arm64 specific kexec tooling.
> 
> To make it more generally useful, this patch adds a kobject to the
> firmware object that contains the initrd context when "retain_initrd"
> is set. That way, we can access the initrd any time after boot from
> user space and for example hand it into kexec as --initrd parameter
> if we want to reboot the same initrd. Or inspect it directly locally.

I think it would be helpful if the changelog were mention and describe
the new /sys/firmware/initrd.  And I assume we should add a
Documentation/ABI/testing/sysfs-firmware-initrd.
