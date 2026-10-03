Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC32B345EA8
	for <linux-doc@vger.kernel.org>; Sat,  3 Oct 2026 22:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791067204; cv=none; b=QYtNwKY5YvguKfNgPzSYYbvFlosXAdsUpj4SfX4nEKi6xxJnB/0d91LRxXJeCW7Wz3eiFC9Zn3U8dF8cpqRqOuMqLDJZZ1kVlq920bAz2K47vCKHjgYr8Hc0CBSV/ntKAD4Bo8EpZe+rh57ytSLUoy7YPrEvmuTgUyahFjyfZrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791067204; c=relaxed/simple;
	bh=t988az+IkSXq3gTpP/ixKIAHAGj79xMTyDNMRKS3/fg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BOzQYUnNFns0woOjXUHY367sqHzMGKhprDVbiNXosnIm5UKm8o2di7Nw/frbgXNG7Kb7qKN2TlCy3BvNUnC2TQM9jGvp9phd0366AerKESkCYTGxQYL2MBOnt8tJmxQ5bH2s/S86sVYwCCAZn8GzUONnyLwOqdTWOOF4VNHP6EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VAmqYGRm; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAmqYGRm"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2d9fdf798so1949145ad.0
        for <linux-doc@vger.kernel.org>; Sat, 03 Oct 2026 15:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791067203; x=1791672003; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n/oIu14jUGCFAHwNtKrIHGbo5GeSCHJZDG7wMHq45NE=;
        b=VAmqYGRmqqhtjpDWL7m1hwONxrM4QRr/xNPEcb3VkhR1x8T6pTJ7+Jg442kV+UW/IR
         XSLR9dXHVPZ5NdvLYwF03LvChP06O3Jz6bhQAYg86+tOjnAPXTWuNdxaYM2RmKOaTSf/
         dYsOxkh8Qu9eLmwyrFir5drhmVol/l11N8hHwUltIpYiQW0omFPS00D12xdrGY0sAx3O
         O9zb5A/HnH3Em4HwbPeXBSBnucLzp2+hZkSuxfhSJQp8BWDfa2fXvRm+LNX0LTpnZMFp
         6Xl14BZ3oRqiPnN7aTdRsMFiEyiAuXSdCwYmT6w9uLAOj8t/GZSK9XhZA4E66Y/uC/xJ
         hAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791067203; x=1791672003;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n/oIu14jUGCFAHwNtKrIHGbo5GeSCHJZDG7wMHq45NE=;
        b=GI8rIzHyT/ytZBK3h/NJrzZom93QrSlL/fGZoF3ZeeI8B/myW5mvfr1re8HgJ/L5RK
         touSEjU2GdZyghb2wplLklRkOB2ZBbcgjlRAoUW752FsZ8o0RO41MgQwI9Gc5xrTe/Ep
         DSl6MKkgJbvrc54ub/4ZLqQhCWCs3v6JZVheHha0PP/1hf+Jdp36N3cRxVaHOhj8+HLk
         R5K1tEpY3Q9c/Ssm2+d16rYdOWr4ZA7cRCn7B4EpIyH8GnvWqTLtRzkQ05Ef9zTUQdme
         FPCE7m5jiLXyOe+tovGk1dav9XFPL1Jb1QLRkK7NjClbScznA+HNm4/bDlEHiPolFgOR
         nUHQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1YdkQfyJY9ZOrJ/S6yohDRbSeV30gBXIr1F2UbkN6klHm1TWWW0+Q9Rrb9DbZNcq7vi4edwQwps4=@vger.kernel.org
X-Gm-Message-State: AFuF++ksYuBoUcTZlPVeXG2sJZrFo0PX9GWlWJu2eLdNy6PXtms4tgNI
	0SpxQr1XtvWirYnIP2bAxKF899CIGycbcmafg09dpmiNkXMwpQW+ojiw
X-Gm-Gg: AYBFou1aiUhesKhos4eCK4I7ZSrlIjOo0jHghJ18p1ZNxD8VCUhuauept6AQnjCg5aK
	xrWXlB5s3/4T1WcIqToqN6kHX4JAHjB7d3gggOJxMRmhejkRhTAJk9CsplJtifYbF+EbZLPkHtL
	Ps2cSR52AJGgyDF9Ik/rUGByYq3ZZ1JpPDPfGsaf9eE5ZYyttIQ6zQ4qObEnLLiS1QgRVo3RKZK
	HXo2xXLVUgYgjtH5tTJg3IIec57I6/hM2TxV9vO4uVjaHuJxZNaTEF9U0frtLv6s+q1RHhk5+rl
	vsNsLdieLK1/9ywKihQoGwfaiRZbRaiTQEA31CwOp5YOHGj1gI6xInqtuLCYhn1v6Py2Mah9gNn
	llu0G7pxGNiB+ImsdUQKRwoDjlYV4xeHt4kYNYePKLpshbxzvsQRd10UwRVpJPxaM5G7gyqJkWg
	TO6ESVIXOrfekdiobUKkP6Qcn73T+xOeoePLzLRMZ7g1vSKFAc3oz6fzHJtINwP1G7Ct9zt/Sds
	a/kzlUWuJRll6FprhbIoyo/Op8LKm1aAKUbs9TKIv2ht1KiHdF9bQy6LjO9dMCFOK/1lzoUfw4f
	WzcMXtzW/qU7qSzn5eqNSAF9Sinhafqi6kdp/BA2Vu71X2sGMT6hg0MXcfG0ediNt1YqsUx25SA
	Upl1FgDBWGKE=
X-Received: by 2002:a17:902:d506:b0:2df:84e0:9034 with SMTP id d9443c01a7336-2e49a7cdc18mr57178595ad.7.1791067203022;
        Sat, 03 Oct 2026 15:40:03 -0700 (PDT)
Received: from mars.local.gmail.com (221x241x217x81.ap221.ftth.ucom.ne.jp. [221.241.217.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f7339desm19297455ad.81.2026.10.03.15.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 15:40:02 -0700 (PDT)
Date: Sun, 04 Oct 2026 07:39:57 +0900
Message-ID: <m2qzi62yte.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: david@kernel.org
Cc: ljs@kernel.org,
	geert@linux-m68k.org,
	johannes@sipsolutions.net,
	linux-mm@kvack.org,
	liam@infradead.org,
	rbm@suse.com,
	akpm@linux-foundation.org,
	luto@amacapital.net,
	brendan.jackman@linux.dev,
	liuhangbin@gmail.com,
	corbet@lwn.net,
	kees@kernel.org,
	broonie@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	wad@chromium.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org,
	daniel@thingy.jp
Subject: Re: [PATCH v4 1/2] selftests: run tests on nommu architecture
In-Reply-To: <d6ee0a8f-e7a8-4fa7-88b8-62fb44bfc863@kernel.org>
References: <20260929235711.2287931-1-thehajime@gmail.com>
	<20260929235711.2287931-2-thehajime@gmail.com>
	<bda5eeaa-7868-4d4a-9026-9e99347afd7c@kernel.org>
	<ar4br2vW7yZGd3gt@gremlin>
	<94759bed23f00d2044005e36be6f72f297e092f0.camel@sipsolutions.net>
	<m2se2o3jyc.wl-thehajime@gmail.com>
	<a65f4431-d225-4535-b921-00319ceeb2a2@kernel.org>
	<ar9ldn036SgT-bq1@gremlin>
	<CAMuHMdUKcUxHZKhTEF1gwWrU1o8O6jt6N3r90V5hynrLFdwY0A@mail.gmail.com>
	<ar-bIzYDdlOKUqla@gremlin>
	<d6ee0a8f-e7a8-4fa7-88b8-62fb44bfc863@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII


Hello,

On Fri, 02 Oct 2026 21:21:53 +0900,
David Hildenbrand (Arm) wrote:
> 
> On 10/2/26 13:53, Lorenzo Stoakes (ARM) wrote:
> > On Fri, Oct 02, 2026 at 01:38:31PM +0200, Geert Uytterhoeven wrote:
> > 
> >> On Fri, 2 Oct 2026 at 10:10, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
> > 
> >>> But fork() -> -EINVAL or -ENOSYS = nommu, then just have the child quit and
> >>> etc. should do it.
> >>
> >> fork() is not strictly an MMU-feature (you can implement fork on nommu
> >> if all memory accesses are done relative to a base address register),
> >> while I think mprotect() is an MMU-feature. Unless it can also be used
> >> to change the protection using the one or two BARs most MCU haves?
> >> Anything else that is a real MMU-feature? Non-identity mmap()?
> > 
> > Does any nommu arch implement fork() in linux?
> 
> I was about to say, that sounds a bit too theoretical for me. IIUC that is not
> implemented, and if someone would propose it we would likely just nak it.
> 
> In the unlikely event that this would see the light of day, we could always
> change our detection in the selftests.

thanks all for the inputs and review.

I will try to implement the detection with /proc/meminfo.

-- Hajime

