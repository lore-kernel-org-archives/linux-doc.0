Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0247E37F8B1
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 10:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776077140; cv=none; b=jttEDTDSiXPGNqDHiND0LchMiHw+FvxlDl7RMIxQbT/4y+RHAIsOcwi5b9M6WqWgCcqZ08W/kue8BDzENqM9Ud23Vm9AL1p7WITYzLnw9Yr7xyMdrEEX6ssgtDtsv1N47sachmcTiO0DwMHXokXdBDQ+RvH/VfysY7p/EiYuQwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776077140; c=relaxed/simple;
	bh=vdQ9O49m+khLjAzBluJlvl4Pa+F0x9LEIjXhmDvaJTI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=R1L48k0L9y2hI6CjP1PjkktxY5E/iTPxpNViiD9SwpxQN/67xV/8n7KQ33uShboTHw1RcSuRuXervn8Qbs/43oDwxLU9vtUthCFgtjanevK4sSHOmp0nxhkgZc/oCgsvZKOpRXZcj997YnYuf/g0/kwz0h3GjilUpgkgrEy4ynQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VXMs9Gsy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iHUpCRZe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VXMs9Gsy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iHUpCRZe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776077138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mmEcQTdxr2NMcMldR7GeSWaUxtACD5m4x6LyyyBXq8Q=;
	b=VXMs9GsyvHKjbB5d5A8aGYkNwzsopwtqP5wFo2yWms2sOISnDp8JGaMlzbzAPoUlo8FV62
	rRutCPp7JweZHP/HplUIrzKJixdu36OrV6KpGyvvsu4IaDv0qd2ro9Ps7RBuuw4AS6VA+r
	rpKTOiIjG4gNQ/87VXIdFqF8ojb/Ycc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-e3TfAc4NPgO9s-hPqFt6qQ-1; Mon, 13 Apr 2026 06:45:36 -0400
X-MC-Unique: e3TfAc4NPgO9s-hPqFt6qQ-1
X-Mimecast-MFC-AGG-ID: e3TfAc4NPgO9s-hPqFt6qQ_1776077136
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-43d1ceb2ddfso3905310f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 03:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776077135; x=1776681935; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mmEcQTdxr2NMcMldR7GeSWaUxtACD5m4x6LyyyBXq8Q=;
        b=iHUpCRZenQ2eXbofoSwlLaikaGbfYx5TmH11nFakifg1lYXqU//TUxk0C7Hrzuki4J
         iMr6ArIIe0dtFWBInyR3cV0YrFnSzTaCJTxGZxEuLh1Y5CpoZOKNgGXKKnHTczHPletu
         fZLJeFUvDSljD0IIE9WQnHrgZJQ70t3IK7Hba1QQGfOy3w8tiSUIhARHmuvy4FV0AIOY
         JleEbRWUqTaBZMPWeH5bt2eiEDkFEkpsGPolcc+tR0dlHp0pmIuKGAiPy2gQxy3uwaLO
         H90/z3xXnmw3AcIQBkPKvkfObyzFEX5JeV/QO1XHmL4H0R9kWbPdZWzbNQh9X0fnFJr0
         m2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776077135; x=1776681935;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mmEcQTdxr2NMcMldR7GeSWaUxtACD5m4x6LyyyBXq8Q=;
        b=sREsXYap6xddv1qHN2QYhj4KE2ptNT3RICPyfvBmQR4VUgbWl3Lz7EyxPq9IB5QBCi
         ijQDvOnD9/GN4OKPQ7YojYdXiH78YpS2K51R6dgtuea8jCg255IwFW2dflTahtga8+jA
         SAJUca4ZH1/8AeKE1TO/HSt0+DXxGXsit+Oij4XT/W0i3qCKPs5mGnpF1CXjHl1s2DzL
         5DQ29sCjaItZlitM17PXEmBEc1Pe/nDoclhHhyFDR1d6+BdPNNq0Cz0ThhlUx0HKNcq1
         oe1ztsgtHPLVAF1ZxX8GpoRZxLXzp3xmFJwpL3DJAoAjg+uBJ+NPNDR/YSTysiJ4xH1O
         dlrQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yhXYdy2jy6ukRhRO2BvLEITW6Ml4tvol3FD/MJ59iVShfAwD2yx6SqIJynFzEui1Qw2uBbFZyyyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOCiK9yCYAMx+wwWe3zthg//otfww1IHNYR7se0ocCT6pS+SWp
	bpchLa5G0LJ9GZuUmBUFX2v0VXlx/UHFTCvNxaB9eU5Lc2ZiEMHmmTalydTG3DNyoXXL07fhKwV
	LFc3zXz/XAqhRp5kjUlmR62YYG0KwehLAY3jhIav/79QzQJrOh0SyGBH/1zOwEA==
X-Gm-Gg: AeBDieucMVtaNZfE8bdCx2taKkyqXN8ubt9u8UFhRhHrrO1QQBuh/cn8mQz4suK1OCY
	c0xyI2DRpuX21Y8XeHLtx+dCcMe/jD54ENuPRRBLPRrsO1tF04mhCJhF3ipih9rhnC5EDvpibtq
	Q3hLBLJceYwAjaFO8VUNtLXV/GrMQKG2YCQ4vLpbmXtMwUUU8CEhDAjiNbR6xApz7Dw1vWkUFLF
	YRsUVAbU6QsGdIsLFyY1xYjfBfqPjtBOqL95GDZBVJEkC2CqCyAO09UBRbRsDhvK7ifpprfgpzO
	YohycvUevOU10tdDhoLZy/X03Fi2hhRSlpPvEqNVQpYSy4t/O0sObCz7X00ReZo/JRzDcpaDyDN
	tm0zDu9EjEzY50kNTqL+xGgXrrWF0aCnxAFb7HsZoKdHpMrfpJyPatK8=
X-Received: by 2002:a05:600c:c0da:b0:488:ab5b:d711 with SMTP id 5b1f17b1804b1-488d6864b6cmr140073365e9.23.1776077135520;
        Mon, 13 Apr 2026 03:45:35 -0700 (PDT)
X-Received: by 2002:a05:600c:c0da:b0:488:ab5b:d711 with SMTP id 5b1f17b1804b1-488d6864b6cmr140073025e9.23.1776077135144;
        Mon, 13 Apr 2026 03:45:35 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb ([90.247.120.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d762decf6sm16828152f8f.8.2026.04.13.03.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:45:34 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Aaron Tomlin <atomlin@atomlin.com>, Christoph Hellwig <hch@lst.de>,
 Frederic Weisbecker <frederic@kernel.org>, Jens Axboe <axboe@fb.com>,
 Jonathan Corbet <corbet@lwn.net>, Ming Lei <ming.lei@redhat.com>, Thomas
 Gleixner <tglx@kernel.org>, Waiman Long <longman@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, John Ogness <john.ogness@linutronix.de>
Subject: Re: [RFC PATCH] Documentation: Add managed interrupts
In-Reply-To: <20260401110232.ET5RxZfl@linutronix.de>
References: <20260401110232.ET5RxZfl@linutronix.de>
Date: Mon, 13 Apr 2026 11:45:33 +0100
Message-ID: <xhsmhlderi1f6.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 01/04/26 13:02, Sebastian Andrzej Siewior wrote:
> One more point: Given that isolcpus= is marked deprecated as of commit
>    b0d40d2b22fe4 ("sched/isolation: Document isolcpus= boot parameter flags, mark it deprecated")
>
> and the 'managed_irq' is evaluated at device's probe time it would
> require additional callbacks to re-evaluate the situation. Probably for
> 'io_queue', too. Does is make sense or should we simply drop the
> "deprecation" notice and allowing using it long term?

AIUI the deprecation notice is more for isolcpus=domain, i.e. the scheduler
part, but it's still relevant for e.g. managed_irq. FWIW Openshift uses:

  isolcpus=managed_irq,<cpulist>
  nohz_full=<cpulist>

and cpusets for dynamically isolating CPUs from the scheduler.

