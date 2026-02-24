Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD512135B8
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 00:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771892652; cv=none; b=uS3cXHDj/T5vbspHr5AMF15/vXHoKXIGKGl1yUiY0AksQlgDAqWFKCLeTUEk6edkCZyrAhuDGqAa7ifK2R9CcX42fXmIS3lcVuImWQBRFw9NuqEwy47+8i1n1CW5LwkjZ93Y/Y47i1x8AG9pY05a3NDHf5YJdo+/HD4OlYSjKYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771892652; c=relaxed/simple;
	bh=jKHWyDAu0xJvzI3WO6+meQgDEHUikzp88qy14INmcPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AELyE3R25UET3xLveCEFaZausIZQ2wNjsRXPty+gm9DIcUOet5n/a2j1oP1KYxHvlDCx8TNHF07biMZZpdUWqFCM/dDl8mZ3kRqE3onm8VV5/6UzZQ4w+VBdJUBZ9aw0Y8OFVaw3LxzbkUMPpyVsUKvbuoQPxatVyW6aHlM4VE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GpogB9XA; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GpogB9XA"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64c9707fc11so743120d50.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 16:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771892650; x=1772497450; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u1akxnV01TuuqkqVdn8oJReBwARp0bMrNePNSdt98A4=;
        b=GpogB9XAYZVLqYAmNIO3FrVFQhmoujs+FpP+4b4mJiQxMSpUhpo8OwTsalI1EAz5ur
         FDKD6SSIPbopYVEceVSXKj3gzfrTiKdP0+3Ub6uiMB1ddrs1Fu+cK0zFxTWqfA1p8xWC
         txJfEn33rZ6JzxMxxuA6/QrDQqfcZRaNXpgcgCSmInhIkhcmYhgtfgA8Gid0msMlNcXz
         JKBczHy9aVSGRKZKrxwgLCBLNbVUrbZHlQHqRTPyxUdV3UJi+dkZe8fwFoAsw3Jk/4Oz
         UTt8OAJtk/+0IWTu2oGeGp+fgfSqocrq5h519eM/4FaHGro3RfgStDuRzcEsOwR0S3oc
         hl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771892650; x=1772497450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1akxnV01TuuqkqVdn8oJReBwARp0bMrNePNSdt98A4=;
        b=wQb8uOkM2AcI1GkVpLy9oiPVNC83HfpVtIQjM0f+aKnayx/VsszH1ReaIqaLbkCFIj
         VqVe07UkMKdGY3vkXSJ7V+7me1GvzAhWGv2gb5ZEZKG2fmU9nbabgnKVsC3gSt99A2iO
         gIYEnFIHOpYkJrspWrvTAd+UXUH2dG6jjxpHHhfNjZgCU+MbRcrx7W0tpDEZ7NUfr7/1
         5eZy+pXioNrkKY0WR9OH+w/7CXokhTX9yTS+m3wraXGrqH1cBtZx6PZggvnOKp/oY1X6
         gbFnvCnheV3A6CS8fOf68Sl0Sk/5amdaqST+4XsbTjZVPcLVnksepqD0tAM0UClyCpsL
         tRhg==
X-Forwarded-Encrypted: i=1; AJvYcCVZNhqb2colDirq1yxlMPR+7qkrlJ7CSPEX5xyzRcpQ5iCGJi3BG+vUjmRnHFBDeKXs2lJ7Sa6/vyM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOa+jxv+dPu1l8iAnGmkR8oydgBTS9p98SonuBnURt/WPE7xFh
	c5qvb7o4vN+0gQWo7KRkRht5cRacuBJfaAyr/Z46ajyUr05uIY7wJh6r
X-Gm-Gg: ATEYQzx8dQ/7GHSh7F8UL8ELbBapNbem7z7sffR07SaF3obsHfUB+Wa8TMpZiW9y6KE
	eFlJBnPjM3kRmcow852WqhDussYoJWM2F06seMiE7pWgnc0GcWabrTagXkCxrvrG5xtzawmSzO8
	gCrQWuEiC4eSHCoOq34oP0VUDCe9Npx/Nhd7WMmWJBRjtDTV9MMBpdtn1zXR4D7tQXfCzi8nm1e
	UCU3vSsZDs3nZ2ADN+bsi6g8yLmKrnxRRa21dEeHUoXbMw3rlpYm0bt9RVjWis5Hiw/qGd+RSqz
	J8+M3jSSttNx4IOQFIFQpfuFVJ/Cvz5fotC5LkAxLXKmKQG4BbcMjiHM+/hNiR0UxvsQojLlP9I
	JWKk5iV9YXWNFcXXYbzDLkxGjeycHJbAXQgLaBUAJtQTqNyH2nbr4SMElFrwX9pyL7dHUMes2pW
	rcfGOzYh4L6QrR6PvLztfdppvKMjJ7PTnuXodYLnuI2fkhnFE=
X-Received: by 2002:a05:690e:4149:b0:649:4906:770a with SMTP id 956f58d0204a3-64c788d2821mr7812527d50.8.1771892650119;
        Mon, 23 Feb 2026 16:24:10 -0800 (PST)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:41::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64c7a35d839sm3891935d50.13.2026.02.23.16.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 16:24:09 -0800 (PST)
Date: Mon, 23 Feb 2026 16:24:07 -0800
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	kuniyu@google.com, ncardwell@google.com,
	Daan De Meyer <daan.j.demeyer@gmail.com>
Subject: Re: [PATCH net v3 2/3] vsock: lock down child_ns_mode as write-once
Message-ID: <aZzvp52L4smGF7cM@devvm11784.nha0.facebook.com>
References: <20260223-vsock-ns-write-once-v3-0-c0cde6959923@meta.com>
 <20260223-vsock-ns-write-once-v3-2-c0cde6959923@meta.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-vsock-ns-write-once-v3-2-c0cde6959923@meta.com>

On Mon, Feb 23, 2026 at 02:38:33PM -0800, Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> Two administrator processes may race when setting child_ns_mode as one
> process sets child_ns_mode to "local" and then creates a namespace, but
> another process changes child_ns_mode to "global" between the write and
> the namespace creation. The first process ends up with a namespace in
> "global" mode instead of "local". While this can be detected after the
> fact by reading ns_mode and retrying, it is fragile and error-prone.
> 
> Make child_ns_mode write-once so that a namespace manager can set it
> once and be sure it won't change. Writing a different value after the
> first write returns -EBUSY. This applies to all namespaces, including
> init_net, where an init process can write "local" to lock all future
> namespaces into local mode.
> 
> Fixes: eafb64f40ca4 ("vsock: add netns to vsock core")
> Suggested-by: Daan De Meyer <daan.j.demeyer@gmail.com>
> Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
> Co-developed-by: Stefano Garzarella <sgarzare@redhat.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>

Stefano, I wasn't sure if you wanted the Co-developed-by and S-o-b on
this iteration, but I added it just in case. Please let me know, if that
wasn't what you intended.

Best,
Bobby
