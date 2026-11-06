Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962124;
	b=me4F2ibqGahDu8gNb62YHv//aMfsUky7dM/KWymbZveQ1S+xoqqCaUrtHU1qDYnSgH3J
	 5jWsf60Wmtdq6sKVsl7KWSbQmmBJ6KsE8O9T5mKC3FEYvRS69K67yua/qBQmSuYPfx017
	 UdMXW5VK6B2L1HKz9D391sptg80Dcc/JLmX2MTCr9D6i4+i7HpemhFzCKXdoax93WTvd5
	 ypWmBH42ilnFaVD7uNinxuQrwak8MPyrMcG9fZTCPG9SaGk1lbAUYyC+VmhSFkNpPPK3s
	 pAO9/81LkIkeleoIavUuy/1yN50B53KEZ/13cVwyRYRRM1JIHF6L2hBGXchMNyTQjtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962124;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=Znd1cZ5IjV4uc6ezqu/TRn+cpph3NmqfcGk4Yh11yDw=;
	b=rCM5dt0mcm9XaMi8LW/I9yliTPOzwE0IBKy+FVLdT24QulD585SopfttMb8LVrZz4Z3g
	 19UKtlwePamF8PQnxGw2WZvypCrIq6+qEY4U/2r2hW67xBhiJzrHvdc9IOLl/clHEqrm9
	 eHL8xiKEpa+M6INDvnAeyE80Oat/USOfD/oC9H28L0RAuROfz8Jx7PM8IAHvrLZKQ3UlG
	 fdSXKexPtSEHIY4BQ5A/pQlXa76p376xs7/2807Oj76J3+3OSb4z4Mo4vnkpoqAWye4WJ
	 gwzia/bzkOIkQP1AetG/uvegejLo3tXJHHDuHNIuBTqVoP7aa9P+ZUJlxSxU/j/8qAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=im7LGwcj;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6116082BC6
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 10:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB6116082BC6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=im7LGwcj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793962122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Znd1cZ5IjV4uc6ezqu/TRn+cpph3NmqfcGk4Yh11yDw=;
	b=im7LGwcjo6X4OTLeiMWBrjUoAAk3xrSA9Kv/UpvfE3GfV0dqYEmnsRWyTpJoLBQ2C9qIw0
	SX3nZMaSRV7Cw1eWZg80Xfmh03s5W1oydfeh+mjzn36OCt9bpf3fo/m2AFb+2UapNrXmyp
	ZT1vNSUZzLn85+Z5HORKvFPrafaL2SQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-369-zl9F2kr0PhaJ4M5HjY-QoQ-1; Fri,
 06 Nov 2026 05:48:39 -0500
X-MC-Unique: zl9F2kr0PhaJ4M5HjY-QoQ-1
X-Mimecast-MFC-AGG-ID: zl9F2kr0PhaJ4M5HjY-QoQ_1793962117
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ACB251956058;
	Fri,  6 Nov 2026 10:48:36 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 55DE930000E3;
	Fri,  6 Nov 2026 10:48:32 +0000 (UTC)
Message-ID: <14944865-8a03-4406-93a9-7f124486ef17@redhat.com>
Date: Fri, 6 Nov 2026 11:48:31 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 03/14] dpll: dpllsim: Add configurable pins
To: Petr Oros <poros@redhat.com>, netdev@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Shuah Khan <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261105151852.1844305-1-poros@redhat.com>
 <20261105151852.1844305-4-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261105151852.1844305-4-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 11/5/26 16:18, Petr Oros wrote:
> Pins are the unit of most DPLL netlink interaction, so let a device
> instance carry an arbitrary set of them. Each directory created under
> the pins/ group of an instance is one pin with type, frequency and
> direction attributes. The type takes the names of the DPLL pin type
> enum as iproute2 prints them, the direction is input or output and the
> frequency must be one of the frequencies the driver advertises as
> supported for the type. The pin directory name becomes the board label
> of the pin, which gives tests a stable handle to find a pin by. The
> attributes are writable only while the instance is not live and return
> EBUSY otherwise.
> 
> At live=1 the pins are ordered as created and each pin records its
> index in that order, which is the pin index it is registered under.
> Their frequencies are validated against the per type tables, a MUX pin
> configured as output is rejected since a MUX pin stands for an input
> selector, and all pin handles are obtained up front, so that a failure
> leaves nothing half visible. The device is registered first and the
> pins after it, so that every pin registration event reaches userspace
> with a valid device, and a failure unwinds exactly what was registered
> in reverse order. While the instance is live the pin items are held
> with configfs_depend_item_unlocked(), which makes rmdir of a pin fail
> with EBUSY until the instance is taken down.
> 
> The pins register with the mandatory callbacks only, direction_get and
> state_on_dpll_get, plus frequency_get since the frequency is known from
> the configuration. The input and output ops tables are identical here
> and diverge when input pins gain their setters in the next patches. The
> state is always reported as disconnected for now, the settable pin
> features follow in separate patches.
> 
> Signed-off-by: Petr Oros<poros@redhat.com>

Reviewed-by: Ivan Vecera <ivecera@redhat.com>

