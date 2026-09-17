Received: from mail-pj2-f26.google.com (mail-pj2-f26.google.com [74.125.227.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B312536AB46
	for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 01:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789610172; cv=none; b=GHYOfWoqaN/tf8Z7pmUimHB99v2Nvtop+Y1qBiujzMOe6GK8VEjLIrY8fptAjxG6pOu8y8nxxmoYY4IzYc0YW16YoLlSK8PWsd2yEEUjQA9Wo2dXv5b6UDWsEgx0ef0tBD+jIMERrXHyv9UodbhLHGj7m3Trfg/jUdFPc0AQECw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789610172; c=relaxed/simple;
	bh=JhlR2Z9hLGie4ycveHEZlcET4EHYzNNuAFgR0tLVmRY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=pTAOya8UY3qkLso2fH+MuwEjtH08q+LFj780jiV4ZRiFAbhvDjCbxY+r+/mo/FeVYIanOZ35/Z0L4cc3404ZfiELIih2sgU18AcnwnoGLhjKK02IeLzua99DRMY6+nLA5fx3vNzPQFKRVgGrI83WM+RoZLR35tCyWIFWR/PpwKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CsNk4cUx; arc=none smtp.client-ip=74.125.227.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CsNk4cUx"
Received: by mail-pj2-f26.google.com with SMTP id d9443c01a7336-2d8fb334e72so3084455ad.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 18:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789610171; x=1790214971; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y6mHUY7GH1xqP69TULjoYeDvGxc3p4dOZNNxR4X6kDY=;
        b=CsNk4cUxoqozPRUcv9DHLNTMt7IX4BDeN09A6P1DxP6vnOCGTIE3WX8x3PZkh28oEM
         SFbw7CTt9CiXEfGfaJQpeKVM3KtpuIymEMI8pVK1MhhFmB6QSPoE19feBb8xKdAcxEXK
         XzY5P3aaGDYGfR2VEQ063K8SyvSqg470/peKrxlvspUK/dpgXNk3n4hgDXbJxCE1oy0d
         BWH6bO0C085xZqBm00GOXE8g64rI8WePtGp6uqu+qB/I7nvmtBl8Mit+q9CmJ2f7CuyY
         PDvAHCWMwj63oLHukFAXRMMBtNPv3KwMFjy/C85aLVpZ4p1eXXcjcT7pnbHkpWofKwQO
         pr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789610171; x=1790214971;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6mHUY7GH1xqP69TULjoYeDvGxc3p4dOZNNxR4X6kDY=;
        b=wIu406BVrxsYYgTbKsFHSIBKkMmzkzRVGEyKWC/o8BJe37p5CzgkNbxDu3Y5+uihZn
         I+76erBT5Am8cJeMSnma6FQrcav6f+1N+SH708ABX5EDbYeC/UPZSCsXxPWn1xKGQUiZ
         7LWBxkGvS3k8+W0UDGVRncgAq0UEmO73gTVY56Cd6xILsU/FZ/fQIIVz0TRlIo5lOLu9
         jZenRdartRrpmod5WWjlyVpX1hFZEqrIc2WsAaS41fFFZYluwRgEYNKus6cCJaxkFjbN
         yB8fFt11oq2THiAK5PZQhxCemxHq7j4JB1JWHiCe9udZB+9qtI1D2k4lrIQyGhq6ZyDu
         ZbTA==
X-Forwarded-Encrypted: i=1; AKwUvBxpv/9FDMbhdWydvq4tvR9JqB5PAMDLKRXqHI3MFbhKDB8n3PH5TB4g0AxS6NT4aXclcNpv1Mx6ouM=@vger.kernel.org
X-Gm-Message-State: AFuF++lJECQRE7KxgaOroZ8KcEwfd+G/vVeF0mDUpzAgkc1v/0NCtl1k
	XicyIkW8CjDCAYS56h/qbNXhxxHlgEQlPs8u4bW36Nwu5ml0qC0YnVmh
X-Gm-Gg: AYBFou1YvRiDhwVbPzbIM+oWIt+rVXBYx1yshoXPLex4rD/n86ZPD80pZcWGzVPfzt5
	SlP9q52Eq/P99iWS/9NU1rPamVvbGpKh5jakZre+g69ykjVbfKFGIQzGDs3lNIvTc2cLp1N7hOa
	EMrEUBVDHC3FFa4ndzwM3UtQWacuHU6YRgzku1LjMuaxjZcWd/mC6WTwu8qUxbH+UhWYAPbzcb3
	1IzHHJnLbeCfJTtQtv2bh19B9yQJjBmT4k/hVbEYGsWGYj/jmw4Qi7Sz+8BwUCuc5vq9KWFYla7
	KRNVx2BpeAUFzW79uRMBNQR1gbLJhW7nPEcjmJgyjx+UujcVlaSeM2s+0OsLqCb4VD8ONLgSIEK
	yGOpDcgRZ4Gzw7aZBs9+IlQDZLHRM1LGqNqF36E6eHCwhqO6ntL0AGWPPmIOhlNsH3rTX6ns1SP
	8LpglMdgRrwmoqQ75qGKzuIIZRmW5VDL1I0WU2Y+vIVMt/TWyyfQhrKZcEA4CShMgNdQRdFKxZx
	XIfgMsAfDqnNu7uAHU866eqARL8lSnwciYnCEe1/VLbi6kN4oPOd7ubXNlc8hez3mM8ZCRWDfXi
	W7hN
X-Received: by 2002:a17:90b:2c88:b0:39e:26a7:7aca with SMTP id 98e67ed59e1d1-39e26a77cefmr12456976a91.23.1789610170800;
        Wed, 16 Sep 2026 18:56:10 -0700 (PDT)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e390c2984sm387496a91.0.2026.09.16.18.56.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 18:56:10 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 01:56:09 +0000
Message-Id: <DLH7UY9PDSQP.2AXEGNH838JS0@gmail.com>
Cc: <yonghong.song@linux.dev>, <catalin.marinas@arm.com>, <will@kernel.org>,
 <x86@kernel.org>, <dave.hansen@linux.intel.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <abuehaze@amazon.com>, <doebel@amazon.de>,
 <jay.wang.upstream@gmail.com>
Subject: Re: [PATCH bpf-next 1/1] bpf: btf: add btf=off boot parameter to
 disable and free vmlinux BTF
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jay Wang" <wanjay@amazon.com>, <bpf@vger.kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>
In-Reply-To: <20260917000201.25581-2-wanjay@amazon.com>
References: <20260917000201.25581-1-wanjay@amazon.com> <20260917000201.25581-2-wanjay@amazon.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, Sep 17, 2026 at 12:02 AM Jay Wang <wanjay@amazon.com> wrote:
>
> Add a "btf=off" early boot parameter, similar to the existing "selinux=0"
> parameter, so users who do not want BTF can turn it off at boot; the
> section is then freed to save memory.

tbh I'm not excited about btf=off. BTF is not debug info anymore.
sched_ext, bpf-lsm (systemd uses it), hid-bpf, most of bcc/bpftrace
quietly stop working, and we'll be the ones triaging "libbpf: failed
to find valid kernel BTF" reports from people who copy-pasted a
"save 5MB" tuning guide.
This needs more thought.

>  .../admin-guide/kernel-parameters.txt         |  14 +++
>  arch/arm64/mm/mmu.c                           | 108 +++++++++++++++++-
>  arch/x86/mm/init_64.c                         |  30 +++++
>  arch/x86/mm/pat/set_memory.c                  |  28 ++++-
>  include/linux/btf.h                           |   9 ++
>  kernel/bpf/btf.c                              |  51 ++++++++-
>  kernel/bpf/sysfs_btf.c 
                       |   7 ++
>  kernel/bpf/verifier.c                         |   2 +-

This doesn't apply to bpf-next.
Consider using Alan's approach and support CONFIG_DEBUG_INFO_BTF=m

pw-bot: cr
