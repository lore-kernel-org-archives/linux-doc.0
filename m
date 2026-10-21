Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590895;
	b=LY3z8eMkgHvCJ/YJoaKlbDo3HI6ylaWhgLL11cxekn7Pg5G39ESo7LQblaEVNGkis0P6
	 e/WrqBZhBEmzeL/yn6UQScAnwyvSK97CFxZN7etKlfN6vI/N6lqpVvK2feCjn+P377cVg
	 5ga/NcJBIMfn5x1Gx5kKYYQ5cSvSKFnkcJkqNqnUXkUBKRIkJLtzsBpu5nxj7LlhjAUZq
	 JBYa2oiAL9UwV2HJc5sdwlU25ofO3R6fTc91WO7y/f8hbhAXq0PZ4+CoD/9Kj/nXqP7/j
	 9STOrpGl9qB5OD+dRg/Akqt7tEsJ/QYowvmS5u7/JKGLAAHQFb99/0PMuZBczA6qY4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=c8NANzTMJV28RCMd27ShXdH01N2IwKbSedeFEkSZyhI=;
	b=U+A67DUiITVDOarUyWDGMBiXP+1T7yzXtxf0wK8684+FbDfL0pZ2Tc7JzoFgk6WiBrbe
	 kGL98p+WgMJ5ARdpIZI8w1COUm/OHkBHByHn19zqDJMLsw18TYoiVOlyUR5GD43nR6PRf
	 yHHHyDUpRdEOb4ztIJrTEgIeotaE+IGZ6e9cDbL+xmE/ZnUsu3HEJ9mMfuTk0niKeAwwQ
	 qo8ycMYJSh6sqxlnwuKaA+wEfucH63QGzolWZpV4QWVMB3lGZQ5m7zYD/7/zkzj03ucv3
	 ovHrGGmQ8G+f+PkhnQ19pd4N1eWfthJwJVDvnnPwGHlZS+gaV919Iwf2wGKTvM8hlSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=UnhUfLxG;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D836606A31A
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 13:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D836606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=UnhUfLxG
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso2875896a12.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 06:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792590892; x=1793195692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c8NANzTMJV28RCMd27ShXdH01N2IwKbSedeFEkSZyhI=;
        b=UnhUfLxGM8b96A7Gbb+spCiE8gEcBozwsrAV81TErgNHw4FO+zaccrsTaoxCPx2kqb
         2r5gaG8S5zHRHXdTiQpqNb3zEDaS/WooNo6HDlBVigx5siBTS7a71bH0CLlch9bpH5PG
         9lmHwnhJyO+vQBA9jC8uthqiNOdYkJW7A/Ebs11ePYG7mW1RQSaio74WSSmDcFsZO/2S
         gTRrTRuen72SnthBBG8u7/e6qQsdAO32uOraBHIQ6QyqsTioLiOtjxrmSApK8nvawPT6
         AA28mtSFkvje/CL/7NCB2LIN8DxJ/k3OLlcblj04rMFEjlTQBJu5erFmVfyvk8FujNQr
         8CpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590892; x=1793195692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c8NANzTMJV28RCMd27ShXdH01N2IwKbSedeFEkSZyhI=;
        b=py7+AD8u4evXUoiqm+Melb7We37K/oz/Hvm8m2jaRUcmthn5r6UnuIKQ2AJZjkmE+5
         demGKAezP+GAAaZJhI911WSSS8et6ras5t44RcV24sDYCHCeE30uaafe5TgNH6sizzqo
         T0vrD2OYkZxUktAIpaaDib9rpepeyMy0EGzkl5CeUQsirMrdBFTg91JZtVtXiLcLl0jO
         wN9e2CqiZx2I76ZT04Gswixp7eh8kWylGtv1OQlk2HZm/9qhvK/E4qWMLigm0UMW8GNx
         0PuLiGfqaTgmXFRspbYLix8PwUCXkfKHPoeljyyFZvIO85FTnGf+3FnMxftt6iNqwxz4
         4qPg==
X-Forwarded-Encrypted: i=1; AKwUvBzPfVBlaKeqfpnCqqs9poB3Ec6GY1etn/lmL489dm3/TiQrlprGnw68IWv1+xzr6k+hayD/eiY3BWo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwV4R6pvY5sLZg1fcHJUMOXaP4JMY6r9z1qi0WMXFTdM990O0q
	gzlKxPAP8aFOZmDxQOryYCOqx2aFiFE2VMO9k3nvJGLJROVbBP1ntQFtHDFzgXrHnao=
X-Gm-Gg: AYBFou0Hgrq5Yx4PfIg26JSwrf0mhsldNDfwOoWaqXjEtlMUIyb9O70z9tI7QSlqRzy
	xbxQZen98L5fdGetH13kP2qYSe17KWlT4yX4VkI0D+8TOKuPCHLiYOQQX807wcjfyNpWn+RKVH9
	7+KJTasarfKcUxCK9RH4yUN6GAAqPB7ILHGRjG2rzuWH1PDyd7Nu3ZFZ+W/HMpBuAObV21+pXDY
	wp6gUWu89uWVVv6FqELGSQcm1EcH3Fh4czgaCZlfe8lLAXXHYhh3/yNOFH49vHgq0RTWmwQ9kre
	E50GouMkeDUwofdbHkETDofneXujYXL/ZkcUWa4YTNEFRZODdqQtF2HBCiPhwaOh67RpsYINUn0
	RFSirFSSdSf3hCv9cwXRuQY/GgH+Tr8QpppjX2+LjBPqMI3JWUcSvVOLuzCSetgmPMq2MfugZP1
	NLrdR2zaVV51ozOyvLKISNnCg5PGzDMtGyUY7KioQbvY1m5H1yhTMeg8IVWwdF0oWz9M0IntQQX
	v8pOpVw36d5vM05dv0rQteCSU7suZeBWhAA8lrMNG+rn374Z2HEXdRvUT6EaJFylw8=
X-Received: by 2002:a17:907:c30e:b0:c41:2ab8:aa3 with SMTP id a640c23a62f3a-c4606e91924mr434637166b.32.1792590892298;
        Wed, 21 Oct 2026 06:54:52 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a4ffcc5sm7387366b.26.2026.10.21.06.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:54:51 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:54:48 +0200
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
Subject: Re: [PATCH RFC 02/20] ctlv: Add the UAPI wire format and family API
Message-ID: <atjDlIBMg3dmXxHn@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-3-jiri@resnulli.us>
 <20261021000003.71f78d99@jic23-hlaptop>
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
In-Reply-To: <20261021000003.71f78d99@jic23-hlaptop>

Wed, Oct 21, 2026 at 01:00:03AM +0200, jic23@kernel.org wrote:
>On Thu, 15 Oct 2026 16:50:35 +0200
>Jiri Pirko <jiri@resnulli.us> wrote:
>
>> From: Jiri Pirko <jiri@nvidia.com>
>> 
>> Define CTLV's common TLV transport, ioctl, event records, identifiers
>> and limits. Add the in-kernel API used by family implementations and
>> generated code.
>> 
>> Assisted-by: Cursor: GPT-5.6 Sol
>> Assisted-by: Cursor: Claude Opus 5.5
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>Minor stuff only.  Some of it moaning about toys we don't get in uapi
>headers that make kernel code 'so elegant' :)
>
>> diff --git a/include/linux/ctlv_family.h b/include/linux/ctlv_family.h
>> new file mode 100644
>> index 000000000000..1ae4d3a536f7
>> --- /dev/null
>> +++ b/include/linux/ctlv_family.h
>
>FWIW I fully agree with Jason that sometimes it is worth burning
>some lines and even duplicating things a bit to avoid too many
>complex macros.  I didn't have anything to add to comments on this file
>at this point.  Will see how new version looks!
>
>
>> diff --git a/include/uapi/linux/ctlv.h b/include/uapi/linux/ctlv.h
>> new file mode 100644
>> index 000000000000..6bc0d1a296e6
>> --- /dev/null
>> +++ b/include/uapi/linux/ctlv.h
>> @@ -0,0 +1,183 @@
>> +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
>> +/*
>> + * Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES
>> + *
>> + * CTLV transport UAPI: the TLV wire format, the op-execution ioctl, the event
>> + * record header and transport limits. Schema-free; a family's constants
>> + * are generated into <linux/<family>_gen.h>, the root family's into
>> + * <linux/ctlv_gen.h>.
>> + */
>> +#ifndef _UAPI_LINUX_CTLV_H
>> +#define _UAPI_LINUX_CTLV_H
>> +
>> +#include <linux/ioctl.h>
>> +#include <linux/types.h>
>> +
>> +/**
>> + * struct ctlv_attr - Attr header.
>> + * @len: this header plus its payload, excluding this attr's trailing padding
>> + * @flags: CTLV_ATTR_F_* bits
>> + * @attr_id: complete attr ID, or CTLV_ATTR_ROOT for a message root
>> + *
>> + * Attrs are aligned to CTLV_ALIGNTO, which is why @attr_id is __aligned_u64: a
>> + * 32-bit ABI would otherwise align this structure to four bytes. A nested
>> + * payload is the concatenation of CTLV_ALIGN(child.len) bytes per child, so
>> + * child padding counts inside the containing attr's @len while a leaf's own
>
>Whilst I get what you mean, leaf doesn't feel like a clear concept in this
>comment block.  Maybe 'this attrs own padding does not.' or something like that?
>
>> + * padding does not. Scalar payloads are native-endian. Within each request
>> + * root or nest, occurrences of one @attr_id are contiguous; different IDs
>> + * otherwise have no required order.
>> + */
>> +struct ctlv_attr {
>> +	__u32 len;
>> +	__u32 flags;
>> +	__aligned_u64 attr_id;
>> +};
>> +
>> +#define CTLV_ALIGNTO 8
>> +#define CTLV_ALIGN(_len) (((_len) + CTLV_ALIGNTO - 1) & ~(CTLV_ALIGNTO - 1))
>
>Could this use __ALIGN_KERNEL() from uapi/linux/const.h?

Okay.


>
>
>> +
>> +/* Set exactly on root and nested attrs, clear on scalar attrs. */
>> +#define CTLV_ATTR_F_NESTED		(1U << 0)
>> +/* Query fragments: set on the root and each nest logically open at the end. */
>> +#define CTLV_ATTR_F_FRAG_MORE		(1U << 1)
>> +/*
>> + * A request attr, never the root, that a device whose schema does not declare
>> + * its ID skips whole instead of refusing the message. An ID that schema does
>> + * declare is held to it wherever it appears, so this asks to be forgiven what
>> + * this kernel has never heard of and nothing else.
>> + */
>> +#define CTLV_ATTR_F_IGNORE_IF_UNKNOWN	(1U << 2)
>
>Doesn't really matter but could use __BITUL() just to hammer home this are single
>bits. Places like pci_regs.h have started doing this for new things.

Sure.


>
>
>
>> +/* Implementation limits, not wire-field maxima: raising them is compatible. */
>> +
>> +/* Request roots, action replies, query reply fragments and event roots. */
>> +#define CTLV_MAX_INLINE_MESSAGE_LEN	0x100000	/* 1 MiB */
>> +/* Includes the error information root. */
>> +#define CTLV_MAX_ERROR_LEN		0x4000		/* 16 KiB */
>> +/* The root attr is at depth zero. */
>> +#define CTLV_MAX_NEST_DEPTH		32
>> +#define CTLV_DEFAULT_QUERY_REPLY_LEN	0x10000		/* 64 KiB */
>> +#define CTLV_MAX_EVENT_QUEUE_LEN	0x1000000	/* 16 MiB */
>
>Pity the linux/sizes.h header isn't in UAPI as result is we need
>those comments on what the sizes are.  Ah well, never mind.

I already eliminated all of them. Some are kernel internal, some
userspace internal, some I moved to introspection.


>
>> +
>> +#endif /* _UAPI_LINUX_CTLV_H */
>
