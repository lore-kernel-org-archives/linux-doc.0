Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7553A9D94
	for <linux-doc@vger.kernel.org>; Thu,  9 Apr 2026 09:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775725632; cv=none; b=YSZY3VHRQESgbzDfuRLIZ1Ip7rye48eYvsusgQIK6H6+eJFzNvWQlef/u1Vn4OpCQvj4nvkvCfiwAs3Yg192bDn/QzS/eIxBaJfQKkQ4oSw+DqByfgFaDJ3Vs4GucC1L/ebZqPzgKNdGBKED2GeVy9HTqPxJaGUnWZb1FMN5OnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775725632; c=relaxed/simple;
	bh=i1wcDeZy472F2DDydaaazwer8mrmQJnIkHi3ESeJhkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qh48CZZ2X3pcOkWCNYZbAjISiQdkxXGFEIEZGfAH04vsjpDdLL4ZHoYlee1+EbOAew0cvfgoPi8W1RUp6N7ONQXW0CXe9/lCPQ5QAd1nScchUu5FaUnv5p2svvXcKuBKk6fLBuY+u8phV8A3a0teFPG8ggPfckQ9n5aZjPhRvBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pn+mLf3c; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DOd9Qscf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pn+mLf3c";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DOd9Qscf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775725629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kycERlqtaQObpK767b5Smd+ksenhEKvG6OD246qy+Uk=;
	b=Pn+mLf3cjXSAAVEcrTs4ygUKegFuyrzHBs49FhqHNQxEN7oAoZ6I/TCo54Imv3CjJM9tth
	XdyxUvVmUTowJ/qeQwEo38/UGDlHXOXDZHcrvB9k4LOjk6onw76O85X9rnMDp5DPIRAeIZ
	FPgstyt6eYqVHffK0yqo++Fqa7T3vL0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-qfWC9GDgOxSO2Uq7_tZxog-1; Thu, 09 Apr 2026 05:07:06 -0400
X-MC-Unique: qfWC9GDgOxSO2Uq7_tZxog-1
X-Mimecast-MFC-AGG-ID: qfWC9GDgOxSO2Uq7_tZxog_1775725625
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43d1dea12aaso461496f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Apr 2026 02:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775725625; x=1776330425; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kycERlqtaQObpK767b5Smd+ksenhEKvG6OD246qy+Uk=;
        b=DOd9Qscf2y/BK/0L4pi7pv+jZgDNwG72qe78wQhSZEcBkBzXYT62JQ4LgVlux5bYzS
         5O6AJbB/xHGzCDgpwOnzypzqxIqBLfdhTOloc+gguEH/mo36TDHlDiNVeTpec/IPw5NI
         oT32H4f8Kl3p88efaN7zQjZQRIW8E+xA+PGG8+ujw4QKXy3pj/vF1wOichXszSgRKDWD
         U+z0lMyt76rCTwUovMD9P/JNy7gC9t0cRSHOXgebiOBiMZ4Xubshg5khkl3FwgDcpsAt
         syTqGerLJiDGt0pnGHQp4xuVF/sOpl/sElgCoQZin5Ji10NrufmhMqBimjNtOX95gIvS
         trng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775725625; x=1776330425;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kycERlqtaQObpK767b5Smd+ksenhEKvG6OD246qy+Uk=;
        b=IjdY8+WjmHBNeAhaaLe/U61X0SEaeRfPHDbSaNVijCMBO6KVk44gbS/TJmzFYBYq9E
         hzHd0JfvbaikXc7/SRfN9+7x6F2aVw7dWvTwsZfs7etFMpCDZOXLOX+yHIEDgWp0r6EM
         c99Zb0hEkwB4k3gKnTOQBnS8TZgE8p3rVaOzQY3TUbNW7ni8cvcjOXu3PX1yHCdSCq3c
         QuV/OQPvTPO2ZQYSbbnCjweA+lGwlYQ6nVl+WTUcVnb/u9q558fd0nOTkyAtma9igbGO
         JXaSxJO93Cw7Wf7Di/IXufmqUSu+WZtOh4+Sbt19D1a2ZUKxczp3xrE7TcJC8pDriOvR
         L3VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE9sXaekjbIs3iRPWrNmzLgzhBQJox4dOcLZTnOOTUtpwKQLiYIdUKGj9g5p8YITyvVmPDvAFj870=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTnzAlYAJAR9ZEpB7LzREP4utJip+18RS3vC4I5n6LOdehD6wD
	GW50b5BBbJHT3xVYnQSQwvFO5vJe68LpiLDVqrbZsqaFNMXuExPn+l0RaEKqvkZmEzdWdwrAUy5
	mB54mTvlKC+NK+nJk4QjDUCfqkPjaFGiqJ8zA4FfnW8h+3pzsLJA9bmiGVSYahQ==
X-Gm-Gg: AeBDievIfD3amVaALP0h2TSQJ2yMi446wNDsz2sH7J4eRmcDhAsfeDFu+nag6u8vh1C
	XmEmbkxvJ2Ej4PSNj2lSAkdoiltUxMQGxchnsFnWPXoDzTzvMKwa5WqT29NOIhL5xpYu9Y5AyMc
	ptivCATE8ff3XCGAnETwHhaCJvLdDWVkNAd+F85mrTVK2LuTktxlLzGOOeNYrXFczngi/X+5caV
	u1xV06tjWpL0XnGvZEaP4EYAHYldo23/jm3cf4dnfnyb8sc7K9nKFG4ru7M2Pn3Essop6Sz4TKr
	S0ZgB76xg8dyhXiziMHD53nYEWeIbZuEBY05ywctKPOsU1xpWYXxGPPk+GTLkry1hM/mYGFg2g4
	3uNlpDiOesips5gRS/t4pwY0890LnxB06Uo4/gqVas7j8yjsZfA+dD0vz
X-Received: by 2002:a05:6000:4201:b0:43c:f976:b8ee with SMTP id ffacd0b85a97d-43d292dab19mr34931834f8f.26.1775725625139;
        Thu, 09 Apr 2026 02:07:05 -0700 (PDT)
X-Received: by 2002:a05:6000:4201:b0:43c:f976:b8ee with SMTP id ffacd0b85a97d-43d292dab19mr34931783f8f.26.1775725624581;
        Thu, 09 Apr 2026 02:07:04 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.25.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d5e969bbfsm2652991f8f.1.2026.04.09.02.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 02:07:04 -0700 (PDT)
Message-ID: <b559c877-7712-4ed7-adb4-d2b667e16e74@redhat.com>
Date: Thu, 9 Apr 2026 11:07:02 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 05/14] libie: add bookkeeping support for
 control queue messages
To: Tony Nguyen <anthony.l.nguyen@intel.com>, davem@davemloft.net,
 kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
 netdev@vger.kernel.org
Cc: Phani R Burra <phani.r.burra@intel.com>, larysa.zaremba@intel.com,
 przemyslaw.kitszel@intel.com, aleksander.lobakin@intel.com,
 sridhar.samudrala@intel.com, anjali.singhai@intel.com,
 michal.swiatkowski@linux.intel.com, maciej.fijalkowski@intel.com,
 emil.s.tantilov@intel.com, madhu.chittim@intel.com, joshua.a.hay@intel.com,
 jacob.e.keller@intel.com, jayaprakash.shanmugam@intel.com, jiri@resnulli.us,
 horms@kernel.org, corbet@lwn.net, richardcochran@gmail.com,
 linux-doc@vger.kernel.org, Bharath R <bharath.r@intel.com>,
 Samuel Salin <Samuel.salin@intel.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>
References: <20260403194938.3577011-1-anthony.l.nguyen@intel.com>
 <20260403194938.3577011-6-anthony.l.nguyen@intel.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260403194938.3577011-6-anthony.l.nguyen@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/3/26 9:49 PM, Tony Nguyen wrote:
> +static bool
> +libie_ctlq_xn_process_recv(struct libie_ctlq_xn_recv_params *params,
> +			   struct libie_ctlq_msg *ctlq_msg)
> +{
> +	struct libie_ctlq_xn_manager *xnm = params->xnm;
> +	struct libie_ctlq_xn *xn;
> +	u16 msg_cookie, xn_index;
> +	struct kvec *response;
> +	int status;
> +	u16 data;
> +
> +	data = ctlq_msg->sw_cookie;
> +	xn_index = FIELD_GET(LIBIE_CTLQ_XN_INDEX_M, data);
> +	msg_cookie = FIELD_GET(LIBIE_CTLQ_XN_COOKIE_M, data);
> +	status = ctlq_msg->chnl_retval ? -EFAULT : 0;
> +
> +	xn = &xnm->ring[xn_index];
> +	if (ctlq_msg->chnl_opcode != xn->virtchnl_opcode ||
> +	    msg_cookie != xn->cookie)
> +		return false;
> +
> +	spin_lock(&xn->xn_lock);

Sashiko says:

---
Because the cookie and opcode are checked before acquiring the lock, is
it possible for the transaction to time out, be returned to the free
list, and get reallocated for a new message before the lock is acquired?
If that happens, could the old delayed response falsely complete the
newly allocated transaction since the identifiers are not re-verified
inside the lock?
---

> +/**
> + * libie_xn_check_async_timeout - Check for asynchronous message timeouts
> + * @xnm: Xn transaction manager
> + *
> + * Call the corresponding callback to notify the caller about the timeout.
> + */
> +static void libie_xn_check_async_timeout(struct libie_ctlq_xn_manager *xnm)
> +{
> +	u32 idx;
> +
> +	for_each_clear_bit(idx, xnm->free_xns_bm, LIBIE_CTLQ_MAX_XN_ENTRIES) {

Sashiko says:

---
This iterates over the bitmap without holding the lock. Concurrently,
other paths modify this bitmap using non-atomic bitwise operations like
__clear_bit() and __set_bit() under the lock. Will this cause torn reads
or data races that might lead the timeout handler to skip valid
transactions or examine invalid ones?
---


> +		params->ctlq_msg->sw_cookie = cookie;
> +		params->ctlq_msg->send_mem = *dma_mem;
> +		params->ctlq_msg->data_len = buf_len;
> +		params->ctlq_msg->chnl_opcode = params->chnl_opcode;
> +		ret = libie_ctlq_send(params->ctlq, params->ctlq_msg, 1);
> +	}
> +
> +	if (ret && !libie_cp_can_send_onstack(buf_len))
> +		libie_cp_unmap_dma_mem(dev, dma_mem);

Sashiko says:

---
When libie_ctlq_send() fails here, the DMA memory is unmapped and the
buffer is freed by the caller. However, the software tracking ring at
tx_msg[next_to_use] still contains the populated send_mem details and a
non-zero data_len.

During driver teardown, libie_ctlq_xn_send_clean() is invoked with
params->force = true, which processes the ring without checking the
hardware completion bit. Could this cause the cleanup routine to process
the failed slot again, resulting in a double-free and double-unmap?
---

There are more remarks on the following patch, please have a look.

Also, it would be very helpful if you could help triaging such
(overwhelming amount of) feedback on future submissions, explicitly
commenting on the ML. Sashiko tends to be quite noise on device driver code.

Thanks,

Paolo

