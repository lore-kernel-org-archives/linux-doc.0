Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815030;
	b=qXlKyJCas7TfYSymbuEW+PWNPag00Cl/BbaSdrAD4DXRZUpyVVQxh7vR0s2OeAOjpN1i
	 Ip2QZcFDnrzCaGpVVNXgeVMIQLhtPeAQlPjUuUbmTLSqrikJ8bGz+n/T24ZYcCPSCqf3R
	 ZKvSZeMOos0+kp5xCbL+Sr35NlWVTRIzuZ/caAuk5xMaWKKJLtL/AV/Ows2BFsjNshXEz
	 EFeabPYBdd4eJarXLSozWqgFh9vW0pBeWMHFsbUzswW1K/EZQtdfFlW+/JVfxHx1qCwDP
	 FboCjIp2/ptvV9ZnzSEZmEhsS5NF5yiaXaDEwvkUyqIjFXIPubHrbzK/a8vrpOWEQDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=u6+Lf/8gHZf1IKHjq4H+ss02XIxxzMA/c7y+z6oAgJc=;
	b=EctRpVhFcQjJLwhWgxJerzrWxC92jYKV4XB04JKykla1mvaBb3ZckwNq3CAzvvqAkoYY
	 UvNnbmdf/gV0iMERhYePA86OlV5Rnpo4Bd5WynYRcFwNZYQU7E2xTYVgLLtZdASMj1FGZ
	 vDGJUYv8y9EYwtFH8+lzqOvzVJQ1E/GDKQBzKgKv1WV3d6QB2OnOp04rM1BF0RW2OVceR
	 LHz+Pkew4Io8r3OpSLKhorcMp9COa8tYq4bCn2BE0eDHmYKLlUG4778MlVACfjs2zBT0Z
	 KFi1MGx/JwGf7zhgETI7XOTgiH3tIYYUCCAtTZCB6OA8ow8JpDkMb5QFssHeSYosxMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=jSpTFwGr;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190B3607168F
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 17:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 190B3607168F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=jSpTFwGr
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-537548b811aso7316281cf.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 09:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793815029; x=1794419829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u6+Lf/8gHZf1IKHjq4H+ss02XIxxzMA/c7y+z6oAgJc=;
        b=jSpTFwGrGxYp4V4QZz2ba5dYIoDJJuxWjxKzx8KifYjFiBa0ODGbZD1ZEEW7S/WD0T
         Uh/eSnAdhC0igsZSTinaNwZ4d/bVNxNVLR0SLBhFpcfR//v8TwO6mWhjarmiAGHvyd/R
         eexkK+c4Gy+NJuptHuPNZ54oZFyCFRniuibxorEQrulnSaF5/g4Ne6nK4G/A+pa2SYyO
         6VfYSM9ZMa476+obumWFBoY+RomdwnrNryQ/m7ngxfEuyZ57ZyO3Quffa1K8yWwxMq9m
         PI1/0vFyzZ7alsgF2rxdyGUkXrbSK26XBu/pXg8rzUuwGjiFyUH5CdTcpJmTHMDmmIvS
         oFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815029; x=1794419829;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u6+Lf/8gHZf1IKHjq4H+ss02XIxxzMA/c7y+z6oAgJc=;
        b=ttF69ajAnGryV84Bfnn/UGZmtM0gnJX7JfJkEaaX9Db4MlLyYX5KsxYgqiCswt/9bK
         kyYvvMpECNSxTMZ0i5tpBkgZ7+IJT8YpLkLbQj8vApA5YSdpGzMXbl+pj0uMhpeg/jJW
         ZvotdnUhvdHg1JPPBMHgNyIwAEkVYQamGAo5jGKisaOHzA7vrcC+IuFtfcu036LgCJmE
         sFtdDlxkOY77EJS/1IyyS/rERAH4/4DHM4rIH4gXGqaB+stQ2SMsT3z4VBx+GDCUYVR1
         D/k3jNkHEURlqeurAWG/y4RehebZ6TqJsmkEU5LvO+VkpOjFva9o5E3+HQFXe0//kFO0
         b3Hw==
X-Forwarded-Encrypted: i=1; AKwUvBwR1Mo9Bmj4MARwCVCWQ/f9q4TnZUWPV1ljZNrOC1By07D5l74mSh8mg5RC2KC/L6HgPAoVxZ3+BE8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+angDvtRhJ7/A06yXQirpobngi9fLD2RM9UsMcx84m2O1jGWxW
	l1SYMXGgEfl9PeKkqy6T47OQ5kUgs40RVXDl0Yaor79ynU+GYm7nzMSLkiYIQpzRRHk=
X-Gm-Gg: AYBFou3q2Q05+4UKqOf1ItsWASogxJS3775iENYn2s/PnvKdBO/Me9r60WsglOEqOhU
	EAfdbMShV5dxMgSHEe7s9g2XSF3Y4oCIZb4v+haje7+wXPDTe+ABN0u9TOhjq2VbbsvXghGNKTV
	mQt/dXLbRee452QF7zqLuovoOzrbpxVxT7nhHokGLyS+rYO21tA97wmeMysZT88uMdj3ZHRNZO0
	Y3wy4qERxICRz+cBcoctuTm537zFtQv9SEhGFUfEqksdG+BqW5jJwaunGpMIsfVIHQiegbtCh98
	nEyr0qxPwkiIy5r3dsoi2mlikyQvOGm9JItn/IxpSYTF4fVwok2j4rFgKIgBiIyZXx4iuMpLwdC
	wEwIIeyjpHopOgwVG+4IbVDkml23pwTUA8X/jRga0FvultguWXcr4YPykiybuOYirku/fIET+Sh
	uynSdcoirsjoNbf33iu59HhDG7zUadDHtVVlGxcj/edyLr0p5fdNY/akjL4r1K1rgCriklXnl/t
	HP1rB8jU6UZE5fQwRMgc5cASyhNwD9h4xJeFzOuPVpxmhgcdYiq1tAROLzKLaNs40OXNEjo/i0c
	c57/jvWtNacm2OFRivHqRb/TGJCWqBYH2BzZauqb2hmv+IXi3yTkLF+JGKzTT4KZMbza41tcm5f
	JwGEegtmGIQ==
X-Received: by 2002:ac8:5f08:0:b0:535:baa:a78d with SMTP id d75a77b69052e-542b3a728c4mr272645741cf.10.1793815029017;
        Wed, 04 Nov 2026 09:57:09 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10a6ca24sm30262291cf.14.2026.11.04.09.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:57:08 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOfER-0000000H210-48gw;
	Wed, 04 Nov 2026 13:57:07 -0400
Date: Wed, 4 Nov 2026 13:57:07 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiri Pirko <jiri@resnulli.us>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de,
	ksinyuk@kernel.org, rodrigo.vivi@intel.com, cedric.xing@intel.com,
	sameo@meta.com, drdeeglaze@gmail.com,
	James.Bottomley@hansenpartnership.com, aik@amd.com,
	jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com,
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com,
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 11/20] ctlv: Prepare runtime introspection
Message-ID: <20261104175707.GA3889730@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-12-jiri@resnulli.us>
 <179302367452.58760.11808905856343064399.b4-review@b4>
 <auRmMPfaFINUIchi@FV6GYCPJ69>
 <20261103010537.GI3889730@ziepe.ca>
 <aumogVKtYnY0QJ2r@FV6GYCPJ69>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aumogVKtYnY0QJ2r@FV6GYCPJ69>

On Tue, Nov 03, 2026 at 10:29:45AM +0100, Jiri Pirko wrote:
> Tue, Nov 03, 2026 at 02:05:37AM +0100, jgg@ziepe.ca wrote:
> >On Fri, Oct 30, 2026 at 10:53:11AM +0100, Jiri Pirko wrote:
> >> >So.. how about could we drop the sets, use a direct description of the
> >> >layout and do something else for the ID numbering? Maybe the numbering
> >> >can be solved directly by only listing the names in:
> >> >
> >> >numbering:
> >> >  - device-get.reply
> >> >  - device-get.reply.caps
> >> >  - device-get.caps.evidence
> >> >  -[..]
> >> >
> >> >?
> >> 
> >> I'm still committed to implicit numbering. For "inline records" I
> >> resolved it by having it encoded as a tree with 4 levels:
> >> 
> >>  63         48 47 46 45        32 31  28 27  24 23  20 19  16 15               0
> >> +-------------+-----+------------+------+------+------+------+------------------+
> >> |   family    |kind |   index    |  L1  |  L2  |  L3  |  L4  |      field       |
> >> +-------------+-----+------------+------+------+------+------+------------------+
> >>               |<------------------ record ------------------>|
> >
> >Fascinating idea. Sort of like an oid
> >
> >I guarentee we will run out of bits someday :) I saw recently we ran
> >out of bits in RDMA :\ 3 bits seems like quite a small number..
> 
> Well, this is just for inlines. I think if user comes to the point this
> will not be enough, he can use named record, as he probably should with
> more than 8 inline records anyway :) Also, we can introduce "mapping"
> mechanism to allow inline conversion to named record without breaking
> userspace. I just didn't bother to implement now as it is a theoretical
> problem now as I see it.

Oh OK, thats interesting.

Jason
