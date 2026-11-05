Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887384;
	b=Cmluqb+bru7P4GgyfBep62J0dILX5wcTNDqNWee/yvgWmgt7K6pVenCLvpGq2/QKxNNB
	 RefBZOlnhaUChCEx5pSAESryWf/yRkZAEiVusfYujfCzu4khHdjtdE6GLWwXxAcG5iE2X
	 ISjOhF4UfXSW4s7rZakpTqfa1ZkFbVEyIeZNvqkyYZQVe9d57q+u5aWSWJATV7LdGevTD
	 e2eVYQKq365QyK5wj62Llmi3lXTXos7+raT3JYJZuPAHzCiHraBnlPa8gTmTFxjqNF/d4
	 m55iuiYf0RImPUaD5/R+gcgqlSsmwwuprf8jt8bbEAgx9rAt76TbS06NUod4wrhK+VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7rw+Vw2Z3L2B8lNDfsIFSmx/pfSm9WeDfRFG4S2Q0cI=;
	b=C2VwZDp3cSRvQ8bSlwukW6gFlTCGgEz2y+BlqU0LyvLutmOOo9gONYqswsnc7x0lFNLS
	 KaFqPenJZiaPD+PSS0ZaqElVNE0pSXjyQze8VPjSikAxAjF3VQJvNl2fvBRvzMf0xHu+E
	 DbbcgR4JlqpH5teQ7sejQEXg07Gty4BHggMMGEbtUeRhRbEhJGGvwsnMl+uJxOE4ybBTt
	 zC3twwCgvnMKSJ9I76sjBiOx6vNzu8rljzHACYAmPJBUQoUPA8nMrOFj4/A2lvdT4NQMf
	 1Oi20KZsnQBn09t7x3i7h9COL9IFIK3AsfqflvvXBXg6iUVBvrvvx0RpKwH3K8O9x0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99F1606D80B
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 14:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A99F1606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1295740f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 06:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793887377; x=1794492177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7rw+Vw2Z3L2B8lNDfsIFSmx/pfSm9WeDfRFG4S2Q0cI=;
        b=wcPW2VeSRvODbdYagFsU2XIg0aTXdnhx/kXOwWNbpngwDM/gCfcZrWORghX1FKTjDc
         Mv5N2+vmUnjqQm9dS9NB6DBVam/f0NDbeQqt4+86O0cpG537XPDtso4cmVRWMyArr8PI
         jXiPqpbCMNpRwt04pZ64rNnRkpc1jgKy9F7LZJn034x7mHjW9lWeHDZ8wuGAGcsp9tA6
         fdYaq4RLqyMu+odlklcLb3/vkf+rq5ENmZYu7oz4AZdq4mhjZAN+ODbuapfT9A5hM+9n
         IBsHWEC4PC7xOlWAsj92te775B+ABgmDcVqt7oltV+jbn2ZKpApmiWB2SPL7l15TkecI
         7lpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887377; x=1794492177;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7rw+Vw2Z3L2B8lNDfsIFSmx/pfSm9WeDfRFG4S2Q0cI=;
        b=GeNo+ulCHMAxC88xH85E6/3qJun14H0ibFTWmuwEqs+wjQCMfA7NZ8pPozz7yp6Prg
         E/PM0uVE5t/LkeV6GTy245IDCnEARt0eeEEb8XELmMqUmPnUq2vdbPvoUaz7XCTx6uQe
         Efyl5gFHtJOVyd+PbxOwH6BLDmRoeYX45z7kb0756Gce1S9ptlNXFzrWtpqalTCyGUG8
         fbYcn9Al9WM5A+9I/s4MDMNwFjD/o6aZDVE0SIGGRVs+V9uD7pu5SB7fz/tlQZE3taXx
         v/6zLw6q8XwMnq9oZKFV8gmJgMh/S5XB1+b1rtrkGEBmQU3XQeP6a86F5nUZEptTgtE0
         SezQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkGckWqLJLLy6YrFXjkqjSHoxHZJNEPn3ewlUYQr54JU0aS6MBaMgqMqDBe9Q36w+n/4k52AkmUDw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9trvtkKYAgkr5LwePBShXsQs1ug82Ursi1ULmvnVaATKlS8Iqw
	ui3bcgqje9+pVrpglWYWt+zBSHbkoZCXW97SNX582qjDcJ8f3qFb58CKNJfZtrHmrhk=
X-Gm-Gg: AYBFou1N9eDvFwvw9rhtk5FwkP5vARMc3P/HM7RytVnbnO58PmLOZgDlaI40BTYGwbi
	yqZjo+FS3s0aoTlMIx6bO8qagqcqKcgDgPRQ9UhI25gSx9V6O7PBdQxNPZa84aqyq/rLUeywUjS
	BRmzfzmW/6XLydROMAv76Mdp9Eq9urH3g+kDSrm87jtp2i3KpizgSmAUACDeeX3RgW4y9SQ323x
	M7+kEuwcNacSL1wL1JEmDKeuTp3m4NqHdNUkOEV7lcbYGt01iJ6F+c6Ker5G04QrnNsQhT1qP/Q
	T5zxGhd96QamRnkwnBXTral3NfMvUqfESPST8NEjMGgyXwfcIrHgaMzn5uonwXKkXzwRUCsuFv5
	yfvREfq60sOEQDCExiquRBXJRvFzt/RtMwxKJH70MAYnr5Qb5KvMc4EWtzeyLuRFDR0mnY5WI1n
	mn3XPfan0CgdEtwEOQUyrEn3d3RoXZvs72CBP+OQlxi+Pw3PIqo+0w/+bg04RFbHMpO8BcGxhQX
	Fd/mqxpz0VxRcz7Xf3Ws+6JSlsJRcR8BRTiYK0ND4p+V0USXVMAgDyI06NWe7aMYdYXJuvr5cQp
	zlAyut5IksLUfYSPih2pAUwB3pbkjm0LnKfkqe4=
X-Received: by 2002:a05:6000:310f:b0:48d:f95e:6e8 with SMTP id ffacd0b85a97d-48e6e2c3586mr39104058f8f.1.1793887376849;
        Thu, 05 Nov 2026 06:02:56 -0800 (PST)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm10937240f8f.19.2026.11.05.06.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:02:56 -0800 (PST)
Date: Thu, 5 Nov 2026 15:02:52 +0100
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
Subject: Re: [PATCH RFC 14/20] attestation: Add the base family specification
 and generated files
Message-ID: <auyKhc02JmfXNiMe@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-15-jiri@resnulli.us>
 <179302367452.58760.3782556786585774917.b4-review@b4>
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
In-Reply-To: <179302367452.58760.3782556786585774917.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:

[..]

>
>evidence-get:
>  request:
>    challenge: binary
>
>Binary, blob, raw? Lots of words for the same idea here..

binary is inline field, blob is va/memfd/dmabuf using field. I want to
keep these to "types" of TLV separate.


>
>    objects[]:
>      blob-class: evidence-blob-class
>      format: string
>      representation: evidence-representation
>      data: output-blob
>  reply:
>    object-lengths[]: uint
>    mr-generation?: uint
>
>=======
>
>mr-get:
>  request:
>    id: uint
>  reply:
>    name: string
>    supported-hash-algorithms[]: uint
>
>No definition what these numbers are. They should be TCG2 defined hash
>algorithm constants I guess. Why not have an enum here for them?

it's enum hash_algo - I will make it more explicit including existing
c enums into yaml.


>
>    caps: mr-caps
>    register-index?: uint
>
>So we get a string and a small integer for every MR? Like PCR10 and 10
>for TPM?

Yes. The name is the platform's and the index is the hardware's number,
where it has one. TDX has mrtd without an index and rtmr0-rtmr3 with
0-3. A TPM would have pcr10 and 10.


[..]


>
>=======
>
>mr-extend:
>  request:
>    id: uint
>    values[]:
>      hash-algo: uint
>      data: binary
>  reply:
>    generation: uint
>
>Is this extend 'you give me an exactly sized data that is a hash' or
>'you give me data and I hash it' ?
>
>TPM/etc do both, there are good reasons to have both, and the latter
>is more flexible in supporting crypto agility..

The former. I have a patch in a queue that adds the latter: mr-extend
takes either a digest per bank or the data, as an input blob, which the
kernel hashes with the algorithm of each bank, and the reply returns
the digests the banks were extended by.

