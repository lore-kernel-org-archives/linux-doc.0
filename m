Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204833;
	b=a20UFHeRjFhZ4efB+yIhw2bt6/QbWYJ9RA1tydrDmOdk9YVAoM6ob+CtslLg4GodjRGb
	 DY8jEOhZwMmB4llZ+RXXEq/oo+iGvLDCi3Ja6BcLrww1RjJhzlHvEcP/ADDHdiXB1E/Wa
	 zsPoERb+4Fr7+ivKU0mZpTaAefZQxYF/D2fwXeUqVYeOjtoGZzDPpbb4C5pgHI5YckGZc
	 uAWqcxUSwD7oiNUiGwL4mW9A2DNm1TNilHiwLMNWTqzKwC/7fS8tn89eBj8SsQzpLcYvr
	 TLyFVb/a73Quh4KvAuP0UQrzAXBYRcl6bSHTSIYpWsY1kncIZhoMXQNLKhRcTG2S/hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204833;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=5QgfHDQQ4MSdGh+4Ts8IUMOxAYgDCdzXWqFzljmCVG4=;
	b=rWPsM3kay02g9F3GMiJorxYq4Lhu9BemPRJQjUPxGpXNQm79vx3wFJKzeYFrrVY5U+LB
	 k0+DPhc5esnOcaJL46/CXF50cu5AxM/G7n4V9FSADRmP1k2ySsgjW2QEzUvvvGPDqDYN5
	 OMMFLXPHzvetyuAoYPZf8HB1C2wQnCVwDlg73krYH9k3EqC0Z7MjJmZvCWWmww/pyuQlW
	 4feow13KHOhWWVis9icOq+ORDJVpIegUbajAsO4dvrxoH03l92Pu9pL6DPIepmkGqSQ05
	 nzvc/g+YKbPm/iApXXnqf2GQKFRMiSW0PpZVo4/qCIo/b6DIUp9tJfR17SLGhK4elow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EEjM6lKn;
	arc=none smtp.remote-ip=91.218.175.225
Received: from mta0.migadu.com (out-225.mta0.migadu.com [91.218.175.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04770606A6FC
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 20:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04770606A6FC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EEjM6lKn
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Uy/t5Hdz2eRHlZ3WuQOUva9nAZPCprYKY2wlV0ZSa2c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795204830; v=1; x=1795809630;
 b=EEjM6lKnyYmoIm6xJBfqhCuVLpbnNQUmKv2evvJ6r1RwpFiB3+kguNBYe0b34D6sq0DxD2ld
 KJgQ8rmg61bPB3sqaTswLrYXCsaEcMZGRCyEFheOBrWZP0x70b/GCi83NAJA6AzghqxRXr1ymj3
 7e3jYrpNV6lzZa+vPdVFgv0Y=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b84f8d674bfff41c;
	Fri, 20 Nov 2026 20:00:29 +0000
X-Mizu-Trace-ID: b84f8d674bfff41c
X-Migadu-Flow: FLOW_OUT
Message-ID: <ff8b63b7-b943-444a-bd37-b6fb493b5d9f@linux.dev>
Date: Fri, 20 Nov 2026 20:00:27 +0000
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
To: Ivan Vecera <ivecera@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Jiri Pirko <jiri@resnulli.us>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc: netdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
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
Content-Language: en-US
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <bdfa88fe-13bb-4050-b750-962586b1d846@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/11/2026 07:39, Ivan Vecera wrote:
> On 11/19/26 22:38, Jakub Kicinski wrote:
>> Well, I'm not convinced. The relations between objects in DPLL are
>> already quite hard to follow, and objects from one driver routinely
>> "plug" into objects from another. The explanation of the locking
>> rules in patch 9 does not look clean or clear. The driver facing
>> API needs to be much more "dummy-proof".
> 
> Fair enough. The complicated part of the rules comes exactly from
> that: a pin registered by another driver, like the zl3073x pins that
> ice registers with its TXC DPLL or uses as parents of its RCLK pins.
> A message about such a pin runs callbacks of both drivers. I have
> prototypes of the first four ways below to lock this, each with KUnit
> tests, and would like your opinion before going further.
> 
> In all of them a domain is the set of objects created with the same
> module and clock_id, dpll_lock becomes an rwsem for the topology and
> lifetime, and a mutex per domain serializes the callbacks.
> 
> A) Pin's domain (this series)
> 
>     Callbacks of a pin run under the domain of the pin, whichever
>     driver registered them.
> 
>     Pros:
>     * one domain lock at a time, so no lock order
>     * a request or a message about a pin is atomic
>     Cons:
>     * the callbacks of a foreign pin are serialized with the driver
>       that created the pin, not with the other callbacks of the driver
>       that registered it, so that driver has to protect the shared
>       state itself, and lockdep cannot check it
>     * restrictions for measured_freq_get, reference sync pairs and the
>       private data of a parent pin, which patch 9 has to explain
> 
> B) Registrant's domain, deferred notifications
> 
>     Each callback runs under the domain of the driver that registered
>     it. A message about a pin takes the domain locks one after another,
>     and notifications from callbacks are queued and sent once the
>     domain lock is dropped.
> 
>     Pros:
>     * callbacks registered by one driver instance are always
>       serialized with each other
>     * one domain lock at a time, so no lock order
>     Cons:
>     * a request or a message about a pin registered across domains is
>       not atomic
>     * the most complex core: a notification queue per domain, a lock
>       per object to keep its messages in order, and pin setters split
>       into validation and apply parts
> 
> C) Registrant's domain nested under the pin's domain
> 
>     Pros:
>     * callbacks registered by one driver instance are serialized with
>       each other and with the driver that created the pin
>     * a request or a message about a pin is atomic
>     Cons:
>     * the lock order comes from the topology, so a pin of A registered
>       with a DPLL of B together with a pin of B registered with a DPLL
>       of A deadlocks, and lockdep sees it only with a lockdep class per
>       domain
>     * a stuck foreign registrant stops the domain of the pin
> 
> D) Merged domains (your suggestion)
> 
>     Registering a pin with a DPLL or a parent pin of another domain
>     merges both domains. They are not split again.
> 
>     Pros:
>     * the rules for drivers stay as they are with the global lock
>       today, and lockdep checks them; the only new one is that state
>       shared between chips not connected by a pin needs a driver lock
>     * a request or a message is atomic
>     Cons:
>     * only hardware not connected by pins runs in parallel; on the
>       GNR-D system the zl3073x and all ice PFs end up in one domain
>     * a callback that waits for the hardware, like the planned resync
>       for up to 1 s, or for firmware still stalls all DPLL devices in
>       the merged domain
> 
> E) Global dpll_lock, slow callbacks asynchronous
> 
>     Pros:
>     * no change in the core
>     Cons:
>     * the resync problems from my previous mail, and a callback that
>       waits for firmware still stalls all DPLL devices in the system
> 
> I wrote before that stretching the domains would not improve
> anything on that system. That holds for the ToD stall I measured,
> but the zl3073x does not need to hold its channel lock across the
> edge waits. Without that, the remaining waits are the planned resync
> and output state callbacks, and with D they stall only the devices
> wired to that chip, which depend on it anyway.
> 
> So I lean towards D, as it gives drivers nothing new to get right.
> Would that address your concern, or do you see a better way?
> 
> It would be good to hear from the other DPLL maintainers as well.
> Jiri, Vadim, Arkadiusz, what do you think?

I totally agree with Jakub. Current implementation of DPLL subsystem is
over complicated, and all these complications came just to completely
model what was designed for Intel NICs, basically ice driver. But now we
are again back to the discussion how to complicate things further just
to fit what was implemented in the new generation of the same hardware.

Maybe it's time to step back and think if we really need all this, or
find simpler way to express/model things?
