Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313549;
	b=Y98GgxiowcUwJVPiTo/qi/rxBElktpApvC2KwOqUX8JS6P/3ozJpNcUKJaaDBXyph1Dk
	 U5DeTbTv06wP8vis0B+ajfQgc+Xx/Dv+75g+Bw4eEjNUC8Be9aJNNPxjlz1pBNmeB75P+
	 6Dyhv3zNxagzfAu334x/RPWOSGN5gbksduCu6tOLgxBMvNu4zZhu1924CMTFlckWDxqL+
	 Bpw+eG6VYShBdLpQw7aRIy6IlLjnO8RNuQag3r3QpuG938+geY41E5cFtAw+h/MH/bCl+
	 GxRnD21HhbQbZhAXySirN8KxJ1NJUaw9d+wFNcJq+DQZe0DUB7WkwPRTt9CL/aFaxag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313549;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2z9Dq46PGzc1DYcTmA3bznslu78oudIXu01vR14qyUQ=;
	b=ct9btQinRaSIH3ePQUhaP1N+QiDZiaBGCTOYA0PtZNBC8CGtUVeS4mvqDvecy1akzc7D
	 eJ+M45UGPbVfh2qcfbjP9FioNt8CgO/pF2xhQV66nB6i/t8muAKbBlGP6hBOL6T/gC07C
	 yCzsmAOQVcPuOXKJlXjXvHXdB/5JTiuTBJOB79wdY1Js0z2SvsqgGimCsDWMDlC0b2Js6
	 dbOrGrJikuxCHs+XQgMXjn6MGDpy6YFH6bdoP3WamPvJwXDfwInDIqbcBXq9J41X4yRLF
	 fPHdIOV/atrbIgW8+MiKHsBJ409aZ4L1abTzjnqnxSzwYsGMSCFPf4G9FQA1erWV50A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hIBLyuSZ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AfeKsHM6;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D6F606A325
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 12:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46D6F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hIBLyuSZ;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AfeKsHM6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794313548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2z9Dq46PGzc1DYcTmA3bznslu78oudIXu01vR14qyUQ=;
	b=hIBLyuSZmBPf+Pv0AGd16NxIq9NSp5f9bxJSyqqxB7dF5aqZvBOI7MyQ0LugBpBe7KQdrE
	KtBWoeRukKyIMEdFYMCzUL3S4EeeQgSYh6Snr56D2XTjZLSPyVChQ4RfYKZyFNAclX9+5x
	Z5peaTxvr4U5iv0DXtohphJhUBq21i0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-_mlanUhxO5G96AxgXBNqmQ-1; Tue, 10 Nov 2026 07:25:46 -0500
X-MC-Unique: _mlanUhxO5G96AxgXBNqmQ-1
X-Mimecast-MFC-AGG-ID: _mlanUhxO5G96AxgXBNqmQ_1794313546
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e0389d6f9so1421190f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 04:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794313545; x=1794918345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2z9Dq46PGzc1DYcTmA3bznslu78oudIXu01vR14qyUQ=;
        b=AfeKsHM6C8MWJB45WMqPOmdAOipH1qlYxyu7+E3KKQXo8Wm7dSwjUfdntfy8cvUDaS
         bYIHd1LV6S2glpKy8TpYZJmUOfyHCv/HCfDc/RocUXtyTP91ZRqaAEVZuXBose98x8cD
         LCywM8hz0dOjX4qQJv3Lur07xIkvxMSzFNq+sBPS0645NZ4jSdQyu6UhqerhZFf9vUKo
         lV75BZjMvtX0se34MTeSbmeEmqODKkHAbsS4Hywwo+S2PmU6MqekKqn4yYbaJOEvCGqG
         7wk4Ee79ez8h+oaUfRuejOftkwdBtBBDb5TCkqoLXUVt3Y7m9D6UWpItVSG40LKWn3Yq
         EByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313545; x=1794918345;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2z9Dq46PGzc1DYcTmA3bznslu78oudIXu01vR14qyUQ=;
        b=hT5/llzWHRyzuucaz2eU/avBw6p4gIDNN9wzBk0yQGdiihgbADp342788MbXy1MdU6
         0DMsfBgx64EpwWE/3beq/v74w7wrStIcwCAofwywbSNaBZ7lDf/g4a0Bej3Iwo3xQSGA
         J9P9dVaKwaOCQbgarZPpf5TXgNOUi7bEMUIQTUQ1rBGkddD5r40FaigMztUgGrxM3kDe
         0PGbKt3kjKYZ3EPQhmY3Q/d/q1JMo9dRxeIDACS78djr9hYpb/TchBk2KpuLRorQRqjP
         Y/Lrid9vtY5qheK4kYq8UES9yNW5GZY8KPteIsMRGx/uBSODFjy/O2EkBr3SkMMaB0Jg
         MJ9g==
X-Forwarded-Encrypted: i=1; AL+hErH0nOp0dqOAhXKHwsrofp8R23uqOPFPT3wdTzJ4pMl+FyABsYy/EkQozeR/hpbOSuUBCrjTaB+zRyI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Rl16zeZq8CQsCo/dqlqqbPxaNmgKdYfPtWLfw8zfcJDi49hKW
	wcuDzaDuIp2V3PONzfCm4V3Fw3JRelVnBgQOijrd/owkfDK2FuwcUmx3mUas9RMlENuDTukIBqm
	7Y/dzR12wNEfKNlfyYHqpsB4l9tkS0rXynou/Jf2t9rv7lkB+/do/OQyA4E/Pdg==
X-Gm-Gg: AYBFou0io78u4a0Rr+jKIl6gamx0xqdm1ikKUBTsUFXikR4/rpqwmBAjHv4eCQMCZ1N
	rxM5w1btOVsra6zfBYoYv66LsK2nOL6rrR9bO2+zo5J+UtfEOn+sLwk7OMAPq4XgQ+BIvcsaP2Z
	XlcMuarpgSjFtl06yu0fLSZAEC62zqMOzPHzZ2b0rxDUkI37PN6C2qD1rXAQxQvn0DCp/iraAr5
	lfX9h1AfkmMzhjtGfNUNXnMUEQwI7bYTj3w7n0fsys5WVTWODQwPe4vLnpVktBGBrffvLxVCVUm
	myySD7T6DJapKRNn451kVEqyTyw58uE4HQUA5eq1cmeZOj0e9d9ujZAA8j8EW3N7FEfDVWUcffC
	uX6I9zb2p9BF4aiz0ThstW3vBDF+kY5ec4po=
X-Received: by 2002:a05:6000:29d2:b0:498:88f:14c8 with SMTP id ffacd0b85a97d-4982fb52546mr2653575f8f.9.1794313545517;
        Tue, 10 Nov 2026 04:25:45 -0800 (PST)
X-Received: by 2002:a05:6000:29d2:b0:498:88f:14c8 with SMTP id ffacd0b85a97d-4982fb52546mr2653511f8f.9.1794313545005;
        Tue, 10 Nov 2026 04:25:45 -0800 (PST)
Received: from [10.43.3.161] ([213.175.37.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4989a2a505asm3264342f8f.13.2026.11.10.04.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:25:43 -0800 (PST)
Message-ID: <f73146cb-fcbb-4263-90d9-b5378faf30f7@redhat.com>
Date: Tue, 10 Nov 2026 13:25:41 +0100
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
Subject: Re: [PATCH net-next 10/10] dpll: document locking rules
Content-Language: en-US
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Min Li <min.li@microchip.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 Grzegorz Nitka <grzegorz.nitka@intel.com>,
 Karol Kolacinski <karol.kolacinski@intel.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>
References: <20261106121005.1327603-1-ivecera@redhat.com>
 <20261106121005.1327603-11-ivecera@redhat.com>
From: Petr Oros <poros@redhat.com>
In-Reply-To: <20261106121005.1327603-11-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/6/26 1:10 PM, Ivan Vecera wrote:
> Describe the lock levels of the subsystem, which domain a callback runs
> under and the rules device drivers have to follow.
> 
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> ---
>   Documentation/driver-api/dpll.rst | 44 +++++++++++++++++++++++++++++++
>   drivers/dpll/dpll_core.c          |  9 +++++++
>   2 files changed, 53 insertions(+)
> 
> diff --git a/Documentation/driver-api/dpll.rst b/Documentation/driver-api/dpll.rst
> index 7c117ae37cc1bc..40d5037ff3bb0f 100644
> --- a/Documentation/driver-api/dpll.rst
> +++ b/Documentation/driver-api/dpll.rst
> @@ -675,6 +675,50 @@ In the error path we have to rewind every allocation in the reverse order:
>   
>   More complex example can be found in Intel's ICE driver or nVidia's mlx5 driver.
>   
> +Locking
> +=======
> +
> +The subsystem uses two levels of locks, always taken in this order:
> +
> +- ``dpll_lock`` protects the topology of dpll devices and pins and their
> +  lifetime. Functions changing the topology, for example dpll_pin_register(),
> +  take it for write and send the create and delete notifications under it.
> +  Netlink requests, each part of a dump and change notifications take it for
> +  read for their whole duration.
> +- A domain lock serializes driver callbacks. All dpll devices and pins created
> +  with the same module and ``clock_id`` belong to one domain, in practice to
> +  one chip or card.
> +
> +A netlink request addressing a device or a pin by its ID holds the domain lock
> +of that object from start to end. A notification holds it while its message is
> +built and sent, so messages of one object are sent in the order they were
> +built. Only one domain lock is held at a time, so domains have no lock order,
> +and callbacks of different domains can run concurrently.
> +
> +Callbacks of a dpll device run under the domain of the device. Callbacks of a
> +pin run under the domain of the pin, whichever driver registered them:
> +
> +- A driver registering a pin of another driver with its dpll device has these
> +  callbacks serialized with the driver that created the pin, not with the other
> +  callbacks of its device, so it has to protect the state they share by itself.
> +  A callback stuck in such a registration stops the domain of the pin.
> +- The parent pin of a pin registered with dpll_pin_on_pin_register() and its
> +  dpll devices can belong to another driver, so the callback must not
> +  dereference their private data.
> +- The frequency monitor belongs to the dpll device, so only callbacks of a pin
> +  of the same domain registered with dpll_pin_register() can include
> +  ``.measured_freq_get``.
> +
> +Device drivers have to follow these rules:
> +
> +- A callback must not call dpll_device_change_ntf(), dpll_pin_change_ntf() or
> +  any function changing the topology.
> +- A callback notifies about objects of the domain it runs under with
> +  __dpll_device_change_ntf() or __dpll_pin_change_ntf(). Other objects have to
> +  be notified from a context that holds no domain lock, for example a work item.
> +- A driver must not call dpll_device_change_ntf(), dpll_pin_change_ntf() or any
> +  function changing the topology while holding a lock that its callbacks take.
> +
>   SyncE enablement
>   ================
>   For SyncE enablement it is required to allow control over dpll device
> diff --git a/drivers/dpll/dpll_core.c b/drivers/dpll/dpll_core.c
> index 84377f8ba16036..6ad40fb9eee855 100644
> --- a/drivers/dpll/dpll_core.c
> +++ b/drivers/dpll/dpll_core.c
> @@ -932,6 +932,10 @@ __dpll_pin_register(struct dpll_device *dpll, struct dpll_pin *pin,
>    * @ops: ops for a dpll pin ops
>    * @priv: pointer to private information of owner
>    *
> + * The callbacks run under the domain of @pin. If @pin belongs to another domain
> + * than @dpll, they are not serialized with the callbacks of @dpll and @ops must
> + * not include .measured_freq_get.
> + *
>    * Context: Acquires dpll_lock and domain locks
>    * Return:
>    * * 0 on success
> @@ -1049,6 +1053,11 @@ EXPORT_SYMBOL_GPL(dpll_pin_unregister);
>    * Register a pin with a parent pin, create references between them and
>    * between newly registered pin and dplls connected with a parent pin.
>    *
> + * The callbacks run under the domain of @pin. The parent pin and its dplls can
> + * belong to another driver, so @ops must not dereference their private data.
> + * The frequency monitor belongs to a dpll, so @ops must not include
> + * .measured_freq_get.
> + *
>    * Context: Acquires dpll_lock and domain locks
>    * Return:
>    * * 0 on success
Reviewed-by: Petr Oros <poros@redhat.com>

