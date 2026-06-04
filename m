Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B734378839
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 10:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780568587; cv=none; b=P27EuGo6a+4QKCJVqO5x8+uCSPUK10bED+QpCuFULILPgJMx7mjRf+UbJ6dC5QRSWctjIfjJtTj9knyVq76ZHtghyQKLXQfAg1HRkIqTnRbv7Qaun8WiGwPEUVElEWRdZPozSIPfrdxIn1UftQ52Ud5AntfZLBD8fR1NccVxf7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780568587; c=relaxed/simple;
	bh=dixIwFWPM7bAvzVEPDaLhO8cb7WbN6pEYPVYYsaOzkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f+LmGlhYxzW7EUMKI6GrELyyqj7pwfUHxhvs+oosr3ToxBqYmQ7xUV/5yjEVRlGljpqR4/an30oxJjp1z/FEd9IbN9bwv75rc89OoN8Jv2CmvCGujOroZN1yKNHB6W/9L5zevkm1mGjFBlyyNVeu4Lvr1kkWuamht+ArGAhMeN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XfHD/mk8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qwcSBavr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XfHD/mk8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qwcSBavr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780568585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o+5l/h/t7hfKlD/idoyfI2FiuQnGpbz/XljJ2mR74hI=;
	b=XfHD/mk8nNFXePoirKAvRuztt6J3X0q05jgAwJxNrC08F/uTqhr7QvQGxxW8lQQa7YqTdp
	a8Okmw3Xr2r5+azD4IwX4yeSyh+GlPXYwLzpteiT/3o95rnQ012oVoAwJho1y+HT5L3BQL
	GWkR4mx9ufrwjKMPdjW6HwjoLmUMYVo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-Gvt-WD9MMsSnltrkn7IOsg-1; Thu, 04 Jun 2026 06:23:04 -0400
X-MC-Unique: Gvt-WD9MMsSnltrkn7IOsg-1
X-Mimecast-MFC-AGG-ID: Gvt-WD9MMsSnltrkn7IOsg_1780568583
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-490ae461f8dso4411565e9.1
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 03:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780568583; x=1781173383; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o+5l/h/t7hfKlD/idoyfI2FiuQnGpbz/XljJ2mR74hI=;
        b=qwcSBavrdWJ8rTb2XvFl/nZc4mw7E0UmKQuxkFc68RgZL3eJGawcEa7911EfYTnHAU
         4eQ2OqyZepD+j+xrD+uDKaPMsGgNIk1b2//vqwkvvjDUXFsXWG99ZZAxSbSuKU1bgrHH
         PgstmLPJwxqBmqL6HsUdcFJFgxaaHKxwZBwbMF5XsmdN2QFIiPIY7Qfx9c3/IsNrxTaK
         KkucHDh7MB9N+HQn0xfx7iqcJC6Jt0oz9ZkaUUEKMa1oslLZohI6KMkQkarJMh8TzaUx
         5f61x0/1JUWnn9HoZOsBvDq3we+sgWoASbUNX7J1NZq6Bk5hNPJOm0lNbo7q3Igd1qFk
         cOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780568583; x=1781173383;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+5l/h/t7hfKlD/idoyfI2FiuQnGpbz/XljJ2mR74hI=;
        b=EllfyXlxTDlq0rcxW77Q4+6IwAi+UPrbz4WOIzHoTeXX+W9NFt6HGOGim2c+tpN61R
         Il+znHdNyTLYmAubQx9aXYKb7BeA+C8kcIFTMmOwPqGC4cdckPuYiHc6cT9Ad24dNw8J
         W6mVWF0yMci7vAEjR5Yx6pNMHb6crYySKwLTAu4Z6bdbMr1PzzUZL3ZqjJ/IWqFXn2jY
         xxG8IonJtYoG4k3m3TSrXGD/jq1OHpowEm/b1dLk0cjwWb1GDDjguJ3ApHXcW3oIW3I7
         KdhtxTpGOPlOphcX6VDLDb+wAriiwfl5QAcD8cJBMMLXZZJhQZVWO0Sw1jU0KWgu4jBZ
         LrAg==
X-Forwarded-Encrypted: i=1; AFNElJ/poAyt/kllIMNI19EiQASXdYPom6M/G0WD6Rq6tsj7CXzi+anZnz8eZHu+PnTvhkIgGdfoYurehdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAQAEosbhF+OpQOq8NHVZqPH5GBKQGMEKBF8VL4RzWTBw8hVrv
	pH+PrdOKPEdgrHUUpLrTxDKHl/3hZFi8FOEh7xJKIje6fDf/rU4fhktDvne3F+wLN6lgySembN8
	7JC9H8QsBG93fYsNAWFzFLHrtT2Sy8rWL2WTJb1S30eAv41CstLDL4Fg44wvcnQ==
X-Gm-Gg: Acq92OHcnJCrGC7wFNdU5V0t8/aOpAm0493zGHaB1RA6Anb24a40AvfzXl/zGPLWFpQ
	Zv+6UF9T7EeZ8vlQqZW2rU9Q3K6guOE/4nGTlTreA7vR13KW9eY67p+eOgBG/z2E+Q/B7Mc0zIu
	CRnqCwvgEE4UTDdhwNBJ/7knzNj6vm2E96GieJhntFhEoDdyArCl/rgj0W205R7871JU6zk/+u3
	D57gMCXaJpyh+gea1L0CsiEiPBfls2d2o53x2ioaujGpbH1x95UuWf9BvBPQvGWoCvcpYJ8N8vK
	sXWt+NuGIhUjPpcUU7RQAOu98m02ydute88o1+097sJhGapzvTp6mo8VjRyM1M9y7VcWW3uJEQk
	TLLnqChVqW1y3bNkefpo0ww4bhP8df3s8km3Zc37+uqz9JcCsPtVvrzW+IBxRpklCARc=
X-Received: by 2002:a05:600c:468d:b0:490:b2a6:8c1d with SMTP id 5b1f17b1804b1-490b5ea3529mr126923365e9.10.1780568582747;
        Thu, 04 Jun 2026 03:23:02 -0700 (PDT)
X-Received: by 2002:a05:600c:468d:b0:490:b2a6:8c1d with SMTP id 5b1f17b1804b1-490b5ea3529mr126922705e9.10.1780568582153;
        Thu, 04 Jun 2026 03:23:02 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.155.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cc140sm72928255e9.9.2026.06.04.03.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 03:23:01 -0700 (PDT)
Message-ID: <a0178564-a7a2-46d8-afc0-636f027c31b6@redhat.com>
Date: Thu, 4 Jun 2026 12:23:00 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 net-next 07/11] net/nebula-matrix: add intr resource
 implementation
To: "illusion.wang" <illusion.wang@nebula-matrix.com>,
 dimon.zhao@nebula-matrix.com, alvin.wang@nebula-matrix.com,
 sam.chen@nebula-matrix.com, netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, corbet@lwn.net, kuba@kernel.org, horms@kernel.org,
 linux-doc@vger.kernel.org, vadim.fedorenko@linux.dev,
 lukas.bulwahn@redhat.com, edumazet@google.com, enelsonmoore@gmail.com,
 skhan@linuxfoundation.org, hkallweit1@gmail.com,
 open list <linux-kernel@vger.kernel.org>
References: <20260601093149.25905-1-illusion.wang@nebula-matrix.com>
 <20260601093149.25905-8-illusion.wang@nebula-matrix.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260601093149.25905-8-illusion.wang@nebula-matrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/1/26 11:31 AM, illusion.wang wrote:
> This patch adds the nbl_interrupt module for management of driver-private
> MSI-X indices, plus hw_ops callbacks to program the function MSI-X mapping
> registers, configure MSI-X info, and enable mailbox interrupts.
> 
> Key interfaces:
> - configure_msix_map:   Allocates driver-private global MSI-X indices
>                           (interrupt_net_bitmap / interrupt_others_bitmap)
>                           and programs the hardware MSI-X mapping registers
>                           (NBL_PCOMPLETER_FUNCTION_MSIX_MAP).
>                           The actual PCI MSI-X vector allocation is done
>                           by nbl_dev_alloc_msix_intr().
> - destroy_msix_map:     Releases MSI-X indices and tears down the mapping.
> - set_mailbox_irq:       Enables/disables a specific mailbox interrupt.
> - configure_msix_info:   Programs PADPT_HOST_MSIX_INFO and
>                           PCOMPLETER_HOST_MSIX_FID_TABLE.
> 
> The patch does not use kernel MSI-X allocation primitives
> (pci_alloc_irq_vectors, pci_msix_alloc_irq_at, irq_domain). It manages
> a driver-private global index space and programs vendor-specific
> MSI-X mapping registers.
> 
> Note: Mutual exclusion for configure_msix_map, destroy_msix_map, and
> enable_mailbox_irq is handled by the dispatch layer; these functions
> assume the caller already holds the necessary lock.

Adding assertion based on mutex_is_locked() would make the above obvious
and will prevent locking issues.

/P

