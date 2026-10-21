Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792589026;
	b=FyiTP2ym8KW5MKBNgdiwx4vCLkjQU/o4tIf9sm1VFAvdKHRM44VQJTZaK4oRZscUvEQ5
	 qQd923fkUbeu1dhi1lXiUN5HVHb/yim0UEOBnAHGL/C3guDZMouwB5VPyIueXq8dEeOcj
	 UMv0kd9REagdB4Vqpz0DnHskqpgiScZ3OZJP1Low6mgyznBHrscg3e7mEuZsDnRFblBNE
	 jmRVBjISwn1q1w63wmfgJvfpGoZ/VAAvm1sVJQlQSX2e4NOqjPgYGtu03tOET8ayfIywd
	 9/+X3/DXeOWLL1Wu3+OSPKVzdUOqO5Hz/DuuUB8GslsivhWv/t/aGoz6moNFljeLp/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792589026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ENEgiLYyZC1rCnAzeRub371bt2VgRo0VClTgBaXb9SQ=;
	b=INjXk41DhFyjDo5c1PvFGeS4nsJrjm6r1xg8m/oUq3FbiHOepngsnowqS87+qR/HwpEt
	 Rv+7qYVgStYSVvBlTtVR9blIfbrWZBdBT1g/+LWn86b/d24F4jcgODPBlvfnuSkKsQHcC
	 3NR3Bi2dcj68AGzuyQRxnEAlXkwCyLK1J4upZdCK7BqnQ38vjSagOEGCaJgpXXc0VkBjP
	 +ARTghvYM9S3nxFKpTQf2fYySdbgeqZySATK7Hla3YT63tf/VEf6vNNFytNAiQOUS9LQZ
	 dGvRK+nMKEYXKMVKZOw8op48nNlnLOoXMxrlDuw9kgnAMQkmR5Z0RQyPMb9PN5Jc0Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=yADG1ECr;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EB2606A31F
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 13:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5EB2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=yADG1ECr
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so609045e87.2
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 06:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792589023; x=1793193823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ENEgiLYyZC1rCnAzeRub371bt2VgRo0VClTgBaXb9SQ=;
        b=yADG1ECr+QObb1QB83+iidmbJj/fobUApZuVsn1YngJx0ZfuONZA+pu4Ic4qUtnpBh
         GkC63lm5wjgFfb5gMxmSAQ1T2MEC4rYKyNJBBZCRDvoNFfdc/1dnbPoawHNFeIMG3cQ1
         dwQhoE+vIJAk+03yuCz00MdNPuLCfWEByg6Xqf6mtFZQHE4dGhAcSwxre3Khenao61eM
         S/YfPRVj5VyHZarKAEdvN1f5q0N5RbEvEKVfa6CCJfAqWlGEaFei/xSUvauLvApvz3jM
         2mJS5acP+BCEntRYDraaf909OwUFD6CronNRivnX9dfLAoUcbHGmy9cQS/fpdfcJEuVV
         IBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792589023; x=1793193823;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ENEgiLYyZC1rCnAzeRub371bt2VgRo0VClTgBaXb9SQ=;
        b=2jWKa0I6QOb+dJFesoFsw40o/RT/kpJM6YuyUueY66ewqw5NmrdoL/FRpB+rxQRliR
         8Xzafc/YxVmZ5KP4UcGaEwIbFrwCTeufDdTHFbvzvZ+O710j1mwRovepZYb9622d/OIo
         z1cRtN3YN9Q6QrDlecBw4rufutzqk5ug5XO1VQNuMjx6ibf/iXnFQ/bf141s10U2f13r
         qnDrosm7GBZyfkz2ZV15lTcHAeCp/pB/4XnV4kLjbCxnLskD6TCglwyWSCay8bNBBYC9
         2QqoNCCrVamd0xny8Jl8cKsKiwqpBj+bhFu1SoMDV8v3WbzZQs0DwOJcym+HLtRVoGaW
         x2tA==
X-Forwarded-Encrypted: i=1; AKwUvByoV3a/zI/n0r7AAk7/8Zl/WUO2Szv+9QcyfBM1MAiU4h/4QCq28SlRttcNbXWWqrqxP1YWS4wI6GQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUMiLoD6WQOkPgdJiWYC8cCxCPyxAynJMYnfxWvMGvdIf8Jt0Q
	NjnlravE27EU7hMuc59hHWd1hObbivSl7mEmtWEbR7zOIT4wm8H+cel5FbNYzQB7eh0=
X-Gm-Gg: AYBFou1YA/JsHqLIcmtrIs0CZTw5LMUfJsM2CcwholOqSXXkO+NvStXnUe4kbkarFfX
	dKX/GjGzg0dJmNNz8b+Ya/NFaXdP/dfEoQkK0GRHEsGIJzywgu6Ldc+zi+PsXEUvJasLbK+RXOy
	UMqElLHndGwDDOPQLPyXjhCTmTS628Y8VckIy2dej9hDqrdxKY/7/Dpujc6sZus5QDVhJ8cN2ez
	JNz1oVbaXpqq3FeBMKosxoIChmdK1hKCEqdpmowiDCMbGu5jp8FEBI9/ny2JFP88CWrrHng8CFk
	XqXU4dHah7LfEhQ830WRSHsQ61dPT4zFTW+uM+MXCzCHyDRUhmozYf/OIPMqTI2FW7SOf8AHJC6
	26PnUDuAb40vnl75/YpfQFM47RmCCh504/tTv7yOMXxT6nfZvbZaD0Tn+AUj+fNPCv1MYtvUZKO
	GZKPIuWq1zt5LBr1jNzW1wl01NZO4QCOwX5JKvHDL/QGVFDkcgN9x9hKj4vEnomt5sC4kboRjZk
	WFv3IxHCJTQcDhP37J2dfd1jfBWwrUe3DFrbDdc7HvREEsqFtrwoH+1dGb6BtSimXE=
X-Received: by 2002:a05:6512:3c8e:b0:5be:55b6:7a92 with SMTP id 2adb3069b0e04-5bfa1c2d635mr792386e87.30.1792589022381;
        Wed, 21 Oct 2026 06:23:42 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4a4f5f04sm2718501fa.32.2026.10.21.06.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:23:41 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:23:38 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 01/20] ctlv: Add the schema language and generator
Message-ID: <ati8DWgQb23dV4Dv@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-2-jiri@resnulli.us>
 <20261020233132.793b7e97@jic23-hlaptop>
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
In-Reply-To: <20261020233132.793b7e97@jic23-hlaptop>

Wed, Oct 21, 2026 at 12:31:32AM +0200, jic23@kernel.org wrote:
>On Thu, 15 Oct 2026 16:50:34 +0200
>Jiri Pirko <jiri@resnulli.us> wrote:
>
>> From: Jiri Pirko <jiri@nvidia.com>
>> 
>> Define the YAML schema and append-only family registry. Add ctlvgen to
>> validate specifications and emit kernel and UAPI outputs.
>> 
>> Assisted-by: Cursor: GPT-5.6 Sol
>> Assisted-by: Cursor: Claude Opus 5.5
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>
>Obviously you asked for broad structural review and this isn't that. I'm terrible
>at reading code for just the big picture but feel free to ignore the small stuff
>in this reply.
>
>My python being even worse than my yaml I'll only say that
>part looked plausible to me!
>
>> diff --git a/Documentation/ctlv/ctlv-schema.yaml b/Documentation/ctlv/ctlv-schema.yaml
>> new file mode 100644
>> index 000000000000..38fd56e6627c
>> --- /dev/null
>> +++ b/Documentation/ctlv/ctlv-schema.yaml
>> @@ -0,0 +1,359 @@
>> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://kernel.org/schemas/ctlv/ctlv-schema.yaml#
>> +$schema: https://json-schema.org/draft-07/schema
>> +
>> +# The syntax gate for a CTLV family specification: permitted keys, their shapes
>> +# and the closed sets of keywords. Anything needing more than one declaration at
>> +# a time is checked by tools/ctlv/ctlvgen/lib/semantics.py.
>> +
>> +$defs:
>> +  name:
>> +    description: Kebab-case identifier. A dot is reserved for selectors.
>> +    type: string
>> +    pattern: ^[a-z0-9]+(-[a-z0-9]+)*$
>> +
>> +  family-name:
>> +    description: Name carried by family discovery.
>> +    allOf:
>> +      - $ref: '#/$defs/name'
>> +      - maxLength: 63
>> +
>> +  selector:
>> +    description: |
>
>Really trivial but nice to drop | where it doesn't make sense to
>force line break preservation like here. 

Okay

>
>> +      A named attr set, a whole attr group, or one exact attr as
>> +      "group.attr". There are no tuple selectors and no cross-family
>> +      qualification.
>> +    type: string
>> +    pattern: ^[a-z0-9]+(-[a-z0-9]+)*(\.[a-z0-9]+(-[a-z0-9]+)*)?$
>> +
>> +  selectors:
>> +    oneOf:
>> +      - $ref: '#/$defs/selector'
>> +      - type: array
>> +        minItems: 1
>> +        items:
>> +          $ref: '#/$defs/selector'
>
>My yaml is terrible (and all learnt form reviewing DT bindings which are
>undoubtedly perfect :) but random LLM agrees with me that you can simplify
>this as it's a local definition.  I think doing so makes life a little
>easier for reader by indicating it is thing defined a few lines up.
>
>            $ref: 'selector'
>
>I don't care that much though.

Okay

>
>> +
>> +  uint:
>> +    type: integer
>> +    minimum: 0
>> +    maximum: 4294967295
>> +
>> +  integer-bound:
>> +    type: integer
>> +    minimum: -9223372036854775808
>> +    maximum: 18446744073709551615
>> +
>> +  max-occurrences:
>> +    description: |
>> +      A finite positive count, or unlimited, which is reachable only from
>> +      query replies.
>> +    oneOf:
>> +      - type: integer
>> +        minimum: 1
>> +        maximum: 4294967295
>> +      - const: unlimited
>> +
>> +  unit:
>> +    description: CTLV-owned unit, matching enum ctlv_unit.
>> +    enum: [ seconds, hertz, bytes, celsius ]
>
>These are used in here?  I'm sure some are but guessing not
>all of them yet.

Nope. I just want these to be part of the initial schema as it is not
omitted by later family implementation by accident. Easy to pick up by
AI assistents I believe.


>
>
>> +  attr:
>> +    description: |
>> +      One attr declaration. Exactly one primary form out of type, enum,
>> +      flags, attrs and blob must be present. optional-attrs and recursive
>> +      may only accompany attrs.
>
>Maybe worth the yaml gynastics needed to enforce this rather than
>just putting it in the description?  An LLM fed me something when
>I sanity checked how bad it would be and it's only somewhat nasty...
>
>Bunch of:
> oneOf:
>      - required: [ type ]
>        not: { anyOf: [ { required: [ enum ] }, { required: [ flags ] }, { required: [ attrs ] }, 	{ required: [ blob ] } ] }
>
>lines, though I thought there was a more compact way to do it.

Okay, will try.


>
>
>> +    type: object
>> +    required: [ name ]
>> +    additionalProperties: false
>> +    properties:
>> +      name:
>> +        $ref: '#/$defs/name'
>> +      type:
>> +        description: |
>> +          Primitive payload. Integers are always 64-bit, and a bool is one
>> +          byte holding zero or one.
>> +        enum: [ uint, sint, bool, string, binary ]
>> +      enum:
>> +        description: Name of an enum definition; implies an unsigned payload.
>> +        $ref: '#/$defs/name'
>> +      flags:
>> +        description: Name of a flags definition; implies an unsigned payload.
>> +        $ref: '#/$defs/name'
>> +      attrs:
>> +        description: Nested payload, given as selectors.
>> +        $ref: '#/$defs/selectors'
>> +      optional-attrs:
>> +        description: Further nested payload whose placements are optional.
>> +        $ref: '#/$defs/selectors'
>> +      recursive:
>> +        description: |
>> +          The nested payload is one attr set that may contain this attr
>> +          again, describing a structure of any depth. Only a query reply can
>> +          hold one, since such a nest has no maximum length.
>> +        const: true
>> +      blob:
>> +        $ref: '#/$defs/blob'
>> +      min:
>> +        description: Inclusive minimum of an integer payload.
>> +        $ref: '#/$defs/integer-bound'
>> +      max:
>> +        description: Inclusive maximum of an integer payload.
>> +        $ref: '#/$defs/integer-bound'
>> +      length:
>> +        description: Exact payload length of a binary attr.
>> +        $ref: '#/$defs/uint'
>> +      min-length:
>> +        description: |
>> +          Minimum payload length, excluding the terminator of a string.
>> +        $ref: '#/$defs/uint'
>> +      max-length:
>> +        description: |
>> +          Maximum payload length, excluding the terminator of a string.
>> +        $ref: '#/$defs/uint'
>> +      unit:
>> +        $ref: '#/$defs/unit'
>> +      scale:
>> +        description: Decimal exponent applied to the payload.
>> +        type: integer
>> +        minimum: -128
>> +        maximum: 127
>> +      max-occurrences:
>> +        $ref: '#/$defs/max-occurrences'
>> +
