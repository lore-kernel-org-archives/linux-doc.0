Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624079;
	b=brTnQI3zNQ6R+6SZhLB8ReUjrkpSKFbzudJQiuozxXHVrjr098JWzjOTe/Cwd3RBkHBs
	 F3XPAeKxT0XZv2KpwN9YnwY0qWGYZuND7Bh8PKaIHZCm8Gx6fcRyZ4M/QjOol098JenAy
	 or6Oe/+7yptFu0yVcwqMEtHstZVCfdc6LCbBAUPdq+ZEonFaLCXq10jfvAgt+cav0TSQE
	 eNe9Nk9MPslNRXm/rhPuPHlHijcxay7q/kx18NQttCE519AnKu3F1aTSVEkuFhWNEyELT
	 Ed7wNZNPrlhW23Qwh3OnX3F/rZ60dR0xvGsrIStI78+1TlEWsi48VYde0Z9VS6IPDwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624079;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=0ccuMba5+2cV+cajIEgRXiyY/D31cnRahwOAYJCpOuM=;
	b=Z5y1ef4b5v57KGKL5J/B26r2OQtLGPYg9RRp7FkXonh9kR6Gi3v6kgE23ZzFEf0+aeGp
	 K4kXg9H1OMNDYe2M9yyfYaEkEyToz13Ug2v7Pp+7axFQ1QnjlsApZfiV3+41tbzgBxMdI
	 CvEd6hoelDeNh7oZnzhTzgLsdBi2FEE2tztyfY458dz/WPbIjrSwrv9C+Tq/V122FfwTW
	 lg5dd1Z3DpJzHW4iBepMEAmp4sobaBP9g7W3/P7X5oPA22MsFoodZhBYpxrGhI290p/vp
	 pt+x9QWk1BDb3Y6JHDFTE/3Lg6OyQYJk1ZtGlaQVQ5LpcriaPp+BBABHL0JG2zEIsZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="LCEbYt/z";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD91E606A32C
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 16:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD91E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LCEbYt/z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795624077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ccuMba5+2cV+cajIEgRXiyY/D31cnRahwOAYJCpOuM=;
	b=LCEbYt/z6n0ExJK2dER5ZyeKmOAH74d7TPoK42dTiJdIl/gthS1TJQfjXGmGZ5uSSFDs6g
	PyHOlVjansBS/n4bvBFuia6rEqMtoWwk06VtviOU5MTKEz7ghbDB5SluEe/kqwc/XZdSzb
	UJwjxjIoiVBtT2pHEjEI0RvPEBxUR/w=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-86-BHb8WixNOA-VPEU3mcQ1XQ-1; Wed,
 25 Nov 2026 16:27:53 +0000
X-MC-Unique: BHb8WixNOA-VPEU3mcQ1XQ-1
X-Mimecast-MFC-AGG-ID: BHb8WixNOA-VPEU3mcQ1XQ_1795624070
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 30D401955E89;
	Wed, 25 Nov 2026 16:27:50 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EC5291801A62;
	Wed, 25 Nov 2026 16:27:43 +0000 (UTC)
Message-ID: <7cf84726-961a-4339-adb9-36ce342c911e@redhat.com>
Date: Wed, 25 Nov 2026 17:27:42 +0100
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
To: "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, Jiri Pirko <jiri@resnulli.us>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Min Li <min.li@microchip.com>,
 "Nguyen, Anthony L" <anthony.l.nguyen@intel.com>,
 "Kitszel, Przemyslaw" <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 "Nitka, Grzegorz" <grzegorz.nitka@intel.com>,
 Karol Kolacinski <karol.kolacinski@intel.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>,
 "Oros, Petr" <poros@redhat.com>
References: <20261111164021.273409-1-ivecera@redhat.com>
 <20261116181612.107a4b57@kernel.org>
 <fe1dcdd5-ef75-4231-bf9f-03bf8536c2aa@redhat.com>
 <20261118174424.32e9f130@kernel.org>
 <dd1d61d7-7bef-4a02-8518-e17d2f50369f@redhat.com>
 <MW4PR11MB6984FD51283AEF4F2B8E27E39B432@MW4PR11MB6984.namprd11.prod.outlook.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <MW4PR11MB6984FD51283AEF4F2B8E27E39B432@MW4PR11MB6984.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 11/25/26 16:36, Kubalewski, Arkadiusz wrote:
>> From: Ivan Vecera <ivecera@redhat.com>
>> Sent: Thursday, November 19, 2026 1:29 PM
>>
>> On 11/19/26 02:44, Jakub Kicinski wrote:
>>> On Wed, 18 Nov 2026 16:29:23 +0100 Ivan Vecera wrote:
>>>> A step of the zl3073x PHC, which ptp4l and ts2phc do at start and
>>>> after a large offset, waits for the next 1 PPS edge, up to 1 s, with
>>>> the channel lock held. A phase step can hold it for up to 3 s while
>>>> it waits for the previous one. A dpll callback of that channel waits
>>>> for the lock under dpll_lock, and every other DPLL request and
>>>> notification in the system waits behind it. With ToD writes running,
>>>> requests to an ice DPLL took 1448 ms in median and 3.9 s at most.
>>>> With the series they took 0.2 ms and 0.3 ms, the same as idle.
>>>>
>>>> The bigger reason are zl3073x callbacks we are working on, which have
>>>> to wait for the hardware themselves:
>>>>
>>>> - a device reset with resync waits for the fast lock, up to 1 s with a
>>>>      1 PPS input
>>>> - a glitchless stop or start of an output completes on an output edge,
>>>>      so it takes up to one period, 1 s for a 1 PPS output
>>>>
>>>> Holding the global dpll_lock for that long would stall every DPLL
>>>> device in the system. For the output state we tried an asynchronous
>>>> implementation, but then the callback returns success before it knows
>>>> the result.
>>>
>>> Right, for these level of waiting async seems like the right
>>> direction, at least naively/without knowing the HW.  Why does the
>>> device wait until PPS to apply the step change? Is the programmed time
>>> supposed to correspond to the pulse?
>>
>> Yes. The device has no immediate ToD write, it can only write the ToD on
>> the next internal 1 Hz edge, the next input sync edge or the next internal
>> 0.5 Hz edge. The written value is the time at that edge, so the seconds
>> stay aligned with the 1 PPS outputs.
>>
>> Looking at it again, the zl3073x holds the channel lock while it waits for
>> the edge, although the dpll callbacks do not touch the ToD, TIE or phase
>> step registers, and they already run while the device applies such an
>> operation, because the PTP ops return right after issuing it.
>> I will look at narrowing the lock in the driver.
>>
>> For the resync, async is not only about reporting the result. Fast lock is
>> a setting of the DPLL, not of a reference, and forcing it makes the DPLL
>> ignore its frequency and phase error monitors. While an asynchronous
>> resync is pending, everything else done to the DPLL runs in forced fast
>> lock. A reference switch, whether from a priority or state change, a
>> manual reference or the device itself in automatic mode, would follow the
>> fast lock phase rate instead of the configured phase slope limit, and the
>> resync would then report success on another reference. A switch to NCO
>> would keep the force bit set until the work clears it. So every request
>> changing the DPLL configuration would have to fail with -EBUSY, cancel the
>> resync, or wait for it. With a lock per chip they simply wait, for at most
>> 1 s.
>>
>>>> A failure can only be reported by a later notification, and the next
>>>> request gets -EBUSY until the change completes. With a lock per chip
>>>> the callback can simply wait, and one chip cannot do these operations
>>>> in parallel anyway.
>>>
>>> Do the failures only happen because of "unforeseen circumstances" /
>>> EIO, or there may be more common errors reported? If it's just the
>>> former a devlink health reporter could be an option.
>>
>> For the output start and stop, only EIO. The device does not report a
>> stopped output and the driver can only wait for one period, so a health
>> reporter would work there.
>>
>>
>> For the resync, no. The wait ends with -ETIMEDOUT when the DPLL does not
>> enter fast lock, for example because the selected reference lost its
>> qualification in the meantime. That is a result of the input signal the
>> user needs in the reply, not a device fault.
> 
> Nevertheless we need mechanic to do it async? Or add a timeout for callback
> on dpll side? This global lock was never intended to wait a second (or below
> pointed 60 seconds) for the HW to respond.
> 
A timeout would not help. The core cannot abort a callback that waits
for the hardware, it could only stop waiting for the lock, so the
stall would turn into errors of the other requests. An async
mechanism fits the output state, but not the resync, for the reasons
above.

I would rather do what posix clocks and PTP do. A posix clock has an
rwsem that only protects its lifetime: every operation takes it for
read and posix_clock_unregister() takes it for write. The PTP core
calls settime64, adjtime and the other ops without a lock of its own,
only ->enable() and the pin configuration run under the per clock
pincfg_mux. Each PTP driver serializes its ops itself, and a slow
clock never blocks another one.

For DPLL this would mean:

- dpll_lock becomes an rwsem that only protects the topology and the
   lifetime of devices and pins. Registration takes it for write,
   netlink requests and notifications take it for read.
- The core does not serialize driver callbacks. Each driver protects
   its own state with its own lock, as PTP drivers already do.
- The other rules for drivers stay as they are today: a callback must
   not call a function that takes dpll_lock, and a driver must not
   notify while holding a lock that its callbacks take.

A pin registered by another driver is then no special case, because
each driver protects only its own state, whoever registered the pin.
The core only has to keep the notifications of one object in order,
with a lock per object held while the message is built and sent. The
cost is that a message about an object that changes while it is built
can mix old and new values, and the notification sent after the
change carries the new state.

ice already serializes its callbacks with pf->dplls.lock. zl3073x
relies on dpll_lock for the state shared by its channels and would
need a lock per chip, and mlx5 and ptp_ocp would need to be checked.

This does not depend on the RFC I mentioned in the other reply.

Would that work for you?

Thanks,
Ivan

