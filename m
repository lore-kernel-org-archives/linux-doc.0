Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EACC3C9429
	for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 06:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789712952; cv=none; b=V2gA7lu1rrLR9UuPfktqxcGwJqG2rXDTkBswEGgr3krR4QwvWlnxVNZnsLEH0xHToCTeO33Q++pB+gpHTmXGzDhcI2oVlciaLPknoyGsCHJTnkUqaPN2VmtlfkYdeYRt+CZEQxwWgcfGVOxGYMQR5vW6CDDePI6arWdM9YfvbJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789712952; c=relaxed/simple;
	bh=IXxwrwD5J6kw0G5HuCrAdAHFviTbBTD+k0rEeIFo9MM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DEIhaFasT3ToeLSH5nNyv7uxmk/mnXoEYO7nvhZRb9wz04wHQeNWi/WK7eIAitAEqN3EOfAhJSKy4TK6OyptQ/FIH5lCSkj6rsRzwd0F9pE1zoFFEbzCsMIBeTIWpnDyICbLaifrX0iPEV8GdyhXhnQ4UdMUsfK1UwjhHvrh59k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7dz8qVk; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7dz8qVk"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48583cb7d44so41507f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 23:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789712950; x=1790317750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5aHukpvvvkvbLRkEITYHb7XYf4xpc3gscX/ilSIH04=;
        b=B7dz8qVkTjrO0ln/N3cJbEw17zrYYVOuGzSc4M0RuMiRlXfdKfNlKCLho+EY61lDWY
         effvGF1IVHC9hRvjYvW59FxTI8CvBL9nwvB549u37nsK2MlLuRHb07omj9TI2Bf9Dbxh
         z71ELV4o8eq30HsrRlpXMetWSOUkRFs4pFDo0mKSsT75vGTI34buAKUBX21BoC8yCBXs
         +1GG1xCd4YG+RCVEreRKL1wwkk+f7v8H2YM9VKXzPdB9XZvf15Bzc/t4xqByA+0OXQxe
         IbH1G2TrTxv6hzkvXSmZs+J1zyZk8PbDVnGsBZXW6oFBm89PDq7bIWAFLEMWUnEGbBfE
         X06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789712950; x=1790317750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L5aHukpvvvkvbLRkEITYHb7XYf4xpc3gscX/ilSIH04=;
        b=er6C7J9msC/cWP3Zu/XnZDIf4TnJvRxIOPUqDDDzZAHz1q6Z9OIpF5P5VQKArGa+eg
         vItPP1r3Vh2bf+0sMcDa39HlzvklP+JipD3OKyVmR+qG/xUExHCEQFbqI+/Z+1QgDTMf
         jHy6GT6N+3XauzAShssJxWdFlMrPmCzKS55Ewxan0LBGDclDf+IxL8XQEf5CergMX5RX
         jxMd9Mxae3ooTMgAwiVF5Qkf9flID8fL1SNPiG12VIW11P203V3QlfLywkMkdxxK2pAR
         9TcIH/iosybzWU3K9vueP+BsT9vQkpTGGcMQXB2xdy8msO8JUBL/J36GYjGeS+InUfCv
         8bbw==
X-Forwarded-Encrypted: i=1; AKwUvBxd+GkFpikqh255Nf9+wKkZy91/X45ayZ2Sx/uaimJU3u/ukzCcz5+tPm6pIWGmlTMyE1VwgvkmOjw=@vger.kernel.org
X-Gm-Message-State: AFuF++nmksHNJSovLi+Ie3AN3UcDOhwng+jN+GKzb3j1peE5us5yZYqN
	GL2H0iuEHdlPFtBfPkN3NfF0u1RmgEpB+OK44O9ZFGKZYD0RGcgs0gsO
X-Gm-Gg: AYBFou3A1Z+3BeD/mfnb/UrZQo5PS2siYJHC2SDkjRAx6Lk/px0hqXhU467hHHzRh/J
	87aAiQzve38n3alwgdFrc2L4aXFAopO8Xx8Za77N8eU3E5g/mjBwN8KAM7JZ+lCpAsNp7jo0WX4
	YecRsHy5c0h3fBbXtSLrHFq248cL54YdNEglXWK2x4xer/cFIJ9dQ8XGElwIYDPIGEg3jMrsVXL
	DbT8mWp9o/vVyGyt2hq2TfCEUX/t/uoNGLxAFWfLyLcIQTP8hvLsNc2AugGmLhqV1kI/UWdUZ22
	U3fURi0RBhc0gUhmCm/Q6gf1+7R8xSdw7JgT0SkYHt696xrujgMK4Jez4rgae4PE3N1m+Zn/wiK
	cE9FjFUJsreSl9co0QYdnGR4di/NNlJW22i2U8iWyfLLH/1FtY3oSXAHfMV5wgRnQFP5BAeyM/O
	JuGeOyAxAU5D47ar6T0hXusm73GCA1IjUXEb3y9PNvEySPLGZGQTyvpEKxn3RJNs5B/e1Xss4zE
	0DPXqJgUZLO3xfB2qfDYA==
X-Received: by 2002:a05:600c:1c13:b0:49e:7186:f36e with SMTP id 5b1f17b1804b1-49fc7dc1e75mr10618175e9.1.1789712949429;
        Thu, 17 Sep 2026 23:29:09 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm79786905e9.4.2026.09.17.23.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 23:29:08 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: kayracizmeci@gmail.com
Cc: arighi@nvidia.com,
	bsegall@google.com,
	christian.loehle@arm.com,
	corbet@lwn.net,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ltrager@nvidia.com,
	mgorman@suse.de,
	mingo@redhat.com,
	pauld@redhat.com,
	peterz@infradead.org,
	rdunlap@infradead.org,
	rostedt@goodmis.org,
	skhan@linuxfoundation.org,
	srikar@linux.ibm.com,
	sshegde@linux.ibm.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	vsethi@nvidia.com,
	will@kernel.org
Subject: Re: [PATCH 1/2] sched/fair: Honor asymmetric SMT priority in idle selection
Date: Fri, 18 Sep 2026 09:28:52 +0300
Message-ID: <20260918062852.77446-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917165515.17479-1-kayracizmeci@gmail.com>
References: <20260917165515.17479-1-kayracizmeci@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


> Hi Andrea,

> Hope I ain't got anything wrong, I'm a bit sick.


> The sched_smt_active() check on select_idle_smt_cpu seems to be redundant on here.

> We could remove this
> By moving the check on select_idle_smt_cpu() to goto block and
> adding one check before the select_idle_smt_cpu() on select_task_rq_fair(). And just calling
> select_idle_smt_cpu() on here.

> I also have a question, do we need select_idle_smt() call on here? If yes then why? I was really confused while reading.

> Thanks,
> Kayra :_:

After I don't know how much times of reading the same functions, I finally understand.
Because of has_idle_core is false, we search if there are any idle SMP's on 
any of the cores.

I normally was going to send this alot earlier, but I fall asleep after
realizing this.

Also now, I don't think we need to remove the checks for one place. It complicates things,
when I tried.

I also booted the patch, it did not worked on me since I just have a regular SMT2.
So, that was the waited behavior.

So, here's this:
Tested-by: Kayra Cizmeci <kayracizmeci@gmail.com>

Annnddddddddddddddddddddddddddddddd....

This: 
Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>

Thanks,
Kayra :-)







