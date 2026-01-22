Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403E036BCCC
	for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 18:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769104985; cv=none; b=qSe+vQ3FKPo2YWGbhiU0GXADESyCvo5r5JoD39tAVfD3XdOJKJoUH5lh7LtKrrPltToOoX6AXc0oDq4Kh+iUTqZ1A1fNEMMfKZI6QVqRFb8IeXbZZBXB7ZwEAYXWMLfqikDeFU7XdoT69cjFLSudIObahA2r0ZYhr9IKQG7HAlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769104985; c=relaxed/simple;
	bh=HnQGF+GQp2hqS7/UCHcdVaF6HDlO/rgXAhOIogT0hbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBzzcFt9d73+dA7szqaBBoxMFyhxHVlkcHkU4y3Q6XMB65r2R/blASdZp7idoA0C7G9bBu/s7lLGoh1Hwf0uBnEyfuO30H2jDraRV8Eh+a/vBr31R4ezP1FD9uENl8RuDBYO5KDw13VziMtMEHMZaS0pqvuCTON4/4jza9TKb3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=e+ioyvD5; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="e+ioyvD5"
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-8c5320536bfso140093885a.1
        for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 10:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1769104975; x=1769709775; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lk0DadVMYIedGPbXp5WhX8kegjjbwpGdfj2a8a3noKw=;
        b=e+ioyvD5mh1+7tOT8IK9uxQSA/8K/fj1ugC7ALfhyl7CGOvsAUAbCSe5UZvkCj8lGi
         RlQo/vElbPcwjw2FdOf8BjXqyNxIHb57qwr0HxgBshZUBP2UfnuxvnIoJBsP9fdonccI
         A/A49gVzdTm2KMyeMzJSfF0u8pa64FX77cLEM/4nGZIquoxR1baiO4ooaH1lL9ex2Q/4
         LFXT2zGdLiA1W+GY6RWZeAE8+a6ATWNY9YlOzgJklNysQS3Ruc5uYRJxt4DPpSj5RfXd
         Tf55THYRDTBlEbFxerHkY7BZJTOboTl3Tz+dV6X1jO05fvoYcF30kK9JBvQ1wZ/3v0L6
         5FMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769104975; x=1769709775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lk0DadVMYIedGPbXp5WhX8kegjjbwpGdfj2a8a3noKw=;
        b=Jp63cVm6J6NkHPo5j7Ia8ONr0FFsFicwkzq0TGwPyGvLBdFfu//aIudk/y8C08DzjT
         MKFL3uBMk/tJDB/JmCtUWpUYj8wq5cUdhiYtWfHER9sOzCMy9ROJSQAvq5v+MqsZPRlv
         8EXlfH3S/DkvpFLGOqC3WwkBsaa74oq9UbFC7oo4pyWuNswbOYT7UvNS83Lvm+RwH2c6
         YcI6yF74j8nI3b85udkOjF7CUbOsCvYXujNJRJrDfxupFsIObL9SbG2zZWKDNkcjHq+4
         lch/Fz3MtQBvF6dG3mF3Ig5bwBjFnjydAhHZFbVFcfm2hwMIQtE7rvhRcRRDTpHM5b0Q
         zOqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6+eK/ilfOFw3BWIxNRagvk41ngCUBLN7LvH/shKKH1GpD1Pefx3SgsltkJhA9WxUxZZ8ooFQZJnM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx1sipLdNbrx38dnbU3KtqbpuUf3CBimkMPmupv8Ps2u74eElc
	pXanLj3dtCv+YFjOy24hARmuVte7NngkvJjK4RB3uU+IAaxG51rQ25kkYCPK2IPp8WM=
X-Gm-Gg: AZuq6aJSRgL5Wx6IJ1TxrsIfweJoFj9pcxpwDpv2aEQncB1y0iqMxTi5lnQe1h4IJPT
	eN7YmRRk/oxy68b/Yp5B9pQys6g1Yr6tL0Kd7n9BTCyXqaVGLTEPwRW5K+e0NZ0fL/Rr5zMuIQH
	Ja73PspUgl0cQlnczLzg2xmecjva61XRClfmrSMoj11cNb/BOHXMZIEOvJayHzVPsoUseAMUdFR
	BKNPlQWMKEmGWvKF2X/Cvyr6vnRkLsCIlX0sXtN75F/2s7VdQpaApjWeg2DEEvJkC75BRs5aeWm
	dKArbQIsI0UYR/MeHAwHZWW5ntZJFbNZKwApf/hDJ1zS/LTbnJ0oOycWThYTh5FacAaujZsRUKT
	WAlVrP/FUwMiUpd/UIn10TEV5RcaWf+6lYUOqtmrB153iO4u0vbew/ZXtuojhTX2waP8Na2puiv
	C0Q0MuJH0i7e2VC/UEf0aOmRFmJ86x6hOKXDpQibdcaQ6bAUGbbsqWp65rKlynHY06asJYXQ==
X-Received: by 2002:a05:620a:410a:b0:8b2:3371:e9d6 with SMTP id af79cd13be357-8c6e2e44d03mr38296485a.62.1769104974462;
        Thu, 22 Jan 2026 10:02:54 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71c083esm1471036185a.17.2026.01.22.10.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 10:02:53 -0800 (PST)
Date: Thu, 22 Jan 2026 13:02:52 -0500
From: Gregory Price <gourry@gourry.net>
To: Robert Richter <rrichter@amd.com>
Cc: Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Corbet <corbet@lwn.net>, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 3/3] Documentation/driver-api/cxl: ACPI PRM Address
 Translation Support and AMD Zen5 enablement
Message-ID: <aXJmTNKoPhqSDl8J@gourry-fedora-PF4VCD3F>
References: <20260122172432.369215-1-rrichter@amd.com>
 <20260122172432.369215-3-rrichter@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122172432.369215-3-rrichter@amd.com>

On Thu, Jan 22, 2026 at 06:24:29PM +0100, Robert Richter wrote:
> +
> +The following changes to the specification are needed:
> +
> +* Allow a CXL device to be in an HPA space other than the host's address space.
> +
> +* Allow the platform to use implementation-specific address translation when
> +  crossing memory domains on the CXL.mem path between the host and the device.
> +
> +* Recommend that the platform provide a method for the OS to convert device
> +  addresses to SPAs, such as a PRM handler or _DSM. Document _DSM as the
> +  preferred method.
> +
> +* Specify that the kernel (Operating System) determines Endpoint SPA ranges and
> +  interleaving configurations using platform-specific address translation
> +  methods.
> +

As-written for the state of things - this is fine. Just making a note given
feedback on the translation patch set here:
https://lore.kernel.org/linux-cxl/697186008aa26_1d6f10061@dwillia2-mobl4.notmuch/

If the spec is updated to include such translation tables as described
in the discussion above, then this should probably be updated to say:

---
     Platform shall provide the appropriate CEDT translation tables.

     If the translation mechanism can't be encoded into tables, then it's
     on the platform to justify this and provide PRM or _DSM (etc etc.).
---

~Gregory
