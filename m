Received: from mail-yw1-f194.google.com (mail-yw1-f194.google.com [209.85.128.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D0A349B19
	for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 16:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771517168; cv=none; b=Ad3hIU8+2ZEHejjWaPkPtwb4qRfYL047LTOJbIAcXHFCByZDDdc1LaJtfYEkpbQzWhaUOGR9F7avJoZuvuAEJljanYYxNuK1lW+vrgWZ2442mn3/9Y5VPGUnqzqjHIO9xJeSE1bra+bPH+VmwD0P3IQgMrodeaeoh4q1qi1oPbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771517168; c=relaxed/simple;
	bh=4yMC99NeJMMCPXT8o7FBF9zbcjvh5tyBVPAtjWfERlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q3s3/kn10Jmd+RiQ5a7rtTPdFGZEm2jzAdAZILkbR0ekj0Oo6iQxSX/9sc9ejtAmMmtQwAJ+VTHt1d70zmgyn7nDvCLYAeE3QfofsIYCeWYgb7JPwGBo+TfW05DjW4dYc1RFLlQ3wfCBBRvhHSUhn+SSNLW9RgYET8hCm/l3cPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTKRA9Yb; arc=none smtp.client-ip=209.85.128.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTKRA9Yb"
Received: by mail-yw1-f194.google.com with SMTP id 00721157ae682-7950881727cso7559597b3.3
        for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 08:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771517166; x=1772121966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pJXEV0fGE0delcXeFKX2uACQoYyrpadO3o4R7qcFW9g=;
        b=KTKRA9YbazNu4TqwFhNxX59aOrp4Bfarg2kUPhdqFTSL+QYD0G35e6yUd2F6zM4TFs
         pQyqh1x0isberlefOWaH84y4gz7qinX4PeFFvXAH+feHCFxnRT73YRCqwsUZyD9phlga
         cueD7ZcuWCwYP2C7oXyDClKe3Af0YGZapEECrJY27ZqN5s0Gnhv8lMgvNGKL9wgXLuLP
         m6RLkbt04EpZ7JRtyvL0PuPsJaciyLOyPIyjTewh78YblNhYi4060Tg+hfbgyhvymz91
         3WkBX0b2MATxczn2pB/hBzLPDmJskzMw0gjo8bgdn7Zd1EEHClku4uNHywliEt2sBjPw
         zTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771517166; x=1772121966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJXEV0fGE0delcXeFKX2uACQoYyrpadO3o4R7qcFW9g=;
        b=msAIHYbtS2/Ts4fD8fyMSohxQ9V0bPerNDwBBX/gGe40QKpzdhkb8R9C7s2BpNGkw9
         3LFAG44xPPQ4IciQZXF6myfEV3gB0qXzKcJXsDnbJ7SY2qJ1RSTJuQ1ZGtuU09bdISnY
         d4ah4wteB+xFjUSU659fYUKJ7DP2kXvlUKWxQYUjLA/zFRGEYWClv10aI3M3Q1j/8uM5
         hPQvjUDHeuPR6u6OVlApkXxccRd//y6eot9cAlF6jVl0irKk5RG69v5rL7Qu52OgfpQy
         bRJiteN6vJ2fpoddkBghKuA3BUrXoRjSSt0TGAU+naXwlEs8irFrrffh0gGnpH2OSEal
         zY/w==
X-Forwarded-Encrypted: i=1; AJvYcCXTszfYp/hE9kPXNNgvLYQe/sVKfn1O5uXvk04Meo00RsaE1IlId6pXyBRT6MX22UYogGK/3b/qzdk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw8mFDtVNsXtpik33HafT/04t6vSif1UaHE9cZlEAQnX1CN8R1
	b3f/hEf583ClTxurVbUL3pMpTXUJ2nUGHlwKa/nz/28j+7Za35J96F8zQRWOFKFT
X-Gm-Gg: AZuq6aIfDDNQx0WBUfQon56ieZ7DzgspOw4djvUaN/rswbVYPei4l64c0BDfPHnBjex
	eWSM9W4yCZPT9beR0R6tje7OvrfKrDqLmy3alFLf6xtaP6suNqETWS5Z85JGNOOn1WZGwzobnqj
	SVQK9BolwOcWmrLG4O87Zw1YsED7n6+X/aTdWqorYHAlMmy2wIAdw29/JGRlVrFl+JTK6UGiUHX
	EgQYRjGDNeptHz9TZ3jA4+mDMxkOxBVXqnA0uGxcdFWhfI4MXhsDGoHO+vspph8z7ravQnexNhM
	YWzSHaKZhJgkQn4sJjryHDtY91r5IbAD2go6UGX1MTGFOK78yFe5EinqzNKeeG9fe5s/2DoAY3e
	hE2rXCOb7haFhJMjVHL79NyehfOdPse/TLzRT4oTvdLBGAAxNrQv7hxscW+4ScRUYOB7pelmJjH
	73Kp/29A2H1ca6+KqiikCYDLqG4MqWujj1kuMeS7wMB/2JNeE=
X-Received: by 2002:a05:690c:6c86:b0:795:c78:b633 with SMTP id 00721157ae682-797f73f4d48mr49916427b3.62.1771517165867;
        Thu, 19 Feb 2026 08:06:05 -0800 (PST)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:56::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c18b464sm135320017b3.13.2026.02.19.08.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 08:06:05 -0800 (PST)
Date: Thu, 19 Feb 2026 08:06:04 -0800
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net v2 3/3] vsock: document write-once behavior of the
 child_ns_mode sysctl
Message-ID: <aZc07N4BFw0hhnoZ@devvm11784.nha0.facebook.com>
References: <20260218-vsock-ns-write-once-v2-0-19e4c50d509a@meta.com>
 <20260218-vsock-ns-write-once-v2-3-19e4c50d509a@meta.com>
 <aZbN8fXtCkhItSV8@sgarzare-redhat>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZbN8fXtCkhItSV8@sgarzare-redhat>

On Thu, Feb 19, 2026 at 11:36:40AM +0100, Stefano Garzarella wrote:
> On Wed, Feb 18, 2026 at 10:10:38AM -0800, Bobby Eshleman wrote:
> > From: Bobby Eshleman <bobbyeshleman@meta.com>
> > 
> > Update the vsock child_ns_mode documentation to include the new the
> 
> nit: s/the new the/the new
> 
> > write-once semantics of setting child_ns_mode. The semantics are
> > implemented in a different patch in this series.
> 
> s/different/preceding ?
> 
> IMO this can be squashed with the previous patch, but not sure netdev policy
> about that. Not a strong opinion, it's fine also in this way.
> 
> > 
> > Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> > ---
> > Documentation/admin-guide/sysctl/net.rst | 10 +++++++---
> > 1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
> > index c10530624f1e..976a176fb451 100644
> > --- a/Documentation/admin-guide/sysctl/net.rst
> > +++ b/Documentation/admin-guide/sysctl/net.rst
> > @@ -581,9 +581,9 @@ The init_net mode is always ``global``.
> > child_ns_mode
> > -------------
> > 
> > -Controls what mode newly created child namespaces will inherit. At namespace
> > -creation, ``ns_mode`` is inherited from the parent's ``child_ns_mode``. The
> > -initial value matches the namespace's own ``ns_mode``.
> > +Write-once. Controls what mode newly created child namespaces will inherit. At
> > +namespace creation, ``ns_mode`` is inherited from the parent's
> > +``child_ns_mode``. The initial value matches the namespace's own ``ns_mode``.
> > 
> > Values:
> > 
> > @@ -594,6 +594,10 @@ Values:
> > 	  their sockets will only be able to connect within their own
> > 	  namespace.
> > 
> > +``child_ns_mode`` can only be written once per namespace. Writing the same
> > +value that is already set succeeds. Writing a different value after the first
> > +write returns ``-EBUSY``.
> 
> nit: instead of saying that it can only be written once, we could say that
> the first write locks the value, to be closer to the actual behavior,
> something like this:
> 
>   The first write to ``child_ns_mode`` locks its value. Subsequent
>   writes of the same value succeed, but writing a different value
>   returns ``-EBUSY``.
> 
> 
> Thanks,
> Stefano

Sounds good! I agree that is more clear. I'll also remove the change
above that adds "Write-once" at the beginning of the paragraph, since
this clause does a better job explaining how it actually works.

> 
> > +
> > Changing ``child_ns_mode`` only affects namespaces created after the change;
> > it does not modify the current namespace or any existing children.
> > 
> > 
> > -- 
> > 2.47.3
> > 
> 
