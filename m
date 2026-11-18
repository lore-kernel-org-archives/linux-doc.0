Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015782;
	b=GZ3UDTGI1cy6GVoXgJ/4GMmZnZNcRDptDx3mb64QmOGmU6pxbhp+/UxrCVIbfk4wzumx
	 n1k6Wyu46uHVUOW1W/RrS28BwyF512F2PZOMcuWXIOyl3FXoUs1CM2jWnZJM86v8Jwk/D
	 NUg7flF/f6JHf+M20GkGIODEWz9VnpAQr4x3+d7t9sOgThzpw80yjWjgvVKk2GRFu7o9I
	 DJe9LKILpEQwT+5wHk/XRKK7OvQcmzDxu/9kG22lREsLqkkUAc0k8+HSXwMWLx2xSriQU
	 tO/40Gna70m9mea2kz133KfxS/oN5cIdMHEnFa1zyA27+2i4C9FKCpjRFxJQzpo5uBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015782;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=NHqDOtS0lS6doahBqLnzZLX5z8l41ywkQe6VMKR5rK0=;
	b=b9QZYJJentzk3kH9PhpRnPTFHt8LpnSwCsS5kQi6e/i8P7QnlK+iieVDDqawnGv8KZ/C
	 XfGfuVPyEINTuNfIBVA6/sUk0mHfKcHayM4lV0N9rQ7HRdxsyKsMywLJseOUtY8UV1L2B
	 yUTE19ViYpTSU2nJoSFv0q3nIV4cWWNzIz4PemqeC4/pyCOqzg946tmCD6f/eH6E9PLU7
	 tLu4Ho0YtcmOY8OKd+XfTMz/XcT9kRXKScZlFA1y6eeEtKqt83UIroYN4vAi5vUQ666tJ
	 vFoVphsCcTMnoCsEOBO+iWJDla8j4FvgsgA71XOVZVDKBp9SxUJwT29GL0Ky+BRhweQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X8pHmdt+;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B44606A31C
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 15:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43B44606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X8pHmdt+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795015781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NHqDOtS0lS6doahBqLnzZLX5z8l41ywkQe6VMKR5rK0=;
	b=X8pHmdt+77FLW4u4lVf9F8gipJBFPjjVqLDWrNzQoAL458x4Ws4F8E35g124sKDRllK1dS
	YC2iVneyCik33mE3yF2mDCO+w9eFMiKf36WZBH4kC49d7Qwz53vpKkoBW49SPz1Jm6r7sg
	I22ptSFFz5GvHqOA3yLuGPpbytZP4tI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-102-5El8isIuN3W04t7EZyFtcQ-1; Wed,
 18 Nov 2026 10:29:35 -0500
X-MC-Unique: 5El8isIuN3W04t7EZyFtcQ-1
X-Mimecast-MFC-AGG-ID: 5El8isIuN3W04t7EZyFtcQ_1795015772
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DE0341800471;
	Wed, 18 Nov 2026 15:29:31 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0E01218004FC;
	Wed, 18 Nov 2026 15:29:24 +0000 (UTC)
Message-ID: <fe1dcdd5-ef75-4231-bf9f-03bf8536c2aa@redhat.com>
Date: Wed, 18 Nov 2026 16:29:23 +0100
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
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
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
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261116181612.107a4b57@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 11/17/26 03:16, Jakub Kicinski wrote:
> On Wed, 11 Nov 2026 17:40:11 +0100 Ivan Vecera wrote:
>> dpll_lock protects topology and object lifetime, but it also serializes
>> all driver callbacks in the system, so one slow device stalls every other
>> DPLL device, whichever driver it belongs to. mlx5 callbacks issue firmware
>> commands with a 60 s default timeout, and zl3073x callbacks can wait
>> seconds on a driver lock held across ToD writes and phase steps.
> 
> Can you provide some real life data of how much this actually helps?
> Real device topology + scenario you hit?

The system is GNR-D with a dual complex E825 and a ZL30732 on the
board. The zl3073x has its own PHC, takes the recovered clocks of the
E825 ports and feeds the TX and time reference clocks of the E825. Each
ice PF connects to the zl3073x like this:

   +------------------------- zl3073x --------------------------+
   |   EEC DPLL, PPS DPLL                                       |
   |                                                            |
   |   input pin                       output pin               |
   |   (recovered clock of E825)       156M25_NAC0_CLKREF_SYNC  |
   +-------^---------------------------------|------------------+
           | parent pin                      | registered with
           | dpll_pin_on_pin_register()      | dpll_pin_register()
   +-------|---------------------------------v------------------+
   |   RCLK pin                         TXC DPLL                |
   +------------------------- ice PF ---------------------------+

The PF owning the source timer also registers the zl3073x output pin
156M25_NAC0_TIMEREF_SYNC with its TSPLL DPLL.

A step of the zl3073x PHC, which ptp4l and ts2phc do at start and after
a large offset, waits for the next 1 PPS edge, up to 1 s, with the
channel lock held. A phase step can hold it for up to 3 s while it
waits for the previous one. A dpll callback of that channel waits for
the lock under dpll_lock, and every other DPLL request and notification
in the system waits behind it. With ToD writes running, requests to an
ice DPLL took 1448 ms in median and 3.9 s at most. With the series they
took 0.2 ms and 0.3 ms, the same as idle.

The bigger reason are zl3073x callbacks we are working on, which have
to wait for the hardware themselves:

- a device reset with resync waits for the fast lock, up to 1 s with a
   1 PPS input
- a glitchless stop or start of an output completes on an output edge,
   so it takes up to one period, 1 s for a 1 PPS output

Holding the global dpll_lock for that long would stall every DPLL
device in the system. For the output state we tried an asynchronous
implementation, but then the callback returns success before it knows
the result. A failure can only be reported by a later notification, and
the next request gets -EBUSY until the change completes. With a lock
per chip the callback can simply wait, and one chip cannot do these
operations in parallel anyway.

> For the cross-domain pins - shouldn't we stretch the domain to cover
> all interconnected objects on the system instead of hoping people get
> lock ordering right? You documented some rules in the doc, admittedly,
> but not sure how enforceable and practical they are.

Stretching the domains would not improve anything here. The only
in-tree registrations across domains are the ones in the diagram above,
and every PF connects to the zl3073x, so the zl3073x and all ice PFs
would end up in one domain. The system above would then stall the same
way as with the global lock.

There is no lock ordering to get right. Only one domain lock is ever
held and all of them share one lockdep class, so any nesting is
reported. __dpll_{device,pin}_change_ntf() assert the domain lock of
the object, so a callback notifying an object of another domain is
reported as well. The rule that a callback must not call functions
taking dpll_lock holds on main already. What lockdep cannot check is
that a driver registering a pin of another driver protects the state
these callbacks share with its own ones. ice is the only such driver
and uses pf->dplls.lock for it.

Thanks,
Ivan

