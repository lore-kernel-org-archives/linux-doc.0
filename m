Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122711;
	b=c6rU73wIXob3x91yVg8KQM+EizZeVqipqqEijGDu1e5ZUWdd0oRkCSGRCaQ507YLN+yD
	 Tz80hPAtmbbGbB38U6RbGb6ya2v+O23BYLx4jA2yLWn03jVBdV8DwRBRSXumzJJxddYoV
	 ePUhyDMLNN6d52XW8Ee1RSGuuuHVzfN0KuZ719hedL5P3wuQs+gUOjhzkSvoWWYHNRmO3
	 iDw+KKqSdkdVatpI4hw368NUL6pMMiJa83J3JXIWusyIk8AWzeCobUxMf3xQr3spq3OXG
	 xYoO9/tTpndUV9HPncoY88dfuQKFBBUQNc35QqVG+miIJRtdXcrxn8LUUn/7X3wn/qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Dop4F8OKR7cXm1nUzbyU2g5S5dDo+bHScDg3mp5FzUA=;
	b=YWlBVhOxoreCVo7+FQpdtZAllFcKfDgIO46HhQo6S7EyH5hVfie70PoslL9djYCq5J7l
	 xY48L+Xgp64Qmk5UD8ujvg2GXwFInNJOvwE5i6khOGdciGtQ/delHSQOS7ZDajkaE6SpD
	 o8S0aFdqMI5yP2n81RSo8VzEPWuDM2WepEWjqIpfpKvMbMNG+D833YNvrF+6HoaSuEbsF
	 oKQcOzKOWC0/fjJu9NsUO6YWEkiMYroJkRCaHwZPx3iPygCOk+DYI23iSby73KulA6eeD
	 4CINMbIfkswjoaomCva5lOZLbYxtUjO4BBV0E6HushAS+EBzsMmYMNm9TMBVxyj73lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0KlWNEhc;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9296E606A31C
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 07:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9296E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0KlWNEhc
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36e795af1d4so3778eec.1
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 23:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794122710; x=1794727510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dop4F8OKR7cXm1nUzbyU2g5S5dDo+bHScDg3mp5FzUA=;
        b=0KlWNEhccXytztXcpy8QDI9lEo0PCwVFU3u38U63n6E3HSrskIS1ZoHL5zE1ahXoOA
         Mwg5mx3WBDNu1bBTw/HUKVQ83wW6jFdSi3Et4OyKGo0pC3mlXYp7epQtek1zgT75kEod
         8PiiomRbBg2t81RKaJiSkW3QsAr4HmgGkGqhW6Y1dipfoiIAf6mNtWLukVfPilhdAMcb
         PKaXQ0d3GBJHy46n/1HYInRyJzZD89FNMuwtM7Sxd6295HZwv1fr+i0M5e2YRl5XsQbD
         QcmuaxSmb/mL/FuNb1Oe+W/b0oZoCcUJstHhQKExPS4En8BAQcYulKUdD9Yj9mYGqrgy
         USwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794122710; x=1794727510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dop4F8OKR7cXm1nUzbyU2g5S5dDo+bHScDg3mp5FzUA=;
        b=nirttYaXzpbhrvT58P8aiy7u/kKa2mejQTo7PC6PlAue3OgqYjEDnHCc1Ym/czMqab
         vgU6FYjEv9wPPEIww+Ic02XbmQaK/niUw7qz7yPJ+S9q+0bJw/ujXLMGZSO/HeaT6TSb
         uCcKGPG6R8Cygot9Lg1SADQXODUxWI4f0TDX63rcDBnoUFDRqUkNvMbZsbD/DcxyT6qW
         XiUYSvpSZs0XGYWivrC/AVsqRiqiadx4lCu+rsKl/+avW/vxGDv6Id+rUX4+y8DMEoHP
         0wb8UZqvlEUe40tBTLxDFIsqsCFJNzAyED7VMxa0x5ZbccDyzi64bBtRu0wPFZyKbEmn
         CJ/g==
X-Forwarded-Encrypted: i=1; AL+hErGZh9E9U5PTDMEjgEUMgkA/IRWzX35aIllznrNuj/ZEDQvhMbnElOxJYVRKmO7avQ/PIbBYxT5ZBrI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Lhk9gAIy3CnbQAx621UbU4hsw7dt3/+BL4oIekRKGHg3C3V/8
	8IZ3CgePCJLrCdCKUA61m2I0Oo+Sm71mfVQVEUV9L94llCb/koWDeAsL
X-Gm-Gg: AYBFou0PqkvhobS8mHAnAHuy3pX0ov0osAH++iI9NpFlYFUb9svzbPB6p2SiAptSmI4
	WP9Nj2PPX3V9FD/XsHGigKrILdm2lQT9ZNpW5gVt6Ss9cxwkjKgVxu3L957Ea4Eb+6HwicWnLTD
	ZHgQNvaCOF5Prq0SiGOc4ECBBN6hFxTPkVNL7mYqnPUuZRkQPH7Uj9ASNLsYcFzfHacqQ+y62D6
	psFAF5HzkClgGiAYwCgfIJaUmDbLtXVSmzamyVK0EjE7vulO5uciIZaYjZVI1HGKx7U/zoEDnkw
	ctWLCXxs3S+n1XFayy9AmXTT8NwijZK+x9Qiocj5Og/h94UEAAGtIMUhPK2XnE0rB20EOyqSnF0
	qVstbUrVL/dxoDytqetwMAjxzqYnfuVC2D0q3sC4JElMJSXABU2s6WtjbxqgtPLS5/bIkD1J6ap
	G41Q74BHjizBXaiRbiFtxSMp3Z/nIWaBMIpgeI0kqH4O3WHbSHyjn3mY8qmrCyien8IKfknysMK
	J30Ul67AUd3a+7m5rqhOxO8prQcM6XEcl4LgeKHYJOhGf6WedDZhpVZsg6w5AIHunh0+kxw3ncj
	W//Ki1MxBqBnKyHEXy7aPQYZasjAtyaqgElZnojfVmT/EZrT8Fi7CeK6lhTKiJ7+dJKfRg==
X-Received: by 2002:a05:7301:1a11:b0:368:2c6d:ddfe with SMTP id 5a478bee46e88-370f6115a74mr6028007eec.9.1794122709628;
        Sat, 07 Nov 2026 23:25:09 -0800 (PST)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:5213:762b:b24:1be1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a16f9csm3499775eec.12.2026.11.07.23.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 23:25:08 -0800 (PST)
From: Pengfei Li <ljdlns1987@gmail.com>
X-Google-Original-From: Pengfei Li <lipengfei28@xiaomi.com>
To: lkp@intel.com
Cc: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	oe-kbuild-all@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangbo56@xiaomi.com,
	lipengfei28@xiaomi.com
Subject: Re: [PATCH v8 2/5] tracing: Use the stackmap from the ftrace stack recording path
Date: Sun,  8 Nov 2026 15:24:48 +0800
Message-Id: <20261108072448.990755-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202611080654.sqFxIlwl-lkp@intel.com>
References: <20261107055139.3138633-1-lipengfei28@xiaomi.com> <20261107055139.3138633-3-lipengfei28@xiaomi.com> <202611080654.sqFxIlwl-lkp@intel.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 08 Nov 2026 06:35:01 +0800, kernel test robot wrote:
> kernel/trace/trace.c: In function 'record_stackmap':
> include/linux/rcupdate.h:502:9: error: dereferencing pointer to incomplete type 'struct ftrace_stackmap'

struct ftrace_stackmap is only defined in trace_stackmap.c, and GCC
before 10 rejects typeof(*p) on the incomplete type in
rcu_dereference_sched(). I reproduced it with GCC 8.5.

v9 will move the rcu_dereference_sched() into
ftrace_stackmap_get_cookie(), which will take the trace_array instead
of the map.

-- Pengfei
