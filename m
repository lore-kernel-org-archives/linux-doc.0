Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698199;
	b=WwT3NOecR4ySVxSnCO02JDzTDzLNJrPEYe5iVZznYQuS3ufz9bs0B0jHdZVWf0JKMjOL
	 K6/EKDKL+OY3oIlqOb0xN/l0lL22vC0SCIU8cOwP2UbtcZnuayg8igGhHwpZJhk057PPb
	 huQUNQceSWsP1kOA38Bup0384K+6pA7ZyUt1l8HF4oBew7g71htMewrr1lBP/3mc1ZUpt
	 nBmNc2nu02gZ5RDe94E+UWaYn4HqyyhoheDWUbGuT5Gime390Ct6oCfgZ/1k5tJp3DABj
	 3fiDfotKMGDvnoUW4YcqBxdcBCanleLvvbStsm9wQ2kqZnLwGNu/G9ouqqghWKhXCuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CkFM9E5nfWdnLbDGQzZA+rThnrcRob04z1+EqW99MTE=;
	b=2lPHkvXlIAwUJvyy5y3Bu/Ebnb4KjxU2OjvXtC4W1yPb6CttK01XpHAt4LBlrPnSuy8X
	 6Hg1CCNaV3fwXZJ5rJK7fM1LzACVdkzgfy6Dxf4YdFwTEF+71Swz9OfdTDcFt/sk7X5uq
	 LfXY7T9BhY56w1tY3c6NDBHw4RipgavyXLCtmB9iQRAQfqbndvBr2xM5UcBiIEFgmGQF7
	 WlFfULtcT7MaT8XfndYJ5kpVk5n1NIfC2DndeC0zIy6DPEQ2flheAdVGOlGNcg6u5I8Po
	 ZwsTxypwag2Sg9KXxup5jzrSQb/OWDzpwbZKLDhepdF8Xgi04VnWJycgcp/z2QhU5JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D33D606A327
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 09:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D33D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so4040788f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 01:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793698191; x=1794302991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CkFM9E5nfWdnLbDGQzZA+rThnrcRob04z1+EqW99MTE=;
        b=nD17MX4VzW88+nrnz9SgdcaYPQcOIkfh/S0yrXnMfUgiGGl0fkKSlltWyjDbQPyYMJ
         eyJkJVCpvVbC4gP0OT8sEk1TVUj+BlCLU49pQgURFggfuzWLnbpspFwvtmXmiSM7p97k
         Avk1+QdCZOKyymL8Xg/4fiDOAl4JzMdXU+h4yuR2KLxssHGZ1M6W1XKjWStlpIxt+gQG
         EFvhWnv2HNS5oUqS9tj0RFT7ennBps/r5yNAsEvJLGB++paTLGgKMOvxgHjaZHrL2mF/
         ShzDEeNLBnaPa9J3paZGOvdsYyNmHo4uMXZnKOLeuiZJYrrkShVMAtnqhblAA5vTMEZM
         xpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698191; x=1794302991;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CkFM9E5nfWdnLbDGQzZA+rThnrcRob04z1+EqW99MTE=;
        b=BpSpyk8iiEX5o7kcvpY9vUU37Xi5ggrdd6AiaF9q50v6tt9xQCiUwHkB1EU6tcCbzW
         BWJzyiSC8/NJv4Yxtz/p8oghH2Sw0o38nFDWjvF2LCwoao9QxTCYVecdv0KwXkzjh8UE
         MYCWcC8Jm0w2NckINaMGDdFNlgY7MRLkYvTgoxNxxUl+V9Q73LGXErz5McfI87eHk/ej
         MYbP8nPX/G6v/Lsv/xPzYhg+ssXFBAnkzS99ZvA2+hcWMAoqDYFvdAa3woZFfs/cev20
         M1iK/Cd0NUp5A4ckKEfkvyKyyM/MnYNNVthrhU1VqNRpKd9jjxoiIL8Cvsn+2eSaSSC4
         UvBA==
X-Forwarded-Encrypted: i=1; AKwUvBx35eiFvUvVvEf+haeTVFfuUdgzGFhTCSZouiAVpJPQxDRH67RptiKlEjgee0MWUGlcU6e1bWx6RF8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LkjZ+cvWh3YShxdP4LORki/ccv4WnDlBgcpdceesnrjskkMGP
	VZPhZgUxNbWIkpXg+4EwifNtTRD32zWLUil1X4DJzH8JgyTsn3tY1dLWF78mRHo+LCU=
X-Gm-Gg: AYBFou0crgXnyfM33yLkRE7zUSbZCUveh4nezA0nbHStBzEwfVLO4CpsFFEV8SstoTc
	IauMqqBMqVUmGJR2euF6U6ZLNPyYfvDMNiI1CCnwWgpX9aaCjqU28RWVllf8dGDZqNjVEuPo0ck
	R5B0Vl0LFF6fDFz0N23DhTakd/km4uSig3QGJcsaivzdjdG4+YRii6uMbJUsDL7/8RMPLKsULDL
	Xapnxr4I6wEWp2iYZ5f26xOhHVSCKNBWY6t3+aLi8ga3isLxgHgs010Fus7usIYztuNf+1EkiHX
	W6Z5ZF85xbktA/2dJN6xfck+DI7K0z48l+4dljeTjefsfDcB+iAOTFuEGxpLSnettOudln+U6Ey
	M1XvDbIYmcveOtO/92yISezYR3H7yH0p6N07Y32X1rZmTLouH7rJd6vf3qBcDlSvrZ8JH4Q4n83
	GMiL9gORBoLPFc2KQhXDxuEG1EUoJuqgi/mXTpBq5ZBaTvKGPY+si39Y0YdKQ3rU+6dwYTmzSlx
	ACuXkKMuryQ0oLmqFQn3YYj3mLR8qdUXrLwVpuZjsQS0xj8GbpF+oiIgZcXM8NC58Zbfhe6/Do3
	iC9/xE/Oe3SQ/yDPBfajIiO4q/hFAwb5BWhr
X-Received: by 2002:a05:6000:26c1:b0:48e:870:7791 with SMTP id ffacd0b85a97d-48e6e30b824mr25816174f8f.26.1793698190820;
        Tue, 03 Nov 2026 01:29:50 -0800 (PST)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80eb1sm25441683f8f.34.2026.11.03.01.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:29:50 -0800 (PST)
Date: Tue, 3 Nov 2026 10:29:45 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 11/20] ctlv: Prepare runtime introspection
Message-ID: <aumogVKtYnY0QJ2r@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-12-jiri@resnulli.us>
 <179302367452.58760.11808905856343064399.b4-review@b4>
 <auRmMPfaFINUIchi@FV6GYCPJ69>
 <20261103010537.GI3889730@ziepe.ca>
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
In-Reply-To: <20261103010537.GI3889730@ziepe.ca>

Tue, Nov 03, 2026 at 02:05:37AM +0100, jgg@ziepe.ca wrote:
>On Fri, Oct 30, 2026 at 10:53:11AM +0100, Jiri Pirko wrote:
>> >So.. how about could we drop the sets, use a direct description of the
>> >layout and do something else for the ID numbering? Maybe the numbering
>> >can be solved directly by only listing the names in:
>> >
>> >numbering:
>> >  - device-get.reply
>> >  - device-get.reply.caps
>> >  - device-get.caps.evidence
>> >  -[..]
>> >
>> >?
>> 
>> I'm still committed to implicit numbering. For "inline records" I
>> resolved it by having it encoded as a tree with 4 levels:
>> 
>>  63         48 47 46 45        32 31  28 27  24 23  20 19  16 15               0
>> +-------------+-----+------------+------+------+------+------+------------------+
>> |   family    |kind |   index    |  L1  |  L2  |  L3  |  L4  |      field       |
>> +-------------+-----+------------+------+------+------+------+------------------+
>>               |<------------------ record ------------------>|
>
>Fascinating idea. Sort of like an oid
>
>I guarentee we will run out of bits someday :) I saw recently we ran
>out of bits in RDMA :\ 3 bits seems like quite a small number..

Well, this is just for inlines. I think if user comes to the point this
will not be enough, he can use named record, as he probably should with
more than 8 inline records anyway :) Also, we can introduce "mapping"
mechanism to allow inline conversion to named record without breaking
userspace. I just didn't bother to implement now as it is a theoretical
problem now as I see it.


>
>Maybe increasing op to 128 bits?
>
>Maybe family/kind/index/field spread over the first 64 and then the
>Lx's over the second?
>
>At the very least there should be an escape hatch so that if this
>becomes too small there is a way to opt into some new layout and fix
>it without breaking everything.
>
>Jason
