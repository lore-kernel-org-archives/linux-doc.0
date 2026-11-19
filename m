Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091368;
	b=ROEBJ1FgUzI/FuLOXT9tIIX6/77W8NMV/hnq2wsLpu25QjfIqXy3S5N99GlTwQyEgjSM
	 PBJLRAOx1OulBFw4zeX46y4Y2jZ2dAwYq5Ruxog2sIKo8fOExHeNrAQA+OS9J0W49OmLg
	 Qi5HbCcMOdE0FQ6tf8gIrpl//JjPsGjsYX1JTaD+nOZM1zSWbCjwfGrFE2sA+qKZzxtwY
	 1+jFHkcu3Wj4WSWLEMYa3GWhwr3aKceguU3lrbY0PRSYwfHrIMouRiNvy1H9UFOgKFQMV
	 JEKOrwRc2YqtbrXViAPrKsGht7eb6ePMxeLCd/EKpjfkjKYaIqnuAZ7MuMNbwTVPcFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091368;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=26aI3dIJvKPWaIP7OH1UV6UOwwhdI4DXg4en2db6lzQ=;
	b=S1cbCDyRjJ0IJrq+MifpTQRvRfSJ8EUkF+pX/nA23Dnrfl7oRO4p5UH0zYldU1UWWiH0
	 Us6A6/mAtwkFEWKzqfbPDaJApHtBs2rREnezZAb7QLTvZUky5iEYwq+nUj36Xrl691jzt
	 siTNmpAQmDf6wkIb8g6SV/HfAlmnoBbAp7tXa5NSM74Q36mRIQaMMgyLGoWW0XTOoBvSc
	 wy5wPK6/D9Jv2dlqg0VmBKU0rg71tjxvputdc0msK6gJvunTXfcIyVtzLt7k2SOq7llkv
	 Yh5bcGfl6A6tnqPopArGyMKmMM8ngUk+2NyGZqH37Bj9Y5CsM2IRCKtsM4fnVzmUq0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qwvjdhwo;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC7B606A325
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 12:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DC7B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qwvjdhwo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795091367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=26aI3dIJvKPWaIP7OH1UV6UOwwhdI4DXg4en2db6lzQ=;
	b=QwvjdhwoYLrEjlxEGhw/gc5/SyMLpCSRyx+9ekcUm049pZaeKMe3pbF1ti7UYdiew8YMky
	KIbaKH/dPE1zc3ghjcRg5zgWrvrh7WaEr3+352GdidRzN9xiTEQsj988gV1hxqH1xeSigh
	2EYTPT+q0WcddZ8u8QC54vBLhsq1aQA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-668-F6N0bqgfOKGGCYzO7xJ5Cg-1; Thu,
 19 Nov 2026 07:29:23 -0500
X-MC-Unique: F6N0bqgfOKGGCYzO7xJ5Cg-1
X-Mimecast-MFC-AGG-ID: F6N0bqgfOKGGCYzO7xJ5Cg_1795091360
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C195218004DF;
	Thu, 19 Nov 2026 12:29:19 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BEA221956041;
	Thu, 19 Nov 2026 12:29:12 +0000 (UTC)
Message-ID: <dd1d61d7-7bef-4a02-8518-e17d2f50369f@redhat.com>
Date: Thu, 19 Nov 2026 13:29:11 +0100
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
 <fe1dcdd5-ef75-4231-bf9f-03bf8536c2aa@redhat.com>
 <20261118174424.32e9f130@kernel.org>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261118174424.32e9f130@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 11/19/26 02:44, Jakub Kicinski wrote:
> On Wed, 18 Nov 2026 16:29:23 +0100 Ivan Vecera wrote:
>> A step of the zl3073x PHC, which ptp4l and ts2phc do at start and after
>> a large offset, waits for the next 1 PPS edge, up to 1 s, with the
>> channel lock held. A phase step can hold it for up to 3 s while it
>> waits for the previous one. A dpll callback of that channel waits for
>> the lock under dpll_lock, and every other DPLL request and notification
>> in the system waits behind it. With ToD writes running, requests to an
>> ice DPLL took 1448 ms in median and 3.9 s at most. With the series they
>> took 0.2 ms and 0.3 ms, the same as idle.
>>
>> The bigger reason are zl3073x callbacks we are working on, which have
>> to wait for the hardware themselves:
>>
>> - a device reset with resync waits for the fast lock, up to 1 s with a
>>     1 PPS input
>> - a glitchless stop or start of an output completes on an output edge,
>>     so it takes up to one period, 1 s for a 1 PPS output
>>
>> Holding the global dpll_lock for that long would stall every DPLL
>> device in the system. For the output state we tried an asynchronous
>> implementation, but then the callback returns success before it knows
>> the result.
> 
> Right, for these level of waiting async seems like the right direction,
> at least naively/without knowing the HW.  Why does the device wait until
> PPS to apply the step change? Is the programmed time supposed to
> correspond to the pulse?

Yes. The device has no immediate ToD write, it can only write the ToD
on the next internal 1 Hz edge, the next input sync edge or the next
internal 0.5 Hz edge. The written value is the time at that edge, so
the seconds stay aligned with the 1 PPS outputs.

Looking at it again, the zl3073x holds the channel lock while it waits
for the edge, although the dpll callbacks do not touch the ToD, TIE or
phase step registers, and they already run while the device applies
such an operation, because the PTP ops return right after issuing it.
I will look at narrowing the lock in the driver.

For the resync, async is not only about reporting the result. Fast lock
is a setting of the DPLL, not of a reference, and forcing it makes the
DPLL ignore its frequency and phase error monitors. While an
asynchronous resync is pending, everything else done to the DPLL runs
in forced fast lock. A reference switch, whether from a priority or
state change, a manual reference or the device itself in automatic
mode, would follow the fast lock phase rate instead of the configured
phase slope limit, and the resync would then report success on another
reference. A switch to NCO would keep the force bit set until the work
clears it. So every request changing the DPLL configuration would have
to fail with -EBUSY, cancel the resync, or wait for it. With a lock per
chip they simply wait, for at most 1 s.

>> A failure can only be reported by a later notification, and
>> the next request gets -EBUSY until the change completes. With a lock
>> per chip the callback can simply wait, and one chip cannot do these
>> operations in parallel anyway.
> 
> Do the failures only happen because of "unforeseen circumstances" / EIO,
> or there may be more common errors reported? If it's just the former
> a devlink health reporter could be an option.

For the output start and stop, only EIO. The device does not report a
stopped output and the driver can only wait for one period, so a health
reporter would work there.


For the resync, no. The wait ends with -ETIMEDOUT when the DPLL does
not enter fast lock, for example because the selected reference lost
its qualification in the meantime. That is a result of the input
signal the user needs in the reply, not a device fault.

Beyond the zl3073x, with the global lock any callback that waits for
its device, for example an mlx5 firmware command with its 60 s timeout,
stalls the DPLL devices of every other driver in the system.

Thanks,
Ivan

