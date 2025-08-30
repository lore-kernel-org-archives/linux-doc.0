Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14B838FA3
	for <linux-doc@vger.kernel.org>; Sat, 30 Aug 2025 21:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756587710; cv=none; b=OUoCeq/ASCSXVDe0R18ZvYoHX0Fc8finy7MFhE9VLVKq22hSi8LCKUJIhg3mel2SKTZeqMufIh9OuTYG3NvYEqIy10qppEHyTM1NJgDbo0ep/481mFLPtEvTCXcFglZU0XtI8W3FFuq81MJVDXnkivF6HWYhE6T5bS3Ji1D9ovs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756587710; c=relaxed/simple;
	bh=qPtI9AGnlz134KFypDhhBxkfFQaZ1R4ZJ4kR2HSYdA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j/wum34wRrPx/IPQQRKwkpE7pvTcedaOqReWXOyHTaCgvIkZgsB1YRwpS/Sw9WgvBFUtPOT0e9A1f/AanOxFxEDWNXu2cjl7UK9i3/aKY0yMSIkUkIxxPJsSVIg3f48eW4U3039DqAKYz7zlyIWGvXjmqSkZ2qLCn023r6zmwbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UAdvRqpj; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UAdvRqpj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=n3OlZiNTwTV4k/c9h53NMlmuTuiWkgo8EVVjFK8sN0M=; b=UAdvRqpjd6CzYV10W27A8MTzz4
	KBeSLChwrSAwfB9fc9UHU0jD923Wlamlxy0zSzZLceIyQmi9uQe+Jha/B9l4XYUMtkahK/IHzebVW
	n2MWmsJmTzS4I1oNfeM6DWTIjarIzuCrb3731CO64m6cZYGtf9fmwoULUkgMimGPyVlw6sIQuYC6Y
	LSMJFFc1eXju6w6zwB88pYIzbI7Pewwvpvg43gKEc5fFtTvMsSO8Qn78UX9iL6vKoXCzyRveaEpZV
	LgaTwQA8KQPIZfXBFFE+nqLmeC1yBYnykRg2oTmybSqr8UnC7wE1J7vayjJvREe4K06gxF7hMagQV
	2ozUT9Ug==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usShm-00000008R2q-2rxR;
	Sat, 30 Aug 2025 21:01:46 +0000
Message-ID: <67de5275-65e7-45c4-b0d9-ea560a972c25@infradead.org>
Date: Sat, 30 Aug 2025 14:01:46 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: Fix typos in filesystems
To: Methari Hari Krishna <harikrishnamethari@gmail.com>,
 linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Christian Brauner <brauner@kernel.org>,
 "Darrick J . Wong" <djwong@kernel.org>
References: <20250830191249.25459-1-harikrishnamethari@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250830191249.25459-1-harikrishnamethari@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/30/25 12:12 PM, Methari Hari Krishna wrote:
> Fixed minor spelling and grammar mistakes in:
> - bcachefs/future/idle_work.rst
> - hpfs.rst
> - smb/cifsroot.rst
> - vfat.rst
> 
> Signed-off-by: Methari Hari Krishna <harikrishnamethari@gmail.com>
> ---
>  Documentation/filesystems/bcachefs/future/idle_work.rst | 6 +++---
>  Documentation/filesystems/hpfs.rst                      | 2 +-
>  Documentation/filesystems/smb/cifsroot.rst              | 2 +-
>  Documentation/filesystems/vfat.rst                      | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/filesystems/bcachefs/future/idle_work.rst b/Documentation/filesystems/bcachefs/future/idle_work.rst
> index 59a332509dcd..f1202113dde0 100644
> --- a/Documentation/filesystems/bcachefs/future/idle_work.rst
> +++ b/Documentation/filesystems/bcachefs/future/idle_work.rst
> @@ -11,10 +11,10 @@ idle" so the system can go to sleep. We don't want to be dribbling out
>  background work while the system should be idle.
>  
>  The complicating factor is that there are a number of background tasks, which
> -form a heirarchy (or a digraph, depending on how you divide it up) - one
> +form a hierarchy (or a digraph, depending on how you divide it up) - one
>  background task may generate work for another.
>  
> -Thus proper idle detection needs to model this heirarchy.
> +Thus proper idle detection needs to model this hierarchy.

There is already a patch for this but I can't tell that it has been merged yet.

https://lore.kernel.org/all/aFB1tGW3Iwf0isZ3@itsmeut/


>  
>  - Foreground writes
>  - Page cache writeback
> @@ -51,7 +51,7 @@ IDLE REGIME
>  When the system becomes idle, we should start flushing our pending work
>  quicker so the system can go to sleep.
>  
> -Note that the definition of "idle" depends on where in the heirarchy a task
> +Note that the definition of "idle" depends on where in the hierarchy a task
>  is - a task should start flushing work more quickly when the task above it has
>  stopped generating new work.
>  
> diff --git a/Documentation/filesystems/hpfs.rst b/Documentation/filesystems/hpfs.rst
> index 7e0dd2f4373e..e2a0872a577d 100644
> --- a/Documentation/filesystems/hpfs.rst
> +++ b/Documentation/filesystems/hpfs.rst
> @@ -65,7 +65,7 @@ are case sensitive, so for example when you create a file FOO, you can use
>  'cat FOO', 'cat Foo', 'cat foo' or 'cat F*' but not 'cat f*'. Note, that you
>  also won't be able to compile linux kernel (and maybe other things) on HPFS
>  because kernel creates different files with names like bootsect.S and
> -bootsect.s. When searching for file thats name has characters >= 128, codepages
> +bootsect.s. When searching for file that's name has characters >= 128, codepages

That's not a good change. A different patch has already been accepted for this.
See  https://lore.kernel.org/all/20250813200526.290420-6-helgaas@kernel.org/
and Jon (the docs maintainer) replied that he had merged the patch.


>  are used - see below.
>  OS/2 ignores dots and spaces at the end of file name, so this driver does as
>  well. If you create 'a. ...', the file 'a' will be created, but you can still
> diff --git a/Documentation/filesystems/smb/cifsroot.rst b/Documentation/filesystems/smb/cifsroot.rst
> index bf2d9db3acb9..8e8c3fb8739a 100644
> --- a/Documentation/filesystems/smb/cifsroot.rst
> +++ b/Documentation/filesystems/smb/cifsroot.rst
> @@ -82,7 +82,7 @@ Export root file system as a Samba share in smb.conf file::
>  	    guest ok = yes
>  	    force user = root
>  	    force group = root
> -	    browseable = yes
> +	    browsable = yes

$iinternet says either spelling is acceptable.

>  	    writeable = yes
>  	    admin users = root
>  	    public = yes
> diff --git a/Documentation/filesystems/vfat.rst b/Documentation/filesystems/vfat.rst
> index b289c4449cd0..f408699ce50f 100644
> --- a/Documentation/filesystems/vfat.rst
> +++ b/Documentation/filesystems/vfat.rst
> @@ -361,7 +361,7 @@ the following:
>  
>                  <proceeding files...>
>                  <slot #3, id = 0x43, characters = "h is long">
> -                <slot #2, id = 0x02, characters = "xtension whic">
> +                <slot #2, id = 0x02, characters = "xtension which">
>                  <slot #1, id = 0x01, characters = "My Big File.E">
>                  <directory entry, name = "MYBIGFIL.EXT">
>  

Nak. The filename is split up into 12-char fields.

What kernel version is this patch made against?
Always check/use the latest current linux-next tree (that would catch
many changes) or for Documentation, the latest docs-next tree.

thanks.
-- 
~Randy

