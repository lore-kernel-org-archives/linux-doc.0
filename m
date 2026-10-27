Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101378;
	b=sJfOJtEyaHW2iz4X215UQbZYuPgwttJRCSxuCuCbf8YecvN+WT+8T4hOvUR1SWQCqbGP
	 X3wyxZRDTh+zmYFh+S7k4tkWSPA/bMHSy+rV/Hr9b8KacSLpQHoFiXyoLEda2nPOGosTI
	 rwk7jct4/SW650qohOL06EeX1uRaKd8iZf8Z8twuzYcUa8MqIT9k5mIzfZmJunn3FOT0w
	 PfRHCGAl9tprPjDuKLN6jcnf6YdYaiH0abdZHJdw/UHDWZVAKn/QNcRZJCmKijRqIYm6v
	 no0SxTyQ75fS9jc0CLc/Fu/D/X8CTfNhrqxwisQpR/IWpJv4LrAbFmTfaR/W7pMFnOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=IFKYyZe98olIOt/z7FVjqJN0LXwahHsaIWrhXMheXUY=;
	b=uA0F7nHKTnaHaJIgEwmQvjGsnq3qQizW3uJcWKLtH1wkNlDBB/tQOlX04/7wPQ650L8i
	 H3zKhFGYBx2SzpWihPlgkwmSyaljgS3FKijZC5vqitb4CeLpdHcjC5lN9Pc5f193H848+
	 QpSi+SWGJNTZIPan/Q06wXnTczRmFzw2tIOUfRolWEnna/VcQz9HLTBIz3cNvi9yJ++QY
	 Kn3Q/xp84Q5KKwY9TfodUt0TMRqXdcr0NKk4BovUG+++Q95fD6p3ACXfZo+otGkRjsCid
	 OSEwULFvehG9m491N/frzZ519NwuylVMvA18jhpbRgNEXVCZtqWbAHlYJM0loq7wIYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ELiSdUOH;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0E8606A31F
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 11:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA0E8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ELiSdUOH
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso1214833a12.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 04:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793101377; x=1793706177; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IFKYyZe98olIOt/z7FVjqJN0LXwahHsaIWrhXMheXUY=;
        b=ELiSdUOH/cIJPyFJHbgZeLUlxA1ZsPoFOAPtjqLzx/rzQ9JO7MiO1l1EylHRSz9ezg
         ictUVQ2uhhQ2pYHxEdBrFH5HIDKQqTiAHMzqlnq5QD5CgC6J+EP2q6pJpZRC73jUwRhD
         ylqMz+7fKAuQWhpAwt6wJQNE9JgQDJ+tXRAss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101377; x=1793706177;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IFKYyZe98olIOt/z7FVjqJN0LXwahHsaIWrhXMheXUY=;
        b=h/Zt9eJdnVv2nF44FaDNCFu8Yi9b0HIUE+Zkceh20GMq9o73TRHmGG/4dja22tupdo
         wztX/2SDA3lzAefAVjTKrDTv7mAMMahBiT0LmILhXOsj7/qyOO2EjYxRoBsmD31DUXzA
         sjGjX6sLbhBXyHYrW8+0u5SGQhu0Gd+Q+fAkMaPtsz0Xw+MduCXvUTWDNbS8yRtFYS8E
         P6pRVPhPCHSRAVKx38C181y6uOfpayXbUiG0yTqiVCYESXJSJnUJf2Pm8+rzkOSddlAW
         2crFJ4NBoeQxdkSgkR5OGyAKPSV1DXXCrFoc8Udw8I/LvW/eaq7Z5KQP/5EmLmA9/356
         cBxg==
X-Forwarded-Encrypted: i=1; AKwUvBz8oGmgl5pHfl+jwyrNDFkwIwEfMXBVlytnW2jb9w54oRfNX9P/ltMHtOkMsQI147x5fy0oqaq8LtE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiNWHinwm1wx7+SqaFAxf/FF8EdwLbvdgYcIrJFO8lNv/PWqEz
	Cn7/xtXCMGYVV0+NwUr47g54l4WRNf6LLMjKMgs1AhUdGqPK20c82smp2Kb6PWAfq1A=
X-Gm-Gg: AYBFou27dvT1g8tob33qSTZAZSyFzIA4zCoZbhEL4amVnd7cxNvd8Frrs/AcCr17gjU
	nEsTO/4sRYI3FAkMDlXZbTCJxrlzwZvvREnKeNIzBj6p1YsheZ8llzuJBQFcWzkKFQZ9ldLA7Jc
	cu5z0tiX27Gn582nLT16Dc6MhWxR/m/AOq8+q1LYgkfi+asdZv0XP0kPKuUrJyAXVqsgMaCQNAO
	9l9XF1ue0NNpyBOK/SKiAVGFyzcvUmu74Dbsq+TWR05lSKJA69+opsFa8B6/TMl3uNlGmLYrE8+
	iJ+yFDOb7qFJ3qQbpniyCi+OQr1ZVcRC7Zcv1SynqbxnpHQqAwybguzAcTU4jF/C/iZhAQssmqm
	Sn+sf/iKXtvLe4IqITedOxMUEcUP4Csh7Gh8bQf20tfasWvohc1zfrGC6P99mC16BPMOL7vgZYp
	+MNlYxDJHPat8Z8kk4HxhP1+NDq6XkQ0ZV24tI3wJo2Q5JVYSjkTZ6JhpBg0XKTrkY4LV16s5Zy
	XvE0zUae43dF0CkKanCOz07bCEw6xj+rdjaBn3dnwuuJyg3W+cFcxcNgaz6qO9fVbMa1bfNJ9TO
	9zVO78l0pYJYQ+MO6aQ8tSJq1b7l49rwuOh/XTWee3Frd8WUVylWLECtJmaRBWuEVxmVgj/jHWr
	P1OvZzrVG5ym+mlzO/4mW3IVIkmBsXvTpKT9hI8xY3RJfjB1STMuLHLRq9NVhX5qQcd8DTguY
X-Received: by 2002:a17:90a:d888:b0:3ac:80dc:f419 with SMTP id 98e67ed59e1d1-3adeae7309cmr8343178a91.25.1793101377141;
        Tue, 27 Oct 2026 04:42:57 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404426c2sm3637757a91.7.2026.10.27.04.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:42:56 -0700 (PDT)
Date: Tue, 27 Oct 2026 19:42:54 +0800
From: Chris Down <chris@chrisdown.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@kernel.org>, Kees Cook <kees@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>, Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH 0/3] mseal sysmap: Choose system mapping sealing at boot
Message-ID: <cover.1793094611.git.chris@chrisdown.name>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

System mapping sealing is currently a build time choice. Hosts which
want it and hosts which need to move or unmap these mappings therefore
need separate kernels, which is not ideal. Let's allow the administrator
to choose at boot time.

Chris Down (3):
  mseal sysmap: Add mseal_system_mappings= boot parameter
  mseal sysmap: Allow with CHECKPOINT_RESTORE, default off
  selftests/mseal_system_mappings: Test vdso unmap and remap

 .../admin-guide/kernel-parameters.txt         |   7 +
 Documentation/userspace-api/mseal.rst         |   5 +-
 include/linux/mm.h                            |   3 +-
 mm/mseal.c                                    |  13 +
 security/Kconfig                              |  17 +-
 .../selftests/mseal_system_mappings/Makefile  |   2 +
 .../selftests/mseal_system_mappings/config    |   2 +
 .../mseal_system_mappings/sysmap_is_sealed.c  | 236 ++++++++++++++++--
 8 files changed, 268 insertions(+), 17 deletions(-)


base-commit: bae9a042b03b27924c6fd5bdc00a20d6a44d6041
-- 
2.54.0

