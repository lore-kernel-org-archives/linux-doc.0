Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3370B2D1F69
	for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 07:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758267451; cv=none; b=OI+2OXZPjtG2eOkbWtq00VeGmVtntJrYuKAbXnObdb31Xy6Ue5RKgwHZ1AE/G3e4fMsb5HYkX5l4mYJVMGkqwthdwBVsvZG1Z7U/cCCdUuTOp7Fp5jd11DbA+owqU0kYVx9v4iV/f0qxC2paojFA3Bl3gR/QdSd59uRXce6Da6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758267451; c=relaxed/simple;
	bh=v3TxNmA0pt+Qtmfll9ALOjz7DGAewRAEWKdgH99GYDA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qNvqkfU7An7W3JOAWG+J6APtTXdB0AmY3TMVth5pYSP3Jt/m+Xhk3McSfuD2ZXaTSc0pgHb8MW4ve8Jp25EjCdMY0/kNZMlApeJeUcsNwrheJKAFXPEYZci/tdctfXXuixEozYyzT3kuifVrnvEI1Ye9LDfMmRn2fLKcexmi/JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Q5Gux1KW; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Q5Gux1KW"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-77ccb67f8e5so2072238b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 00:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758267449; x=1758872249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nQi8kkf+E11TPqHviak6Q179Pwf94vhIPRCTAWlGN3c=;
        b=Q5Gux1KW7SwDslGyoFa7nd+K6JD3SQE52hUrRe3t23xylhZS72lTewgKtnLKDQuV+q
         M8/27673o9LgfZREIB1LbcGdicp+9gmk4rn29a70ERVOq8hiveN3wglytXZOndSEBAhZ
         oiVQ0S0X2qpDdS2ouLMD/dQ+4sy2km1v6DiY3DslT7mi7Y0D8THVqo5btMfkuDK5EVOp
         W1UwadLyDyQUVWGMsBahMvJ4ZDdbwkF0EwzPbMHePOFWe984ME4Cj6EllH2SaVduxoSy
         RDe6sV8KbkUo5s7pNzGTqHQ/eosWJr4jGrVBmMxPrKLWsZjiMVOiAM8xv/IRaHmcVeJu
         jG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267449; x=1758872249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQi8kkf+E11TPqHviak6Q179Pwf94vhIPRCTAWlGN3c=;
        b=t4jiAMjNRhh8jnNGIqWYcS4MyaLAw6XHFGCEQQJGOrhpAmvxhHD3ugNkL4nz3wz8kd
         f2e616rWJ7I+sVPZp/vgjOAbkpP6sxEEAs51ei87okHdnuZf4/BZ7amxrOs9mgTw9HRj
         oJ+W8bcKXkIWBbwtCQFR9efz5FHYYs5al3zIn1s7lR1hhWUziRtWZDv3g3emqpQOvwLv
         ziFOZTbu0qUmQ0GN2gQtwG/hXpjBxJ3VDrTLi59DqhlpKESXNxzimVA3YFxVqQsVZkbc
         dcekrvv/Gi/9adfvkunNGLB9EMdt0DkTqBLtkVUwdQ48W9gEWF/UaeIzZ8MNMGeQrVCW
         aXYQ==
X-Forwarded-Encrypted: i=1; AJvYcCViXRLFjNflXcxrEY5Tgu9xLgrsKFETNHe3dy+VfUJY8SUEEdXlVCmQbsG7RCoxJoCqAnfxxwFSUbU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyjLwAetrldYz12tfOu1uQHh+QmPh2w1O5nYaGZZSYTD1rHAnj
	0zgGDrnW/Bk+nBQTtFeXWV42Kqh8CPoihlo+CLcBOyQNBB663HjdgR6Np3cg1jF9sy0=
X-Gm-Gg: ASbGncum60acy/m1yZ4mnbEB0YiKaLQCM0o1YbRzAgdyeZZBgVOL6RyeyzzG5zMuh8A
	U4agmwECHGRk5bzJgAVRL8Dm/xmhYTOvvrMuPNTx3W7MJI440YhlBk4SVJPuMKyctlMIFE539Ni
	NwwLeB/poC7lf4M1bavP3jRWxboZwGa7VPxjFXz/+HFDS9SilTQ5MSrcYksUVFREGITaFXnZ7lN
	IlLNGGBAN2OJkb6kEcidKcDWn0+B35M6qalJF4opgk0NCpPFhVTcq4tISJ9kTgSeqcugpvaJlRC
	rmP9Nzl3Ib4Yt2qJxkHmuPmNGw1eax2M/roIIThKXszWyeYhrjMOmXkQXId0sZE7sYDJRMAfc6D
	SzKYc+1a10RpQPhEAehmDyiQkbb1Iandi0VqtijmObfbN5cWzIhrOY2UZWNdFfoe6vYIMGaZrXH
	GU9sCQkS9K9KvxRxIf4BJJI+hcY223Oapqq6/KRi2B9/jMSIIgBMi4
X-Google-Smtp-Source: AGHT+IGt4SFGJptpZ0jrCH0JCo7jlSYHb5iMvq47K6wOnBUV4fZAO0y+jOsnj2fzSLzf3+aWmVng0g==
X-Received: by 2002:a05:6a21:3294:b0:263:7cc6:1c3b with SMTP id adf61e73a8af0-29277cb8e9amr3774594637.60.1758267449202;
        Fri, 19 Sep 2025 00:37:29 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b550fd7ebc7sm2679096a12.19.2025.09.19.00.37.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Sep 2025 00:37:28 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v3 0/8] riscv: Add Zalasr ISA extension support
Date: Fri, 19 Sep 2025 15:37:06 +0800
Message-ID: <20250919073714.83063-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds support for the Zalasr ISA extension, which supplies the
real load acquire/store release instructions.

The specification can be found here:
https://github.com/riscv/riscv-zalasr/blob/main/chapter2.adoc

This patch seires has been tested with ltp on Qemu with Brensan's zalasr
support patch[1].

Some false positive spacing error happens during patch checking. Thus I
CCed maintainers of checkpatch.pl as well.

[1] https://lore.kernel.org/all/CAGPSXwJEdtqW=nx71oufZp64nK6tK=0rytVEcz4F-gfvCOXk2w@mail.gmail.com/

v3:
 - Apply acquire/release semantics to arch_xchg/arch_cmpxchg operations
 so as to ensure FENCE.TSO ordering between operations which precede the
 UNLOCK+LOCK sequence and operations which follow the sequence. Thanks
 to Andrea.
 - Support hwprobe of Zalasr.
 - Allow Zalasr extensions for Guest/VM.

v2:
 - Adjust the order of Zalasr and Zalrsc in dt-bindings. Thanks to
 Conor.

Xu Lu (8):
  riscv: add ISA extension parsing for Zalasr
  dt-bindings: riscv: Add Zalasr ISA extension description
  riscv: hwprobe: Export Zalasr extension
  riscv: Introduce Zalasr instructions
  riscv: Use Zalasr for smp_load_acquire/smp_store_release
  riscv: Apply acquire/release semantics to arch_xchg/arch_cmpxchg
    operations
  RISC-V: KVM: Allow Zalasr extensions for Guest/VM
  KVM: riscv: selftests: Add Zalasr extensions to get-reg-list test

 Documentation/arch/riscv/hwprobe.rst          |   5 +-
 .../devicetree/bindings/riscv/extensions.yaml |   5 +
 arch/riscv/include/asm/atomic.h               |   6 -
 arch/riscv/include/asm/barrier.h              |  91 ++++++++++--
 arch/riscv/include/asm/cmpxchg.h              | 136 ++++++++----------
 arch/riscv/include/asm/hwcap.h                |   1 +
 arch/riscv/include/asm/insn-def.h             |  79 ++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h         |   1 +
 arch/riscv/include/uapi/asm/kvm.h             |   1 +
 arch/riscv/kernel/cpufeature.c                |   1 +
 arch/riscv/kernel/sys_hwprobe.c               |   1 +
 arch/riscv/kvm/vcpu_onereg.c                  |   2 +
 .../selftests/kvm/riscv/get-reg-list.c        |   4 +
 13 files changed, 242 insertions(+), 91 deletions(-)

-- 
2.20.1

