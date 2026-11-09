Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232758;
	b=cR9wNcq2AbqxTz42CnerCfs9okfrP67ZXvEddFwss3G97WKx+Fk2voViMWmd28i3jzBT
	 RPCJML+kEniE/qwA0/lPNCX6EL90d4lzkfJ3RkLzxHDyhvQSXV0CXydCFDrifU7dXYhKU
	 MXw8MqxDDwKIIqj/JpJVId8YZd8FHpylZvoIWGKdqAfp9ZrwOsDT3RmU3vbRjq3E0Trnt
	 pl7l1Z60Qtjy4crVrd9nme8cxqwYpxVbWiWgw6MTxEfXSG4eXbnSe6CKlKmzuKlLGKAXq
	 p3OJwwW+muDoiDA2rIGJg9ujw5la6Ng3Pd4nyvregGzvCQEIvGYmlkWbtZXniZFPcUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232758;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=rmia3lk20jJh1PWPjWm3Ho3gUz8aRFvWjkbxYskzvXA=;
	b=r98NJZJl8mYKuwFlnRKaP5hAJGWKcB7MhS0bVaOHynAGw9nvAc8V++JSfJVVIu0n6Ola
	 6HqCgJvamGBjUFsSR/0fcVJulDWo+vq/iW8bsi25FDplXThbi6yDVpk6KGVr1PBNBs7nY
	 tgnEjca7tFBFvHUMFPvyP88J9slsDI2ygeCaBEAo9Hn1yeFhiXvxcyDXjZhcOCkLxDPou
	 Qifcpm4umiN8VjXzTclTxSqu8sKhU2N46h5K3+c/Tk2QgYfuuGWDYKR224PxVAVP3WMqn
	 fzohQWjalfAHtqsT2SoP/5m87EhOAT3d/1NvOb0R7qRpf1hpBH5wpsvxMfTuKCv0sOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bXtJgKSa;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16610606A323
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 13:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16610606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bXtJgKSa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794232757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rmia3lk20jJh1PWPjWm3Ho3gUz8aRFvWjkbxYskzvXA=;
	b=bXtJgKSaKFtxYLzqN00V5wP6k9xHdIrRx4lN23Ycd1J2agqzCO0ZAaUMlxOEjqygosOg/n
	MY5gMWdGkZ2peTTVKzsavRHj9RuiK/prSlshY6M849XxRn2qYaWvCxfhgvAidgX1Y3Rj0B
	ATDIWiSNnHjNxSqIQv7EsLX9EZ8kQno=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-DCeI1pAsPPG96shY1YsNqQ-1; Mon,
 09 Nov 2026 08:59:13 -0500
X-MC-Unique: DCeI1pAsPPG96shY1YsNqQ-1
X-Mimecast-MFC-AGG-ID: DCeI1pAsPPG96shY1YsNqQ_1794232751
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EBD331956058;
	Mon,  9 Nov 2026 13:59:10 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 78AA639213;
	Mon,  9 Nov 2026 13:59:06 +0000 (UTC)
Message-ID: <d39fa2c3-8781-4a88-a8fe-65f6e55c9445@redhat.com>
Date: Mon, 9 Nov 2026 14:59:05 +0100
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
Subject: Re: [PATCH net-next v3 05/14] dpll: dpllsim: Add support to set input
 pin state
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
References: <20261109093523.931201-1-poros@redhat.com>
 <20261109093523.931201-6-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261109093523.931201-6-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On 11/9/26 10:35, Petr Oros wrote:
> Add support for setting the state of input pins on the device.
> Implement the state_on_dpll_set callback for input pins and advertise
> the state-can-change capability for them, so that userspace can move a
> pin between the states valid for the device mode. The core checks the
> capability only, the states a mode allows are up to the driver: in
> automatic mode a pin is selectable or disconnected, in manual mode
> connected or disconnected, as Documentation/driver-api/dpll.rst
> describes them. The device reports automatic mode, so connected is
> refused with -EINVAL and an extack message. The check is written for
> both modes already, so that manual mode has nothing to add to it when
> it arrives. The driver stores the requested state and reports it back
> unchanged, it does not act on it yet. Output pins keep reporting their
> state only.
> 
> Signed-off-by: Petr Oros<poros@redhat.com>
> ---
> v3:
> - refuse pin states that are not valid in the device mode, so that
>    connected is refused in automatic mode, the mode the device reports,
>    with an extack message (Ivan Vecera)
> - the Acked-by of v2 is not carried over, the callback changed

LGTM...

Reviewed-by: Ivan Vecera <ivecera@redhat.com>

