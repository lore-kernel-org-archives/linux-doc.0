Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780560;
	b=qaUrBaZYaX7B/yUqcewJoq585h1J+2hsiiHkkFAvoJUhz6W3YhpccE5Nb3twbpTSfA5q
	 6KAwwbLc4XonAfI4eC8DCh31DUkkxQ+Ml3w2SqZimwb0CADeaPKQg16kW7Okyr4eTAeUx
	 T4Cusv9g6Kgm+l57aCu2m08DxXgMdkPjwXmZXNbpVf9u/RSM30ASdj0f269r6qoiH3UAj
	 helEDtXhevzOVxMWJ65aVwqNPC2kPAG2PwFk3TE9bA5j+ia6nr3ocklxFdXwoRYRvCRHW
	 MsQBgf2C3bvG4xkP31gh00mun0XZpjBIhreRbsJH5FXAHcYN9XRF6XYYXl1PyUaVNCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Zx8jHzDvw8va/CX+J+ppLsFj9mBNb+GyOOHFkDmbSlI=;
	b=grMg/WXippN1ePjcvSe8qkYFoFoDGtx9cl9WW6VClakQpoDgRBNxB9bkpaT1d2qOV6/f
	 v4MowJNTvuchpJfOQGEYDhk506/D7uyRJoEqjveZb+QuMlo/r7wVCHXEKDZaTH0auefn5
	 b6QuxvQE8sbhJuNEaTBirs3LuabGjWMSXAK62r05ijKarSFRgAMDp8v95V8mcV97bQd13
	 5D46l3x+xxu7oZ2gQshv9BEm1xdvhd53TNUACnzmLkStJ6ccgHxA6tOVvcJb2Kv7iV028
	 v4efPPfww6Wwq90laFQi/unwlEtVEDExdMH5Idiea1kD5agZybcLFGzF7PcVLDluE5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=stGCcKR2;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A22D606A31B
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 08:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A22D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=stGCcKR2
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso2674625e9.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 00:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793780552; x=1794385352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zx8jHzDvw8va/CX+J+ppLsFj9mBNb+GyOOHFkDmbSlI=;
        b=stGCcKR2XDWs2JXEfhtZr7iLAW8lUux9SMxROW6OOCRA1mWbx8OrRo4JMyxUU+27jW
         8c13+kyddkij1BwcIWUx304IGIDbLM01Ibc2QYWx3RFhyX7gUV0iwPgp0xCFVDf1vyxS
         PETlqgBra90W+V/xUeB/QKZV9smQJ+N83Bar1G3ihYu5ExGkVz/eUj3qiP1q/iXdAaWO
         iP95iXIz3iUqNRhfpusCP2d0spZdrly4qJazkBVuuot+aWl5mVhhuL+oA45dVpKNrgNX
         ae4LyDG/ScCBOiSm9zbGcSHLDVtAEZ/lplpYpBpok5SQLo4JKTsqx5vxTu/N2nZBy+Hq
         IERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793780552; x=1794385352;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zx8jHzDvw8va/CX+J+ppLsFj9mBNb+GyOOHFkDmbSlI=;
        b=lNAy2i/avSeniE/LcIPiBd/6QE7uRMMNXZOZGIM5QK0YlcEl22iNZKfH9X2QzkAHt6
         DR+nYiv9aPCz5+zqEbeo5xfJXknLV+w+lryz77M6vPt+U54V5D2afj22pbc70GH0PVjR
         d41RhXy1DFhLHyi/Kwb8FRv4lsFNaj0L+vDWv/zUyezpxBvjvEEzZPmFu9suX24elw1F
         IYjg4P2iLPlEuV5RNW6OPnRfsEc4yNqIoJyz/UPJ+K0lGsU1r+44u1/fIu6LaSLq472g
         YsO+i6tDK4va9YY2eE8T0ZZWKUU5/7oykl2c+6/BbmfO+r/e/EazHuGk06n+RKtB/RYR
         J+5A==
X-Forwarded-Encrypted: i=1; AKwUvBwHSjJJVLgpYk6JdOcvNrUBBU4ayukqu5JSe6l5sFZVrgBWIRViMLWXORJ6ZINs8O8hlI/FUMNOdE0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oCXUrcG87DvhS6dkd2UISX+aiH+kg322aTBWy5suMlBwr4Qgo
	BSqEc9D90uP3Iu0fdsY60TDGgs6Q1/RL1Vz9ENBFfuy53C9cz1DDcAwn18gFVfnG19o=
X-Gm-Gg: AYBFou1tZIXyufOUDXDYfvMRK4Z7URdYuRRMpk1gaQ78JtUdneI2QSu6iTfDN0hHcjk
	13zrVp+DJqgKYieXAGQSTIjTyUidCqCs1zGvAgV1r/dAI6eMhfmWlohX8IjPkFo/0ugPkAOWAOT
	M8hqDS4OBCGEzHrBklzwHYwVGaRWDBL1kNKNHoHDBPu40cY/AKvsgcu6suq4vBne/NJ3Tp0VmJK
	Yp8dQDZCsNY5cvVvaWLVjk9GJDkMxTrLn+65sNB3gTufdg20WpIse/jw3+u7n97TmO5wZmUXIuV
	MXWKh6ApCDosmwvu4ndiltsue3Y8UIh3Qw0XqCVy8zfNKEzP+74vA5wryYOqiA6oLqLaJjLzzF/
	kYAd2gaTwLczOJvOGlguaO9fbJUVN7PstbMzZjUk6jphTHu+IWEv8OIHtgu+nhLsIA0o9A070Q8
	GB3IqbjDSQWMznHCmlqJLqcG2jLWpHy9qj6LxlU0sfaWOsMyKGbrZ1EM0hzUmEBET3S3Vp2dmPT
	K16uG5+pndf0+84TThdl9Zd8Uhx2vuci1cXAqS3g6UJ06oz2OlcH4M8xJRk6TVbF8sdxN9HA2r4
	yhlPRX+VuE7uAOMTSWxGE/wNEWFW+YAX9F7r
X-Received: by 2002:a05:600c:3554:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4ac18c7461emr379283885e9.35.1793780552290;
        Wed, 04 Nov 2026 00:22:32 -0800 (PST)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece99a5dsm2366556f8f.21.2026.11.04.00.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:22:31 -0800 (PST)
Date: Wed, 4 Nov 2026 09:22:26 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 15/20] attestation: Prepare provider and instance core
Message-ID: <aurpges1eUwSJUBE@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-16-jiri@resnulli.us>
 <auOVbGYJjIQTN53z@MjU3Nj>
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
In-Reply-To: <auOVbGYJjIQTN53z@MjU3Nj>

Thu, Oct 29, 2026 at 07:50:20PM +0100, sergii.dmytruk@3mdeb.com wrote:
>On Thu, Oct 15, 2026 at 04:50:48PM +0200, Jiri Pirko wrote:
>> From: Jiri Pirko <jiri@nvidia.com>

[..]

>> +/**
>> + * struct attestation_mr_props - Immutable MR properties.
>> + * @id: provider-unique MR ID
>> + * @name: MR name
>> + * @algorithms: ordered hash algorithms
>
>Why do these need to be sorted?  Is it just to make indexing easier?

They don't. Will lift this limitation.


>
>I see that the number of algorithms is also checked on extending.  Does
>it mean that a situation when not all PCR banks are extended at the same
>time is considered an invalid one?  That may be a problem at least for
>DRTM which may extend only one bank even if several are active.

Great catch, I missed this usecase. Will allow extension of subset
of banks.


>
>> + * @algorithms_count: number of algorithms
>> + * @has_register_index: whether @register_index is valid
>> + * @register_index: native register index
>> + * @readable: MR can be read
>> + * @extendable: MR can be extended
>
>At least with TPMs, whether a PCR can be extended depends on locality,
>so this isn't necessarily a static property.  Is this flag expected to
>always be accurate or it would be OK for a provider to declare an
>extendable MR but then deny doing it?

Okay to declare it and return some appropriate error, like -EPERM. Will
document it.


>
>> + */
>> +struct attestation_mr_props {
>> +	unsigned int id;
>> +	const char *name;
>> +	const enum hash_algo *algorithms;
>> +	size_t algorithms_count;
>> +	bool has_register_index;
>> +	unsigned int register_index;
>> +	bool readable;
>> +	bool extendable;
>> +};
>> +
>> +/**
>> + * struct attestation_evidence_supported_object - Evidence output description.
>> + * @format: evidence format name
>> + * @max_length: maximum output bytes
>> + * @binds_mrs: evidence validity depends on MR state
>> + */
>> +struct attestation_evidence_supported_object {
>> +	const char *format;
>> +	size_t max_length;
>> +	bool binds_mrs;
>> +};
>> +
>> +/**
>> + * struct attestation_evidence_caps - Immutable evidence capabilities.
>> + * @min_challenge_length: minimum challenge bytes
>> + * @max_challenge_length: maximum challenge bytes
>> + * @max_total_output_length: maximum bytes across all objects
>> + * @objects: supported evidence objects
>> + * @objects_count: number of objects
>> + */
>> +struct attestation_evidence_caps {
>> +	size_t min_challenge_length;
>> +	size_t max_challenge_length;
>> +	size_t max_total_output_length;
>> +	const struct attestation_evidence_supported_object *objects;
>> +	size_t objects_count;
>> +};
>> +
>> +/**
>> + * struct attestation_evidence_object_request - One resolved output object.
>> + * @supported_object: matching capability entry
>> + * @output: resolved output blob
>> + */
>> +struct attestation_evidence_object_request {
>> +	const struct attestation_evidence_supported_object *supported_object;
>> +	struct ctlv_blob *output;
>> +};
>> +
>> +/**
>> + * struct attestation_evidence_request - Validated evidence request.
>> + * @challenge: challenge bytes
>> + * @challenge_length: challenge length
>> + * @objects: requested output objects
>> + * @objects_count: number of objects
>> + */
>> +struct attestation_evidence_request {
>> +	const u8 *challenge;
>> +	size_t challenge_length;
>> +	const struct attestation_evidence_object_request *objects;
>> +	size_t objects_count;
>> +};
>> +
>> +/**
>> + * struct attestation_evidence_result - Provider evidence result.
>> + * @object_lengths: produced length for every requested object
>> + */
>> +struct attestation_evidence_result {
>> +	size_t *object_lengths;
>
>No number of objects?  That would make this structure more
>self-contained.  Copying `objects` from the request would allow passing
>it around to handle results, but there may not be too much value in
>doing it this way.

Not really needed. This struct is only related got evidence_get cb and
it is always used alongside with struct attestation_evidence_request
which has the count. It would be redundant to have it here too.


>
>> +};
>> +
>> +/**
>> + * struct attestation_provider - Immutable provider operations and properties.
>> + * @evidence_get: produce requested evidence
>> + * @mr_read: read one MR
>> + * @mr_extend: extend one MR
>> + * @evidence_caps: evidence capabilities, or NULL
>> + * @mrs: fixed MR properties
>> + * @mrs_count: number of fixed MRs
>> + */
>> +struct attestation_provider {
>> +	int (*evidence_get)(struct attestation *att,
>> +			    const struct attestation_evidence_request *request,
>> +			    struct attestation_evidence_result *result);
>> +	int (*mr_read)(struct attestation *att, unsigned int mr_id,
>> +		       struct attestation_digest_set *values);
>> +	int (*mr_extend)(struct attestation *att, unsigned int mr_id,
>> +			 const struct attestation_digest_set *values);
>> +	const struct attestation_evidence_caps *evidence_caps;
>> +	const struct attestation_mr_props *mrs;
>> +	size_t mrs_count;
>> +};
>> +
>> +#endif /* _LINUX_ATTESTATION_H */
>> -- 
>> 2.56.0
