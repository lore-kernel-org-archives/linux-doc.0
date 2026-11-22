Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362853;
	b=CkyR5l+IoeZxFNe93R9BDwmuE6RF+GDGO0DK9CXMoxScD0QkNHqZS6t0gKTZWNKIwh9T
	 2LZ66Ob9G81Wi89auid+o7oi5nPVKXFUQDp3EOhR9zYOJVIEKx3wj6ONn43nCv6N37HIm
	 IQloUUXgu2s0yFwAm/W00LcG0QCLbf8kIVi2hGH4TBn1AWndq5vQW8INMe44GtAYpaQkt
	 b9AX2NKtKYerlU/d8e2nsqxPIqtApoT9dVf5rkIKBt6z6HFylZbH8z4wWGotR60Swp8K5
	 tMS1P9GV/Uhd2lX0JZu2mI0oml3Bn9fX6Lv0ySOXxjRNxyVDbtZqEL3KICgysD4lxtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=oAH/5Ektz81ojOZdHN4K4NLybO43vkB7oJL3F3Dgs+c=;
	b=HQm4uVuJ/IfR6gPhC5ea7zjL85WoKTp+L4pxy2yZ5cd8OHcax82QU/am48D1UZn/rXcw
	 AZEzkmqZvKSxcg0CMuUnmj9MypxYqJVHZFONXeOoU0cQM76jPWp8c5d0G8xOXI07bYedv
	 ZInwQaENLDYs9wWM/3NRPjS/VktzKpDW69u29jx5lqmXp7X/hNihAq9XQjkxvFXcVQBER
	 f5kZyUAsLZzaJhlhd8YrNirOX4P/9w1nNJBO5UJbnVgsYf5fcrlRjzlJbUaVazantTuX4
	 rrvdiS/JJOUh1nlfXr9T0Vt3Q60xWq0ebtDF88/sjOJzP6Q09e//DB04bDLEfBV1rBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=LFzAgprE;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F250B606A32A
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 15:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F250B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=LFzAgprE
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a357b1c649so1458667f8f.3
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 07:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1795362850; x=1795967650; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oAH/5Ektz81ojOZdHN4K4NLybO43vkB7oJL3F3Dgs+c=;
        b=LFzAgprEXvV7qN0PQPj7ld69lD/xcWYp4wpu3Y9tNDc7EmwuE8oE382/mwCFKL3Acx
         3ZNQ5KrRc20+JObyi2/7Ryuo3LdqqQCS1DrXMwy/VU82dQiablkt7wUoQyV2lDwtDG8q
         kxWJaq0a8ZrO3HepNPwmBJePlMvULyld6DxFAE7lxr4O8YmM/XkH95Yll53iRIaD9/kn
         ASd9WBeqet6CwARCTt9ChvSNv/T/7iapK6Fy/EMLRj/OTiaso+GsZZ0S0i05GJHflgkB
         vVLjtuXq3L7G74hIDXCxjEK/zrldn9noodIgVxstZMEwI9jUEohc3nCOiCTQDwyatjgx
         liuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362850; x=1795967650;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oAH/5Ektz81ojOZdHN4K4NLybO43vkB7oJL3F3Dgs+c=;
        b=lh46J5QkfL52F0C8tzxdkOnpBeXzR0EAV5MoODPhm1v5P0k4I3I9Asutb/XbekdAzk
         lbRlcTJ+EIbY+NLyE0I8oXDg77mmBxyr5adgr2kl3oajh3ViKoxv1BRews2eYWofx0lk
         CIJ6eJN/V4WRyfBXj1MQ4Ka83YZN0FHN1LsyEXrSr9ITfvOqJp2IJ+bvM33f2lqbxY1v
         n1abgxIQZwMSCLSSr+q+twxokeQeKAsj9AG6nQnlgGcyt52StfwzaFdtrGIrOwuhAnrw
         1f9ZNLsZvLUWYAucfnmJniPlyqbGEoajYKYajmu9R8xHgZrNJIgJRoh0ZkQXYPh0yZ0V
         T6Cw==
X-Forwarded-Encrypted: i=1; AL+hErFjrLuPN++g34XkZCC9wHHqX6uayLddV8mpN3rn1E9GT9t8FYWB7AqZzUrCenKNbXlT9SSDNDQHz1c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4Xwlfl/st0ppnHiusSNltu3zObkMKfO4ea5DqGXHw/pzm0iGb
	9hPKa/u8bTLEGGYbBWWyt3UaiQG7P5erPcEwSIsNOzFDWiye7GPVBahVxXtOgyXNHCw=
X-Gm-Gg: AZFdTZcajpbRrx2mvZkB8iNTgF+qIuN3dJGjZhpnL/S9iDSfjElEqF8bgfjzDduWm9W
	1y369qtNgzLni0gPWcQdNuzTCsxcTP3cybqKuj7XsAJeRJ9rn4YzhmR6DMFmpyqdPpDwQg6hRpT
	O1Mw3d457bhNilBFpg3Px4+5sIfNrf6cQrumADJMHVOwlpLpqTi6MF5Eoqy4Y4X6aFforGb9mTj
	XZAJE7pMqADpEurZI//EN3OU0uUFB3lXyq1hF6+fi0lwmyg3fsqp3Z53RPC8HGO31xY1xBUn7jU
	VDVkPH5vpg9cfAwqbtuQfC6qK+TMOGyaY51JNAolyhwlKq17WvZKhInQPcwmsfQg2w9cBIFCXMi
	ip7noWNLyTDbafFJWI6fkrxwo2Sus4RdrU1O80uHcixa1SrE1C1wRhwG1KQVN6pVYiunFCw0Hrs
	WKhcCL3lnLsXoxNhx78SaxaeNlOfmPDTgFL/hbaWnnAkCr/sOt6MK7ihrnKACW9JzWsHJJHO/Cd
	G+egvUZ9EjiaySvYkqEWAlL9a8gAf1AA6g61dTyg6C/BZllZrj429SbWLaxwJMGy+NzXNnBTyHo
	LvW7hfCMtDsYgoeikQnam4gy8NAYIwlQTQUyOA==
X-Received: by 2002:a5d:64c9:0:b0:4a7:69c3:94d5 with SMTP id ffacd0b85a97d-4abb0e469cfmr16973589f8f.28.1795362850015;
        Sun, 22 Nov 2026 07:54:10 -0800 (PST)
Received: from localhost ([128.77.52.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm18394509f8f.11.2026.11.22.07.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:54:09 -0800 (PST)
Date: Sun, 22 Nov 2026 16:54:05 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Ivan Vecera <ivecera@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, netdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Min Li <min.li@microchip.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	Grzegorz Nitka <grzegorz.nitka@intel.com>, Karol Kolacinski <karol.kolacinski@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, Petr Oros <poros@redhat.com>
Subject: Re: [PATCH net-next v2 0/9] dpll: do not serialize driver callbacks
 under global dpll_lock
Message-ID: <awMP9Gj3Xhia0ZeI@FV6GYCPJ69>
References: <20261111164021.273409-1-ivecera@redhat.com>
 <20261116181612.107a4b57@kernel.org>
 <fe1dcdd5-ef75-4231-bf9f-03bf8536c2aa@redhat.com>
 <20261118174424.32e9f130@kernel.org>
 <dd1d61d7-7bef-4a02-8518-e17d2f50369f@redhat.com>
 <20261119133851.3f25074c@kernel.org>
 <bdfa88fe-13bb-4050-b750-962586b1d846@redhat.com>
 <ff8b63b7-b943-444a-bd37-b6fb493b5d9f@linux.dev>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff8b63b7-b943-444a-bd37-b6fb493b5d9f@linux.dev>

Fri, Nov 20, 2026 at 09:00:27PM +0100, vadim.fedorenko@linux.dev wrote:
>On 20/11/2026 07:39, Ivan Vecera wrote:
>> On 11/19/26 22:38, Jakub Kicinski wrote:
>> > Well, I'm not convinced. The relations between objects in DPLL are
>> > already quite hard to follow, and objects from one driver routinely
>> > "plug" into objects from another. The explanation of the locking
>> > rules in patch 9 does not look clean or clear. The driver facing
>> > API needs to be much more "dummy-proof".
>> 
>> Fair enough. The complicated part of the rules comes exactly from
>> that: a pin registered by another driver, like the zl3073x pins that
>> ice registers with its TXC DPLL or uses as parents of its RCLK pins.
>> A message about such a pin runs callbacks of both drivers. I have
>> prototypes of the first four ways below to lock this, each with KUnit
>> tests, and would like your opinion before going further.
>> 
>> In all of them a domain is the set of objects created with the same
>> module and clock_id, dpll_lock becomes an rwsem for the topology and
>> lifetime, and a mutex per domain serializes the callbacks.
>> 
>> A) Pin's domain (this series)
>> 
>>     Callbacks of a pin run under the domain of the pin, whichever
>>     driver registered them.
>> 
>>     Pros:
>>     * one domain lock at a time, so no lock order
>>     * a request or a message about a pin is atomic
>>     Cons:
>>     * the callbacks of a foreign pin are serialized with the driver
>>       that created the pin, not with the other callbacks of the driver
>>       that registered it, so that driver has to protect the shared
>>       state itself, and lockdep cannot check it
>>     * restrictions for measured_freq_get, reference sync pairs and the
>>       private data of a parent pin, which patch 9 has to explain
>> 
>> B) Registrant's domain, deferred notifications
>> 
>>     Each callback runs under the domain of the driver that registered
>>     it. A message about a pin takes the domain locks one after another,
>>     and notifications from callbacks are queued and sent once the
>>     domain lock is dropped.
>> 
>>     Pros:
>>     * callbacks registered by one driver instance are always
>>       serialized with each other
>>     * one domain lock at a time, so no lock order
>>     Cons:
>>     * a request or a message about a pin registered across domains is
>>       not atomic
>>     * the most complex core: a notification queue per domain, a lock
>>       per object to keep its messages in order, and pin setters split
>>       into validation and apply parts
>> 
>> C) Registrant's domain nested under the pin's domain
>> 
>>     Pros:
>>     * callbacks registered by one driver instance are serialized with
>>       each other and with the driver that created the pin
>>     * a request or a message about a pin is atomic
>>     Cons:
>>     * the lock order comes from the topology, so a pin of A registered
>>       with a DPLL of B together with a pin of B registered with a DPLL
>>       of A deadlocks, and lockdep sees it only with a lockdep class per
>>       domain
>>     * a stuck foreign registrant stops the domain of the pin
>> 
>> D) Merged domains (your suggestion)
>> 
>>     Registering a pin with a DPLL or a parent pin of another domain
>>     merges both domains. They are not split again.
>> 
>>     Pros:
>>     * the rules for drivers stay as they are with the global lock
>>       today, and lockdep checks them; the only new one is that state
>>       shared between chips not connected by a pin needs a driver lock
>>     * a request or a message is atomic
>>     Cons:
>>     * only hardware not connected by pins runs in parallel; on the
>>       GNR-D system the zl3073x and all ice PFs end up in one domain
>>     * a callback that waits for the hardware, like the planned resync
>>       for up to 1 s, or for firmware still stalls all DPLL devices in
>>       the merged domain
>> 
>> E) Global dpll_lock, slow callbacks asynchronous
>> 
>>     Pros:
>>     * no change in the core
>>     Cons:
>>     * the resync problems from my previous mail, and a callback that
>>       waits for firmware still stalls all DPLL devices in the system
>> 
>> I wrote before that stretching the domains would not improve
>> anything on that system. That holds for the ToD stall I measured,
>> but the zl3073x does not need to hold its channel lock across the
>> edge waits. Without that, the remaining waits are the planned resync
>> and output state callbacks, and with D they stall only the devices
>> wired to that chip, which depend on it anyway.
>> 
>> So I lean towards D, as it gives drivers nothing new to get right.
>> Would that address your concern, or do you see a better way?
>> 
>> It would be good to hear from the other DPLL maintainers as well.
>> Jiri, Vadim, Arkadiusz, what do you think?
>
>I totally agree with Jakub. Current implementation of DPLL subsystem is
>over complicated, and all these complications came just to completely
>model what was designed for Intel NICs, basically ice driver. But now we
>are again back to the discussion how to complicate things further just
>to fit what was implemented in the new generation of the same hardware.
>
>Maybe it's time to step back and think if we really need all this, or
>find simpler way to express/model things?

Agreed.

