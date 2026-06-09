Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40053D7D86
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 08:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780994006; cv=none; b=mh6TLPso0SumOjnOO0AYOX8CTIKjAlKKNtR0NOshfeAHQ8WkZ9Wv7P0fL0yfieuyjESbdvNOj4yntT6JQ1lZHRnoMqLlNo/74UN5eJCSWT6mPBTAlt/hFje6mSzuK1glTeiSz9nn7ZkG8HG4FP5GmumEIuC7PFpp2aWuAi3PZNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780994006; c=relaxed/simple;
	bh=SKgXcJyerbeWXo1bh9r+1nEf1oAmQiha/ihTfQzLFIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lkyhH3/QzVeUtr8Uhh2CehjbRUFJGs+XkC2JQ/FXBPFTFGCOIlawmGQDbVd4f2kYU7+LTEGg9NNIJsQcYRDWMOjwJ5SFNGh+NTwNscbZGeKDtN5lB7dLJGWYDdNeaapc3ziGRn0EAzT1LM98isL6FSg3QWKDMmONgSShxuQVe/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLjFEbbR; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLjFEbbR"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490c1915793so34485955e9.2
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 01:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780994003; x=1781598803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hryTHx6zhYwdVM/NeWA7IHv9LGI9aODrv9wm/XKERLo=;
        b=nLjFEbbR9gXxYr4gM/LpjjeKCpatliqiJSxjz2IJ8PAujysz61KGtr1ioDdoM1AGms
         dpwlM19R8RYDPv6qtyjWKOu82bIEBmySlRSfNOTtmkVtsq0c89jUOIY7sYKPLVXYjsgl
         10AN8812N+xaoczWLI4FkcY33SYZSwVBNi08e7i8zQhurJDYve7qcjS0++R2fLlTOtme
         wy5yZDEr2YREOgj8xhvyiUOTloofxxhJ7sfIME9PTQNGQbRcv75c3Q3XtVrf5q70hqXr
         fYGgMlcLcN71OEG2ppRQONMTkgbs5AWpLStVs700igr6ET+fgtNWegyqF4ivCmnxXnV4
         V21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780994003; x=1781598803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hryTHx6zhYwdVM/NeWA7IHv9LGI9aODrv9wm/XKERLo=;
        b=AwTTEN60mAzaovK/qf/nzGV5AurREk+8snx1QvqA23bcUIp07+AMxZesmbTS9xiAKZ
         /x0ykueohUEI+cvjYVYaoaaoFA2vph9g/2slRtOc2t+Nqg0LTYLjR8Dgln2I77EAGzj6
         k8jOjBC9+ihVYuo/sxPjx+a1QMZ+ppvb7jHQkR+6vW+Do9I/Hjbterj9ruRwMTxEDgY9
         4UNrxiwYtTdK7BmZse0zOBB2XoNG0gW+F3SPfHaiQpIa3Dji6A8hsyeZVKusD17kHc+T
         LzRDKmMMz1ghT4tcXd4KA1yffcMGHugD7LM2GDbKnXVkA1r6gbN6Xh+WE5R9pIlloOBL
         SiCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1ayWNSgbxChOQkG55QGtDTYHsKB+ZZda/xICQojDxC5il3Tgmk1q/LV68LRD3lyb4b5qa6bW5LLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwtO24qgLSZG80twUPh5HzMzeZmXoMAumz+d6leKVqxZ74ypDD
	v89499JmQ4nqt3RCYjtKnbimAHQQzQ4MBskJibYDKzjkZxHpWyirzS2B
X-Gm-Gg: Acq92OEhw4Pe4a1KCf5J3QVTHBjDY7QKnZjQTOrpYR+3kQGBoyEV8p1Ic4r0tJL6uCQ
	jLanOAxi3WOppdyt0ee20QKwEj7XNjaGp7dtKvlW9FQygmH67KqtcnKc7e/fVrDINDWGSmFq1Dd
	m+n7xAOTMwT8ZsAVTGdHPiRAEKK17P4LJvMl4RB+Z/igUqrayG4PE0KwbQukruuu5BqslV/wsZt
	wWWp5UNmIRl68AStjZmpKoAJUOEKZkWzxmIoav/zedCM8N+wSawRdWP7t20hl5J+tSpfxYKAvmk
	Numl369TU315iyRPXXHfdIqbm6SzTjkrbVqMQw+Gzsi0/jmW+Snm4sXlCzE38cB+Ffb3pYvmroi
	TC2MQXfb1Q8hJSCBs1R9sIV8C3RGTYWjzTfkXfKbU3fbugQOXERWDmiXs148u3FdLiSTVKPL6p4
	zcFogZD0rI+quIPCxkPt0LkMqef2Lo2g==
X-Received: by 2002:a05:600c:8b6a:b0:490:44eb:c1d9 with SMTP id 5b1f17b1804b1-490c26217damr289201155e9.28.1780994002941;
        Tue, 09 Jun 2026 01:33:22 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490bc3b5b06sm421087085e9.3.2026.06.09.01.33.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:33:22 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: w@1wt.eu
Cc: corbet@lwn.net,
	greg@kroah.com,
	gregkh@linuxfoundation.org,
	leon@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	security@kernel.org,
	skhan@linuxfoundation.org,
	workflows@vger.kernel.org
Subject: Re: [PATCH v3 2/3] Documentation: security-bugs: explain what is and is not a security bug
Date: Tue,  9 Jun 2026 11:33:05 +0300
Message-ID: <20260609083305.2382925-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260509094755.2838-3-w@1wt.eu>
References: <20260509094755.2838-3-w@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Willy Tarreau <w@1wt.eu>:
> +in a way that allows multiple local users to get a fair share of the available

Your "security-bugs.rst" says that we should consult "threat-model.rst" to
determine whether a bug should be sent to secret mailing list.

And "threat-model.rst" says that kernel gives everyone "fair share"
of resources.

This can be interpreted so: if scheduler is not fair enough, then this is
security bug and should be reported to secret mailing list. I don't think
this is what you meant.

> +When hardware fails to maintain its specified isolation (e.g., CPU bugs,
> +side-channels, hardware response to unexpected inputs), the kernel will usually
> +attempt to implement reasonable mitigations. These are best-effort measures
> +intended to reduce the attack surface or elevate the cost of an attack within
> +the limits of the hardware's facilities; they do not constitute a
> +kernel-provided safety guarantee.

"best-effort measures" and "they do not constitute a kernel-provided safety
guarantee" can be interpreted so: if someone finds yet another Meltdown-like
side-channel CPU bug, then this is not security bug, and should be
reported openly. I don't think this is what you meant.

> +    affect the system's availability (shutdown, reboot, panic, hang, or making
> +    the system unresponsive via unbounded resource exhaustion).

So if unprivileged process can crash system, then this is security bug?

Also I'm not sure "unbounded resource exhaustion" is correct here.
As well as I understand, by default kernel and distros don't set any
memory limits or limits for number of processes for unprivileged processes,
so unprivileged process can easily cause resource exhaustion by
allocating a lot of memory or by fork bomb.

So, I think you should instead say that unprivileged process, which
has memory limit (and other limits) set using cgroups, should not
be able to cause resource exhaustion.

> +are designed to be accessible to regular local users with a low risk (e.g.
> +kernel logs via ``/proc/kmsg``), some would expose enough information to

/proc/kmsg has rights "-r--------", so I think there is error here.

---------------

Finally, I have questions:

- If unprivileged user created process, which is impossible to kill
by privileged process, is this security bug?

- If unprivileged user prevents privileged user from suspending
system, is this security bug?

-- 
Askar Safin
