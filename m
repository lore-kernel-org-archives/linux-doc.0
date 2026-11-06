Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962188;
	b=PcZljRAYK9HR8nsQbcuzo+2Pyad+fV0j+dtTChpjMga+qEQ5ZPfvAWx5rDqb32jWXlSz
	 SQm06bj1bLCMOpvO07NFLqXsoaZ3H1118U0t7ZiZMoF9+nz5YZ1RfIREEmELY/BPlZSjL
	 3rlR72s1sW9F5MEbl3JD9MhdBunObZMIdT8co6u9yJX52P1EhJRJkh2GivUOT9Zw53riL
	 8aS9w7UTZwaJoKvQQF5VuObPPiJBtywH+GpGxsOxD81csJ/XaCZ24jv8IhQmG131TxsYp
	 1oJi/qvLiOL/KMluQHmEYTUdBO3JoC4/I+gSosf0Xrlcjr+t40wLGNwU2FOZSmB2aLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962188;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=SELXEfX9ebCtzIS5tRc2uRvMLnzGkjG+xyKR95hZo5c=;
	b=BkYc+aEkhtVpUIKmmgMAUeVdEn5zT/Rd+ra9r6yylmG9fuUoeqCvN2ml9JsdFz+sqeHP
	 PZx5SzDpgh3RO9hjND0kgDAPO7BkyqqRqoFSrTX8K7Nyq2c+MC7ASM9JNnoxA2UzG+u+B
	 s2Ev/f7M6uKt41yGvC7GkmLdo4QrYYdDwKepl8kSnVeP+vV727+XB4fJ88cN/YZozCipI
	 dp2ajMDjzU6oHjBPShRvo41gaWyhE116a55xpnreBHwbXnZLpcUr3/YNgRddBmPUn5KQ/
	 1jeYBfJxo8Wfek8bkYCudYF6Os29eB/XLak7SO1j2KgJ7uVZ22w7MHVo0hvk8zcX5vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="dyv8YG/p";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FF8606D833
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 10:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71FF8606D833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dyv8YG/p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793962187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SELXEfX9ebCtzIS5tRc2uRvMLnzGkjG+xyKR95hZo5c=;
	b=dyv8YG/pTV7zcJcDkliKNfVE/nNBQy1qoclijnhOLQi4joQ33jpKNfzdzdrbRbYkGK3D33
	3eqtNPPmdDj2kaL6je3ZCZseWrTgteStPlNA/jeNqjjlC3uRaq6D6KDms11fanSzRUkCjt
	dQ6JFF9fv6AWqv4ipXWDjqVASbZuw5U=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-22-5xgCKugKN8qXrVce3uZIlw-1; Fri,
 06 Nov 2026 05:49:42 -0500
X-MC-Unique: 5xgCKugKN8qXrVce3uZIlw-1
X-Mimecast-MFC-AGG-ID: 5xgCKugKN8qXrVce3uZIlw_1793962180
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3CD75180054E;
	Fri,  6 Nov 2026 10:49:40 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E14FB1956047;
	Fri,  6 Nov 2026 10:49:35 +0000 (UTC)
Message-ID: <6e6a0f97-7db6-4b4f-be78-08adce9a0192@redhat.com>
Date: Fri, 6 Nov 2026 11:49:34 +0100
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
Subject: Re: [PATCH net-next v2 07/14] dpll: dpllsim: Add support to get/set
 priority on input pins
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
 <20261105151852.1844305-8-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261105151852.1844305-8-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 11/5/26 16:18, Petr Oros wrote:
> Add support for getting and setting the priority of input pins.
> Implement the prio_get and prio_set callbacks and advertise the
> priority-can-change capability for input pins, which includes the MUX
> type pins since those are always inputs.
> 
> The initial priority of a pin is configured through a new prio
> attribute of the pin directory, which takes a value between 0 and 255
> and defaults to 128, so that a test can lay out the reference order
> before the device goes live. Like the other pin attributes it is
> writable only while the device is not live. Priority changes made over
> netlink are stored and reported back, they will drive the automatic
> reference selection once the simulation loop exists. The setter
> rejects a value above 255 with EINVAL and an extack message. A priority
> is meaningful for input pins only, so live fails with EINVAL when an
> output pin was given a priority other than the default, next to the
> frequency validation.
> 
> Signed-off-by: Petr Oros<poros@redhat.com>

Reviewed-by: Ivan Vecera <ivecera@redhat.com>

