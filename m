Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617109;
	b=xR7Q1+PNeN7ruBm2OLvCrUR9IyiyOshYIlT4fwZKptJSWC/lRZcXymdDaJgLLVIIGA0s
	 gpKIvH0k2uV/ZeFM2b2L3wMQoCFD68FsmcrH922FoR4Y5UWKKK3Z32dEWv9szNW1DdQS1
	 vX8gH0nHbavet/2Vk2MsUYMikdE31mCRoQaXhPPBi+dFf7ww/zkxiV+XclncyXoNZub8H
	 Rw2VmZaN2abCZ8speJVlINFtdWLGm2CRdlewFtV2fOHqVnXagURoZF2xA+ChoorsdFOVs
	 gzDK4prdcQOwi6ro9Ezwt7ZKT9UkuGqnQmfUHwGjnrYtXn4JoF0gSVfZs7GjY06rlnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617109;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=9VPn3qSbr6UuDL7PEPnTHgNf7btvQAHemjoVf9yo53s=;
	b=2HraEEImuCpVnzsXjPx2rwOl4UiO/rHrqdTIpJWUBwvglkf7J0KbiUy6u0v5EFPXFf/0
	 yzhibBenutzsPflL+bsn+XSCvSVCi7q3u7kuUK15QP1LHk4u8IOoX7alq6YHm9M1J/+vk
	 chsyVq11Ccp3McPTb92KVV9QMX5JvyorWL8MGdgfM/1vp+t/KNGV4tnLyqvnJjTK8fN+s
	 m5a3zRPzml0kYOxvkyU4TqOq5NSVi7zwVa5kqEXHatQbcvWz+4vF+ji2s4BFvIBn8cefm
	 uGgrDYMISySvp9/JKXP9HqkmaJ2TBf4VHiUw2oeLgEHRgZLQKUGV8IoHlVr8S7gOPUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=egBpZ0Zo;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4D0606A31E
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 14:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B4D0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=egBpZ0Zo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795617108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9VPn3qSbr6UuDL7PEPnTHgNf7btvQAHemjoVf9yo53s=;
	b=egBpZ0Zoc+kRvpI6yiTgXP7zovyq8XSUkEiuelyv4Y0JdluUvJ7Tn1DGfcpnj6aqcki3ke
	Z8geIgOXnbrQa64Z2SgCmQvzGDsYbY3o97AV9+3xxAFzgV+UR0rVs3YSlhjvxqJpfWGIdp
	GIoyUCplooWZoqB5GOdiI48l0Ps0+j8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-324-jywuPODkNlmXYQVCdRy39A-1; Wed,
 25 Nov 2026 14:31:43 +0000
X-MC-Unique: jywuPODkNlmXYQVCdRy39A-1
X-Mimecast-MFC-AGG-ID: jywuPODkNlmXYQVCdRy39A_1795617098
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E60451955F02;
	Wed, 25 Nov 2026 14:31:37 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1024D1956045;
	Wed, 25 Nov 2026 14:31:31 +0000 (UTC)
Message-ID: <8dc4f480-a875-4118-b5ee-2c4716ee53bc@redhat.com>
Date: Wed, 25 Nov 2026 15:31:30 +0100
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
Subject: Re: [PATCH net-next v2 0/9] dpll: do not serialize driver callbacks
 under global dpll_lock
To: Jiri Pirko <jiri@resnulli.us>, Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Jakub Kicinski <kuba@kernel.org>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 netdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Min Li <min.li@microchip.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, Grzegorz Nitka <grzegorz.nitka@intel.com>,
 Karol Kolacinski <karol.kolacinski@intel.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>,
 Petr Oros <poros@redhat.com>
References: <20261111164021.273409-1-ivecera@redhat.com>
 <20261116181612.107a4b57@kernel.org>
 <fe1dcdd5-ef75-4231-bf9f-03bf8536c2aa@redhat.com>
 <20261118174424.32e9f130@kernel.org>
 <dd1d61d7-7bef-4a02-8518-e17d2f50369f@redhat.com>
 <20261119133851.3f25074c@kernel.org>
 <bdfa88fe-13bb-4050-b750-962586b1d846@redhat.com>
 <ff8b63b7-b943-444a-bd37-b6fb493b5d9f@linux.dev>
 <awMP9Gj3Xhia0ZeI@FV6GYCPJ69>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <awMP9Gj3Xhia0ZeI@FV6GYCPJ69>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 11/22/26 16:54, Jiri Pirko wrote:
> Fri, Nov 20, 2026 at 09:00:27PM +0100, vadim.fedorenko@linux.dev wrote:
>> On 20/11/2026 07:39, Ivan Vecera wrote:
>>> On 11/19/26 22:38, Jakub Kicinski wrote:
>>>> Well, I'm not convinced. The relations between objects in DPLL are
>>>> already quite hard to follow, and objects from one driver routinely
>>>> "plug" into objects from another. The explanation of the locking
>>>> rules in patch 9 does not look clean or clear. The driver facing
>>>> API needs to be much more "dummy-proof".
>>>
>>> Fair enough. The complicated part of the rules comes exactly from
>>> that: a pin registered by another driver, like the zl3073x pins that
>>> ice registers with its TXC DPLL or uses as parents of its RCLK pins.
>>> A message about such a pin runs callbacks of both drivers. I have
>>> prototypes of the first four ways below to lock this, each with KUnit
>>> tests, and would like your opinion before going further.
>>>
>>> In all of them a domain is the set of objects created with the same
>>> module and clock_id, dpll_lock becomes an rwsem for the topology and
>>> lifetime, and a mutex per domain serializes the callbacks.
>>>
>>> A) Pin's domain (this series)
>>>
>>>      Callbacks of a pin run under the domain of the pin, whichever
>>>      driver registered them.
>>>
>>>      Pros:
>>>      * one domain lock at a time, so no lock order
>>>      * a request or a message about a pin is atomic
>>>      Cons:
>>>      * the callbacks of a foreign pin are serialized with the driver
>>>        that created the pin, not with the other callbacks of the driver
>>>        that registered it, so that driver has to protect the shared
>>>        state itself, and lockdep cannot check it
>>>      * restrictions for measured_freq_get, reference sync pairs and the
>>>        private data of a parent pin, which patch 9 has to explain
>>>
>>> B) Registrant's domain, deferred notifications
>>>
>>>      Each callback runs under the domain of the driver that registered
>>>      it. A message about a pin takes the domain locks one after another,
>>>      and notifications from callbacks are queued and sent once the
>>>      domain lock is dropped.
>>>
>>>      Pros:
>>>      * callbacks registered by one driver instance are always
>>>        serialized with each other
>>>      * one domain lock at a time, so no lock order
>>>      Cons:
>>>      * a request or a message about a pin registered across domains is
>>>        not atomic
>>>      * the most complex core: a notification queue per domain, a lock
>>>        per object to keep its messages in order, and pin setters split
>>>        into validation and apply parts
>>>
>>> C) Registrant's domain nested under the pin's domain
>>>
>>>      Pros:
>>>      * callbacks registered by one driver instance are serialized with
>>>        each other and with the driver that created the pin
>>>      * a request or a message about a pin is atomic
>>>      Cons:
>>>      * the lock order comes from the topology, so a pin of A registered
>>>        with a DPLL of B together with a pin of B registered with a DPLL
>>>        of A deadlocks, and lockdep sees it only with a lockdep class per
>>>        domain
>>>      * a stuck foreign registrant stops the domain of the pin
>>>
>>> D) Merged domains (your suggestion)
>>>
>>>      Registering a pin with a DPLL or a parent pin of another domain
>>>      merges both domains. They are not split again.
>>>
>>>      Pros:
>>>      * the rules for drivers stay as they are with the global lock
>>>        today, and lockdep checks them; the only new one is that state
>>>        shared between chips not connected by a pin needs a driver lock
>>>      * a request or a message is atomic
>>>      Cons:
>>>      * only hardware not connected by pins runs in parallel; on the
>>>        GNR-D system the zl3073x and all ice PFs end up in one domain
>>>      * a callback that waits for the hardware, like the planned resync
>>>        for up to 1 s, or for firmware still stalls all DPLL devices in
>>>        the merged domain
>>>
>>> E) Global dpll_lock, slow callbacks asynchronous
>>>
>>>      Pros:
>>>      * no change in the core
>>>      Cons:
>>>      * the resync problems from my previous mail, and a callback that
>>>        waits for firmware still stalls all DPLL devices in the system
>>>
>>> I wrote before that stretching the domains would not improve
>>> anything on that system. That holds for the ToD stall I measured,
>>> but the zl3073x does not need to hold its channel lock across the
>>> edge waits. Without that, the remaining waits are the planned resync
>>> and output state callbacks, and with D they stall only the devices
>>> wired to that chip, which depend on it anyway.
>>>
>>> So I lean towards D, as it gives drivers nothing new to get right.
>>> Would that address your concern, or do you see a better way?
>>>
>>> It would be good to hear from the other DPLL maintainers as well.
>>> Jiri, Vadim, Arkadiusz, what do you think?
>>
>> I totally agree with Jakub. Current implementation of DPLL subsystem is
>> over complicated, and all these complications came just to completely
>> model what was designed for Intel NICs, basically ice driver. But now we
>> are again back to the discussion how to complicate things further just
>> to fit what was implemented in the new generation of the same hardware.
>>
>> Maybe it's time to step back and think if we really need all this, or
>> find simpler way to express/model things?
> 
> Agreed.

I fully agree with you guys... I also don't like the way how the ice implemented
pin sharing and thinking more about Vadim's "Maybe it's time to step back...".
I have started an effort how to model this differently without any inter-driver
DPLL object sharing.

I will send a RFC patch-set that should address hopefully all painful points.

Thanks,
Ivan

