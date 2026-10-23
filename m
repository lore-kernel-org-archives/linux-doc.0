Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760168;
	b=fODIHZdr7jsWOm4HNGHMJNw4GN1/wIdv8Y8VLhO8JMX3l5QZmo5Wbhee5EGvMkpi0Gu+
	 KiBfnCGGkc/Fz5ps0YCTi47TOeae115UYWCmZY3LflXvIQwjeSo5X4nI0MP6rQZVKa8tG
	 ZqZPSoiqv0xO51ijkXVTB6rnlhTJVFwyfQYb8hu9jemQV83sGVBwXkcaLg/dm33neMX7F
	 Y/8egXLYK3Fqp3Adb0GwfKWy0NwwT5sL2PKIXQz+xk20XZ2AfYwDzKWf9EHUhsx7fOQ4Z
	 eAcewtcq7uYAMdyMdIvnulnppJPv5/uqlKGOmCjj5cHj1FDhAx2suV7c9EzMKBo5gFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4u5HTj0vYNkfyVy/ejdHIe5/AhW56e/aHgAn7wANgbM=;
	b=hETODhVYTlMWEoo772hbHrc6Y7eRHXC0IBR7GZxv9TpJAoK3n9vuKUtBVZIngaGmAmTQ
	 KMi/9VLJ3kqqc6EF9JQOp8OKPI8xpOsC8QD2/1NGPB0nZnQgreCOk5LKwdNsf+oVO7P+U
	 OcvTPYBNmqy19LMg+ev9eKGi/lM0msYfOFXyVqBp1wA+gaKqSDrMmYUNimJzXECLjaCaO
	 71SySV+5m3wyY7KmGkMs/VbVQbL2Uubt2pzZVShhwmwwrbdW23u/8vYnUQuAZA/sfgeqs
	 9O6tunlcbjlx94T8TzTDDVNWw980kssW5NkTgmaMBayAZ8WhiyTw+SLIRsC0Euw8G2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99721606A31B
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 12:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99721606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso9339175e9.2
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 05:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792760161; x=1793364961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4u5HTj0vYNkfyVy/ejdHIe5/AhW56e/aHgAn7wANgbM=;
        b=m68+nKSR5BhjusJh/Qoc0nFyichGbcMpyaSKaNJGTP3rKdZ4Rjh5t6O40bNzgjsQJ7
         3ehrVsQhBMk8TpcHGvYxIVuxL6Ze31YASaTg7nasj/RW94kOhYVH3HMatmav1PWnD6ro
         hrnxuD+1NWOJaivSj8CsP4FSc6Yqtc3QVKWRjK8boPOVkf0vQXAjVum2TMSwmA0EI2YK
         Bn0wEYZ+diJ8DmIbUBKI+rmeQ5CMY/a+JhcwneYZfX1B0op3gTVSsQCCMm2tBMykQ56d
         x/TFWrZUzyXQegTGLG/MoakhVwcu3bSwlv/on6PDudlwXA/4Au3qwbz6mtfx38vXN42l
         OLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760161; x=1793364961;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4u5HTj0vYNkfyVy/ejdHIe5/AhW56e/aHgAn7wANgbM=;
        b=WXamHvL6Y6OteKaZc82geBjTbyD0w3P8x1C2oHuyOClT94v1Q8RcLVcWiHLSsgnjCQ
         zotIQNsE3r+xsXKShLMf98Jc4/wgf9djY840/aJYh2b75bwvgB0brGxStIW2389KajdA
         BaLkckfHta/mYxRSCV+GTnF1RzDFQdZKxslRUo/mbUBrvt0oKHEcpVZnV2Zxm2JnqJDq
         lZgpGrA5+a+oZwtoikgIyStsDJN8kZYwmhAJaj+xRSAPxGpKpgLDJXG/tD7uio1cLkdA
         neaoGxQPqYxRtsTXoH8YNY9nBL6TpDYHgiABT2cvzxCwsDZ0xHzOTs5wIMqrNIRY2l05
         70QQ==
X-Forwarded-Encrypted: i=1; AKwUvBy852IhHVi4lDc0hRTy16jh2OXesWnRhfZyMWSbCd2uZ7kvd71JuEdtGWQNWb+s92kWS52CyHazgxo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAZKHxfQKx/1muANEL0ho0CzMBZkldLDsI7UkxcbrISmhz9qWF
	Z0zo1GVoNS0kATwmPZSr8Onickhybmi643pLYiTuGaLdK3AJ0w91617WMat7fSUa3MY=
X-Gm-Gg: AYBFou0ttI5FyOwOD8t+PTwX2e5h6rTn9tVyEq0+HL1ZCZ1+uJQxZX14Pl2MzlLqzYZ
	dksUOKqVGwNoLFR+yGl0oFivdxvyxklyEZL1bqZmXVEXNNA/xL4ZC26QX8pGqvCIH7fiDgpsBrC
	VCo01cZR/oNUTeGoA5sx7AOCqW0YOZAAai+GUQ8k+sX7sEsicobdQDDCvJrzlLyjuM46tiskbKN
	gFYUABHEG2u2fItqBDQfIQI2PqVumFopx+dCy5zGNRUBAXs6FJto9TrfwWln+UOo8iwZr988zZr
	Tdt4icTm4PSwGeeZfAD4rdpUR9z4WAI2wvIBpl5zm6x2PEG/MzC3pCb5v6qh7ny5c77q1gYosiq
	1WfGrQ1bWzIKRonqlwPw4sdamAHK9DCAKQGLO2hL8hpko27r+W64jPosqcmUVcyJdNgOqw0Jgua
	8OWxlbDs39XJnycq8YFLQeJELY9Zdf0SrSybUWMdeLd1oa4Vip15hrqf4bfj4w9ZItTtbAQHfka
	qkp7RgWBl4xTrVJOB+XmZ/yjRRDr8+JPaWLpsnVxm+vYUWFKDziwYdtiEEscCyAvw==
X-Received: by 2002:a05:600c:354b:b0:4a1:97c6:d2e8 with SMTP id 5b1f17b1804b1-4a211ef95e3mr38623785e9.32.1792760160732;
        Fri, 23 Oct 2026 05:56:00 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a29cd9d232sm3594475e9.4.2026.10.23.05.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:56:00 -0700 (PDT)
Date: Fri, 23 Oct 2026 14:55:56 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 05/20] ctlv: Prepare message input handling
Message-ID: <attZPPNPIgF-DH4r@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-6-jiri@resnulli.us>
 <20261021014324.58376589@jic23-hlaptop>
 <20261022183942.GC3381610@ziepe.ca>
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
In-Reply-To: <20261022183942.GC3381610@ziepe.ca>

Thu, Oct 22, 2026 at 08:39:42PM +0200, jgg@ziepe.ca wrote:
>On Wed, Oct 21, 2026 at 01:43:24AM +0100, Jonathan Cameron wrote:
>
>> > +bool ctlv_message_input_rebind(struct ctlv_cursor *nest, const struct ctlv_schema_tree *tree,
>> > +			       u32 node)
>> > +{
>> > +	const struct ctlv_message_input_scope *bound_scope;
>> > +	const struct ctlv_message_input_nest *indexed;
>> > +	u32 i;
>> > +
>> > +	if (WARN_ON_ONCE(!nest->attr || !nest->msg || !nest->msg->index))
>> > +		return false;
>> > +	if (!ctlv_message_nest_index_ok(nest))
>> > +		return false;
>> > +	bound_scope = &nest->msg->index->scopes[nest->index_nest_scope];
>> > +	indexed = &nest->msg->index->nests[bound_scope->nest];
>> > +	for (i = 0; i < indexed->scopes_count; i++) {
>> 
>> 	for (u32 i = 0; ...
>
>Is that allowed now?

Yeah it is! You live in the past, same as I do obviously :)
