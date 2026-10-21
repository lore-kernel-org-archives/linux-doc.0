Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616361;
	b=pO4PXf9rlDY1/pmAfT+W2lJrmh28v2tq9uBjeGQasRHbHX2QGHflGBzPNiSRGwmfuot9
	 IwEEEwahCV+ffHdglRDFeuQkbpBdPofGXW8e8aNPNg6MzvmftLdDh4A+QbJ0vYsA4jPSv
	 9LDc9swiHfRYJDHWi+FtGtXZc03csXsB0EtlYePoYsA36UNr53fyRGEfBA5y3G+lrkeJd
	 Rdgn7fSH/J/2pEjzjlNHy9cesrZsUx69f5N6DwQDXWtgnauJbujrVsnE+EXoRGtDZCLpD
	 oKirUw+mK2vlppSqVkU0w3KVjZsjcYad2JbbwUxv2onEUP9cE0NOHT9dxVjKITak3JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=sc3hIjuqm2HqdSWjRIWRDLuVUuAq4OcILp/mjVvlhDk=;
	b=pgOoUu946RUcY30grs/UJcK8Fn+jLfaPpO/tlL1kocqtZYZOMGU0PyFje5LFGb3nq8EG
	 jn0l9jaAMyKsJ+FUO7tEK3j4GQGVp2q0CLTRq5GL5FiyoFmwHIC29tlPLKUU7adm7Emc4
	 RhHh/qdhCrhYh/3LnLPDrlyM8qZNKuB9yzjQvmJSVmwRaijVnHu5Q55bLqPl9Azjh09Ol
	 +2K/3qLupr4eCv+9kVhQeH8jrx7FaO+ZH1EDxKujmbKdtslkrGVyUZ7cBipBviy/PhFCc
	 +zXXsLDLiffJECbmV77wo+mr6CXhsFz9XuRYSM1x4Nv189NAYO7LwbDk5RtXOojY8lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nhuhuan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ZMNsh3Jh;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B86606A32A
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 20:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91B86606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nhuhuan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ZMNsh3Jh
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c3c370b17so1839722eec.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 13:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792616358; x=1793221158; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sc3hIjuqm2HqdSWjRIWRDLuVUuAq4OcILp/mjVvlhDk=;
        b=ZMNsh3JhlJhhgQmcGS+0lnv4PQ1jkXPwj/Swdqa5ZVbur6eSeM3Fa8DjhDGsrQASA9
         9thPSUOrzIJiFKz8HmF36RGFQfzfjXxadMsGq8wo4+TCNxiib64SG2G6HqHbWOpVjLAS
         EsYouMOnfhfHiQGbZ65Q7zFHBKhHyvGA4LiGHuACdF1/D0hwrdeBt4EZqImdHIQuer8W
         3eZfDmFhEaAoiEe0vD3o2frHLu1Bh+MwtXLR2sbNmu5cntokFsetboebwJZVWMtI65AZ
         /xtfEoB7lBErngBGxt7g3ScYFih1k75BH/8Q26w9DM1IJPr3K/ZsJG6uaqoKkllZ87S+
         yxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616358; x=1793221158;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sc3hIjuqm2HqdSWjRIWRDLuVUuAq4OcILp/mjVvlhDk=;
        b=akpz9QZ/NXWF+TQSCQ/pV3JlhpGpfEEaV1p6wX1tUan//PtkfD/2N6lYNwgf1f1FOE
         kvCHBMPp4YAcA66cGNN3quzy+K1BirjsWaqcuw7/0u8gRAc26Y3KMCIv+he80CSnBnZ5
         RGujqHql/GKixV8Ma5oK7RnImL9bPOG+67v8+QqZdJBIMD0iRX7WIFJee2L3eZbh/z4r
         jLs6PhJOzzl7oaQoz17M9lcE435BqiTI61YTdoIEl+1Be2zL8ThhI6uRZ8DfM/q1Hmpd
         KUaHIGtyNDD246Y6RAmq3u6DmOQDebDScnSPSsn7dyBGA10oCeDPbXXNeg0xSr1U5ClP
         naaQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6x10MR5LPnfZ7zFtzyvl4/GGtdL2GOEx0hodZHHlqTikBnNooTIyt3pMxv3POEUDltvgYo6bqdQU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfpz5uWL7AqdBSW+Z0dfIN7qVAyTAC94iXoSxFKjlfwh5L1Ra5
	JNBTCvbdXfBG/gA+WI5vIHhZjswTeLIlsIo74O9/JW8nZsC/drqqzaGRjfsSJCedNWy685i6ibJ
	U+R0kesi0pA==
X-Received: from dlbdx6.prod.google.com ([2002:a05:7022:e06:b0:16c:bd18:1ee2])
 (user=nhuhuan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:a8b:b0:143:72b1:9004
 with SMTP id a92af1059eb24-190a87a3b70mr4075424c88.45.1792616357026; Wed, 21
 Oct 2026 13:59:17 -0700 (PDT)
Date: Wed, 21 Oct 2026 13:59:16 -0700
In-Reply-To: <7e998cd5-57e0-432b-a8e0-676a5b773436@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <7e998cd5-57e0-432b-a8e0-676a5b773436@kernel.org>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021205916.584370-1-nhuhuan@google.com>
Subject: Re: Path forward for Virtualized Swap?
From: Huan Nguyen <nhuhuan@google.com>
To: david@kernel.org
Cc: akpm@linux-foundation.org, axelrasmussen@google.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, cgroups@vger.kernel.org, 
	chengming.zhou@linux.dev, chrisl@kernel.org, corbet@lwn.net, 
	gourry@gourry.net, hannes@cmpxchg.org, haowenchao22@gmail.com, 
	hughd@google.com, joshua.hahnjy@gmail.com, kernel-team@meta.com, 
	kunwu.chan@linux.dev, liam@infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org, 
	mhocko@kernel.org, mkoutny@suse.com, muchun.song@linux.dev, nphamcs@gmail.com, 
	qi.zheng@linux.dev, riel@surriel.com, roman.gushchin@linux.dev, 
	rppt@kernel.org, ryncsn@gmail.com, shakeel.butt@linux.dev, 
	shikemeng@huaweicloud.com, skhan@linuxfoundation.org, surenb@google.com, 
	tj@kernel.org, vbabka@kernel.org, weixugc@google.com, yosry@kernel.org, 
	youngjun.park@lge.com, yuanchu@google.com
Content-Type: text/plain; charset="UTF-8"

Hi David,

I'd like to join this discussion as well.
Could you please loop me in on the meeting invite?

Best,
Huan
