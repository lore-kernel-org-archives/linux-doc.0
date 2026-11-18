Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015830;
	b=1Uuwc7LiW0PpiQjjwJN6WKvj3Amw9SI3zwyEiH48+FqYd9GlHYuLFlkoyNT5N4Y3SQgh
	 jGWMUs00P/DnXkrfyeNHY5mySQUnpKLRGdoWgek3IqRJSXRmHdGttGnbBIxu1uc2bzk/z
	 w4b9DkZ/D0id2RbQpKq91BnzUcUN9jqyw7azUaT4u8mgXVyzJSClrCsxmf3gjaq85D+Ah
	 1/25f+zWBwchKrXnY5qBXphtsALNHUVsh05pDWodLKSGv1NATrZQlSYk+xTaf+ENomOmQ
	 a5M1cnM/YxCxmnhkJSvZjcLhvrzUSIOUNTR/7tFdvnW+r+quQN5rPVoN8k9FpF+iztQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015830;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=SJS70BAWykYwtLt0R9l5sSECIeSKnz9myNvBTFJeYzc=;
	b=vkCQX/45pjHzMAR75SCIgHBhktyF13EECRcbrx3UCNUWOkF9PnV8xokeniWfgll8hINt
	 6TC8empZpZkZvmNl6PjrYp3EIaUQXwq+ChtZFjygxVIMJtQX3uQDT5Yo+gqidXqtaW8z0
	 H1lkmr1Gi5chlf3tbJFmijFFmPnl5HfzgvWU2WFKLI0dbJFAGd/WcWMMF0tA8NudRjnzy
	 uxQ/qu0RudLbcU0tb3bzy8IdkEP9KVzUDrWMgmEzZ4EE9v4HZji4Ge6TDU3AyjO/mgbUi
	 PU0aE9dURvSDo4hxIAzpjCH+No2C5HfC7yNDRvUQSrUPz7smSMA+Ncs3LZoLJiJ2DMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FLIdECQP;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6445D606A336
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 15:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6445D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FLIdECQP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795015828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SJS70BAWykYwtLt0R9l5sSECIeSKnz9myNvBTFJeYzc=;
	b=FLIdECQPJ8mb+0fipF3eFve+Vj+wkecGbzYC/LDuvBxedflrbK41EOcxWXSb7NwKn7KHTc
	32xszXJUKsKI7vo9hws3QiaQgXb6brz0hN8WdBjQYr5g0zeQa1ec0AZ/Zo2DnILYuDSBKW
	DBCKFVIxZTNh2/94xmzpXFPEVvIu7po=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-657-rGcLiJ-dP9KHVHSGNVzrkg-1; Wed,
 18 Nov 2026 10:30:22 -0500
X-MC-Unique: rGcLiJ-dP9KHVHSGNVzrkg-1
X-Mimecast-MFC-AGG-ID: rGcLiJ-dP9KHVHSGNVzrkg_1795015819
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AA4231800556;
	Wed, 18 Nov 2026 15:30:18 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3B9C91800543;
	Wed, 18 Nov 2026 15:30:12 +0000 (UTC)
Message-ID: <df8fccfd-375d-4f56-be37-d5ade5a47e25@redhat.com>
Date: Wed, 18 Nov 2026 16:30:10 +0100
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
 <de304923-783b-4533-8507-514a15b3556e@redhat.com>
 <20261116181715.6f7d7f09@kernel.org>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261116181715.6f7d7f09@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 11/17/26 03:17, Jakub Kicinski wrote:
> On Mon, 16 Nov 2026 09:24:39 +0100 Ivan Vecera wrote:
>> v2 no longer applies to net-next since net was merged in. It conflicts
>> with 7a3837929d04 ("dpll: notify about a reference sync pair only if it
>> was added") in dpll_pin_ref_sync_pair_add(). Patches 3 and 4 fail on
>> the same lines and the rest applies cleanly. After patch 4 the
>> resolution is:
> 
> What makes you think we'd rebase your patches for you?

Sorry, that came out wrong. I wanted to flag the conflict with the fix
from net, not to hand the rebase to you. I will send v3 rebased on
net-next once the questions in your other reply are settled.

Thanks,
Ivan

