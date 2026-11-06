Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962082;
	b=M15JmAg66IkqhGo6zIZY9bB6gKdvTebxO75Vh75mkfijjMlUfrK+Jzr36XykVPv40Wyy
	 2r53RjKy/yf/SNScG9J6ufUP/LIFUst2ZH7HJiM5MsP5mygnS8V/3ibu4rN26HgKkpxcE
	 2yOXkwCJYCHcSnJwNmyuxQNZqQv4nht4E1RxXSz26qT0HVsv4WC0Fk6cTlOcPcLNWJ5oa
	 mPGdRprS8rjOavbAHQt5ROPIqvRuXpRj07pgwicTNNoGj2UzdoiuB86rqlcjHvqxCtxXA
	 6Ey5XaFjAnt7jOQcuc/XsYut4AlgzR+rQkFKfxvM//jUqm8dYSA38gT9b8W+vU3SkJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962082;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=163RElAlae5uQkPUGUG0Xs6XDM13x8ZXFRy0GRmNiHg=;
	b=EiaWk388vUQk+Z0vnaf69KjqyONYQ+1Bkjge58vbGO4kzrZsaN2TSAf2XjThbaGIaLAs
	 7ymAyVPP2ljp4hf2d/g6vLR7+oiFKdcA+rVTg4MaI6SJsK8GgdfJK6r/lg3+U5jJNP8ld
	 CtgiT8gBPbiO018ZbMB+3S6LtNI2UI055BZkqXTsAXPwRhHzL3irDwkyGoy2zszD6F1y8
	 E81r5xRRBAA6KUqJ2NiUGo73P+MIufVRKX7ada0TCO7/Vw0yAJZ/OBMhWcXHnyWQ0mFKG
	 g28vaA7l0mVh52qp5mgSIcHmJcRU9OMzmtKbUS4SIUR4bq4Msj70PIVNpPUMbFK/3nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JjZ76oNS;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427CD606A32D
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 10:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 427CD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JjZ76oNS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793962081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=163RElAlae5uQkPUGUG0Xs6XDM13x8ZXFRy0GRmNiHg=;
	b=JjZ76oNS5fIl7PDcgqloVk3zWpyqunqxsTARERsqxkgIcw2lL6Uw9eme4kMnPRNNIYdZsM
	XldU3JHJVa+ue4Qe09ZT2M3iQTpqWy036QOwEfhdyaBAdRS/RW9CWg6avL9S3yfEz4XMTQ
	w6xg/fwzRC1H2kDyFia8NJYzDEpZRi0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-634-7cQwnCx5NwiEzjtXR0b5Fw-1; Fri,
 06 Nov 2026 05:47:56 -0500
X-MC-Unique: 7cQwnCx5NwiEzjtXR0b5Fw-1
X-Mimecast-MFC-AGG-ID: 7cQwnCx5NwiEzjtXR0b5Fw_1793962074
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 35FD6180061E;
	Fri,  6 Nov 2026 10:47:54 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8222C187C36C;
	Fri,  6 Nov 2026 10:47:49 +0000 (UTC)
Message-ID: <3627c7c8-8b03-4288-9eb8-90fcf20b8730@redhat.com>
Date: Fri, 6 Nov 2026 11:47:48 +0100
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
Subject: Re: [PATCH net-next v2 01/14] dpll: dpllsim: Add simulated DPLL
 device driver
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
 <20261105151852.1844305-2-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261105151852.1844305-2-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 11/5/26 16:18, Petr Oros wrote:
> Add dpllsim, a driver providing simulated DPLL devices for testing the
> DPLL subsystem and its userspace tooling without real hardware, in the
> same spirit as netdevsim for network devices. The DPLL core identifies
> a device by clock ID, index and module only, so the driver needs no bus
> and no struct device at all.
> 
> Instances are created and configured at runtime through configfs,
> following the gpio-sim precedent for objects that userspace creates on
> demand. Creating a directory under/sys/kernel/config/dpllsim/ allocates
> an instance, its clock_id attribute selects the clock ID, writing 1 to
> live registers the DPLL device with the core and writing 0 unregisters
> it again. Removing the directory tears a live instance down implicitly.
> Keeping registration separate from creation lets a test register and
> unregister the same device repeatedly, which is where the core bugs the
> driver is meant to catch tend to live, and it allows the structural
> attributes to be refused with EBUSY while the device is visible to
> userspace. Unlike sysfs, configfs does not imply a stable ABI, which
> suits a driver whose knobs exist only to drive tests.
> 
> Reading live reports whether the device is registered with the DPLL
> subsystem, it turns 1 only once the whole live transition succeeded and
> 0 again as the first step of the teardown. The configuration is frozen
> earlier, from the moment the transition obtains the device handle, so
> that a configuration write racing with the transition is refused rather
> than lost.
> 
> The device registers as a PPS type DPLL with the two mandatory callbacks
> only. mode_get reports automatic mode and lock_status_get reports
> unlocked with no error. Pins come with the following patches and the
> simulation of lock acquisition with a later series.
> 
> Document the configfs layout under Documentation/driver-api and add a
> MAINTAINERS entry.
> 
> Signed-off-by: Petr Oros<poros@redhat.com>

Reviewed-by: Ivan Vecera <ivecera@redhat.com>

