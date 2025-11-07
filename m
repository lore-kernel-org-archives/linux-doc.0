Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F9C2D63FC
	for <linux-doc@vger.kernel.org>; Fri,  7 Nov 2025 02:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762482156; cv=none; b=m+7+j+9x7KLSkQ91Tn6Q91kWOAdIUey0Tf5cWTaIkifugw5HmiZv/Ohgd7gBMxOMWPjINOL86CDb24/IG5ob/SXtpGWs6e/y6MB3PVTR/qkpUmGDK+U83rRaqQWCjMkEvroSkN0LGKLNRehaOZ0GpwEdmBeRcWLqPZ5zEidOjnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762482156; c=relaxed/simple;
	bh=2wJsYMHByxXf8C901yNivTAphL8IDvSKSXz3egAjoMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uzLbCvyYcwfLrrg9YdsC4EldNH1ZNh71BWGLwvQuVpjIvTOiDo6nlGsJ68d8BLqGuVueazdppzIjjNVRXRIUG7pxKRpbDsZEqXycp+zXydV7CMwrKNeaeHIhHFQvSm2gglTRRsnsLjiLCKOukQediUaVLkfE6pvyS6H+AAv0TvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqUXaJWB; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqUXaJWB"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-780fe76f457so2978337b3.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 18:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762482154; x=1763086954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x9ARDwGb0uPrxOLhySJFLBJZQJy4UrXx7An6ywngF4w=;
        b=DqUXaJWB5PXNmMbZbMmV8yU2xnR+VMGbcSefumrZ2KC0fP4PSExfVQyBH7/dN4XMy8
         bP3JRnp97MEXxuTF9MK1pNo85R2zbXJKuQF3Ki+uCo7FZT8Zk6vXEl2qdn5FC2EP7qFP
         yk/d3OxPE5xIUNnSZ8nX/msDGXjfhRxnAHUXjkZnlHaXtcXGvgjiPX1sv5F4yyvw+DSM
         GUraAmB8Uh7dYG/FU658NtFUownW1LBaX2F8wsByylqGJ/z66YItnMxksifX4KDNRvRE
         kmi8Ivq4cEGkJyq2a/PpZnX3jEgmIxPgGlS/CYYx8uufjNsIcY67wvCvwc/14V8GcOVC
         LHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762482154; x=1763086954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9ARDwGb0uPrxOLhySJFLBJZQJy4UrXx7An6ywngF4w=;
        b=XJm/BxFgnKeWQOfALjB0HGsMEeyZ3tTE+P9vPXmdegZwM15g6ScBGhkDvrWR/x61Et
         gi1IMpFTZbTb+do+0/pd/ZWoGo0q64wZE0iMKKHDuxZnDhjvm6d6cyBGA5EOCjNpeybH
         0zbnd3cRVHk9ZmtTEmtIQ0F6SMud0VUnJ62nWNGyjSgxng6p0c+KIbInyd/DUkbiFvf+
         IUC/sTopOehieEhkW1hcJHYiUZEQOAXfYVPcpdvD8TeGHiqG6zkq5rT59D4+GkFSBYF6
         ArcoBFdAzsbcsYNIjLWGmGiYD2WANdvEl8k8g5J8neWUAH3EI3FIbvkytEyRlpBIUmO1
         KIuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY08ifaSWXEOVRLsN62qARlLttl8KjGVOoD+BkEORsinjfgbo8lfJQEojUME8i37NF7OTsVUTgGBA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9lwjsuU6tBKYhmglbI5qyEs4L7fpbP533hvxxeh2fl+FMGMBc
	TziRQl0VgbDzUqa7n1XywLX0987IIFP/6aKaViTPBnOzTJBGCoAhYVWf
X-Gm-Gg: ASbGncuuRMmoRPMaV/nPNVsk/Q3eCF7JWzBtRrCixPaeolnSmUIuS9wZokrMjZ0rOdX
	VAOiShXFKgA1d+K+FEO24YpR5WZfqoUxJpVibXahwMaoP9uPqga5dFgpinSVuhO1xJfkcfXovDK
	hQcU+7Dmlvc1GPyU/zYWRQNs0f/yc+vL06MLgFW7cIxeoKONSBYx3Lp4Cr0PDTeMnMQeWkGKpnD
	5YImhumpMUdItPLm5qxS+YsnfNVVLA3CStvw6d9jnCxElu9C8dIAkbQGMi4tsbnlo2F9B3MsNga
	IXQGjxTeME9Lz2WZ5z8BlOOx6XwMCf6EfewqtAPAL43fJkKBrxp85TMgMRMlCQxHExnyLcW0TAh
	TUxsF2zEgm75ZimwbJUyIVvcyw7y5eiTuiXA1JSa+NSNrfufL3IbCzU+IRpdpW8j9S+lYnX8LI2
	QoJ5B7oaUgLIBxk77NRclJrCIw1KtRXYRzzP+P
X-Google-Smtp-Source: AGHT+IExkQylr1jShV9Ea1kIXdpiUjvn8t/+xJOL3Cfgf/yFTKueS7J/oTfsuiw/7plu274iEpUp6A==
X-Received: by 2002:a05:690c:6f8a:b0:787:badd:4c with SMTP id 00721157ae682-787c534ae89mr26865527b3.27.1762482153981;
        Thu, 06 Nov 2025 18:22:33 -0800 (PST)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:40::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-640b5c91334sm1361787d50.1.2025.11.06.18.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 18:22:33 -0800 (PST)
Date: Thu, 6 Nov 2025 18:22:31 -0800
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: Mina Almasry <almasrymina@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	David Ahern <dsahern@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v6 5/6] net: devmem: document
 SO_DEVMEM_AUTORELEASE socket option
Message-ID: <aQ1X55NjyDU806Tc@devvm11784.nha0.facebook.com>
References: <20251104-scratch-bobbyeshleman-devmem-tcp-token-upstream-v6-0-ea98cf4d40b3@meta.com>
 <20251104-scratch-bobbyeshleman-devmem-tcp-token-upstream-v6-5-ea98cf4d40b3@meta.com>
 <aQuKi535hyWMLBX4@mini-arch>
 <CAHS8izNv89OicB7Nv5s-JbZ8nnMEE5R0-B54UiVQPXOQBx9PbQ@mail.gmail.com>
 <aQumHEL6GgxsPQEM@mini-arch>
 <aQva8v22RVQEgPi_@mini-arch>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQva8v22RVQEgPi_@mini-arch>

On Wed, Nov 05, 2025 at 03:17:06PM -0800, Stanislav Fomichev wrote:
> On 11/05, Stanislav Fomichev wrote:
> 
> Thank you for the context!
> 
> I think that the current approach is ok, we can go with that, but I
> wonder whether we can simplify things a bit? What if we prohibit the
> co-existence of autorelease=on and autorelease=off sockets on the
> system? The first binding basically locks the kernel path into one way or
> the other (presumably by using static-branch) and prohibits new bindings
> that use a different mode. It will let us still keep the mode on the binding
> and will help us not think about the co-existance (we can also still keep
> things like one-dmabuf-per-socket restrictions in the new mode, etc).
> 

That approach is okay by me.

Best,
Bobby

> I think for you, Mina, this should still work? You have a knob to go back
> to the old mode if needed. At the same time, we keep the UAPI surface
> smaller and keep the path more simple. Ideally, we can also deprecate
> the old mode at some point (if you manage to successfully migrate of
> course). WDYT?
