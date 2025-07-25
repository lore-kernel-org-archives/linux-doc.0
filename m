Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8708153BED
	for <linux-doc@vger.kernel.org>; Fri, 25 Jul 2025 17:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753463950; cv=none; b=EWaty46Oz4L9p77gK3JQQqUbCbxsLfzrdtUtJm7fzywZXbs9PQIlcVEN0SJ8n2BCQcML/7rAxyRXGgDrzgcgUg3xf8B39Nlc3ldFuDDMVoz7QCTk/MiDIq2PSSYGvN5Kj5GIw3ltA4ZHMtUvYAQLCrhwu7N/5ZPUx1NQA9T+pRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753463950; c=relaxed/simple;
	bh=Iry0RrzUK7STj5zlGmX1/iYQfryskFbG2JBARt0IGEQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZEebHqW7rjOXZE4QL/SVxVJj8WWahV1IlbuB3jNoduBTEFeVsaoeAQTIPMhLLxZnEJf0M+CRuU+u7LsJtIqz2/OM+JBnz1KPik9u0hpExpEHAoefa8fNr4XsUj11cY1qU/bJAMwtnjMwlK9RxBwp/bJbnQ9iEDDZhIxzRqWn7J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BRBM+18c; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BRBM+18c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753463946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mhNXg4Znv9oLyolvuPc9tKeQwr0BaKn0+lOoZWLaNX8=;
	b=BRBM+18cAzWLUJ51iZTQ2M7NSQxCyO7QMvNhYa1BkpVDZowNhdMyl9yoWL4uMpD6K8CCC9
	vyVqT4jUVePhw2AvpYLQpfnVS95ZxdcdEwooLQXpUZf/Rok8wBB9XzxgXRulHkcYs3Up/Q
	NBzo0z8jxc05uCvDtWf96S602B5YVm8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-683-KHltYVInMjyuO3TSx3lsMw-1; Fri,
 25 Jul 2025 13:19:02 -0400
X-MC-Unique: KHltYVInMjyuO3TSx3lsMw-1
X-Mimecast-MFC-AGG-ID: KHltYVInMjyuO3TSx3lsMw_1753463941
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8749518001C6;
	Fri, 25 Jul 2025 17:19:00 +0000 (UTC)
Received: from [10.45.224.176] (unknown [10.45.224.176])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D76C9195608D;
	Fri, 25 Jul 2025 17:18:56 +0000 (UTC)
Message-ID: <ea9f9931-95d9-4f7d-abba-eb7fae408977@redhat.com>
Date: Fri, 25 Jul 2025 19:18:55 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/5] dpll: zl3073x: Add support for devlink flash
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Jiri Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Prathosh Satish <Prathosh.Satish@microchip.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michal Schmidt <mschmidt@redhat.com>,
 Petr Oros <poros@redhat.com>
References: <20250725154136.1008132-1-ivecera@redhat.com>
Content-Language: en-US
In-Reply-To: <20250725154136.1008132-1-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 25. 07. 25 5:41 odp., Ivan Vecera wrote:
> Add functionality for accessing device hardware registers, loading
> firmware bundles, and accessing the device's internal flash memory,
> and use it to implement the devlink flash functionality.
> 
> Patch breakdown:
> Patch1: helpers to access hardware registers
> Patch2: low level functions to access flash memory
> Patch3: support to load firmware bundles
> Patch4: refactoring device initialization and helper functions
>          for stopping and resuming device normal operation
> Patch5: devlink .flash_update callback implementation
> 
> Ivan Vecera (5):
>    dpll: zl3073x: Add functions to access hardware registers
>    dpll: zl3073x: Add low-level flash functions
>    dpll: zl3073x: Add firmware loading functionality
>    dpll: zl3073x: Refactor DPLL initialization
>    dpll: zl3073x: Implement devlink flash callback
> 
>   Documentation/networking/devlink/zl3073x.rst |  14 +
>   drivers/dpll/zl3073x/Makefile                |   2 +-
>   drivers/dpll/zl3073x/core.c                  | 362 +++++++---
>   drivers/dpll/zl3073x/core.h                  |  32 +
>   drivers/dpll/zl3073x/devlink.c               |  92 ++-
>   drivers/dpll/zl3073x/devlink.h               |   3 +
>   drivers/dpll/zl3073x/flash.c                 | 674 +++++++++++++++++++
>   drivers/dpll/zl3073x/flash.h                 |  29 +
>   drivers/dpll/zl3073x/fw.c                    | 495 ++++++++++++++
>   drivers/dpll/zl3073x/fw.h                    |  52 ++
>   drivers/dpll/zl3073x/regs.h                  |  51 ++
>   11 files changed, 1715 insertions(+), 91 deletions(-)
>   create mode 100644 drivers/dpll/zl3073x/flash.c
>   create mode 100644 drivers/dpll/zl3073x/flash.h
>   create mode 100644 drivers/dpll/zl3073x/fw.c
>   create mode 100644 drivers/dpll/zl3073x/fw.h

Self nacked, need to fix warnings found by clang (not identified by
gcc).

Ivan

