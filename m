Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201157;
	b=kgjZpM4UZZ1ZgF3rgO0a5GZAQCqRSkXD4F2yOoyqSWoQG5NhMZ4QXpwdRp0b0I4tipDT
	 CT2INREjcIb+AOKIwiawCUWbLI3oLNYNGRVWCg9acElGz3O9FNVMSMD/J2ZEiYKabFWqk
	 SusSsrEMpgraHSWELYFlC3vOBWnkRt26hntIHmgjrM3GIUaxe6c/ixdVcF16gCsnqvA3x
	 iSiXeZNwP3NlO8rxWg/nOi6hbZDSzsyzS9ek4Vy+EKmNHHpA7pf+bPaUUFh9nSA7XmLGG
	 FHkUPpj8fGy0ia4aAe7eOEFMiZ6+c58pNqSTAptbI5i+4nS+BZLkHNoaZLqLi4CaPYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=tJwebgYCqnOwbw+tEDHyKOXYITgvxF1JqBIr3xmLP1k=;
	b=Z0FGmUNzP5rXacikyOJjQvb4GQ/vqqg5qcMupFLLRwlZo8SUp76Wi3j/L64viKlKt2sa
	 agVPsAy5godDpmxSf9RpUczu6bq9VAFIc343f9V6yXPZv16FqFMme5e1NSM3BYimzP9AD
	 cKZIRXP3vdKYgJ4SJIPmnle+hzGHMDrMHnt/2M19IxlKH487OgOn2WaX1UjQB+rr3RZZM
	 PQhIsXeyEM1gDwXnqUthR5lu9VJx2eBEJFO5u/fGQoNf3pmPnPeYLkaMqBVj5p/IBlcI0
	 6h3Tk9KcL2fsEEpT8aHE7EC2Bq19OLpCwDPrtdpn/7CjqBjRbF//1igH+kMSAedswSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=mU3aNJZB;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB1F60A2628
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 18:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AB1F60A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=mU3aNJZB
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-920fed989b2so12166216d6.2
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 10:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795201151; x=1795805951; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tJwebgYCqnOwbw+tEDHyKOXYITgvxF1JqBIr3xmLP1k=;
        b=mU3aNJZBRL8xUqWS/+Z7eLapx4QbOcTgVhU+sRd6l8RC/BU4tGdhmpl3f7TK7HXUDN
         e6WbNtj/CG+SB2L8fMXHAhgkzYS+OWZViqSQaN96DeEnuHCbbF3QyV+ORx+ipnLawE7e
         cC9jAUXHBb4BgVZLeGi1R+A9LGcu7JQxCnw6Qid5UMZ/ru2ubKJpU9c3WeRiRVPuISx7
         iQlM29eE6uHpDIp582x0bH1E3v/YLRIlUz8MQQx6kuMQ7rbGY5dfZ5OZrEc0W1eLmd0r
         W2tqTk89VFPb7601U+F+RmlG/JVcritFbVV2fJXNJ2hXrK+nfps0hqEj1izLBKF5UoPP
         lm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201151; x=1795805951;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tJwebgYCqnOwbw+tEDHyKOXYITgvxF1JqBIr3xmLP1k=;
        b=kwoNy8ZFRIqsJv+OzQSdcHmIQZuKR/Velc27PODPqWnuDm0gzg2qhb9JK8PMu0apsx
         jktaV3kTq0U1XiV0VOZc/k4OSIanv2kqktkQ5QEP27n+xRshcRmPb6OvTdycCRWUSO8c
         EoI/z6yHuS/AnvmPVWfvedKs8j5dugXyVGWdNCRChcvuITyIVb6leBfvfFoEkvEaudiv
         59MVa4ojkJWUJjESIfcXgr/fip+zmbfpEuPDTZfzsct7/z/JY5b7xdOUu6e+zW1p9AI0
         dKpwm9bNqdIi8W/kyCcV9OrxZxU3dS2Vq6Es1aEb3dtMdgXLtuIcL9LoYF/BD7mN9ayb
         PFxw==
X-Forwarded-Encrypted: i=1; AL+hErFuZWignW9pOhQj5eXnGUN3gmR5S++MsyriIXTctLfzeCuia+URtuatwITJBzeGBizUD2E0aFhBU1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+u0LGo1SP+reP1RPtXlxO+pAWhMbrlycXb4diDygON2c2vNLlc
	ej+3Y9oZo/0yadtRWLBQBl4aUPZsTXn+mbt0dHlTyf4LA+FlFiSa3NfYC0P8jK9ek3U=
X-Gm-Gg: AZFdTZccNS+X0vHjTPuSw6brjOAGK+HOU4uycm5CbP6NH97FECjjbRqacJ8KbdjjWdO
	STRCwOo/niwmLVb0liwMO9XFwuS50ZI4d38XdZyvrF4fGc4uDU1sUiza9FJtC7SQWGgIgywoqXM
	Er/joy+GLSgBLwcyz84CNcsOtVYeI3Ac3Qxz1l1sC1UNLUSnvNTtkCLH6DM5JHrkC3fdrsZeXyV
	K1yTG7qy566xapgEvN6EPR9tVOnMZpsN5ApBY91rwGUg729fRi37CgiY+YnKkU+MtyQJZJs8M7u
	OwnySEw/SiOykSrx2xJVXqxoGpmUziw5aAI+6v6cTV2QHMXnXdOBXPi4es/DY/6IZMErehMnWjN
	LYrBml781w0pVHrsUUSFFx4eXRsZ8nz0uQFrqD+LS7II4mtQimUAQjEoVQBuQq1SD/GMULwoSCT
	an3XspVTSGC1CIMKVIwIZxyojbwzmNIRB3hIWVYHJQwziwEJIZP2081Ma4eO7zNwOYyN7QLN4jz
	ru886YAvuMAwcfWIyknjQFNgRX6UX19vVLDK+AXL9bxrcvg+sw+N1oNoEVToCLACKF3JVe5nW1t
	ycmjWg==
X-Received: by 2002:a05:6214:528a:b0:91f:171b:e02b with SMTP id 6a1803df08f44-92134b3fff4mr65009886d6.35.1795201150678;
        Fri, 20 Nov 2026 10:59:10 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349f8c34sm34171876d6.32.2026.11.20.10.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:59:10 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xUTpF-00000004mVJ-1MNw;
	Fri, 20 Nov 2026 14:59:09 -0400
Date: Fri, 20 Nov 2026 14:59:09 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Bradley Morgan <bradley.morgan@linux.dev>,
	Armin Wolf <W_Armin@gmx.de>, Masami Hiramatsu <mhiramat@kernel.org>,
	linux-doc@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] driver core: Disable driver overriding by
 default
Message-ID: <20261120185909.GB1133597@ziepe.ca>
References: <cover.1795171088.git.u.kleine-koenig@baylibre.com>
 <f7b5c6319203d288a166e6f811c6ea07e12d5f4f.1795171088.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7b5c6319203d288a166e6f811c6ea07e12d5f4f.1795171088.git.u.kleine-koenig@baylibre.com>

On Fri, Nov 20, 2026 at 12:11:02PM +0100, Uwe Kleine-König wrote:

> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 8228c9acc530..ed505e362b1d 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -424,6 +424,12 @@ Kernel parameters
>  			do not want to use tracing_snapshot_alloc() as it needs
>  			to be done where GFP_KERNEL allocations are allowed.
>  
> +	allow_driver_override
> +			Allow matching drivers without
> +			.support_driver_override = true to devices using
> +			driver_override. This is a dangerous operation in
> +			general allowing root to oops the kernel.
> +

I feel like this is more appropriate as a lockdown level than a kernel
command line?

Jason
