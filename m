Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9026C139;
	Mon,  3 Feb 2025 16:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738599826; cv=none; b=rFuNgQiMGzg6cAFvuby3O9fpcn+YvBgCiI3r5PVsvjnqDjzeUVH3sW2p4bc6zHmozlMWjEKoTqHoYsT3eQUDqdNONPr3EVV6G+/uMP+b/QNkjXfNlh1LxCx+5wkcX7tkoltrqz8Oq/L4U8F4lyB5WK0cS7zcQ9BHd0JFcVSxxZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738599826; c=relaxed/simple;
	bh=fkS2XZfQMC3jGgcCxs0EzS7YxuFVjThmt/66sZi3Vg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAAY70R6SlYCsPGkJfzTZr4jtTEmX62N9DakHwAH/KjIkwnsOItLfcJ6sy+yObXMQLWqfKbwFc31WIEeSJBDBLgST+X3o8/JpgP2erWCfZtgcA/KSpRtb1F0qYc4+gYl7QWuTyapyjduekqvXZoGYOKzHA0qRtQQDmlHLdzcEjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Kng8AcX5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Kng8AcX5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F021C4CED2;
	Mon,  3 Feb 2025 16:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738599826;
	bh=fkS2XZfQMC3jGgcCxs0EzS7YxuFVjThmt/66sZi3Vg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kng8AcX5alkoSaYlAHkcX+Y+wFLNqjccB5CXIJ2gUgA5eUUrXUXzrPdv/LtkptwiJ
	 cetvjM9J19oBbbwFwYTYEkUSKUz0T+hSambJ9ZxL9D+EttJ0EJR8LOwA6I4Y64+aED
	 IbPw6IYnEU+pLm96nMmh9WzTLSqpwzGFPGzCPKvg=
Date: Mon, 3 Feb 2025 17:23:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pranav Tyagi <pranav.tyagi03@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] documentation grammer correction
Message-ID: <2025020359-despise-polyester-f8e4@gregkh>
References: <20250203161920.14028-1-pranav.tyagi03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203161920.14028-1-pranav.tyagi03@gmail.com>

On Mon, Feb 03, 2025 at 09:49:20PM +0530, Pranav Tyagi wrote:
> I am submitting this patch as a part of lfx mentorship application tasks.
> This patch contains grammatical and spelling corrections in the linux
> documentation. Please let me know if any further clarification is
> required.

Lots of information here in the text that doesn't need to be :)

Please read the kernel documentation for how to write a good changelog
text, many times it is the hardest part of creating a valid patch.

thanks,

greg k-h
