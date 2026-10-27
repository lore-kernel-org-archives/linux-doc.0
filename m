Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793108295;
	b=j2P0ROqp6y9ZYrT+y5Dm8M9asHeRbiYlx39kt0FIkF+wx+Pg9cw+zumfZVpLOMJmjH0M
	 HgUIIEJk2LO1zZTmJfgT5jxe+mRd5EUUaowNRTaOKRj2T4xTx12qabgPY+QlOxn3l85yA
	 Xgb+VJu3ZPScObE3dVLrjeuc2d8SMn4NrTH/PQzWWziPBzk4c5OZ16Hi7CyPs8koDj5vH
	 3Duo5TiasWOEfv91AJwZ1crNA0aCzpA+EKlmmgg7+eblsX8wYQJJz9F/wtoMn8uQfiDk8
	 e76mi5Opb32MtD70Du3a5/q/jI/9kIASYiivALvo52hUHw8FHe4mL958B3Siv9Q2shw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793108295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DwMd1KchjZwzPRTvPjggUQTB5i2EuHCeAYUv5XXUio8=;
	b=RvDyKJ5zu3NpXdIQBS4pJjlFOqu9NzkPOYOVMsPcymJPQCN/1AsObJt8skQbBm+2UVq5
	 u95S94DcSloA8/jlJNqbuZcKl7GSN0GrkXeir8f8YjEhZenZVGKUN35kSH1BZqYSg5etX
	 iqooHqfnan340Zz6TVVbpA38LcsPIceUR3bP/YCoTNgZQc1nylOtZXjGGjwYFFld2kSyA
	 h2dnUuBI/AMtZwhrlZjCa1jIBKFsku6iH/iUSJ/4G2AiyoRWg0KIxico+HoHtLZQ6VL0K
	 hC6YP6fUX9YkphzW2F3JQ42k8Wn3Uw1QBo7kKNTCF02OM6JbprbsNaglt7xEvoK6dCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=HOzpV+E0;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9F0606A31B
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 13:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F9F0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=HOzpV+E0
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c43373ae89aso632695866b.3
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 06:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793108292; x=1793713092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DwMd1KchjZwzPRTvPjggUQTB5i2EuHCeAYUv5XXUio8=;
        b=HOzpV+E0YifEMJUFpo0mhCWAcg58n+ExvoMQREREEgzF4MnpcqEWwp8hHHC1tSxLfN
         z3X8Ruqy1Co8/BXgOHUAisorIRYaNYOP0BIFmJ9FkxKXER/FT29XCq/joiXcw1RrrZnD
         WPIfgfExZU1GuArzgbJx1i6zm4Wklz80ifrn5BCu9c0/0BvapHXhOUM6INm7cVcMfxyY
         gGBwyiQLFZBkXK6EM/miMfhP+hz9jUVjz4UUJsk87acHKsWT8HyWojfL3Sd0WEWzl7tG
         hGF/p8MDxJHcPmLDSVizAgqQGx5/u6SHLZ1cR91s832oZbGbyJaZXRE+Ajp9Dtuyv20b
         eIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108292; x=1793713092;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DwMd1KchjZwzPRTvPjggUQTB5i2EuHCeAYUv5XXUio8=;
        b=P7iJTyOPbLIUfCPVsUY34nhgJWnXyZg9s8iMAYOJ8FvuJIL9WtchHQJ6i8SSOKLBPX
         S5TVXBLXRD4q0pMYIC9sM0Vq/Mb091lmjjgtRcKKca4+lrxezUYsNTNWYE57Y/PMSqmv
         L4AmpS+b92995fVpzDavPEkR7fJd4JJqkJCRiFQWtMkglDz/A7+t0RK33vMD95URHbA4
         s/1Ye4hf0ITyIP2OeVI01Z+3h4qn2f/hA2mqJ6kzVU8M+2TAOnFu2Y5WNqJJlTaKXR1x
         gjwj20rMidCik2+XcDjgNnba+f+YHR/yZ2nOFi8A5zXrYt3bQt9HE5TdYf7sLvjtwBYa
         eynA==
X-Forwarded-Encrypted: i=1; AKwUvBxhWpgEbQN58+ZW/G6R00n60v3qHc1WMdP74raOrBpn7oGEA44NmupFQxxxRMcWqbJhxnPhr9PXETg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyX/AnmsY9c+Uvg+nBMO5eTEsObdGPn5iKR0zPLEX2s/y81iAB
	tS9tEpxuLLNjEzDaSYg8IhGe1Uk7al31GoYZPrTCZHEoWu+apc1Ag2ZfYhnslWfOmLU=
X-Gm-Gg: AYBFou0nkYK++XS7coftrGASAFF0nZGTCYsT4udh3/RrL+ykYirzCY3pCwaL/0H20oG
	f+pryDbhCmNHml6z6gjWzjifTG8VJohbEsBBXyoKHWcKivhm9Ly0CcV+Z7FElnCZLbZ6S2a3LzI
	y0nCJWZiQUDiQZL8K3cl0HReDdtDK0HgNgWiF6laINfo75pSOK945acorufcJckm4ZJxK7/ZTS8
	CSEnqF8DKbTsDUUiw9NZ0ChShUFHogAeudumEiPBUWK+URZcNj4uQlTc1E638UNTNYi24KuLgd8
	TR2CMRV8okbFaaHHaRikzJozT0m9Fy04Lw+whauR0GuPGh4ta2xjvOqhue/1IR51Xpu5QPwNhHz
	OOS8d6o13hit5ndNZDSKo5C8iLnj+WEpMbDQw+NGSwLb2v19HG1zTbqanY+e3v2eCk6EjHGye2b
	Wzh+U8GNVLMxgge0WJmA5wtnqYBpo3W0b3pABQIu3LRqXy5V2OjX4zpjNwl0Av+1t5afWnonDCS
	9nrv8kAKeAIcjYnYUd7sFlFrEaH4lMdwxhFa1KWt9l+wkaZ/h2Hz+ACSUd21iU0jUvqhx52il4e
	1xlM9a/J8DRe4XzftUdnNBX3k3dredSu9KHkDg==
X-Received: by 2002:a17:906:c14f:b0:c2e:8eb7:53e8 with SMTP id a640c23a62f3a-c46bde6b23cmr1029897066b.30.1793108292179;
        Tue, 27 Oct 2026 06:38:12 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd524271sm468626366b.35.2026.10.27.06.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:38:11 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:38:07 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 12/20] ctlv: Add device and operation dispatch
Message-ID: <auCo3jRQ7p6JjIPF@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-13-jiri@resnulli.us>
 <179302367452.58760.16195458599265885835.b4-review@b4>
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
In-Reply-To: <179302367452.58760.16195458599265885835.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:
>> [ ... 125 lines skipped ... ]
>> +struct ctlv_priv_container {
>> +	struct ctlv_priv_container *parent;
>> +	struct ctlv_priv_container *child;
>> +	u8 priv[] __aligned(CTLV_PRIV_ALIGN);
>> +};
>
>This scheme with priv is very clever, but..
>
>The usage in the tdx driver ends up having both the 
>ctlv_priv_parent() and ctlv_priv_child() calls, but there isn't any
>type safety and it just seems worse off than using the normal
>container_of approach.
>
>I think it is a nice thing to have for someday if we get to a place
>that needs more than two things, but for attestation subsystem I think
>it would be clearer to have the normal container_of relationship and
>some reliable way to get the 'struct attestation'

Yeah, will do.


>
>At the very least the parent/priv functions should take in the family
>ID they are trying to seek too, for an assertin, and many cases are
>probably better off with just a simple:
>   ctlv_priv_get(ctx, family);
>That is slower but always gives the right thing..
>
>-- 
>Jason
