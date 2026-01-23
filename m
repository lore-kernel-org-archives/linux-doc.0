Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97C82EA72A
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 13:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769173404; cv=none; b=JPJ5rEqjxnyPRf2AfyEleX5r8eEzmog9nSWu2d51K0y1vHyCvgO26YFo/2n4NIyOXIdhPyDq90PD0I9gVqU9jBB3jJrIq/pqXVLOuYEa80HcCYQrycKFCB2Wbl8PgmDnPdwlEEvHmkUsxi9CZ3SyUS1FKn9BJECh5vhZdTtODKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769173404; c=relaxed/simple;
	bh=hGG8q2LDtTMO7x/GKprkkhTP5qjLaky2UXr+3Q6SRls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PK/DJRdtcKiKz8ExOeM3J4Ag8NwvD/977vZyfKa8N1eO4ZeeVjWBqXRQoilHDgGRks8b297B0NOHIe42gs4ZqSCgJK6S5fAXc4LcHIuywVGRePaz0TwIttkT9OxovCLSmWhDLDhCm3i8ikSY7hKPzTFOzbtzO84J2/rFlcIjuv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W7FBwg/3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RiV76ve2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W7FBwg/3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RiV76ve2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769173402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f1OPSHMWxka9EbcgB8qFbDMq6x4990pyxNKpMSpRDU0=;
	b=W7FBwg/3vheJDKSis3e/XkZZ5fkd8S5y1PsKOoDw3/WrYsg8yL3gKwlGS8nAXJYyPGtJok
	xTd0LO8tuRmUXmdbsI2GZn7ecU08TbAGISfGjRY5XV6WoXz5ZvjPqKstNOa1dicvFU9Bmm
	dpoi+0i5yPAHXJ8x7Tc9JQvwVhctgYE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-k5pUcXtiOaSsq56iUA9-GQ-1; Fri, 23 Jan 2026 08:03:20 -0500
X-MC-Unique: k5pUcXtiOaSsq56iUA9-GQ-1
X-Mimecast-MFC-AGG-ID: k5pUcXtiOaSsq56iUA9-GQ_1769173399
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4779d8fd4ecso14141175e9.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 05:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769173399; x=1769778199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f1OPSHMWxka9EbcgB8qFbDMq6x4990pyxNKpMSpRDU0=;
        b=RiV76ve2MOl52JLSxjTNP3j+neCWQ0P2kKu9vNaEsIRI35utbbC6ieF3svCfcrT6er
         C0QUiOK7VGnDDT78tx2CEZxsdgqKXSN/JgYCfeof6LH8zS9Bmuxg55jRfqoF0ym3kWdE
         SL1rP+DT46mGHhaEsmcbP1BIVQACezPjyyGmYdQzdXwvzQCB0UIRJW1zu0aZ1YBtEXCg
         4IMz0tw92ZNySRes7oXxxrezKWkUOne1s8bSJICff2AJiGMg29M3kSvVeMYE3toq+N25
         4CcvKndo0oZO/RM7RcVq7UT53mZ6VOjzfbCgsh1q8LcZJuU3wLblgFhoI7TPS2fTfOZv
         If1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769173399; x=1769778199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1OPSHMWxka9EbcgB8qFbDMq6x4990pyxNKpMSpRDU0=;
        b=t3EPp0jyD1Pc6WY9vdXgcJQp7b3d39Jqe3MjvPgcdiTknD036bSmktH9mly1t0o5xa
         GMShZgV95d95KL6M9GcojmHkz3h886begP8+z2kCpSQukXnN6Vu790N8cVwWgrJoNpkV
         5YBLcNuCQKX5lp6K4YNP6FolUsOipThX0lFMPcUG8b4NXhK93JdCsavJhjUsJFi5uzgm
         VzpqKs+Sax9czTq/rYXo56vCx2i3GWGujpMyjM/xBh1lGt2AmKGBdlV8il2Nqm+QpmPE
         CbTVGM9Ua1V0pyPg9Leif8Bs1Ax8OxICr6ftO7WX1gW+orn5rvscXiDK4ejXG1t3yJBY
         Pv6w==
X-Forwarded-Encrypted: i=1; AJvYcCUozg1JwUfpvRtpeCALVe3GQh51OIHHb6B4vfLYL75BRrxNIkEpKkKX3rJ7YlUiGJQ+EnVrVUGyeFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCVNf9EqpeNJHDLx6xkYqIu4szxsJ6Z62m3oWB2eUSoPMoPMcw
	KAlrXcVZVmrdEaDe86Bn0Nj3DTnndJTMuERsUsy6MCPgqWNeenelvKc+sgxhtQnbYGKHSUdbjpx
	8Jjj80q9Emd3T7653NVpgHpkc5DnPS688sUP9G/fjIrIAXzN3fqIjhmNnDTBbxg==
X-Gm-Gg: AZuq6aIDF2Au2wT0Y2SKSwVjMoPt1IappJjLq0zJZ/hQGQY1WIDvXI9k1iAaQMkXcI8
	+gYybtUjI+DVcVmX3pzSItoJmjzavSSmJn9yz6vtkm0yB1ljEiMFRA0EhGzTZm0CvQBPAvrYfr/
	SBM7X2aMNHrdo0MA+Fmh2Lro5sjJUbdGRYXb4YPn1tsjUU2HvvSVAovBvqrSjM4Dkw1pkF9jYcy
	0QMLp6LBjs9GAvhiTgJj6UpENfPmndsts9K2Wvj2MNhA+Phn0f2n3tYAqWdY3K8pCd7TKGrsDtw
	dzlSpp/B6rdS0pcfs78ip39i2D6axdUjgXgVul6dbGSyA7F2mDbTzSOad11yctHiPlbQEtKw1+x
	Av44vWGUHe+yUX8M24zxTrWbIyrCcpOHDuG3a8iUk
X-Received: by 2002:a05:600c:1f90:b0:47d:6c36:a125 with SMTP id 5b1f17b1804b1-4804d309167mr49515105e9.17.1769173399246;
        Fri, 23 Jan 2026 05:03:19 -0800 (PST)
X-Received: by 2002:a05:600c:1f90:b0:47d:6c36:a125 with SMTP id 5b1f17b1804b1-4804d309167mr49514505e9.17.1769173398802;
        Fri, 23 Jan 2026 05:03:18 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.129.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e71503sm7361058f8f.25.2026.01.23.05.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 05:03:18 -0800 (PST)
Date: Fri, 23 Jan 2026 14:03:16 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	Nam Cao <namcao@linutronix.de>, Juri Lelli <jlelli@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Tomas Glozar <tglozar@redhat.com>,
	Clark Williams <williams@redhat.com>,
	John Kacur <jkacur@redhat.com>
Subject: Re: [PATCH v5 14/15] rv: Add deadline monitors
Message-ID: <aXNxlHEimMLg6fU_@jlelli-thinkpadt14gen4.remote.csb>
References: <20260122155500.362683-1-gmonaco@redhat.com>
 <20260122155500.362683-15-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122155500.362683-15-gmonaco@redhat.com>

Hello,

On 22/01/26 16:54, Gabriele Monaco wrote:
> Add the deadline monitors collection to validate the deadline scheduler,
> both for deadline tasks and servers.
> 
> The currently implemented monitors are:
> * throttle:
>     validate dl entities are throttled when they use up their runtime
> * nomiss:
>     validate dl entities run to completion before their deadiline
> 
> Cc: Peter Zijlstra <peterz@infradead.org>
> Reviewed-by: Nam Cao <namcao@linutronix.de>
> Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
> ---

Looks good to me!

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Thanks,
Juri

