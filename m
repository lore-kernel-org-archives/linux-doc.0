Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A70C327C05
	for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 10:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771497408; cv=none; b=mj3OKjTPU11aMj9qN16EsG1U7QKFiSYQlpNDt7Gi4VtrTHmynge+KY06x/2hYF5GzYfMZ2LRow91c0P5XA8IvB/T9S0byfMKw1f3ckgsnfXJGLr9x5A035A0p8W/CsqE15Cmkcg5s2NBRXJ3aq75voOccbndGORxyKHQn+Ee0Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771497408; c=relaxed/simple;
	bh=oqw0KlNKIPYnEI20309wgxqKSge7eobGKUbr1LdjuGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PaOq9/Ik/TLD1f769v+8UFLzUmMC2Z5tfpHyvc9Vh2I0Wc/fYwAe31eZdvmXDBA9eyY8X1cBnK0eEwjILVUIfKvm7Im3XBiW7UedRIzuI1gpDGB7vfDHOWJJAatEGqRt+Ez+0qMg/UuHWVJ3gN63G31IStjqInIeh6P+0sAJcsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IMvTI7vh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qIsEgonr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IMvTI7vh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qIsEgonr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771497406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0HuCXThfRUEeEl7yH4RijL3+g7m+evVIDET2wFtyGPA=;
	b=IMvTI7vhk3vuRkMM2kkV41ium5VGv7PT9IoyOLKQfO/Eu8PZ5TdwKuDhseOAlr5k5vvo12
	b1/S3HPV55lD4FePO7TyemdOfj4e8w2Y1lh3/O1oE2Zxw0PoCyKtTEzgcH7w49ej97W6oF
	WOjlcHbTBcQNG0DsJ2XQeW5Kr6iENdE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-o4d91YAAN766vyq6U4kFaw-1; Thu, 19 Feb 2026 05:36:45 -0500
X-MC-Unique: o4d91YAAN766vyq6U4kFaw-1
X-Mimecast-MFC-AGG-ID: o4d91YAAN766vyq6U4kFaw_1771497404
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-48372facfedso12901165e9.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 02:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771497404; x=1772102204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0HuCXThfRUEeEl7yH4RijL3+g7m+evVIDET2wFtyGPA=;
        b=qIsEgonrPfvZJWqC1SF7flDp7dYt/nEHIjpY99Jbl9Yo4ZoBYfcrfBxW98RFMYJStX
         OhWdWkrrmR7WZe1IoL+EnvtqZyDTl5catuoBvtFPloxY/FDnMEW4aySa9FLP3I+23f6w
         AQVPSUQZcFHfTcJurL3NXkg5ArIZZt22k7TQ/WeBEreojzEvkvBTguymSNbQOBciACG0
         IuVknXHwPhcfjTQegTSKy6f7mp3eMYtKk2puiPpfKWRr1jhAdat/JTLt+3zgvTlsH9vs
         uw9UGWpTEBDOLfX/KaVNCH9rWBOuI6o22LJpmnBKjXJoBwHlfuO0lzW/fF0yksVGrL+L
         P/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771497404; x=1772102204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HuCXThfRUEeEl7yH4RijL3+g7m+evVIDET2wFtyGPA=;
        b=q/9ZdR/RbuxkO9kld8OHBk0UjdJUpggXRMmH++X74x2ja22ChXI/v2Zuu40Qs6/iop
         Xoj9je8XwiCSg/ynDnGhNdY3h12BkdKSvUTZXrMRxzunvYON7jSgIksMp1plPdRF7Ulb
         Hc7pvJ0KfgBtTw8LPrZiWIlsJvwp9+wv7QguOERFw2lNZy1Up4Y++o9KoR8YjfDiaoMw
         LktBLdYM9PTX8Gz/tQDnv69PzhopYrAQ33xZe27KvYuy6bF/YybKitS7242P581YCfRc
         ZSg/TBY/JoWx8Rb2d8BdAC5AX21pzRyAAFw2bcqoilozIvMpsgbbWRGO2vj9O0213cHd
         uiAw==
X-Forwarded-Encrypted: i=1; AJvYcCUXISVJMKzSH1ijaD+JMbnfq4rB16ANEhfqZUUHUWw/Lg/yMgTwH+4zlbt4lS8igG18UV/2Qer0VuU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz+5XJOwVCnm9AuwcKtANo914U6iUD0GBRd0aYf29q4WKrgYlF
	8D2lRlvpGHo9LYq4P8N4PSFNSLIbsV9cvDA5/X00UGRV3jUwIocHKdI4beBkWKPKcWF9w80/r47
	3lRrumE5bFQ8Q/u51mb7aWgKSDM4AYO6YHxA4WtfKPC1vF9Q9ca2bv6N7EfPZ/g==
X-Gm-Gg: AZuq6aLxhTLjsb+T07JH3OhjHLGMxWFwKoIodYub7fwRoXczA1poTmSjvICpURHaEtP
	mI25mzi/ophsseilyBGt6ui7+aRfaorKo2d3y1bByyakI+sUT2//7f56ex+izTIa+8Hq5H/tkLq
	g4HQR3MM7l/bWnmAw/3s7UuFGI5G3I1CJhdh9vI9kPO1VJWiMRK/cBfzPZbLCuw+vs+XcijxuCG
	5DTJLiTJNu0cKHOn50GZHcxkTNlyOKCYo6aHH4jkHPQWGkKv37LHl3nD+APY5H1SWTJTpKJdNqD
	Gw95qRJ+CNbtMkMr0YOAHmP+S6EAOQQMQxF1EjpxMIAO5dVLG+qN4MJZ5+Q4g5SiZnWK0XmpXR1
	+lb5YMTu/x7ji3v9f6h2vgHlXQpfs3NpmPe31CxpbGbD4xa3VQKlYSEpLcODkaRyX4E4zUjg=
X-Received: by 2002:a05:600c:214b:b0:47e:e051:79ee with SMTP id 5b1f17b1804b1-4839fe90522mr18467545e9.3.1771497403794;
        Thu, 19 Feb 2026 02:36:43 -0800 (PST)
X-Received: by 2002:a05:600c:214b:b0:47e:e051:79ee with SMTP id 5b1f17b1804b1-4839fe90522mr18467255e9.3.1771497403315;
        Thu, 19 Feb 2026 02:36:43 -0800 (PST)
Received: from sgarzare-redhat (host-82-53-134-58.retail.telecomitalia.it. [82.53.134.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839f99067dsm17354955e9.29.2026.02.19.02.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 02:36:42 -0800 (PST)
Date: Thu, 19 Feb 2026 11:36:40 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net v2 3/3] vsock: document write-once behavior of the
 child_ns_mode sysctl
Message-ID: <aZbN8fXtCkhItSV8@sgarzare-redhat>
References: <20260218-vsock-ns-write-once-v2-0-19e4c50d509a@meta.com>
 <20260218-vsock-ns-write-once-v2-3-19e4c50d509a@meta.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260218-vsock-ns-write-once-v2-3-19e4c50d509a@meta.com>

On Wed, Feb 18, 2026 at 10:10:38AM -0800, Bobby Eshleman wrote:
>From: Bobby Eshleman <bobbyeshleman@meta.com>
>
>Update the vsock child_ns_mode documentation to include the new the

nit: s/the new the/the new

>write-once semantics of setting child_ns_mode. The semantics are
>implemented in a different patch in this series.

s/different/preceding ?

IMO this can be squashed with the previous patch, but not sure netdev 
policy about that. Not a strong opinion, it's fine also in this way.

>
>Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
>---
> Documentation/admin-guide/sysctl/net.rst | 10 +++++++---
> 1 file changed, 7 insertions(+), 3 deletions(-)
>
>diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
>index c10530624f1e..976a176fb451 100644
>--- a/Documentation/admin-guide/sysctl/net.rst
>+++ b/Documentation/admin-guide/sysctl/net.rst
>@@ -581,9 +581,9 @@ The init_net mode is always ``global``.
> child_ns_mode
> -------------
>
>-Controls what mode newly created child namespaces will inherit. At namespace
>-creation, ``ns_mode`` is inherited from the parent's ``child_ns_mode``. The
>-initial value matches the namespace's own ``ns_mode``.
>+Write-once. Controls what mode newly created child namespaces will inherit. At
>+namespace creation, ``ns_mode`` is inherited from the parent's
>+``child_ns_mode``. The initial value matches the namespace's own ``ns_mode``.
>
> Values:
>
>@@ -594,6 +594,10 @@ Values:
> 	  their sockets will only be able to connect within their own
> 	  namespace.
>
>+``child_ns_mode`` can only be written once per namespace. Writing the same
>+value that is already set succeeds. Writing a different value after the first
>+write returns ``-EBUSY``.

nit: instead of saying that it can only be written once, we could say 
that the first write locks the value, to be closer to the actual 
behavior, something like this: 

   The first write to ``child_ns_mode`` locks its value. Subsequent
   writes of the same value succeed, but writing a different value
   returns ``-EBUSY``.


Thanks,
Stefano

>+
> Changing ``child_ns_mode`` only affects namespaces created after the change;
> it does not modify the current namespace or any existing children.
>
>
>-- 
>2.47.3
>

