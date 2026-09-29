Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C694E13EA
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 21:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717143; cv=none; b=i6XxiFNyha25rHkA1BpPRjYh29uzNUjCmReqkCv+CBo1LXg8CQdyQ0Tew1/KQauSBz+V8usYeKtk2m3c6orHpr9UUi4iwdXTw6eE9LdKrwa9wz2GRvV94HmYEKoZ+exq+KlX9HxnfWPxaqqEG+4HfIs7VNiaJRsHWjx/YXfa+Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717143; c=relaxed/simple;
	bh=Tjs7FwpG8SBJ1qS8KHelfEMZVZQILD7n6hgU4O1XLxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I49pA31B3zYZm+aIL0uAgg7YsCULUOMZrKtpI+O1z/GxqmpXYl9aBCIQL1ggRVNmt5/dQ+SULlUz08HI+GzFlIrPUy2UIpgezQeiHgCXkgghvYHq7+1BAQ7aghspFvhNL987vmP68PSkfZvzTU8vvjuDmoLvw1zzL4nWfeiXm8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBf5aJz2; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBf5aJz2"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so5457565e9.1
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 14:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790717140; x=1791321940; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o4P77awGw7CnoZ9LloNVfZMxMXD8dRiBGwj2EdNOf8w=;
        b=SBf5aJz2wIqBNpBzuwi0LLileKtRLyJ/6uTundHZrL1VmbEcGKSk0ZCVaCepin1Q0E
         KE1ojVSjbk2SxsH6cXrFB4cY4EE7tzA7YgIMD46gfksKxs49LswTa0PyUV1VoeRXmezM
         4VMMiSGX6o/iwe5TqoNRhMUtLghfkC8Y5z2OLr5n3T4L5mtB33SyRQnuedtfe4qRODm/
         jgUain/A9wrx6ppvA/y35rouiXWBqNxPKige9IQBk0fA1M/SX7KMPAzDZPYHv0+Zu1o9
         teOmKrs7uyL0pbrMe97oYvOAFof0IgHj/OzGOO46ETWak/8eznfyACEttFPnoRqGOxRB
         7Rzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790717140; x=1791321940;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o4P77awGw7CnoZ9LloNVfZMxMXD8dRiBGwj2EdNOf8w=;
        b=v7kdulW1+t/C86lsvM3S0JTGQd/ARmgOzLv2K+72ljbQb1ig3DI4+8JmAzutnX8Qs+
         6lQEuE/Qtmk1GpZ4T6XiRKchaKLvRIOUih7NXHuZC/WsMHfRV/JBVXSfKQxBxDivsJ3p
         4RmvsHgw1yMmAZMA72wPwcg76CnLU0VSkZSiB9JbjO6SE73v63RvChcqE21pzHvZ9iwb
         TFY8zipp06B7iJiiEPINAf/6ZTgPwgFTY4chI7BK2bnikr9+bPfkoZqIkFAJU+4UwBmp
         I3diXhMWnU1Y64G5nFB8JIAeRCyqt+LB+muNeY6ZihYHpHzj171Ae9k4OIWHaRxjEgvg
         20EA==
X-Forwarded-Encrypted: i=1; AKwUvBzrIOvwST/95E9kWDjmp6jn5C1liNZBgg0aqM/7BjZvYnlDDC3C84JS7tJRkmMDzRZE80/VRYnvPR0=@vger.kernel.org
X-Gm-Message-State: AFuF++nFAtpsDi/biRjJGEPKwrdVxrmVzjdRhYKcQewBvG7P6H/J2pJB
	9qQNFj0vRgNqdI3VGx3cG8ZP65k27DICnXJHGKJsCiI09C/HGF/oQgiJ
X-Gm-Gg: AYBFou3PwbTugsyIeouVFGyuj/VntYyYgrDcYQYA92kIPnWGpIsGe5XSiZd0NMCNjzR
	cEfafZuIA1Zzs5ela4iOqrFnIHblmZZzFJwUcEMQU7oREcKWxKGWif4FFckQU/8Q1boKcN0Vj1L
	Plb12holuHMrf9l2PBIqxT+TXWRMODnW+oNfuSpIkWl6BhNtiVykBy1yzFXzbQTsV/5OxhjJCxd
	J+LamMBY5Yp45lvf5qpSmINHWJPPGytSuO5OfLGH7AZraX+aQR2Pf32qKd85kpeMK6FFP7weQe/
	ajP3zyNVEVlJ+DR8s0V4/yAVkusPG6PNmRb0GcolEy9LpD80WQwjXs/RSv6j0jGjXDO5wb16RBN
	nd0PFzAyjYVd1iy0wFIw6DTwAap/+ZE6i3dDmFisTmQFIWRN1e5+cMuNuVuRXnEGPQFY7OfJlg8
	JJRbWluY4f5bXgllJEZh6Ns/V2j3neLGXZaFtjRboXiG03SZEyGNxCtrOunelCufxeOZ3qYgKav
	qLhB3oYW/MacAT+Gp6ucFe7G5ycNgVD7S2RRu1HYHC+AS8ZxUnA43+AJ5gcYVOnISUQjzdg1Trx
	nG5UM9fj6FWIHkCaWzlRZbRdlNhXWQbi0ZAHfaTxatDpFdCUHR9lwo9CCMtUTJmOiw9ul4DGw8A
	=
X-Received: by 2002:a05:600c:c176:b0:49f:fbad:29ae with SMTP id 5b1f17b1804b1-4a015142604mr5797515e9.17.1790717139884;
        Tue, 29 Sep 2026 14:25:39 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-9c32-f801-9d9d-c89f-9fb1-4ec2.310.pool.telefonica.de. [2a02:3100:9c32:f801:9d9d:c89f:9fb1:4ec2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfecb39sm118395395e9.7.2026.09.29.14.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:25:39 -0700 (PDT)
Date: Tue, 29 Sep 2026 23:25:37 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Boqun Feng <boqun@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Bradley Morgan <brads@mainlining.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v4] softirq: Preserve interrupt context during IRQ exit
Message-ID: <arwsK1dOHVB5KZjD@gmail.com>
References: <20260926143505.66024-1-kmehltretter@gmail.com>
 <20260928082402.1iCSzDzY@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928082402.1iCSzDzY@linutronix.de>

On Mon, Sep 28, 2026 at 10:24:02AM +0100, Sebastian Andrzej Siewior wrote:
> could you please do
> 	(in_nmi() | hardirq_count()) == HARDIRQ_OFFSET)
> instead? This will merge NMI check into the hardirq check, dropping one
> conditional jump away.
> 

Hello Sebastian,

Good catch. With GCC it removes one conditional branch on x86-64, arm64
and arm32. On x86-64 it also uses three fewer instructions.

I will send this tweaked version soon.

Thanks for the review!

Karl
